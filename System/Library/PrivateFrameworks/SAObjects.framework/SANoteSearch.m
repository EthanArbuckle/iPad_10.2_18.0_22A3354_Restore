@implementation SANoteSearch

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.note");
}

- (id)encodedClassName
{
  return CFSTR("Search");
}

+ (id)search
{
  return objc_alloc_init((Class)a1);
}

- (NSString)contentQuery
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("contentQuery"));
}

- (void)setContentQuery:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("contentQuery"), a3);
}

- (NSDate)fromDate
{
  return (NSDate *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("fromDate"));
}

- (void)setFromDate:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("fromDate"), a3);
}

- (NSDate)toDate
{
  return (NSDate *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("toDate"));
}

- (void)setToDate:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("toDate"), a3);
}

- (BOOL)requiresResponse
{
  return 1;
}

@end
