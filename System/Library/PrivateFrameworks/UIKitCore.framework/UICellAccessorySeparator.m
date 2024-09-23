@implementation UICellAccessorySeparator

- (UICellAccessorySeparator)init
{
  UICellAccessorySeparator *v2;
  UICellAccessorySeparator *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UICellAccessorySeparator;
  v2 = -[UICellAccessory init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[UICellAccessory setDisplayedState:](v2, "setDisplayedState:", 1);
    -[UICellAccessory setReservedLayoutWidth:](v3, "setReservedLayoutWidth:", 0.0);
  }
  return v3;
}

- (int64_t)_systemType
{
  return 8;
}

- (int64_t)_systemTypePlacementForHeader:(BOOL)a3
{
  return 207;
}

- (id)_identifier
{
  return CFSTR("Separator");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
