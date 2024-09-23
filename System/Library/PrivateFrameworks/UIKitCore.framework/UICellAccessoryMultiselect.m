@implementation UICellAccessoryMultiselect

- (UICellAccessoryMultiselect)init
{
  UICellAccessoryMultiselect *v2;
  UICellAccessoryMultiselect *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UICellAccessoryMultiselect;
  v2 = -[UICellAccessory init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[UICellAccessory setDisplayedState:](v2, "setDisplayedState:", 1);
  return v3;
}

- (int64_t)_systemType
{
  return 5;
}

- (int64_t)_systemTypePlacementForHeader:(BOOL)a3
{
  return 103;
}

- (id)_identifier
{
  return CFSTR("Multiselect");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
