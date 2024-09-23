@implementation PRWidgetIconViewProvider

- (PRWidgetIconViewProvider)initWithRecycledViewsContainerProvider:(id)a3 widgetInteractionDisabled:(BOOL)a4 useMaterialBackground:(BOOL)a5
{
  id v8;
  PRWidgetIconViewProvider *v9;
  PRWidgetIconViewProvider *v10;
  objc_super v12;

  v8 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PRWidgetIconViewProvider;
  v9 = -[PRWidgetIconViewProvider init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeWeak((id *)&v9->_recycledViewsContainerProvider, v8);
    v10->_widgetInteractionDisabled = a4;
    v10->_useMaterialBackground = a5;
  }

  return v10;
}

- (id)iconViewMap
{
  SBHReusableViewMap *iconViewMap;
  SBHReusableViewMap *v4;
  SBHReusableViewMap *v5;

  iconViewMap = self->_iconViewMap;
  if (!iconViewMap)
  {
    v4 = (SBHReusableViewMap *)objc_msgSend(objc_alloc(MEMORY[0x1E0DAA508]), "initWithDelegate:", self);
    v5 = self->_iconViewMap;
    self->_iconViewMap = v4;

    iconViewMap = self->_iconViewMap;
  }
  return iconViewMap;
}

- (id)dequeueReusableIconViewOfClass:(Class)a3
{
  void *v4;
  void *v5;

  -[PRWidgetIconViewProvider iconViewMap](self, "iconViewMap");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dequeueReusableViewOfClass:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)recycleIconView:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PRWidgetIconViewProvider iconViewMap](self, "iconViewMap");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "recycleView:", v4);

}

- (BOOL)isIconViewRecycled:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[PRWidgetIconViewProvider iconViewMap](self, "iconViewMap");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isViewRecycled:", v4);

  return v6;
}

- (void)configureIconView:(id)a3 forIcon:(id)a4
{
  id v5;

  v5 = a3;
  objc_msgSend(v5, "setAllowsEditingAnimation:", 0);
  objc_msgSend(v5, "setDelegate:", self);
  objc_msgSend(v5, "addObserver:", self);

}

- (unint64_t)viewMap:(id)a3 maxRecycledViewsOfClass:(Class)a4
{
  return 16;
}

- (id)recycledViewsContainerProviderForViewMap:(id)a3
{
  return objc_loadWeakRetained((id *)&self->_recycledViewsContainerProvider);
}

- (id)customImageViewControllerForIconView:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  PRComplicationDescriptor *v15;
  void *v16;
  void *v17;
  PRComplicationDescriptor *v18;
  PRWidgetIconViewController *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  void *v35;
  void *v36;
  void *v37;
  void *v38;

  objc_msgSend(a3, "icon");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_class();
  v6 = v4;
  if (v5)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;
  }
  else
  {
    v7 = 0;
  }
  v8 = v7;

  objc_msgSend(v8, "activeWidget");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "kind");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "extensionBundleIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "containerBundleIdentifier");
  v12 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "gridSizeClass");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v38 = (void *)v12;
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D10148]), "initWithExtensionBundleIdentifier:containerBundleIdentifier:kind:family:intent:", v11, v12, v10, PRWidgetFamilyForIconGridSizeClass(v13), 0);
  v15 = [PRComplicationDescriptor alloc];
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "UUIDString");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[PRComplicationDescriptor initWithUniqueIdentifier:widget:](v15, "initWithUniqueIdentifier:widget:", v17, v14);

  if (v18)
  {
    v36 = v11;
    v37 = v10;
    v19 = -[PRWidgetIconViewController initWithComplicationDescriptor:contentType:]([PRWidgetIconViewController alloc], "initWithComplicationDescriptor:contentType:", v18, 1);
    -[PRWidgetIconViewController setBackgroundHidden:](v19, "setBackgroundHidden:", 0);
    -[PRWidgetIconViewController setWidgetInteractionDisabled:](v19, "setWidgetInteractionDisabled:", -[PRWidgetIconViewProvider isWidgetInteractionDisabled](self, "isWidgetInteractionDisabled"));
    -[PRWidgetIconViewController setUseMaterialBackground:](v19, "setUseMaterialBackground:", -[PRWidgetIconViewProvider useMaterialBackground](self, "useMaterialBackground"));
    v20 = objc_alloc(MEMORY[0x1E0D10258]);
    objc_msgSend(MEMORY[0x1E0DC3658], "darkGrayColor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "BSColor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)objc_msgSend(v20, "initWithPrimaryTintColor:secondaryTintColor:filterStyle:fallbackFilterStyle:fraction:", 0, v22, 4, 4, 1.0);

    -[PRWidgetIconViewController widgetHostViewController](v19, "widgetHostViewController");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setTintParameters:", v23);

    -[PRComplicationDescriptor widget](v18, "widget");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    PRSharedWidgetDescriptorProvider();
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "descriptorForPersonality:", v25);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v27, "intentType");
    v28 = objc_claimAutoreleasedReturnValue();
    if (v28)
    {
      v29 = (void *)v28;
      objc_msgSend(v25, "intent");
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v30)
      {
        objc_msgSend(v27, "defaultIntent");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        if (v31)
        {
          -[PRWidgetIconViewController widgetHostViewController](v19, "widgetHostViewController");
          v32 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "widgetByReplacingIntent:", v31);
          v35 = v31;
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          -[PRComplicationDescriptor setWidget:](v18, "setWidget:", v33);
          -[NSObject setWidget:](v32, "setWidget:", v33);

          v31 = v35;
        }
        else
        {
          PRLogCommon();
          v32 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
            -[PRWidgetIconViewProvider customImageViewControllerForIconView:].cold.1(v25, v32);
        }

      }
    }

    v11 = v36;
    v10 = v37;
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (id)dragItemsForIconView:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "icon");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  SBHIconDragItemWithIconAndIconView();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v8[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)iconViewWillBeginDrag:(id)a3 session:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[PRWidgetIconViewProvider dragManager](self, "dragManager");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "iconViewWillBeginDrag:session:", v7, v6);

}

