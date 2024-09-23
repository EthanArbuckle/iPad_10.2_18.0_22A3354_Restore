@implementation PLInterfaceActionGroupView

+ (void)initialize
{
  id v3;

  objc_opt_self();
  v3 = (id)objc_claimAutoreleasedReturnValue();

  if (v3 == a1)
    PLRegisterPlatterKitLogging();
}

- (PLInterfaceActionGroupView)initWithFrame:(CGRect)a3
{
  PLInterfaceActionGroupView *v3;
  PLInterfaceActionGroupView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PLInterfaceActionGroupView;
  v3 = -[PLInterfaceActionGroupView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[PLInterfaceActionGroupView setClipsToBounds:](v3, "setClipsToBounds:", 1);
  return v4;
}

- (NSArray)actions
{
  void *v2;
  void *v3;

  -[UIInterfaceActionGroupView actionGroup](self->_actionsGroupView, "actionGroup");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "actions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (void)_updateStylingOfInterfaceActionGroupView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint64_t v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PLInterfaceActionGroupView visualStylingProviderForCategory:](self, "visualStylingProviderForCategory:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_visualStylingForStyle:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  objc_msgSend(v4, "actionGroup", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "actions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v23 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        if (objc_msgSend(v13, "type") != 2)
        {
          objc_msgSend(v6, "color");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "_setTitleTextColor:", v14);

        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v10);
  }

  -[PLInterfaceActionGroupView visualStylingProviderForCategory:](self, "visualStylingProviderForCategory:", 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "_visualStylingForStyle:", 5);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    v17 = objc_alloc_init(MEMORY[0x1E0CEA6A0]);
    objc_msgSend(v16, "composedFilter");
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = (void *)v18;
    if (v18)
    {
      v26 = v18;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v26, 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setFilters:", v20);

    }
    else if (os_log_type_enabled((os_log_t)PLLogGeneral, OS_LOG_TYPE_ERROR))
    {
      -[PLInterfaceActionGroupView _updateStylingOfInterfaceActionGroupView:].cold.2();
    }
    objc_msgSend(v16, "color");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setBackgroundColor:", v21);

    objc_msgSend(v16, "alpha");
    objc_msgSend(v17, "setOpacity:");
    objc_msgSend(v4, "_setVisualStyleOverrideSeparatorAttributes:", v17);

  }
  else if (os_log_type_enabled((os_log_t)PLLogGeneral, OS_LOG_TYPE_ERROR))
  {
    -[PLInterfaceActionGroupView _updateStylingOfInterfaceActionGroupView:].cold.1();
  }

}

- (id)_newInterfaceActionGroupViewWithActions:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CEA690], "actionGroupWithActions:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA698]), "initWithActionGroup:actionHandlerInvocationDelegate:", v4, 0);
  objc_msgSend(v5, "setPresentationStyle:", 2);
  -[PLInterfaceActionGroupView _updateStylingOfInterfaceActionGroupView:](self, "_updateStylingOfInterfaceActionGroupView:", v5);
  objc_msgSend(v5, "_setDrawsBackground:", 0);
  objc_msgSend(v5, "_setSelectionHighlightContinuousCornerRadius:", self->_cornerRadius);

  return v5;
}

