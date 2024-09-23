@implementation _UIUCBBarButtonVisualProviderIOS

- (void)updateButton:(id)a3 forHighlightedState:(BOOL)a4
{
  _BOOL8 v4;
  UIButton *contentButton;
  id v7;
  void *v8;
  _BOOL4 v9;
  double v10;
  id WeakRetained;

  v4 = a4;
  contentButton = self->_contentButton;
  v7 = a3;
  -[UIButton setHighlighted:](contentButton, "setHighlighted:", v4);
  objc_msgSend(v7, "traitCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "userInterfaceStyle") == 2;
  if (v4)
    v10 = dbl_186679260[v9];
  else
    v10 = 1.0;
  WeakRetained = objc_loadWeakRetained((id *)&self->_securePasteButtonSlotView);
  objc_msgSend(WeakRetained, "setAlpha:", v10);

}

- (void)updateButton:(id)a3 forEnabledState:(BOOL)a4
{
  _BOOL8 v4;

  v4 = a4;
  -[UIButton setEnabled:](self->_contentButton, "setEnabled:", a4);
  if (self->_slotViewHasRemoteContent)
    -[_UIUCBBarButtonVisualProviderIOS enableSecureButton:](self, "enableSecureButton:", v4);
}

- (id)contentView
{
  return self->_contentButton;
}

- (id)_newButtonForType:(int64_t)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_opt_class();
  if (a3 == 1 || a3 == 3)
    v4 = (void *)objc_opt_class();
  objc_msgSend(v4, "buttonWithType:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v5, "setUserInteractionEnabled:", 0);
  objc_msgSend(v5, "_setWantsAccessibilityUnderline:", 0);
  objc_msgSend(v5, "_setImageContentMode:", 1);
  return v5;
}

+ (id)_defaultTitleAttributes
{
  if (qword_1ECD79A88 != -1)
    dispatch_once(&qword_1ECD79A88, &__block_literal_global_51);
  return (id)_MergedGlobals_13;
}

- (id)_defaultTitleAttributes
{
  return (id)objc_msgSend((id)objc_opt_class(), "_defaultTitleAttributes");
}

- (int64_t)_securePasteButtonSite
{
  return 0;
}

- (void)_configureImageOrTitleFromBarItem:(id)a3
{
  id v4;
  char *v5;
  char *v6;
  char *v7;
  UIButton *contentButton;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  UIButton *v12;
  UIButton *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  UIButton *v17;
  UIButton *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  id WeakRetained;
  _BOOL4 v28;
  _UISlotView *v29;
  void *v30;
  uint64_t v31;
  id v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  _QWORD v37[4];
  id v38;
  id v39;
  _QWORD v40[4];
  id v41;
  id location;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((objc_msgSend(v4, "hasImage") & 1) != 0 || (objc_msgSend(v4, "hasTitle") & 1) != 0)
  {
    v5 = (char *)objc_msgSend(v4, "action");
    v6 = (char *)objc_msgSend(v4, "action");
    v7 = (char *)objc_msgSend(v4, "action");
    if (!self->_contentButton)
      goto LABEL_7;
    objc_opt_class();
    if ((v5 == sel_assistantPaste_forEvent_) != (objc_opt_isKindOfClass() & 1))
    {
      -[UIView removeFromSuperview](self->_contentButton, "removeFromSuperview");
      contentButton = self->_contentButton;
      self->_contentButton = 0;

    }
    if (!self->_contentButton)
    {
LABEL_7:
      v9 = 3;
      if (v7 != sel_assistantDictationMicOn)
        v9 = 0;
      v10 = 2;
      if (v6 != sel_assistantDictation)
        v10 = v9;
      if (v5 == sel_assistantPaste_forEvent_)
        v11 = 1;
      else
        v11 = v10;
      v12 = -[_UIUCBBarButtonVisualProviderIOS _newButtonForType:](self, "_newButtonForType:", v11);
      v13 = self->_contentButton;
      self->_contentButton = v12;

    }
    if (objc_msgSend(v4, "hasImage"))
    {
      objc_msgSend(v4, "_imageForState:compact:type:", 0, 0, 5);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIUCBBarButtonVisualProviderIOS imageSymbolConfiguration](self, "imageSymbolConfiguration");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15)
      {
        objc_msgSend(v14, "imageWithConfiguration:", v15);
        v16 = objc_claimAutoreleasedReturnValue();

        v35 = 0;
        v36 = 0;
        v34 = 0;
        v14 = (void *)v16;
      }
      else
      {
        v35 = 0;
        v36 = 0;
        v34 = 0;
      }
    }
    else
    {
      -[_UIUCBBarButtonVisualProviderIOS _defaultTitleAttributes](self, "_defaultTitleAttributes");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "_attributedTitleForState:withDefaultAttributes:", 0, v15);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "_attributedTitleForState:withDefaultAttributes:", 1, v15);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "_attributedTitleForState:withDefaultAttributes:", 2, v15);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 0;
    }

    -[UIButton setImage:forState:](self->_contentButton, "setImage:forState:", v14, 0);
    if (-[_UIUCBBarButtonVisualProviderIOS shouldUseImageInsets](self, "shouldUseImageInsets"))
    {
      v18 = self->_contentButton;
      objc_msgSend(v14, "alignmentRectInsets");
      -[UIButton setImageEdgeInsets:](v18, "setImageEdgeInsets:");
    }
    -[UIButton setAttributedTitle:forState:](self->_contentButton, "setAttributedTitle:forState:", v34, 0);
    -[UIButton setAttributedTitle:forState:](self->_contentButton, "setAttributedTitle:forState:", v35, 1);
    -[UIButton setAttributedTitle:forState:](self->_contentButton, "setAttributedTitle:forState:", v36, 2);
    if (objc_msgSend(v4, "isKeyboardItem")
      && ((_os_feature_enabled_impl() & 1) != 0 || _os_feature_enabled_impl()))
    {
      +[UIDevice currentDevice](UIDevice, "currentDevice");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "userInterfaceIdiom");

      if ((v20 & 0xFFFFFFFFFFFFFFFBLL) == 1)
        -[UIView setAlpha:](self->_contentButton, "setAlpha:", 0.8);
    }
    objc_msgSend(v4, "_gestureRecognizers");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "count");

    if (v22)
    {
      v45 = 0u;
      v46 = 0u;
      v43 = 0u;
      v44 = 0u;
      objc_msgSend(v4, "_gestureRecognizers");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
      if (v24)
      {
        v25 = *(_QWORD *)v44;
        do
        {
          for (i = 0; i != v24; ++i)
          {
            if (*(_QWORD *)v44 != v25)
              objc_enumerationMutation(v23);
            -[UIView addGestureRecognizer:](self->_contentButton, "addGestureRecognizer:", *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * i));
          }
          v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
        }
        while (v24);
      }

      -[UIView setUserInteractionEnabled:](self->_contentButton, "setUserInteractionEnabled:", 1);
    }
    if (v5 == sel_assistantPaste_forEvent_)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_securePasteButtonSlotView);
      v28 = WeakRetained == 0;

      if (v28)
      {
        v29 = objc_alloc_init(_UISlotView);
        objc_storeWeak((id *)&self->_securePasteButtonSlotView, v29);
        objc_msgSend(MEMORY[0x1E0D6C0D8], "systemInputAssistantPasteButtonTagWithSite:", -[_UIUCBBarButtonVisualProviderIOS _securePasteButtonSite](self, "_securePasteButtonSite"));
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_initWeak(&location, self);
        v31 = MEMORY[0x1E0C809B0];
        v40[0] = MEMORY[0x1E0C809B0];
        v40[1] = 3221225472;
        v40[2] = __70___UIUCBBarButtonVisualProviderIOS__configureImageOrTitleFromBarItem___block_invoke;
        v40[3] = &unk_1E16B59B0;
        v32 = v30;
        v41 = v32;
        -[_UISlotView _setSlotStyleResolver:](v29, "_setSlotStyleResolver:", v40);
        v37[0] = v31;
        v37[1] = 3221225472;
        v37[2] = __70___UIUCBBarButtonVisualProviderIOS__configureImageOrTitleFromBarItem___block_invoke_2;
        v37[3] = &unk_1E16B5A28;
        v33 = v32;
        v38 = v33;
        objc_copyWeak(&v39, &location);
        -[_UISlotView _setSlotAnyContentProvider:](v29, "_setSlotAnyContentProvider:", v37);
        -[_UISlotView _overlayView:centerInView:](v29, "_overlayView:centerInView:", self->_contentButton, self->_contentButton);
        objc_destroyWeak(&v39);

        objc_destroyWeak(&location);
      }
    }

  }
  else
  {
    -[UIView removeFromSuperview](self->_contentButton, "removeFromSuperview");
    v17 = self->_contentButton;
    self->_contentButton = 0;

  }
}

