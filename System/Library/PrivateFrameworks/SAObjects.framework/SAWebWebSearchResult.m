@implementation SAWebWebSearchResult

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.websearch");
}

- (id)encodedClassName
{
  return CFSTR("WebSearchResult");
}

+ (id)webSearchResult
{
  return objc_alloc_init((Class)a1);
}

- (NSArray)imageResults
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("imageResults"), v3);
}

- (void)setImageResults:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("imageResults"), (uint64_t)a3);
}

- (NSArray)newsResults
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("newsResults"), v3);
}

- (void)setNewsResults:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("newsResults"), (uint64_t)a3);
}

- (NSArray)relatedSearchResults
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("relatedSearchResults"), v3);
}

- (void)setRelatedSearchResults:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("relatedSearchResults"), (uint64_t)a3);
}

- (NSNumber)totalImageResults
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("totalImageResults"));
}

- (void)setTotalImageResults:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("totalImageResults"), a3);
}

- (NSNumber)totalNewsResults
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("totalNewsResults"));
}

- (void)setTotalNewsResults:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("totalNewsResults"), a3);
}

- (NSNumber)totalVideoResults
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("totalVideoResults"));
}

- (void)setTotalVideoResults:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("totalVideoResults"), a3);
}

- (NSNumber)totalWebResults
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("totalWebResults"));
}

- (void)setTotalWebResults:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("totalWebResults"), a3);
}

- (NSArray)videoResults
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("videoResults"), v3);
}

- (void)setVideoResults:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("videoResults"), (uint64_t)a3);
}

- (NSArray)webResults
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("webResults"), v3);
}

- (void)setWebResults:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("webResults"), (uint64_t)a3);
}

@end
