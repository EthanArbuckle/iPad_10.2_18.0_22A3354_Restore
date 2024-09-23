@implementation SBIconLabelImageParametersBuilder

- (id)buildParameters
{
  SBMutableIconLabelImageParameters *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  double *v8;
  __int128 v9;
  void *v10;
  uint64_t v11;
  _BOOL8 v12;
  _BOOL8 v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  uint64_t v26;
  __int128 v28;
  __int128 v29;

  if (-[SBIconLabelImageParametersBuilder _hasValidInputs](self, "_hasValidInputs"))
  {
    v3 = objc_alloc_init(SBMutableIconLabelImageParameters);
    -[SBIconLabelImageParametersBuilder overrideText](self, "overrideText");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      v6 = v4;
    }
    else
    {
      -[SBIconLabelImageParametersBuilder text](self, "text");
      v6 = (id)objc_claimAutoreleasedReturnValue();
    }
    v7 = v6;

    v8 = (double *)MEMORY[0x1E0DC49E8];
    v9 = *(_OWORD *)(MEMORY[0x1E0DC49E8] + 16);
    v28 = *MEMORY[0x1E0DC49E8];
    v29 = v9;
    -[SBIconLabelImageParametersBuilder _fontWithLanguageInsets:](self, "_fontWithLanguageInsets:", &v28);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBMutableIconLabelImageParameters setText:](v3, "setText:", v7);
    v11 = objc_msgSend(v7, "sb_containsEmoji");
    -[SBMutableIconLabelImageParameters setContainsEmoji:](v3, "setContainsEmoji:", v11);
    v12 = -[SBIconLabelImageParametersBuilder _canTruncateLabel](self, "_canTruncateLabel");
    -[SBMutableIconLabelImageParameters setCanTruncate:](v3, "setCanTruncate:", v12);
    v13 = -[SBIconLabelImageParametersBuilder _canTightenLabel](self, "_canTightenLabel");
    -[SBMutableIconLabelImageParameters setCanTighten:](v3, "setCanTighten:", v13);
    -[SBIconLabelImageParametersBuilder _maxSize](self, "_maxSize");
    -[SBMutableIconLabelImageParameters setMaxSize:](v3, "setMaxSize:");
    -[SBMutableIconLabelImageParameters setFont:](v3, "setFont:", v10);
    -[SBMutableIconLabelImageParameters setLegibilityStyle:](v3, "setLegibilityStyle:", -[_UILegibilitySettings style](self->_legibilitySettings, "style"));
    -[SBIconLabelImageParametersBuilder scale](self, "scale");
    -[SBMutableIconLabelImageParameters setScale:](v3, "setScale:");
    -[SBMutableIconLabelImageParameters setAccessibilityReduceTransparencyEnabled:](v3, "setAccessibilityReduceTransparencyEnabled:", -[SBIconLabelImageParametersBuilder isAccessibilityReduceTransparencyEnabled](self, "isAccessibilityReduceTransparencyEnabled"));
    -[SBIconLabelImageParametersBuilder contentSizeCategory](self, "contentSizeCategory");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBMutableIconLabelImageParameters setContentSizeCategory:](v3, "setContentSizeCategory:", v14);

    -[SBIconLabelImageParametersBuilder focusHighlightColor](self, "focusHighlightColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBMutableIconLabelImageParameters setFocusHighlightColor:](v3, "setFocusHighlightColor:", v15);

    -[SBIconLabelImageParametersBuilder overrideTraitCollection](self, "overrideTraitCollection");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBIconLabelImageParameters setOverrideTraitCollection:](v3, "setOverrideTraitCollection:", v16);

    if (self->_hasSetTextInsets)
      -[SBIconLabelImageParametersBuilder textInsets](self, "textInsets");
    else
      objc_msgSend((id)objc_opt_class(), "insetsForFont:", v10);
    v21 = v17;
    v22 = v18;
    v23 = v19;
    v24 = v20;
    -[SBIconLabelImageParametersBuilder textColor](self, "textColor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (v25)
      goto LABEL_16;
    if (v12 || v13)
    {
      v22 = 6.0;
      v21 = 0.0;
      v23 = 0.0;
      v24 = 6.0;
      if (!(_DWORD)v11)
      {
LABEL_12:
        objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
        v26 = objc_claimAutoreleasedReturnValue();
LABEL_15:
        v25 = (void *)v26;
LABEL_16:
        -[SBMutableIconLabelImageParameters setTextColor:](v3, "setTextColor:", v25);
        -[SBMutableIconLabelImageParameters setFontLanguageInsets:](v3, "setFontLanguageInsets:", v28, v29);
        -[SBMutableIconLabelImageParameters setTextInsets:](v3, "setTextInsets:", v21, v22, v23, v24);

        return v3;
      }
    }
    else
    {
      v21 = *v8;
      v22 = v8[1];
      v23 = v8[2];
      v24 = v8[3];
      if (!(_DWORD)v11)
        goto LABEL_12;
    }
    -[_UILegibilitySettings primaryColor](self->_legibilitySettings, "primaryColor");
    v26 = objc_claimAutoreleasedReturnValue();
    goto LABEL_15;
  }
  v3 = 0;
  return v3;
}

