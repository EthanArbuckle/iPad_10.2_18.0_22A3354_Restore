@implementation SALocalSearchReview

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.localsearch");
}

- (id)encodedClassName
{
  return CFSTR("Review");
}

+ (id)review
{
  return objc_alloc_init((Class)a1);
}

- (NSString)author
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("author"));
}

- (void)setAuthor:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("author"), a3);
}

- (NSString)comment
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("comment"));
}

- (void)setComment:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("comment"), a3);
}

- (NSString)identifier
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("identifier"));
}

- (void)setIdentifier:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("identifier"), a3);
}

- (SACalendar)lastUpdated
{
  return (SACalendar *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("lastUpdated"));
}

- (void)setLastUpdated:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("lastUpdated"), a3);
}

- (NSString)publication
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("publication"));
}

- (void)setPublication:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("publication"), a3);
}

- (SAUIAppPunchOut)reviewPunchOut
{
  return (SAUIAppPunchOut *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("reviewPunchOut"));
}

- (void)setReviewPunchOut:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("reviewPunchOut"), a3);
}

- (SALocalSearchRating)reviewRating
{
  return (SALocalSearchRating *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("reviewRating"));
}

- (void)setReviewRating:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("reviewRating"), a3);
}

@end
