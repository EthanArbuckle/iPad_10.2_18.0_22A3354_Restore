@implementation PRNameLabelViewController

- (PRIncomingCallTextViewAdapter)nameTextViewAdapter
{
  PRIncomingCallTextViewAdapter *nameTextViewAdapter;
  PRIncomingCallTextViewAdapter *v4;
  void *v5;
  PRIncomingCallTextViewAdapter *v6;
  PRIncomingCallTextViewAdapter *v7;
  PRIncomingCallTextViewAdapter *v8;
  void *v9;
  PRIncomingCallTextViewAdapter *v10;
  void *v11;

  nameTextViewAdapter = self->_nameTextViewAdapter;
  if (!nameTextViewAdapter)
  {
    v4 = [PRIncomingCallTextViewAdapter alloc];
    -[PRNameLabelViewController displayString](self, "displayString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[PRIncomingCallTextViewAdapter initWithName:](v4, "initWithName:", v5);
    v7 = self->_nameTextViewAdapter;
    self->_nameTextViewAdapter = v6;

    v8 = self->_nameTextViewAdapter;
    -[PRNameLabelViewController baseFont](self, "baseFont");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRIncomingCallTextViewAdapter setEmphasizedNameFont:](v8, "setEmphasizedNameFont:", v9);

    v10 = self->_nameTextViewAdapter;
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRIncomingCallTextViewAdapter setTextColor:](v10, "setTextColor:", v11);

    -[PRIncomingCallTextViewAdapter setMarqueeRunning:](self->_nameTextViewAdapter, "setMarqueeRunning:", 0);
    nameTextViewAdapter = self->_nameTextViewAdapter;
  }
  return nameTextViewAdapter;
}

- (double)idealFontSize
{
  void *v3;
  void *v4;
  double v5;
  double v6;

  -[PRNameLabelViewController displayString](self, "displayString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRNameLabelViewController nameTextViewAdapter](self, "nameTextViewAdapter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PRIncomingCallFontsProvider idealEmphasizedFontSizeForName:usingLayout:](PRIncomingCallFontsProvider, "idealEmphasizedFontSizeForName:usingLayout:", v3, objc_msgSend(v4, "layout"));
  v6 = v5;

  return v6;
}

- (id)effectiveFont
{
  const __CTFont *v3;
  CGFloat v4;
  CTFontRef CopyWithAttributes;

  -[PRNameLabelViewController baseFont](self, "baseFont");
  v3 = (const __CTFont *)objc_claimAutoreleasedReturnValue();
  -[PRNameLabelViewController idealFontSize](self, "idealFontSize");
  CopyWithAttributes = CTFontCreateCopyWithAttributes(v3, v4, 0, 0);

  return CopyWithAttributes;
}

- (void)loadView
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  BSUIVibrancyEffectView *v8;
  BSUIVibrancyEffectView *vibrancyView;
  void *v10;
  void *v11;
  void *v12;
  PREditorElementLayoutController *v13;
  PREditorElementLayoutController *layoutController;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v3 = objc_alloc(MEMORY[0x1E0DC3F10]);
  v4 = *MEMORY[0x1E0C9D648];
  v5 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v6 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v7 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v19 = (id)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E0C9D648], v5, v6, v7);
  -[PRNameLabelViewController setView:](self, "setView:");
  v8 = (BSUIVibrancyEffectView *)objc_msgSend(objc_alloc(MEMORY[0x1E0D01960]), "initWithFrame:", v4, v5, v6, v7);
  vibrancyView = self->_vibrancyView;
  self->_vibrancyView = v8;

  -[PRNameLabelViewController nameTextViewAdapter](self, "nameTextViewAdapter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "viewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSUIVibrancyEffectView contentView](self->_vibrancyView, "contentView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRNameLabelViewController bs_addChildViewController:withSuperview:](self, "bs_addChildViewController:withSuperview:", v11, v12);

  v13 = -[PREditorElementLayoutController initWithTraitEnvironment:]([PREditorElementLayoutController alloc], "initWithTraitEnvironment:", self);
  layoutController = self->_layoutController;
  self->_layoutController = v13;

  -[PRNameLabelViewController view](self, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addSubview:", self->_vibrancyView);

  objc_msgSend(v10, "emojiViewController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    objc_msgSend(v10, "emojiViewController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRNameLabelViewController view](self, "view");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRNameLabelViewController bs_addChildViewController:withSuperview:](self, "bs_addChildViewController:withSuperview:", v17, v18);

  }
}

