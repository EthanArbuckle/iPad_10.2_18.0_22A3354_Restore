@implementation TPTableViewCell

- (void)setForegroundColor:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  if (v10
    && (objc_msgSend(MEMORY[0x1E0DC3658], "clearColor"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v10, "isEqual:", v4),
        v4,
        (v5 & 1) == 0))
  {
    v7 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
    -[TPTableViewCell setForegroundView:](self, "setForegroundView:", v7);

    -[TPTableViewCell foregroundView](self, "foregroundView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setBackgroundColor:", v10);

    -[TPTableViewCell foregroundView](self, "foregroundView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[TPTableViewCell addSubview:](self, "addSubview:", v9);

  }
  else
  {
    -[TPTableViewCell foregroundView](self, "foregroundView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeFromSuperview");

    -[TPTableViewCell setForegroundView:](self, "setForegroundView:", 0);
  }

}

- (void)setForegroundView:(id)a3
{
  UIView *v5;
  UIView *foregroundView;
  UIView *v7;

  v5 = (UIView *)a3;
  foregroundView = self->_foregroundView;
  v7 = v5;
  if (foregroundView != v5)
  {
    -[UIView removeFromSuperview](foregroundView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_foregroundView, a3);
    if (self->_foregroundView)
      -[TPTableViewCell addSubview:](self, "addSubview:");
  }

}

- (UIView)foregroundView
{
  return self->_foregroundView;
}

- (void)updateConstraints
{
  objc_super v3;

  if (!-[TPTableViewCell isConstraintsLoaded](self, "isConstraintsLoaded"))
  {
    -[TPTableViewCell updateFonts](self, "updateFonts");
    -[TPTableViewCell loadConstraints](self, "loadConstraints");
    -[TPTableViewCell intrinsicSeparatorInset](self, "intrinsicSeparatorInset");
    -[TPTableViewCell setSeparatorInset:](self, "setSeparatorInset:");
    -[TPTableViewCell setConstraintsLoaded:](self, "setConstraintsLoaded:", 1);
  }
  v3.receiver = self;
  v3.super_class = (Class)TPTableViewCell;
  -[TPTableViewCell updateConstraints](&v3, sel_updateConstraints);
}

- (void)setConstraintsLoaded:(BOOL)a3
{
  self->_constraintsLoaded = a3;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)TPTableViewCell;
  -[TPTableViewCell layoutSubviews](&v13, sel_layoutSubviews);
  if (-[TPTableViewCell isForegroundViewLoaded](self, "isForegroundViewLoaded"))
  {
    -[TPTableViewCell bounds](self, "bounds");
    v4 = v3;
    v6 = v5;
    v8 = v7;
    v10 = v9;
    -[TPTableViewCell foregroundView](self, "foregroundView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

    -[TPTableViewCell foregroundView](self, "foregroundView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[TPTableViewCell bringSubviewToFront:](self, "bringSubviewToFront:", v12);

  }
}

- (BOOL)isForegroundViewLoaded
{
  return self->_foregroundView != 0;
}

- (BOOL)isConstraintsLoaded
{
  return self->_constraintsLoaded;
}

- (UIEdgeInsets)intrinsicSeparatorInset
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  UIEdgeInsets result;

  v3 = (void *)objc_opt_class();
  -[TPTableViewCell traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preferredContentSizeCategory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "separatorInsetForContentSizeCategory:", v5);
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  v14 = v7;
  v15 = v9;
  v16 = v11;
  v17 = v13;
  result.right = v17;
  result.bottom = v16;
  result.left = v15;
  result.top = v14;
  return result;
}

