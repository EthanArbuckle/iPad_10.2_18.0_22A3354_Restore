@implementation _UIStatusBarRadarView

- (_UIStatusBarRadarView)initWithFrame:(CGRect)a3
{
  _UIStatusBarRadarView *v3;
  _UIStatusBarRadarView *v4;
  void *v5;
  void *v6;
  id v7;
  objc_super v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v9.receiver = self;
  v9.super_class = (Class)_UIStatusBarRadarView;
  v3 = -[_UIStatusBarImageView initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[UIView layer](v3, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setCornerRadius:", 12.0);

    v10[0] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[UIView registerForTraitChanges:withAction:](v4, "registerForTraitChanges:withAction:", v6, sel__updateTintColor);

  }
  return v4;
}

- (BOOL)isUserInteractionEnabled
{
  return 1;
}

- (BOOL)canBecomeFocused
{
  return 1;
}

- (void)applyStyleAttributes:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_UIStatusBarRadarView;
  -[_UIStatusBarImageView applyStyleAttributes:](&v4, sel_applyStyleAttributes_, a3);
  -[_UIStatusBarRadarView _updateTintColor](self, "_updateTintColor");
}

- (void)_updateTintColor
{
  id v3;

  -[_UIStatusBarRadarView _tintColor](self, "_tintColor");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[UIView setTintColor:](self, "setTintColor:", v3);

}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  _UIStatusBarRadarView *v5;
  void *v6;

  objc_msgSend(a3, "nextFocusedItem");
  v5 = (_UIStatusBarRadarView *)objc_claimAutoreleasedReturnValue();

  if (v5 == self)
  {
    +[UIColor _carSystemFocusColor](UIColor, "_carSystemFocusColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setBackgroundColor:](self, "setBackgroundColor:", v6);

  }
  else
  {
    -[UIImageView setBackgroundColor:](self, "setBackgroundColor:", 0);
  }
  -[_UIStatusBarRadarView _updateTintColor](self, "_updateTintColor");
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 24.0;
  v3 = 24.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (id)_tintColor
{
  void *v2;
  _BOOL4 v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v4 = -[UIView isFocused](self, "isFocused");
  if (v4
    && (-[UIView traitCollection](self, "traitCollection"),
        v2 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v2, "userInterfaceStyle") == 1))
  {

  }
  else
  {
    -[UIView traitCollection](self, "traitCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "userInterfaceStyle");

    if (v4)
    if (v6 != 2)
    {
      +[UIColor blackColor](UIColor, "blackColor");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      return v7;
    }
  }
  +[UIColor whiteColor](UIColor, "whiteColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  return v7;
}

@end
