@implementation SBHStackConfigurationIconListView

- (void)configureIconView:(id)a3 forIcon:(id)a4
{
  id v6;
  void *v7;
  objc_super v8;

  v6 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SBHStackConfigurationIconListView;
  -[SBIconListView configureIconView:forIcon:](&v8, sel_configureIconView_forIcon_, v6, a4);
  -[SBHStackConfigurationIconListView iconViewDelegate](self, "iconViewDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDelegate:", v7);

  objc_msgSend(v6, "setIconContentScalingEnabled:", 1);
  objc_msgSend(v6, "setAllowsResizeHandle:", 0);
  objc_msgSend(v6, "_updateAccessoryViewAnimated:", 0);
  objc_msgSend(v6, "setStartsDragMoreQuickly:", 1);
  -[SBHStackConfigurationIconListView _setupCustomBackgroundConfigurationForIconView:](self, "_setupCustomBackgroundConfigurationForIconView:", v6);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[SBIconListView addLayoutObserver:](self, "addLayoutObserver:", v6);

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  double v5;
  objc_super v6;
  CGSize result;

  v6.receiver = self;
  v6.super_class = (Class)SBHStackConfigurationIconListView;
  -[SBIconListView sizeThatFits:](&v6, sel_sizeThatFits_, a3.width, a3.height);
  v4 = SBHSizeCeiling(v3);
  result.height = v5;
  result.width = v4;
  return result;
}

- (Class)baseIconViewClass
{
  return (Class)objc_opt_class();
}

- (void)_setupCustomBackgroundConfigurationForIconView:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;

  objc_msgSend(a3, "customIconImageViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "backgroundViewProvider");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (id)objc_msgSend(v4, "copy");

    if (v5 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      v6 = MEMORY[0x1E0C809B0];
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __84__SBHStackConfigurationIconListView__setupCustomBackgroundConfigurationForIconView___block_invoke;
      v11[3] = &unk_1E8D85D60;
      v5 = v5;
      v12 = v5;
      objc_msgSend(v3, "setBackgroundViewProvider:", v11);
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v3, "backgroundViewConfigurator");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = (id)objc_msgSend(v7, "copy");

        if (v8 && (objc_opt_respondsToSelector() & 1) != 0)
        {
          v9[0] = v6;
          v9[1] = 3221225472;
          v9[2] = __84__SBHStackConfigurationIconListView__setupCustomBackgroundConfigurationForIconView___block_invoke_2;
          v9[3] = &unk_1E8D85D88;
          v8 = v8;
          v10 = v8;
          objc_msgSend(v3, "setBackgroundViewConfigurator:", v9);

        }
      }
      else
      {
        v8 = 0;
      }

    }
  }
  else
  {
    v5 = 0;
  }

}

SBHWidgetWrapperBackgroundView *__84__SBHStackConfigurationIconListView__setupCustomBackgroundConfigurationForIconView___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  SBHWidgetWrapperBackgroundView *v5;

  v2 = objc_alloc(MEMORY[0x1E0DC3F10]);
  v3 = (void *)objc_msgSend(v2, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[SBHWidgetWrapperBackgroundView initWithUnderlyingBackgroundView:widgetBackgroundView:]([SBHWidgetWrapperBackgroundView alloc], "initWithUnderlyingBackgroundView:widgetBackgroundView:", v3, v4);

  return v5;
}

void __84__SBHStackConfigurationIconListView__setupCustomBackgroundConfigurationForIconView___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;

  v5 = a2;
  v6 = a3;
  v7 = objc_opt_class();
  v13 = v5;
  if (v7)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v8 = v13;
    else
      v8 = 0;
  }
  else
  {
    v8 = 0;
  }
  v9 = v8;

  objc_msgSend(v9, "widgetBackgroundView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
    v11 = v10;
  else
    v11 = v13;
  v12 = v11;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (SBIconViewDelegate)iconViewDelegate
{
  return (SBIconViewDelegate *)objc_loadWeakRetained((id *)&self->_iconViewDelegate);
}

- (void)setIconViewDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_iconViewDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_iconViewDelegate);
}

@end
