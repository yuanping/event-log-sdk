require "active_support/core_ext/string/inflections"

module EventLog
  
  module Restfulable
  
    def self.included(base)
      base.extend ClassMethods
    end
  
    module ClassMethods
    
      def restful_api(name)
        names = name.pluralize
        define_method "#{names}" do |*args|
          opts = args.first || Hash.new
          res = @conn.get("#{names}.json", default_params.merge(opts))
          if res.status == 200
            res.body
          elsif res.status == 401
            '认证失败'
          end
        end
  
        define_method name do |id|
          res = @conn.get("#{names}/#{id}.json", default_params.merge(opts))
          if res.status == 200
            res.body
          elsif res.status == 401
            '认证失败'
          end
        end
  
        define_method "create_#{name}" do |json|
          @conn.post("#{names}.json?token=#{token}", json)
        end
  
        define_method "update_#{name}" do |id, json|
          @conn.put("#{names}/#{id}.json?token=#{token}", json)
        end
  
        define_method "delete_#{name}" do |id|
          @conn.delete("#{names}/#{id}.json", default_params.merge(opts))
        end
      end
    
    end
  end
end