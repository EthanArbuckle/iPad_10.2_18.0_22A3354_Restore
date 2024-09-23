@implementation SAWebImageResult

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.websearch");
}

- (id)encodedClassName
{
  return CFSTR("ImageResult");
}

+ (id)imageResult
{
  return objc_alloc_init((Class)a1);
}

- (NSNumber)fileSize
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("fileSize"));
}

- (void)setFileSize:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("fileSize"), a3);
}

- (SAWebAcePicture)picture
{
  return (SAWebAcePicture *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("picture"));
}

- (void)setPicture:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("picture"), a3);
}

- (NSArray)thumbNails
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("thumbNails"), v3);
}

- (void)setThumbNails:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("thumbNails"), (uint64_t)a3);
}

@end