- (UIColor)textColor
{
  return self->_textColor;
}

- (void)setLegibilitySettings:(id)a3
{
  objc_storeStrong((id *)&self->_legibilitySettings, a3);
}

- (void)setLabelAccessoryType:(int64_t)a3
{
  self->_labelAccessoryType = a3;
}

- (void)setIconView:(id)a3
{
  SBIconView *v5;
  _BOOL4 v6;
  void *v7;
  SBIconView *v8;

  v5 = (SBIconView *)a3;
  if (self->_iconView != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)&self->_iconView, a3);
    -[SBIconLabelImageParametersBuilder setIconViewClass:](self, "setIconViewClass:", objc_opt_class());
    v6 = -[SBIconView displaysIconStatusInLabel](v8, "displaysIconStatusInLabel");
    v5 = v8;
    if (v6)
    {
      -[SBIcon statusDescriptionForLocation:](self->_icon, "statusDescriptionForLocation:", self->_iconLocation);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
        -[SBIconLabelImageParametersBuilder setText:](self, "setText:", v7);

      v5 = v8;
    }
  }

}

- (void)setIconViewClass:(Class)a3
{
  objc_storeStrong((id *)&self->_iconViewClass, a3);
}

- (void)setIcon:(id)a3 forLocation:(id)a4
{
  self->_iconLocation = (NSString *)a4;
  -[SBIconLabelImageParametersBuilder setIcon:](self, "setIcon:", a3);
}

