module Jekyll
  class ArchivePageTitleTag < Liquid::Tag
    ARCHIVE_PAGE_TYPES = %w(category tag year month day)
    def render(context)
       unless Jekyll.const_defined?('Archives', false)
         return""
       end
       page = context.environments.first['page']
       page_type = page['type']
       unless ARCHIVE_PAGE_TYPES.include? page_type
        return ""
       end
       case page_type
       when 'category'
         "“#{page['title']}”分类的归档"
       when 'tag'
         "“#{page['title']}”标签的归档"
       when 'year'
         page['date'].strftime('%Y年') << '归档'
       when 'month'
         page['date'].strftime('%Y年%-m月') << '归档'
       when 'day'
         page['date'].strftime('%Y年%-m月%-d日') << '归档'
       end
    end
  end
end

Liquid::Template.register_tag('archive_page_title', Jekyll::ArchivePageTitleTag)
