@implementation SAStockRequest

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.stock");
}

- (id)encodedClassName
{
  return CFSTR("Request");
}

+ (id)request
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

- (NSString)requestType
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("requestType"));
}

- (void)setRequestType:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("requestType"), a3);
}

- (NSDate)startDate
{
  return (NSDate *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("startDate"));
}

- (void)setStartDate:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("startDate"), a3);
}

@end
