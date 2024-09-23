@implementation SBHomeScreenButton

- (SBHomeScreenButton)initWithFrame:(CGRect)a3 backgroundView:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v10;
  SBHomeScreenButton *v11;
  SBHomeScreenButton *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  objc_super v20;
  _QWORD v21[4];

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v21[3] = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v20.receiver = self;
  v20.super_class = (Class)SBHomeScreenButton;
  v11 = -[SBHomeScreenButton initWithFrame:](&v20, sel_initWithFrame_, x, y, width, height);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_backgroundView, a4);
    objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2BB8]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setName:", CFSTR("highlightBrightness"));
    objc_msgSend(v13, "setValue:forKey:", &unk_1E8E16E80, CFSTR("inputAmount"));
    objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2C00]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setName:", CFSTR("highlightSaturation"));
    objc_msgSend(v14, "setValue:forKey:", &unk_1E8E16E90, CFSTR("inputAmount"));
    objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2E60]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setName:", CFSTR("enabledMultiplyColor"));
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v15, "setValue:forKeyPath:", objc_msgSend(v16, "CGColor"), CFSTR("inputColor"));

    -[SBHomeScreenButton layer](v12, "layer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v13;
    v21[1] = v14;
    v21[2] = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 3);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setFilters:", v18);

  }
  return v12;
}

- (SBHomeScreenButton)initWithFrame:(CGRect)a3
{
  return -[SBHomeScreenButton initWithFrame:backgroundView:](self, "initWithFrame:backgroundView:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)layoutSubviews
{
  SBHomeScreenMaterialView *v3;
  UIView *backgroundView;
  void *v5;
  SBHomeScreenMaterialView *v6;
  SBHomeScreenMaterialView *materialView;
  SBHomeScreenMaterialView *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)SBHomeScreenButton;
  -[SBHomeScreenButton layoutSubviews](&v22, sel_layoutSubviews);
  if (!self->_materialView)
  {
    v3 = [SBHomeScreenMaterialView alloc];
    backgroundView = self->_backgroundView;
    -[SBHomeScreenButton defaultContentImage](self, "defaultContentImage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[SBHomeScreenMaterialView initWithFrame:backgroundView:foregroundImage:](v3, "initWithFrame:backgroundView:foregroundImage:", backgroundView, v5, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    materialView = self->_materialView;
    self->_materialView = v6;

    -[SBHomeScreenMaterialView setUserInteractionEnabled:](self->_materialView, "setUserInteractionEnabled:", 0);
    v8 = self->_materialView;
    -[SBHomeScreenButton backgroundInsets](self, "backgroundInsets");
    -[SBHomeScreenMaterialView setBackgroundInsets:](v8, "setBackgroundInsets:");
    -[SBHomeScreenButton addSubview:](self, "addSubview:", self->_materialView);
  }
  -[SBHomeScreenButton configuration](self, "configuration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "contentInsets");
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;

  -[SBHomeScreenButton bounds](self, "bounds");
  -[SBHomeScreenMaterialView setFrame:](self->_materialView, "setFrame:", SBHDirectionalEdgeInsetsInsetRect(-[SBHomeScreenButton effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection"), v18, v19, v20, v21, v11, v13, v15, v17));
}

- (UIView)backgroundView
{
  return -[SBHomeScreenMaterialView backgroundView](self->_materialView, "backgroundView");
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL8 v3;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  objc_super v13;

  v3 = a3;
  v5 = -[SBHomeScreenButton isHighlighted](self, "isHighlighted");
  v13.receiver = self;
  v13.super_class = (Class)SBHomeScreenButton;
  -[SBHomeScreenButton setHighlighted:](&v13, sel_setHighlighted_, v3);
  if (v5 != v3)
  {
    -[SBHomeScreenButton layer](self, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v3)
    {
      objc_msgSend(v6, "setValue:forKeyPath:", &unk_1E8E16EA0, CFSTR("filters.highlightBrightness.inputAmount"));
      -[SBHomeScreenButton traitCollection](self, "traitCollection");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "userInterfaceStyle");

      if (v9 == 2)
        objc_msgSend(v7, "setValue:forKeyPath:", &unk_1E8E16EB0, CFSTR("filters.highlightSaturation.inputAmount"));
    }
    else
    {
      v10 = (void *)MEMORY[0x1E0DC3F10];
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __37__SBHomeScreenButton_setHighlighted___block_invoke;
      v11[3] = &unk_1E8D84C50;
      v12 = v6;
      objc_msgSend(v10, "animateWithDuration:delay:options:animations:completion:", 2, v11, 0, 0.3, 0.0);

    }
  }
}

uint64_t __37__SBHomeScreenButton_setHighlighted___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setValue:forKeyPath:", &unk_1E8E16E80, CFSTR("filters.highlightBrightness.inputAmount"));
  return objc_msgSend(*(id *)(a1 + 32), "setValue:forKeyPath:", &unk_1E8E16E90, CFSTR("filters.highlightSaturation.inputAmount"));
}

- (void)setEnabled:(BOOL)a3
{
  _BOOL8 v3;
  int v5;
  void *v6;
  double v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  objc_super v15;

  v3 = a3;
  v5 = -[SBHomeScreenButton isEnabled](self, "isEnabled");
  v15.receiver = self;
  v15.super_class = (Class)SBHomeScreenButton;
  -[SBHomeScreenButton setEnabled:](&v15, sel_setEnabled_, v3);
  if (v5 != v3)
  {
    -[SBHomeScreenButton layer](self, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 0.5;
    if (v3)
      v7 = 1.0;
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)MEMORY[0x1E0DC3F10];
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __33__SBHomeScreenButton_setEnabled___block_invoke;
    v12[3] = &unk_1E8D84EF0;
    v13 = v6;
    v14 = v8;
    v10 = v8;
    v11 = v6;
    objc_msgSend(v9, "animateWithDuration:delay:options:animations:completion:", 2, v12, 0, 0.3, 0.0);

  }
}

uint64_t __33__SBHomeScreenButton_setEnabled___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setValue:forKeyPath:", objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "CGColor"), CFSTR("filters.enabledMultiplyColor.inputColor"));
}

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  id v4;
  BOOL v5;
  objc_super v7;

  v4 = a3;
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("filters.highlightBrightness.inputAmount")) & 1) != 0
    || (objc_msgSend(v4, "isEqualToString:", CFSTR("filters.highlightSaturation.inputAmount")) & 1) != 0
    || (objc_msgSend(v4, "isEqualToString:", CFSTR("filters.enabledMultiplyColor.inputColor")) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SBHomeScreenButton;
    v5 = -[SBHomeScreenButton _shouldAnimatePropertyWithKey:](&v7, sel__shouldAnimatePropertyWithKey_, v4);
  }

  return v5;
}

- (UIImage)defaultContentImage
{
  return 0;
}

- (UIEdgeInsets)backgroundInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = *MEMORY[0x1E0DC49E8];
  v3 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
  v4 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
  v5 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (void)setBackgroundView:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundView, a3);
}

- (SBHomeScreenMaterialView)materialView
{
  return self->_materialView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_materialView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
}

@end
