@implementation SBHVisualStylingView

+ (id)visualStyleSetNameForUserInterfaceStyle:(int64_t)a3
{
  return 0;
}

- (SBHVisualStylingView)initWithFrame:(CGRect)a3
{
  SBHVisualStylingView *v3;
  void *v4;
  void *v5;
  id v6;
  objc_super v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v8.receiver = self;
  v8.super_class = (Class)SBHVisualStylingView;
  v3 = -[SBHVisualStylingView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_opt_self();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (id)-[SBHVisualStylingView registerForTraitChanges:withAction:](v3, "registerForTraitChanges:withAction:", v5, sel__updateVisualStyling);

  }
  return v3;
}

- (void)didMoveToSuperview
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBHVisualStylingView;
  -[SBHVisualStylingView didMoveToSuperview](&v4, sel_didMoveToSuperview);
  -[SBHVisualStylingView superview](self, "superview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    -[SBHVisualStylingView _updateVisualStyling](self, "_updateVisualStyling");
}

- (void)didMoveToWindow
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBHVisualStylingView;
  -[SBHVisualStylingView didMoveToWindow](&v3, sel_didMoveToWindow);
  if (-[SBHVisualStylingView _isInAWindow](self, "_isInAWindow"))
    -[SBHVisualStylingView _updateVisualStyling](self, "_updateVisualStyling");
}

- (void)_updateVisualStyling
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  id v11;

  -[SBHVisualStylingView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceStyle");

  objc_msgSend((id)objc_opt_class(), "visualStyleSetNameForUserInterfaceStyle:", v4);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0D474B8];
  SBHBundle();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_visualStylingProviderForStyleSetNamed:inBundle:", v11, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBHVisualStylingView alpha](self, "alpha");
  v9 = v8;
  objc_msgSend(v7, "_visualStylingForStyle:", 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHVisualStylingView mt_replaceVisualStyling:](self, "mt_replaceVisualStyling:", v10);

  -[SBHVisualStylingView setAlpha:](self, "setAlpha:", v9);
}

@end
