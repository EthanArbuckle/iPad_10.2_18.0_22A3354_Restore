@implementation SBFolderTitleTextField

- (CGRect)borderRectForBounds:(CGRect)a3
{
  return CGRectInset(a3, 0.0, 4.0);
}

- (CGRect)_textRectForBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double MaxX;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  double v21;
  CGFloat v22;
  double v23;
  double v24;
  CGFloat MinX;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  CGFloat rect;
  CGFloat v32;
  CGFloat v33;
  CGFloat v34;
  objc_super v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v35.receiver = self;
  v35.super_class = (Class)SBFolderTitleTextField;
  -[SBFolderTitleTextField textRectForBounds:](&v35, sel_textRectForBounds_);
  MaxX = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  if (-[SBFolderTitleTextField allowsEditing](self, "allowsEditing"))
  {
    v33 = v15;
    v34 = v11;
    -[SBFolderTitleTextField clearButtonRectForBounds:](self, "clearButtonRectForBounds:", x, y, width, height);
    v17 = v16;
    v19 = v18;
    v32 = v20;
    v22 = v21;
    if (objc_msgSend((id)*MEMORY[0x1E0DC4730], "userInterfaceLayoutDirection") == 1)
    {
      v36.origin.x = v17;
      v36.origin.y = v19;
      v36.size.width = v32;
      v36.size.height = v22;
      rect = v22;
      MaxX = CGRectGetMaxX(v36);
      v37.origin.x = x;
      v37.origin.y = y;
      v37.size.width = width;
      v37.size.height = height;
      v23 = CGRectGetWidth(v37);
      v38.origin.x = v17;
      v38.origin.y = v19;
      v38.size.width = v32;
      v38.size.height = rect;
      v13 = v23 + CGRectGetMaxX(v38) * -2.0;
      v15 = v33;
      v11 = v34;
    }
    else
    {
      v39.origin.x = x;
      v39.origin.y = y;
      v39.size.width = width;
      v39.size.height = height;
      v24 = CGRectGetWidth(v39);
      v40.origin.x = v17;
      v40.origin.y = v19;
      v40.size.width = v32;
      v40.size.height = v22;
      MinX = CGRectGetMinX(v40);
      v41.size.height = v22;
      MaxX = v24 - MinX;
      v41.origin.x = v17;
      v41.origin.y = v19;
      v41.size.width = v32;
      v26 = CGRectGetMinX(v41);
      v42.origin.x = MaxX;
      v11 = v34;
      v42.origin.y = v34;
      v42.size.width = v13;
      v42.size.height = v33;
      v13 = v26 - CGRectGetMinX(v42);
      v15 = v33;
    }
  }
  v27 = MaxX;
  v28 = v11;
  v29 = v13;
  v30 = v15;
  result.size.height = v30;
  result.size.width = v29;
  result.origin.y = v28;
  result.origin.x = v27;
  return result;
}

- (CGRect)clearButtonRectForBounds:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v7;
  double v8;
  double v9;
  double v10;
  objc_super v11;
  CGRect v12;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v11.receiver = self;
  v11.super_class = (Class)SBFolderTitleTextField;
  -[SBFolderTitleTextField clearButtonRectForBounds:](&v11, sel_clearButtonRectForBounds_);
  if (objc_msgSend((id)*MEMORY[0x1E0DC4730], "userInterfaceLayoutDirection") != 1)
  {
    v12.origin.x = x;
    v12.origin.y = y;
    v12.size.width = width;
    v12.size.height = height;
    CGRectGetMaxX(v12);
  }
  UIRectCenteredYInRectScale();
  result.size.height = v10;
  result.size.width = v9;
  result.origin.y = v8;
  result.origin.x = v7;
  return result;
}

- (BOOL)allowsEditing
{
  return self->_allowsEditing;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  _BOOL4 v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  objc_super v12;
  CGSize result;

  v12.receiver = self;
  v12.super_class = (Class)SBFolderTitleTextField;
  -[SBFolderTitleTextField sizeThatFits:](&v12, sel_sizeThatFits_, a3.width, a3.height);
  v4 = v3;
  v6 = v5;
  if (__sb__runningInSpringBoard())
  {
    v7 = SBFEffectiveDeviceClass() == 2;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v8, "userInterfaceIdiom") == 1;

  }
  v9 = 13.0;
  if (v7)
    v9 = 15.0;
  v10 = v6 + v9;
  v11 = v4;
  result.height = v10;
  result.width = v11;
  return result;
}

- (void)setShowsEditUI:(BOOL)a3 animated:(BOOL)a4
{
  double v6;
  void *v7;
  _QWORD v8[5];
  _QWORD v9[5];
  _QWORD v10[5];

  if (self->_showingEditUI != a3)
  {
    if (a4)
      v6 = 0.25;
    else
      v6 = 0.0;
    if (a3)
    {
      -[SBFolderTitleTextField setClearButtonMode:](self, "setClearButtonMode:", 3);
      -[SBFolderTitleTextField _clearButton](self, "_clearButton");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setAlpha:", 0.0);

      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __50__SBFolderTitleTextField_setShowsEditUI_animated___block_invoke;
      v10[3] = &unk_1E8D84C50;
      v10[4] = self;
      objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:", v10, v6);
    }
    else
    {
      v8[4] = self;
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __50__SBFolderTitleTextField_setShowsEditUI_animated___block_invoke_2;
      v9[3] = &unk_1E8D84C50;
      v9[4] = self;
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __50__SBFolderTitleTextField_setShowsEditUI_animated___block_invoke_3;
      v8[3] = &unk_1E8D84F68;
      objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:completion:", v9, v8, v6);
    }
    self->_showingEditUI = a3;
  }
}

