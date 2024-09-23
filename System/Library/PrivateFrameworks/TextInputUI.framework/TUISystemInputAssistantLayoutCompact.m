@implementation TUISystemInputAssistantLayoutCompact

- (void)_layoutViewSet:(id)a3 forFixedCenterViewWidth:(double)a4 inBounds:(CGRect)a5 forAssistantView:(id)a6
{
  double height;
  double width;
  id v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;

  height = a5.size.height;
  width = a5.size.width;
  v25 = a3;
  v9 = a6;
  objc_msgSend(v25, "viewSetContainer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "translatesAutoresizingMaskIntoConstraints");

  if (v11)
  {
    objc_msgSend(v25, "viewSetContainer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bounds");
    objc_msgSend(v12, "setFrame:");

  }
  else
  {
    objc_msgSend(v9, "resetContainerConstraints");
  }
  objc_msgSend(v25, "leftButtonBar");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "effectiveInterItemSpacing");
  v15 = v14;
  objc_msgSend(v25, "leftButtonBar");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setEffectiveInterItemSpacing:", v15);

  objc_msgSend(v25, "leftButtonBar");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setButtonAlignment:", 1);

  v18 = width * 0.5 + -32.5;
  v19 = height + -50.0;
  objc_msgSend(v25, "leftButtonBar");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setFrame:", v18, v19, 65.0, 50.0);
  objc_msgSend(v25, "rightButtonBar");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setFrame:", v18, v19, 65.0, 50.0);
  objc_msgSend(v25, "centerView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setFrame:", v18, v19, 65.0, 50.0);

  objc_msgSend(v25, "centerView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setAlpha:", 0.0);

  objc_msgSend(v25, "rightButtonBar");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setAlpha:", 0.0);

}

- (void)configureButtonBarsInViewSet:(id)a3 forApplicationAssistantItem:(id)a4 withSystemAssistantItem:(id)a5 withAssistantView:(id)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;

  v10 = a6;
  v11 = a3;
  -[TUISystemInputAssistantLayoutCompact _buttonBarGroupSetForApplicationAssistantItem:withSystemInputAssistantItem:forAssistantView:](self, "_buttonBarGroupSetForApplicationAssistantItem:withSystemInputAssistantItem:forAssistantView:", a4, a5, v10);
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "leftButtonBar");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "unifiedButtonGroups");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setButtonGroups:animated:", v13, objc_msgSend(v10, "isTransitioning"));

  objc_msgSend(v11, "rightButtonBar");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = objc_msgSend(v10, "isTransitioning");
  objc_msgSend(v14, "setButtonGroups:animated:", MEMORY[0x1E0C9AA60], v15);

}

- (id)_buttonBarGroupSetForApplicationAssistantItem:(id)a3 withSystemInputAssistantItem:(id)a4 forAssistantView:(id)a5
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  TUIButtonBarGroupSet *v11;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  objc_msgSend(v5, "leadingBarButtonGroups");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7)
  {
    objc_msgSend(v5, "leadingBarButtonGroups");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = (void *)MEMORY[0x1E0C9AA60];
  }
  v11 = objc_alloc_init(TUIButtonBarGroupSet);
  -[TUIButtonBarGroupSet setTrailingButtonGroups:](v11, "setTrailingButtonGroups:", v10);
  -[TUIButtonBarGroupSet setUnifiedButtonGroups:](v11, "setUnifiedButtonGroups:", v10);

  return v11;
}

- (void)invalidate:(id)a3
{
  id v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)TUISystemInputAssistantLayoutCompact;
  v3 = a3;
  -[TUISystemInputAssistantLayout invalidate:](&v16, sel_invalidate_, v3);
  objc_msgSend(v3, "leftButtonBar", v16.receiver, v16.super_class);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "minimumInterItemSpace");
  v6 = v5;
  objc_msgSend(v3, "leftButtonBar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setEffectiveInterItemSpacing:", v6);

  objc_msgSend(v3, "leftButtonBar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setButtonAlignment:", 0);

  objc_msgSend(v3, "rightButtonBar");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "minimumInterItemSpace");
  v11 = v10;
  objc_msgSend(v3, "rightButtonBar");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setEffectiveInterItemSpacing:", v11);

  objc_msgSend(v3, "rightButtonBar");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setButtonAlignment:", 2);

  objc_msgSend(v3, "rightButtonBar");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setAlpha:", 1.0);

  objc_msgSend(v3, "centerView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "setAlpha:", 1.0);
}

@end