- (void)setIcon:(id)a3
{
  SBIcon *v5;
  void *v6;
  int v7;
  void *v8;
  SBIcon *v9;

  v5 = (SBIcon *)a3;
  if (self->_icon != v5)
  {
    v9 = v5;
    objc_storeStrong((id *)&self->_icon, a3);
    -[SBIconLabelImageParametersBuilder iconView](self, "iconView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "displaysIconStatusInLabel");

    if (!v7
      || (-[SBIcon statusDescriptionForLocation:](v9, "statusDescriptionForLocation:", self->_iconLocation),
          (v8 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
    {
      -[SBIcon displayNameForLocation:](self->_icon, "displayNameForLocation:", self->_iconLocation);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    -[SBIconLabelImageParametersBuilder setText:](self, "setText:", v8);

    v5 = v9;
  }

}

- (void)setText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (void)setFont:(id)a3
{
  objc_storeStrong((id *)&self->_font, a3);
}

- (void)setContentSizeCategory:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (double)scale
{
  return self->_scale;
}

- (NSString)overrideText
{
  return self->_overrideText;
}

- (BOOL)isAccessibilityReduceTransparencyEnabled
{
  return self->_accessibilityReduceTransparencyEnabled;
}

- (UIColor)focusHighlightColor
{
  return self->_focusHighlightColor;
}

- (NSString)contentSizeCategory
{
  return self->_contentSizeCategory;
}

- (CGSize)_maxSize
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGSize result;

  -[SBIconLabelImageParametersBuilder iconView](self, "iconView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "maxLabelSize");
    v6 = v5;
    v8 = v7;
  }
  else
  {
    -[SBIconLabelImageParametersBuilder listLayout](self, "listLayout");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBIconLabelImageParametersBuilder contentSizeCategory](self, "contentSizeCategory");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[objc_class maxLabelSizeForListLayout:contentSizeCategory:options:](self->_iconViewClass, "maxLabelSizeForListLayout:contentSizeCategory:options:", v9, v10, UIAccessibilityIsBoldTextEnabled());
    v6 = v11;
    v8 = v12;

  }
  if (-[SBIconView shouldShowLabelAccessoryView](self->_iconView, "shouldShowLabelAccessoryView"))
  {
    objc_msgSend(v4, "labelAccessoryTotalWidth");
    v14 = v13 + v13;
    if (v6 <= v14)
      v6 = 0.0;
    else
      v6 = v6 - v14;
  }

  v15 = v6;
  v16 = v8;
  result.height = v16;
  result.width = v15;
  return result;
}

- (SBIconView)iconView
{
  return self->_iconView;
}

- (BOOL)_hasValidInputs
{
  return self->_icon && -[NSString length](self->_text, "length") != 0;
}

- (id)_fontWithLanguageInsets:(UIEdgeInsets *)a3
{
  UIFont *font;
  UIFont *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;

  font = self->_font;
  if (font)
  {
    v6 = font;
LABEL_3:
    v7 = v6;
    goto LABEL_6;
  }
  if (!self->_listLayoutProvider)
  {
    objc_msgSend((id)objc_opt_class(), "defaultFontForContentSizeCategory:languageInsets:", self->_contentSizeCategory, 0);
    v6 = (UIFont *)objc_claimAutoreleasedReturnValue();
    goto LABEL_3;
  }
  -[SBIconLabelImageParametersBuilder iconLocation](self, "iconLocation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconLabelImageParametersBuilder contentSizeCategory](self, "contentSizeCategory");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconListLayoutProvider layoutForIconLocation:](self->_listLayoutProvider, "layoutForIconLocation:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "labelFontForContentSizeCategory:options:", v9, UIAccessibilityIsBoldTextEnabled());
  v7 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_6:
  -[SBIconLabelImageParametersBuilder text](self, "text");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_adjustedFontForScripts:forFont:", 3, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 != v12)
  {
    v13 = v12;

    v7 = v13;
  }
  if (a3)
  {
    objc_msgSend((id)objc_opt_class(), "insetsForFont:", v12);
    a3->top = v14;
    a3->left = v15;
    a3->bottom = v16;
    a3->right = v17;
  }

  return v7;
}

+ (UIEdgeInsets)insetsForFont:(id)a3
{
  id v3;
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
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  UIEdgeInsets result;

  v3 = a3;
  if (insetsForFont__onceToken != -1)
    dispatch_once(&insetsForFont__onceToken, &__block_literal_global_15);
  objc_msgSend((id)insetsForFont__cachedInsets, "objectForKey:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "UIEdgeInsetsValue");
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;
  }
  else
  {
    v7 = *MEMORY[0x1E0DC49E8];
    v9 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
    v11 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
    v13 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
    if (v3)
    {
      if (CTFontGetLanguageAwareOutsets())
      {
        v9 = -0.0;
        v7 = -0.0;
        v13 = -0.0;
        v11 = -0.0;
      }
      v14 = (void *)insetsForFont__cachedInsets;
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithUIEdgeInsets:", v7, v9, v11, v13, 0, 0, 0, 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setObject:forKey:", v15, v3);

    }
  }

  v16 = v7;
  v17 = v9;
  v18 = v11;
  v19 = v13;
  result.right = v19;
  result.bottom = v18;
  result.left = v17;
  result.top = v16;
  return result;
}

- (NSString)text
{
  return self->_text;
}

- (BOOL)_canTruncateLabel
{
  return -[SBIcon canTruncateLabel](self->_icon, "canTruncateLabel")
      || -[SBIconLabelImageParametersBuilder labelAccessoryType](self, "labelAccessoryType") != 0;
}

- (BOOL)_canTightenLabel
{
  return -[SBIcon canTightenLabel](self->_icon, "canTightenLabel")
      || -[SBIconLabelImageParametersBuilder _canTruncateLabel](self, "_canTruncateLabel");
}

- (SBIconLabelImageParametersBuilder)init
{
  SBIconLabelImageParametersBuilder *v2;
  void *v3;
  double v4;
  uint64_t v5;
  NSString *contentSizeCategory;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SBIconLabelImageParametersBuilder;
  v2 = -[SBIconLabelImageParametersBuilder init](&v8, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "scale");
    v2->_scale = v4;

    v2->_accessibilityReduceTransparencyEnabled = UIAccessibilityIsReduceTransparencyEnabled();
    objc_msgSend((id)*MEMORY[0x1E0DC4730], "preferredContentSizeCategory");
    v5 = objc_claimAutoreleasedReturnValue();
    contentSizeCategory = v2->_contentSizeCategory;
    v2->_contentSizeCategory = (NSString *)v5;

  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_overrideText, 0);
  objc_storeStrong((id *)&self->_textColor, 0);
  objc_storeStrong((id *)&self->_overrideTraitCollection, 0);
  objc_storeStrong((id *)&self->_focusHighlightColor, 0);
  objc_storeStrong((id *)&self->_contentSizeCategory, 0);
  objc_storeStrong((id *)&self->_legibilitySettings, 0);
  objc_storeStrong((id *)&self->_listLayoutProvider, 0);
  objc_storeStrong((id *)&self->_iconViewClass, 0);
  objc_storeStrong((id *)&self->_iconView, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_font, 0);
}

void __86__SBIconLabelImageParametersBuilder_defaultFontForContentSizeCategory_languageInsets___block_invoke(uint64_t a1)
{
  uint64_t i;
  void *v3;
  uint64_t v4;
  void *v5;

  for (i = 0; i != 5; ++i)
  {
    v3 = (void *)MEMORY[0x1E0DC1350];
    objc_msgSend(*(id *)(a1 + 32), "_normalFontSizeForSizeParameter:", i);
    objc_msgSend(v3, "systemFontOfSize:weight:");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)defaultFontForContentSizeCategory_languageInsets____NormalFontBySizeParameter[i];
    defaultFontForContentSizeCategory_languageInsets____NormalFontBySizeParameter[i] = v4;

  }
}

