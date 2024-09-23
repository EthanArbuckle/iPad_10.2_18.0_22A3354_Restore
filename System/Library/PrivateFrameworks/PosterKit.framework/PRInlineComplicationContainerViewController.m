@implementation PRInlineComplicationContainerViewController

- (PRInlineComplicationContainerViewController)initWithComplicationDescriptor:(id)a3
{
  id v4;
  PRInlineComplicationContainerViewController *v5;
  PRInlineComplicationContainerViewController *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PRInlineComplicationContainerViewController;
  v5 = -[PRInlineComplicationContainerViewController init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[PRInlineComplicationContainerViewController setComplicationDescriptor:](v5, "setComplicationDescriptor:", v4);

  return v6;
}

- (void)invalidate
{
  -[CHUISWidgetHostViewController invalidate](self->_hostViewController, "invalidate");
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PRInlineComplicationContainerViewController;
  -[PRInlineComplicationContainerViewController viewDidLoad](&v7, sel_viewDidLoad);
  -[PRInlineComplicationContainerViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHitTestsAsOpaque:", 1);

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", self, sel__tapGestureRecognized_);
  -[PRInlineComplicationContainerViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addGestureRecognizer:", v5);

}

- (void)setComplicationDescriptor:(id)a3
{
  PRComplicationDescriptor *v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  CHUISWidgetHostViewController *hostViewController;
  void *v21;
  _QWORD v22[4];
  id v23;
  id v24;
  PRComplicationDescriptor *v25;

  v5 = (PRComplicationDescriptor *)a3;
  if (self->_complicationDescriptor != v5)
  {
    objc_storeStrong((id *)&self->_complicationDescriptor, a3);
    if (self->_hostViewController)
    {
      -[PRInlineComplicationContainerViewController bs_removeChildViewController:](self, "bs_removeChildViewController:");
      -[CHUISWidgetHostViewController invalidate](self->_hostViewController, "invalidate");
    }
    if (v5)
    {
      v6 = objc_alloc(MEMORY[0x1E0D10310]);
      objc_msgSend(v6, "pr_initWithComplicationDescriptor:", v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = objc_alloc_init(MEMORY[0x1E0D10058]);
      objc_msgSend(v8, "setShowsDateAlongsideText:", 1);
      v9 = objc_alloc_init(MEMORY[0x1E0D10040]);
      objc_msgSend(v9, "setSize:", &unk_1E21DD348);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *MEMORY[0x1E0DC1438]);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setWeight:", v10);

      v21 = v9;
      objc_msgSend(v8, "setFontSpecification:", v9);
      objc_msgSend(v8, "setSymbolScale:", 1);
      objc_msgSend(v7, "setInlineTextParameters:", v8);
      objc_msgSend(v7, "setDrawSystemBackgroundMaterialIfNecessary:", 0);
      objc_msgSend(v7, "setVisibility:", 2);
      objc_msgSend(v7, "setCanAppearInSecureEnvironment:", 1);
      objc_msgSend(v7, "setContentType:", 0);
      objc_msgSend(v7, "setShouldShareTouchesWithHost:", 1);
      objc_msgSend(v7, "setColorScheme:", 2);
      -[PRInlineComplicationContainerViewController vibrancyConfiguration](self, "vibrancyConfiguration");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setVibrancyConfiguration:", v11);

      objc_msgSend(v7, "view");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setUserInteractionEnabled:", 0);

      v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D10258]), "initWithPrimaryTintColor:secondaryTintColor:filterStyle:fallbackFilterStyle:fraction:", 0, 0, 2, 2, 1.0);
      objc_msgSend(v7, "setTintParameters:", v13);
      -[PRComplicationDescriptor widget](v5, "widget");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      PRSharedWidgetDescriptorProvider();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "descriptorForPersonality:", v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v16, "intentType");
      v17 = objc_claimAutoreleasedReturnValue();
      if (v17
        && (v18 = (void *)v17,
            objc_msgSend(v14, "intent"),
            v19 = (void *)objc_claimAutoreleasedReturnValue(),
            v19,
            v18,
            !v19))
      {
        v22[0] = MEMORY[0x1E0C809B0];
        v22[1] = 3221225472;
        v22[2] = __73__PRInlineComplicationContainerViewController_setComplicationDescriptor___block_invoke;
        v22[3] = &unk_1E2185750;
        v23 = v7;
        v24 = v14;
        v25 = v5;
        objc_msgSend(v16, "loadDefaultIntent:", v22);

      }
      else
      {
        objc_msgSend(v7, "setPresentationMode:", 2);
      }
      -[PRInlineComplicationContainerViewController loadViewIfNeeded](self, "loadViewIfNeeded");
      -[PRInlineComplicationContainerViewController bs_addChildViewController:](self, "bs_addChildViewController:", v7);
      hostViewController = self->_hostViewController;
      self->_hostViewController = (CHUISWidgetHostViewController *)v7;

    }
  }

}