- (BOOL)shouldUseImageInsets
{
  return 1;
}

- (BOOL)shouldSuppressPointerSpecularFilter
{
  id WeakRetained;
  objc_super v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_securePasteButtonSlotView);

  if (WeakRetained)
    return 1;
  v5.receiver = self;
  v5.super_class = (Class)_UIUCBBarButtonVisualProviderIOS;
  return -[_UIButtonBarButtonVisualProvider shouldSuppressPointerSpecularFilter](&v5, sel_shouldSuppressPointerSpecularFilter);
}

- (void)updateSecureButton
{
  self->_slotViewHasRemoteContent = 1;
  -[_UIUCBBarButtonVisualProviderIOS enableSecureButton:](self, "enableSecureButton:", -[UIControl isEnabled](self->super._button, "isEnabled"));
}

- (void)enableSecureButton:(BOOL)a3
{
  _BOOL8 v5;
  id WeakRetained;
  UIButton *contentButton;
  id v8;

  v5 = !a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_securePasteButtonSlotView);
  objc_msgSend(WeakRetained, "setHidden:", v5);

  contentButton = self->_contentButton;
  if (a3)
  {
    +[UIColor clearColor](UIColor, "clearColor");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    -[UIButton _setImageColor:forState:](contentButton, "_setImageColor:forState:", v8, 0);

  }
  else
  {
    -[UIButton _setImageColor:forState:](contentButton, "_setImageColor:forState:", 0, 0);
  }
}

