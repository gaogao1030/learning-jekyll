# jekyll小书学习代码 #
******
1. bundle install
2. bundle exec jekyll server

>**如何调试Jekyll Plugin**
>
>请在代码处加上binging.pry
>
>如下:

```
  module Jekyll
  class VersionTag < Liquid::Tag
    def render(context)
    	binding.pry
      "Jekyll #{Jekyll::VERSION}"
    end
  end
end


Liquid::Template.register_tag('jekyll_version',Jekyll::VersionTag)
```
***
>所有的章节都以分支形式保存
