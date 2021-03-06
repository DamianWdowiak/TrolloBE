module Api
  module V1
    class WorkspacesController < ApplicationController
      before_action :set_workspace, only: %i[show update destroy]

      def index
        render json: current_user.workspaces.to_json, status: :ok
      end

      def show
        render json: @workspace.to_json, status: :ok
      end

      def create
        workspace = current_user.workspaces.new(workspace_params)

        if workspace.save
          render json: workspace.to_json, status: :created
        else
          render json: { errors: workspace.errors.messages }, status: :unprocessable_entity
        end
      end

      def update
        if @workspace.update(workspace_params)
          render json: @workspace.to_json, status: :ok
        else
          render json: { errors: @workspace.errors.messages }, status: :unprocessable_entity
        end
      end

      def destroy
        @workspace.destroy!
        head :no_content
      end

      private

      def workspace_params
        params.require(:data).permit(:name)
      end

      def set_workspace
        @workspace = current_user.workspaces.find(params[:id])
      end
    end
  end
end
