module OutstandingHelper
  def history_js(id)
    string = '<a href="#"  onclick="$(\'#contact_'
    string += id.to_s
    string += '\').toggle();">history</a>'
    string.html_safe
  end

  def cancel_js(id)
    string = '<a href="#"  onclick="$(\'#new_contact_'
    string += id.to_s
    string += '\').toggle();">cancel</a>'
    string.html_safe
  end
end
