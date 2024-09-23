@implementation PUPhotoEditTitledNotchButton

- (PUPhotoEditTitledNotchButton)initWithFrame:(CGRect)a3
{
  PUPhotoEditTitledNotchButton *v3;
  PUPhotoEditTitledNotchButton *v4;
  CGSize *p_preferredContentFittingSize;
  objc_class *v6;
  CGFloat v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)PUPhotoEditTitledNotchButton;
  v3 = -[PUPhotoEditLegacyNotchButton initWithFrame:](&v15, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    p_preferredContentFittingSize = &v3->_preferredContentFittingSize;
    objc_msgSend((id)objc_opt_class(), "defaultPreferredContentFittingSize");
    *(_QWORD *)&p_preferredContentFittingSize->width = v6;
    v4->_preferredContentFittingSize.height = v7;
    objc_msgSend(MEMORY[0x1E0DC3520], "plainButtonConfiguration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "background");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setBackgroundColor:", v9);

    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setBaseForegroundColor:", v11);

    -[PUPhotoEditTitledNotchButton setConfiguration:](v4, "setConfiguration:", v8);
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3B18]), "initWithDelegate:", v4);
    -[PUPhotoEditTitledNotchButton addInteraction:](v4, "addInteraction:", v12);
    -[PUPhotoEditLegacyNotchButton setNotchButtonType:](v4, "setNotchButtonType:", 1);
    -[PUPhotoEditTitledNotchButton setShowsLargeContentViewer:](v4, "setShowsLargeContentViewer:", 1);
    v13 = objc_alloc_init(MEMORY[0x1E0DC3998]);
    -[PUPhotoEditTitledNotchButton addInteraction:](v4, "addInteraction:", v13);

  }
  return v4;
}

- (PUPhotoEditTitledNotchButtonMetrics)metrics
{
  double v2;
  double v3;
  double v4;
  double v5;
  PUPhotoEditTitledNotchButtonMetrics result;

  objc_msgSend((id)objc_opt_class(), "defaultMetrics");
  result.var3 = v5;
  result.var2 = v4;
  result.var1 = v3;
  result.var0 = v2;
  return result;
}

