@implementation PRUISPosterAppearanceObservingAttachmentProvider

+ (int64_t)obscurableContentAttachmentLevel
{
  return *MEMORY[0x24BE74E68] - 1;
}

+ (int64_t)overlayContentAttachmentLevel
{
  return *MEMORY[0x24BE74E60] + 1;
}

- (PRUISPosterAppearanceObservingAttachmentProvider)initWithPRSConfiguration:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  PRUISPosterAppearanceObservingAttachmentProvider *v9;

  v4 = (objc_class *)MEMORY[0x24BE74DE8];
  v5 = a3;
  v6 = [v4 alloc];
  objc_msgSend(v5, "_path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)objc_msgSend(v6, "_initWithPath:", v7);
  v9 = -[PRUISPosterAppearanceObservingAttachmentProvider initWithPoster:](self, "initWithPoster:", v8);

  return v9;
}

- (PRUISPosterAppearanceObservingAttachmentProvider)initWithPoster:(id)a3
{
  id v5;
  void *v6;
  PRUISPosterAppearanceObservingAttachmentProvider *v7;
  PRUISPosterAppearanceObservingAttachmentProvider *v8;
  PRUISPosterAppearanceObservingAttachmentProvider *result;
  void *v10;
  objc_super v11;

  v5 = a3;
  objc_msgSend(v5, "_path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "isServerPosterPath") & 1) != 0)
  {
    v11.receiver = self;
    v11.super_class = (Class)PRUISPosterAppearanceObservingAttachmentProvider;
    v7 = -[PRUISPosterAppearanceObservingAttachmentProvider init](&v11, sel_init);
    v8 = v7;
    if (v7)
      objc_storeStrong((id *)&v7->_path, v6);

    return v8;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[path isServerPosterPath]"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[PRUISPosterAppearanceObservingAttachmentProvider initWithPoster:].cold.1(a2, (uint64_t)self, (uint64_t)v10);
    objc_msgSend(objc_retainAutorelease(v10), "UTF8String");
    result = (PRUISPosterAppearanceObservingAttachmentProvider *)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

- (UIView)obscurableContentView
{
  UIView *obscurableContentContainerView;
  id v4;
  void *v5;
  UIView *v6;
  UIView *v7;

  obscurableContentContainerView = self->_obscurableContentContainerView;
  if (!obscurableContentContainerView)
  {
    v4 = objc_alloc(MEMORY[0x24BDF6F90]);
    objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bounds");
    v6 = (UIView *)objc_msgSend(v4, "initWithFrame:");
    v7 = self->_obscurableContentContainerView;
    self->_obscurableContentContainerView = v6;

    obscurableContentContainerView = self->_obscurableContentContainerView;
  }
  return obscurableContentContainerView;
}

- (PRUISPosterAttachment)obscurableContentAttachment
{
  UIView *obscurableContentContainerView;
  void *v3;

  obscurableContentContainerView = self->_obscurableContentContainerView;
  if (obscurableContentContainerView)
  {
    +[PRUISPosterAttachment attachmentWithView:level:](PRUISPosterAttachment, "attachmentWithView:level:", obscurableContentContainerView, objc_msgSend((id)objc_opt_class(), "obscurableContentAttachmentLevel"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (PRUISPosterAttachment *)v3;
}

- (UIView)vibrantObscurableContentView
{
  id v3;
  void *v4;
  BSUIVibrancyEffectView *v5;
  BSUIVibrancyEffectView *obscurableContentVibrancyView;
  void *v7;
  PRPosterTitleStyleConfiguration *titleStyleConfiguration;
  void *v9;
  id v10;

  if (!self->_obscurableContentVibrancyView)
  {
    v3 = objc_alloc(MEMORY[0x24BE0BF50]);
    objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bounds");
    v5 = (BSUIVibrancyEffectView *)objc_msgSend(v3, "initWithFrame:");
    obscurableContentVibrancyView = self->_obscurableContentVibrancyView;
    self->_obscurableContentVibrancyView = v5;

    -[PRUISPosterAppearanceObservingAttachmentProvider obscurableContentView](self, "obscurableContentView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addSubview:", self->_obscurableContentVibrancyView);

    -[BSUIVibrancyEffectView setAutoresizingMask:](self->_obscurableContentVibrancyView, "setAutoresizingMask:", 18);
  }
  -[PRUISPosterAppearanceObservingAttachmentProvider _loadTitleStyleConfigurationIfNeeded](self, "_loadTitleStyleConfigurationIfNeeded");
  titleStyleConfiguration = self->_titleStyleConfiguration;
  -[PRUISPosterAppearanceObservingAttachmentProvider _currentAppearance](self, "_currentAppearance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[PRUISPosterAppearanceObservingAttachmentProvider _updateContentStyleWithTitleStyleConfiguration:initialAppearance:](self, "_updateContentStyleWithTitleStyleConfiguration:initialAppearance:", titleStyleConfiguration, v9);

  return (UIView *)-[BSUIVibrancyEffectView contentView](self->_obscurableContentVibrancyView, "contentView");
}

- (UIView)overlayContentView
{
  UIView *overlayContentView;
  id v4;
  void *v5;
  UIView *v6;
  UIView *v7;

  overlayContentView = self->_overlayContentView;
  if (!overlayContentView)
  {
    v4 = objc_alloc(MEMORY[0x24BDF6F90]);
    objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bounds");
    v6 = (UIView *)objc_msgSend(v4, "initWithFrame:");
    v7 = self->_overlayContentView;
    self->_overlayContentView = v6;

    overlayContentView = self->_overlayContentView;
  }
  return overlayContentView;
}

- (UIView)obscurableOverlayView
{
  UIView *obscurableOverlayView;
  id v4;
  UIView *v5;
  UIView *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[5];

  v23[4] = *MEMORY[0x24BDAC8D0];
  obscurableOverlayView = self->_obscurableOverlayView;
  if (!obscurableOverlayView)
  {
    v4 = objc_alloc(MEMORY[0x24BDF6F90]);
    v5 = (UIView *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    v6 = self->_obscurableOverlayView;
    self->_obscurableOverlayView = v5;

    -[PRUISPosterAppearanceObservingAttachmentProvider obscurableContentView](self, "obscurableContentView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addSubview:", self->_obscurableOverlayView);

    v18 = (void *)MEMORY[0x24BDD1628];
    -[UIView widthAnchor](self->_obscurableOverlayView, "widthAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[BSUIVibrancyEffectView widthAnchor](self->_obscurableContentVibrancyView, "widthAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "constraintEqualToAnchor:", v21);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = v20;
    -[UIView heightAnchor](self->_obscurableOverlayView, "heightAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[BSUIVibrancyEffectView heightAnchor](self->_obscurableContentVibrancyView, "heightAnchor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "constraintEqualToAnchor:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v23[1] = v9;
    -[UIView centerXAnchor](self->_obscurableOverlayView, "centerXAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[BSUIVibrancyEffectView centerXAnchor](self->_obscurableContentVibrancyView, "centerXAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "constraintEqualToAnchor:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v23[2] = v12;
    -[UIView centerYAnchor](self->_obscurableOverlayView, "centerYAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[BSUIVibrancyEffectView centerYAnchor](self->_obscurableContentVibrancyView, "centerYAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "constraintEqualToAnchor:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v23[3] = v15;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "activateConstraints:", v16);

    obscurableOverlayView = self->_obscurableOverlayView;
  }
  return obscurableOverlayView;
}

- (PRUISPosterAttachment)overlayContentAttachment
{
  UIView *overlayContentView;
  void *v3;

  overlayContentView = self->_overlayContentView;
  if (overlayContentView)
  {
    +[PRUISPosterAttachment attachmentWithView:level:](PRUISPosterAttachment, "attachmentWithView:level:", overlayContentView, objc_msgSend((id)objc_opt_class(), "overlayContentAttachmentLevel"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (PRUISPosterAttachment *)v3;
}

- (void)updateLayoutForChangedObscuredSubviewBounds
{
  PRPosterTitleStyleConfiguration *titleStyleConfiguration;
  id v4;
  id v5;

  titleStyleConfiguration = self->_titleStyleConfiguration;
  -[PRUISPosterAppearanceObservingAttachmentProvider _currentAppearance](self, "_currentAppearance");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v4 = -[PRUISPosterAppearanceObservingAttachmentProvider _updateContentStyleWithTitleStyleConfiguration:initialAppearance:](self, "_updateContentStyleWithTitleStyleConfiguration:initialAppearance:", titleStyleConfiguration, v5);

}

- (id)_currentAppearance
{
  PRPosterAppearance *currentAppearance;
  PRPosterAppearance *v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  id v35;
  id v36;
  void *v37;
  void *v38;
  PRPosterAppearance *v39;
  PRPosterAppearance *v40;
  PRPosterAppearance *v41;

  currentAppearance = self->_currentAppearance;
  if (!currentAppearance)
  {
    -[PRUISPosterAppearanceObservingAttachmentProvider _loadTitleStyleConfigurationIfNeeded](self, "_loadTitleStyleConfigurationIfNeeded");
    -[PFServerPosterPath serverIdentity](self->_path, "serverIdentity");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "role");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!self->_titleStyleConfiguration)
      goto LABEL_14;
    -[PFServerPosterPath serverIdentity](self->_path, "serverIdentity");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "provider");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDC1528]), "initWithBundleIdentifier:error:", v8, 0);
      objc_msgSend(v9, "URL");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        -[PRPosterTitleStyleConfiguration effectiveTimeFontWithExtensionBundleURL:forRole:](self->_titleStyleConfiguration, "effectiveTimeFontWithExtensionBundleURL:forRole:", v10, v6);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11)
        {
LABEL_17:
          objc_msgSend(v11, "fontWithSize:", 84.0);
          v34 = (void *)objc_claimAutoreleasedReturnValue();

          v35 = objc_alloc(MEMORY[0x24BE74DD0]);
          v36 = objc_alloc(MEMORY[0x24BE74DD8]);
          objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = (void *)objc_msgSend(v36, "initWithColor:", v37);
          v39 = (PRPosterAppearance *)objc_msgSend(v35, "initWithFont:labelColor:preferredTitleAlignment:preferredTitleLayout:", v34, v38, -[PRPosterTitleStyleConfiguration preferredTitleAlignment](self->_titleStyleConfiguration, "preferredTitleAlignment"), -[PRPosterTitleStyleConfiguration preferredTitleLayout](self->_titleStyleConfiguration, "preferredTitleLayout"));

          v40 = self->_currentAppearance;
          self->_currentAppearance = v39;
          v41 = v39;

          v3 = self->_currentAppearance;
          return v3;
        }
LABEL_14:
        PRUISLogAttachments();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          -[PRUISPosterAppearanceObservingAttachmentProvider _currentAppearance].cold.1(v26, v27, v28, v29, v30, v31, v32, v33);

        objc_msgSend(MEMORY[0x24BE74E30], "defaultTitleFontForRole:", v6);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_17;
      }
    }
    else
    {
      PRUISLogRendering();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        -[PRUISPosterAppearanceObservingAttachmentProvider _currentAppearance].cold.3((uint64_t)&self->_path, v12, v13, v14, v15, v16, v17, v18);

    }
    PRUISLogRendering();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      -[PRUISPosterAppearanceObservingAttachmentProvider _currentAppearance].cold.2((uint64_t)&self->_path, v19, v20, v21, v22, v23, v24, v25);

    goto LABEL_14;
  }
  v3 = currentAppearance;
  return v3;
}

- (void)applyPosterAppearanceToObserver:(id)a3
{
  id v4;
  PRPosterAppearance *v5;
  PRPosterAppearance *currentAppearance;
  id v7;

  v4 = a3;
  -[PRUISPosterAppearanceObservingAttachmentProvider _currentAppearance](self, "_currentAppearance");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[PRUISPosterAppearanceObservingAttachmentProvider _updateContentStyleWithTitleStyleConfiguration:initialAppearance:](self, "_updateContentStyleWithTitleStyleConfiguration:initialAppearance:", self->_titleStyleConfiguration, v7);
  v5 = (PRPosterAppearance *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "posterAppearanceDidChange:", v5);

  currentAppearance = self->_currentAppearance;
  self->_currentAppearance = v5;

}

- (void)_loadTitleStyleConfigurationIfNeeded
{
  OUTLINED_FUNCTION_6(&dword_2445ED000, a1, a3, "Unable to load title style configuration: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_8();
}

- (id)_updateContentStyleWithTitleStyleConfiguration:(id)a3 initialAppearance:(id)a4
{
  id v6;
  id v7;
  BSUIVibrancyEffectView *obscurableContentVibrancyView;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  double v21;
  double v22;
  double v23;
  double v24;
  uint64_t i;
  void *v26;
  BOOL v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  id v36;
  PRPosterContentStyleVibrantContentRenderer *vibrantContentRenderer;
  id v38;
  BSUIVibrancyEffectView *v39;
  void *v40;
  PRPosterContentStyleVibrantContentRenderer *v41;
  PRPosterContentStyleVibrantContentRenderer *v42;
  void *v43;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  uint64_t v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;

  v50 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  obscurableContentVibrancyView = self->_obscurableContentVibrancyView;
  if (obscurableContentVibrancyView)
  {
    -[BSUIVibrancyEffectView contentView](obscurableContentVibrancyView, "contentView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setNeedsLayout");

    -[BSUIVibrancyEffectView contentView](self->_obscurableContentVibrancyView, "contentView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "layoutIfNeeded");

    -[PRPosterContentStyleVibrantContentRenderer clearAllStyles](self->_vibrantContentRenderer, "clearAllStyles");
    -[BSUIVibrancyEffectView contentView](self->_obscurableContentVibrancyView, "contentView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "subviews");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = *MEMORY[0x24BDBF090];
    v14 = *(double *)(MEMORY[0x24BDBF090] + 8);
    v15 = *(double *)(MEMORY[0x24BDBF090] + 16);
    v16 = *(double *)(MEMORY[0x24BDBF090] + 24);
    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    v17 = v12;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v46;
      v21 = v16;
      v22 = v15;
      v23 = v14;
      v24 = v13;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v46 != v20)
            objc_enumerationMutation(v17);
          v26 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
          v51.origin.x = v24;
          v51.origin.y = v23;
          v51.size.width = v22;
          v51.size.height = v21;
          v53.origin.x = v13;
          v53.origin.y = v14;
          v53.size.width = v15;
          v53.size.height = v16;
          v27 = CGRectEqualToRect(v51, v53);
          objc_msgSend(v26, "frame", (_QWORD)v45);
          v32 = v28;
          v33 = v29;
          v34 = v30;
          v35 = v31;
          if (!v27)
          {
            v52.origin.x = v24;
            v52.origin.y = v23;
            v52.size.width = v22;
            v52.size.height = v21;
            *(CGRect *)&v28 = CGRectUnion(v52, *(CGRect *)&v32);
          }
          v24 = v28;
          v23 = v29;
          v22 = v30;
          v21 = v31;
        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
      }
      while (v19);
    }
    else
    {
      v21 = v16;
      v22 = v15;
      v23 = v14;
      v24 = v13;
    }

    if (CGRectIsEmpty(self->_primaryContentTightFrame))
    {
      self->_primaryContentTightFrame.origin.x = v24;
      self->_primaryContentTightFrame.origin.y = v23;
      self->_primaryContentTightFrame.size.width = v22;
      self->_primaryContentTightFrame.size.height = v21;
    }
    vibrantContentRenderer = self->_vibrantContentRenderer;
    if (vibrantContentRenderer)
    {
      -[PRPosterContentStyleVibrantContentRenderer setContentBoundingRect:](vibrantContentRenderer, "setContentBoundingRect:", v24, v23, v22, v21);
      -[PRPosterContentStyleVibrantContentRenderer setStyleBoundingRect:](self->_vibrantContentRenderer, "setStyleBoundingRect:", self->_primaryContentTightFrame.origin.x, self->_primaryContentTightFrame.origin.y, self->_primaryContentTightFrame.size.width, self->_primaryContentTightFrame.size.height);
    }
    else
    {
      v38 = objc_alloc(MEMORY[0x24BE74DF0]);
      v39 = self->_obscurableContentVibrancyView;
      -[BSUIVibrancyEffectView contentView](v39, "contentView");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = (PRPosterContentStyleVibrantContentRenderer *)objc_msgSend(v38, "initWithVibrancyView:contentView:contentBoundingRect:styleBoundingRect:initialAppearance:", v39, v40, v7, v24, v23, v22, v21, self->_primaryContentTightFrame.origin.x, self->_primaryContentTightFrame.origin.y, self->_primaryContentTightFrame.size.width, self->_primaryContentTightFrame.size.height);
      v42 = self->_vibrantContentRenderer;
      self->_vibrantContentRenderer = v41;

    }
    objc_msgSend(v6, "effectiveTitleContentStyle", (_QWORD)v45);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "applyStyleWithRenderer:", self->_vibrantContentRenderer);

    -[PRPosterContentStyleVibrantContentRenderer currentAppearance](self->_vibrantContentRenderer, "currentAppearance");
    v36 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v36 = v7;
  }

  return v36;
}

- (void)setPrimaryContentTightFrame:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  PRPosterTitleStyleConfiguration *titleStyleConfiguration;
  PRPosterContentStyleVibrantContentRenderer *vibrantContentRenderer;
  id v10;
  id v11;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (!CGRectEqualToRect(self->_primaryContentTightFrame, a3))
  {
    self->_primaryContentTightFrame.origin.x = x;
    self->_primaryContentTightFrame.origin.y = y;
    self->_primaryContentTightFrame.size.width = width;
    self->_primaryContentTightFrame.size.height = height;
    titleStyleConfiguration = self->_titleStyleConfiguration;
    if (titleStyleConfiguration)
    {
      vibrantContentRenderer = self->_vibrantContentRenderer;
      if (vibrantContentRenderer)
      {
        -[PRPosterContentStyleVibrantContentRenderer currentAppearance](vibrantContentRenderer, "currentAppearance");
        v11 = (id)objc_claimAutoreleasedReturnValue();
        v10 = -[PRUISPosterAppearanceObservingAttachmentProvider _updateContentStyleWithTitleStyleConfiguration:initialAppearance:](self, "_updateContentStyleWithTitleStyleConfiguration:initialAppearance:", titleStyleConfiguration, v11);

      }
    }
  }
}

- (CGRect)primaryContentTightFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_primaryContentTightFrame.origin.x;
  y = self->_primaryContentTightFrame.origin.y;
  width = self->_primaryContentTightFrame.size.width;
  height = self->_primaryContentTightFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (BSUIVibrancyView)obscurableContentVibrancyView
{
  return self->_obscurableContentVibrancyView;
}

- (void)setObscurableContentVibrancyView:(id)a3
{
  objc_storeStrong((id *)&self->_obscurableContentVibrancyView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vibrantContentRenderer, 0);
  objc_storeStrong((id *)&self->_currentAppearance, 0);
  objc_storeStrong((id *)&self->_obscurableOverlayView, 0);
  objc_storeStrong((id *)&self->_overlayContentView, 0);
  objc_storeStrong((id *)&self->_obscurableContentContainerView, 0);
  objc_storeStrong((id *)&self->_obscurableContentVibrancyView, 0);
  objc_storeStrong((id *)&self->_titleStyleConfiguration, 0);
  objc_storeStrong((id *)&self->_path, 0);
}

- (void)initWithPoster:(uint64_t)a3 .cold.1(const char *a1, uint64_t a2, uint64_t a3)
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

  v20 = *MEMORY[0x24BDAC8D0];
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
  v15 = CFSTR("PRUISPosterAppearanceObservingAttachmentProvider.m");
  v16 = 1024;
  v17 = 68;
  v18 = 2114;
  v19 = a3;
  _os_log_error_impl(&dword_2445ED000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);

}

- (void)_currentAppearance
{
  OUTLINED_FUNCTION_6(&dword_2445ED000, a2, a3, "Missing poster provider from the poster %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_8();
}

@end
