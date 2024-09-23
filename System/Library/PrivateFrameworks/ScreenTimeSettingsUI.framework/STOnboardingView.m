@implementation STOnboardingView

- (STOnboardingView)initWithTopInset:(double)a3
{
  STOnboardingView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)STOnboardingView;
  v4 = -[STOnboardingView init](&v6, sel_init);
  -[STOnboardingView setTopInset:](v4, "setTopInset:", a3);
  return v4;
}

- (UIEdgeInsets)safeAreaInsets
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  objc_super v13;
  UIEdgeInsets result;

  v13.receiver = self;
  v13.super_class = (Class)STOnboardingView;
  -[STOnboardingView safeAreaInsets](&v13, sel_safeAreaInsets);
  v4 = v3;
  v6 = v5;
  v8 = v7;
  -[STOnboardingView topInset](self, "topInset");
  v10 = v4;
  v11 = v6;
  v12 = v8;
  result.right = v12;
  result.bottom = v11;
  result.left = v10;
  result.top = v9;
  return result;
}

- (double)topInset
{
  return self->_topInset;
}

- (void)setTopInset:(double)a3
{
  self->_topInset = a3;
}

@end