- (void)setPreferredContentFittingSize:(CGSize)a3
{
  if (a3.width != self->_preferredContentFittingSize.width || a3.height != self->_preferredContentFittingSize.height)
  {
    self->_preferredContentFittingSize = a3;
    -[PUPhotoEditLegacyNotchButton _didInvalidateContentImageMetrics](self, "_didInvalidateContentImageMetrics");
    -[PUPhotoEditTitledNotchButton invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  }
}

- (void)setFrameFromVisibleFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[PUPhotoEditTitledNotchButton configuration](self, "configuration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "contentInsets");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;

  -[PUPhotoEditTitledNotchButton setFrame:](self, "setFrame:", x - v12, y - v10, width + v12 + v16, height + v10 + v14);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  _BOOL4 v19;
  double v21;
  double v22;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[PUPhotoEditTitledNotchButton preferredContentFittingSize](self, "preferredContentFittingSize");
  v7 = v6;
  v9 = v8;
  -[PUPhotoEditTitledNotchButton configuration](self, "configuration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "contentInsets");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;

  v19 = width == *MEMORY[0x1E0C9D820];
  if (height != *(double *)(MEMORY[0x1E0C9D820] + 8))
    v19 = 0;
  if (height > v16 + v9 + v12 || v19)
    v21 = v16 + v9 + v12;
  else
    v21 = height;
  if (width > v18 + v7 + v14)
    v19 = 1;
  if (v19)
    v22 = v18 + v7 + v14;
  else
    v22 = width;
  result.height = v21;
  result.width = v22;
  return result;
}

- (UIEdgeInsets)alignmentRectInsets
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
  uint64_t v12;
  double v13;
  double v14;
  double v15;
  double v16;
  UIEdgeInsets result;

  -[PUPhotoEditTitledNotchButton configuration](self, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentInsets");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = -[PUPhotoEditTitledNotchButton effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection");
  if (v12)
    v13 = v11;
  else
    v13 = v7;
  if (v12)
    v14 = v7;
  else
    v14 = v11;
  v15 = v5;
  v16 = v9;
  result.right = v14;
  result.bottom = v16;
  result.left = v13;
  result.top = v15;
  return result;
}

- (void)setTitle:(id)a3 forState:(unint64_t)a4 fallbackSymbolName:(id)a5
{
  __CFString *v8;
  id v9;
  uint64_t v10;
  const __CFString *v11;
  id v12;
  uint64_t v13;
  objc_super v14;

  v8 = (__CFString *)a3;
  v9 = a5;
  if (!a4)
  {
    if (setTitle_forState_fallbackSymbolName__onceToken != -1)
      dispatch_once(&setTitle_forState_fallbackSymbolName__onceToken, &__block_literal_global_101715);
    if (-[__CFString length](v8, "length"))
    {
      if (setTitle_forState_fallbackSymbolName__forceFallback)
      {
        v10 = 0;
        v11 = &stru_1E58AD278;
LABEL_7:
        v12 = v9;
LABEL_14:
        -[PUPhotoEditLegacyNotchButton setNotchButtonTitle:](self, "setNotchButtonTitle:", v11);
        -[PUPhotoEditLegacyNotchButton setSymbolName:](self, "setSymbolName:", v12);
        -[PUPhotoEditLegacyNotchButton setNotchButtonType:](self, "setNotchButtonType:", v10);
        -[PUPhotoEditLegacyNotchButton _updateContentImage](self, "_updateContentImage");
        goto LABEL_15;
      }
    }
    else
    {
      v13 = objc_msgSend(v9, "length");
      v10 = 0;
      v11 = &stru_1E58AD278;
      if (v13)
        goto LABEL_7;
      v12 = v9;
      if (setTitle_forState_fallbackSymbolName__forceFallback)
        goto LABEL_14;
    }
    v12 = 0;
    if (v8)
      v11 = v8;
    else
      v11 = &stru_1E58AD278;
    v10 = 1;
    goto LABEL_14;
  }
LABEL_15:
  v14.receiver = self;
  v14.super_class = (Class)PUPhotoEditTitledNotchButton;
  -[PUPhotoEditTitledNotchButton setTitle:forState:](&v14, sel_setTitle_forState_, &stru_1E58AD278, a4);

}

- (id)contentImageWithTitle:(id)a3
{
  id v4;
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
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  id v28;
  id v29;
  void *v30;
  void *v31;
  uint64_t v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, void *);
  void *v36;
  id v37;
  id v38;
  double v39;
  double v40;
  __int128 v41;
  double v42;
  double v43;
  double v44;
  double v45;
  __int128 v46;
  id v47;
  __int128 v48;

  v4 = a3;
  -[PUPhotoEditTitledNotchButton metrics](self, "metrics");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[PUPhotoEditTitledNotchButton preferredContentFittingSize](self, "preferredContentFittingSize");
  v14 = v13 - v8;
  v48 = *MEMORY[0x1E0C9D820];
  v47 = 0;
  objc_msgSend((id)objc_opt_class(), "_bestFontForTitle:inMaximumWidth:withMetrics:titleSize:fontAttributes:", v4, &v48, &v47, v13 - v8, v6, v8, v10, v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v47;
  -[PUPhotoEditTitledNotchButton textColor](self, "textColor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    if (v16)
      v18 = (id)objc_msgSend(v16, "mutableCopy");
    else
      v18 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v19 = v18;
    -[PUPhotoEditTitledNotchButton textColor](self, "textColor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setObject:forKeyedSubscript:", v20, *MEMORY[0x1E0DC1140]);

    v16 = v19;
  }
  v21 = *(double *)&v48;
  if (*(double *)&v48 > v14)
  {
    *(double *)&v48 = v14;
    v21 = v14;
  }
  v22 = *((double *)&v48 + 1);
  v46 = v48;
  v44 = 0.0;
  v45 = 0.0;
  v42 = 0.0;
  v43 = 0.0;
  if (v15 && CTFontGetLanguageAwareOutsets())
  {
    v23 = v45;
    if (v45 < v43)
      v23 = v43;
    v24 = v44;
    if (v44 < v42)
      v24 = v42;
    v21 = v21 + v23 + v23;
    v22 = v22 + v24 + v24;
    v25 = v23 + 0.0;
    v26 = v24 + 0.0;
  }
  else
  {
    v42 = 0.0;
    v43 = 0.0;
    v44 = 0.0;
    v45 = 0.0;
    v26 = 0.0;
    v25 = 0.0;
  }
  v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3828]), "initWithSize:", v21, v22);
  v33 = MEMORY[0x1E0C809B0];
  v34 = 3221225472;
  v35 = __54__PUPhotoEditTitledNotchButton_contentImageWithTitle___block_invoke;
  v36 = &unk_1E58AAB90;
  v39 = v25;
  v40 = v26;
  v41 = v46;
  v37 = v4;
  v38 = v16;
  v28 = v16;
  v29 = v4;
  objc_msgSend(v27, "imageWithActions:", &v33);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "imageWithAlignmentRectInsets:", v44, v45, v42, v43, v33, v34, v35, v36);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  return v31;
}