- (BOOL)iconView:(id)a3 canAddDragItemsToSession:(id)a4
{
  return 0;
}

- (void)iconView:(id)a3 willAnimateDragLiftWithAnimator:(id)a4 session:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[PRWidgetIconViewProvider dragManager](self, "dragManager");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "iconView:willAnimateDragLiftWithAnimator:session:", v10, v9, v8);

}

- (void)iconView:(id)a3 dragLiftAnimationDidChangeDirection:(int64_t)a4
{
  id v6;
  id v7;

  v6 = a3;
  -[PRWidgetIconViewProvider dragManager](self, "dragManager");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "iconView:dragLiftAnimationDidChangeDirection:", v6, a4);

}

- (void)iconView:(id)a3 item:(id)a4 willAnimateDragCancelWithAnimator:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[PRWidgetIconViewProvider dragManager](self, "dragManager");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "iconView:item:willAnimateDragCancelWithAnimator:", v10, v9, v8);

}

- (void)iconView:(id)a3 didEndDragSession:(id)a4 withOperation:(unint64_t)a5
{
  id v8;
  id v9;
  id v10;

  v8 = a4;
  v9 = a3;
  -[PRWidgetIconViewProvider dragManager](self, "dragManager");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "iconView:didEndDragSession:withOperation:", v9, v8, a5);

}

- (id)iconView:(id)a3 dragPreviewForItem:(id)a4 session:(id)a5 previewParameters:(id)a6
{
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  PRComplicationDragPreviewView *v13;
  void *v14;
  PRComplicationDragPreviewView *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  id v25;
  __int128 v26;
  void *v27;
  void *v28;
  _OWORD v30[3];

  v6 = a3;
  objc_msgSend(v6, "customIconImageViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_class();
  v9 = v7;
  if (v8)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v10 = v9;
    else
      v10 = 0;
  }
  else
  {
    v10 = 0;
  }
  v11 = v10;

  objc_msgSend(v11, "widgetHostViewController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = [PRComplicationDragPreviewView alloc];
  objc_msgSend(v12, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[PRComplicationDragPreviewView initWithWidgetHostView:](v13, "initWithWidgetHostView:", v14);

  v16 = objc_alloc_init(MEMORY[0x1E0DC3B78]);
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setBackgroundColor:", v17);

  v18 = objc_alloc_init(MEMORY[0x1E0DC3508]);
  objc_msgSend(v16, "setShadowPath:", v18);

  objc_msgSend(v6, "customIconImageViewController");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "view");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "frame");
  BSRectGetCenter();
  v22 = v21;
  v24 = v23;

  v25 = objc_alloc(MEMORY[0x1E0DC3B88]);
  v26 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v30[0] = *MEMORY[0x1E0C9BAA8];
  v30[1] = v26;
  v30[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  v27 = (void *)objc_msgSend(v25, "initWithContainer:center:transform:", v6, v30, v22, v24);

  v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D88]), "initWithView:parameters:target:", v15, v16, v27);
  return v28;
}

- (void)iconView:(id)a3 didChangeCustomImageViewController:(id)a4
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;

  v4 = a4;
  objc_opt_self();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v4;
  if (v5)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v8;
    else
      v6 = 0;
  }
  else
  {
    v6 = 0;
  }
  v7 = v6;

  objc_msgSend(v7, "invalidate");
}

- (BOOL)isWidgetInteractionDisabled
{
  return self->_widgetInteractionDisabled;
}

- (BOOL)useMaterialBackground
{
  return self->_useMaterialBackground;
}

- (SBIconDragManager)dragManager
{
  return self->_dragManager;
}

- (void)setDragManager:(id)a3
{
  objc_storeStrong((id *)&self->_dragManager, a3);
}

- (SBHRecycledViewsContainerProviding)recycledViewsContainerProvider
{
  return (SBHRecycledViewsContainerProviding *)objc_loadWeakRetained((id *)&self->_recycledViewsContainerProvider);
}

- (void)setRecycledViewsContainerProvider:(id)a3
{
  objc_storeWeak((id *)&self->_recycledViewsContainerProvider, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_recycledViewsContainerProvider);
  objc_storeStrong((id *)&self->_dragManager, 0);
  objc_storeStrong((id *)&self->_iconViewMap, 0);
}

- (void)customImageViewControllerForIconView:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v4;
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "extensionBundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "kind");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = v4;
  v8 = 2112;
  v9 = v5;
  _os_log_error_impl(&dword_18B634000, a2, OS_LOG_TYPE_ERROR, "Default intent asked for but not provided: %@ - %@", (uint8_t *)&v6, 0x16u);

}

@end