+ (double)_normalFontSizeForSizeParameter:(int64_t)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v8;
  int v9;
  char v10;
  int v11;
  char v12;
  double v13;
  double v14;
  double v15;
  int64_t v16;
  double *v17;
  int v18;
  char v19;
  int v20;
  int v21;
  char v22;
  double v23;
  BOOL v24;
  double v25;
  double v26;
  int v27;
  double v28;

  if (!__sb__runningInSpringBoard())
  {
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(v3, "userInterfaceIdiom");

    if (v4 != (void *)1)
      goto LABEL_3;
LABEL_6:
    v9 = __sb__runningInSpringBoard();
    v10 = v9;
    if (v9)
    {
      if (SBFEffectiveDeviceClass() != 2)
        goto LABEL_21;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v4, "userInterfaceIdiom") != 1)
      {

        goto LABEL_21;
      }
    }
    v11 = __sb__runningInSpringBoard();
    v12 = v11;
    if (v11)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "_referenceBounds");
    }
    BSSizeRoundForScale();
    v14 = v13;
    v15 = *(double *)(MEMORY[0x1E0DAB260] + 264);
    if ((v12 & 1) == 0)

    if ((v10 & 1) == 0)
    if (v14 >= v15)
    {
      v16 = a3 - 1;
      v8 = 14.0;
      if ((unint64_t)(a3 - 1) >= 4)
        return v8;
      v17 = (double *)&unk_1D0190C88;
      return v17[v16];
    }
