ActionText::ContentHelper.allowed_tags += ["script"]
ActionText::ContentHelper.scrubber = Loofah::Scrubber.new do |node|
  if node.name == "script" && !/^https:\/\/platform.twitter.com/.match?(node.attr("src"))
    node.remove
    Loofah::Scrubber::STOP
  end
end
