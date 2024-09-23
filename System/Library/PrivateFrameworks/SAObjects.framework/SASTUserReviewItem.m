@implementation SASTUserReviewItem

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.templates");
}

- (id)encodedClassName
{
  return CFSTR("UserReviewItem");
}

+ (id)userReviewItem
{
  return objc_alloc_init((Class)a1);
}

- (SAUIDecoratedText)reviewDate
{
  return (SAUIDecoratedText *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("reviewDate"));
}

- (void)setReviewDate:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("reviewDate"), a3);
}

- (SAUIDecoratedText)reviewText
{
  return (SAUIDecoratedText *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("reviewText"));
}

- (void)setReviewText:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("reviewText"), a3);
}

- (SAUIDecoratedText)reviewer
{
  return (SAUIDecoratedText *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("reviewer"));
}

- (void)setReviewer:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("reviewer"), a3);
}

@end