void __73__PRInlineComplicationContainerViewController_setComplicationDescriptor___block_invoke(id *a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  void *v6;
  NSObject *v7;

  v3 = a2;
  if (v3)
  {
    objc_msgSend(a1[4], "widget");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    v5 = a1[5];

    if (v4 == v5)
    {
      objc_msgSend(a1[5], "widgetByReplacingIntent:", v3);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[6], "setWidget:", v6);
      objc_msgSend(a1[4], "setWidget:", v6);

    }
    objc_msgSend(a1[4], "setPresentationMode:", 2);
  }
  else
  {
    PRLogCommon();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __73__PRInlineComplicationContainerViewController_setComplicationDescriptor___block_invoke_cold_1((uint64_t)a1, v7);

  }
}

- (void)setFocused:(BOOL)a3
{
  -[PRInlineComplicationContainerViewController setFocused:animated:](self, "setFocused:animated:", a3, 0);
}

- (void)setFocused:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  uint64_t v6;
  id v7;

  v4 = a3;
  if (a4)
  {
    objc_msgSend(MEMORY[0x1E0D016B0], "settingsWithDuration:", 0.3);
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  v7 = (id)v6;
  -[PRInlineComplicationContainerViewController setFocused:animationSettings:](self, "setFocused:animationSettings:", v4, v6);

}

- (void)setFocused:(BOOL)a3 animationSettings:(id)a4
{
  if (self->_focused != a3)
    self->_focused = a3;
}

- (void)setVibrancyConfiguration:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_vibrancyConfiguration, a3);
  v5 = a3;
  -[CHUISWidgetHostViewController setVibrancyConfiguration:](self->_hostViewController, "setVibrancyConfiguration:", v5);

}

- (void)_tapGestureRecognized:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  if (!self->_focused)
  {
    v6 = v4;
    -[PRInlineComplicationContainerViewController delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "inlineComplicationContainerViewControllerDidTapAdd:", self);
    goto LABEL_5;
  }
  if (self->_complicationDescriptor)
  {
    v6 = v4;
    -[PRInlineComplicationContainerViewController delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "inlineComplicationContainerViewController:didEditComplication:", self, self->_complicationDescriptor);
LABEL_5:

    v4 = v6;
  }

}

- (PRComplicationDescriptor)complicationDescriptor
{
  return self->_complicationDescriptor;
}

- (BSUIVibrancyConfiguration)vibrancyConfiguration
{
  return self->_vibrancyConfiguration;
}

- (PRInlineComplicationContainerViewControllerDelegate)delegate
{
  return (PRInlineComplicationContainerViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)isFocused
{
  return self->_focused;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_vibrancyConfiguration, 0);
  objc_storeStrong((id *)&self->_complicationDescriptor, 0);
  objc_storeStrong((id *)&self->_hostViewController, 0);
}

void __73__PRInlineComplicationContainerViewController_setComplicationDescriptor___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  void *v4;
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 40), "extensionBundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "kind");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = v4;
  v8 = 2112;
  v9 = v5;
  _os_log_error_impl(&dword_18B634000, a2, OS_LOG_TYPE_ERROR, "Default intent asked for but not provided: %@ - %@", (uint8_t *)&v6, 0x16u);

}

@end
