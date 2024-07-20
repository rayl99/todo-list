module RenderHelper
  
  def render_collection(data:, serializer:, status: :ok)
    data = data.page(params[:page]|| 1).per(params[:per_page] || 10)
    render json: { data: data }, each_serializer: serializer, meta: pagination_meta(data), status: status
  end

  def render_resource(data:, serializer:, status: :ok)
    render json: { data: serializer.new(data).as_json }, status: status
  end

  def pagination_meta(collection)
    {
      current_page: collection.current_page,
      next_page: collection.next_page,
      prev_page: collection.prev_page,
      total_pages: collection.total_pages,
      total_count: collection.total_count
    }
  end
end