LABEL_21:
    v16 = a3 - 1;
    v8 = 13.0;
    if ((unint64_t)(a3 - 1) >= 4)
      return v8;
    v17 = (double *)&unk_1D0190CA8;
    return v17[v16];
  }
  if (SBFEffectiveDeviceClass() == 2)
    goto LABEL_6;
LABEL_3:
  switch(a3)
  {
    case 1:
      return 13.0;
    case 2:
      return 14.0;
    case 3:
      v18 = __sb__runningInSpringBoard();
      v19 = v18;
      if (v18)
      {
        if (SBFEffectiveDeviceClass())
        {
          v8 = 14.0;
          if (SBFEffectiveDeviceClass() != 1)
            return v8;
        }
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = 14.0;
        if (objc_msgSend(v3, "userInterfaceIdiom"))
          goto LABEL_52;
      }
      v21 = __sb__runningInSpringBoard();
      v22 = v21;
      if (v21)
      {
        __sb__mainScreenReferenceBounds();
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "_referenceBounds");
      }
      BSSizeRoundForScale();
      v24 = v23 < *(double *)(MEMORY[0x1E0DAB260] + 56);
      v25 = 14.0;
      v26 = 15.0;
      goto LABEL_46;
    case 4:
      v20 = __sb__runningInSpringBoard();
      v19 = v20;
      if (v20)
      {
        if (SBFEffectiveDeviceClass())
        {
          v8 = 14.0;
          if (SBFEffectiveDeviceClass() != 1)
            return v8;
        }
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = 14.0;
        if (objc_msgSend(v3, "userInterfaceIdiom"))
        {
LABEL_52:

          return v8;
        }
      }
      v27 = __sb__runningInSpringBoard();
      v22 = v27;
      if (v27)
      {
        __sb__mainScreenReferenceBounds();
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "_referenceBounds");
      }
      BSSizeRoundForScale();
      v24 = v28 < *(double *)(MEMORY[0x1E0DAB260] + 56);
      v25 = 14.0;
      v26 = 16.0;
LABEL_46:
      if (v24)
        v8 = v25;
      else
        v8 = v26;
      if ((v22 & 1) == 0)

      if ((v19 & 1) == 0)
        goto LABEL_52;
      return v8;
    default:
      return 12.0;
  }
}

+ (id)defaultFontForContentSizeCategory:(id)a3 languageInsets:(UIEdgeInsets *)a4
{
  id v6;
  id v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  _QWORD block[5];

  v6 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __86__SBIconLabelImageParametersBuilder_defaultFontForContentSizeCategory_languageInsets___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (defaultFontForContentSizeCategory_languageInsets__onceToken != -1)
    dispatch_once(&defaultFontForContentSizeCategory_languageInsets__onceToken, block);
  v7 = (id)defaultFontForContentSizeCategory_languageInsets____NormalFontBySizeParameter[objc_msgSend(a1, "_fontSizeParameterForContentSizeCategory:", v6)];
  if (a4)
  {
    objc_msgSend(a1, "insetsForFont:", v7);
    a4->top = v8;
    a4->left = v9;
    a4->bottom = v10;
    a4->right = v11;
  }

  return v7;
}

+ (int64_t)_fontSizeParameterForContentSizeCategory:(id)a3
{
  NSString *v3;
  NSString *v4;
  NSComparisonResult v5;
  NSComparisonResult v6;
  NSComparisonResult v7;
  int64_t v8;

  v3 = (NSString *)a3;
  v4 = v3;
  if (!v3
    || (v5 = UIContentSizeCategoryCompareToCategory(v3, (UIContentSizeCategory)*MEMORY[0x1E0DC4900]),
        v6 = UIContentSizeCategoryCompareToCategory(v4, (UIContentSizeCategory)*MEMORY[0x1E0DC48F8]),
        v7 = UIContentSizeCategoryCompareToCategory(v4, (UIContentSizeCategory)*MEMORY[0x1E0DC48F0]),
        v5 == NSOrderedAscending))
  {
    v8 = 0;
  }
  else if (v5)
  {
    if (v6)
    {
      if (v7)
        v8 = 4;
      else
        v8 = 3;
    }
    else
    {
      v8 = 2;
    }
  }
  else
  {
    v8 = 1;
  }

  return v8;
}

