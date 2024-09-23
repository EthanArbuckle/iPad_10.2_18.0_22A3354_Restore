@implementation PREditingButton

- (PREditingButton)initWithStyle:(int64_t)a3 frame:(CGRect)a4 primaryAction:(id)a5
{
  PREditingButton *v6;
  PREditingButton *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  objc_super v19;
  _QWORD v20[4];

  v20[3] = *MEMORY[0x1E0C80C00];
  v19.receiver = self;
  v19.super_class = (Class)PREditingButton;
  v6 = -[PREditingButton initWithFrame:primaryAction:](&v19, sel_initWithFrame_primaryAction_, a5, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  v7 = v6;
  if (v6)
  {
    v6->_style = a3;
    -[PREditingButton setClipsToBounds:](v6, "setClipsToBounds:", 1);
    objc_msgSend(MEMORY[0x1E0DC3520], "plainButtonConfiguration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "background");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setBackgroundColor:", v10);

    -[PREditingButton setConfiguration:](v7, "setConfiguration:", v8);
    objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2BB8]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setName:", CFSTR("highlightBrightness"));
    objc_msgSend(v11, "setValue:forKey:", &unk_1E21DD1D8, CFSTR("inputAmount"));
    objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2C00]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setName:", CFSTR("highlightSaturation"));
    objc_msgSend(v12, "setValue:forKey:", &unk_1E21DD1E8, CFSTR("inputAmount"));
    objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2E60]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setName:", CFSTR("enabledMultiplyColor"));
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v13, "setValue:forKeyPath:", objc_msgSend(v14, "CGColor"), CFSTR("inputColor"));

    -[PREditingButton layer](v7, "layer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v11;
    v20[1] = v12;
    v20[2] = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 3);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setFilters:", v16);

    -[PREditingButton layer](v7, "layer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setAllowsGroupOpacity:", 0);

  }
  return v7;
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
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
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  int64_t v23;
  UIView *backgroundColorView;
  void *v25;
  PREditingButtonMaterialView *materialView;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  MTMaterialView *v34;
  MTMaterialView *backgroundView;
  MTMaterialView *v36;
  objc_class *v37;
  void *v38;
  void *v39;
  PREditingButtonMaterialView *v40;
  MTMaterialView *v41;
  void *v42;
  PREditingButtonMaterialView *v43;
  PREditingButtonMaterialView *v44;
  PREditingButtonMaterialView *v45;
  void *v46;
  id v47;
  UIView *v48;
  UIView *v49;
  void *v50;
  void *v51;
  void *v52;
  UIImageView *v53;
  UIImageView *contentImageView;
  void *v55;
  UIImageView *v56;
  UIView *v57;
  double v58;
  double v59;
  double v60;
  double v61;
  void *v62;
  objc_super v63;
  _QWORD v64[3];
  _QWORD v65[4];
  CGRect v66;

  v65[3] = *MEMORY[0x1E0C80C00];
  v63.receiver = self;
  v63.super_class = (Class)PREditingButton;
  -[PREditingButton layoutSubviews](&v63, sel_layoutSubviews);
  -[PREditingButton configuration](self, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentInsets");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[PREditingButton bounds](self, "bounds");
  v16 = PRDirectionalEdgeInsetsInsetRect(-[PREditingButton effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection"), v12, v13, v14, v15, v5, v7, v9, v11);
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v23 = -[PREditingButton style](self, "style");
  if ((unint64_t)(v23 - 1) >= 2)
  {
    if (!v23)
    {
      materialView = self->_materialView;
      if (!materialView)
      {
        -[PREditingButton traitCollection](self, "traitCollection");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v27)
        {
          objc_msgSend(MEMORY[0x1E0DC3E88], "traitCollectionWithUserInterfaceStyle:", 0);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(MEMORY[0x1E0DC3E88], "traitCollectionWithUserInterfaceStyle:", 0);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v64[0] = v28;
        v65[0] = CFSTR("editingButtonLight");
        objc_msgSend(MEMORY[0x1E0DC3E88], "traitCollectionWithUserInterfaceStyle:", 1);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v64[1] = v29;
        v65[1] = CFSTR("editingButtonLight");
        objc_msgSend(MEMORY[0x1E0DC3E88], "traitCollectionWithUserInterfaceStyle:", 2);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v64[2] = v30;
        v65[2] = CFSTR("editingButtonDark");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v65, v64, 3);
        v31 = (void *)objc_claimAutoreleasedReturnValue();

        v32 = (void *)MEMORY[0x1E0D47498];
        PRBundle();
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "materialViewWithRecipeNamesByTraitCollection:inBundle:options:initialWeighting:scaleAdjustment:compatibleWithTraitCollection:", v31, v33, 0, 0, v27, 1.0);
        v34 = (MTMaterialView *)objc_claimAutoreleasedReturnValue();
        backgroundView = self->_backgroundView;
        self->_backgroundView = v34;

        v36 = self->_backgroundView;
        objc_opt_self();
        v37 = (objc_class *)objc_claimAutoreleasedReturnValue();
        NSStringFromClass(v37);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        -[MTMaterialView setGroupNameBase:](v36, "setGroupNameBase:", v38);

        -[MTMaterialView layer](self->_backgroundView, "layer");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "setCornerCurve:", *MEMORY[0x1E0CD2A68]);

        v40 = [PREditingButtonMaterialView alloc];
        v41 = self->_backgroundView;
        -[PREditingButton defaultContentImage](self, "defaultContentImage");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = -[PREditingButtonMaterialView initWithFrame:backgroundView:foregroundImage:](v40, "initWithFrame:backgroundView:foregroundImage:", v41, v42, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
        v44 = self->_materialView;
        self->_materialView = v43;

        -[PREditingButtonMaterialView setUserInteractionEnabled:](self->_materialView, "setUserInteractionEnabled:", 0);
        v45 = self->_materialView;
        -[PREditingButton backgroundInsets](self, "backgroundInsets");
        -[PREditingButtonMaterialView setBackgroundInsets:](v45, "setBackgroundInsets:");
        -[PREditingButton addSubview:](self, "addSubview:", self->_materialView);

        materialView = self->_materialView;
      }
      -[PREditingButtonMaterialView setFrame:](materialView, "setFrame:", v16, v18, v20, v22);
    }
  }
  else
  {
    backgroundColorView = self->_backgroundColorView;
    if (!backgroundColorView)
    {
      if (v23 == 1)
      {
        objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.596078431, 0.596078431, 0.615686275, 0.9);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
      }
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = objc_alloc(MEMORY[0x1E0DC3F10]);
      v48 = (UIView *)objc_msgSend(v47, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
      v49 = self->_backgroundColorView;
      self->_backgroundColorView = v48;

      -[UIView setUserInteractionEnabled:](self->_backgroundColorView, "setUserInteractionEnabled:", 0);
      -[UIView setBackgroundColor:](self->_backgroundColorView, "setBackgroundColor:", v25);
      -[UIView layer](self->_backgroundColorView, "layer");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "setCornerCurve:", *MEMORY[0x1E0CD2A68]);

      -[PREditingButton addSubview:](self, "addSubview:", self->_backgroundColorView);
      -[PREditingButton defaultContentImage](self, "defaultContentImage");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "imageWithRenderingMode:", 2);
      v52 = (void *)objc_claimAutoreleasedReturnValue();

      v53 = (UIImageView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v52);
      contentImageView = self->_contentImageView;
      self->_contentImageView = v53;

      -[UIImageView setTintColor:](self->_contentImageView, "setTintColor:", v46);
      -[UIView addSubview:](self->_backgroundColorView, "addSubview:", self->_contentImageView);

      backgroundColorView = self->_backgroundColorView;
    }
    -[UIView setFrame:](backgroundColorView, "setFrame:", v16, v18, v20, v22);
    -[UIView layer](self->_backgroundColorView, "layer");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView bounds](self->_backgroundColorView, "bounds");
    objc_msgSend(v55, "setCornerRadius:", CGRectGetHeight(v66) * 0.5);

    v56 = self->_contentImageView;
    v57 = self->_backgroundColorView;
    -[UIView center](v57, "center");
    v59 = v58;
    v61 = v60;
    -[UIView superview](self->_backgroundColorView, "superview");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView convertPoint:fromView:](v57, "convertPoint:fromView:", v62, v59, v61);
    -[UIImageView setCenter:](v56, "setCenter:");

  }
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
  v5 = -[PREditingButton isHighlighted](self, "isHighlighted");
  v13.receiver = self;
  v13.super_class = (Class)PREditingButton;
  -[PREditingButton setHighlighted:](&v13, sel_setHighlighted_, v3);
  if (v5 != v3)
  {
    -[PREditingButton layer](self, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v3)
    {
      objc_msgSend(v6, "setValue:forKeyPath:", &unk_1E21DD1F8, CFSTR("filters.highlightBrightness.inputAmount"));
      -[PREditingButton traitCollection](self, "traitCollection");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "userInterfaceStyle");

      if (v9 == 2)
        objc_msgSend(v7, "setValue:forKeyPath:", &unk_1E21DD208, CFSTR("filters.highlightSaturation.inputAmount"));
    }
    else
    {
      v10 = (void *)MEMORY[0x1E0DC3F10];
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __34__PREditingButton_setHighlighted___block_invoke;
      v11[3] = &unk_1E2184010;
      v12 = v6;
      objc_msgSend(v10, "animateWithDuration:delay:options:animations:completion:", 2, v11, 0, 0.3, 0.0);

    }
  }
}

