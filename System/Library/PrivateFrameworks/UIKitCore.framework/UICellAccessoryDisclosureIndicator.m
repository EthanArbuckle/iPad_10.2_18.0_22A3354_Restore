@implementation UICellAccessoryDisclosureIndicator

- (id)_identifier
{
  return CFSTR("DisclosureIndicator");
}

- (UICellAccessoryDisclosureIndicator)init
{
  UICellAccessoryDisclosureIndicator *v2;
  UICellAccessoryDisclosureIndicator *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UICellAccessoryDisclosureIndicator;
  v2 = -[UICellAccessory init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[UICellAccessory setReservedLayoutWidth:](v2, "setReservedLayoutWidth:", 0.0);
  return v3;
}

- (int64_t)_systemType
{
  return 0;
}

- (int64_t)_systemTypePlacementForHeader:(BOOL)a3
{
  return 205;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
