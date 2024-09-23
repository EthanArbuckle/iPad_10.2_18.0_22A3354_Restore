@implementation SAMPCollection

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.media");
}

- (id)encodedClassName
{
  return CFSTR("Collection");
}

+ (id)collection
{
  return objc_alloc_init((Class)a1);
}

- (BOOL)editable
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("editable"));
}

- (void)setEditable:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("editable"), a3);
}

- (NSArray)items
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("items"), v3);
}

- (void)setItems:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("items"), (uint64_t)a3);
}

@end
