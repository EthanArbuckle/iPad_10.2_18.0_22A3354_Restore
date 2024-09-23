@implementation SALocalSearchPhotoList

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.localsearch");
}

- (id)encodedClassName
{
  return CFSTR("PhotoList");
}

+ (id)photoList
{
  return objc_alloc_init((Class)a1);
}

- (NSArray)photos
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("photos"), v3);
}

- (void)setPhotos:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("photos"), (uint64_t)a3);
}

- (NSString)providerId
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("providerId"));
}

- (void)setProviderId:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("providerId"), a3);
}

@end