- (TPTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  TPTableViewCell *v4;
  TPTableViewCell *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TPTableViewCell;
  v4 = -[TPTableViewCell initWithStyle:reuseIdentifier:](&v7, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
    -[TPTableViewCell commonInit](v4, "commonInit");
  return v5;
}

- (void)commonInit
{
  void *v3;

  -[TPTableViewCell traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  self->_accessiblityConstraintsEnabled = objc_msgSend(v3, "isPreferredContentSizeCategoryAccessible");

  -[TPTableViewCell loadContentView](self, "loadContentView");
}

+ (BOOL)requiresConstraintBasedLayout
{
  return 1;
}

+ (UIEdgeInsets)separatorInsetForContentSizeCategory:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  UIEdgeInsets result;

  v3 = *MEMORY[0x1E0DC49E8];
  v4 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
  v5 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
  v6 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (TPTableViewCell)init
{
  return -[TPTableViewCell initWithFrame:](self, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
}

- (TPTableViewCell)initWithCoder:(id)a3
{
  TPTableViewCell *v3;
  TPTableViewCell *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TPTableViewCell;
  v3 = -[TPTableViewCell initWithCoder:](&v6, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
    -[TPTableViewCell commonInit](v3, "commonInit");
  return v4;
}

- (TPTableViewCell)initWithFrame:(CGRect)a3
{
  TPTableViewCell *v3;
  TPTableViewCell *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TPTableViewCell;
  v3 = -[TPTableViewCell initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[TPTableViewCell commonInit](v3, "commonInit");
  return v4;
}

- (void)unloadConstraints
{
  void *v3;

  -[TPTableViewCell constraints](self, "constraints");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TPTableViewCell removeConstraints:](self, "removeConstraints:", v3);

  -[TPTableViewCell setConstraintsLoaded:](self, "setConstraintsLoaded:", 0);
}

- (UIColor)foregroundColor
{
  void *v3;
  void *v4;

  if (-[TPTableViewCell isForegroundViewLoaded](self, "isForegroundViewLoaded"))
  {
    -[TPTableViewCell foregroundView](self, "foregroundView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "backgroundColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return (UIColor *)v4;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  int v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)TPTableViewCell;
  v4 = a3;
  -[TPTableViewCell traitCollectionDidChange:](&v11, sel_traitCollectionDidChange_, v4);
  -[TPTableViewCell traitCollection](self, "traitCollection", v11.receiver, v11.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preferredContentSizeCategory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "preferredContentSizeCategory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 != v7)
  {
    v8 = objc_msgSend(v5, "isPreferredContentSizeCategoryAccessible");
    v9 = (void *)*MEMORY[0x1E0DC4938];
    v10 = v8 ^ -[TPTableViewCell isAccessiblityConstraintsEnabled](self, "isAccessiblityConstraintsEnabled");
    if (v6 == v9)
    {
      if (v10)
        self->_accessiblityConstraintsEnabled = v8;
    }
    else
    {
      if (v10)
        -[TPTableViewCell setAccessiblityConstraintsEnabled:](self, "setAccessiblityConstraintsEnabled:", v8);
      -[TPTableViewCell updateFonts](self, "updateFonts");
      -[TPTableViewCell updateConstraintsConstants](self, "updateConstraintsConstants");
      -[TPTableViewCell intrinsicSeparatorInset](self, "intrinsicSeparatorInset");
      -[TPTableViewCell setSeparatorInset:](self, "setSeparatorInset:");
    }
  }

}

- (void)setAccessiblityConstraintsEnabled:(BOOL)a3
{
  if (self->_accessiblityConstraintsEnabled != a3)
  {
    self->_accessiblityConstraintsEnabled = a3;
    -[TPTableViewCell unloadConstraints](self, "unloadConstraints");
    -[TPTableViewCell setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
    -[TPTableViewCell layoutIfNeeded](self, "layoutIfNeeded");
  }
}

- (BOOL)isAccessiblityConstraintsEnabled
{
  return self->_accessiblityConstraintsEnabled;
}

- (void)setForegroundViewLoaded:(BOOL)a3
{
  self->_foregroundViewLoaded = a3;
}

- (NSLayoutConstraint)foregroundViewLeadingAnchorLayoutConstraint
{
  return self->_foregroundViewLeadingAnchorLayoutConstraint;
}

- (NSLayoutConstraint)foregroundViewTrailingAnchorLayoutConstraint
{
  return self->_foregroundViewTrailingAnchorLayoutConstraint;
}

- (NSLayoutConstraint)foregroundViewTopAnchorLayoutConstraint
{
  return self->_foregroundViewTopAnchorLayoutConstraint;
}

- (NSLayoutConstraint)foregroundViewBottomAnchorLayoutConstraint
{
  return self->_foregroundViewBottomAnchorLayoutConstraint;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_foregroundViewBottomAnchorLayoutConstraint, 0);
  objc_storeStrong((id *)&self->_foregroundViewTopAnchorLayoutConstraint, 0);
  objc_storeStrong((id *)&self->_foregroundViewTrailingAnchorLayoutConstraint, 0);
  objc_storeStrong((id *)&self->_foregroundViewLeadingAnchorLayoutConstraint, 0);
  objc_storeStrong((id *)&self->_foregroundView, 0);
}

@end
