module ApplicationHelper
    def importance_class(post)
      if post.importance == 1
          return "importance-emergency"
      elsif post.importance == 2
          return "importance-high"
      elsif post.importance == 4
          return "importance-work"
      end
      return ""
    end
end
