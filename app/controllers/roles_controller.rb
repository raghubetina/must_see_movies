class RolesController < ApplicationController
  def index
    @q = Role.ransack(params[:q])
    @roles = @q.result(:distinct => true).includes(:movie, :actor).page(params[:page]).per(10)

    render("roles/index.html.erb")
  end

  def show
    @role = Role.find(params[:id])

    render("roles/show.html.erb")
  end

  def new
    @role = Role.new

    render("roles/new.html.erb")
  end

  def create
    @role = Role.new

    @role.character_name = params[:character_name]
    @role.movie_id = params[:movie_id]
    @role.actor_id = params[:actor_id]

    save_status = @role.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/roles/new", "/create_role"
        redirect_to("/roles")
      else
        redirect_back(:fallback_location => "/", :notice => "Role created successfully.")
      end
    else
      render("roles/new.html.erb")
    end
  end

  def edit
    @role = Role.find(params[:id])

    render("roles/edit.html.erb")
  end

  def update
    @role = Role.find(params[:id])

    @role.character_name = params[:character_name]
    @role.movie_id = params[:movie_id]
    @role.actor_id = params[:actor_id]

    save_status = @role.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/roles/#{@role.id}/edit", "/update_role"
        redirect_to("/roles/#{@role.id}", :notice => "Role updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Role updated successfully.")
      end
    else
      render("roles/edit.html.erb")
    end
  end

  def destroy
    @role = Role.find(params[:id])

    @role.destroy

    if URI(request.referer).path == "/roles/#{@role.id}"
      redirect_to("/", :notice => "Role deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Role deleted.")
    end
  end
end
