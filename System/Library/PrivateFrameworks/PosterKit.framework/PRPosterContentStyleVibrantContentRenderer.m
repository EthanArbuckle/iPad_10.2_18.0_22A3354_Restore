@implementation PRPosterContentStyleVibrantContentRenderer

- (PRPosterContentStyleVibrantContentRenderer)initWithVibrancyView:(id)a3 contentView:(id)a4 contentBoundingRect:(CGRect)a5 styleBoundingRect:(CGRect)a6 initialAppearance:(id)a7
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  id v19;
  id v20;
  id v21;
  PRPosterContentStyleVibrantContentRenderer *v22;
  PRPosterContentStyleVibrantContentRenderer *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  objc_super v33;
  CGRect v34;
  CGRect v35;

  height = a6.size.height;
  width = a6.size.width;
  y = a6.origin.y;
  x = a6.origin.x;
  v12 = a5.size.height;
  v13 = a5.size.width;
  v14 = a5.origin.y;
  v15 = a5.origin.x;
  v19 = a3;
  v20 = a4;
  v21 = a7;
  v33.receiver = self;
  v33.super_class = (Class)PRPosterContentStyleVibrantContentRenderer;
  v22 = -[PRPosterContentStyleVibrantContentRenderer init](&v33, sel_init);
  v23 = v22;
  if (v22)
  {
    objc_storeStrong((id *)&v22->_vibrancyView, a3);
    objc_storeStrong((id *)&v23->_contentView, a4);
    v34.origin.x = v15;
    v34.origin.y = v14;
    v34.size.width = v13;
    v34.size.height = v12;
    if (CGRectIsEmpty(v34))
    {
      objc_msgSend(v20, "bounds");
      v15 = v24;
      v14 = v25;
      v13 = v26;
      v12 = v27;
    }
    v23->_contentBoundingRect.origin.x = v15;
    v23->_contentBoundingRect.origin.y = v14;
    v23->_contentBoundingRect.size.width = v13;
    v23->_contentBoundingRect.size.height = v12;
    v35.origin.x = x;
    v35.origin.y = y;
    v35.size.width = width;
    v35.size.height = height;
    if (CGRectIsEmpty(v35))
    {
      objc_msgSend(v20, "bounds");
      x = v28;
      y = v29;
      width = v30;
      height = v31;
    }
    v23->_styleBoundingRect.origin.x = x;
    v23->_styleBoundingRect.origin.y = y;
    v23->_styleBoundingRect.size.width = width;
    v23->_styleBoundingRect.size.height = height;
    objc_storeStrong((id *)&v23->_currentAppearance, a7);
  }

  return v23;
}

- (void)setContentBoundingRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (!CGRectEqualToRect(a3, self->_contentBoundingRect))
  {
    self->_contentBoundingRect.origin.x = x;
    self->_contentBoundingRect.origin.y = y;
    self->_contentBoundingRect.size.width = width;
    self->_contentBoundingRect.size.height = height;
    -[_PRContentStyleGradientView setFrame:](self->_gradientView, "setFrame:", x, y, width, height);
  }
}

- (void)setStyleBoundingRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (!CGRectEqualToRect(a3, self->_styleBoundingRect))
  {
    self->_styleBoundingRect.origin.x = x;
    self->_styleBoundingRect.origin.y = y;
    self->_styleBoundingRect.size.width = width;
    self->_styleBoundingRect.size.height = height;
  }
}

- (id)privateStyleForStyle:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  if (objc_msgSend(v3, "conformsToProtocol:", &unk_1EDFFA810))
    v4 = v3;
  else
    v4 = 0;

  return v4;
}

- (void)removeGradientIfNeeded
{
  _PRContentStyleGradientView *gradientView;

  -[_PRContentStyleGradientView removeFromSuperview](self->_gradientView, "removeFromSuperview");
  gradientView = self->_gradientView;
  self->_gradientView = 0;

}