- (void)configureButton:(id)a3 withAppearanceDelegate:(id)a4 fromBarItem:(id)a5
{
  id v7;
  void *v8;
  UIButton *v9;
  UIButton *contentButton;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  v7 = a5;
  objc_msgSend(v14, "setPointerInteractionEnabled:", 1);
  objc_msgSend(v14, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setHitTestsAsOpaque:", 1);

  v9 = self->_contentButton;
  -[_UIUCBBarButtonVisualProviderIOS _configureImageOrTitleFromBarItem:](self, "_configureImageOrTitleFromBarItem:", v7);

  objc_msgSend(v14, "addSubview:", self->_contentButton);
  contentButton = self->_contentButton;
  if (v9 != contentButton && contentButton != 0)
  {
    v12 = (void *)MEMORY[0x1E0D156E0];
    -[_UIUCBBarButtonVisualProviderIOS _constraintsForButton:withButtonItem:](self, "_constraintsForButton:withButtonItem:");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "activateConstraints:", v13);

  }
  -[_UIUCBBarButtonVisualProviderIOS updateMenu](self, "updateMenu");

}

- (id)_constraintsForButton:(id)a3 withButtonItem:(id)a4
{
  id v5;
  id v6;
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
  _QWORD v21[5];

  v21[4] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = a3;
  objc_msgSend(v6, "leadingAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "leadingAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "constraintEqualToAnchor:", v19);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v18;
  objc_msgSend(v6, "trailingAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "trailingAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "constraintEqualToAnchor:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = v9;
  objc_msgSend(v6, "topAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "topAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "constraintEqualToAnchor:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v21[2] = v12;
  objc_msgSend(v6, "bottomAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "bottomAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "constraintEqualToAnchor:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v21[3] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)imageSymbolConfiguration
{
  return 0;
}

- (id)pointerShapeInContainer:(id)a3
{
  _UIButtonBarButton *button;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  BOOL v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;

  button = self->super._button;
  v5 = a3;
  -[_UIButtonBarButton _buttonBarHitRect](button, "_buttonBarHitRect");
  v10 = (48.0 - v8) * 0.5;
  v11 = v8 < 48.0;
  if (v8 < 48.0)
    v8 = 48.0;
  v12 = 0.0;
  if (v11)
    v12 = v10;
  -[UIView convertRect:toView:](self->super._button, "convertRect:toView:", v5, v6 - v12, v7 + (v9 + -37.0) * 0.5, v8, 37.0);
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;

  return +[UIPointerShape shapeWithRoundedRect:](UIPointerShape, "shapeWithRoundedRect:", v14, v16, v18, v20);
}

- (id)buttonContextMenuInteractionConfiguration
{
  void *v2;

  if (self->_menuProvider)
  {
    +[UIContextMenuConfiguration configurationWithIdentifier:previewProvider:actionProvider:](UIContextMenuConfiguration, "configurationWithIdentifier:previewProvider:actionProvider:", CFSTR("UIBarButtonItemContextMenu"), 0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (id)buttonContextMenuStyleFromDefaultStyle:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  CGFloat v8;
  _UIButtonBarButton *button;
  void *v10;

  v4 = a3;
  -[_UIUCBBarButtonVisualProviderIOS menuAnchorPoint](self, "menuAnchorPoint");
  v6 = v5;
  v8 = v7;
  button = self->super._button;
  -[_UIUCBBarButtonVisualProviderIOS buttonContextMenuTargetedPreview](self, "buttonContextMenuTargetedPreview");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  _UIControlMenuSupportUpdateStyleForBarButtons(v4, button, v10, 0, v6, v8);

  return v4;
}

- (id)buttonContextMenuTargetedPreview
{
  return _UIControlMenuSupportTargetedPreviewOverViews(self->super._button, self->_contentButton, 0);
}

- (CGPoint)menuAnchorPoint
{
  _UIButtonBarButton *button;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  CGPoint result;

  button = self->super._button;
  -[UIView bounds](button, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[UIView window](self->super._button, "window");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView convertRect:toView:](button, "convertRect:toView:", v12, v5, v7, v9, v11);
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;

  -[UIView window](self->super._button, "window");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = _UIControlMenuAttachmentPointForRectInContainer(v21, v14, v16, v18, v20);
  v24 = v23;

  v25 = v22;
  v26 = v24;
  result.y = v26;
  result.x = v25;
  return result;
}

- (BOOL)canUpdateMenuInPlace
{
  return 1;
}

- (void)updateMenu
{
  UIBarButtonItem **p_barButtonItem;
  id WeakRetained;
  void *v5;
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  id *v10;
  id *v11;
  _QWORD *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  id menuProvider;
  uint64_t v18;
  uint64_t v19;
  id (*v20)(uint64_t);
  void *v21;
  id v22;
  _QWORD aBlock[4];
  id v24;
  id v25;
  _QWORD v26[4];
  id v27;
  id v28;
  id to;

  p_barButtonItem = &self->super._barButtonItem;
  WeakRetained = objc_loadWeakRetained((id *)&self->super._barButtonItem);
  objc_msgSend(WeakRetained, "menu");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_loadWeakRetained((id *)p_barButtonItem);
  v7 = objc_msgSend(v6, "_menuIsPrimary");

  v8 = objc_loadWeakRetained((id *)p_barButtonItem);
  objc_msgSend(v8, "_secondaryActionsProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_copyWeak(&to, (id *)p_barButtonItem);
    if ((_DWORD)v7)
    {
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = __46___UIUCBBarButtonVisualProviderIOS_updateMenu__block_invoke;
      v26[3] = &unk_1E16B58F8;
      v10 = &v27;
      v27 = v9;
      v11 = &v28;
      objc_copyWeak(&v28, &to);
      v12 = v26;
    }
    else
    {
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __46___UIUCBBarButtonVisualProviderIOS_updateMenu__block_invoke_2;
      aBlock[3] = &unk_1E16B58F8;
      v10 = &v24;
      v24 = v9;
      v11 = &v25;
      objc_copyWeak(&v25, &to);
      v12 = aBlock;
    }
    v16 = _Block_copy(v12);
    menuProvider = self->_menuProvider;
    self->_menuProvider = v16;

    objc_destroyWeak(v11);
    objc_destroyWeak(&to);
  }
  else
  {
    if (v5)
    {
      v18 = MEMORY[0x1E0C809B0];
      v19 = 3221225472;
      v20 = __46___UIUCBBarButtonVisualProviderIOS_updateMenu__block_invoke_3;
      v21 = &unk_1E16B5118;
      v22 = v5;
      v13 = _Block_copy(&v18);
      v14 = self->_menuProvider;
      self->_menuProvider = v13;

      v15 = v22;
    }
    else
    {
      v15 = self->_menuProvider;
      self->_menuProvider = 0;
    }

  }
  -[UIControl setContextMenuInteractionEnabled:](self->super._button, "setContextMenuInteractionEnabled:", self->_menuProvider != 0, v18, v19, v20, v21);
  -[UIControl setShowsMenuAsPrimaryAction:](self->super._button, "setShowsMenuAsPrimaryAction:", v7);

}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_menuProvider, 0);
  objc_destroyWeak((id *)&self->_securePasteButtonSlotView);
  objc_storeStrong((id *)&self->_contentButton, 0);
}

@end
