@implementation _UITextMenuLinkInteraction

- (void)willMoveToView:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  UIEditMenuInteraction *editMenuInteraction;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)_UITextMenuLinkInteraction;
  -[UITextInteraction willMoveToView:](&v10, sel_willMoveToView_, a3);
  if (!-[_UITextSimpleLinkInteraction shouldProxyContextMenuDelegate](self, "shouldProxyContextMenuDelegate"))
  {
    -[_UITextSimpleLinkInteraction contextMenuInteraction](self, "contextMenuInteraction");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      -[_UITextSimpleLinkInteraction contextMenuInteraction](self, "contextMenuInteraction");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "view");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UITextSimpleLinkInteraction contextMenuInteraction](self, "contextMenuInteraction");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "removeInteraction:", v7);

    }
  }
  editMenuInteraction = self->_editMenuInteraction;
  if (editMenuInteraction)
  {
    -[UIEditMenuInteraction view](editMenuInteraction, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeInteraction:", self->_editMenuInteraction);

  }
}

- (void)didMoveToView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)_UITextMenuLinkInteraction;
  -[UITextInteraction didMoveToView:](&v7, sel_didMoveToView_, v4);
  if (!-[_UITextSimpleLinkInteraction shouldProxyContextMenuDelegate](self, "shouldProxyContextMenuDelegate"))
  {
    -[_UITextSimpleLinkInteraction contextMenuInteraction](self, "contextMenuInteraction");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[_UITextSimpleLinkInteraction contextMenuInteraction](self, "contextMenuInteraction");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addInteraction:", v6);

    }
  }
  if (self->_editMenuInteraction)
    objc_msgSend(v4, "addInteraction:");

}

- (_UITextMenuLinkInteraction)initWithShouldProxyContextMenuDelegate:(BOOL)a3
{
  _UITextMenuLinkInteraction *v4;
  UIContextMenuInteraction *v5;
  uint64_t v6;
  NSMapTable *configurationItems;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_UITextMenuLinkInteraction;
  v4 = -[_UITextSimpleLinkInteraction initWithShouldProxyContextMenuDelegate:](&v9, sel_initWithShouldProxyContextMenuDelegate_);
  if (v4)
  {
    if (!a3)
    {
      v5 = -[UIContextMenuInteraction initWithDelegate:]([UIContextMenuInteraction alloc], "initWithDelegate:", v4);
      -[_UITextSimpleLinkInteraction setContextMenuInteraction:](v4, "setContextMenuInteraction:", v5);

    }
    objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
    v6 = objc_claimAutoreleasedReturnValue();
    configurationItems = v4->_configurationItems;
    v4->_configurationItems = (NSMapTable *)v6;

  }
  return v4;
}

- (id)contextMenuDelegateProxy
{
  _UITextMenuLinkInteraction *v3;

  if (-[_UITextSimpleLinkInteraction shouldProxyContextMenuDelegate](self, "shouldProxyContextMenuDelegate"))
    v3 = self;
  else
    v3 = 0;
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_editMenuInteraction, 0);
  objc_storeStrong((id *)&self->_configurationItems, 0);
}

- (id)editMenuInteraction
{
  UIEditMenuInteraction *editMenuInteraction;
  UIEditMenuInteraction *v4;
  UIEditMenuInteraction *v5;
  void *v6;

  editMenuInteraction = self->_editMenuInteraction;
  if (!editMenuInteraction)
  {
    v4 = -[UIEditMenuInteraction initWithDelegate:]([UIEditMenuInteraction alloc], "initWithDelegate:", self);
    v5 = self->_editMenuInteraction;
    self->_editMenuInteraction = v4;

    -[UIEditMenuInteraction setPresentsContextMenuAsSecondaryAction:](self->_editMenuInteraction, "setPresentsContextMenuAsSecondaryAction:", 0);
    -[UITextInteraction view](self, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addInteraction:", self->_editMenuInteraction);

    editMenuInteraction = self->_editMenuInteraction;
  }
  return editMenuInteraction;
}

- (void)dismissEditMenuOnSelectionChangeIfNecessary
{
  if (!self->_isModifyingSelectionForLinkPresentation)
    -[UIEditMenuInteraction dismissMenu](self->_editMenuInteraction, "dismissMenu");
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  y = a4.y;
  x = a4.x;
  v7 = a3;
  if (-[_UITextSimpleLinkInteraction _allowItemInteractions](self, "_allowItemInteractions"))
  {
    -[_UITextSimpleLinkInteraction itemInteractableView](self, "itemInteractableView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_textInteractableItemAtPoint:precision:", objc_msgSend(v7, "_inputPrecision"), x, y);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v7, "_inputPrecision") == 2 && (objc_msgSend(v9, "hasPrimaryAction") & 1) == 0)
    {
      -[_UITextSimpleLinkInteraction _removeInteractableItemFromCache:](self, "_removeInteractableItemFromCache:", v9);

      v9 = 0;
    }
    else if (v9)
    {
      objc_msgSend(v9, "contextMenuConfiguration");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
        -[NSMapTable setObject:forKey:](self->_configurationItems, "setObject:forKey:", v9, v10);
      goto LABEL_10;
    }
    v10 = 0;
LABEL_10:

    goto LABEL_11;
  }
  v10 = 0;
