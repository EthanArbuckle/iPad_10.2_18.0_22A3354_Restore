@implementation SADPDeviceDetail

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.devicePlaySound");
}

- (id)encodedClassName
{
  return CFSTR("DeviceDetail");
}

+ (id)deviceDetail
{
  return objc_alloc_init((Class)a1);
}

- (BOOL)canPlaySound
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("canPlaySound"));
}

- (void)setCanPlaySound:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("canPlaySound"), a3);
}

- (NSString)deviceClass
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("deviceClass"));
}

- (void)setDeviceClass:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("deviceClass"), a3);
}

- (NSString)deviceId
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("deviceId"));
}

- (void)setDeviceId:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("deviceId"), a3);
}

- (NSString)deviceLocality
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("deviceLocality"));
}

- (void)setDeviceLocality:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("deviceLocality"), a3);
}

- (NSString)deviceName
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("deviceName"));
}

- (void)setDeviceName:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("deviceName"), a3);
}

- (NSString)emoji
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("emoji"));
}

- (void)setEmoji:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("emoji"), a3);
}

- (BOOL)foundNearby
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("foundNearby"));
}

- (void)setFoundNearby:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("foundNearby"), a3);
}

- (SAPerson)owner
{
  return (SAPerson *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("owner"));
}

- (void)setOwner:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("owner"), a3);
}

- (NSString)productName
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("productName"));
}

- (void)setProductName:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("productName"), a3);
}

- (NSArray)productTypes
{
  return (NSArray *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("productTypes"));
}

- (void)setProductTypes:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("productTypes"), a3);
}

- (BOOL)thisDevice
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("thisDevice"));
}

- (void)setThisDevice:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("thisDevice"), a3);
}

@end
