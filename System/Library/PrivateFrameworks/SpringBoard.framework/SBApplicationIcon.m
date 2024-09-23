@implementation SBApplicationIcon

- (id)application
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBApplicationIcon;
  -[SBHApplicationIcon application](&v3, sel_application);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)applicationPlaceholder
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBApplicationIcon;
  -[SBHApplicationIcon applicationPlaceholder](&v3, sel_applicationPlaceholder);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