LABEL_11:

  return v10;
}

- (BOOL)_contextMenuInteraction:(id)a3 shouldAttemptToPresentConfiguration:(id)a4
{
  void *v5;
  void *v6;
  char v7;

  -[NSMapTable objectForKey:](self->_configurationItems, "objectForKey:", a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[_UITextSimpleLinkInteraction itemInteractableView](self, "itemInteractableView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "_allowInteraction:forTextInteractableItem:", 1, v5);

  }
  else
  {
    v7 = 1;
  }

  return v7;
}

- (id)_contextMenuInteraction:(id)a3 styleForMenuWithConfiguration:(id)a4
{
  id v6;
  id v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  CGFloat MidY;
  BOOL v21;
  uint64_t v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  void *v33;
  double v34;
  double v35;
  void *v36;
  double MidX;
  void *v38;
  void *v39;
  double v40;
  double v41;
  double v42;
  uint64_t v43;
  _OWORD v45[2];
  uint64_t v46;
  __int128 v47;
  __int128 v48;
  uint64_t v49;
  CGRect v50;
  CGRect v51;

  v6 = a3;
  v7 = a4;
  getDDContextMenuConfigurationClass();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = objc_msgSend(v7, "prefersActionMenuStyle");
  else
    v8 = 0;
  -[NSMapTable objectForKey:](self->_configurationItems, "objectForKey:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIContextMenuStyle defaultStyle](_UIContextMenuStyle, "defaultStyle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v8)
  {
    objc_msgSend(v10, "setPreferredLayout:", 1);
  }
  else if (self->super._presentingFromSimpleTap || (objc_msgSend(v9, "showsMenuPreview") & 1) == 0)
  {
    objc_msgSend(v11, "setPreferredLayout:", 3);
    -[_UITextMenuLinkInteraction _targetedPreviewForItem:dismissing:](self, "_targetedPreviewForItem:dismissing:", v9, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "view");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "_window");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "target");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "container");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "target");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "center");
    objc_msgSend(v16, "convertPoint:toView:", v14);
    v19 = v18;

    v49 = 0;
    v47 = 0u;
    v48 = 0u;
    if (v11)
      objc_msgSend(v11, "_preferredAnchor");
    objc_msgSend(v14, "bounds");
    MidY = CGRectGetMidY(v50);
    v21 = v19 <= MidY;
    v22 = 4;
    if (v19 > MidY)
      v22 = 1;
    v23 = -8.0;
    if (!v21)
      v23 = 5.0;
    *(_QWORD *)&v47 = v22;
    *(double *)&v48 = v23;
    objc_msgSend(v6, "view");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "traitCollection");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    _UIContextMenuGetPlatformMetrics(objc_msgSend(v25, "userInterfaceIdiom"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "menuItemInternalPadding");
    v28 = v27;

    objc_msgSend(v12, "parameters");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "visiblePath");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "bounds");
    v32 = v31;

    objc_msgSend(v12, "view");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "bounds");
    v35 = v34 - v32 - v28;

    objc_msgSend(v12, "view");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "frame");
    MidX = CGRectGetMidX(v51);
    objc_msgSend(v12, "target");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "container");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "center");
    v41 = v40;

    v42 = -v35;
    v43 = 8;
    if (MidX < v41)
    {
      v43 = 2;
      v42 = v35;
    }
    *((_QWORD *)&v47 + 1) = v43;
    *((double *)&v48 + 1) = v42;
    v46 = v49;
    v45[0] = v47;
    v45[1] = v48;
    objc_msgSend(v11, "set_preferredAnchor:", v45);

  }
  return v11;
}

