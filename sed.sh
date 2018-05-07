find . -name "*.rb" | xargs grep -Ril Rails.cache.fetch |  xargs  sed -i '' -e "s/Rails.cache.fetch/FastCache.getset/g"
