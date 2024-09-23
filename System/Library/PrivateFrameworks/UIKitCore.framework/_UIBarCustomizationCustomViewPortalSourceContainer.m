@implementation _UIBarCustomizationCustomViewPortalSourceContainer

+ (id)sharedContainer
{
  if (_MergedGlobals_1149 != -1)
    dispatch_once(&_MergedGlobals_1149, &__block_literal_global_377);
  return (id)qword_1ECD7F178;
}

- (_UIBarCustomizationCustomViewPortalSourceContainer)init
{
  _UIBarCustomizationCustomViewPortalSourceContainer *v2;
  _UIBarCustomizationCustomViewPortalSourceContainer *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UIBarCustomizationCustomViewPortalSourceContainer;
  v2 = -[UIView init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[_UIBarCustomizationCustomViewPortalSourceContainer setAlpha:](v2, "setAlpha:", 0.0);
    -[UIView setInsetsLayoutMarginsFromSafeArea:](v3, "setInsetsLayoutMarginsFromSafeArea:", 0);
  }
  return v3;
}

- (void)setAlpha:(double)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UIBarCustomizationCustomViewPortalSourceContainer;
  -[UIView setAlpha:](&v3, sel_setAlpha_, 0.0);
}

@end
