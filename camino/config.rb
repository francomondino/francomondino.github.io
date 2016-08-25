###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout

class RightScaleCustomMarkdown < Redcarpet::Render::HTML
  def initialize(options={})
    super options.merge(
      :with_toc_data                => true,
    )
  end
  def postprocess(document)

  # We need this renderer to force render of content within our multi-line markdown elements
  # Note this is the same config used in config.rb for the generic middleman renderer
  r = Redcarpet::Markdown.new(self, options = {
    :markdown => true,
    :fenced_code_blocks           => true,
    :no_intra_emphasis            => true,
    :tables                       => true,
    :autolink                     => true,
    :disable_indented_code_blocks => true,
    :quote                        => true,
    :lax_spacing                  => true
  })

  # Render all of our custom markdown elements

  rendered_doc = custom_content_card(rendered_doc, r)
end

def custom_content_card(document, renderer)
  document.gsub(/^\[\[(.*?)\n(.*?)\n([^\n]*?)\]\]/m) do
    resp = "<div class=\"panel panel-default\">
      <div class=\"panel-heading\">
        <div class=\"panel-title\">
        #{$1}
        </div>
      </div>
      <div class=\"panel-body\">#{renderer.render($2)}</div>
      <div class=\"panel-footer\">#{$3}</div>
    </div>"
    resp
  end
end
end

page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false
activate :i18n,:mount_at_root => :it,

                :lang_map      => {
                  :it => '',
                  :en => 'it'


                                  }
I18n.default_locale = :it


# With alternative layout
# page "/path/to/file.html", layout: :otherlayout

# Proxy pages (http://middlemanapp.com/basics/dynamic-pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", locals: {
#  which_fake_page: "Rendering a fake page with a local variable" }

# General configuration

# Reload the browser automatically whenever files change
configure :development do
  activate :livereload
end

set(
  :markdown,
  :fenced_code_blocks           => true,
  :no_intra_emphasis            => true,
  :tables                       => true,
  :autolink                     => true,
  :disable_indented_code_blocks => true,
  :quote                        => true,
  :lax_spacing                  => true,
  :renderer                     => RightScaleCustomMarkdown
)
set :relative_links, true
activate :blog do |blog|
  blog.paginate = true
    blog.page_link = "page/{num}"
    blog.per_page = 1
    blog.layout = "article"
end
###
# Helpers
###

# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     "Helping"
#   end
# end

# Build-specific configuration
configure :build do
  activate :relative_assets
    set :relative_links, true
  # Minify CSS on build
   activate :minify_css

  # Minify Javascript on build
   activate :minify_javascript
end
