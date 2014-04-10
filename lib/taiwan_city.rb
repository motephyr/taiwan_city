# encoding: utf-8
require "taiwan_city/engine"

module TaiwanCity
  TAIWAN = '00000' # 全国
  PATTERN = /(\d{2})(\d{3})/

  class << self
    def list(parent_id = '00000')
      result = []
      return result if parent_id.blank?
      city_id = city(parent_id)
      children = data
      children = children[city_id][:children] if children.has_key?(city_id)
      children.each_key do |id|
        result.push [ children[id][:text], id]
      end

      #sort
      result.sort! {|a, b| a[1] <=> b[1]}
      result
    end

    # @options[:prepend_parent] 是否显示上级区域
    def get(id, options = {})
      return '' if id.blank?
      prepend_parent = options[:prepend_parent] || false
      children = data
      return children[id][:text] if children.has_key?(id)
      city_id = city(id)
      city_text = children[city_id][:text]
      children = children[city_id][:children]
      return "#{prepend_parent ? (city_text) : ''}#{children[id][:text]}"
    end

    def city(code)
      match(code)[1].ljust(5, '0')
    end

    private
    def data
      unless @list
        #{ '440000' =>
        #  {
        #    :text => '广东',
        #    :children =>
        #      {
        #        '440300' =>
        #          {
        #            :text => '深圳',
        #            :children =>
        #              {
        #                '440305' => { :text => '南山' }
        #              }
        #           }
        #       }
        #   }
        # }
        @list = {}
        #@see: http://github.com/RobinQu/LocationSelect-Plugin/raw/master/areas_1.0.json
        json = JSON.parse(File.read("#{Engine.root}/db/areas.json"))
        districts = json.values.flatten
        districts.each do |district|
          id = district['id']
          text = district['text']
          if id.end_with?('000')
            @list[id] =  {:text => text, :children => {}}
          else
            city_id = city(id)
            @list[city_id] = {:text => text, :children => {}} unless @list.has_key?(city_id)
            @list[city_id][:children][id] = {:text => text}
          end
        end
      end
      @list
    end

    def match(code)
      code.match(PATTERN)
    end
  end
end