- (void)updateForVibrantStyle:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  PRPosterColor *v9;
  void *v10;
  PRPosterColor *v11;
  PRPosterAppearance *v12;
  void *v13;
  PRPosterAppearance *v14;
  PRPosterAppearance *currentAppearance;
  id v16;

  v4 = (objc_class *)MEMORY[0x1E0D01958];
  v5 = a3;
  v6 = [v4 alloc];
  v7 = objc_msgSend(v5, "vibrancyEffectType");
  objc_msgSend(v5, "vibrancyEffectColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (id)objc_msgSend(v6, "initWithEffectType:backgroundType:color:", v7, 0, v8);
  -[BSUIVibrancyEffectView setIsEnabled:](self->_vibrancyView, "setIsEnabled:", 1);
  -[BSUIVibrancyEffectView setConfiguration:](self->_vibrancyView, "setConfiguration:", v16);
  v9 = [PRPosterColor alloc];
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[PRPosterColor initWithColor:](v9, "initWithColor:", v10);

  if (self->_currentAppearance)
  {
    v12 = [PRPosterAppearance alloc];
    -[PRPosterAppearance font](self->_currentAppearance, "font");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[PRPosterAppearance initWithFont:labelColor:preferredTitleAlignment:preferredTitleLayout:](v12, "initWithFont:labelColor:preferredTitleAlignment:preferredTitleLayout:", v13, v11, -[PRPosterAppearance preferredTitleAlignment](self->_currentAppearance, "preferredTitleAlignment"), -[PRPosterAppearance preferredTitleLayout](self->_currentAppearance, "preferredTitleLayout"));

    currentAppearance = self->_currentAppearance;
    self->_currentAppearance = v14;

  }
}

- (void)renderDiscreteColorStyle:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  PRPosterColor *v7;
  void *v8;
  PRPosterColor *v9;
  PRPosterAppearance *v10;
  void *v11;
  PRPosterAppearance *v12;
  PRPosterAppearance *currentAppearance;
  id v14;

  v14 = a3;
  -[PRPosterContentStyleVibrantContentRenderer removeGradientIfNeeded](self, "removeGradientIfNeeded");
  -[PRPosterContentStyleVibrantContentRenderer privateStyleForStyle:](self, "privateStyleForStyle:", v14);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4 && objc_msgSend(v4, "desiresVibrancyEffectView"))
  {
    -[PRPosterContentStyleVibrantContentRenderer updateForVibrantStyle:](self, "updateForVibrantStyle:", v5);
  }
  else
  {
    if ((objc_msgSend(v14, "allowsVariation") & 1) != 0)
      objc_msgSend(v14, "variationAppliedColors");
    else
      objc_msgSend(v14, "colors");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[BSUIVibrancyEffectView setIsEnabled:](self->_vibrancyView, "setIsEnabled:", 0);
    v7 = [PRPosterColor alloc];
    objc_msgSend(v6, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[PRPosterColor initWithColor:](v7, "initWithColor:", v8);

    if (self->_currentAppearance)
    {
      v10 = [PRPosterAppearance alloc];
      -[PRPosterAppearance font](self->_currentAppearance, "font");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = -[PRPosterAppearance initWithFont:labelColor:preferredTitleAlignment:preferredTitleLayout:](v10, "initWithFont:labelColor:preferredTitleAlignment:preferredTitleLayout:", v11, v9, -[PRPosterAppearance preferredTitleAlignment](self->_currentAppearance, "preferredTitleAlignment"), -[PRPosterAppearance preferredTitleLayout](self->_currentAppearance, "preferredTitleLayout"));

      currentAppearance = self->_currentAppearance;
      self->_currentAppearance = v12;

    }
  }

}

- (void)renderVibrantMaterialStyle:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PRPosterContentStyleVibrantContentRenderer removeGradientIfNeeded](self, "removeGradientIfNeeded");
  -[PRPosterContentStyleVibrantContentRenderer privateStyleForStyle:](self, "privateStyleForStyle:", v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  -[PRPosterContentStyleVibrantContentRenderer updateForVibrantStyle:](self, "updateForVibrantStyle:", v5);
}

- (void)renderVibrantMonochromeStyle:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PRPosterContentStyleVibrantContentRenderer removeGradientIfNeeded](self, "removeGradientIfNeeded");
  -[PRPosterContentStyleVibrantContentRenderer privateStyleForStyle:](self, "privateStyleForStyle:", v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  -[PRPosterContentStyleVibrantContentRenderer updateForVibrantStyle:](self, "updateForVibrantStyle:", v5);
}

