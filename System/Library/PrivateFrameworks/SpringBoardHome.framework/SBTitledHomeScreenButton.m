@implementation SBTitledHomeScreenButton

- (SBTitledHomeScreenButton)initWithFrame:(CGRect)a3 backgroundView:(id)a4 type:(int64_t)a5 content:(id)a6
{
  void *v6;
  void *v7;
  double height;
  double width;
  double y;
  double x;
  id v15;
  id v16;
  SBTitledHomeScreenButton *v17;
  SBTitledHomeScreenButton *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  char v25;
  int v26;
  char v27;
  double v28;
  double v29;
  int v30;
  char v31;
  int v32;
  char v33;
  double v34;
  double v35;
  objc_super v37;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v15 = a4;
  v16 = a6;
  v37.receiver = self;
  v37.super_class = (Class)SBTitledHomeScreenButton;
  v17 = -[SBHomeScreenButton initWithFrame:backgroundView:](&v37, sel_initWithFrame_backgroundView_, v15, x, y, width, height);
  v18 = v17;
  if (v17)
  {
    v17->_type = a5;
    objc_storeStrong((id *)&v17->_content, a6);
    objc_msgSend(v15, "layer");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setCornerCurve:", *MEMORY[0x1E0CD2A68]);

    objc_msgSend(MEMORY[0x1E0DC3520], "plainButtonConfiguration");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "background");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setBackgroundColor:", v22);

    -[SBTitledHomeScreenButton setConfiguration:](v18, "setConfiguration:", v20);
    v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3B18]), "initWithDelegate:", v18);
    -[SBTitledHomeScreenButton addInteraction:](v18, "addInteraction:", v23);
    v18->_metrics.minimumButtonWidth = 60.0;
    v24 = __sb__runningInSpringBoard();
    v25 = v24;
    if (v24)
    {
      if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
      {
        v18->_metrics.minimumButtonHeight = 26.0;
        goto LABEL_21;
      }
      if (SBFEffectiveHomeButtonType() != 2)
      {
        v18->_metrics.minimumButtonHeight = 26.0;
        if ((v25 & 1) != 0)
          goto LABEL_21;
        goto LABEL_20;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "userInterfaceIdiom") || SBFEffectiveHomeButtonType() != 2)
      {
        v18->_metrics.minimumButtonHeight = 26.0;
        goto LABEL_20;
      }
    }
    v26 = __sb__runningInSpringBoard();
    v27 = v26;
    if (v26)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "_referenceBounds");
    }
    BSSizeRoundForScale();
    v28 = 26.0;
    if (v29 >= *(double *)(MEMORY[0x1E0DAB260] + 120))
      v28 = 28.0;
    v18->_metrics.minimumButtonHeight = v28;
    if ((v27 & 1) == 0)

    if ((v25 & 1) != 0)
    {
LABEL_21:
      v18->_metrics.minimumHorizontalPadding = 10.0;
      v30 = __sb__runningInSpringBoard();
      v31 = v30;
      if (v30)
      {
        if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
        {
          v18->_metrics.baselineToTop = 18.0;
          goto LABEL_39;
        }
        if (SBFEffectiveHomeButtonType() != 2)
        {
          v18->_metrics.baselineToTop = 18.0;
          goto LABEL_37;
        }
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v6, "userInterfaceIdiom") || SBFEffectiveHomeButtonType() != 2)
        {
          v18->_metrics.baselineToTop = 18.0;
LABEL_38:

          goto LABEL_39;
        }
      }
      v32 = __sb__runningInSpringBoard();
      v33 = v32;
      if (v32)
      {
        __sb__mainScreenReferenceBounds();
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "_referenceBounds");
      }
      BSSizeRoundForScale();
      v34 = 18.0;
      if (v35 >= *(double *)(MEMORY[0x1E0DAB260] + 120))
        v34 = 19.0;
      v18->_metrics.baselineToTop = v34;
      if ((v33 & 1) == 0)

