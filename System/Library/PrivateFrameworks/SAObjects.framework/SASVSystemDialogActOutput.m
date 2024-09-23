@implementation SASVSystemDialogActOutput

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.vector");
}

- (id)encodedClassName
{
  return CFSTR("SystemDialogActOutput");
}

+ (id)systemDialogActOutput
{
  return objc_alloc_init((Class)a1);
}

- (NSArray)dialogActs
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("dialogActs"), v3);
}

- (void)setDialogActs:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("dialogActs"), (uint64_t)a3);
}

@end
