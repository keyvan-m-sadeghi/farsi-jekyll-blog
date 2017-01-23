# coding: utf-8

Gem::Specification.new do |spec|
  spec.name                    = "jekyll-theme-woforo"
  spec.version                 = "0.2.3"
  spec.authors                 = ["Keyvan Mir Mohammad Sadeghi"]
  spec.email                   = ["keyvan.m.sadeghi@gmail.com"]

  spec.summary                 = %q{minimal-mistakes optimised for developer blog, RTL enabled}
  spec.homepage                = "https://github.com/woforo/woforo.github.io"
  spec.license                 = "MIT"

  spec.metadata["plugin_type"] = "theme"

  spec.files                   = `git ls-files -z`.split("\x0").select do |f|
    f.match(%r{^(assets|_(includes|layouts|sass)/|(LICENSE|README|CHANGELOG)((\.(txt|md|markdown)|$)))}i)
  end

  spec.add_runtime_dependency "jekyll", "~> 3.3"
  spec.add_runtime_dependency "jekyll-paginate", "~> 1.1"
  spec.add_runtime_dependency "jekyll-sitemap", "~> 0.12"
  spec.add_runtime_dependency "jekyll-gist", "~> 1.4"
  spec.add_runtime_dependency "jekyll-feed", "~> 0.8"
  spec.add_runtime_dependency "jemoji", "~> 0.7"

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
end
