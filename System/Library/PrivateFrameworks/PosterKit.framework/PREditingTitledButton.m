@implementation PREditingTitledButton

- (PREditingTitledButton)initWithFrame:(CGRect)a3
{
  PREditingTitledButton *v3;
  PREditingTitledButton *v4;
  CGSize *p_preferredContentFittingSize;
  objc_class *v6;
  CGFloat v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)PREditingTitledButton;
  v3 = -[PREditingTitledButton initWithFrame:](&v13, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    p_preferredContentFittingSize = &v3->_preferredContentFittingSize;
    objc_msgSend((id)objc_opt_class(), "defaultPreferredContentFittingSize");
    *(_QWORD *)&p_preferredContentFittingSize->width = v6;
    v4->_preferredContentFittingSize.height = v7;
    objc_msgSend(MEMORY[0x1E0DC3520], "plainButtonConfiguration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "background");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setBackgroundColor:", v10);

    -[PREditingTitledButton setConfiguration:](v4, "setConfiguration:", v8);
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3B18]), "initWithDelegate:", v4);
    -[PREditingTitledButton addInteraction:](v4, "addInteraction:", v11);

  }
  return v4;
}

- (PREditingTitledButtonMetrics)metrics
{
  double v2;
  double v3;
  double v4;
  double v5;
  PREditingTitledButtonMetrics result;

  objc_msgSend((id)objc_opt_class(), "defaultMetrics");
  result.var3 = v5;
  result.var2 = v4;
  result.var1 = v3;
  result.var0 = v2;
  return result;
}

+ (PREditingTitledButtonMetrics)defaultMetrics
{
  double v2;
  double v3;
  double v4;
  double v5;
  PREditingTitledButtonMetrics result;

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

- (void)setPreferredContentFittingSize:(CGSize)a3
{
  if (a3.width != self->_preferredContentFittingSize.width || a3.height != self->_preferredContentFittingSize.height)
  {
    self->_preferredContentFittingSize = a3;
    -[PREditingButton _didInvalidateContentImageMetrics](self, "_didInvalidateContentImageMetrics");
    -[PREditingTitledButton invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  }
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
  -[PREditingTitledButton configuration](self, "configuration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "contentInsets");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;

  -[PREditingTitledButton setFrame:](self, "setFrame:", x - v12, y - v10, width + v12 + v16, height + v10 + v14);
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
  -[PREditingTitledButton preferredContentFittingSize](self, "preferredContentFittingSize");
  v7 = v6;
  v9 = v8;
  -[PREditingTitledButton configuration](self, "configuration");
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
  UIEdgeInsets result;

  -[PREditingTitledButton configuration](self, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentInsets");

  -[PREditingTitledButton effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection");
  PRDirectionalEdgeInsetsGetEdgeInsets();
  result.right = v7;
  result.bottom = v6;
  result.left = v5;
  result.top = v4;
  return result;
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
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  uint64_t v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, void *);
  void *v32;
  id v33;
  id v34;
  double v35;
  double v36;
  __int128 v37;
  double v38;
  double v39;
  double v40;
  double v41;
  __int128 v42;
  id v43;
  __int128 v44;

  v4 = a3;
  -[PREditingTitledButton metrics](self, "metrics");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[PREditingTitledButton preferredContentFittingSize](self, "preferredContentFittingSize");
  v14 = v13 - v8;
  v44 = *MEMORY[0x1E0C9D820];
  v43 = 0;
  objc_msgSend((id)objc_opt_class(), "_bestFontForTitle:inMaximumWidth:withMetrics:titleSize:fontAttributes:", v4, &v44, &v43, v13 - v8, v6, v8, v10, v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v43;
  v17 = *(double *)&v44;
  if (*(double *)&v44 > v14)
  {
    *(double *)&v44 = v14;
    v17 = v14;
  }
  v18 = *((double *)&v44 + 1);
  v42 = v44;
  v40 = 0.0;
  v41 = 0.0;
  v38 = 0.0;
  v39 = 0.0;
  if (v15 && CTFontGetLanguageAwareOutsets())
  {
    v19 = v41;
    if (v41 < v39)
      v19 = v39;
    v20 = v40;
    if (v40 < v38)
      v20 = v38;
    v17 = v17 + v19 + v19;
    v18 = v18 + v20 + v20;
    v21 = v19 + 0.0;
    v22 = v20 + 0.0;
  }
  else
  {
    v38 = 0.0;
    v39 = 0.0;
    v40 = 0.0;
    v41 = 0.0;
    v22 = 0.0;
    v21 = 0.0;
  }
  v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3828]), "initWithSize:", v17, v18);
  v29 = MEMORY[0x1E0C809B0];
  v30 = 3221225472;
  v31 = __47__PREditingTitledButton_contentImageWithTitle___block_invoke;
  v32 = &unk_1E2184038;
  v35 = v21;
  v36 = v22;
  v37 = v42;
  v33 = v4;
  v34 = v16;
  v24 = v16;
  v25 = v4;
  objc_msgSend(v23, "imageWithActions:", &v29);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "imageWithAlignmentRectInsets:", v40, v41, v38, v39, v29, v30, v31, v32);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  return v27;
}

uint64_t __47__PREditingTitledButton_contentImageWithTitle___block_invoke(uint64_t a1, void *a2)
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

+ (id)_bestFontForTitle:(id)a3 inMaximumWidth:(double)a4 withMetrics:(PREditingTitledButtonMetrics)a5 titleSize:(CGSize *)a6 fontAttributes:(id *)a7
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

+ (NSString)editingTitledButtonTitle
{
  return (NSString *)&stru_1E2186E08;
}

+ (NSString)editingTitledButtonSymbolName
{
  return (NSString *)&stru_1E2186E08;
}

+ (id)editingTitledButtonSymbolName:(BOOL)a3
{
  return &stru_1E2186E08;
}

- (id)defaultContentImage
{
  void *v3;
  uint64_t v4;
  void *v5;
  double v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;

  if (objc_msgSend((id)objc_opt_class(), "editingTitledButtonType") == 1)
  {
    if (defaultContentImage_onceToken != -1)
      dispatch_once(&defaultContentImage_onceToken, &__block_literal_global_10);
    objc_msgSend((id)objc_opt_class(), "editingTitledButtonTitle");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[PREditingTitledButton contentImageWithTitle:](self, "contentImageWithTitle:", v3);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)defaultContentImage_image;
    defaultContentImage_image = v4;
  }
  else
  {
    -[PREditingTitledButton metrics](self, "metrics");
    objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithPointSize:weight:", 5, v6);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    v9 = (void *)objc_opt_class();
    if (v7 == v8)
      objc_msgSend(v9, "editingTitledButtonSymbolName:", -[PREditingTitledButton isSelected](self, "isSelected"));
    else
      objc_msgSend(v9, "editingTitledButtonSymbolName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:withConfiguration:", v5, v3);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)defaultContentImage_image;
    defaultContentImage_image = v10;

    v12 = (void *)defaultContentImage_image;
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "imageWithTintColor:renderingMode:", v13, 1);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)defaultContentImage_image;
    defaultContentImage_image = v14;

  }
  return (id)defaultContentImage_image;
}

