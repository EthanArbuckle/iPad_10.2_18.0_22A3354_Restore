@implementation SASTRatingItem

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.templates");
}

- (id)encodedClassName
{
  return CFSTR("RatingItem");
}

+ (id)ratingItem
{
  return objc_alloc_init((Class)a1);
}

- (SASTTemplateRating)rating
{
  return (SASTTemplateRating *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("rating"));
}

- (void)setRating:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("rating"), a3);
}

@end