- (void)setTextColor:(id)a3
{
  objc_storeStrong((id *)&self->_textColor, a3);
  -[PUPhotoEditLegacyNotchButton _updateContentImage](self, "_updateContentImage");
}

- (id)defaultContentImage
{
  void *v3;
  uint64_t v4;
  void *v5;
  double v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;

  if (-[PUPhotoEditLegacyNotchButton notchButtonType](self, "notchButtonType") == 1)
  {
    if (defaultContentImage_onceToken != -1)
      dispatch_once(&defaultContentImage_onceToken, &__block_literal_global_92_101708);
    -[PUPhotoEditLegacyNotchButton notchButtonTitle](self, "notchButtonTitle");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPhotoEditTitledNotchButton contentImageWithTitle:](self, "contentImageWithTitle:", v3);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)defaultContentImage_image;
    defaultContentImage_image = v4;
  }
  else
  {
    -[PUPhotoEditTitledNotchButton metrics](self, "metrics");
    objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithPointSize:weight:", 5, v6);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)MEMORY[0x1E0DC3870];
    -[PUPhotoEditLegacyNotchButton symbolName](self, "symbolName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "systemImageNamed:withConfiguration:", v8, v3);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)defaultContentImage_image;
    defaultContentImage_image = v9;

    v11 = (void *)defaultContentImage_image;
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "imageWithTintColor:renderingMode:", v5, 1);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)defaultContentImage_image;
    defaultContentImage_image = v12;

  }
  return (id)defaultContentImage_image;
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  void *v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;

  v6 = (void *)MEMORY[0x1E0DC3B28];
  v7 = a5;
  -[PUPhotoEditTitledNotchButton bounds](self, "bounds");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  objc_msgSend(v7, "identifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "regionWithRect:identifier:", v16, v9, v11, v13, v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  void *v5;
  void *v6;
  PUPhotoEditTitledNotchButton *v7;
  PUPhotoEditTitledNotchButton *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  uint64_t v28;
  double v29;
  double v30;
  void *v31;
  void *v32;
  double v34;

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D90]), "initWithView:", self);
  objc_msgSend(MEMORY[0x1E0DC3B20], "effectWithPreview:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = self;
  v8 = v7;
  if (v7)
  {
    -[PUPhotoEditTitledNotchButton configuration](v7, "configuration");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "contentInsets");
    v11 = v10;
    v13 = v12;
    v34 = v14;
    v16 = v15;

  }
  else
  {
    v11 = *MEMORY[0x1E0DC3298];
    v13 = *(double *)(MEMORY[0x1E0DC3298] + 8);
    v16 = *(double *)(MEMORY[0x1E0DC3298] + 24);
    v34 = *(double *)(MEMORY[0x1E0DC3298] + 16);
  }
  -[PUPhotoEditLegacyNotchButton backgroundView](v8, "backgroundView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "_cornerRadius");
  v19 = v18;

  -[PUPhotoEditTitledNotchButton frame](v8, "frame");
  v21 = v20;
  v23 = v22;
  v25 = v24;
  v27 = v26;
  v28 = -[PUPhotoEditTitledNotchButton effectiveUserInterfaceLayoutDirection](v8, "effectiveUserInterfaceLayoutDirection");
  if (v28)
    v29 = v16;
  else
    v29 = v13;
  if (v28)
    v30 = v13;
  else
    v30 = v16;
  objc_msgSend(MEMORY[0x1E0DC3B30], "shapeWithRoundedRect:cornerRadius:", v21 + v29, v11 + v23, v25 - (v29 + v30), v27 - (v11 + v34), v19);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3B38], "styleWithEffect:shape:", v6, v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  return v32;
}

