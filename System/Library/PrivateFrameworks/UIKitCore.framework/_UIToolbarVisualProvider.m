@implementation _UIToolbarVisualProvider

- (_UIToolbarVisualProvider)initWithToolbar:(id)a3
{
  _UIToolbarVisualProvider *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UIToolbarVisualProvider;
  result = -[_UIToolbarVisualProvider init](&v5, sel_init);
  if (result)
    result->_toolbar = (UIToolbar *)a3;
  return result;
}

- (CGRect)backgroundFrame
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  v2 = *MEMORY[0x1E0C9D648];
  v3 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v4 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v5 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (BOOL)useModernAppearance
{
  return 0;
}

- (_UIBarAppearanceChangeObserver)appearanceObserver
{
  return 0;
}

- (double)backgroundTransitionProgress
{
  return 0.0;
}

- (id)traitCollectionForChild:(id)a3 baseTraitCollection:(id)a4
{
  return a4;
}

- (CGSize)defaultSizeForOrientation:(int64_t)a3
{
  double v3;
  double v4;
  CGSize result;

  v3 = *MEMORY[0x1E0C9D820];
  v4 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  result.height = v4;
  result.width = v3;
  return result;
}

- (BOOL)toolbarIsSmall
{
  return 0;
}

- (int64_t)itemDistribution
{
  return 0;
}

+ (BOOL)shouldDecodeSubviews
{
  return 1;
}

- (NSDirectionalEdgeInsets)contentViewMargins
{
  double v2;
  double v3;
  double v4;
  double v5;
  NSDirectionalEdgeInsets result;

  v2 = 0.0;
  v3 = 0.0;
  v4 = 0.0;
  v5 = 0.0;
  result.trailing = v5;
  result.bottom = v4;
  result.leading = v3;
  result.top = v2;
  return result;
}

- (UIToolbar)toolbar
{
  return self->_toolbar;
}

- (UIView)customBackgroundView
{
  return self->_customBackgroundView;
}

- (void)setCustomBackgroundView:(id)a3
{
  objc_storeStrong((id *)&self->_customBackgroundView, a3);
}

- (UIView)currentBackgroundView
{
  return self->_currentBackgroundView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentBackgroundView, 0);
  objc_storeStrong((id *)&self->_customBackgroundView, 0);
}

@end
