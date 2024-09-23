@implementation SAGKImagePod

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.generalknowledge");
}

- (id)encodedClassName
{
  return CFSTR("ImagePod");
}

+ (id)imagePod
{
  return objc_alloc_init((Class)a1);
}

- (NSArray)images
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("images"), v3);
}

- (void)setImages:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("images"), (uint64_t)a3);
}

@end
