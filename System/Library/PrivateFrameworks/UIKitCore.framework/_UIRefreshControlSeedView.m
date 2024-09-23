@implementation _UIRefreshControlSeedView

- (_UIRefreshControlSeedView)init
{
  _UIRefreshControlSeedView *v2;
  _UIRefreshControlSeedView *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UIRefreshControlSeedView;
  v2 = -[UIView init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[UIView _setShouldAdaptToMaterials:](v2, "_setShouldAdaptToMaterials:", 0);
  return v3;
}

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  return 0;
}

@end