LABEL_37:
      if ((v31 & 1) == 0)
        goto LABEL_38;
LABEL_39:
      *(_OWORD *)&v18->_metrics.preferredTitlePointSize = xmmword_1D0190B70;

      goto LABEL_40;
    }
LABEL_20:

    goto LABEL_21;
  }
LABEL_40:

  return v18;
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
  -[SBTitledHomeScreenButton preferredContentFittingSize](self, "preferredContentFittingSize");
  v7 = v6;
  v9 = v8;
  -[SBTitledHomeScreenButton configuration](self, "configuration");
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

- (id)contentImageWithTitle:(id)a3
{
  id v4;
  id v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  double v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  id v26;
  id v27;
  void *v28;
  void *v29;
  uint64_t v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, void *);
  void *v34;
  id v35;
  id v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _QWORD v48[2];
  _QWORD v49[3];

  v49[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0DC1288]);
  objc_msgSend(v5, "setLineBreakMode:", 4);
  objc_msgSend(v5, "setAlignment:", 0);
  v46 = 0u;
  v47 = 0u;
  v45 = 0u;
  -[SBTitledHomeScreenButton metrics](self, "metrics");
  -[SBTitledHomeScreenButton preferredContentFittingSize](self, "preferredContentFittingSize");
  v7 = v6 - 0.0;
  v8 = 0.0;
  v9 = 0;
  v10 = 0;
  v11 = *MEMORY[0x1E0DC1420];
  v12 = *MEMORY[0x1E0DC1138];
  v13 = *MEMORY[0x1E0DC1178];
  do
  {
    v14 = v10;
    v15 = v9;
    objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:weight:", v8, v11);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v48[0] = v12;
    v48[1] = v13;
    v49[0] = v9;
    v49[1] = v5;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v49, v48, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "sizeWithAttributes:", v10);
    v18 = v17;
    if (v16 <= v7)
      break;
    v8 = v8 + -1.0;
  }
  while (v8 >= *((double *)&v47 + 1));
  v43 = 0.0;
  v44 = 0.0;
  if (v16 <= v7)
    v7 = v16;
  v41 = 0.0;
  v42 = 0.0;
  if (v9 && CTFontGetLanguageAwareOutsets())
  {
    v19 = v44;
    if (v44 < v42)
      v19 = v42;
    v20 = v43;
    if (v43 < v41)
      v20 = v41;
    v21 = v7 + v19 + v19;
    v22 = v18 + v20 + v20;
    v23 = v19 + 0.0;
    v24 = v20 + 0.0;
  }
  else
  {
    v41 = 0.0;
    v42 = 0.0;
    v43 = 0.0;
    v44 = 0.0;
    v24 = 0.0;
    v23 = 0.0;
    v22 = v18;
    v21 = v7;
  }
  v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3828]), "initWithSize:", v21, v22);
  v31 = MEMORY[0x1E0C809B0];
  v32 = 3221225472;
  v33 = __50__SBTitledHomeScreenButton_contentImageWithTitle___block_invoke;
  v34 = &unk_1E8D86628;
  v37 = v23;
  v38 = v24;
  v39 = v7;
  v40 = v18;
  v35 = v4;
  v36 = v10;
  v26 = v10;
  v27 = v4;
  objc_msgSend(v25, "imageWithActions:", &v31);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "imageWithAlignmentRectInsets:", v43, v44, v41, v42, v31, v32, v33, v34);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  return v29;
}

uint64_t __50__SBTitledHomeScreenButton_contentImageWithTitle___block_invoke(uint64_t a1, void *a2)
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

