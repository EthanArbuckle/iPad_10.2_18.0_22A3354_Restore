@implementation STUIStatusBarRadarView

- (STUIStatusBarRadarView)initWithFrame:(CGRect)a3
{
  STUIStatusBarRadarView *v3;
  STUIStatusBarRadarView *v4;
  void *v5;
  void *v6;
  id v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)STUIStatusBarRadarView;
  v3 = -[STUIStatusBarImageView initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[STUIStatusBarRadarView layer](v3, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setCornerRadius:", 12.0);

    objc_msgSend(MEMORY[0x1E0DC3E88], "systemTraitsAffectingColorAppearance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (id)-[STUIStatusBarRadarView registerForTraitChanges:withAction:](v4, "registerForTraitChanges:withAction:", v6, sel__updateTintColor);

    -[STUIStatusBarRadarView _updateTintColor](v4, "_updateTintColor");
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
  v4.super_class = (Class)STUIStatusBarRadarView;
  -[STUIStatusBarImageView applyStyleAttributes:](&v4, sel_applyStyleAttributes_, a3);
  -[STUIStatusBarRadarView _updateTintColor](self, "_updateTintColor");
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  STUIStatusBarRadarView *v5;
  void *v6;

  objc_msgSend(a3, "nextFocusedItem");
  v5 = (STUIStatusBarRadarView *)objc_claimAutoreleasedReturnValue();

  if (v5 == self)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "_carSystemFocusColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[STUIStatusBarRadarView setBackgroundColor:](self, "setBackgroundColor:", v6);

  }
  else
  {
    -[STUIStatusBarRadarView setBackgroundColor:](self, "setBackgroundColor:", 0);
  }
  -[STUIStatusBarRadarView _updateTintColor](self, "_updateTintColor");
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

- (void)_updateTintColor
{
  void *v2;
  int v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  v4 = -[STUIStatusBarRadarView isFocused](self, "isFocused");
  if (v4
    && (-[STUIStatusBarRadarView traitCollection](self, "traitCollection"),
        v2 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v2, "userInterfaceStyle") == 1))
  {

  }
  else
  {
    -[STUIStatusBarRadarView traitCollection](self, "traitCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "userInterfaceStyle");

    if (v4)
    if (v6 != 2)
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
  }
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v7 = objc_claimAutoreleasedReturnValue();
LABEL_9:
  v8 = (id)v7;
  -[STUIStatusBarRadarView setTintColor:](self, "setTintColor:", v7);

}

- (id)accessibilityUserInputLabels
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Radar"), CFSTR("Radar"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Bug"), CFSTR("Bug"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
