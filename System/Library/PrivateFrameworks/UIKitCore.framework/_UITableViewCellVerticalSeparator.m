@implementation _UITableViewCellVerticalSeparator

- (_UITableViewCellVerticalSeparator)initWithFrame:(CGRect)a3
{
  _UITableViewCellVerticalSeparator *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  objc_super v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v9.receiver = self;
  v9.super_class = (Class)_UITableViewCellVerticalSeparator;
  v3 = -[UIView initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    +[UIColor tableSeparatorLightColor](UIColor, "tableSeparatorLightColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v3, "setBackgroundColor:", v4);

    -[UIView layer](v3, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAllowsEdgeAntialiasing:", 1);

    -[UIView setHidden:](v3, "setHidden:", -[_UITableViewCellVerticalSeparator _shouldReplaceWithFixedPadding](v3, "_shouldReplaceWithFixedPadding"));
    v10[0] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[UIView registerForTraitChanges:withAction:](v3, "registerForTraitChanges:withAction:", v6, sel__traitsUserInterfaceIdiomDidChange);

  }
  return v3;
}

- (BOOL)_shouldReplaceWithFixedPadding
{
  void *v2;
  BOOL v3;

  -[UIView traitCollection](self, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceIdiom") == 6;

  return v3;
}

- (void)_traitsUserInterfaceIdiomDidChange
{
  -[UIView setHidden:](self, "setHidden:", -[_UITableViewCellVerticalSeparator _shouldReplaceWithFixedPadding](self, "_shouldReplaceWithFixedPadding"));
  -[UIView layoutIfNeeded](self, "layoutIfNeeded");
}

- (BOOL)_shouldDrawThickSeparators
{
  int v2;
  NSString *v3;
  BOOL IsAccessibilityCategory;

  v2 = dyld_program_sdk_at_least();
  if (v2)
  {
    objc_msgSend((id)UIApp, "preferredContentSizeCategory");
    v3 = (NSString *)objc_claimAutoreleasedReturnValue();
    IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v3);

    LOBYTE(v2) = IsAccessibilityCategory;
  }
  return v2;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat height;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  height = a3.height;
  if (-[_UITableViewCellVerticalSeparator _shouldReplaceWithFixedPadding](self, "_shouldReplaceWithFixedPadding", a3.width))
  {
    -[UIView traitCollection](self, "traitCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    _UITableConstantsForTraitCollection(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "defaultVerticalAccessorySeparatorReplacementPaddingWidth");
    v8 = v7;

  }
  else
  {
    v8 = 1.0;
    if (!-[_UITableViewCellVerticalSeparator _shouldDrawThickSeparators](self, "_shouldDrawThickSeparators"))
    {
      -[UIView _currentScreenScale](self, "_currentScreenScale");
      v8 = 1.0 / v9;
    }
  }
  v10 = v8;
  v11 = height;
  result.height = v11;
  result.width = v10;
  return result;
}

@end