- (void)setLegibilitySettings:(id)a3
{
  id v5;

  v5 = a3;
  if ((-[_UILegibilitySettings isEqual:](self->_legibilitySettings, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_legibilitySettings, a3);
    -[SBFolderTitleTextField _updateLegibility](self, "_updateLegibility");
  }

}

- (void)setFontSize:(double)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:weight:", a3, *MEMORY[0x1E0DC1440]);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SBFolderTitleTextField setFont:](self, "setFont:", v4);

}

- (void)setAllowsEditing:(BOOL)a3
{
  self->_allowsEditing = a3;
}

- (SBFolderTitleTextField)initWithFrame:(CGRect)a3
{
  SBFolderTitleTextField *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SBFolderTitleTextField;
  v3 = -[SBFolderTitleTextField initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBFolderTitleTextField setTextColor:](v3, "setTextColor:", v4);

    -[SBFolderTitleTextField setClearButtonMode:](v3, "setClearButtonMode:", 0);
    -[SBFolderTitleTextField setTextAlignment:](v3, "setTextAlignment:", 1);
    -[SBFolderTitleTextField setReturnKeyType:](v3, "setReturnKeyType:", 9);
    -[SBFolderTitleTextField setAdjustsFontSizeToFitWidth:](v3, "setAdjustsFontSizeToFitWidth:", 1);
    -[SBFolderTitleTextField setMinimumFontSize:](v3, "setMinimumFontSize:", 20.0);
    -[SBFolderTitleTextField setKeyboardAppearance:](v3, "setKeyboardAppearance:", 1);
    -[SBFolderTitleTextField setBorderStyle:](v3, "setBorderStyle:", 3);
    -[SBFolderTitleTextField _setRoundedRectBackgroundCornerRadius:](v3, "_setRoundedRectBackgroundCornerRadius:", 14.0);
    -[SBFolderTitleTextField _clearButton](v3, "_clearButton");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "_clearButtonImage");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setImage:forState:", v6, 0);

    -[SBFolderTitleTextField _updateLegibility](v3, "_updateLegibility");
    -[SBFolderTitleTextField layoutIfNeeded](v3, "layoutIfNeeded");
    -[SBFolderTitleTextField _backgroundView](v3, "_backgroundView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAlpha:", 0.0);

  }
  return v3;
}

- (void)_updateLegibility
{
  _UILegibilitySettings *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;

  v3 = self->_legibilitySettings;
  -[_UILegibilitySettings primaryColor](v3, "primaryColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBFolderTitleTextField setTextColor:](self, "setTextColor:", v4);

  -[SBFolderTitleTextField _clearButton](self, "_clearButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UILegibilitySettings primaryColor](v3, "primaryColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "colorWithAlphaComponent:", 0.6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTintColor:", v7);

  v8 = -[_UILegibilitySettings style](v3, "style");
  -[SBFolderTitleTextField _backgroundView](self, "_backgroundView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v9;
  if (v8 == 2)
    v10 = 1;
  else
    v10 = 2;
  objc_msgSend(v9, "setOverrideUserInterfaceStyle:", v10);

}

+ (id)_clearButtonImage
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithPointSize:weight:", 4, 19.0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:withConfiguration:", CFSTR("xmark.circle.fill"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (void)warmupIfNecessary
{
  id v2;

  v2 = (id)objc_msgSend(a1, "_clearButtonImage");
}

void __50__SBFolderTitleTextField_setShowsEditUI_animated___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "_backgroundView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", 0.4);

  objc_msgSend(*(id *)(a1 + 32), "_clearButton");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAlpha:", 1.0);

}

void __50__SBFolderTitleTextField_setShowsEditUI_animated___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "_backgroundView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", 0.0);

  objc_msgSend(*(id *)(a1 + 32), "_clearButton");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAlpha:", 0.0);

}

uint64_t __50__SBFolderTitleTextField_setShowsEditUI_animated___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setClearButtonMode:", 0);
}

- (double)fontSize
{
  void *v2;
  double v3;
  double v4;

  -[SBFolderTitleTextField font](self, "font");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pointSize");
  v4 = v3;

  return v4;
}

- (BOOL)canBecomeFocused
{
  return 0;
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  id v6;
  BOOL v7;
  void *v8;

  v6 = a5;
  v7 = -[SBFolderTitleTextField showingEditUI](self, "showingEditUI");
  v8 = v6;
  if (!v7)
  {

    v8 = 0;
  }

  return v8;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x1E0DC3B30];
  -[SBFolderTitleTextField font](self, "font", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lineHeight");
  objc_msgSend(v4, "beamWithPreferredLength:axis:", 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3B38], "styleWithShape:constrainedAxes:", v6, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (_UILegibilitySettings)legibilitySettings
{
  return self->_legibilitySettings;
}

- (BOOL)showingEditUI
{
  return self->_showingEditUI;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_legibilitySettings, 0);
}

@end