- (id)_targetedPreviewForItem:(id)a3 dismissing:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;

  v4 = a4;
  v6 = a3;
  -[_UITextSimpleLinkInteraction itemInteractableView](self, "itemInteractableView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_targetedPreviewForTextInteractableItem:dismissing:", v6, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_contextMenuInteraction:(id)a3 overrideSuggestedActionsForConfiguration:(id)a4
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (id)contextMenuInteraction:(id)a3 previewForHighlightingMenuWithConfiguration:(id)a4
{
  void *v5;
  void *v6;

  -[NSMapTable objectForKey:](self->_configurationItems, "objectForKey:", a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[_UITextMenuLinkInteraction _targetedPreviewForItem:dismissing:](self, "_targetedPreviewForItem:dismissing:", v5, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)contextMenuInteraction:(id)a3 previewForDismissingMenuWithConfiguration:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[NSMapTable objectForKey:](self->_configurationItems, "objectForKey:", a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UITextSimpleLinkInteraction itemInteractableView](self, "itemInteractableView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5 && (objc_msgSend(v6, "window"), v8 = (void *)objc_claimAutoreleasedReturnValue(), v8, v8))
  {
    -[_UITextMenuLinkInteraction _targetedPreviewForItem:dismissing:](self, "_targetedPreviewForItem:dismissing:", v5, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)_contextMenuInteraction:(id)a3 configuration:(id)a4 interactionEffectForTargetedPreview:(id)a5
{
  id v7;
  void *v8;
  void *v9;

  v7 = a5;
  -[NSMapTable objectForKey:](self->_configurationItems, "objectForKey:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "showsMenuPreview") & 1) != 0)
  {
    v9 = 0;
  }
  else
  {
    +[_UINullClickHighlightEffect effectWithPreview:continuingFromPreview:](_UINullClickHighlightEffect, "effectWithPreview:continuingFromPreview:", v7, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (void)_willDisplayMenuForItem:(id)a3 animator:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  if (v10)
  {
    -[_UITextSimpleLinkInteraction itemInteractableView](self, "itemInteractableView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      self->_isModifyingSelectionForLinkPresentation = 1;
      objc_msgSend(v10, "range");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setSelectedTextRange:", v8);

      self->_isModifyingSelectionForLinkPresentation = 0;
    }
    objc_msgSend(v10, "highlight");
    if (v6)
    {
      -[_UITextSimpleLinkInteraction itemInteractableView](self, "itemInteractableView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "_textInteractableItem:willDisplayMenuWithAnimator:", v10, v6);

    }
  }

}

- (void)_willEndMenuDisplayForItem:(id)a3 animator:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  if (v10)
  {
    objc_msgSend(v10, "unhighlight");
    if (v6)
    {
      -[_UITextSimpleLinkInteraction itemInteractableView](self, "itemInteractableView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "_textInteractableItem:willDismissMenuWithAnimator:", v10, v6);

    }
    -[_UITextSimpleLinkInteraction itemInteractableView](self, "itemInteractableView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_textInteractableItemCache");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeItem:", v10);

  }
}

- (void)contextMenuInteraction:(id)a3 willDisplayMenuForConfiguration:(id)a4 animator:(id)a5
{
  NSMapTable *configurationItems;
  id v8;
  id v9;

  configurationItems = self->_configurationItems;
  v8 = a5;
  -[NSMapTable objectForKey:](configurationItems, "objectForKey:", a4);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[_UITextMenuLinkInteraction _willDisplayMenuForItem:animator:](self, "_willDisplayMenuForItem:animator:", v9, v8);

}

- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5
{
  NSMapTable *configurationItems;
  id v8;
  id v9;

  configurationItems = self->_configurationItems;
  v8 = a5;
  -[NSMapTable objectForKey:](configurationItems, "objectForKey:", a4);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[_UITextMenuLinkInteraction _willEndMenuDisplayForItem:animator:](self, "_willEndMenuDisplayForItem:animator:", v9, v8);

}

- (id)editMenuInteraction:(id)a3 menuForConfiguration:(id)a4 suggestedActions:(id)a5
{
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v6 = a4;
  objc_msgSend(v6, "sourcePoint");
  v8 = v7;
  v10 = v9;
  -[_UITextSimpleLinkInteraction itemInteractableView](self, "itemInteractableView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_textInteractableItemAtPoint:precision:", 0, v8, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[NSMapTable setObject:forKey:](self->_configurationItems, "setObject:forKey:", v12, v6);
    objc_msgSend(v12, "preparedMenuConfiguration");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "menu");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (CGRect)editMenuInteraction:(id)a3 targetRectForConfiguration:(id)a4
{
  void *v5;
  void *v6;
  CGFloat *v7;
  double width;
  double height;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  CGFloat x;
  CGFloat y;
  uint64_t v16;
  uint64_t i;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  void *v22;
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
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;
  CGRect v39;
  CGRect v40;
  CGRect result;
  CGRect v42;

  v38 = *MEMORY[0x1E0C80C00];
  -[NSMapTable objectForKey:](self->_configurationItems, "objectForKey:", a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[_UITextMenuLinkInteraction _targetedPreviewForItem:dismissing:](self, "_targetedPreviewForItem:dismissing:", v5, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (CGFloat *)MEMORY[0x1E0C9D628];
    width = *(double *)(MEMORY[0x1E0C9D628] + 16);
    height = *(double *)(MEMORY[0x1E0C9D628] + 24);
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    objc_msgSend(v6, "parameters", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_textLineRects");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    if (v12)
    {
      v13 = v12;
      x = *v7;
      y = v7[1];
      v16 = *(_QWORD *)v34;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v34 != v16)
            objc_enumerationMutation(v11);
          objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * i), "CGRectValue");
          v42.origin.x = v18;
          v42.origin.y = v19;
          v42.size.width = v20;
          v42.size.height = v21;
          v39.origin.x = x;
          v39.origin.y = y;
          v39.size.width = width;
          v39.size.height = height;
          v40 = CGRectUnion(v39, v42);
          x = v40.origin.x;
          y = v40.origin.y;
          width = v40.size.width;
          height = v40.size.height;
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
      }
      while (v13);
    }

    objc_msgSend(v6, "target");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "center");
    v24 = v23;
    v26 = v25;

    v27 = round(v26 - height * 0.5);
    v28 = round(v24 - width * 0.5);

  }
  else
  {
    v28 = *MEMORY[0x1E0C9D628];
    v27 = *(double *)(MEMORY[0x1E0C9D628] + 8);
    width = *(double *)(MEMORY[0x1E0C9D628] + 16);
    height = *(double *)(MEMORY[0x1E0C9D628] + 24);
  }

  v29 = v28;
  v30 = v27;
  v31 = width;
  v32 = height;
  result.size.height = v32;
  result.size.width = v31;
  result.origin.y = v30;
  result.origin.x = v29;
  return result;
}

- (void)editMenuInteraction:(id)a3 willPresentMenuForConfiguration:(id)a4 animator:(id)a5
{
  NSMapTable *configurationItems;
  id v8;
  id v9;

  configurationItems = self->_configurationItems;
  v8 = a5;
  -[NSMapTable objectForKey:](configurationItems, "objectForKey:", a4);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[_UITextMenuLinkInteraction _willDisplayMenuForItem:animator:](self, "_willDisplayMenuForItem:animator:", v9, v8);

}

- (void)editMenuInteraction:(id)a3 willDismissMenuForConfiguration:(id)a4 animator:(id)a5
{
  NSMapTable *configurationItems;
  id v8;
  id v9;

  configurationItems = self->_configurationItems;
  v8 = a5;
  -[NSMapTable objectForKey:](configurationItems, "objectForKey:", a4);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[_UITextMenuLinkInteraction _willEndMenuDisplayForItem:animator:](self, "_willEndMenuDisplayForItem:animator:", v9, v8);

}

- (void)contextMenuInteraction:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  _QWORD aBlock[4];
  id v21;

  v6 = a4;
  v7 = a5;
  getDDContextMenuConfigurationClass();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_12;
  v8 = v6;
  objc_msgSend(v8, "interactionURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __111___UITextMenuLinkInteraction_contextMenuInteraction_willPerformPreviewActionForMenuWithConfiguration_animator___block_invoke;
    aBlock[3] = &unk_1E16B1B28;
    v21 = v8;
    v10 = _Block_copy(aBlock);
    v11 = v21;
  }
  else
  {
    objc_msgSend(v8, "interactionViewControllerProvider");
    v12 = objc_claimAutoreleasedReturnValue();
    if (!v12)
    {

LABEL_12:
      objc_msgSend(v7, "setPreferredCommitStyle:", 0);
      goto LABEL_13;
    }
    v11 = (void *)v12;
    (*(void (**)(void))(v12 + 16))();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      objc_msgSend(v7, "previewViewController");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "presentingViewController");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __111___UITextMenuLinkInteraction_contextMenuInteraction_willPerformPreviewActionForMenuWithConfiguration_animator___block_invoke_2;
      v17[3] = &unk_1E16B1B50;
      v18 = v15;
      v19 = v13;
      v16 = v15;
      v10 = _Block_copy(v17);

    }
    else
    {
      v10 = 0;
    }

  }
  if (!v10)
    goto LABEL_12;
  objc_msgSend(v7, "addAnimations:", v10);
  objc_msgSend(v7, "setPreferredCommitStyle:", 1);

LABEL_13:
}

@end