void __44__PREditingTitledButton_defaultContentImage__block_invoke()
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
  v2 = (id)objc_msgSend(v3, "addObserverForName:object:queue:usingBlock:", v0, 0, v1, &__block_literal_global_99);

}

void __44__PREditingTitledButton_defaultContentImage__block_invoke_2()
{
  void *v0;

  v0 = (void *)defaultContentImage_image;
  defaultContentImage_image = 0;

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
  -[PREditingTitledButton bounds](self, "bounds");
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
  int64_t v5;
  uint64_t v6;
  void *v7;
  PREditingTitledButton *v8;
  PREditingTitledButton *v9;
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
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  double v29;

  v5 = -[PREditingButton style](self, "style", a3, a4);
  if ((unint64_t)(v5 - 1) < 2)
  {
    -[PREditingButton backgroundColorView](self, "backgroundColorView");
    v6 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v7 = (void *)v6;
    goto LABEL_7;
  }
  if (!v5)
  {
    -[PREditingButton backgroundView](self, "backgroundView");
    v6 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  v7 = 0;
LABEL_7:
  v8 = self;
  v9 = v8;
  if (v8)
  {
    -[PREditingTitledButton configuration](v8, "configuration");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "contentInsets");
    v29 = v11;
    v13 = v12;
    v15 = v14;
    v17 = v16;

  }
  else
  {
    v13 = *(double *)(MEMORY[0x1E0DC3298] + 8);
    v29 = *MEMORY[0x1E0DC3298];
    v15 = *(double *)(MEMORY[0x1E0DC3298] + 16);
    v17 = *(double *)(MEMORY[0x1E0DC3298] + 24);
  }
  objc_msgSend(v7, "_cornerRadius");
  -[PREditingTitledButton bounds](v9, "bounds");
  objc_msgSend(MEMORY[0x1E0DC3508], "_bezierPathWithPillRect:cornerRadius:", PRDirectionalEdgeInsetsInsetRect(-[PREditingTitledButton effectiveUserInterfaceLayoutDirection](v9, "effectiveUserInterfaceLayoutDirection"), v18, v19, v20, v21, v29, v13, v15, v17));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_alloc_init(MEMORY[0x1E0DC3B78]);
  objc_msgSend(v23, "setShadowPath:", v22);
  v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D90]), "initWithView:parameters:", v9, v23);
  objc_msgSend(MEMORY[0x1E0DC3B20], "effectWithPreview:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3B30], "shapeWithPath:", v22);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3B38], "styleWithEffect:shape:", v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  return v27;
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

@end