- (id)defaultContentImage
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;

  if (-[SBTitledHomeScreenButton type](self, "type") == 1)
  {
    if (defaultContentImage_onceToken != -1)
      dispatch_once(&defaultContentImage_onceToken, &__block_literal_global_10);
    -[SBTitledHomeScreenButton content](self, "content");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBTitledHomeScreenButton contentImageWithTitle:](self, "contentImageWithTitle:", v3);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)defaultContentImage_image;
    defaultContentImage_image = v4;

  }
  else
  {
    -[SBTitledHomeScreenButton metrics](self, "metrics", 0, 0, 0, 0);
    objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithPointSize:weight:", 5, 0.0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)MEMORY[0x1E0DC3870];
    -[SBTitledHomeScreenButton content](self, "content");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "systemImageNamed:withConfiguration:", v7, v3);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)defaultContentImage_image;
    defaultContentImage_image = v8;

  }
  return (id)defaultContentImage_image;
}

void __47__SBTitledHomeScreenButton_defaultContentImage__block_invoke()
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
  v2 = (id)objc_msgSend(v3, "addObserverForName:object:queue:usingBlock:", v0, 0, v1, &__block_literal_global_15_0);

}

void __47__SBTitledHomeScreenButton_defaultContentImage__block_invoke_2()
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
  -[SBTitledHomeScreenButton bounds](self, "bounds");
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
  SBTitledHomeScreenButton *v7;
  SBTitledHomeScreenButton *v8;
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
  void *v22;
  void *v23;
  double v25;

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D90]), "initWithView:", self);
  objc_msgSend(MEMORY[0x1E0DC3B20], "effectWithPreview:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = self;
  v8 = v7;
  if (v7)
  {
    -[SBTitledHomeScreenButton configuration](v7, "configuration");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "contentInsets");
    v25 = v10;
    v12 = v11;
    v14 = v13;
    v16 = v15;

  }
  else
  {
    v12 = *(double *)(MEMORY[0x1E0DC3298] + 8);
    v25 = *MEMORY[0x1E0DC3298];
    v14 = *(double *)(MEMORY[0x1E0DC3298] + 16);
    v16 = *(double *)(MEMORY[0x1E0DC3298] + 24);
  }
  -[SBHomeScreenButton backgroundView](v8, "backgroundView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "_cornerRadius");

  -[SBTitledHomeScreenButton frame](v8, "frame");
  objc_msgSend(MEMORY[0x1E0DC3B30], "shapeWithRoundedRect:cornerRadius:", SBHDirectionalEdgeInsetsInsetRect(-[SBTitledHomeScreenButton effectiveUserInterfaceLayoutDirection](v8, "effectiveUserInterfaceLayoutDirection"), v18, v19, v20, v21, v25, v12, v14, v16));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3B38], "styleWithEffect:shape:", v6, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
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

- (void)setPreferredContentFittingSize:(CGSize)a3
{
  self->_preferredContentFittingSize = a3;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (SBTitledHomeScreenButtonMetrics)metrics
{
  __int128 v3;

  v3 = *(_OWORD *)&self[17].minimumButtonWidth;
  *(_OWORD *)&retstr->minimumButtonWidth = *(_OWORD *)&self[16].preferredTitlePointSize;
  *(_OWORD *)&retstr->minimumHorizontalPadding = v3;
  *(_OWORD *)&retstr->preferredTitlePointSize = *(_OWORD *)&self[17].minimumHorizontalPadding;
  return self;
}

- (void)setMetrics:(SBTitledHomeScreenButtonMetrics *)a3
{
  __int128 v3;
  __int128 v4;

  v4 = *(_OWORD *)&a3->minimumHorizontalPadding;
  v3 = *(_OWORD *)&a3->preferredTitlePointSize;
  *(_OWORD *)&self->_metrics.minimumButtonWidth = *(_OWORD *)&a3->minimumButtonWidth;
  *(_OWORD *)&self->_metrics.minimumHorizontalPadding = v4;
  *(_OWORD *)&self->_metrics.preferredTitlePointSize = v3;
}

- (NSString)content
{
  return self->_content;
}

- (void)setContent:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 776);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_content, 0);
}

@end
