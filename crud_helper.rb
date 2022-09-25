module Helper
  module CrudHelper
    def index
      paginated = paginate(model_class.all)
      render_collection(paginated)
    end

    def show
      render json: serializer.new(get_instance), status: :ok
    end

    def create
      object = model_class.create!(object_params)
      render json: serializer.new(object), status: :ok
    end

    def update
      get_instance.update!(object_params)
      render json: serializer.new(get_instance), status: :ok
    end

    def destroy
      deleted_item = get_instance.destroy!
      render json: serializer.new(deleted_item), status: :ok
    end

    private

    def model_class
      controller_name.classify.constantize
    end

    def get_instance
      model_class.find(params[:id])
    end

    def serializer
      Object.const_get(controller_name.classify + 'Serializer')
    end

    def object_params
      raise 'please implement object_params method in your controller...'
    end
  end
end