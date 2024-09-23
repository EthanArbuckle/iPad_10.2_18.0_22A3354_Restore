@implementation SASTMovieRatingReviewItem

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.templates");
}

- (id)encodedClassName
{
  return CFSTR("MovieRatingReviewItem");
}

+ (id)movieRatingReviewItem
{
  return objc_alloc_init((Class)a1);
}

- (SAUIDecoratedText)reviews
{
  return (SAUIDecoratedText *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("reviews"));
}

- (void)setReviews:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("reviews"), a3);
}

- (SASTTemplatePercentageRating)templatePercentageRating
{
  return (SASTTemplatePercentageRating *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("templatePercentageRating"));
}

- (void)setTemplatePercentageRating:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("templatePercentageRating"), a3);
}

@end
