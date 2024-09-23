@implementation SASTMovieStatItem

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.templates");
}

- (id)encodedClassName
{
  return CFSTR("MovieStatItem");
}

+ (id)movieStatItem
{
  return objc_alloc_init((Class)a1);
}

- (NSString)contentRating
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("contentRating"));
}

- (void)setContentRating:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("contentRating"), a3);
}

- (SASTTemplatePercentageRating)reviewerRating
{
  return (SASTTemplatePercentageRating *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("reviewerRating"));
}

- (void)setReviewerRating:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("reviewerRating"), a3);
}

@end