- (id)largeContentImage
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[PUPhotoEditLegacyNotchButton symbolName](self, "symbolName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0DC3870];
    -[PUPhotoEditLegacyNotchButton symbolName](self, "symbolName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_systemImageNamed:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (UIColor)textColor
{
  return self->_textColor;
}

- (CGSize)preferredContentFittingSize
{
  double width;
  double height;
  CGSize result;

  width = self->_preferredContentFittingSize.width;
  height = self->_preferredContentFittingSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textColor, 0);
}

void __51__PUPhotoEditTitledNotchButton_defaultContentImage__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v0 = *MEMORY[0x1E0DC44D0];
  objc_msgSend(MEMORY[0x1E0CB3828], "mainQueue");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (id)objc_msgSend(v3, "addObserverForName:object:queue:usingBlock:", v0, 0, v1, &__block_literal_global_96);

}

void __51__PUPhotoEditTitledNotchButton_defaultContentImage__block_invoke_2()
{
  void *v0;

  v0 = (void *)defaultContentImage_image;
  defaultContentImage_image = 0;

}

uint64_t __54__PUPhotoEditTitledNotchButton_contentImageWithTitle___block_invoke(uint64_t a1, void *a2)
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

  objc_msgSend(a2, "format");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scale");
  UIRectIntegralWithScale();
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  return objc_msgSend(*(id *)(a1 + 32), "drawWithRect:options:attributes:context:", 1, *(_QWORD *)(a1 + 40), 0, v5, v7, v9, v11);
}

void __69__PUPhotoEditTitledNotchButton_setTitle_forState_fallbackSymbolName___block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  setTitle_forState_fallbackSymbolName__forceFallback = objc_msgSend(v0, "BOOLForKey:", CFSTR("NSDoubleLocalizedStrings"));

}

+ (PUPhotoEditTitledNotchButtonMetrics)defaultMetrics
{
  double v2;
  double v3;
  double v4;
  double v5;
  PUPhotoEditTitledNotchButtonMetrics result;

  v2 = 60.0;
  v3 = 10.0;
  v4 = 15.0;
  v5 = 9.0;
  result.var3 = v5;
  result.var2 = v4;
  result.var1 = v3;
  result.var0 = v2;
  return result;
}

+ (CGSize)defaultPreferredContentFittingSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 68.0;
  v3 = 28.0;
  result.height = v3;
  result.width = v2;
  return result;
}

+ (id)bestFontForTitle:(id)a3 fittingInWidth:(double)a4
{
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;

  v6 = a3;
  objc_msgSend(a1, "defaultMetrics");
  objc_msgSend(a1, "_bestFontForTitle:inMaximumWidth:withMetrics:titleSize:fontAttributes:", v6, 0, 0, a4 - v7, v8, v7, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)_bestFontForTitle:(id)a3 inMaximumWidth:(double)a4 withMetrics:(PUPhotoEditTitledNotchButtonMetrics)a5 titleSize:(CGSize *)a6 fontAttributes:(id *)a7
{
  double var3;
  double var2;
  id v12;
  id v13;
  void *v14;
  void *v15;
  double v16;
  CGFloat v17;
  double v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id *v24;
  _QWORD v25[2];
  _QWORD v26[3];

  var3 = a5.var3;
  var2 = a5.var2;
  v26[2] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = objc_alloc_init(MEMORY[0x1E0DC1288]);
  objc_msgSend(v13, "setLineBreakMode:", 4);
  objc_msgSend(v13, "setAlignment:", 0);
  if (var2 >= var3)
  {
    v24 = a7;
    v15 = 0;
    v14 = 0;
    v18 = *MEMORY[0x1E0DC1420];
    v19 = *MEMORY[0x1E0DC1138];
    v20 = *MEMORY[0x1E0DC1178];
    do
    {
      v21 = v14;
      v22 = v15;
      objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:weight:", var2, v18, v24);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v25[0] = v19;
      v25[1] = v20;
      v26[0] = v15;
      v26[1] = v13;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 2);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v12, "sizeWithAttributes:", v14);
      if (v16 <= a4)
        break;
      var2 = var2 + -1.0;
    }
    while (var2 >= var3);
    a7 = v24;
    if (!a6)
      goto LABEL_9;
    goto LABEL_8;
  }
  v14 = 0;
  v15 = 0;
  v16 = *MEMORY[0x1E0C9D820];
  v17 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  if (a6)
  {
LABEL_8:
    a6->width = v16;
    a6->height = v17;
  }
LABEL_9:
  if (a7)
    *a7 = objc_retainAutorelease(v14);

  return v15;
}

+ (int64_t)editingTitledButtonType
{
  return 1;
}

@end