- (void)renderGradientStyle:(id)a3
{
  PRPosterColor *v4;
  void *v5;
  PRPosterColor *v6;
  PRPosterAppearance *v7;
  void *v8;
  PRPosterAppearance *v9;
  PRPosterAppearance *currentAppearance;
  void *v11;
  void *v12;
  _BOOL4 IsVertical;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v18;
  double MinY;
  double v20;
  double MinX;
  double v22;
  void *v23;
  void *v24;
  _PRContentStyleGradientView *v25;
  void *v26;
  uint64_t v27;
  _QWORD *v28;
  _QWORD *v29;
  _BOOL4 v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  _PRContentStyleGradientView *gradientView;
  _PRContentStyleGradientView *v44;
  id v45;
  _QWORD v46[8];

  v45 = a3;
  -[PRPosterContentStyleVibrantContentRenderer removeGradientIfNeeded](self, "removeGradientIfNeeded");
  -[BSUIVibrancyEffectView setIsEnabled:](self->_vibrancyView, "setIsEnabled:", 0);
  v4 = [PRPosterColor alloc];
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PRPosterColor initWithColor:](v4, "initWithColor:", v5);

  if (self->_currentAppearance)
  {
    v7 = [PRPosterAppearance alloc];
    -[PRPosterAppearance font](self->_currentAppearance, "font");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[PRPosterAppearance initWithFont:labelColor:preferredTitleAlignment:preferredTitleLayout:](v7, "initWithFont:labelColor:preferredTitleAlignment:preferredTitleLayout:", v8, v6, -[PRPosterAppearance preferredTitleAlignment](self->_currentAppearance, "preferredTitleAlignment"), -[PRPosterAppearance preferredTitleLayout](self->_currentAppearance, "preferredTitleLayout"));

    currentAppearance = self->_currentAppearance;
    self->_currentAppearance = v9;

  }
  objc_msgSend(v45, "colors");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bs_map:", &__block_literal_global_166);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  IsVertical = PRPosterTitleLayoutIsVertical(-[PRPosterAppearance preferredTitleLayout](self->_currentAppearance, "preferredTitleLayout"));
  x = self->_contentBoundingRect.origin.x;
  y = self->_contentBoundingRect.origin.y;
  width = self->_contentBoundingRect.size.width;
  height = self->_contentBoundingRect.size.height;
  if (IsVertical)
  {
    v18 = CGRectGetHeight(*(CGRect *)&x);
    MinY = CGRectGetMinY(self->_contentBoundingRect);
    v20 = CGRectGetHeight(self->_styleBoundingRect);
    MinX = CGRectGetMinY(self->_styleBoundingRect);
  }
  else
  {
    v18 = CGRectGetWidth(*(CGRect *)&x);
    MinY = CGRectGetMinX(self->_contentBoundingRect);
    v20 = CGRectGetWidth(self->_styleBoundingRect);
    MinX = CGRectGetMinX(self->_styleBoundingRect);
  }
  if (v20 >= v18)
    v20 = v18;
  if (MinX >= MinY)
    v22 = MinX;
  else
    v22 = MinY;
  objc_msgSend(v45, "locations");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v46[0] = MEMORY[0x1E0C809B0];
  v46[1] = 3221225472;
  v46[2] = __66__PRPosterContentStyleVibrantContentRenderer_renderGradientStyle___block_invoke_2;
  v46[3] = &__block_descriptor_64_e18__16__0__NSNumber_8l;
  *(double *)&v46[4] = v20;
  *(double *)&v46[5] = v22;
  *(double *)&v46[6] = MinY;
  *(double *)&v46[7] = v18;
  objc_msgSend(v23, "bs_map:", v46);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = -[_PRContentStyleGradientView initWithFrame:]([_PRContentStyleGradientView alloc], "initWithFrame:", self->_contentBoundingRect.origin.x, self->_contentBoundingRect.origin.y, self->_contentBoundingRect.size.width, self->_contentBoundingRect.size.height);
  -[_PRContentStyleGradientView layer](v25, "layer");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setCompositingFilter:", *MEMORY[0x1E0CD2EC0]);

  v27 = objc_msgSend(v45, "gradientType");
  v28 = (_QWORD *)MEMORY[0x1E0CD2F50];
  v29 = (_QWORD *)MEMORY[0x1E0CD2F58];
  if (v27 != 1)
    v29 = (_QWORD *)MEMORY[0x1E0CD2F48];
  if (v27 != 2)
    v28 = v29;
  -[_PRContentStyleGradientView setColors:locations:type:](v25, "setColors:locations:type:", v12, v24, *v28);
  v30 = PRPosterTitleLayoutIsVertical(-[PRPosterAppearance preferredTitleLayout](self->_currentAppearance, "preferredTitleLayout"));
  objc_msgSend(v45, "startPoint");
  v33 = v32;
  if (v30)
  {
    objc_msgSend(v45, "startPoint");
    v35 = v34;
    objc_msgSend(v45, "endPoint");
    v37 = v36;
    objc_msgSend(v45, "endPoint");
    v39 = v38;
  }
  else
  {
    v40 = v31;
    v35 = v32;
    objc_msgSend(v45, "endPoint");
    v37 = v41;
    v39 = v42;
    v33 = v40;
  }
  -[_PRContentStyleGradientView setStartPoint:endPoint:](v25, "setStartPoint:endPoint:", v33, v35, v37, v39);
  gradientView = self->_gradientView;
  self->_gradientView = v25;
  v44 = v25;

  -[UIView addSubview:](self->_contentView, "addSubview:", v44);
}