uint64_t __34__PREditingButton_setHighlighted___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setValue:forKeyPath:", &unk_1E21DD1D8, CFSTR("filters.highlightBrightness.inputAmount"));
  return objc_msgSend(*(id *)(a1 + 32), "setValue:forKeyPath:", &unk_1E21DD1E8, CFSTR("filters.highlightSaturation.inputAmount"));
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
  v5 = -[PREditingButton isEnabled](self, "isEnabled");
  v15.receiver = self;
  v15.super_class = (Class)PREditingButton;
  -[PREditingButton setEnabled:](&v15, sel_setEnabled_, v3);
  if (v5 != v3)
  {
    -[PREditingButton layer](self, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 0.5;
    if (v3)
      v7 = 1.0;
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)MEMORY[0x1E0DC3F10];
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __30__PREditingButton_setEnabled___block_invoke;
    v12[3] = &unk_1E2183900;
    v13 = v6;
    v14 = v8;
    v10 = v8;
    v11 = v6;
    objc_msgSend(v9, "animateWithDuration:delay:options:animations:completion:", 2, v12, 0, 0.3, 0.0);

  }
}

uint64_t __30__PREditingButton_setEnabled___block_invoke(uint64_t a1)
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
    v7.super_class = (Class)PREditingButton;
    v5 = -[PREditingButton _shouldAnimatePropertyWithKey:](&v7, sel__shouldAnimatePropertyWithKey_, v4);
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

- (void)_didInvalidateContentImageMetrics
{
  PREditingButtonMaterialView *materialView;
  void *v4;

  materialView = self->_materialView;
  -[PREditingButton defaultContentImage](self, "defaultContentImage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PREditingButtonMaterialView setForegroundImage:](materialView, "setForegroundImage:", v4);

  -[PREditingButton setNeedsLayout](self, "setNeedsLayout");
  -[PREditingButton layoutIfNeeded](self, "layoutIfNeeded");
}

- (int64_t)style
{
  return self->_style;
}

- (MTMaterialView)backgroundView
{
  return self->_backgroundView;
}

- (void)setBackgroundView:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundView, a3);
}

- (PREditingButtonMaterialView)materialView
{
  return self->_materialView;
}

- (UIView)backgroundColorView
{
  return self->_backgroundColorView;
}

- (UIImageView)contentImageView
{
  return self->_contentImageView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentImageView, 0);
  objc_storeStrong((id *)&self->_backgroundColorView, 0);
  objc_storeStrong((id *)&self->_materialView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
}

@end
