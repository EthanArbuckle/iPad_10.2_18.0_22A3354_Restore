@implementation SAMovieV2ReviewListCell

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.movieV2");
}

- (id)encodedClassName
{
  return CFSTR("ReviewListCell");
}

+ (id)reviewListCell
{
  return objc_alloc_init((Class)a1);
}

- (NSString)reviewAuthor
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("reviewAuthor"));
}

- (void)setReviewAuthor:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("reviewAuthor"), a3);
}

- (NSDate)reviewDate
{
  return (NSDate *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("reviewDate"));
}

- (void)setReviewDate:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("reviewDate"), a3);
}

- (NSString)reviewText
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("reviewText"));
}

- (void)setReviewText:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("reviewText"), a3);
}

@end
