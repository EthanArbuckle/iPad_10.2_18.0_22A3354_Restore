@implementation SXContainerComponentView

- (SXContainerComponentView)initWithDOMObjectProvider:(id)a3 viewport:(id)a4 presentationDelegate:(id)a5 componentStyleRendererFactory:(id)a6 mediaSharingPolicyProvider:(id)a7
{
  id v13;
  SXContainerComponentView *v14;
  SXContainerComponentView *v15;
  objc_super v17;

  v13 = a7;
  v17.receiver = self;
  v17.super_class = (Class)SXContainerComponentView;
  v14 = -[SXComponentView initWithDOMObjectProvider:viewport:presentationDelegate:componentStyleRendererFactory:](&v17, sel_initWithDOMObjectProvider_viewport_presentationDelegate_componentStyleRendererFactory_, a3, a4, a5, a6);
  v15 = v14;
  if (v14)
    objc_storeStrong((id *)&v14->_mediaSharingPolicyProvider, a7);

  return v15;
}

- (void)presentComponentWithChanges:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  SXDragManager *v7;
  void *v8;
  SXDragManager *v9;
  void *v10;
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)SXContainerComponentView;
  -[SXComponentView presentComponentWithChanges:](&v12, sel_presentComponentWithChanges_, *(_QWORD *)&a3.var0 & 0xFFFFFFLL);
  -[SXContainerComponentView dragManager](self, "dragManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    -[SXContainerComponentView componentViews](self, "componentViews");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v4, "count"))
    {
      -[SXComponentView fillView](self, "fillView");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "dragable");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v6)
        return;
      v7 = [SXDragManager alloc];
      -[SXContainerComponentView mediaSharingPolicyProvider](self, "mediaSharingPolicyProvider");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[SXDragManager initWithSharingPolicy:dataSource:](v7, "initWithSharingPolicy:dataSource:", objc_msgSend(v8, "mediaSharingPolicy"), self);
      -[SXContainerComponentView setDragManager:](self, "setDragManager:", v9);

      -[SXContainerComponentView dragManager](self, "dragManager");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[SXComponentView fillView](self, "fillView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "dragable");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "updateAccessibilityDragSourceDescriptorsForDraggableElement:", v11);

    }
  }

}

- (id)contentViewForBehavior:(id)a3
{
  id v4;
  SXContainerComponentView *v5;
  void *v6;
  uint64_t v8;

  v4 = a3;
  v5 = self;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    -[SXComponentView fillView](v5, "fillView");
    v6 = v5;
    v5 = (SXContainerComponentView *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_5;
    -[SXComponentView fillView](v5, "fillView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      -[SXComponentView fillView](v5, "fillView");
      v8 = objc_claimAutoreleasedReturnValue();

      v5 = (SXContainerComponentView *)v8;
    }
  }

LABEL_5:
  return v5;
}

- (id)componentViewsForRole:(int)a3 recursive:(BOOL)a4
{
  _BOOL4 v4;
  uint64_t v5;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v4 = a4;
  v5 = *(_QWORD *)&a3;
  v22 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[SXContainerComponentView componentViews](self, "componentViews", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v13, "component");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v14, "role") == (_DWORD)v5)
          objc_msgSend(v7, "addObject:", v13);
        if (v4)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v13, "componentViewsForRole:recursive:", v5, 1);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "addObjectsFromArray:", v15);

          }
        }

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v10);
  }

  return v7;
}

- (void)addComponentView:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  unint64_t v14;
  void *v15;
  id v16;

  v16 = a3;
  -[SXComponentView fillView](self, "fillView");

  -[SXComponentView contentView](self, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "subviews");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    v7 = 0;
    while (1)
    {
      -[SXComponentView contentView](self, "contentView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "subviews");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectAtIndex:", v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v11 = objc_msgSend(v10, "componentIndex");
        if (v11 > objc_msgSend(v16, "componentIndex"))
          break;
      }

      ++v7;
      -[SXComponentView contentView](self, "contentView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "subviews");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "count");

      if (v7 >= v14)
        goto LABEL_6;
    }

    -[SXComponentView contentView](self, "contentView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "insertSubview:atIndex:", v16, v7);
  }
  else
  {
LABEL_6:
    -[SXComponentView contentView](self, "contentView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addSubview:", v16);
  }

}

- (void)removeComponentView:(id)a3
{
  objc_msgSend(a3, "removeFromSuperview");
}

- (CGRect)transitionContentFrame
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  CGRect result;

  -[SXComponentView contentFrame](self, "contentFrame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[SXComponentView fillView](self, "fillView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[SXComponentView fillView](self, "fillView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXComponentView fillView](self, "fillView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "contentFrame");
    v15 = v14;
    v17 = v16;
    v19 = v18;
    v21 = v20;
    -[SXComponentView fillView](self, "fillView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "superview");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "convertRect:toView:", v23, v15, v17, v19, v21);
    v4 = v24;
    v6 = v25;
    v8 = v26;
    v10 = v27;

  }
  v28 = v4;
  v29 = v6;
  v30 = v8;
  v31 = v10;
  result.size.height = v31;
  result.size.width = v30;
  result.origin.y = v29;
  result.origin.x = v28;
  return result;
}

