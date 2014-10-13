class DocsController < ApplicationController
  def make
    @data = {
        email: "taro@hoge.com"
    }
    id = params[:id].to_i
    if id > 10
      @data[:name] = "太郎"
    else
      @data[:name] = "花子"
    end

    #render :layout => "pdf_layout", :template => "docs/pdf_tpl"
    pdf = WickedPdf.new.pdf_from_string(
        render_to_string('docs/pdf_tpl', :layout => 'pdf_layout', :encoding => 'UTF-8')
    )

    save_path = Rails.root.join('pdfs', 'test.pdf')
    File.open(save_path, 'wb') do |file|
      file << pdf
    end
  end
end
