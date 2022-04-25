class ContactController < ApiController

  def CreateUsecontacts
    if params[:name].blank?
      render json: { message: "Nome precisa estar presente" }, status: 400
      return
    end
    if params[:relationship].blank?
      render json: { message: "Relação precisa estar presente"  }, status: 400
      return
    end

    contact = Usecontact.new
    contact.name = params[:name]
    contact.relationship = params[:relationship]
    contact.phone = params[:phone]
    contact.contactid = current_user.email

    if contact.save
      render json: { message: "Contato Salvo" }
    else
      render json: { message: "Tente Novamente" }, status: 400
    end
  end

  def findContacts
    contacts = Usecontact.where(contactid: current_user.email)

    if contacts.nil?
      render json: { message: "Nenhuma contato" }
    end

    render json: { content: contacts }

  end

  def deleteContacts
    if params[:id].blank?
      render json: { message: "id precisa está presente" }, status: 400
      return
    end

    contact = Usecontact.where(id: params[:id]).first
    if contact.nil?
      render json: { message: "Contato não encontrado" }, status: 400
      return
    end
    if contact.contactid != current_user.email
      render json: { message: "Esse contato não pode ser excluido" }, status: 400
      return
    end
    if contact.destroy
      render json: { message: "Contato Excluido" }
    else
      render json: { message: "Tente Novamente" }, status: 400
    end
  end

  def updateContacts
    if params[:id].blank?
      render json: { message: "id precisa está presente" }, status: 400
      return
    end
    contact = Usecontact.where(id: params[:id]).first
    
    if contact.nil?
      render json: { message: "Contato não encontrado" }, status: 400
      return
    end

    if contact.contactid != current_user.email
      render json: { message: "Esse contato não pode ser editado" }, status: 400
      return
    end

    contact.email = params[:email] if params[:email].present?
    contact.relationship = params[:relationship] if params[:relationship].present?
    contact.name = params[:name] if params[:name].present?
    contact.phone = params[:phone] if params[:phone].present?

    if contact.save
      render json: { message: "Contato atualizado" }
    else
      render json: { message: "Tente Novamente" }, status: 400
    end
  end
end