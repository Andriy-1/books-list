module ApplicationHelper
	def display_errors(errors, options = {})
	  if errors.any?
		content_tag(:div, errors.join(", "), options)
	  end
	end
  end