- (BOOL)usesThumbnailWithImageIdentifier:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  char isKindOfClass;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  void *v20;
  char v21;

  v4 = a3;
  -[SXComponentView fillView](self, "fillView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fill");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)v6;
    -[SXComponentView fillView](self, "fillView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "fill");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      -[SXComponentView fillView](self, "fillView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "fill");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v12, "imageIdentifier");
      v13 = objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
  }
  else
  {

  }
  -[SXComponentView fillView](self, "fillView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "fill");
  v14 = objc_claimAutoreleasedReturnValue();
  if (!v14)
  {
    v20 = 0;
    goto LABEL_10;
  }
  v15 = (void *)v14;
  -[SXComponentView fillView](self, "fillView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "fill");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v18 = objc_opt_isKindOfClass();

  if ((v18 & 1) == 0)
  {
    v20 = 0;
    goto LABEL_12;
  }
  -[SXComponentView fillView](self, "fillView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "fill");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "stillImageIdentifier");
  v13 = objc_claimAutoreleasedReturnValue();
LABEL_8:
  v20 = (void *)v13;
LABEL_10:

LABEL_12:
  v21 = objc_msgSend(v4, "isEqualToString:", v20);

  return v21;
}

- (BOOL)transitionViewShouldFadeInContent
{
  return 1;
}

- (BOOL)isTransitionable
{
  void *v2;
  void *v3;
  BOOL v4;

  -[SXComponentView fillView](self, "fillView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fill");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "fillMode") != 0;

  return v4;
}

- (void)prepareForTransitionType:(unint64_t)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  objc_super v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v14.receiver = self;
  v14.super_class = (Class)SXContainerComponentView;
  -[SXComponentView prepareForTransitionType:](&v14, sel_prepareForTransitionType_);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[SXContainerComponentView componentViews](self, "componentViews", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "prepareForTransitionType:", a3);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
    }
    while (v7);
  }

}

- (void)animationDidStart:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  objc_super v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SXContainerComponentView;
  -[SXComponentView animationDidStart:](&v14, sel_animationDidStart_, v4);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[SXContainerComponentView componentViews](self, "componentViews", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "animationDidStart:", v4);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
    }
    while (v7);
  }

}

- (void)animationDidFinish:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  objc_super v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SXContainerComponentView;
  -[SXComponentView animationDidFinish:](&v14, sel_animationDidFinish_, v4);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[SXContainerComponentView componentViews](self, "componentViews", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "animationDidFinish:", v4);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
    }
    while (v7);
  }

}

- (void)didApplyBehavior:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  objc_super v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SXContainerComponentView;
  -[SXComponentView didApplyBehavior:](&v14, sel_didApplyBehavior_, v4);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[SXContainerComponentView componentViews](self, "componentViews", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "didApplyBehavior:", v4);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
    }
    while (v7);
  }

}

- (id)dragManager:(id)a3 dragableAtLocation:(CGPoint)a4
{
  void *v4;
  void *v5;

  -[SXComponentView fillView](self, "fillView", a3, a4.x, a4.y);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dragable");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)userInteractable
{
  void *v2;
  BOOL v3;

  -[SXContainerComponentView dragManager](self, "dragManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (BOOL)allowHierarchyRemoval
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  BOOL v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  objc_super v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v14.receiver = self;
  v14.super_class = (Class)SXContainerComponentView;
  if (!-[SXComponentView allowHierarchyRemoval](&v14, sel_allowHierarchyRemoval))
    return 0;
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[SXContainerComponentView componentViews](self, "componentViews", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        if (!objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "allowHierarchyRemoval"))
        {
          v8 = 0;
          goto LABEL_13;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
      if (v5)
        continue;
      break;
    }
  }
  v8 = 1;
LABEL_13:

  return v8;
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  -[SXComponentView component](self, "component");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXComponentView component](self, "component");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "components");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; identifier: '%@'; numberOfChilds: %lu>"),
    v4,
    self,
    v6,
    objc_msgSend(v8, "count"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v9;
}

- (NSArray)componentViews
{
  return self->_componentViews;
}

- (void)setComponentViews:(id)a3
{
  objc_storeStrong((id *)&self->_componentViews, a3);
}

- (SXMediaSharingPolicyProvider)mediaSharingPolicyProvider
{
  return self->_mediaSharingPolicyProvider;
}

- (SXDragManager)dragManager
{
  return self->_dragManager;
}

- (void)setDragManager:(id)a3
{
  objc_storeStrong((id *)&self->_dragManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dragManager, 0);
  objc_storeStrong((id *)&self->_mediaSharingPolicyProvider, 0);
  objc_storeStrong((id *)&self->_componentViews, 0);
}

@end
