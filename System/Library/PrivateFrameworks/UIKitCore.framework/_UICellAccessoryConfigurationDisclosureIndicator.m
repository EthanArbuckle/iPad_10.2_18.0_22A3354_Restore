@implementation _UICellAccessoryConfigurationDisclosureIndicator

- (_UICellAccessoryConfigurationDisclosureIndicator)init
{
  _UICellAccessoryConfigurationDisclosureIndicator *v2;
  _UICellAccessoryConfigurationDisclosureIndicator *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UICellAccessoryConfigurationDisclosureIndicator;
  v2 = -[_UICellAccessoryConfiguration init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[_UICellAccessoryConfiguration setUsesDefaultLayoutWidth:](v2, "setUsesDefaultLayoutWidth:", 0);
  return v3;
}

- (int64_t)_systemType
{
  return 0;
}

- (id)_identifier
{
  return CFSTR("DisclosureIndicator");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