- (void)setActions:(id)a3
{
  void *v4;
  char v5;
  UIInterfaceActionGroupView *v6;
  UIInterfaceActionGroupView *actionsGroupView;
  id v8;

  v8 = a3;
  -[PLInterfaceActionGroupView actions](self, "actions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v8, "isEqualToArray:", v4);

  if ((v5 & 1) == 0)
  {
    -[UIInterfaceActionGroupView removeFromSuperview](self->_actionsGroupView, "removeFromSuperview");
    v6 = -[PLInterfaceActionGroupView _newInterfaceActionGroupViewWithActions:](self, "_newInterfaceActionGroupViewWithActions:", v8);
    actionsGroupView = self->_actionsGroupView;
    self->_actionsGroupView = v6;

    -[PLInterfaceActionGroupView addSubview:](self, "addSubview:", self->_actionsGroupView);
    self->_actionsDirty = 1;
  }

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[UIInterfaceActionGroupView sizeThatFits:](self->_actionsGroupView, "sizeThatFits:", a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[5];
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PLInterfaceActionGroupView;
  -[PLInterfaceActionGroupView layoutSubviews](&v7, sel_layoutSubviews);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __44__PLInterfaceActionGroupView_layoutSubviews__block_invoke;
  v6[3] = &unk_1E91D3160;
  v6[4] = self;
  objc_msgSend(MEMORY[0x1E0CEABB0], "performWithoutAnimation:", v6);
  if (self->_actionsDirty
    && objc_msgSend(MEMORY[0x1E0CEABB0], "_isInAnimationBlockWithAnimationsEnabled"))
  {
    objc_msgSend(MEMORY[0x1E0CD28D0], "animation");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3048]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setTimingFunction:", v4);

    objc_msgSend(v3, "setType:", *MEMORY[0x1E0CD3170]);
    objc_msgSend(MEMORY[0x1E0CEABB0], "_currentAnimationDuration");
    objc_msgSend(v3, "setDuration:");
    -[PLInterfaceActionGroupView layer](self, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addAnimation:forKey:", v3, CFSTR("kCATransitionFade"));

  }
  self->_actionsDirty = 0;
}

uint64_t __44__PLInterfaceActionGroupView_layoutSubviews__block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void *v3;

  v2 = *(_QWORD **)(a1 + 32);
  v3 = (void *)v2[52];
  objc_msgSend(v2, "bounds");
  objc_msgSend(v3, "setFrame:");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 416), "layoutIfNeeded");
}

- (id)visualStylingProviderForCategory:(int64_t)a3
{
  NSMutableDictionary *categoriesToProviders;
  void *v4;
  void *v5;

  categoriesToProviders = self->_categoriesToProviders;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](categoriesToProviders, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSArray)requiredVisualStyleCategories
{
  return (NSArray *)&unk_1E91E2EF8;
}

- (void)setVisualStylingProvider:(id)a3 forCategory:(int64_t)a4
{
  NSMutableDictionary *v6;
  NSMutableDictionary *categoriesToProviders;
  void *v8;
  void *v9;
  NSMutableDictionary *v10;
  id v11;

  v11 = a3;
  if (!self->_categoriesToProviders)
  {
    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    categoriesToProviders = self->_categoriesToProviders;
    self->_categoriesToProviders = v6;

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](self->_categoriesToProviders, "objectForKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_removeObserver:", self);

  v10 = self->_categoriesToProviders;
  if (v11)
  {
    -[NSMutableDictionary setObject:forKey:](v10, "setObject:forKey:", v11, v8);
    objc_msgSend(v11, "_addObserver:", self);
  }
  else
  {
    -[NSMutableDictionary removeObjectForKey:](v10, "removeObjectForKey:", v8);
  }

}

- (void)providedStylesDidChangeForProvider:(id)a3
{
  -[PLInterfaceActionGroupView _updateStylingOfInterfaceActionGroupView:](self, "_updateStylingOfInterfaceActionGroupView:", self->_actionsGroupView);
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (void)setCornerRadius:(double)a3
{
  self->_cornerRadius = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_categoriesToProviders, 0);
  objc_storeStrong((id *)&self->_actionsGroupView, 0);
}

- (void)_updateStylingOfInterfaceActionGroupView:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1D1285000, v0, v1, "%{public}@: Failed to obtain viaual styling from provider: %{public}@");
}

- (void)_updateStylingOfInterfaceActionGroupView:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1D1285000, v0, v1, "%{public}@: Failed to obtain composed filter from viaual styling: %{public}@");
}

@end