uint64_t __66__PRPosterContentStyleVibrantContentRenderer_renderGradientStyle___block_invoke(int a1, id a2)
{
  return objc_msgSend(objc_retainAutorelease(a2), "CGColor");
}

id __66__PRPosterContentStyleVibrantContentRenderer_renderGradientStyle___block_invoke_2(double *a1, void *a2)
{
  id v3;
  float v4;
  id v6;
  void *v7;

  v3 = a2;
  objc_msgSend(v3, "floatValue");
  if (v4 == 0.0 || v4 == 1.0)
  {
    v6 = v3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (a1[5] - a1[6] + a1[4] * v4) / a1[7]);
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  return v7;
}

- (void)renderLUTStyle:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[PRPosterContentStyleVibrantContentRenderer removeGradientIfNeeded](self, "removeGradientIfNeeded");
  if (self->_extensionBundleURL)
  {
    -[BSUIVibrancyEffectView setIsEnabled:](self->_vibrancyView, "setIsEnabled:", 1);
    v4 = objc_alloc(MEMORY[0x1E0D01968]);
    objc_msgSend(v8, "lutIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v4, "initWithIdentifier:bundleURL:", v5, self->_extensionBundleURL);

    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D01958]), "initWithEffectType:backgroundType:color:groupName:blendConfiguration:blendAmount:alternativeVibrancyEffectLUT:", 3, 0, 0, 0, 0, v6, 0.0);
    -[BSUIVibrancyEffectView setConfiguration:](self->_vibrancyView, "setConfiguration:", v7);

  }
}

- (NSURL)extensionBundleURL
{
  return self->_extensionBundleURL;
}

- (void)setExtensionBundleURL:(id)a3
{
  objc_storeStrong((id *)&self->_extensionBundleURL, a3);
}

- (BSUIVibrancyEffectView)vibrancyView
{
  return self->_vibrancyView;
}

- (UIView)contentView
{
  return self->_contentView;
}

- (CGRect)contentBoundingRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_contentBoundingRect.origin.x;
  y = self->_contentBoundingRect.origin.y;
  width = self->_contentBoundingRect.size.width;
  height = self->_contentBoundingRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGRect)styleBoundingRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_styleBoundingRect.origin.x;
  y = self->_styleBoundingRect.origin.y;
  width = self->_styleBoundingRect.size.width;
  height = self->_styleBoundingRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (PRPosterAppearance)currentAppearance
{
  return self->_currentAppearance;
}

- (void)setCurrentAppearance:(id)a3
{
  objc_storeStrong((id *)&self->_currentAppearance, a3);
}

- (BSUIVibrancyConfiguration)activeVibrancyConfiguration
{
  return self->_activeVibrancyConfiguration;
}

- (void)setActiveVibrancyConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_activeVibrancyConfiguration, a3);
}

- (_PRContentStyleGradientView)gradientView
{
  return self->_gradientView;
}

- (void)setGradientView:(id)a3
{
  objc_storeStrong((id *)&self->_gradientView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gradientView, 0);
  objc_storeStrong((id *)&self->_activeVibrancyConfiguration, 0);
  objc_storeStrong((id *)&self->_currentAppearance, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_vibrancyView, 0);
  objc_storeStrong((id *)&self->_extensionBundleURL, 0);
}

@end