- (void)viewDidLayoutSubviews
{
  BSUIVibrancyEffectView *vibrancyView;
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
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  objc_super v22;
  CGRect v23;
  CGRect v24;

  v22.receiver = self;
  v22.super_class = (Class)PRNameLabelViewController;
  -[PRNameLabelViewController viewDidLayoutSubviews](&v22, sel_viewDidLayoutSubviews);
  vibrancyView = self->_vibrancyView;
  -[PRNameLabelViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  -[BSUIVibrancyEffectView setFrame:](vibrancyView, "setFrame:");

  -[PRNameLabelViewController nameTextViewAdapter](self, "nameTextViewAdapter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRNameLabelViewController titleRectForLayout:](self, "titleRectForLayout:", objc_msgSend(v5, "layout"));
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  objc_msgSend(v5, "frame");
  v24.origin.x = v7;
  v24.origin.y = v9;
  v24.size.width = v11;
  v24.size.height = v13;
  if (!CGRectEqualToRect(v23, v24))
    objc_msgSend(v5, "setFrame:", v7, v9, v11, v13);
  objc_msgSend(v5, "tightFrame");
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;
  objc_msgSend(v5, "frame");
  -[PRPosterContentStyleVibrantContentRenderer setContentBoundingRect:](self->_vibrantStyleRenderer, "setContentBoundingRect:");
  -[PRPosterContentStyleVibrantContentRenderer setStyleBoundingRect:](self->_vibrantStyleRenderer, "setStyleBoundingRect:", v15, v17, v19, v21);

}

- (void)removeIncomingCallTextViewAdapterFromParent:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = a3;
  objc_msgSend(v3, "viewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "willMoveToParentViewController:", 0);

  objc_msgSend(v3, "viewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeFromSuperview");

  objc_msgSend(v3, "viewController");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "removeFromParentViewController");
}

- (CGRect)titleRectForLayout:(unint64_t)a3
{
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
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  CGRect result;

  -[PRNameLabelViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  -[PRNameLabelViewController layoutController](self, "layoutController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "frameAttributesForElements:variant:titleLayout:withBoundingRect:", 1, 2, a3, v7, v9, v11, v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "rect");
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v23 = v22;

  v24 = v17;
  v25 = v19;
  v26 = v21;
  v27 = v23;
  result.size.height = v27;
  result.size.width = v26;
  result.origin.y = v25;
  result.origin.x = v24;
  return result;
}

- (void)setDisplayString:(id)a3
{
  NSString *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSString *v15;

  v5 = (NSString *)a3;
  if (self->_displayString != v5)
  {
    v15 = v5;
    objc_storeStrong((id *)&self->_displayString, a3);
    -[PRNameLabelViewController nameTextViewAdapter](self, "nameTextViewAdapter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setDisplayNameText:", v15);
    -[PRNameLabelViewController effectiveFont](self, "effectiveFont");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setTextFontUsingDefaultFontSizes:", v7);

    objc_msgSend(v6, "emojiViewController");
    v8 = objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = (void *)v8;
      objc_msgSend(v6, "emojiViewController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "view");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "superview");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v12)
      {
        objc_msgSend(v6, "emojiViewController");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[PRNameLabelViewController view](self, "view");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[PRNameLabelViewController bs_addChildViewController:withSuperview:](self, "bs_addChildViewController:withSuperview:", v13, v14);

      }
    }

    v5 = v15;
  }

}

- (void)pr_setBackgroundType:(int64_t)a3
{
  void *v4;
  void *v5;
  id v6;

  -[PRNameLabelViewController vibrancyView](self, "vibrancyView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "configuration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "backgroundType") != a3)
  {
    v5 = (void *)objc_msgSend(v4, "copyWithWithBackgroundType:", a3);
    objc_msgSend(v6, "setConfiguration:", v5);

  }
}

- (void)pr_setStylingFromTitleStyleConfiguration:(id)a3 withExtensionBundleURL:(id)a4 forRole:(id)a5
{
  id v9;
  id v10;
  id v11;
  UIFont *v12;
  UIFont *baseFont;
  void *v14;
  void *v15;
  void *v16;
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
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  PRPosterAppearance *v35;
  void *v36;
  PRPosterColor *v37;
  PRPosterAppearance *v38;
  PRPosterContentStyleVibrantContentRenderer *vibrantStyleRenderer;
  void *v40;
  PRPosterContentStyleVibrantContentRenderer *v41;
  void *v42;
  PRPosterContentStyleVibrantContentRenderer *v43;
  PRPosterContentStyleVibrantContentRenderer *v44;
  void *v45;
  void *v46;

  v9 = a3;
  v10 = a5;
  v11 = a4;
  -[PRNameLabelViewController loadViewIfNeeded](self, "loadViewIfNeeded");
  objc_msgSend(v9, "effectiveTimeFontWithExtensionBundleURL:forRole:", v11, v10);
  v12 = (UIFont *)objc_claimAutoreleasedReturnValue();

  baseFont = self->_baseFont;
  self->_baseFont = v12;

  -[PRNameLabelViewController nameTextViewAdapter](self, "nameTextViewAdapter");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setPreferredAlignment:", objc_msgSend(v9, "preferredTitleAlignment"));
  objc_msgSend(v14, "setPreferredLayout:", objc_msgSend(v9, "preferredTitleLayout"));
  -[PRNameLabelViewController effectiveFont](self, "effectiveFont");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = v10;
  if (v15)
  {
    objc_msgSend(v14, "setTextFontUsingDefaultFontSizes:", v15);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("No effective font found for role %@, _baseFont %@, titleStyleConfiguration %@"), v10, self->_baseFont, v9, v10);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
      -[PRNameLabelViewController pr_setStylingFromTitleStyleConfiguration:withExtensionBundleURL:forRole:].cold.1(a2, (uint64_t)self, (uint64_t)v16);

  }
  -[PRNameLabelViewController view](self, "view");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setNeedsLayout");

  objc_msgSend(v14, "frame");
  v19 = v18;
  v21 = v20;
  v23 = v22;
  v25 = v24;
  objc_msgSend(v14, "tightFrame");
  v27 = v26;
  v29 = v28;
  v31 = v30;
  v33 = v32;
  objc_msgSend(v14, "textColor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = [PRPosterAppearance alloc];
  -[PRNameLabelViewController effectiveFont](self, "effectiveFont");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = -[PRPosterColor initWithColor:]([PRPosterColor alloc], "initWithColor:", v34);
  v38 = -[PRPosterAppearance initWithFont:labelColor:preferredTitleAlignment:preferredTitleLayout:](v35, "initWithFont:labelColor:preferredTitleAlignment:preferredTitleLayout:", v36, v37, objc_msgSend(v14, "alignment"), objc_msgSend(v14, "layout"));

  vibrantStyleRenderer = self->_vibrantStyleRenderer;
  if (vibrantStyleRenderer)
  {
    -[PRPosterContentStyleVibrantContentRenderer setContentBoundingRect:](vibrantStyleRenderer, "setContentBoundingRect:", v19, v21, v23, v25);
    -[PRPosterContentStyleVibrantContentRenderer setStyleBoundingRect:](self->_vibrantStyleRenderer, "setStyleBoundingRect:", v27, v29, v31, v33);
    -[PRPosterContentStyleVibrantContentRenderer setCurrentAppearance:](self->_vibrantStyleRenderer, "setCurrentAppearance:", v38);
  }
  else
  {
    -[PRNameLabelViewController vibrancyView](self, "vibrancyView");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = [PRPosterContentStyleVibrantContentRenderer alloc];
    objc_msgSend(v40, "contentView");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = -[PRPosterContentStyleVibrantContentRenderer initWithVibrancyView:contentView:contentBoundingRect:styleBoundingRect:initialAppearance:](v41, "initWithVibrancyView:contentView:contentBoundingRect:styleBoundingRect:initialAppearance:", v40, v42, v38, v19, v21, v23, v25, v27, v29, v31, v33);
    v44 = self->_vibrantStyleRenderer;
    self->_vibrantStyleRenderer = v43;

  }
  objc_msgSend(v9, "effectiveTitleContentStyle");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "applyStyleWithRenderer:", self->_vibrantStyleRenderer);

}

- (void)pr_updateStyleBoundingRects
{
  double v3;
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
  id v19;

  -[PRNameLabelViewController nameTextViewAdapter](self, "nameTextViewAdapter");
  v19 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "frame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  objc_msgSend(v19, "tightFrame");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  -[PRPosterContentStyleVibrantContentRenderer setContentBoundingRect:](self->_vibrantStyleRenderer, "setContentBoundingRect:", v4, v6, v8, v10);
  -[PRPosterContentStyleVibrantContentRenderer setStyleBoundingRect:](self->_vibrantStyleRenderer, "setStyleBoundingRect:", v12, v14, v16, v18);

}

- (id)beginInteractiveTransitionToVibrancyConfiguration:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  PRNameLabelViewControllerTransition *v7;

  v4 = a3;
  -[PRNameLabelViewController vibrancyView](self, "vibrancyView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "configuration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[PRNameLabelViewControllerTransition initWithViewController:fromVibrancyConfiguration:toVibrancyConfiguration:]([PRNameLabelViewControllerTransition alloc], "initWithViewController:fromVibrancyConfiguration:toVibrancyConfiguration:", self, v6, v4);
  objc_storeStrong((id *)&self->_currentTransition, v7);

  return v7;
}

- (void)transition:(id)a3 didUpdate:(double)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  -[PRNameLabelViewController currentTransition](self, "currentTransition");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  v7 = v12;
  if (v6 == v12)
  {
    objc_msgSend(v12, "fromConfiguration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "toConfiguration");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v8, "copyWithBlendAmount:blendConfiguration:", v9, a4);

    -[PRNameLabelViewController vibrancyView](self, "vibrancyView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setConfiguration:", v10);

    v7 = v12;
  }

}

- (void)transition:(id)a3 didFinishSuccessfully:(BOOL)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  PRNameLabelViewControllerTransition *currentTransition;
  id v11;

  v11 = a3;
  -[PRNameLabelViewController currentTransition](self, "currentTransition");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  v7 = v11;
  if (v6 == v11)
  {
    if (a4)
      objc_msgSend(v11, "toConfiguration");
    else
      objc_msgSend(v11, "fromConfiguration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRNameLabelViewController vibrancyView](self, "vibrancyView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setConfiguration:", v8);

    currentTransition = self->_currentTransition;
    self->_currentTransition = 0;

    v7 = v11;
  }

}

- (id)pr_beginInteractiveTransitionToBaseFont:(id)a3 vibrancyConfiguration:(id)a4 cachingVibrancyTransitionProvider:(id)a5
{
  return -[PRNameLabelViewController beginInteractiveTransitionToVibrancyConfiguration:](self, "beginInteractiveTransitionToVibrancyConfiguration:", a4);
}

- (NSString)displayString
{
  return self->_displayString;
}

- (void)setNameTextViewAdapter:(id)a3
{
  objc_storeStrong((id *)&self->_nameTextViewAdapter, a3);
}

- (UIFont)baseFont
{
  return self->_baseFont;
}

- (void)setBaseFont:(id)a3
{
  objc_storeStrong((id *)&self->_baseFont, a3);
}

- (PRNameLabelViewControllerTransition)currentTransition
{
  return self->_currentTransition;
}

- (void)setCurrentTransition:(id)a3
{
  objc_storeStrong((id *)&self->_currentTransition, a3);
}

- (PREditorElementLayoutController)layoutController
{
  return self->_layoutController;
}

- (void)setLayoutController:(id)a3
{
  objc_storeStrong((id *)&self->_layoutController, a3);
}

- (PRPosterContentStyleVibrantContentRenderer)vibrantStyleRenderer
{
  return self->_vibrantStyleRenderer;
}

- (void)setVibrantStyleRenderer:(id)a3
{
  objc_storeStrong((id *)&self->_vibrantStyleRenderer, a3);
}

- (BSUIVibrancyEffectView)vibrancyView
{
  return self->_vibrancyView;
}

- (void)setVibrancyView:(id)a3
{
  objc_storeStrong((id *)&self->_vibrancyView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vibrancyView, 0);
  objc_storeStrong((id *)&self->_vibrantStyleRenderer, 0);
  objc_storeStrong((id *)&self->_layoutController, 0);
  objc_storeStrong((id *)&self->_currentTransition, 0);
  objc_storeStrong((id *)&self->_baseFont, 0);
  objc_storeStrong((id *)&self->_nameTextViewAdapter, 0);
  objc_storeStrong((id *)&self->_displayString, 0);
}

- (void)pr_setStylingFromTitleStyleConfiguration:(const char *)a1 withExtensionBundleURL:(uint64_t)a2 forRole:(uint64_t)a3 .cold.1(const char *a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  objc_class *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  const __CFString *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  NSStringFromSelector(a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138544642;
  v9 = v5;
  v10 = 2114;
  v11 = v7;
  v12 = 2048;
  v13 = a2;
  v14 = 2114;
  v15 = CFSTR("PRNameLabelViewController.m");
  v16 = 1024;
  v17 = 171;
  v18 = 2114;
  v19 = a3;
  _os_log_fault_impl(&dword_18B634000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);

}

@end
