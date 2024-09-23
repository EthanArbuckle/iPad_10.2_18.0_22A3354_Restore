@implementation PUPhotoEditLegacyNotchButton

- (PUPhotoEditLegacyNotchButton)initWithFrame:(CGRect)a3
{
  PUPhotoEditLegacyNotchButton *v3;
  PUPhotoEditLegacyNotchButton *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PUPhotoEditLegacyNotchButton;
  v3 = -[PUPhotoEditLegacyNotchButton initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[PUPhotoEditLegacyNotchButton setClipsToBounds:](v3, "setClipsToBounds:", 1);
    objc_msgSend(MEMORY[0x1E0DC3520], "plainButtonConfiguration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPhotoEditLegacyNotchButton setConfiguration:](v4, "setConfiguration:", v5);

  }
  return v4;
}

- (void)layoutSubviews
{
  PUPhotoEditButtonMaterialView *v3;
  MTMaterialView *backgroundView;
  void *v5;
  PUPhotoEditButtonMaterialView *v6;
  PUPhotoEditButtonMaterialView *materialView;
  PUPhotoEditButtonMaterialView *v8;
  void *v9;
  void *v10;
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
  double v23;
  double v24;
  double v25;
  double v26;
  uint64_t v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  id v34;
  uint64_t v35;
  void *v36;
  objc_super v37;

  v37.receiver = self;
  v37.super_class = (Class)PUPhotoEditLegacyNotchButton;
  -[PUPhotoEditLegacyNotchButton layoutSubviews](&v37, sel_layoutSubviews);
  if (!self->_materialView)
  {
    v3 = [PUPhotoEditButtonMaterialView alloc];
    backgroundView = self->_backgroundView;
    -[PUPhotoEditLegacyNotchButton defaultContentImage](self, "defaultContentImage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[PUPhotoEditButtonMaterialView initWithFrame:backgroundView:foregroundImage:](v3, "initWithFrame:backgroundView:foregroundImage:", backgroundView, v5, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    materialView = self->_materialView;
    self->_materialView = v6;

    -[PUPhotoEditButtonMaterialView setUserInteractionEnabled:](self->_materialView, "setUserInteractionEnabled:", 0);
    v8 = self->_materialView;
    -[PUPhotoEditLegacyNotchButton backgroundInsets](self, "backgroundInsets");
    -[PUPhotoEditButtonMaterialView setBackgroundInsets:](v8, "setBackgroundInsets:");
    -[PUPhotoEditLegacyNotchButton backgroundColor](self, "backgroundColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPhotoEditButtonMaterialView setBackgroundColor:](self->_materialView, "setBackgroundColor:", v9);

    -[PUPhotoEditButtonMaterialView setBackgroundEnabled:](self->_materialView, "setBackgroundEnabled:", -[PUPhotoEditLegacyNotchButton isEnabled](self, "isEnabled"));
    -[PUPhotoEditLegacyNotchButton addSubview:](self, "addSubview:", self->_materialView);
  }
  -[PUPhotoEditLegacyNotchButton configuration](self, "configuration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "contentInsets");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;

  -[PUPhotoEditLegacyNotchButton bounds](self, "bounds");
  v20 = v19;
  v22 = v21;
  v24 = v23;
  v26 = v25;
  v27 = -[PUPhotoEditLegacyNotchButton effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection");
  if (v27)
    v28 = v18;
  else
    v28 = v14;
  if (v27)
    v29 = v14;
  else
    v29 = v18;
  v30 = v20 + v28;
  v31 = v12 + v22;
  v32 = v24 - (v28 + v29);
  v33 = v26 - (v12 + v16);
  -[PUPhotoEditButtonMaterialView setFrame:](self->_materialView, "setFrame:", v30, v31, v32, v33);
  objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithOvalInRect:", v30, v31, v32, v33);
  v34 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v35 = objc_msgSend(v34, "CGPath");

  -[PUPhotoEditLegacyNotchButton layer](self, "layer");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setShadowPath:", v35);

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
  v5 = -[PUPhotoEditLegacyNotchButton isHighlighted](self, "isHighlighted");
  v13.receiver = self;
  v13.super_class = (Class)PUPhotoEditLegacyNotchButton;
  -[PUPhotoEditLegacyNotchButton setHighlighted:](&v13, sel_setHighlighted_, v3);
  if (v5 != v3)
  {
    -[PUPhotoEditLegacyNotchButton layer](self, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v3)
    {
      objc_msgSend(v6, "setValue:forKeyPath:", &unk_1E59BC750, CFSTR("filters.highlightBrightness.inputAmount"));
      -[PUPhotoEditLegacyNotchButton traitCollection](self, "traitCollection");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "userInterfaceStyle");

      if (v9 == 2)
        objc_msgSend(v7, "setValue:forKeyPath:", &unk_1E59BC760, CFSTR("filters.highlightSaturation.inputAmount"));
    }
    else
    {
      v10 = (void *)MEMORY[0x1E0DC3F10];
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __47__PUPhotoEditLegacyNotchButton_setHighlighted___block_invoke;
      v11[3] = &unk_1E58ABD10;
      v12 = v6;
      objc_msgSend(v10, "animateWithDuration:delay:options:animations:completion:", 2, v11, 0, 0.3, 0.0);

    }
  }
}

- (void)setEnabled:(BOOL)a3
{
  _BOOL8 v3;
  int v5;
  objc_super v6;

  v3 = a3;
  v5 = -[PUPhotoEditLegacyNotchButton isEnabled](self, "isEnabled");
  v6.receiver = self;
  v6.super_class = (Class)PUPhotoEditLegacyNotchButton;
  -[PUPhotoEditLegacyNotchButton setEnabled:](&v6, sel_setEnabled_, v3);
  if (v5 != v3)
    -[PUPhotoEditButtonMaterialView setBackgroundEnabled:](self->_materialView, "setBackgroundEnabled:", v3);
}

- (void)setBackgroundColor:(id)a3
{
  void *v5;
  id v6;

  objc_storeStrong((id *)&self->_backgroundColor, a3);
  v6 = a3;
  -[PUPhotoEditLegacyNotchButton materialView](self, "materialView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", v6);

  -[PUPhotoEditButtonMaterialView setBackgroundEnabled:](self->_materialView, "setBackgroundEnabled:", -[PUPhotoEditLegacyNotchButton isEnabled](self, "isEnabled"));
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
    v7.super_class = (Class)PUPhotoEditLegacyNotchButton;
    v5 = -[PUPhotoEditLegacyNotchButton _shouldAnimatePropertyWithKey:](&v7, sel__shouldAnimatePropertyWithKey_, v4);
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

- (void)_updateContentImage
{
  PUPhotoEditButtonMaterialView *materialView;
  id v3;

  materialView = self->_materialView;
  -[PUPhotoEditLegacyNotchButton defaultContentImage](self, "defaultContentImage");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[PUPhotoEditButtonMaterialView setForegroundImage:](materialView, "setForegroundImage:", v3);

}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (MTMaterialView)backgroundView
{
  return self->_backgroundView;
}

- (void)setBackgroundView:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundView, a3);
}

- (PUPhotoEditButtonMaterialView)materialView
{
  return self->_materialView;
}

- (NSString)notchButtonTitle
{
  return self->_notchButtonTitle;
}

- (void)setNotchButtonTitle:(id)a3
{
  objc_storeStrong((id *)&self->_notchButtonTitle, a3);
}

- (NSString)symbolName
{
  return self->_symbolName;
}

- (void)setSymbolName:(id)a3
{
  objc_storeStrong((id *)&self->_symbolName, a3);
}

- (int64_t)notchButtonType
{
  return self->_notchButtonType;
}

- (void)setNotchButtonType:(int64_t)a3
{
  self->_notchButtonType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_symbolName, 0);
  objc_storeStrong((id *)&self->_notchButtonTitle, 0);
  objc_storeStrong((id *)&self->_materialView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
}

uint64_t __47__PUPhotoEditLegacyNotchButton_setHighlighted___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setValue:forKeyPath:", &unk_1E59BC770, CFSTR("filters.highlightBrightness.inputAmount"));
  return objc_msgSend(*(id *)(a1 + 32), "setValue:forKeyPath:", &unk_1E59BC780, CFSTR("filters.highlightSaturation.inputAmount"));
}

@end
