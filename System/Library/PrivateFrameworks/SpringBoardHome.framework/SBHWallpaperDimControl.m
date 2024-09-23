@implementation SBHWallpaperDimControl

- (SBHWallpaperDimControl)initWithFrame:(CGRect)a3
{
  SBHWallpaperDimControl *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  BSUICAPackageView *packageView;
  BSUICAPackageView *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  objc_super v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v14.receiver = self;
  v14.super_class = (Class)SBHWallpaperDimControl;
  v3 = -[SBHWallpaperDimControl initWithFrame:](&v14, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "URLForResource:withExtension:", CFSTR("Dim Icon Asset"), CFSTR("ca"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0D01910]), "initWithURL:", v5);
    packageView = v3->_packageView;
    v3->_packageView = (BSUICAPackageView *)v6;

    v8 = v3->_packageView;
    -[SBHWallpaperDimControl bounds](v3, "bounds");
    -[BSUICAPackageView setFrame:](v8, "setFrame:");
    -[BSUICAPackageView setUserInteractionEnabled:](v3->_packageView, "setUserInteractionEnabled:", 0);
    -[BSUICAPackageView layer](v3->_packageView, "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setAllowsGroupOpacity:", 1);

    -[SBHWallpaperDimControl setPointerStyleProvider:](v3, "setPointerStyleProvider:", &__block_literal_global_38);
    -[SBHWallpaperDimControl addSubview:](v3, "addSubview:", v3->_packageView);
    v3->_isDimmed = 0;
    -[SBHWallpaperDimControl _updatePackageView:](v3, "_updatePackageView:", 0);
    -[SBHWallpaperDimControl _updateFilters](v3, "_updateFilters");
    objc_opt_self();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (id)-[SBHWallpaperDimControl registerForTraitChanges:withTarget:action:](v3, "registerForTraitChanges:withTarget:action:", v11, v3, sel__updateFilters);

  }
  return v3;
}

id __40__SBHWallpaperDimControl_initWithFrame___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  CGRect v8;
  CGRect v9;

  v4 = a3;
  objc_msgSend(a2, "bounds");
  v9 = CGRectInset(v8, -8.0, -8.0);
  objc_msgSend(MEMORY[0x1E0DC3B30], "shapeWithRoundedRect:", v9.origin.x, v9.origin.y, v9.size.width, v9.size.height);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3B38], "styleWithEffect:shape:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)isPointerInteractionEnabled
{
  return 1;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBHWallpaperDimControl;
  -[SBHWallpaperDimControl layoutSubviews](&v3, sel_layoutSubviews);
  -[SBHWallpaperDimControl bounds](self, "bounds");
  -[BSUICAPackageView setFrame:](self->_packageView, "setFrame:");
}

- (void)sizeToFit
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;

  -[SBHWallpaperDimControl frame](self, "frame");
  v4 = v3;
  v6 = v5;
  -[BSUICAPackageView sizeThatFits:](self->_packageView, "sizeThatFits:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
  -[SBHWallpaperDimControl setFrame:](self, "setFrame:", v4, v6, v7, v8);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGSize result;

  -[SBHWallpaperDimControl bounds](self, "bounds", a3.width, a3.height);
  v4 = v3;
  v6 = v5;
  result.height = v6;
  result.width = v4;
  return result;
}

- (void)setDimmed:(BOOL)a3
{
  -[SBHWallpaperDimControl setDimmed:animated:](self, "setDimmed:animated:", a3, 0);
}

- (void)setDimmed:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;

  if (self->_isDimmed != a3)
  {
    v4 = a4;
    self->_isDimmed = a3;
    -[SBHWallpaperDimControl sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 4096);
    -[SBHWallpaperDimControl _updatePackageView:](self, "_updatePackageView:", v4);
  }
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  objc_super v7;
  _QWORD v8[2];

  v3 = a3;
  v8[1] = *MEMORY[0x1E0C80C00];
  v7.receiver = self;
  v7.super_class = (Class)SBHWallpaperDimControl;
  -[SBHWallpaperDimControl setHighlighted:](&v7, sel_setHighlighted_);
  v5 = (void *)MEMORY[0x1E0DC3518];
  v8[0] = self->_packageView;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_setVisuallyHighlighted:forViews:initialPress:", v3, v6, v3);

}

- (void)_updateFilters
{
  void *v3;
  uint64_t v4;
  _QWORD *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  -[SBHWallpaperDimControl traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceStyle");
  v5 = (_QWORD *)MEMORY[0x1E0CD2E98];
  if (v4 != 1)
    v5 = (_QWORD *)MEMORY[0x1E0CD2EA0];
  objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHWallpaperDimControl layer](self, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setCompositingFilter:", v6);

  if (v4 == 1)
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "colorWithAlphaComponent:", 0.54);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2BF8]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_retainAutorelease(v9);
  objc_msgSend(v10, "setValue:forKey:", objc_msgSend(v11, "CGColor"), CFSTR("inputColor"));
  objc_msgSend(v10, "setValue:forKey:", &unk_1E8E16EF0, CFSTR("inputBias"));
  objc_msgSend(v10, "setValue:forKey:", &unk_1E8E16F00, CFSTR("inputAmount"));
  -[SBHWallpaperDimControl layer](self, "layer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFilters:", v13);

}

- (void)_updatePackageView:(BOOL)a3
{
  _BOOL8 v3;
  __CFString *v5;
  void *v6;
  __CFString *v7;

  v3 = a3;
  if (self->_isDimmed)
    v5 = CFSTR("dim");
  else
    v5 = CFSTR("not dim");
  v6 = (void *)MEMORY[0x1E0CD28B0];
  v7 = v5;
  objc_msgSend(v6, "begin");
  -[BSUICAPackageView setState:animated:](self->_packageView, "setState:animated:", v7, v3);

  -[SBHWallpaperDimControl _updateFilters](self, "_updateFilters");
  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
}

- (BOOL)isDimmed
{
  return self->_isDimmed;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_packageView, 0);
}

@end
