module DecorateResource
  def self.included(base)
    base.extend ClassMethods
  end

  module ClassMethods
    def decorate_resource
      before_filter :decorate_resource
    end
  end

  protected

  def resource_name
    self.class.name.demodulize.gsub(/Controller/, "").singularize
  end

  def resource_instance_variable_name
    if current_action_type == :member
      "@#{resource_name.constantize.name.underscore}"
    else
      "@#{resource_name.constantize.name.pluralize.underscore}"
    end
  end

  def current_action_type
    if (params.include?(:id) || [:new, :create, :edit, :update, :destroy].include?(params[:action].to_sym)) && !([:index].include? params[:action].to_sym)
      :member
    else
      :collection
    end
  end

  def decorate_resource
    records = instance_variable_get resource_instance_variable_name
    decorated_records = "#{resource_name}Decorator".constantize.decorate records
    instance_variable_set resource_instance_variable_name, decorated_records
  end
end


if defined? ActionController::Base
  ActionController::Base.class_eval do
    include DecorateResource
  end
end
