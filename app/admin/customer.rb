ActiveAdmin.register Customer do
  permit_params :full_name, :phone_number, :email_address, :notes, :image

  form do |f|
    f.inputs do
      f.input :full_name, input_html: { style: 'width: 100%; padding: 10px; border-radius: 5px; border: 1px solid #ccc;' },
                          label: "Full Name", label_html: { style: 'font-weight: bold; color: #2c3e50;' }

      f.input :phone_number, input_html: { style: 'width: 100%; padding: 10px; border-radius: 5px; border: 1px solid #ccc;' },
                             label: "Phone Number", label_html: { style: 'font-weight: bold; color: #2c3e50;' }

      f.input :email_address, input_html: { style: 'width: 100%; padding: 10px; border-radius: 5px; border: 1px solid #ccc;' },
                              label: "Email Address", label_html: { style: 'font-weight: bold; color: #2c3e50;' }

      f.input :notes, input_html: { rows: 4, style: 'width: 100%; padding: 10px; border-radius: 5px; border: 1px solid #ccc;' },
                      label_html: { style: 'font-weight: bold; color: #2c3e50;' }

      f.input :image, as: :file, label_html: { style: 'font-weight: bold; color: #2c3e50;' }
    end

    f.actions do
      f.action :submit, button_html: { style: 'background-color: #3498db; color: white; padding: 10px 20px; border-radius: 5px; border: none; font-weight: bold;' }
      f.cancel_link(style: 'margin-left: 10px; color: #888;')
    end
  end

  show do
    attributes_table do
      row("Full Name") { |customer| customer.full_name }
      row("Phone Number") { |customer| customer.phone_number }
      row("Email Address") { |customer| customer.email_address }
      row("Notes") { |customer| customer.notes }

      row("Image") do |customer|
        if customer.image.attached?
          image_tag customer.image, style: 'max-width: 150px; border-radius: 8px; box-shadow: 0 2px 6px rgba(0,0,0,0.1);'
        else
          span "No image uploaded", style: 'color: #888; font-style: italic;'
        end
      end
    end
  end
end
