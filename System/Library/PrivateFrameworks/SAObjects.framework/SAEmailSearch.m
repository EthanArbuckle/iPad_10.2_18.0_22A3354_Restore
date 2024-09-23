@implementation SAEmailSearch

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.email");
}

- (id)encodedClassName
{
  return CFSTR("Search");
}

+ (id)search
{
  return objc_alloc_init((Class)a1);
}

- (NSDate)endDate
{
  return (NSDate *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("endDate"));
}

- (void)setEndDate:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("endDate"), a3);
}

- (NSString)fromEmail
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("fromEmail"));
}

- (void)setFromEmail:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("fromEmail"), a3);
}

- (NSDate)startDate
{
  return (NSDate *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("startDate"));
}

- (void)setStartDate:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("startDate"), a3);
}

- (int)status
{
  void *v2;
  int v3;

  -[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("status"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = SAEmailSearchStatusForString(v2);

  return v3;
}

- (void)setStatus:(int)a3
{
  id v4;

  stringForSAEmailSearchStatus(a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  AceObjectSetCopyingObjectForProperty(self, CFSTR("status"), v4);

}

- (NSString)subject
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("subject"));
}

- (void)setSubject:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("subject"), a3);
}

- (NSString)timeZoneId
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("timeZoneId"));
}

- (void)setTimeZoneId:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("timeZoneId"), a3);
}

- (NSString)toEmail
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("toEmail"));
}

- (void)setToEmail:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("toEmail"), a3);
}

- (BOOL)requiresResponse
{
  return 1;
}

@end
