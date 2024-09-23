@implementation SACFPEXQuickTypeItem

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.clientflow.local.pex");
}

- (id)encodedClassName
{
  return CFSTR("QuickTypeItem");
}

+ (id)quickTypeItem
{
  return objc_alloc_init((Class)a1);
}

- (NSArray)fields
{
  return (NSArray *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("fields"));
}

- (void)setFields:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("fields"), a3);
}

- (NSArray)itemFlags
{
  return (NSArray *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("itemFlags"));
}

- (void)setItemFlags:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("itemFlags"), a3);
}

- (NSString)label
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("label"));
}

- (void)setLabel:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("label"), a3);
}

- (NSString)name
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("name"));
}

- (void)setName:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("name"), a3);
}

- (NSString)originatingBundleId
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("originatingBundleId"));
}

- (void)setOriginatingBundleId:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("originatingBundleId"), a3);
}

- (NSString)originatingWebsiteURL
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("originatingWebsiteURL"));
}

- (void)setOriginatingWebsiteURL:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("originatingWebsiteURL"), a3);
}

- (NSDate)startDate
{
  return (NSDate *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("startDate"));
}

- (void)setStartDate:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("startDate"), a3);
}

- (NSString)value
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("value"));
}

- (void)setValue:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("value"), a3);
}

@end
