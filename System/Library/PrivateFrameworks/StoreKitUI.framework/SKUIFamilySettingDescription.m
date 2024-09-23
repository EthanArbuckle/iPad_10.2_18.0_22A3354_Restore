@implementation SKUIFamilySettingDescription

- (SKUIFamilySettingDescription)initWithViewElement:(id)a3 parent:(id)a4
{
  id v6;
  id v7;
  SKUIFamilySettingDescription *v8;
  SKUIFamilySettingDescription *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUIFamilySettingDescription initWithViewElement:parent:].cold.1();
  }
  v11.receiver = self;
  v11.super_class = (Class)SKUIFamilySettingDescription;
  v8 = -[SKUISettingDescription initWithViewElement:parent:](&v11, sel_initWithViewElement_parent_, v6, v7);
  v9 = v8;
  if (v8)
  {
    v8->_viewState = -1;
    -[SKUIFamilySettingDescription _updateViewState](v8, "_updateViewState");
  }

  return v9;
}

- (void)handleSelectionOnCompletion:(id)a3
{
  id v4;
  unint64_t v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  v5 = self->_viewState + 1;
  if (v5 > 3)
    v6 = CFSTR("complete");
  else
    v6 = off_1E73A2FF0[v5];
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", v6, CFSTR("state"), 0);
  -[SKUISettingDescription viewElement](self, "viewElement");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __60__SKUIFamilySettingDescription_handleSelectionOnCompletion___block_invoke;
  v10[3] = &unk_1E73A2150;
  v11 = v4;
  v9 = v4;
  objc_msgSend(v8, "dispatchEventOfType:canBubble:isCancelable:extraInfo:completionBlock:", 2, 1, 1, v7, v10);

}

void __60__SKUIFamilySettingDescription_handleSelectionOnCompletion___block_invoke(uint64_t a1)
{
  dispatch_async(MEMORY[0x1E0C80D38], *(dispatch_block_t *)(a1 + 32));
}

+ (Class)_viewClassForSettingDescription:(id)a3
{
  return (Class)objc_opt_class();
}

- (BOOL)_initiallyHidden
{
  return (unint64_t)(self->_viewState - 4) < 0xFFFFFFFFFFFFFFFDLL;
}

- (void)_updateViewState
{
  SKUISettingsFamilyViewStateCoordinator *viewStateCoordinator;
  SKUISettingsFamilyViewStateCoordinator *v4;
  SKUISettingsFamilyViewStateCoordinator *v5;
  _QWORD v6[4];
  id v7;
  id location;

  objc_initWeak(&location, self);
  viewStateCoordinator = self->_viewStateCoordinator;
  if (!viewStateCoordinator)
  {
    v4 = objc_alloc_init(SKUISettingsFamilyViewStateCoordinator);
    v5 = self->_viewStateCoordinator;
    self->_viewStateCoordinator = v4;

    viewStateCoordinator = self->_viewStateCoordinator;
  }
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __48__SKUIFamilySettingDescription__updateViewState__block_invoke;
  v6[3] = &unk_1E73A2FD0;
  objc_copyWeak(&v7, &location);
  -[SKUISettingsFamilyViewStateCoordinator checkSettingsFamilyViewStateWithBlock:](viewStateCoordinator, "checkSettingsFamilyViewStateWithBlock:", v6);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __48__SKUIFamilySettingDescription__updateViewState__block_invoke(uint64_t a1, void *a2)
{
  _QWORD v3[4];
  id v4[2];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __48__SKUIFamilySettingDescription__updateViewState__block_invoke_2;
  v3[3] = &unk_1E73A2FA8;
  objc_copyWeak(v4, (id *)(a1 + 32));
  v4[1] = a2;
  dispatch_async(MEMORY[0x1E0C80D38], v3);
  objc_destroyWeak(v4);
}

void __48__SKUIFamilySettingDescription__updateViewState__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateWithViewState:", *(_QWORD *)(a1 + 40));

}

- (void)_updateWithViewState:(int64_t)a3
{
  self->_viewState = a3;
  if ((unint64_t)(a3 - 1) >= 3)
  {
    if (a3)
    {
      if (a3 == -1 && !-[SKUISettingDescription _isHidden](self, "_isHidden"))
        -[SKUISettingDescription _hideSetting](self, "_hideSetting");
    }
    else
    {
      -[SKUISettingDescription _deleteSetting](self, "_deleteSetting");
    }
  }
  else
  {
    if (-[SKUISettingDescription _isHidden](self, "_isHidden"))
      -[SKUISettingDescription _revealSetting](self, "_revealSetting");
    -[SKUISettingDescription _reloadSetting](self, "_reloadSetting");
  }
}

- (int64_t)viewState
{
  return self->_viewState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewStateCoordinator, 0);
}

- (void)initWithViewElement:parent:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIFamilySettingDescription initWithViewElement:parent:]";
}

@end