void __51__SBIconLabelImageParametersBuilder_insetsForFont___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)insetsForFont__cachedInsets;
  insetsForFont__cachedInsets = v0;

}

- (SBIconListLayoutProvider)listLayoutProvider
{
  SBIconListLayoutProvider *v3;

  v3 = self->_listLayoutProvider;
  if (!v3)
  {
    -[SBIconView listLayoutProvider](self->_iconView, "listLayoutProvider");
    v3 = (SBIconListLayoutProvider *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)listLayout
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  -[SBIconLabelImageParametersBuilder iconView](self, "iconView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "listLayout");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[SBIconLabelImageParametersBuilder listLayoutProvider](self, "listLayoutProvider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBIconLabelImageParametersBuilder iconLocation](self, "iconLocation");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v7;
    v5 = 0;
    if (v6 && v7)
    {
      objc_msgSend(v6, "layoutForIconLocation:", v7);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  return v5;
}

- (CGSize)iconImageSize
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  objc_class *v13;
  double v14;
  double v15;
  CGSize result;

  -[SBIconLabelImageParametersBuilder iconView](self, "iconView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
  {
    -[SBIconLabelImageParametersBuilder listLayout](self, "listLayout");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      objc_msgSend(v9, "iconImageInfo");
    }
    else
    {
      v13 = -[SBIconLabelImageParametersBuilder iconViewClass](self, "iconViewClass");
      if (!v13)
      {
        v6 = 0x4059000000000000;
        v8 = 0x4059000000000000;
        goto LABEL_8;
      }
      -[objc_class defaultIconImageSize](v13, "defaultIconImageSize");
    }
    v6 = v11;
    v8 = v12;
LABEL_8:

    goto LABEL_9;
  }
  objc_msgSend(v3, "iconImageSize");
  v6 = v5;
  v8 = v7;
LABEL_9:

  v14 = *(double *)&v6;
  v15 = *(double *)&v8;
  result.height = v15;
  result.width = v14;
  return result;
}

- (UIFont)font
{
  UIFont *v3;

  v3 = self->_font;
  if (!v3)
  {
    -[SBIconLabelImageParametersBuilder _fontWithLanguageInsets:](self, "_fontWithLanguageInsets:", 0);
    v3 = (UIFont *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (void)setTextInsets:(UIEdgeInsets)a3
{
  self->_textInsets = a3;
  self->_hasSetTextInsets = 1;
}

- (SBIcon)icon
{
  return self->_icon;
}

- (Class)iconViewClass
{
  return self->_iconViewClass;
}

- (NSString)iconLocation
{
  return self->_iconLocation;
}

- (void)setListLayoutProvider:(id)a3
{
  objc_storeStrong((id *)&self->_listLayoutProvider, a3);
}

- (_UILegibilitySettings)legibilitySettings
{
  return self->_legibilitySettings;
}

- (void)setAccessibilityReduceTransparencyEnabled:(BOOL)a3
{
  self->_accessibilityReduceTransparencyEnabled = a3;
}

- (void)setFocusHighlightColor:(id)a3
{
  objc_storeStrong((id *)&self->_focusHighlightColor, a3);
}

- (void)setScale:(double)a3
{
  self->_scale = a3;
}

- (int64_t)labelAccessoryType
{
  return self->_labelAccessoryType;
}

- (UITraitCollection)overrideTraitCollection
{
  return self->_overrideTraitCollection;
}

- (void)setOverrideTraitCollection:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (void)setTextColor:(id)a3
{
  objc_storeStrong((id *)&self->_textColor, a3);
}

- (UIEdgeInsets)textInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_textInsets.top;
  left = self->_textInsets.left;
  bottom = self->_textInsets.bottom;
  right = self->_textInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setOverrideText:(id)a3
{
  objc_storeStrong((id *)&self->_overrideText, a3);
}

@end
