@implementation SBIconView

- (int64_t)currentLabelAccessoryType
{
  int64_t result;

  if ((*((_BYTE *)self + 555) & 4) != 0 || !-[SBIconView allowsLabelAccessoryView](self, "allowsLabelAccessoryView"))
    return 0;
  result = -[SBIcon labelAccessoryType](self->_icon, "labelAccessoryType");
  if (result == 4)
  {
    if (-[SBIconView allowsBlockedForScreenTimeExpiration](self, "allowsBlockedForScreenTimeExpiration"))
      return 4;
    else
      return 0;
  }
  return result;
}

- (BOOL)allowsLabelAccessoryView
{
  int v3;

  v3 = objc_msgSend((id)objc_opt_class(), "allowsLabelAccessoryView");
  if (v3)
    LOBYTE(v3) = !-[SBIconView isFolderIcon](self, "isFolderIcon");
  return v3;
}

- (BOOL)isFolderIcon
{
  void *v2;
  char v3;

  -[SBIconView icon](self, "icon");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isFolderIcon");

  return v3;
}

+ (BOOL)allowsLabelAccessoryView
{
  return 1;
}

- (int64_t)currentAccessoryType
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;
  void *v9;
  void *v10;

  if (!-[SBIconView allowsAccessoryView](self, "allowsAccessoryView"))
    return 0;
  -[SBIconView icon](self, "icon");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconView location](self, "location");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "accessoryTypeForLocation:", v4);
  -[SBIconView overrideBadgeNumberOrString](self, "overrideBadgeNumberOrString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    v7 = 1;
  else
    v7 = v5;
  if (-[SBIconView _debugContinuity](self, "_debugContinuity"))
    v8 = 2;
  else
    v8 = v7;
  if (v8 <= 1)
  {
    -[SBIconView continuityInfo](self, "continuityInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {

LABEL_13:
      v8 = 2;
      goto LABEL_14;
    }
    v8 = v7;
    if (-[SBIconView _debugContinuity](self, "_debugContinuity"))
      goto LABEL_13;
  }
LABEL_14:
  -[SBIconView behaviorDelegate](self, "behaviorDelegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v8 = objc_msgSend(v10, "iconView:accessoryTypeWithProposedAccessoryType:", self, v8);

  return v8;
}

- (id)behaviorDelegate
{
  id v3;
  void *v4;

  -[SBIconView delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "behaviorDelegateForIconView:", self);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (SBIconViewDelegate)delegate
{
  return (SBIconViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (SBIconListLayout)listLayout
{
  void *v3;
  void *v4;
  void *v5;

  -[SBIconView location](self, "location");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[SBIconView effectiveListLayoutProvider](self, "effectiveListLayoutProvider");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "layoutForIconLocation:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return (SBIconListLayout *)v5;
}

- (NSString)location
{
  return self->_iconLocation;
}

- (BOOL)_debugContinuity
{
  void *v2;
  BOOL v3;

  if (!os_variant_has_internal_content())
    return 0;
  objc_msgSend((id)objc_opt_class(), "debugContinuityItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

+ (id)debugContinuityItem
{
  return (id)__debugContinuityItem;
}

- (BOOL)allowsAccessoryView
{
  return (*((unsigned __int8 *)self + 556) >> 5) & 1;
}

- (SBIconImageInfo)iconImageInfo
{
  SBIconImageInfo *v3;
  void *v4;
  void *v5;
  void *v6;
  __CFString *v7;
  __CFString *v8;
  void *v9;

  v3 = self;
  if ((BYTE5(self[17].size.height) & 8) == 0)
  {
    -[SBIconImageInfo listLayoutProvider](self, "listLayoutProvider");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBIconImageInfo iconImageCache](v3, "iconImageCache");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBIconImageInfo listLayout](v3, "listLayout");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBIconImageInfo gridSizeClass](v3, "gridSizeClass");
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v4
      || !v5
      || v7 != CFSTR("SBHIconGridSizeClassDefault")
      && !-[__CFString isEqualToString:](v7, "isEqualToString:"))
    {
      if (v8 && (objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v6, "iconImageInfoForGridSizeClass:", v8);
LABEL_15:

        return self;
      }
      if (v6)
      {
        v9 = v6;
LABEL_14:
        objc_msgSend(v9, "iconImageInfo");
        goto LABEL_15;
      }
      if (!v5)
      {
        objc_msgSend((id)objc_opt_class(), "defaultIconImageSize");
        objc_msgSend((id)objc_opt_class(), "defaultIconImageScale");
        objc_msgSend((id)objc_opt_class(), "defaultIconImageCornerRadius");
        goto LABEL_15;
      }
    }
    v9 = v5;
    goto LABEL_14;
  }
  return self;
}

- (id)effectiveListLayoutProvider
{
  void *v2;

  -[SBIconView listLayoutProvider](self, "listLayoutProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    +[SBHDefaultIconListLayoutProvider frameworkFallbackInstance](SBHDefaultIconListLayoutProvider, "frameworkFallbackInstance");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (SBIconListLayoutProvider)listLayoutProvider
{
  return self->_listLayoutProvider;
}

- (SBHIconImageCache)iconImageCache
{
  return self->_iconImageCache;
}

- (SBIconContinuityInfo)continuityInfo
{
  return self->_continuityInfo;
}

- (NSCopying)overrideBadgeNumberOrString
{
  return self->_overrideBadgeNumberOrString;
}

- (void)addGesturesAndInteractionsIfNecessary
{
  int v3;
  void *v4;
  UIDropInteraction *v5;
  UIDropInteraction *dropInteraction;
  int v7;
  SBIconDragInteraction *v8;
  UIDragInteraction *dragInteraction;
  int v10;
  SBIconTapGestureRecognizer *v11;
  UITapGestureRecognizer *tapGestureRecognizer;
  id WeakRetained;
  char v14;
  UILongPressGestureRecognizer *v15;
  UILongPressGestureRecognizer *editingModeGestureRecognizer;
  int v17;
  UIContextMenuInteraction *v18;
  UIContextMenuInteraction *contextMenuInteraction;
  int v20;
  UIPointerInteraction *v21;
  UIPointerInteraction *iconViewCursorInteraction;
  uint64_t v23;

  -[SBIconView icon](self, "icon");
  v23 = objc_claimAutoreleasedReturnValue();
  v3 = -[SBIconView isUserInteractionEnabled](self, "isUserInteractionEnabled");
  v4 = (void *)v23;
  if (v3 && v23)
  {
    if (!self->_dropInteraction)
    {
      v5 = (UIDropInteraction *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3780]), "initWithDelegate:", self);
      dropInteraction = self->_dropInteraction;
      self->_dropInteraction = v5;

      -[SBIconView addInteraction:](self, "addInteraction:", self->_dropInteraction);
      v4 = (void *)v23;
    }
    if (!self->_dragInteraction)
    {
      v7 = objc_msgSend((id)objc_opt_class(), "supportsDragInteraction");
      v4 = (void *)v23;
      if (v7)
      {
        v8 = -[UIDragInteraction initWithDelegate:]([SBIconDragInteraction alloc], "initWithDelegate:", self);
        dragInteraction = self->_dragInteraction;
        self->_dragInteraction = &v8->super;

        -[UIDragInteraction _setCancellationTimerEnabled:](self->_dragInteraction, "_setCancellationTimerEnabled:", 0);
        -[SBIconView _updateDragInteractionLiftDelay](self, "_updateDragInteractionLiftDelay");
        -[SBIconView addInteraction:](self, "addInteraction:", self->_dragInteraction);
        v4 = (void *)v23;
      }
    }
    if (!self->_tapGestureRecognizer)
    {
      v10 = objc_msgSend((id)objc_opt_class(), "supportsTapGesture");
      v4 = (void *)v23;
      if (v10)
      {
        v11 = -[SBIconTapGestureRecognizer initWithTarget:action:]([SBIconTapGestureRecognizer alloc], "initWithTarget:action:", self, sel_tapGestureDidChange_);
        tapGestureRecognizer = self->_tapGestureRecognizer;
        self->_tapGestureRecognizer = &v11->super;

        -[UITapGestureRecognizer setDelegate:](self->_tapGestureRecognizer, "setDelegate:", self);
        -[UITapGestureRecognizer setDelaysTouchesBegan:](self->_tapGestureRecognizer, "setDelaysTouchesBegan:", 0);
        -[UITapGestureRecognizer setAllowedTouchTypes:](self->_tapGestureRecognizer, "setAllowedTouchTypes:", &unk_1E8E17600);
        -[SBIconView addGestureRecognizer:](self, "addGestureRecognizer:", self->_tapGestureRecognizer);
        v4 = (void *)v23;
      }
    }
    if (!self->_editingModeGestureRecognizer)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      v14 = objc_opt_respondsToSelector();

      v4 = (void *)v23;
      if ((v14 & 1) != 0)
      {
        v15 = (UILongPressGestureRecognizer *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC39C8]), "initWithTarget:action:", self, sel_editingModeGestureRecognizerDidFire_);
        editingModeGestureRecognizer = self->_editingModeGestureRecognizer;
        self->_editingModeGestureRecognizer = v15;

        -[UILongPressGestureRecognizer setMinimumPressDuration:](self->_editingModeGestureRecognizer, "setMinimumPressDuration:", 2.0);
        -[UILongPressGestureRecognizer setDelegate:](self->_editingModeGestureRecognizer, "setDelegate:", self);
        -[UILongPressGestureRecognizer _setKeepTouchesOnContinuation:](self->_editingModeGestureRecognizer, "_setKeepTouchesOnContinuation:", 1);
        -[UILongPressGestureRecognizer setAllowableMovement:](self->_editingModeGestureRecognizer, "setAllowableMovement:", 20.0);
        -[SBIconView addGestureRecognizer:](self, "addGestureRecognizer:", self->_editingModeGestureRecognizer);
        v4 = (void *)v23;
      }
    }
    if (!self->_contextMenuInteraction)
    {
      v17 = objc_msgSend((id)objc_opt_class(), "supportsPreviewInteraction");
      v4 = (void *)v23;
      if (v17)
      {
        if ((*((_BYTE *)self + 557) & 0x20) == 0)
        {
          v18 = (UIContextMenuInteraction *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC36C0]), "initWithDelegate:", self);
          contextMenuInteraction = self->_contextMenuInteraction;
          self->_contextMenuInteraction = v18;

          -[SBIconView addInteraction:](self, "addInteraction:", self->_contextMenuInteraction);
          -[UIContextMenuInteraction setAllowSimultaneousRecognition:](self->_contextMenuInteraction, "setAllowSimultaneousRecognition:", 1);
          v4 = (void *)v23;
        }
      }
    }
    if (!self->_iconViewCursorInteraction)
    {
      v20 = objc_msgSend((id)objc_opt_class(), "supportsCursorInteraction");
      v4 = (void *)v23;
      if (v20)
      {
        v21 = (UIPointerInteraction *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3B18]), "initWithDelegate:", self);
        iconViewCursorInteraction = self->_iconViewCursorInteraction;
        self->_iconViewCursorInteraction = v21;

        -[UIPointerInteraction setEnabled:](self->_iconViewCursorInteraction, "setEnabled:", -[SBIconView _isCursorInteractionEnabled](self, "_isCursorInteractionEnabled"));
        -[SBIconView addInteraction:](self, "addInteraction:", self->_iconViewCursorInteraction);
        v4 = (void *)v23;
      }
    }
  }

}

- (SBIcon)icon
{
  return self->_icon;
}

- (void)setUserVisibilityStatus:(unint64_t)a3
{
  unint64_t v3;
  id v5;

  v3 = *((unsigned __int8 *)self + 559);
  if (((v3 >> 1) & 3) != a3)
  {
    *((_BYTE *)self + 559) = v3 & 0xF9 | (2 * (a3 & 3));
    -[SBIconView customIconImageViewController](self, "customIconImageViewController");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v5, "setUserVisibilityStatus:", a3);

  }
}

- (SBIconViewCustomImageViewControlling)customIconImageViewController
{
  return self->_customIconImageViewController;
}

- (void)_updateCursorInteractionsEnabled
{
  _BOOL8 v3;

  v3 = -[SBIconView _isCursorInteractionEnabled](self, "_isCursorInteractionEnabled");
  if (v3 != -[UIPointerInteraction isEnabled](self->_iconViewCursorInteraction, "isEnabled"))
  {
    -[UIPointerInteraction setEnabled:](self->_iconViewCursorInteraction, "setEnabled:", v3);
    -[UIPointerInteraction invalidate](self->_iconViewCursorInteraction, "invalidate");
  }
  if (v3 != -[UIPointerInteraction isEnabled](self->_closeBoxCursorInteraction, "isEnabled"))
  {
    -[UIPointerInteraction setEnabled:](self->_closeBoxCursorInteraction, "setEnabled:", v3);
    -[UIPointerInteraction invalidate](self->_closeBoxCursorInteraction, "invalidate");
  }
  if (v3 != -[UIPointerInteraction isEnabled](self->_accessoryViewCursorInteraction, "isEnabled"))
  {
    -[UIPointerInteraction setEnabled:](self->_accessoryViewCursorInteraction, "setEnabled:", v3);
    -[UIPointerInteraction invalidate](self->_accessoryViewCursorInteraction, "invalidate");
  }
  if (v3 != -[UIPointerInteraction isEnabled](self->_resizeHandleCursorInteraction, "isEnabled"))
  {
    -[UIPointerInteraction setEnabled:](self->_resizeHandleCursorInteraction, "setEnabled:", v3);
    -[UIPointerInteraction invalidate](self->_resizeHandleCursorInteraction, "invalidate");
  }
}

- (BOOL)_isCursorInteractionEnabled
{
  return !-[SBIconView isDragging](self, "isDragging")
      && (*((char *)self + 558) & 0x80000000) == 0
      && (*((_BYTE *)self + 558) & 8) == 0;
}

- (void)_applyEditingStateAnimated:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  -[SBIconView _updateCustomIconImageViewController:](self, "_updateCustomIconImageViewController:");
  -[SBIconView _updateAllComponentAlphasAnimated:](self, "_updateAllComponentAlphasAnimated:", v3);
  -[SBIconView _updateJitter](self, "_updateJitter");
  -[SBIconView _updateIconImageAdornmentsAnimated:](self, "_updateIconImageAdornmentsAnimated:", v3);
  -[SBIconView _updateDragInteractionLiftDelay](self, "_updateDragInteractionLiftDelay");
  -[UIPointerInteraction invalidate](self->_iconViewCursorInteraction, "invalidate");
  -[UIPointerInteraction invalidate](self->_closeBoxCursorInteraction, "invalidate");
  -[UIPointerInteraction invalidate](self->_accessoryViewCursorInteraction, "invalidate");
  -[UIPointerInteraction invalidate](self->_resizeHandleCursorInteraction, "invalidate");
  if (-[SBIconView isFolderIcon](self, "isFolderIcon"))
  {
    if (-[SBIconView isEditing](self, "isEditing"))
      -[SBIconView scrollToFirstGapAnimated:](self, "scrollToFirstGapAnimated:", v3);
    else
      -[SBIconView scrollToTopOfFirstPageAnimated:](self, "scrollToTopOfFirstPageAnimated:", v3);
  }
}

- (void)_updateCloseBoxAnimated:(BOOL)a3
{
  uint64_t v3;

  if (a3)
    v3 = 0;
  else
    v3 = 2;
  -[SBIconView _updateCloseBoxWithAnimation:](self, "_updateCloseBoxWithAnimation:", v3);
}

- (void)_updateAllComponentAlphasAnimated:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  _QWORD aBlock[5];

  v3 = a3;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __48__SBIconView__updateAllComponentAlphasAnimated___block_invoke;
  aBlock[3] = &unk_1E8D84C50;
  aBlock[4] = self;
  v4 = _Block_copy(aBlock);
  v5 = v4;
  if (v3)
    objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:", v4, 0.3);
  else
    (*((void (**)(void *))v4 + 2))(v4);

}

- (void)_updateDragInteractionLiftDelay
{
  double v3;
  double v4;
  id v5;

  -[SBIconView dragInteractionLiftDelay](self, "dragInteractionLiftDelay");
  v4 = v3;
  -[SBIconView dragInteraction](self, "dragInteraction");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_setLiftDelay:", v4);

}

- (UIDragInteraction)dragInteraction
{
  return self->_dragInteraction;
}

- (double)dragInteractionLiftDelay
{
  double v3;
  double v4;
  SBHIconEditingSettings *iconEditingSettings;
  double v6;
  BOOL v7;
  double result;

  objc_msgSend((id)objc_opt_class(), "_defaultDragInteractionLiftDelay");
  v4 = v3;
  if (-[SBIconView isEditing](self, "isEditing"))
  {
    iconEditingSettings = self->_iconEditingSettings;
    if (iconEditingSettings)
    {
      -[SBHIconEditingSettings editingLiftDelay](iconEditingSettings, "editingLiftDelay");
      if (v6 < v4)
        v4 = v6;
    }
    else
    {
      v4 = 0.1;
    }
  }
  v7 = -[SBIconView startsDragMoreQuickly](self, "startsDragMoreQuickly");
  result = 0.2;
  if (!v7 || v4 <= 0.2)
    return v4;
  return result;
}

- (BOOL)startsDragMoreQuickly
{
  return (*((unsigned __int8 *)self + 555) >> 6) & 1;
}

+ (double)_defaultDragInteractionLiftDelay
{
  return 1.4;
}

- (void)_updateCustomIconImageViewController:(BOOL)a3
{
  _BOOL8 v3;
  _BOOL8 v5;
  id v6;

  v3 = a3;
  -[SBIconView customIconImageViewController](self, "customIconImageViewController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v5 = -[SBIconView isEditing](self, "isEditing");
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v6, "setEditing:animated:", v5, v3);
    }
    else if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v6, "setEditing:", v5);
    }
  }

}

- (void)_toggleGroupBlendingIfNecessary
{
  _BOOL8 v3;
  void *v4;
  id v5;

  -[SBIconView contentContainerView](self, "contentContainerView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v3 = -[SBIconView _shouldEnableGroupBlending](self, "_shouldEnableGroupBlending");
  objc_msgSend(v5, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAllowsGroupBlending:", v3);

}

- (void)_applyOverallAlpha:(double)a3
{
  void *v4;
  id v5;

  -[SBIconView contentContainerView](self, "contentContainerView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAllowsGroupOpacity:", a3 < 1.0);

  objc_msgSend(v5, "setAlpha:", a3);
}

- (UIView)contentContainerView
{
  if (self->_scalingContainer)
    self = (SBIconView *)self->_scalingContainer;
  return (UIView *)self;
}

- (BOOL)_shouldEnableGroupBlending
{
  return -[SBIconView labelStyle](self, "labelStyle") == 0;
}

- (int64_t)labelStyle
{
  return (uint64_t)(char)(2 * *((_BYTE *)self + 558)) >> 6;
}

+ (double)defaultIconImageScale
{
  return 2.0;
}

+ (BOOL)supportsTapGesture
{
  return 1;
}

+ (BOOL)supportsDragInteraction
{
  return 1;
}

+ (BOOL)supportsCursorInteraction
{
  return 1;
}

- (void)prepareForReuse
{
  void *v3;
  void *v4;
  SBHRecentsDocumentExtensionProvider *recentsDocumentExtensionProvider;
  NSHashTable *droppingAssertions;
  UIView *dropGlow;
  SBIconFocusEffectPlatterView *focusEffectPlatterView;
  UIFocusItem *focusProxyView;
  SBIconLabelViewFactory *iconLabelViewFactory;
  SBHIconResizeHandle *resizeHandle;
  __int128 v12;
  void *v13;
  void *v14;
  void *v15;
  SBCloseBoxView *closeBox;
  void *v17;
  void *v18;
  void *v19;
  NSHashTable *observers;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  NSHashTable *v27;
  void *v28;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _OWORD v34[3];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  -[SBIconView dismissConfigurationCardImmediately](self, "dismissConfigurationCardImmediately");
  -[SBIconView dismissStackConfigurationCardImmediately](self, "dismissStackConfigurationCardImmediately");
  -[SBIconView setIcon:](self, "setIcon:", 0);
  -[SBIconView setIconContentScalingEnabled:](self, "setIconContentScalingEnabled:", 0);
  -[SBIconView setIconContentScale:](self, "setIconContentScale:", 1.0);
  -[SBIconImageView prepareForReuse](self->_iconImageView, "prepareForReuse");
  -[SBIconView accessoryViewAnimator](self, "accessoryViewAnimator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "stopAnimation:", 0);
    objc_msgSend(v4, "finishAnimationAtPosition:", 0);
    -[SBIconView setAccessoryViewAnimator:](self, "setAccessoryViewAnimator:", 0);
  }
  v29 = v4;
  -[SBIconView setOverrideBadgeNumberOrString:](self, "setOverrideBadgeNumberOrString:", 0);
  -[SBIconView _destroyAccessoryView](self, "_destroyAccessoryView");
  *((_BYTE *)self + 558) &= ~0x10u;
  self->_customIconImageViewControllerPriority = 0;
  -[SBIconView setCustomIconImageViewController:](self, "setCustomIconImageViewController:", 0);
  -[SBIconView setConfigurationOptions:](self, "setConfigurationOptions:", -[SBIconView configurationOptions](self, "configurationOptions"));
  *((_BYTE *)self + 555) = (*((_BYTE *)self + 555) & 0xFD | (2 * (*((_BYTE *)self + 557) & 1))) ^ 2;
  *((_BYTE *)self + 555) = (*((_BYTE *)self + 555) & 0xFB | (4 * (*((_BYTE *)self + 557) & 1))) ^ 4;
  -[SBIconView _invalidateHomeButtonPressConsumingAssertion](self, "_invalidateHomeButtonPressConsumingAssertion");
  *((_BYTE *)self + 553) &= ~0x20u;
  *((_BYTE *)self + 553) &= ~0x40u;
  *((_BYTE *)self + 553) &= ~0x80u;
  *((_BYTE *)self + 554) &= ~1u;
  *((_BYTE *)self + 557) &= ~0x10u;
  *((_BYTE *)self + 557) &= ~0x40u;
  *((_BYTE *)self + 557) &= ~8u;
  *((_BYTE *)self + 556) |= 0x20u;
  *((_BYTE *)self + 556) |= 0x40u;
  *((_BYTE *)self + 558) &= 0x9Fu;
  *((_BYTE *)self + 552) &= 0xF3u;
  objc_storeStrong((id *)&self->_iconLocation, CFSTR("SBIconLocationNone"));
  *(_WORD *)((char *)self + 557) &= 0xFE7Fu;
  recentsDocumentExtensionProvider = self->_recentsDocumentExtensionProvider;
  self->_recentsDocumentExtensionProvider = 0;

  self->_iconImageSizeMatchesBoundsSize = 0;
  droppingAssertions = self->_droppingAssertions;
  self->_droppingAssertions = 0;

  -[SBIconView _updateBrightness](self, "_updateBrightness");
  -[SBIconView setIconImageAlpha:](self, "setIconImageAlpha:", 1.0);
  -[SBIconView setIconLabelAlpha:](self, "setIconLabelAlpha:", 1.0);
  -[SBIconView setIconAccessoryAlpha:](self, "setIconAccessoryAlpha:", 1.0);
  -[SBIconView setAllIconElementsButLabelHidden:](self, "setAllIconElementsButLabelHidden:", 0);
  -[SBIconView setPaused:forReason:](self, "setPaused:forReason:", 0, -1);
  -[SBIconView setEditing:animated:](self, "setEditing:animated:", 0, 0);
  -[SBIconView setAllowsEditingAnimation:](self, "setAllowsEditingAnimation:", 1);
  -[SBIconView setSuppressesDefaultEditingAnimation:](self, "setSuppressesDefaultEditingAnimation:", 0);
  -[SBIconView setAllowsCloseBox:](self, "setAllowsCloseBox:", 1);
  -[SBIconView setAllowsResizeHandle:](self, "setAllowsResizeHandle:", 0);
  -[SBIconView setAllowsAdornmentsOverIconImage:](self, "setAllowsAdornmentsOverIconImage:", 1);
  -[SBIconView setGrabbed:](self, "setGrabbed:", 0);
  -[SBIconView setDragging:](self, "setDragging:", 0);
  -[SBIconView setDragLifted:](self, "setDragLifted:", 0);
  -[SBIconView setLiftingDragSession:](self, "setLiftingDragSession:", 0);
  -[SBIconView setCancelingDrag:](self, "setCancelingDrag:", 0);
  -[SBIconView setAddedToDrag:](self, "setAddedToDrag:", 0);
  -[SBIconView setShowsImageAndLabelDuringDrop:](self, "setShowsImageAndLabelDuringDrop:", 0);
  -[SBIconView setOverlapping:](self, "setOverlapping:", 0);
  -[SBIconView setImageLoadingBehavior:](self, "setImageLoadingBehavior:", objc_msgSend((id)objc_opt_class(), "defaultImageLoadingBehavior"));
  -[SBIconView setDisplaysIconStatusInLabel:](self, "setDisplaysIconStatusInLabel:", 0);
  -[SBIconView setEditingAnimationStrength:](self, "setEditingAnimationStrength:", 1.0);
  -[SBIconView setUserVisibilityStatus:](self, "setUserVisibilityStatus:", 0);
  -[SBIconView setApproximateLayoutPosition:](self, "setApproximateLayoutPosition:", 0, 0);
  -[SBIconView setOverrideIconImageAppearance:](self, "setOverrideIconImageAppearance:", 0);
  -[SBIconView setOverrideIconImageStyleConfiguration:](self, "setOverrideIconImageStyleConfiguration:", 0);
  -[SBIconView setOverrideImageTintColor:](self, "setOverrideImageTintColor:", 0);
  -[SBIconView setOverrideImage:](self, "setOverrideImage:", 0);
  -[SBIconView setUsesSceneUserInterfaceStyleForImage:](self, "setUsesSceneUserInterfaceStyleForImage:", 0);
  -[SBIconView setOverrideAccessoryIconImageAppearance:](self, "setOverrideAccessoryIconImageAppearance:", 0);
  -[UIView removeFromSuperview](self->_dropGlow, "removeFromSuperview");
  dropGlow = self->_dropGlow;
  self->_dropGlow = 0;

  *((_BYTE *)self + 557) &= ~4u;
  -[SBIconFocusEffectPlatterView removeFromSuperview](self->_focusEffectPlatterView, "removeFromSuperview");
  focusEffectPlatterView = self->_focusEffectPlatterView;
  self->_focusEffectPlatterView = 0;

  *((_BYTE *)self + 553) &= ~8u;
  -[UIFocusItem removeFromSuperview](self->_focusProxyView, "removeFromSuperview");
  focusProxyView = self->_focusProxyView;
  self->_focusProxyView = 0;

  *((_BYTE *)self + 559) &= ~8u;
  iconLabelViewFactory = self->_iconLabelViewFactory;
  self->_iconLabelViewFactory = 0;

  -[SBHIconResizeHandle removeFromSuperview](self->_resizeHandle, "removeFromSuperview");
  resizeHandle = self->_resizeHandle;
  self->_resizeHandle = 0;

  -[SBIconView setResizeGestureHandler:](self, "setResizeGestureHandler:", 0);
  -[SBIconView setAccessibilityIdentifier:](self, "setAccessibilityIdentifier:", 0);
  v12 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v34[0] = *MEMORY[0x1E0C9BAA8];
  v34[1] = v12;
  v34[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  -[SBIconView setTransform:](self, "setTransform:", v34);
  -[SBIconView setAlpha:](self, "setAlpha:", 1.0);
  -[SBIconView setHidden:](self, "setHidden:", 0);
  -[SBIconView setBackgroundColor:](self, "setBackgroundColor:", 0);
  -[SBIconView layer](self, "layer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setCornerRadius:", 0.0);

  -[SBIconView removeAllIconAnimations](self, "removeAllIconAnimations");
  -[SBIconImageView setProgressState:paused:percent:animated:](self->_iconImageView, "setProgressState:paused:percent:animated:", 0, 0, 0, 0.0);
  -[SBIconView setFolderIconFrozen:](self, "setFolderIconFrozen:", 0);
  -[SBIconView setContinuityInfo:](self, "setContinuityInfo:", 0);
  -[SBIconView setStartsDragMoreQuickly:](self, "setStartsDragMoreQuickly:", 0);
  -[SBIconView setOverrideDraggingDelegate:](self, "setOverrideDraggingDelegate:", 0);
  -[SBIconView closeBoxAnimator](self, "closeBoxAnimator");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v15 = v14;
    objc_msgSend(v14, "stopAnimation:", 0, v14);
    objc_msgSend(v15, "finishAnimationAtPosition:", 0);
    -[SBCloseBoxView removeFromSuperview](self->_closeBox, "removeFromSuperview");
    closeBox = self->_closeBox;
    self->_closeBox = 0;

    -[SBIconView setCloseBoxAnimator:](self, "setCloseBoxAnimator:", 0);
  }
  else
  {
    -[SBCloseBoxView removeFromSuperview](self->_closeBox, "removeFromSuperview", 0);
  }
  -[SBIconView _toggleGroupBlendingIfNecessary](self, "_toggleGroupBlendingIfNecessary");
  -[SBIconView _updateFrameToIconViewSize](self, "_updateFrameToIconViewSize");
  -[SBIconView earlyTerminateContextMenuDismissAnimation](self, "earlyTerminateContextMenuDismissAnimation");
  -[SBIconView setLastContextMenuInteractionFailedToLoad:](self, "setLastContextMenuInteractionFailedToLoad:", 0);
  -[SBIconView _removeUnknownSubviews](self, "_removeUnknownSubviews");
  -[NSCountedSet removeAllObjects](self->_forbidEditingModeReasons, "removeAllObjects");
  -[NSHashTable removeAllObjects](self->_forbidAccessoryUpdatesAssertions, "removeAllObjects");
  -[SBIconView _applyOverallAlpha:](self, "_applyOverallAlpha:", 1.0);
  -[SBIconView setAlpha:](self, "setAlpha:", 1.0);
  objc_msgSend(MEMORY[0x1E0DC37E0], "focusSystemForEnvironment:", self);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "_focusEnvironmentWillDisappear:", self);

  -[SBIconView behaviorDelegate](self, "behaviorDelegate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)-[NSHashTable copy](self->_observers, "copy");
  observers = self->_observers;
  self->_observers = 0;

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v21 = v19;
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v23; ++i)
      {
        if (*(_QWORD *)v31 != v24)
          objc_enumerationMutation(v21);
        v26 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        if (v26 != v18 && (objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v26, "iconViewWasRecycled:", self);
      }
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    }
    while (v23);
  }

  v27 = self->_observers;
  self->_observers = 0;

  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v18, "iconViewWasRecycled:", self);
  -[SBIconView setDelegate:](self, "setDelegate:", 0);
  -[SBIconView setOverrideActionDelegate:](self, "setOverrideActionDelegate:", 0);

}

- (void)setIcon:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  SBIcon *v7;
  SBIcon **p_icon;
  SBIcon *icon;
  SBIcon *v10;
  SBIcon *v11;

  v4 = a4;
  v7 = (SBIcon *)a3;
  p_icon = &self->_icon;
  icon = self->_icon;
  if (icon != v7)
  {
    v11 = v7;
    -[SBIcon removeObserver:](icon, "removeObserver:", self);
    v10 = *p_icon;
    objc_storeStrong((id *)&self->_icon, a3);
    if (*p_icon)
    {
      -[SBIcon addObserver:](*p_icon, "addObserver:", self);
      -[SBIconView setPaused:forReason:](self, "setPaused:forReason:", 0, 2);
      -[SBIconView _updateIconImageViewAnimated:](self, "_updateIconImageViewAnimated:", v4);
      -[SBIconView _updateLabelAreaAnimated:](self, "_updateLabelAreaAnimated:", v4);
      -[SBIconView _updateProgressAnimated:](self, "_updateProgressAnimated:", v4);
      -[SBIconView _updateCloseBoxAnimated:](self, "_updateCloseBoxAnimated:", v4);
      -[SBIconView _updateResizeHandleAnimated:](self, "_updateResizeHandleAnimated:", v4);
      -[SBIconView _updateBrightness](self, "_updateBrightness");
      -[SBIconView _applyEditingStateAnimated:](self, "_applyEditingStateAnimated:", v4);
      -[SBIconView addGesturesAndInteractionsIfNecessary](self, "addGesturesAndInteractionsIfNecessary");
      -[SBIconView _updateFrameToIconViewSize](self, "_updateFrameToIconViewSize");
    }
    else
    {
      -[SBIconView setCustomIconImageViewController:](self, "setCustomIconImageViewController:", 0);
      -[SBIconView setPaused:forReason:](self, "setPaused:forReason:", 1, 2);
    }
    -[SBIconView _updateAccessoryViewAnimated:](self, "_updateAccessoryViewAnimated:", v4);
    -[SBIconView _updateLaunchDisabled](self, "_updateLaunchDisabled");
    -[SBIconView _fetchApplicationShortcutItemsIfAppropriate](self, "_fetchApplicationShortcutItemsIfAppropriate");
    -[SBIconView _startTrackingSupportedMultitaskingShortcutActionsIfAppropriateWithOldIcon:](self, "_startTrackingSupportedMultitaskingShortcutActionsIfAppropriateWithOldIcon:", v10);

    v7 = v11;
  }

}

- (void)setPaused:(BOOL)a3 forReason:(unint64_t)a4
{
  unsigned int v5;
  unsigned int v6;
  int v7;
  __int16 v8;
  __int16 v9;
  _BOOL8 v10;

  v5 = *((unsigned __int16 *)self + 276);
  v6 = v5 >> 4;
  v7 = (v5 >> 4) & 0x1F;
  v8 = v5 & 0xFE0F;
  v9 = 16 * ((v6 | a4) & 0x1F);
  if (!a3)
    v9 = 16 * (v7 & ~(_WORD)a4);
  *((_WORD *)self + 276) = v9 | v8;
  if ((v7 == 0) == ((v9 & 0x1F0) != 0))
  {
    v10 = (v9 & 0x1F0) != 0;
    -[SBIconView _updateJitter](self, "_updateJitter");
    -[SBIconView updateParallaxSettings](self, "updateParallaxSettings");
    -[SBIconImageView setPaused:](self->_iconImageView, "setPaused:", v10);
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[SBIconViewCustomImageViewControlling setPauseReasons:](self->_customIconImageViewController, "setPauseReasons:", ((unint64_t)*((unsigned __int16 *)self + 276) >> 4) & 0x1F);
}

- (void)updateParallaxSettings
{
  id v3;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[SBIconView badgeParallaxSettings](self, "badgeParallaxSettings");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    -[SBIconAccessoryView setParallaxSettings:](self->_accessoryView, "setParallaxSettings:");
  }
  else
  {
    if (!self->_closeBox)
      return;
    -[SBIconView badgeParallaxSettings](self, "badgeParallaxSettings");
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  SBFApplyParallaxSettingsToView();

}

- (void)_updateIconImageViewAnimated:(BOOL)a3
{
  _BOOL8 v3;
  SBIconImageView *v5;
  SBIconImageView *iconImageView;

  if (self->_icon)
  {
    v3 = a3;
    if (!-[SBIconView isIconImageViewBorrowed](self, "isIconImageViewBorrowed"))
    {
      if (-[SBIconView allowsIconImageView](self, "allowsIconImageView"))
      {
        -[SBIconView updateCustomIconImageViewController](self, "updateCustomIconImageViewController");
        if (!self->_customIconImageViewController)
        {
          if ((-[SBIconImageView isMemberOfClass:](self->_iconImageView, "isMemberOfClass:", -[SBIconView expectedIconImageViewClass](self, "expectedIconImageViewClass")) & 1) == 0)
          {
            -[SBIconView _destroyIconImageView](self, "_destroyIconImageView");
            -[SBIconView _makeIconImageView](self, "_makeIconImageView");
            v5 = (SBIconImageView *)objc_claimAutoreleasedReturnValue();
            iconImageView = self->_iconImageView;
            self->_iconImageView = v5;

            -[SBIconView _updateBrightness](self, "_updateBrightness");
            -[SBIconView _updateAllComponentAlphas](self, "_updateAllComponentAlphas");
            -[SBIconImageView setPaused:](self->_iconImageView, "setPaused:", (*((_WORD *)self + 276) & 0x1F0) != 0);
            -[SBIconImageView setContentVisibility:](self->_iconImageView, "setContentVisibility:", -[SBIconView contentVisibility](self, "contentVisibility"));
          }
          if ((-[SBIconImageView isDescendantOfView:](self->_iconImageView, "isDescendantOfView:", self) & 1) == 0)
            -[SBIconView _insertIconImageView:](self, "_insertIconImageView:", self->_iconImageView);
          -[SBIconImageView setIcon:location:animated:](self->_iconImageView, "setIcon:location:animated:", self->_icon, self->_iconLocation, v3);
        }
      }
      else
      {
        -[SBIconView _destroyIconImageView](self, "_destroyIconImageView");
      }
    }
  }
}

- (void)_updateLaunchDisabled
{
  SBIcon *icon;
  int v4;
  int v5;
  unsigned int v6;
  int v7;
  unsigned int v8;
  char v9;

  icon = self->_icon;
  if (icon)
  {
    v4 = !-[SBIcon isLaunchEnabled](icon, "isLaunchEnabled");
    icon = self->_icon;
  }
  else
  {
    v4 = 0;
  }
  v5 = -[SBIcon isLaunchDisabledForObscuredReason](icon, "isLaunchDisabledForObscuredReason");
  v6 = *((unsigned __int8 *)self + 553);
  if (v5 != v6 >> 7 && (v5 & *((_BYTE *)self + 554) & 1) == 0)
  {
    v7 = 0;
    if (v5)
      v9 = 0x80;
    else
      v9 = 0;
    *((_BYTE *)self + 553) = v9 & 0x80 | v6 & 0x7F;
    if ((v5 & 1) != 0)
      goto LABEL_8;
    goto LABEL_7;
  }
  v7 = 1;
  if ((v5 & 1) == 0)
LABEL_7:
    *((_BYTE *)self + 554) &= ~1u;
LABEL_8:
  v8 = *((unsigned __int8 *)self + 553);
  if (v4 != ((v8 >> 6) & 1))
  {
    *((_BYTE *)self + 553) = v8 & 0xBF | ((_BYTE)v4 << 6);
    if (!v4 || ((*((char *)self + 553) < 0) & ~v7) == 0)
    {
      -[SBIconView _updateBrightness](self, "_updateBrightness");
      -[SBIconView _updateLabel](self, "_updateLabel");
    }
  }
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  char v4;
  char v5;

  v4 = *((_BYTE *)self + 552);
  if (((((v4 & 2) == 0) ^ a3) & 1) != 0)
  {
    -[SBIconView _updateIconImageAdornmentsAnimated:](self, "_updateIconImageAdornmentsAnimated:", a4);
  }
  else
  {
    if (a3)
      v5 = 2;
    else
      v5 = 0;
    *((_BYTE *)self + 552) = v4 & 0xFD | v5;
    -[SBIconView _applyEditingStateAnimated:](self, "_applyEditingStateAnimated:", a4);
  }
}

- (void)_updateAccessoryViewAnimated:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  double v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  _BOOL4 v13;
  uint64_t v14;
  SBIconAccessoryView *accessoryView;
  SBIconAccessoryView *v16;
  void *v17;
  char v18;
  SBIconAccessoryView *v19;
  SBIconAccessoryView *v20;
  void *v21;
  uint64_t v22;
  SBIconAccessoryView *v23;
  int v24;
  void *v25;
  SBIconAccessoryView *v26;
  __int128 v27;
  uint64_t v28;
  SBIconAccessoryView *v29;
  SBIconAccessoryView *v30;
  _QWORD v31[5];
  _QWORD v32[5];
  _QWORD v33[5];
  id v34;
  _QWORD v35[5];
  id v36;
  char v37;
  _QWORD v38[5];
  SBIconAccessoryView *v39;
  _QWORD v40[4];
  SBIconAccessoryView *v41;
  SBIconAccessoryView *v42;
  _QWORD v43[4];
  SBIconAccessoryView *v44;
  SBIconAccessoryView *v45;
  BOOL v46;
  char v47;
  id location[2];
  __int128 v49;
  __int128 v50;
  CGAffineTransform v51;

  v3 = a3;
  if (!-[NSHashTable count](self->_forbidAccessoryUpdatesAssertions, "count"))
  {
    -[SBIconView accessoryViewAnimator](self, "accessoryViewAnimator");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      if (objc_msgSend(v5, "state"))
      {
        objc_msgSend(v6, "stopAnimation:", 0);
        objc_msgSend(v6, "fractionComplete");
        objc_msgSend(v6, "finishAnimationAtPosition:", v7 <= 0.0);
      }
      -[SBIconView setAccessoryViewAnimator:](self, "setAccessoryViewAnimator:", 0);
    }
    if (!-[SBIconView shouldShowAccessoryView](self, "shouldShowAccessoryView"))
    {
      -[SBIconView _setShowingAccessoryView:](self, "_setShowingAccessoryView:", 0);
      if (v3)
      {
        v31[4] = self;
        v32[0] = MEMORY[0x1E0C809B0];
        v32[1] = 3221225472;
        v32[2] = __43__SBIconView__updateAccessoryViewAnimated___block_invoke_6;
        v32[3] = &unk_1E8D84C50;
        v32[4] = self;
        v31[0] = MEMORY[0x1E0C809B0];
        v31[1] = 3221225472;
        v31[2] = __43__SBIconView__updateAccessoryViewAnimated___block_invoke_7;
        v31[3] = &unk_1E8D84F68;
        objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:completion:", v32, v31, 0.3);
      }
      else
      {
        -[SBIconView _destroyAccessoryView](self, "_destroyAccessoryView");
      }
      goto LABEL_42;
    }
    -[SBIconView icon](self, "icon");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (!v3)
    {
      v17 = (void *)MEMORY[0x1E0DC3F10];
      v33[0] = MEMORY[0x1E0C809B0];
      v33[1] = 3221225472;
      v33[2] = __43__SBIconView__updateAccessoryViewAnimated___block_invoke_5;
      v33[3] = &unk_1E8D84EF0;
      v33[4] = self;
      v34 = v8;
      objc_msgSend(v17, "performWithoutAnimation:", v33);

LABEL_41:
LABEL_42:

      return;
    }
    v10 = objc_alloc(MEMORY[0x1E0DC3F38]);
    v11 = objc_alloc_init(MEMORY[0x1E0DC3CA0]);
    v12 = (void *)objc_msgSend(v10, "initWithDuration:timingParameters:", v11, 0.3);

    v13 = -[SBIconView _isShowingAccessoryView](self, "_isShowingAccessoryView");
    v14 = objc_msgSend((id)objc_opt_class(), "defaultViewClassForAccessoryType:", -[SBIconView currentAccessoryType](self, "currentAccessoryType"));
    accessoryView = self->_accessoryView;
    if (accessoryView)
    {
      if (v14)
      {
        if ((-[SBIconAccessoryView isMemberOfClass:](accessoryView, "isMemberOfClass:", v14) & 1) != 0)
        {
          v16 = 0;
LABEL_20:
          -[SBIconView _createAccessoryViewIfNecessary](self, "_createAccessoryViewIfNecessary");
          v18 = 0;
LABEL_21:
          v20 = self->_accessoryView;
          -[SBIconAccessoryView configureAnimatedForIcon:infoProvider:animator:](v20, "configureAnimatedForIcon:infoProvider:animator:", v9, self, v12);
          -[SBIconView _centerForAccessoryView](self, "_centerForAccessoryView");
          -[SBIconAccessoryView setCenter:](v20, "setCenter:");
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            -[SBIconView badgeParallaxSettings](self, "badgeParallaxSettings");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            -[SBIconAccessoryView setParallaxSettings:](v20, "setParallaxSettings:", v21);

          }
          if ((v18 & 1) != 0)
            v22 = 0;
          else
            v22 = -[SBIconAccessoryView displayingAccessory](v20, "displayingAccessory");
          if ((v22 & 1) == 0 && !v16)
          {
            v16 = v20;
            v23 = self->_accessoryView;
            self->_accessoryView = 0;

          }
          v24 = !v13;
          if ((_DWORD)v22 && v24 && !v16)
          {
            CGAffineTransformMakeScale(&v51, 0.01, 0.01);
            v25 = &v51;
            v26 = v20;
          }
          else
          {
            if (((v22 | v24) & 1) != 0)
            {
LABEL_36:
              -[SBIconView _setShowingAccessoryView:](self, "_setShowingAccessoryView:", v22);
              v28 = MEMORY[0x1E0C809B0];
              v43[0] = MEMORY[0x1E0C809B0];
              v43[1] = 3221225472;
              v43[2] = __43__SBIconView__updateAccessoryViewAnimated___block_invoke;
              v43[3] = &unk_1E8D85328;
              v46 = v13;
              v47 = v22;
              v29 = v20;
              v44 = v29;
              v30 = v16;
              v45 = v30;
              objc_msgSend(v12, "addAnimations:", v43);
              if (v16)
              {
                if ((_DWORD)v22)
                {
                  -[SBIconAccessoryView setAlpha:](v29, "setAlpha:", 0.0);
                  v40[0] = v28;
                  v40[1] = 3221225472;
                  v40[2] = __43__SBIconView__updateAccessoryViewAnimated___block_invoke_2;
                  v40[3] = &unk_1E8D84EF0;
                  v41 = v30;
                  v42 = v29;
                  objc_msgSend(v12, "addAnimations:", v40);

                }
                v38[0] = v28;
                v38[1] = 3221225472;
                v38[2] = __43__SBIconView__updateAccessoryViewAnimated___block_invoke_3;
                v38[3] = &unk_1E8D86588;
                v38[4] = self;
                v39 = v30;
                objc_msgSend(v12, "addCompletion:", v38);

              }
              objc_initWeak(location, v12);
              v35[0] = v28;
              v35[1] = 3221225472;
              v35[2] = __43__SBIconView__updateAccessoryViewAnimated___block_invoke_4;
              v35[3] = &unk_1E8D8B998;
              v37 = v22;
              v35[4] = self;
              objc_copyWeak(&v36, location);
              objc_msgSend(v12, "addCompletion:", v35);
              -[SBIconView setAccessoryViewAnimator:](self, "setAccessoryViewAnimator:", v12);
              objc_msgSend(v12, "startAnimation");
              objc_destroyWeak(&v36);
              objc_destroyWeak(location);

              goto LABEL_41;
            }
            v27 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
            *(_OWORD *)location = *MEMORY[0x1E0C9BAA8];
            v49 = v27;
            v50 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
            v25 = location;
            v26 = v16;
          }
          -[SBIconAccessoryView setTransform:](v26, "setTransform:", v25);
          goto LABEL_36;
        }
        accessoryView = self->_accessoryView;
      }
      v16 = accessoryView;
      v19 = self->_accessoryView;
      self->_accessoryView = 0;

      if (v14)
        goto LABEL_20;
    }
    else
    {
      v16 = 0;
      if (v14)
        goto LABEL_20;
    }
    v18 = 1;
    goto LABEL_21;
  }
}

- (BOOL)canShowAccessoryView
{
  int64_t v3;
  void *v4;
  BOOL v5;
  char v6;

  if (-[SBIconView allowsAdornmentsOverIconImage](self, "allowsAdornmentsOverIconImage"))
  {
    v3 = -[SBIconView currentAccessoryType](self, "currentAccessoryType");
    -[SBIconView behaviorDelegate](self, "behaviorDelegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!self->_icon)
    {
      v5 = 0;
      goto LABEL_12;
    }
    if ((objc_msgSend((id)objc_opt_class(), "_alwaysShowsAccessoryOfType:", v3) & 1) != 0)
    {
LABEL_4:
      v5 = 1;
LABEL_12:

      return v5;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v6 = objc_msgSend(v4, "iconViewDisplaysBadges:", self);
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) == 0)
        goto LABEL_4;
      v6 = objc_msgSend(v4, "iconViewDisplaysAccessories:", self);
    }
    v5 = v6;
    goto LABEL_12;
  }
  return 0;
}

- (void)_destroyAccessoryView
{
  SBIconAccessoryView *accessoryView;

  if (self->_accessoryView)
  {
    -[SBIconView _destroyAccessoryView:](self, "_destroyAccessoryView:");
    accessoryView = self->_accessoryView;
    self->_accessoryView = 0;

  }
}

- (UIViewPropertyAnimator)accessoryViewAnimator
{
  return self->_accessoryViewAnimator;
}

- (void)_setShowingAccessoryView:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 0x80;
  else
    v3 = 0;
  *((_BYTE *)self + 556) = v3 & 0x80 | *((_BYTE *)self + 556) & 0x7F;
}

- (void)_updateCloseBoxWithAnimation:(int64_t)a3
{
  _BOOL8 v5;
  _BOOL4 v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  SBCloseBoxView *v15;
  SBCloseBoxView *v16;
  void *v17;
  SBCloseBoxView *v18;
  SBCloseBoxView *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t);
  void *v24;
  SBCloseBoxView *v25;
  _QWORD aBlock[4];
  SBCloseBoxView *v27;
  SBIconView *v28;
  _QWORD v29[5];
  _QWORD v30[5];
  id v31;

  v5 = a3 != 2;
  v6 = -[SBIconView shouldShowCloseBox](self, "shouldShowCloseBox");
  v7 = -[SBIconView _isShowingCloseBox](self, "_isShowingCloseBox");
  if (v6)
  {
    if (v7)
      v5 = 0;
    else
      -[SBIconView _setShowingCloseBox:](self, "_setShowingCloseBox:", 1);
    -[SBIconView contentContainerView](self, "contentContainerView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBIconView closeBoxAnimator](self, "closeBoxAnimator");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
    {
      if (v5)
        objc_msgSend(v11, "setReversed:", objc_msgSend(v11, "isReversed") ^ 1);
    }
    else
    {
      v13 = MEMORY[0x1E0C809B0];
      v14 = (void *)MEMORY[0x1E0DC3F10];
      v30[0] = MEMORY[0x1E0C809B0];
      v30[1] = 3221225472;
      v30[2] = __43__SBIconView__updateCloseBoxWithAnimation___block_invoke;
      v30[3] = &unk_1E8D84EF0;
      v30[4] = self;
      v31 = v10;
      objc_msgSend(v14, "performWithoutAnimation:", v30);

      if (v5)
      {
        v29[0] = v13;
        v29[1] = 3221225472;
        v29[2] = __43__SBIconView__updateCloseBoxWithAnimation___block_invoke_2;
        v29[3] = &unk_1E8D84C50;
        v29[4] = self;
        objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v29);
        v15 = self->_closeBox;
        aBlock[0] = v13;
        aBlock[1] = 3221225472;
        aBlock[2] = __43__SBIconView__updateCloseBoxWithAnimation___block_invoke_3;
        aBlock[3] = &unk_1E8D84EF0;
        v27 = v15;
        v28 = self;
        v16 = v15;
        v17 = _Block_copy(aBlock);
        -[SBIconView _animateCloseBoxWithAnimation:animationBlock:](self, "_animateCloseBoxWithAnimation:animationBlock:", a3, v17);

      }
    }
    -[SBIconView _updateAccessoryViewAnimated:](self, "_updateAccessoryViewAnimated:", v5);

  }
  else if (v7)
  {
    -[SBIconView _setShowingCloseBox:](self, "_setShowingCloseBox:", 0);
    if (a3 == 2)
    {
      -[SBCloseBoxView removeFromSuperview](self->_closeBox, "removeFromSuperview");
    }
    else
    {
      *((_BYTE *)self + 552) = *((_BYTE *)self + 552) & 0xF3 | 8;
      -[SBIconView closeBoxAnimator](self, "closeBoxAnimator");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      if (v8)
      {
        objc_msgSend(v8, "setReversed:", objc_msgSend(v8, "isReversed") ^ 1);
      }
      else
      {
        v18 = self->_closeBox;
        v21 = MEMORY[0x1E0C809B0];
        v22 = 3221225472;
        v23 = __43__SBIconView__updateCloseBoxWithAnimation___block_invoke_4;
        v24 = &unk_1E8D84C50;
        v25 = v18;
        v19 = v18;
        v20 = _Block_copy(&v21);
        -[SBIconView _animateCloseBoxWithAnimation:animationBlock:](self, "_animateCloseBoxWithAnimation:animationBlock:", a3, v20, v21, v22, v23, v24);

      }
    }
    -[SBIconView _updateAccessoryViewAnimated:](self, "_updateAccessoryViewAnimated:", a3 != 2);
  }
}

- (BOOL)_isShowingCloseBox
{
  return (*((unsigned __int8 *)self + 556) >> 4) & 1;
}

- (void)_updateJitter
{
  -[SBIconView _updateJitter:animated:](self, "_updateJitter:animated:", 0, 1);
}

- (BOOL)shouldShowCloseBox
{
  _BOOL4 v3;

  v3 = -[SBIconView isEditing](self, "isEditing");
  if (v3)
    LOBYTE(v3) = -[SBIconView canShowCloseBox](self, "canShowCloseBox");
  return v3;
}

- (BOOL)isEditing
{
  return (*((_BYTE *)self + 552) & 2) != 0 && -[NSCountedSet count](self->_forbidEditingModeReasons, "count") == 0;
}

+ (BOOL)_alwaysShowsAccessoryOfType:(int64_t)a3
{
  return a3 == 2;
}

- (BOOL)_isShowingAccessoryView
{
  return *((unsigned __int8 *)self + 556) >> 7;
}

- (void)_fetchApplicationShortcutItemsIfAppropriate
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[5];
  id v9;

  -[SBIconView icon](self, "icon");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isApplicationIcon")
    && (__sb__runningInSpringBoard() & 1) == 0
    && objc_msgSend((id)objc_opt_class(), "supportsPreviewInteraction"))
  {
    objc_msgSend(v3, "applicationBundleID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBIconView shortcutsDelegate](self, "shortcutsDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      if (objc_msgSend(v5, "iconViewShouldIncludeUninstallShortcutItem:", self))
        v6 = 16777224;
      else
        v6 = 0x1000000;
    }
    else
    {
      v6 = 0x1000000;
    }
    objc_msgSend((id)objc_opt_class(), "applicationShortcutService");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __57__SBIconView__fetchApplicationShortcutItemsIfAppropriate__block_invoke;
    v8[3] = &unk_1E8D8B8D8;
    v8[4] = self;
    v9 = v3;
    objc_msgSend(v7, "fetchApplicationShortcutItemsOfTypes:forBundleIdentifier:withCompletionHandler:", v6, v4, v8);

  }
  else
  {
    -[SBIconView setFetchedApplicationShortcutItems:](self, "setFetchedApplicationShortcutItems:", 0);
  }

}

- (void)_startTrackingSupportedMultitaskingShortcutActionsIfAppropriateWithOldIcon:(id)a3
{
  void *v3;
  void *v5;
  int v6;
  char v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  -[SBIconView icon](self, "icon");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = __sb__runningInSpringBoard();
  v7 = v6;
  if (v6)
  {
    if (SBFEffectiveDeviceClass() != 2)
      goto LABEL_14;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "userInterfaceIdiom") != 1)
    {
LABEL_13:

      goto LABEL_14;
    }
  }
  v8 = (__sb__runningInSpringBoard() ^ 1) & __SBIconViewOwnerWantsMultitaskingKeyboardShortcuts;
  if ((v7 & 1) != 0)
  {
    if (!v8)
      goto LABEL_14;
  }
  else
  {

    if ((v8 & 1) == 0)
      goto LABEL_14;
  }
  if (objc_msgSend(v5, "isApplicationIcon"))
  {
    objc_msgSend(v5, "applicationBundleID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBIconView _multitaskingAppShortcutService](self, "_multitaskingAppShortcutService");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "startObservingSupportedShortcutsForBundleIdentifier:", v9);

  }
  if (objc_msgSend(v12, "isApplicationIcon"))
  {
    objc_msgSend(v12, "applicationBundleID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBIconView _multitaskingAppShortcutService](self, "_multitaskingAppShortcutService");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stopObservingSupportedShortcutsForBundleIdentifier:", v3);

    goto LABEL_13;
  }
LABEL_14:

}

- (void)setFetchedApplicationShortcutItems:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1152);
}

- (void)setLocation:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  NSString *v6;
  NSString *iconLocation;
  void *v8;
  id v9;

  v4 = a4;
  v9 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    v6 = (NSString *)objc_msgSend(v9, "copy");
    iconLocation = self->_iconLocation;
    self->_iconLocation = v6;

    -[SBIconView _updateFrameToIconViewSize](self, "_updateFrameToIconViewSize");
    -[SBIconView _updateIconImageViewAnimated:](self, "_updateIconImageViewAnimated:", v4);
    -[SBIconView _updateLabelAnimated:](self, "_updateLabelAnimated:", v4);
    -[SBIconView _updateIconImageAdornmentsAnimated:](self, "_updateIconImageAdornmentsAnimated:", v4);
    -[SBIconView customIconImageViewController](self, "customIconImageViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBIconView iconImageInfo](self, "iconImageInfo");
    objc_msgSend(v8, "setIconImageInfo:");

  }
}

- (void)_updateConfigurationForIconImageView:(id)a3
{
  void *v4;
  char isKindOfClass;
  void *v6;
  id v7;

  v7 = a3;
  objc_opt_self();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v7, "backgroundView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBIconView _configureViewAsFolderIconImageView:](self, "_configureViewAsFolderIconImageView:", v6);

  }
}

uint64_t __48__SBIconView__updateAllComponentAlphasAnimated___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "effectiveIconImageAlpha");
  objc_msgSend(v2, "_applyIconImageAlpha:");
  v3 = *(void **)(a1 + 32);
  objc_msgSend(v3, "effectiveIconAccessoryAlpha");
  objc_msgSend(v3, "_applyIconAccessoryAlpha:");
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v4, "effectiveIconLabelAlpha");
  objc_msgSend(v4, "_applyIconLabelAlpha:");
  v5 = *(void **)(a1 + 32);
  objc_msgSend(v5, "effectiveOverallAlpha");
  return objc_msgSend(v5, "_applyOverallAlpha:");
}

- (void)_updateLabel
{
  -[SBIconView _updateLabelAnimated:](self, "_updateLabelAnimated:", 0);
}

- (void)_applyIconLabelAlpha:(double)a3
{
  -[SBIconLabelView setAlpha:](self->_labelView, "setAlpha:");
  -[SBIconLabelAccessoryView setAlpha:](self->_labelAccessoryView, "setAlpha:", a3);
}

- (CGSize)iconViewSizeForIconImageSize:(CGSize)a3
{
  double height;
  CGFloat width;
  double v5;
  double v6;
  double v7;
  CGSize result;

  height = a3.height;
  width = a3.width;
  if (-[SBIconView allowsLabelArea](self, "allowsLabelArea"))
  {
    objc_msgSend((id)objc_opt_class(), "_labelHeight");
    height = height + v5;
  }
  v6 = width;
  v7 = height;
  result.height = v7;
  result.width = v6;
  return result;
}

- (BOOL)_shouldShowLabel
{
  void *v2;
  BOOL v3;

  -[SBIconView _labelHidingReason](self, "_labelHidingReason");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 == 0;

  return v3;
}

- (BOOL)allowsLabelArea
{
  return *((_BYTE *)self + 557) & 1;
}

+ (double)_labelHeight
{
  _BOOL4 v2;
  void *v3;
  double result;

  if (__sb__runningInSpringBoard())
  {
    v2 = SBFEffectiveDeviceClass() == 2;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = objc_msgSend(v3, "userInterfaceIdiom") == 1;

  }
  result = 14.0;
  if (v2)
    return 17.0;
  return result;
}

- (double)effectiveOverallAlpha
{
  BOOL v3;
  double result;
  BOOL v5;
  _BOOL4 v6;

  v3 = -[SBIconView isDropping](self, "isDropping");
  result = 1.0;
  if (!v3)
  {
    v5 = -[SBIconView isGrabbed](self, "isGrabbed", 1.0);
    result = 0.5;
    if (!v5)
    {
      v6 = -[SBIconView isDragging](self, "isDragging", 0.5);
      result = 1.0;
      if (v6)
        objc_msgSend((id)objc_opt_class(), "iconLiftAlpha");
    }
  }
  return result;
}

- (double)effectiveIconImageAlpha
{
  double iconImageAlpha;
  void *v4;
  double v5;
  SBIconViewCustomImageViewControlling *customIconImageViewController;

  iconImageAlpha = self->_iconImageAlpha;
  if (-[SBIconView isDropping](self, "isDropping") && !-[SBIconView isOverlapping](self, "isOverlapping"))
  {
    if (self->_showsImageAndLabelDuringDrop)
      return 1.0;
    else
      return 0.0;
  }
  else
  {
    if (-[SBIconView isOverlapping](self, "isOverlapping"))
    {
      -[SBIconView icon](self, "icon");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v4, "isFolderIcon"))
      {

      }
      else
      {
        customIconImageViewController = self->_customIconImageViewController;

        if (!customIconImageViewController)
          return 0.5;
      }
    }
    v5 = 1.0;
    if (!-[SBIconView isGrabbed](self, "isGrabbed") && !-[SBIconView isDragging](self, "isDragging"))
    {
      if (-[SBIconView allIconElementsButLabelHidden](self, "allIconElementsButLabelHidden"))
        return 0.0;
      else
        return iconImageAlpha;
    }
  }
  return v5;
}

- (void)_applyIconImageAlpha:(double)a3
{
  id v5;

  if (!-[SBIconView isIconImageViewBorrowed](self, "isIconImageViewBorrowed"))
  {
    -[SBIconView currentImageView](self, "currentImageView");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAlpha:", a3);

  }
}

- (void)_applyIconAccessoryAlpha:(double)a3
{
  -[SBIconAccessoryView setAlpha:](self->_accessoryView, "setAlpha:");
  if (-[SBIconView shouldShowCloseBox](self, "shouldShowCloseBox"))
    -[SBCloseBoxView setAlpha:](self->_closeBox, "setAlpha:", a3);
  if (-[SBIconView shouldShowResizeHandle](self, "shouldShowResizeHandle"))
    -[SBHIconResizeHandle setAlpha:](self->_resizeHandle, "setAlpha:", a3);
  -[SBIconImageView setProgressAlpha:](self->_iconImageView, "setProgressAlpha:", a3);
}

- (void)setBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_super v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[SBIconView bounds](self, "bounds");
  v8.receiver = self;
  v8.super_class = (Class)SBIconView;
  -[SBIconView setBounds:](&v8, sel_setBounds_, x, y, width, height);
  -[SBIconView bounds](self, "bounds");
  if ((BSSizeEqualToSize() & 1) == 0)
    -[SBIconView _notifyObserversSizeDidChange](self, "_notifyObserversSizeDidChange");
}

- (double)effectiveIconAccessoryAlpha
{
  double iconAccessoryAlpha;
  double v4;

  iconAccessoryAlpha = self->_iconAccessoryAlpha;
  v4 = 0.0;
  if (!-[SBIconView isDropping](self, "isDropping"))
  {
    v4 = 1.0;
    if (!-[SBIconView isGrabbed](self, "isGrabbed") && !-[SBIconView isDragging](self, "isDragging"))
    {
      if (-[SBIconView allIconElementsButLabelHidden](self, "allIconElementsButLabelHidden"))
        return 0.0;
      else
        return iconAccessoryAlpha;
    }
  }
  return v4;
}

- (double)effectiveIconLabelAlpha
{
  double iconLabelAlpha;
  double v4;

  iconLabelAlpha = self->_iconLabelAlpha;
  v4 = 0.0;
  if (!-[SBIconView _hideIconLabelForCustomIconImageViewController](self, "_hideIconLabelForCustomIconImageViewController"))
  {
    if (-[SBIconView isDropping](self, "isDropping"))
    {
      if (self->_showsImageAndLabelDuringDrop)
        return 1.0;
      else
        return 0.0;
    }
    else if (!-[SBIconView isOverlapping](self, "isOverlapping"))
    {
      v4 = 1.0;
      if (!-[SBIconView isGrabbed](self, "isGrabbed") && !-[SBIconView isDragging](self, "isDragging"))
      {
        if (-[SBIconView _hideIconLabelForContextMenu](self, "_hideIconLabelForContextMenu"))
          return 0.0;
        else
          return iconLabelAlpha;
      }
    }
  }
  return v4;
}

- (BOOL)isDragging
{
  return (*((unsigned __int8 *)self + 556) >> 1) & 1;
}

- (BOOL)isGrabbed
{
  return (*((unsigned __int8 *)self + 553) >> 1) & 1;
}

- (BOOL)isDropping
{
  return -[NSHashTable count](self->_droppingAssertions, "count") != 0;
}

- (BOOL)isOverlapping
{
  return (*((unsigned __int8 *)self + 553) >> 2) & 1;
}

- (BOOL)_hideIconLabelForCustomIconImageViewController
{
  if (self->_customIconImageViewController && (objc_opt_respondsToSelector() & 1) != 0)
    return -[SBIconViewCustomImageViewControlling wantsLabelHidden](self->_customIconImageViewController, "wantsLabelHidden");
  else
    return 0;
}

- (BOOL)_hideIconLabelForContextMenu
{
  _BOOL4 v3;

  v3 = -[SBIconView isShowingContextMenu](self, "isShowingContextMenu");
  if (v3)
    LOBYTE(v3) = !-[NSHashTable isEqualToHashTable:](self->_contextMenuInteractionConfigurations, "isEqualToHashTable:", self->_dismissingContextMenuInteractionConfigurations);
  return v3;
}

- (BOOL)isContextMenuInteractionActive
{
  return -[NSHashTable count](self->_contextMenuInteractionConfigurations, "count") != 0;
}

- (BOOL)allIconElementsButLabelHidden
{
  return *((unsigned __int8 *)self + 558) >> 7;
}

- (void)_updateLabelArea
{
  -[SBIconView _updateLabelAreaAnimated:](self, "_updateLabelAreaAnimated:", 0);
}

- (void)_updateLabelAccessoryView
{
  -[SBIconView _configureLabelAccessoryViewForType:](self, "_configureLabelAccessoryViewForType:", -[SBIconView currentLabelAccessoryType](self, "currentLabelAccessoryType"));
  -[SBIconView setNeedsLayout](self, "setNeedsLayout");
}

- (void)_configureLabelAccessoryViewForType:(int64_t)a3
{
  void *v5;
  void *v6;
  SBIconLabelAccessoryView *labelAccessoryView;
  SBIconLabelAccessoryView *v8;
  SBIconLabelAccessoryView *v9;
  SBIconLabelAccessoryView *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  if (self->_displayedLabelAccessoryType != a3)
  {
    self->_displayedLabelAccessoryType = a3;
    -[SBIconView reuseDelegate](self, "reuseDelegate");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    if (self->_labelAccessoryView)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v14, "iconView:willRemoveIconLabelAccessoryView:", self, self->_labelAccessoryView);
      -[SBIconLabelAccessoryView superview](self->_labelAccessoryView, "superview");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBIconView contentContainerView](self, "contentContainerView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v5 == v6)
        -[SBIconLabelAccessoryView removeFromSuperview](self->_labelAccessoryView, "removeFromSuperview");
      labelAccessoryView = self->_labelAccessoryView;
      self->_labelAccessoryView = 0;

    }
    if (a3)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v14, "iconView:iconLabelAccessoryViewOfType:", self, a3);
        v8 = (SBIconLabelAccessoryView *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v8 = (SBIconLabelAccessoryView *)objc_alloc_init((Class)objc_msgSend((id)objc_opt_class(), "defaultViewClassForLabelAccessoryType:", a3));
      }
      v9 = self->_labelAccessoryView;
      self->_labelAccessoryView = v8;

      -[SBIconLabelAccessoryView setAlpha:](self->_labelAccessoryView, "setAlpha:", 1.0);
      v10 = self->_labelAccessoryView;
      -[SBIconView legibilitySettings](self, "legibilitySettings");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBIconView labelFont](self, "labelFont");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBIconLabelAccessoryView updateWithLegibilitySettings:labelFont:](v10, "updateWithLegibilitySettings:labelFont:", v11, v12);

      -[SBIconView contentContainerView](self, "contentContainerView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addSubview:", self->_labelAccessoryView);

    }
    -[SBIconView _updateBrightness](self, "_updateBrightness");

  }
}

- (Class)expectedIconImageViewClass
{
  if (self->_icon)
    return -[SBIcon iconImageViewClassForLocation:](self->_icon, "iconImageViewClassForLocation:", self->_iconLocation);
  objc_opt_self();
  return (Class)(id)objc_claimAutoreleasedReturnValue();
}

- (id)_legibilitySettingsWithParameters:(id)a3
{
  return self->_legibilitySettings;
}

- (void)setShowsImageAndLabelDuringDrop:(BOOL)a3
{
  if (self->_showsImageAndLabelDuringDrop != a3)
  {
    self->_showsImageAndLabelDuringDrop = a3;
    -[SBIconView _updateAllComponentAlphas](self, "_updateAllComponentAlphas");
  }
}

- (void)setOverrideBadgeNumberOrString:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  NSCopying *v6;
  NSCopying *overrideBadgeNumberOrString;

  if (self->_overrideBadgeNumberOrString != a3)
  {
    v4 = a4;
    v6 = (NSCopying *)objc_msgSend(a3, "copyWithZone:", 0);
    overrideBadgeNumberOrString = self->_overrideBadgeNumberOrString;
    self->_overrideBadgeNumberOrString = v6;

    -[SBIconView _updateAccessoryViewAnimated:](self, "_updateAccessoryViewAnimated:", v4);
  }
}

- (void)setOverrideBadgeNumberOrString:(id)a3
{
  -[SBIconView setOverrideBadgeNumberOrString:animated:](self, "setOverrideBadgeNumberOrString:animated:", a3, 0);
}

- (void)setOverrideActionDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_overrideActionDelegate, a3);
}

- (void)setOverlapping:(BOOL)a3
{
  char v3;
  char v5;
  _OWORD v6[3];
  __int128 v7;
  __int128 v8;
  __int128 v9;

  v3 = *((_BYTE *)self + 553);
  if (((((v3 & 4) == 0) ^ a3) & 1) == 0)
  {
    if (a3)
      v5 = 4;
    else
      v5 = 0;
    *((_BYTE *)self + 553) = v3 & 0xFB | v5;
    -[SBIconView _updateJitter](self, "_updateJitter");
    v8 = 0u;
    v9 = 0u;
    v7 = 0u;
    -[SBIconView transform](self, "transform");
    *((_QWORD *)&v8 + 1) = 0x3FF0000000000000;
    *(_QWORD *)&v7 = 0x3FF0000000000000;
    -[SBIconView _updateAllComponentAlphas](self, "_updateAllComponentAlphas");
    -[SBIconView _updateIconImageAdornmentsAnimated:](self, "_updateIconImageAdornmentsAnimated:", 1);
    v6[0] = v7;
    v6[1] = v8;
    v6[2] = v9;
    -[SBIconView setTransform:](self, "setTransform:", v6);
  }
}

- (void)setLiftingDragSession:(id)a3
{
  objc_storeWeak((id *)&self->_liftingDragSession, a3);
}

- (void)setLastContextMenuInteractionFailedToLoad:(BOOL)a3
{
  self->_lastContextMenuInteractionFailedToLoad = a3;
}

- (void)setImageLoadingBehavior:(unint64_t)a3
{
  *((_BYTE *)self + 558) = *((_BYTE *)self + 558) & 0xF9 | (2 * (a3 & 3));
}

- (void)setIconImageAlpha:(double)a3
{
  if (self->_iconImageAlpha != a3)
  {
    self->_iconImageAlpha = a3;
    -[SBIconView effectiveIconImageAlpha](self, "effectiveIconImageAlpha");
    -[SBIconView _applyIconImageAlpha:](self, "_applyIconImageAlpha:");
  }
}

- (void)setGrabbed:(BOOL)a3
{
  char v3;
  char v5;

  v3 = *((_BYTE *)self + 553);
  if (((((v3 & 2) == 0) ^ a3) & 1) == 0)
  {
    if (a3)
      v5 = 2;
    else
      v5 = 0;
    *((_BYTE *)self + 553) = v3 & 0xFD | v5;
    -[SBIconView _toggleContentContainerViewIfNecessary](self, "_toggleContentContainerViewIfNecessary");
    -[SBIconView _updateAllComponentAlphas](self, "_updateAllComponentAlphas");
    -[SBIconView _updateJitter](self, "_updateJitter");
  }
}

- (void)setEditingAnimationStrength:(double)a3
{
  if (self->_editingAnimationStrength != a3)
  {
    self->_editingAnimationStrength = a3;
    if ((*((_BYTE *)self + 554) & 2) != 0)
    {
      -[SBIconView _removeJitterAnimated:](self, "_removeJitterAnimated:", 0);
      -[SBIconView _addJitterAnimated:](self, "_addJitterAnimated:", 0);
    }
  }
}

- (void)setDragging:(BOOL)a3 updateImmediately:(BOOL)a4
{
  char v4;
  _BOOL4 v5;
  char v7;

  v4 = *((_BYTE *)self + 556);
  if (((((v4 & 2) == 0) ^ a3) & 1) == 0)
  {
    v5 = a4;
    if (a3)
      v7 = 2;
    else
      v7 = 0;
    *((_BYTE *)self + 556) = v4 & 0xFD | v7;
    -[SBIconView _toggleContentContainerViewIfNecessary](self, "_toggleContentContainerViewIfNecessary");
    -[SBIconView _updateCursorInteractionsEnabled](self, "_updateCursorInteractionsEnabled");
    -[SBIconView _updateJitter](self, "_updateJitter");
    if (v5)
      -[SBIconView _updateAllComponentAlphas](self, "_updateAllComponentAlphas");
  }
}

- (void)setDragging:(BOOL)a3
{
  -[SBIconView setDragging:updateImmediately:](self, "setDragging:updateImmediately:", a3, 1);
}

- (void)setDragLifted:(BOOL)a3
{
  char v3;
  char v4;

  v3 = *((_BYTE *)self + 556);
  if (((((v3 & 4) == 0) ^ a3) & 1) == 0)
  {
    if (a3)
      v4 = 4;
    else
      v4 = 0;
    *((_BYTE *)self + 556) = v3 & 0xFB | v4;
  }
}

- (void)setCancelingDrag:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 0x80;
  else
    v3 = 0;
  *((_BYTE *)self + 555) = v3 & 0x80 | *((_BYTE *)self + 555) & 0x7F;
}

- (void)setAddedToDrag:(BOOL)a3
{
  *((_BYTE *)self + 556) = *((_BYTE *)self + 556) & 0xFE | a3;
}

- (void)earlyTerminateContextMenuDismissAnimation
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  NSHashTable *contextMenuInteractionConfigurations;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint8_t buf[8];
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (-[NSHashTable count](self->_contextMenuInteractionConfigurations, "count"))
  {
    SBLogIconContextMenu();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CFEF3000, v3, OS_LOG_TYPE_DEFAULT, "earlyTerminateContextMenuDismissAnimation", buf, 2u);
    }

    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v4 = (void *)-[NSHashTable copy](self->_contextMenuInteractionConfigurations, "copy", 0);
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v13 != v7)
            objc_enumerationMutation(v4);
          v9 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i);
          -[SBIconView _contextMenuConfigurationWillDismiss:](self, "_contextMenuConfigurationWillDismiss:", v9);
          -[SBIconView _contextMenuConfigurationDidDismiss:](self, "_contextMenuConfigurationDidDismiss:", v9);
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
      }
      while (v6);
    }

    contextMenuInteractionConfigurations = self->_contextMenuInteractionConfigurations;
    self->_contextMenuInteractionConfigurations = 0;

    -[SBIconView shortcutsDelegate](self, "shortcutsDelegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v11, "iconViewShortcutsPresentationDidCancel:", self);

  }
}

- (UIViewPropertyAnimator)closeBoxAnimator
{
  return self->_closeBoxAnimator;
}

- (void)setAccessoryViewAnimator:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryViewAnimator, a3);
}

- (void)_insertIconImageView:(id)a3
{
  BOOL v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;

  v9 = a3;
  v4 = -[SBIconView isIconImageViewBorrowed](self, "isIconImageViewBorrowed");
  v5 = v9;
  if (v4)
    goto LABEL_11;
  -[SBIconView contentContainerView](self, "contentContainerView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (self->_labelView || self->_dropGlow)
  {
    v8 = v9;
  }
  else
  {
    v8 = v9;
    if (!self->_focusEffectPlatterView)
    {
      objc_msgSend(v6, "addSubview:", v9);
      goto LABEL_6;
    }
  }
  objc_msgSend(v6, "insertSubview:aboveSubview:", v8);
LABEL_6:
  if (self->_closeBox)
    objc_msgSend(v7, "insertSubview:belowSubview:", v9);
  if (self->_resizeHandle)
    objc_msgSend(v7, "bringSubviewToFront:");
  -[SBIconView updateAccessoryViewContainerIfNecessary](self, "updateAccessoryViewContainerIfNecessary");

  v5 = v9;
LABEL_11:

}

- (void)_destroyIconImageView
{
  char v3;
  SBIconImageView *iconImageView;
  SBIconImageView *v5;
  id v6;

  if (self->_iconImageView)
  {
    if (-[SBIconAccessoryView isDescendantOfView:](self->_accessoryView, "isDescendantOfView:"))
      -[SBIconAccessoryView removeFromSuperview](self->_accessoryView, "removeFromSuperview");
    -[SBIconView reuseDelegate](self, "reuseDelegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if (self->_iconImageView)
    {
      v3 = objc_opt_respondsToSelector();
      iconImageView = self->_iconImageView;
      if ((v3 & 1) != 0)
      {
        objc_msgSend(v6, "iconView:willRemoveIconImageView:", self, iconImageView);
        iconImageView = self->_iconImageView;
      }
    }
    else
    {
      iconImageView = 0;
    }
    if (-[SBIconImageView isDescendantOfView:](iconImageView, "isDescendantOfView:", self))
      -[SBIconImageView removeFromSuperview](self->_iconImageView, "removeFromSuperview");
    v5 = self->_iconImageView;
    self->_iconImageView = 0;

  }
}

- (void)_configureViewAsFolderIconImageView:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  SBIconView *v9;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0DC3F10];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __50__SBIconView__configureViewAsFolderIconImageView___block_invoke;
  v7[3] = &unk_1E8D84EF0;
  v8 = v4;
  v9 = self;
  v6 = v4;
  objc_msgSend(v5, "performWithoutAnimation:", v7);

}

- (id)badgeParallaxSettings
{
  void *v3;
  void *v4;

  if (-[SBIconView isPaused](self, "isPaused"))
  {
    v3 = 0;
  }
  else
  {
    -[SBIconView behaviorDelegate](self, "behaviorDelegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v4, "parallaxSettingsForComponentsOfIconView:", self);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v3 = 0;
    }

  }
  return v3;
}

+ (id)applicationShortcutService
{
  if (applicationShortcutService_onceToken != -1)
    dispatch_once(&applicationShortcutService_onceToken, &__block_literal_global_305);
  return (id)applicationShortcutService__applicationShortcutService;
}

- (void)setIcon:(id)a3
{
  -[SBIconView setIcon:animated:](self, "setIcon:animated:", a3, 0);
}

- (void)setContinuityInfo:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  SBIconContinuityInfo *v7;
  SBIconContinuityInfo *v8;

  v4 = a4;
  v7 = (SBIconContinuityInfo *)a3;
  if (self->_continuityInfo != v7)
  {
    v8 = v7;
    objc_storeStrong((id *)&self->_continuityInfo, a3);
    -[SBIconView _updateAccessoryViewAnimated:](self, "_updateAccessoryViewAnimated:", v4);
    v7 = v8;
  }

}

- (void)setContinuityInfo:(id)a3
{
  -[SBIconView setContinuityInfo:animated:](self, "setContinuityInfo:animated:", a3, 0);
}

- (CGSize)iconViewSize
{
  double v3;
  double v4;
  CGSize result;

  -[SBIconView iconImageSize](self, "iconImageSize");
  -[SBIconView iconViewSizeForIconImageSize:](self, "iconViewSizeForIconImageSize:");
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)setLocation:(id)a3
{
  -[SBIconView setLocation:animated:](self, "setLocation:animated:", a3, 0);
}

- (void)clearIconImageInfo
{
  if ((*((_BYTE *)self + 557) & 8) != 0)
  {
    *((_BYTE *)self + 557) &= ~8u;
    -[SBIconView _updateAfterManualIconImageInfoChangeInvalidatingLayout:](self, "_updateAfterManualIconImageInfoChangeInvalidatingLayout:", 1);
  }
}

- (void)setIconImageCache:(id)a3
{
  SBHIconImageCache *v5;

  v5 = (SBHIconImageCache *)a3;
  if (self->_iconImageCache != v5)
  {
    objc_storeStrong((id *)&self->_iconImageCache, a3);
    -[SBIconImageView setIconImageCache:](self->_iconImageView, "setIconImageCache:", v5);
    -[SBIconView _updateFrameToIconViewSize](self, "_updateFrameToIconViewSize");
  }

}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y;
  CGFloat x;
  id v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  uint64_t v17;
  double top;
  double left;
  BOOL v20;
  CGPoint v22;
  CGRect v23;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  -[SBIconView currentImageView](self, "currentImageView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "frame");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v17 = objc_msgSend(v7, "type");

  if (v17 == 11)
  {
    top = self->_cursorHitTestPadding.top;
    left = self->_cursorHitTestPadding.left;
    v10 = v10 + left;
    v12 = v12 + top;
    v14 = v14 - (left + self->_cursorHitTestPadding.right);
    v16 = v16 - (top + self->_cursorHitTestPadding.bottom);
  }
  v23.origin.x = v10;
  v23.origin.y = v12;
  v23.size.width = v14;
  v23.size.height = v16;
  v22.x = x;
  v22.y = y;
  v20 = CGRectContainsPoint(v23, v22);

  return v20;
}

- (CGRect)iconImageFrame
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect result;

  -[SBIconView currentImageView](self, "currentImageView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "frame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (void)layoutSubviews
{
  UIView *scalingContainer;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  SBIconImageCrossfadeView *crossfadeView;
  SBIconAccessoryView *accessoryView;
  SBCloseBoxView *closeBox;
  SBHIconResizeHandle *resizeHandle;
  UILabel *iconIndexLabel;
  double v18;
  void *v19;
  SBIconFocusEffectPlatterView *focusEffectPlatterView;
  SBIconFocusEffectPlatterView *v21;
  void *v22;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)SBIconView;
  -[SBIconView layoutSubviews](&v23, sel_layoutSubviews);
  -[SBIconView bounds](self, "bounds");
  -[UIView setBounds:](self->_scalingContainer, "setBounds:");
  scalingContainer = self->_scalingContainer;
  UIRectGetCenter();
  -[UIView setCenter:](scalingContainer, "setCenter:");
  -[SBIconView currentImageView](self, "currentImageView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconView _frameForImageView](self, "_frameForImageView");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  if (-[SBIconView shouldUpdateFrameOfIconImageView](self, "shouldUpdateFrameOfIconImageView"))
    objc_msgSend(v4, "sbf_setBoundsAndPositionFromFrame:", v6, v8, v10, v12);
  crossfadeView = self->_crossfadeView;
  if (crossfadeView)
    -[SBIconImageCrossfadeView layoutIfNeeded](crossfadeView, "layoutIfNeeded");
  -[SBIconView _frameForLabel](self, "_frameForLabel");
  -[SBIconLabelView setFrame:](self->_labelView, "setFrame:");
  if (self->_labelAccessoryView)
  {
    -[SBIconView _frameForLabelAccessory](self, "_frameForLabelAccessory");
    -[SBIconLabelAccessoryView setFrame:](self->_labelAccessoryView, "setFrame:");
  }
  accessoryView = self->_accessoryView;
  if (accessoryView)
  {
    -[SBIconView _centerForAccessoryView](self, "_centerForAccessoryView");
    -[SBIconAccessoryView setCenter:](accessoryView, "setCenter:");
  }
  closeBox = self->_closeBox;
  if (closeBox)
  {
    -[SBIconView _centerForCloseBox](self, "_centerForCloseBox");
    -[SBCloseBoxView setCenter:](closeBox, "setCenter:");
  }
  resizeHandle = self->_resizeHandle;
  if (resizeHandle)
  {
    -[SBIconView _centerForResizeHandle](self, "_centerForResizeHandle");
    -[SBHIconResizeHandle setCenter:](resizeHandle, "setCenter:");
  }
  iconIndexLabel = self->_iconIndexLabel;
  if (iconIndexLabel)
  {
    -[SBIconView iconImageInfo](self, "iconImageInfo");
    -[UILabel _setContinuousCornerRadius:](iconIndexLabel, "_setContinuousCornerRadius:", v18);
    -[UILabel setFrame:](self->_iconIndexLabel, "setFrame:", v6, v8, v10, v12);
    -[UILabel setClipsToBounds:](self->_iconIndexLabel, "setClipsToBounds:", 1);
    -[SBIconView contentContainerView](self, "contentContainerView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "bringSubviewToFront:", self->_iconIndexLabel);

  }
  focusEffectPlatterView = self->_focusEffectPlatterView;
  if (focusEffectPlatterView)
  {
    -[SBIconView _focusEffectCenter](self, "_focusEffectCenter");
    -[SBIconFocusEffectPlatterView setCenter:](focusEffectPlatterView, "setCenter:");
    v21 = self->_focusEffectPlatterView;
    -[SBIconView _focusEffectBounds](self, "_focusEffectBounds");
    -[SBIconFocusEffectPlatterView setBounds:](v21, "setBounds:");
    -[SBIconView contentContainerView](self, "contentContainerView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "insertSubview:belowSubview:", self->_focusEffectPlatterView, v4);

  }
}

- (id)currentImageView
{
  void *crossfadeView;
  id v3;

  crossfadeView = self->_crossfadeView;
  if (!crossfadeView)
  {
    if (self->_customIconImageViewController)
    {
      -[SBIconViewCustomImageViewControlling view](self->_customIconImageViewController, "view");
      v3 = (id)objc_claimAutoreleasedReturnValue();
      return v3;
    }
    crossfadeView = self->_iconImageView;
  }
  v3 = crossfadeView;
  return v3;
}

- (CGRect)_frameForLabel
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CGFloat v24;
  CGFloat v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  CGFloat v35;
  CGFloat v36;
  CGFloat v37;
  CGFloat v38;
  CGFloat v39;
  CGFloat v40;
  CGFloat v41;
  CGFloat v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect result;

  -[SBIconView _labelImage](self, "_labelImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconView _frameForImageView](self, "_frameForImageView");
  v41 = v5;
  v42 = v4;
  v39 = v7;
  v40 = v6;
  -[SBIconView _labelBaselineOffsetFromImage](self, "_labelBaselineOffsetFromImage");
  -[SBIconView bounds](self, "bounds");
  v37 = v9;
  v38 = v8;
  v35 = v11;
  v36 = v10;
  objc_msgSend(v3, "size");
  v13 = v12;
  v15 = v14;
  objc_msgSend(v3, "alignmentRectInsets");
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v23 = v22;
  objc_msgSend(v3, "baselineOffsetFromBottom");
  v24 = v13 - (v19 + v23);
  v25 = v15 - (v17 + v21);
  -[SBIconView traitCollection](self, "traitCollection");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "displayScale");

  v43.origin.y = v37;
  v43.origin.x = v38;
  v43.size.height = v35;
  v43.size.width = v36;
  CGRectGetWidth(v43);
  v44.origin.x = v19 + 0.0;
  v44.origin.y = v17 + 0.0;
  v44.size.width = v24;
  v44.size.height = v25;
  CGRectGetWidth(v44);
  v45.origin.x = v19 + 0.0;
  v45.origin.y = v17 + 0.0;
  v45.size.width = v24;
  v45.size.height = v25;
  CGRectGetMinX(v45);
  UICeilToScale();
  v28 = v27;
  v46.origin.y = v41;
  v46.origin.x = v42;
  v46.size.height = v39;
  v46.size.width = v40;
  CGRectGetMaxY(v46);
  UICeilToScale();
  v30 = v29;

  v31 = v28;
  v32 = v30;
  v33 = v13;
  v34 = v15;
  result.size.height = v34;
  result.size.width = v33;
  result.origin.y = v32;
  result.origin.x = v31;
  return result;
}

- (double)_labelBaselineOffsetFromImage
{
  uint64_t v3;
  double v4;
  void *v6;
  double v7;
  double v8;

  v3 = -[SBIconView methodForSelector:](self, "methodForSelector:", sel__labelVerticalOffset);
  if (v3 == +[SBIconView instanceMethodForSelector:](SBIconView, "instanceMethodForSelector:", sel__labelVerticalOffset))
  {
    -[SBIconView labelConfiguration](self, "labelConfiguration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "baselineOffsetFromImage");
    v8 = v7;

    return v8;
  }
  else
  {
    -[SBIconView _labelVerticalOffset](self, "_labelVerticalOffset");
    return v4 + 14.0;
  }
}

- (id)_labelImage
{
  void *v2;
  void *v3;
  id v4;

  -[SBIconLabelView image](self->_labelView, "image");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

- (void)_updateFrameToIconViewSize
{
  CGFloat v3;
  double v4;
  CGFloat v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;

  -[SBIconView iconImageSize](self, "iconImageSize");
  v4 = v3;
  v6 = v5;
  self->_visibleImageRect.origin.x = 0.0;
  self->_visibleImageRect.origin.y = 0.0;
  self->_visibleImageRect.size.width = v3;
  self->_visibleImageRect.size.height = v5;
  UIRectGetCenter();
  v8 = v7;
  v10 = v9;
  -[SBIconView iconViewSizeForIconImageSize:](self, "iconViewSizeForIconImageSize:", v4, v6);
  if (v11 <= 0.0 || (v13 = v12, v12 <= 0.0))
  {
    -[SBIconView layer](self, "layer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setAnchorPoint:", 0.5, 0.5);

  }
  else
  {
    v14 = v11;
    v15 = v8 / v11;
    -[SBIconView layer](self, "layer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setAnchorPoint:", v15, v10 / v13);

    -[SBIconView setBounds:](self, "setBounds:", 0.0, 0.0, v14, v13);
  }
  if (self->_iconImageView)
    -[SBIconView _updateConfigurationForIconImageView:](self, "_updateConfigurationForIconImageView:");
}

- (CGRect)_frameForImageView
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGRect result;

  if (self->_iconImageSizeMatchesBoundsSize)
  {
    -[SBIconView bounds](self, "bounds");
  }
  else
  {
    -[SBIconView iconImageSize](self, "iconImageSize");
    v4 = v6;
    v5 = v7;
    v3 = 0.0;
    v2 = 0.0;
  }
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

+ (CGSize)maxLabelSizeForListLayout:(id)a3 iconImageSize:(CGSize)a4 contentSizeCategory:(id)a5 options:(unint64_t)a6
{
  double height;
  double width;
  id v11;
  id v12;
  uint64_t v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  CGSize result;

  height = a4.height;
  width = a4.width;
  v11 = a3;
  v12 = a5;
  v13 = objc_msgSend(a1, "methodForSelector:", sel_maxLabelSizeForIconImageSize_);
  if (v13 == +[SBIconView methodForSelector:](SBIconView, "methodForSelector:", sel_maxLabelSizeForIconImageSize_))
  {
    objc_msgSend(a1, "labelConfigurationForListLayout:contentSizeCategory:options:", v11, v12, a6);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "extraWidth");
    v15 = width + v19;
    objc_msgSend(v18, "height");
    v17 = v20;

  }
  else
  {
    objc_msgSend(a1, "maxLabelSizeForIconImageSize:", width, height);
    v15 = v14;
    v17 = v16;
  }

  v21 = v15;
  v22 = v17;
  result.height = v22;
  result.width = v21;
  return result;
}

- (void)setLegibilitySettings:(id)a3
{
  char v4;
  void *v5;
  _UILegibilitySettings *v6;
  _UILegibilitySettings *legibilitySettings;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  _UILegibilitySettings *v18;
  void *v19;
  double v20;
  uint64_t v21;
  void *v22;
  SBIconLabelAccessoryView *labelAccessoryView;
  _UILegibilitySettings *v24;
  void *v25;
  char v26;
  id v27;

  v27 = a3;
  v4 = -[_UILegibilitySettings isEqual:](self->_legibilitySettings, "isEqual:", v27);
  v5 = v27;
  if ((v4 & 1) == 0)
  {
    if (v27)
    {
      v6 = (_UILegibilitySettings *)v27;
    }
    else
    {
      objc_msgSend((id)objc_opt_class(), "defaultLegibilitySettings");
      v6 = (_UILegibilitySettings *)objc_claimAutoreleasedReturnValue();
    }
    legibilitySettings = self->_legibilitySettings;
    self->_legibilitySettings = v6;

    -[SBIconView maxLabelSize](self, "maxLabelSize");
    v9 = v8;
    v11 = v10;
    v12 = (void *)objc_opt_class();
    -[SBIconView contentSizeCategory](self, "contentSizeCategory");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "labelMaximumHeightForContentSizeCategory:", v13);
    v15 = v14;

    -[SBIconView _screen](self, "_screen");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      if (v11 < v15)
        v11 = v15;
      -[SBIconView iconLabelViewFactory](self, "iconLabelViewFactory");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = self->_legibilitySettings;
      -[SBIconView _screen](self, "_screen");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "scale");
      objc_msgSend(v17, "prewarmForSettings:maxSize:minSize:scale:", v18, v9, v11, 10.0, v11, v20);

    }
    v21 = -[_UILegibilitySettings style](self->_legibilitySettings, "style");
    -[SBHomeScreenButton materialView](self->_closeBox, "materialView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setLegibilityStyle:", v21);

    -[SBHIconResizeHandle setDarkStyle:](self->_resizeHandle, "setDarkStyle:", v21 == 2);
    labelAccessoryView = self->_labelAccessoryView;
    v24 = self->_legibilitySettings;
    -[SBIconView labelFont](self, "labelFont");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBIconLabelAccessoryView updateWithLegibilitySettings:labelFont:](labelAccessoryView, "updateWithLegibilitySettings:labelFont:", v24, v25);

    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[SBIconAccessoryView setLegibilityStyle:](self->_accessoryView, "setLegibilityStyle:", v21);
    -[SBIconView _updateLabel](self, "_updateLabel");
    -[SBIconView layoutIfNeeded](self, "layoutIfNeeded");
    -[SBIconImageView iconViewLegibilitySettingsDidChange](self->_iconImageView, "iconViewLegibilitySettingsDidChange");
    v26 = objc_opt_respondsToSelector();
    v5 = v27;
    if ((v26 & 1) != 0)
    {
      -[SBIconViewCustomImageViewControlling setLegibilitySettings:](self->_customIconImageViewController, "setLegibilitySettings:", self->_legibilitySettings);
      v5 = v27;
    }
  }

}

- (id)_labelImageParameters
{
  SBIconLabelImageParametersBuilder *v3;
  void *v4;

  v3 = objc_alloc_init(SBIconLabelImageParametersBuilder);
  -[SBIconView configureLabelImageParametersBuilder:](self, "configureLabelImageParametersBuilder:", v3);
  -[SBIconLabelImageParametersBuilder buildParameters](v3, "buildParameters");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)configureLabelImageParametersBuilder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  -[SBIconView icon](self, "icon");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconView location](self, "location");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "configureLabelImageParametersBuilder:forIcon:location:", v10, v4, v5);
  objc_msgSend(v10, "setIconView:", self);
  -[SBIconView legibilitySettings](self, "legibilitySettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setLegibilitySettings:", v6);

  objc_msgSend(v10, "setLabelAccessoryType:", -[SBIconView currentLabelAccessoryType](self, "currentLabelAccessoryType"));
  -[SBIconView contentSizeCategory](self, "contentSizeCategory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setContentSizeCategory:", v7);
  -[SBIconView labelFont](self, "labelFont");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    objc_msgSend(v10, "setFont:", v8);
  if ((*((_BYTE *)self + 553) & 0x40) != 0 && (*((char *)self + 553) & 0x80000000) == 0)
  {
    objc_msgSend(v4, "displayNameForObscuredDisabledLaunchForLocation:", v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setOverrideText:", v9);

  }
}

- (_UILegibilitySettings)legibilitySettings
{
  return self->_legibilitySettings;
}

- (BOOL)displaysIconStatusInLabel
{
  return *((_BYTE *)self + 559) & 1;
}

- (CGSize)maxLabelSize
{
  void *v3;
  void *v4;
  uint64_t v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGSize result;

  -[SBIconView listLayout](self, "listLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconView contentSizeCategory](self, "contentSizeCategory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[SBIconView isLabelTextBold](self, "isLabelTextBold");
  -[SBIconView iconImageInfo](self, "iconImageInfo");
  v7 = v6;
  v9 = v8;
  v10 = (void *)objc_opt_class();
  if (v3)
    objc_msgSend(v10, "maxLabelSizeForListLayout:iconImageSize:contentSizeCategory:options:", v3, v4, v5, v7, v9);
  else
    objc_msgSend(v10, "maxLabelSizeForIconImageSize:contentSizeCategory:options:", v4, v5, v7, v9);
  v13 = v11;
  v14 = v12;

  v15 = v13;
  v16 = v14;
  result.height = v16;
  result.width = v15;
  return result;
}

- (UIFont)labelFont
{
  UIFont *v3;
  void *v4;
  void *v5;

  v3 = self->_labelFont;
  -[SBIconView contentSizeCategory](self, "contentSizeCategory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[SBIconView listLayout](self, "listLayout");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {

LABEL_6:
      +[SBIconLabelImageParametersBuilder defaultFontForContentSizeCategory:languageInsets:](SBIconLabelImageParametersBuilder, "defaultFontForContentSizeCategory:languageInsets:", v4, 0);
      v3 = (UIFont *)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
    objc_msgSend(v5, "labelFontForContentSizeCategory:options:", v4, -[SBIconView isLabelTextBold](self, "isLabelTextBold"));
    v3 = (UIFont *)objc_claimAutoreleasedReturnValue();

    if (!v3)
      goto LABEL_6;
  }
LABEL_7:

  return v3;
}

- (id)labelConfiguration
{
  void *v3;
  void *v4;
  void *v5;

  -[SBIconView listLayout](self, "listLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconView contentSizeCategory](self, "contentSizeCategory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "labelConfigurationForListLayout:contentSizeCategory:options:", v3, v4, -[SBIconView isLabelTextBold](self, "isLabelTextBold"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)contentSizeCategory
{
  id v2;

  objc_msgSend((id)*MEMORY[0x1E0DC4730], "preferredContentSizeCategory");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if (!v2)
    v2 = (id)*MEMORY[0x1E0DC4938];
  return v2;
}

+ (id)labelConfigurationForListLayout:(id)a3 contentSizeCategory:(id)a4 options:(unint64_t)a5
{
  id v8;
  id v9;
  SBHIconLabelVisualConfiguration *v10;

  v8 = a3;
  v9 = a4;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v8, "labelVisualConfigurationForContentSizeCategory:options:", v9, a5);
    v10 = (SBHIconLabelVisualConfiguration *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = objc_alloc_init(SBHIconLabelVisualConfiguration);
    objc_msgSend(a1, "defaultMaxLabelHeight");
    -[SBHIconLabelVisualConfiguration setHeight:](v10, "setHeight:");
    objc_msgSend(a1, "defaultMaxLabelWidthDeltaForContentSizeCategory:", v9);
    -[SBHIconLabelVisualConfiguration setExtraWidth:](v10, "setExtraWidth:");
  }

  return v10;
}

- (BOOL)shouldShowLabelAccessoryView
{
  return -[SBIconView currentLabelAccessoryType](self, "currentLabelAccessoryType") != 0;
}

+ (void)configureLabelImageParametersBuilder:(id)a3 forIcon:(id)a4 location:(id)a5
{
  objc_msgSend(a3, "setIcon:forLocation:", a4, a5);
}

- (void)setFolderIconImageCache:(id)a3
{
  SBFolderIconImageCache *v5;
  SBFolderIconImageCache *v6;

  v5 = (SBFolderIconImageCache *)a3;
  if (self->_folderIconImageCache != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_folderIconImageCache, a3);
    -[SBIconImageView iconViewFolderIconImageCacheDidChange](self->_iconImageView, "iconViewFolderIconImageCacheDidChange");
    v5 = v6;
  }

}

- (void)addObserver:(id)a3
{
  id v4;
  NSHashTable *observers;
  NSHashTable *v6;
  NSHashTable *v7;
  id v8;

  v4 = a3;
  if (v4)
  {
    observers = self->_observers;
    v8 = v4;
    if (!observers)
    {
      objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
      v6 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
      v7 = self->_observers;
      self->_observers = v6;

      observers = self->_observers;
    }
    -[NSHashTable addObject:](observers, "addObject:", v8);
    v4 = v8;
  }

}

- (unint64_t)imageLoadingBehavior
{
  return ((unint64_t)*((unsigned __int8 *)self + 558) >> 1) & 3;
}

- (void)setEditing:(BOOL)a3
{
  -[SBIconView setEditing:animated:](self, "setEditing:animated:", a3, 0);
}

- (void)setAllowsCloseBox:(BOOL)a3 withAnimation:(int64_t)a4
{
  char v4;
  char v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v4 = *((_BYTE *)self + 554);
  if (((((v4 & 0x20) == 0) ^ a3) & 1) == 0)
  {
    if (a3)
      v7 = 32;
    else
      v7 = 0;
    *((_BYTE *)self + 554) = v4 & 0xDF | v7;
    -[SBIconView window](self, "window");
    v8 = objc_claimAutoreleasedReturnValue();
    if (!v8
      || (v9 = (void *)v8,
          -[SBIconView icon](self, "icon"),
          v10 = (void *)objc_claimAutoreleasedReturnValue(),
          v10,
          v9,
          !v10))
    {
      a4 = 2;
    }
    -[SBIconView _updateCloseBoxWithAnimation:](self, "_updateCloseBoxWithAnimation:", a4);
  }
}

- (void)setAllowsCloseBox:(BOOL)a3
{
  -[SBIconView setAllowsCloseBox:withAnimation:](self, "setAllowsCloseBox:withAnimation:", a3, 0);
}

- (void)setDisplaysIconStatusInLabel:(BOOL)a3
{
  char v3;

  v3 = *((_BYTE *)self + 559);
  if (((((v3 & 1) == 0) ^ a3) & 1) == 0)
  {
    *((_BYTE *)self + 559) = v3 & 0xFE | a3;
    -[SBIconView _updateLabel](self, "_updateLabel");
  }
}

- (void)prepareToCrossfadeImageWithView:(id)a3 anchorPoint:(CGPoint)a4 options:(unint64_t)a5
{
  double y;
  double x;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *customIconImageViewController;
  id v14;
  void *v15;
  SBIconImageCrossfadeView *v16;
  SBIconImageCrossfadeView *crossfadeView;
  SBIconImageCrossfadeView *v18;
  id v19;
  void *v20;
  id v21;

  y = a4.y;
  x = a4.x;
  v9 = a3;
  -[SBIconView cleanupAfterCrossfade](self, "cleanupAfterCrossfade");
  -[SBIconView contentContainerView](self, "contentContainerView");
  v21 = (id)objc_claimAutoreleasedReturnValue();
  -[SBIconView currentImageView](self, "currentImageView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "subviews");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "indexOfObject:", v10);

  customIconImageViewController = self->_customIconImageViewController;
  if (!customIconImageViewController)
    customIconImageViewController = self->_iconImageView;
  v14 = customIconImageViewController;
  objc_opt_self();
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (SBIconImageCrossfadeView *)objc_msgSend(objc_alloc((Class)v15), "initWithSource:crossfadeView:", v14, v9);
  crossfadeView = self->_crossfadeView;
  self->_crossfadeView = v16;

  v18 = self->_crossfadeView;
  -[SBIconView _frameForImageView](self, "_frameForImageView");
  -[SBIconImageCrossfadeView sbf_setBoundsAndPositionFromFrame:](v18, "sbf_setBoundsAndPositionFromFrame:");
  -[SBIconImageCrossfadeView setMasksCorners:](self->_crossfadeView, "setMasksCorners:", a5 & 1);
  -[SBIconImageCrossfadeView setPerformsTrueCrossfade:](self->_crossfadeView, "setPerformsTrueCrossfade:", (a5 >> 1) & 1);
  -[SBIconImageCrossfadeView setStretchAnchorPoint:](self->_crossfadeView, "setStretchAnchorPoint:", x, y);
  -[SBIconImageCrossfadeView setCrossfadeStyle:](self->_crossfadeView, "setCrossfadeStyle:", (a5 >> 3) & 1);
  -[SBIconView updateAccessoryViewContainerIfNecessary](self, "updateAccessoryViewContainerIfNecessary");
  objc_msgSend(v10, "superview");
  v19 = (id)objc_claimAutoreleasedReturnValue();

  v20 = v21;
  if (v19 == v21)
  {
    objc_msgSend(v10, "setHidden:", 1);
    v20 = v21;
  }
  objc_msgSend(v20, "insertSubview:atIndex:", self->_crossfadeView, v12);
  -[SBIconView layoutIfNeeded](self, "layoutIfNeeded");
  -[SBIconImageCrossfadeView prepareGeometry](self->_crossfadeView, "prepareGeometry");
  -[SBIconView _updateJitter](self, "_updateJitter");

}

- (void)_removeUnknownSubviews
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int *v7;
  uint64_t i;
  SBIconLabelView *v9;
  objc_class *v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  NSObject *v19;
  objc_class *v20;
  void *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  void *v34;
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  -[SBIconView subviews](self, "subviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v27, v36, 16);
  if (v4)
  {
    v5 = v4;
    v22 = 0;
    v6 = *(_QWORD *)v28;
    v7 = &OBJC_IVAR___SBHIconTableViewCell__iconViewContainerViewConstraints;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v28 != v6)
          objc_enumerationMutation(v3);
        v9 = *(SBIconLabelView **)(*((_QWORD *)&v27 + 1) + 8 * i);
        if (v9 != self->_labelView
          && v9 != (SBIconLabelView *)self->_labelAccessoryView
          && v9 != (SBIconLabelView *)self->_closeBox
          && v9 != *(SBIconLabelView **)((char *)&self->super.super.super.isa + v7[82])
          && v9 != self->_accessoryView
          && v9 != (SBIconLabelView *)self->_scalingContainer
          && v9 != (SBIconLabelView *)self->_dropGlow
          && v9 != (SBIconLabelView *)self->_focusEffectPlatterView
          && v9 != (SBIconLabelView *)self->_crossfadeView)
        {
          v10 = (objc_class *)objc_opt_class();
          NSStringFromClass(v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v11, "isEqualToString:", CFSTR("_UIClickHighlightInteractionEffectAnchorView")))
          {
            v12 = v22;
            if (!v22)
              v12 = objc_alloc_init(MEMORY[0x1E0C99E20]);
            objc_msgSend(v12, "addObject:", v9, v12);
          }

          v7 = &OBJC_IVAR___SBHIconTableViewCell__iconViewContainerViewConstraints;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v27, v36, 16);
    }
    while (v5);
  }
  else
  {
    v22 = 0;
  }

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v13 = v22;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v35, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v24;
    do
    {
      for (j = 0; j != v15; ++j)
      {
        if (*(_QWORD *)v24 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * j);
        SBLogIcon();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
        {
          v20 = (objc_class *)objc_opt_class();
          NSStringFromClass(v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v32 = v21;
          v33 = 2112;
          v34 = v18;
          _os_log_fault_impl(&dword_1CFEF3000, v19, OS_LOG_TYPE_FAULT, "Unknown subview found in SBIconView when preparing for reuse! (53825790) %{public}@ %@", buf, 0x16u);

        }
        objc_msgSend(v18, "removeFromSuperview");
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v35, 16);
    }
    while (v15);
  }

}

- (NSString)backgroundViewGroupNameBase
{
  void *v3;
  int v4;
  void *v5;
  const __CFString *v6;
  uint64_t v8;

  if ((objc_opt_respondsToSelector() & 1) == 0)
    goto LABEL_8;
  -[SBIconViewCustomImageViewControlling backgroundViewProvider](self->_customIconImageViewController, "backgroundViewProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3 || (objc_opt_respondsToSelector() & 1) == 0)
  {
    v5 = 0;
    goto LABEL_10;
  }
  v4 = -[SBIconViewCustomImageViewControlling wantsCaptureOnlyBackgroundView](self->_customIconImageViewController, "wantsCaptureOnlyBackgroundView");

  if (v4)
  {
    objc_msgSend((id)objc_opt_class(), "groupNameBaseForComponentBackgroundViewOfType:", 4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[SBIconViewCustomImageViewControlling visiblyActiveDataSource](self->_customIconImageViewController, "visiblyActiveDataSource");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v6 = CFSTR("-Files");
LABEL_14:
        objc_msgSend(v5, "stringByAppendingString:", v6);
        v8 = objc_claimAutoreleasedReturnValue();

        v5 = (void *)v8;
        goto LABEL_10;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v6 = CFSTR("-AppPrediction");
        goto LABEL_14;
      }
LABEL_10:

    }
  }
  else
  {
LABEL_8:
    v5 = 0;
  }
  return (NSString *)v5;
}

- (void)setDisallowCursorInteraction:(BOOL)a3
{
  char v3;
  char v4;

  v3 = *((_BYTE *)self + 558);
  if (((((v3 & 8) == 0) ^ a3) & 1) == 0)
  {
    if (a3)
      v4 = 8;
    else
      v4 = 0;
    *((_BYTE *)self + 558) = v3 & 0xF7 | v4;
    -[SBIconView _updateCursorInteractionsEnabled](self, "_updateCursorInteractionsEnabled");
  }
}

- (void)setListLayoutProvider:(id)a3
{
  -[SBIconView setListLayoutProvider:animated:](self, "setListLayoutProvider:animated:", a3, 0);
}

+ (CGPoint)defaultIconImageCenterForIconImageSize:(CGSize)a3
{
  double v3;
  double v4;
  CGPoint result;

  UIRectGetCenter();
  result.y = v4;
  result.x = v3;
  return result;
}

- (unint64_t)configurationOptions
{
  uint64_t v3;
  _BOOL4 v4;
  uint64_t v5;
  unint64_t v6;

  if (-[SBIconView isUserInteractionEnabled](self, "isUserInteractionEnabled"))
    v3 = 0;
  else
    v3 = 4;
  if (!-[SBIconView allowsLabelArea](self, "allowsLabelArea"))
    v3 |= 2uLL;
  v4 = -[SBIconView allowsPassthroughHitTesting](self, "allowsPassthroughHitTesting");
  v5 = v3 | 8;
  if (!v4)
    v5 = v3;
  v6 = v5 | ((unint64_t)*((unsigned __int8 *)self + 557) >> 1) & 0x10;
  if (-[SBIconView allowsAccessoryView](self, "allowsAccessoryView"))
    return v6;
  else
    return v6 | 0x20;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  SBCloseBoxView *v8;
  _BOOL4 v9;
  _BOOL4 v10;
  BOOL v11;
  void *v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  CGFloat v25;
  SBCloseBoxView *v26;
  void *v28;
  double v29;
  CGFloat v30;
  double v31;
  CGFloat v32;
  void *v33;
  SBCloseBoxView *v34;
  _QWORD v36[5];
  id v37;
  uint64_t *v38;
  double v39;
  double v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t (*v44)(uint64_t, uint64_t);
  void (*v45)(uint64_t);
  id v46;
  CGAffineTransform v47;
  CGAffineTransform v48;
  objc_super v49;
  CGPoint v50;
  CGPoint v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  v49.receiver = self;
  v49.super_class = (Class)SBIconView;
  -[SBIconView hitTest:withEvent:](&v49, sel_hitTest_withEvent_, v7, x, y);
  v8 = (SBCloseBoxView *)objc_claimAutoreleasedReturnValue();
  v9 = -[SBIconView isIconContentScalingEnabled](self, "isIconContentScalingEnabled");
  v10 = v9;
  if (v8)
    v11 = !v9;
  else
    v11 = 0;
  if (v11)
    goto LABEL_19;
  if (self->_closeBox && -[SBIconView _isShowingCloseBox](self, "_isShowingCloseBox"))
  {
    if (-[SBIconView isIconContentScalingEnabled](self, "isIconContentScalingEnabled"))
    {
      -[SBIconView contentContainerView](self, "contentContainerView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "convertPoint:fromView:", self, x, y);
      v14 = v13;
      v16 = v15;
      -[SBCloseBoxView frame](self->_closeBox, "frame");
      v18 = v17;
      v20 = v19;
      v22 = v21;
      v24 = v23;
      -[SBIconView iconContentScale](self, "iconContentScale");
      CGAffineTransformMakeScale(&v47, v25, v25);
      CGAffineTransformInvert(&v48, &v47);
      v52.origin.x = v18;
      v52.origin.y = v20;
      v52.size.width = v22;
      v52.size.height = v24;
      v53 = CGRectApplyAffineTransform(v52, &v48);
      v50.x = v14;
      v50.y = v16;
      if (CGRectContainsPoint(v53, v50))
      {
        v26 = self->_closeBox;

        v8 = v26;
      }
    }
    else
    {
      -[SBCloseBoxView convertPoint:fromView:](self->_closeBox, "convertPoint:fromView:", self, x, y);
      if (!-[SBCloseBoxView pointInside:withEvent:](self->_closeBox, "pointInside:withEvent:", v7))
        goto LABEL_13;
      v12 = v8;
      v8 = self->_closeBox;
    }

  }
LABEL_13:
  if (!v8)
  {
    if (self->_resizeHandle
      && -[SBIconView isShowingResizeHandle](self, "isShowingResizeHandle")
      && (-[SBHIconResizeHandle convertPoint:fromView:](self->_resizeHandle, "convertPoint:fromView:", self, x, y),
          -[SBHIconResizeHandle pointInside:withEvent:](self->_resizeHandle, "pointInside:withEvent:", v7)))
    {
      v8 = self->_resizeHandle;
    }
    else
    {
      v8 = 0;
    }
  }
LABEL_19:
  if (v8 == (SBCloseBoxView *)self && v10)
  {
    -[SBIconView contentContainerView](self, "contentContainerView");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "convertPoint:fromView:", self, x, y);
    v30 = v29;
    v32 = v31;
    objc_msgSend(v28, "bounds");
    v51.x = v30;
    v51.y = v32;
    v8 = (SBCloseBoxView *)self;
    if (!CGRectContainsPoint(v54, v51))
    {

      v8 = 0;
    }

  }
  if (!v8)
  {
    if (-[SBIconView allowsPassthroughHitTesting](self, "allowsPassthroughHitTesting"))
    {
      v41 = 0;
      v42 = &v41;
      v43 = 0x3032000000;
      v44 = __Block_byref_object_copy__15;
      v45 = __Block_byref_object_dispose__15;
      v46 = 0;
      -[SBIconView subviews](self, "subviews");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v36[0] = MEMORY[0x1E0C809B0];
      v36[1] = 3221225472;
      v36[2] = __32__SBIconView_hitTest_withEvent___block_invoke;
      v36[3] = &unk_1E8D8BA88;
      v39 = x;
      v40 = y;
      v38 = &v41;
      v36[4] = self;
      v37 = v7;
      objc_msgSend(v33, "enumerateObjectsWithOptions:usingBlock:", 2, v36);

      v8 = (SBCloseBoxView *)v42[5];
      if (v8)
        v34 = v8;

      _Block_object_dispose(&v41, 8);
    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (BOOL)allowsPassthroughHitTesting
{
  return (*((unsigned __int8 *)self + 557) >> 1) & 1;
}

- (BOOL)isIconContentScalingEnabled
{
  return (*((_BYTE *)self + 555) & 8) != 0
      || -[SBIconView _isForcingIconContentScalingEnabled](self, "_isForcingIconContentScalingEnabled");
}

- (BOOL)_isForcingIconContentScalingEnabled
{
  return (*((unsigned __int8 *)self + 555) >> 4) & 1;
}

- (void)setApproximateLayoutPosition:(SBIconApproximateLayoutPosition)a3
{
  unint64_t vertical;
  unint64_t horizontal;
  SBIconApproximateLayoutPosition *p_approximateLayoutPosition;
  id v7;

  vertical = a3.vertical;
  horizontal = a3.horizontal;
  p_approximateLayoutPosition = &self->_approximateLayoutPosition;
  if (!SBIconApproximateLayoutPositionEqualToApproximateLayoutPosition(self->_approximateLayoutPosition.horizontal, self->_approximateLayoutPosition.vertical, a3.horizontal, a3.vertical))
  {
    p_approximateLayoutPosition->horizontal = horizontal;
    p_approximateLayoutPosition->vertical = vertical;
    -[SBIconView customIconImageViewController](self, "customIconImageViewController");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v7, "setApproximateLayoutPosition:", horizontal, vertical);

  }
}

- (BOOL)isAddedToDrag
{
  return *((_BYTE *)self + 556) & 1;
}

- (UIView)folderIconBackgroundView
{
  void *v2;
  void *v3;

  -[SBIconView _folderIconImageView](self, "_folderIconImageView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "backgroundView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIView *)v3;
}

- (void)setDelegate:(id)a3
{
  id WeakRetained;
  void *v5;
  void *v6;
  SBCloseBoxView *closeBox;
  void *v8;
  char v9;
  SBCloseBoxView *v10;
  void *v11;
  void *v12;
  char v13;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    -[SBIconView reuseDelegate](self, "reuseDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      closeBox = self->_closeBox;
      if (closeBox)
      {
        -[SBHomeScreenButton backgroundView](closeBox, "backgroundView");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v6, "iconView:shouldContinueToUseBackgroundViewForComponents:", self, v8);

        if ((v9 & 1) == 0)
        {
          -[SBCloseBoxView removeFromSuperview](self->_closeBox, "removeFromSuperview");
          v10 = self->_closeBox;
          self->_closeBox = 0;

          -[SBIconView _createCloseBoxIfNecessary](self, "_createCloseBoxIfNecessary");
        }
      }
      -[SBIconView _folderIconImageView](self, "_folderIconImageView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v11, "hasCustomBackgroundView"))
      {
        objc_msgSend(v11, "backgroundView");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v6, "iconView:shouldContinueToUseBackgroundViewForComponents:", self, v12);

        if ((v13 & 1) == 0)
        {
          -[SBIconView _destroyIconImageView](self, "_destroyIconImageView");
          -[SBIconView _updateIconImageViewAnimated:](self, "_updateIconImageViewAnimated:", 0);
        }
      }

    }
    -[SBIconView addGesturesAndInteractionsIfNecessary](self, "addGesturesAndInteractionsIfNecessary");

    v5 = obj;
  }

}

- (id)reuseDelegate
{
  id v3;
  void *v4;

  -[SBIconView delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "reuseDelegateForIconView:", self);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (id)_folderIconImageView
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  -[SBIconView _iconImageView](self, "_iconImageView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v2;
  else
    v4 = 0;
  v5 = v4;

  return v5;
}

- (id)_iconImageView
{
  return self->_iconImageView;
}

- (void)setConfigurationOptions:(unint64_t)a3
{
  UIContextMenuInteraction *contextMenuInteraction;

  -[SBIconView setUserInteractionEnabled:](self, "setUserInteractionEnabled:", (a3 & 4) == 0);
  -[SBIconView setAllowsLabelArea:](self, "setAllowsLabelArea:", (a3 & 2) == 0);
  -[SBIconView setAllowsAccessoryView:](self, "setAllowsAccessoryView:", (a3 & 0x20) == 0);
  -[SBIconView setAllowsPassthroughHitTesting:](self, "setAllowsPassthroughHitTesting:", (a3 >> 3) & 1);
  *((_BYTE *)self + 557) = *((_BYTE *)self + 557) & 0xDF | (2 * a3) & 0x20;
  if (((2 * (_BYTE)a3) & 0x20) != 0)
  {
    if (self->_contextMenuInteraction)
    {
      -[SBIconView removeInteraction:](self, "removeInteraction:");
      contextMenuInteraction = self->_contextMenuInteraction;
      self->_contextMenuInteraction = 0;

    }
  }
  else
  {
    -[SBIconView addGesturesAndInteractionsIfNecessary](self, "addGesturesAndInteractionsIfNecessary");
  }
  -[SBIconView setDisallowCursorInteraction:](self, "setDisallowCursorInteraction:", (a3 >> 6) & 1);
  -[SBIconView setAllowsIconImageView:](self, "setAllowsIconImageView:", (a3 & 0x80) == 0);
}

- (void)setUserInteractionEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)SBIconView;
  -[SBIconView setUserInteractionEnabled:](&v6, sel_setUserInteractionEnabled_);
  -[SBIconView addGesturesAndInteractionsIfNecessary](self, "addGesturesAndInteractionsIfNecessary");
  -[SBIconView customIconImageViewController](self, "customIconImageViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "setUserInteractionEnabled:", v3);

}

- (void)setAllowsAccessoryView:(BOOL)a3
{
  char v3;
  char v4;

  v3 = *((_BYTE *)self + 556);
  if (((((v3 & 0x20) == 0) ^ a3) & 1) == 0)
  {
    if (a3)
      v4 = 32;
    else
      v4 = 0;
    *((_BYTE *)self + 556) = v3 & 0xDF | v4;
    -[SBIconView _updateAccessoryViewAnimated:](self, "_updateAccessoryViewAnimated:", 0);
  }
}

- (void)setAllowsPassthroughHitTesting:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *((_BYTE *)self + 557) = *((_BYTE *)self + 557) & 0xFD | v3;
}

- (void)setAllowsLabelArea:(BOOL)a3
{
  char v3;
  _BOOL8 v4;

  v3 = *((_BYTE *)self + 557);
  if (((((v3 & 1) == 0) ^ a3) & 1) == 0)
  {
    v4 = a3;
    *((_BYTE *)self + 557) = v3 & 0xFE | a3;
    -[SBIconView iconImageSize](self, "iconImageSize");
    -[SBIconView setBoundsSizeFromIconImageSize:](self, "setBoundsSizeFromIconImageSize:");
    -[SBIconView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
    -[SBIconView configureForLabelAllowed:](self, "configureForLabelAllowed:", v4);
  }
}

- (void)removeObserver:(id)a3
{
  if (a3)
    -[NSHashTable removeObject:](self->_observers, "removeObject:");
}

- (void)setDebugIconIndex:(unint64_t)a3
{
  UILabel *iconIndexLabel;
  id v4;

  if (self->_debugIconIndex != a3)
  {
    self->_debugIconIndex = a3;
    iconIndexLabel = self->_iconIndexLabel;
    if (iconIndexLabel)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu"), a3);
      v4 = (id)objc_claimAutoreleasedReturnValue();
      -[UILabel setText:](iconIndexLabel, "setText:", v4);

    }
  }
}

- (void)setCursorHitTestPadding:(UIEdgeInsets)a3
{
  self->_cursorHitTestPadding = a3;
}

- (void)setIconContentScale:(double)a3
{
  if ((BSFloatEqualToFloat() & 1) == 0)
  {
    self->_iconContentScale = a3;
    -[SBIconView _updateIconContentScale](self, "_updateIconContentScale");
  }
}

- (void)removeAllIconAnimations
{
  *((_BYTE *)self + 554) &= ~2u;
  -[SBIconView _removeAllAnimations:](self, "_removeAllAnimations:", 0);
  -[SBIconView _removeAllRetargetableAnimations:](self, "_removeAllRetargetableAnimations:", 1);
}

+ (BOOL)isIconTapGestureRecognizer:(id)a3
{
  id v3;
  void *v4;
  char isKindOfClass;

  v3 = a3;
  objc_opt_self();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BOOL)_dragInteraction:(id)a3 competingGestureRecognizerShouldDelayLift:(id)a4
{
  id v5;
  id v6;
  id v7;
  BOOL v8;
  id v9;

  v5 = a4;
  -[SBCloseBoxView actionTapGestureRecognizer](self->_closeBox, "actionTapGestureRecognizer");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (v6 == v5)
  {
    v8 = 1;
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[SBIconAccessoryView actionTapGestureRecognizer](self->_accessoryView, "actionTapGestureRecognizer");
      v7 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = 0;
    }
    if (v7 == v5)
    {
      v8 = 1;
    }
    else
    {
      -[SBHIconResizeHandle resizingGestureRecognizer](self->_resizeHandle, "resizingGestureRecognizer");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      v8 = v9 == v5;

    }
  }

  return v8;
}

- (void)setFolderIconFrozen:(BOOL)a3
{
  _BOOL4 v3;
  char v5;
  char v6;
  void *v7;
  SBIconViewSnapshotProviding *v8;
  SBIconViewSnapshotProviding *snapshotProvider;
  void *v10;
  id v11;
  UIView *v12;
  UIView *snapshotContainerView;
  UIView *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  void *v35;
  id v36;

  v3 = a3;
  if (-[SBIconView _isFolderIconFreezingSupported](self, "_isFolderIconFreezingSupported"))
  {
    v5 = *((_BYTE *)self + 556);
    if (((((v5 & 8) == 0) ^ v3) & 1) == 0)
    {
      if (v3)
        v6 = 8;
      else
        v6 = 0;
      *((_BYTE *)self + 556) = v5 & 0xF7 | v6;
      if (v3)
      {
        -[SBIconView reuseDelegate](self, "reuseDelegate");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v7, "screenSnapshotProviderForComponentsOfIconView:", self);
          v8 = (SBIconViewSnapshotProviding *)objc_claimAutoreleasedReturnValue();
          snapshotProvider = self->_snapshotProvider;
          self->_snapshotProvider = v8;

          if (self->_snapshotProvider)
          {
            -[SBIconView _folderIconImageView](self, "_folderIconImageView");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            v11 = objc_alloc(MEMORY[0x1E0DC3F10]);
            objc_msgSend(v10, "frame");
            v12 = (UIView *)objc_msgSend(v11, "initWithFrame:");
            snapshotContainerView = self->_snapshotContainerView;
            self->_snapshotContainerView = v12;

            -[UIView setClipsToBounds:](self->_snapshotContainerView, "setClipsToBounds:", 1);
            v14 = self->_snapshotContainerView;
            -[SBIconView iconImageCornerRadius](self, "iconImageCornerRadius");
            -[UIView _setContinuousCornerRadius:](v14, "_setContinuousCornerRadius:");
            -[SBIconView addSubview:](self, "addSubview:", self->_snapshotContainerView);
            -[SBIconViewSnapshotProviding snapshotView](self->_snapshotProvider, "snapshotView");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            -[UIView addSubview:](self->_snapshotContainerView, "addSubview:", v15);
            objc_msgSend(v15, "frame");
            v17 = v16;
            v19 = v18;
            v21 = v20;
            v23 = v22;
            objc_msgSend(v10, "superview");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            -[SBIconView window](self, "window");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "convertRect:fromWindow:", 0, v17, v19, v21, v23);
            objc_msgSend(v24, "convertRect:fromView:", 0);
            v27 = v26;
            v29 = v28;
            v31 = v30;
            v33 = v32;

            objc_msgSend(v15, "setFrame:", v27, v29, v31, v33);
          }
        }
      }
      else
      {
        -[SBIconViewSnapshotProviding snapshotView](self->_snapshotProvider, "snapshotView");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "removeFromSuperview");

        -[SBIconViewSnapshotProviding invalidate](self->_snapshotProvider, "invalidate");
        v7 = self->_snapshotProvider;
        self->_snapshotProvider = 0;
      }

      -[SBIconView _folderIconImageView](self, "_folderIconImageView");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "setPageGridHidden:", (*((unsigned __int8 *)self + 556) >> 3) & 1);

      -[SBIconView folderIconBackgroundView](self, "folderIconBackgroundView");
      v36 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "setHidden:", (*((unsigned __int8 *)self + 556) >> 3) & 1);

    }
  }
}

- (BOOL)_isFolderIconFreezingSupported
{
  void *v2;
  char isKindOfClass;

  -[SBIconView folderIconBackgroundView](self, "folderIconBackgroundView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (NSString)description
{
  void *v3;
  objc_super v5;

  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) != 0)
  {
    -[SBIconView descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", CFSTR("\t"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)SBIconView;
    -[SBIconView description](&v5, sel_description);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSString *)v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[SBIconView descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  const __CFString *v12;
  id v13;
  const __CFString *v14;
  id v15;
  double v16;
  double v17;
  id v18;
  double v19;
  double v20;
  id v21;
  double v22;
  double v23;
  id v24;
  double v25;
  double v26;
  id v27;
  double v28;
  double v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  void *v47;
  id v48;
  id v49;
  void *v50;
  void *v51;
  id v52;
  void *v53;
  id v54;
  id v55;
  id v56;
  void *v57;
  id v58;
  void *v59;
  id v60;
  void *v61;
  id v62;
  void *v63;
  id v64;
  void *v65;
  id v66;

  -[SBIconView icon](self, "icon", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconView location](self, "location");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconView frame](self, "frame");
  v7 = (id)objc_msgSend(v6, "appendRect:withName:", CFSTR("frame"));
  v8 = (id)objc_msgSend(v6, "appendObject:withName:", v4, CFSTR("icon"));
  v9 = (id)objc_msgSend(v6, "appendObject:withName:", v5, CFSTR("location"));
  -[SBIconView folder](self, "folder");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id)objc_msgSend(v6, "appendObject:withName:skipIfNil:", v10, CFSTR("folder"), 1);

  switch(-[SBIconView currentAccessoryType](self, "currentAccessoryType"))
  {
    case 0:
      goto LABEL_7;
    case 1:
      v12 = CFSTR("badge");
      goto LABEL_6;
    case 2:
      v12 = CFSTR("continuity");
      goto LABEL_6;
    case 3:
      v12 = CFSTR("add");
      goto LABEL_6;
    default:
      v12 = 0;
LABEL_6:
      v13 = (id)objc_msgSend(v6, "appendObject:withName:", v12, CFSTR("accessoryType"));
LABEL_7:
      switch(-[SBIconView currentLabelAccessoryType](self, "currentLabelAccessoryType"))
      {
        case 0:
          goto LABEL_14;
        case 1:
          v14 = CFSTR("recently updated");
          goto LABEL_13;
        case 2:
          v14 = CFSTR("beta");
          goto LABEL_13;
        case 3:
          v14 = CFSTR("cloud");
          goto LABEL_13;
        case 4:
          v14 = CFSTR("screen time expiration");
          goto LABEL_13;
        default:
          v14 = 0;
LABEL_13:
          v15 = (id)objc_msgSend(v6, "appendObject:withName:", v14, CFSTR("labelAccessoryType"));
LABEL_14:
          -[SBIconView iconContentScale](self, "iconContentScale");
          v17 = v16;
          if ((BSFloatIsOne() & 1) == 0)
            v18 = (id)objc_msgSend(v6, "appendFloat:withName:", CFSTR("iconContentScale"), v17);
          -[SBIconView alpha](self, "alpha");
          v20 = v19;
          if ((BSFloatIsOne() & 1) == 0)
            v21 = (id)objc_msgSend(v6, "appendFloat:withName:", CFSTR("alpha"), v20);
          -[SBIconView iconImageAlpha](self, "iconImageAlpha");
          v23 = v22;
          if ((BSFloatIsOne() & 1) == 0)
            v24 = (id)objc_msgSend(v6, "appendFloat:withName:", CFSTR("iconImageAlpha"), v23);
          -[SBIconView iconAccessoryAlpha](self, "iconAccessoryAlpha");
          v26 = v25;
          if ((BSFloatIsOne() & 1) == 0)
            v27 = (id)objc_msgSend(v6, "appendFloat:withName:", CFSTR("iconAccessoryAlpha"), v26);
          -[SBIconView iconLabelAlpha](self, "iconLabelAlpha");
          v29 = v28;
          if ((BSFloatIsOne() & 1) == 0)
            v30 = (id)objc_msgSend(v6, "appendFloat:withName:", CFSTR("iconLabelAlpha"), v29);
          v31 = (id)objc_msgSend(v6, "appendBool:withName:ifEqualTo:", -[SBIconView isHidden](self, "isHidden"), CFSTR("isHidden"), 1);
          v32 = (id)objc_msgSend(v6, "appendBool:withName:ifEqualTo:", -[SBIconView allowsLabelArea](self, "allowsLabelArea"), CFSTR("allowsLabelArea"), 0);
          v33 = (id)objc_msgSend(v6, "appendBool:withName:ifEqualTo:", -[SBIconView isLabelHidden](self, "isLabelHidden"), CFSTR("isLabelHidden"), 1);
          v34 = (id)objc_msgSend(v6, "appendBool:withName:ifEqualTo:", -[SBIconView isLabelAccessoryHidden](self, "isLabelAccessoryHidden"), CFSTR("isLabelAccessoryHidden"), 1);
          v35 = (id)objc_msgSend(v6, "appendBool:withName:ifEqualTo:", -[SBIconView allIconElementsButLabelHidden](self, "allIconElementsButLabelHidden"), CFSTR("allIconElementsButLabelHidden"), 1);
          v36 = (id)objc_msgSend(v6, "appendBool:withName:ifEqualTo:", -[SBIconView isEditing](self, "isEditing"), CFSTR("isEditing"), 1);
          v37 = (id)objc_msgSend(v6, "appendBool:withName:ifEqualTo:", -[SBIconView isHighlighted](self, "isHighlighted"), CFSTR("isHighlighted"), 1);
          v38 = (id)objc_msgSend(v6, "appendBool:withName:ifEqualTo:", -[SBIconView isGrabbed](self, "isGrabbed"), CFSTR("isGrabbed"), 1);
          v39 = (id)objc_msgSend(v6, "appendBool:withName:ifEqualTo:", -[SBIconView isOverlapping](self, "isOverlapping"), CFSTR("isOverlapping"), 1);
          v40 = (id)objc_msgSend(v6, "appendBool:withName:ifEqualTo:", -[SBIconView isTouchDownInIcon](self, "isTouchDownInIcon"), CFSTR("isTouchDownInIcon"), 1);
          v41 = (id)objc_msgSend(v6, "appendBool:withName:ifEqualTo:", -[SBIconView isDragging](self, "isDragging"), CFSTR("isDragging"), 1);
          v42 = (id)objc_msgSend(v6, "appendBool:withName:ifEqualTo:", -[SBIconView isDropping](self, "isDropping"), CFSTR("isDropping"), 1);
          v43 = (id)objc_msgSend(v6, "appendBool:withName:ifEqualTo:", -[SBIconView isTimedOut](self, "isTimedOut"), CFSTR("isTimedOut"), 1);
          v44 = (id)objc_msgSend(v6, "appendBool:withName:ifEqualTo:", (*((unsigned __int8 *)self + 553) >> 6) & 1, CFSTR("launchDisabled"), 1);
          v45 = (id)objc_msgSend(v6, "appendBool:withName:ifEqualTo:", *((unsigned __int8 *)self + 553) >> 7, CFSTR("suppressDisabledPresentation"), 1);
          v46 = (id)objc_msgSend(v6, "appendBool:withName:ifEqualTo:", *((_BYTE *)self + 554) & 1, CFSTR("iconWasTappedWhenDisabled"), 1);
          -[SBIconView continuityInfo](self, "continuityInfo");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          v48 = (id)objc_msgSend(v6, "appendObject:withName:skipIfNil:", v47, CFSTR("continuityInfo"), 1);

          v49 = (id)objc_msgSend(v6, "appendBool:withName:ifEqualTo:", -[SBIconView isUserInteractionEnabled](self, "isUserInteractionEnabled"), CFSTR("isUserInteractionEnabled"), 0);
          -[SBIconView pauseReasonsDescriptions](self, "pauseReasonsDescriptions");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v50, "componentsJoinedByString:", CFSTR(","));
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "appendString:withName:skipIfEmpty:", v51, CFSTR("pauseReasons"), 1);

          v52 = (id)objc_msgSend(v6, "appendBool:withName:ifEqualTo:", -[SBIconView isIconImageViewBorrowed](self, "isIconImageViewBorrowed"), CFSTR("isIconImageViewBorrowed"), 1);
          -[SBIconView overrideCustomIconImageViewController](self, "overrideCustomIconImageViewController");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          v54 = (id)objc_msgSend(v6, "appendObject:withName:skipIfNil:", v53, CFSTR("overrideCustomIconImageViewController"), 1);

          v55 = (id)objc_msgSend(v6, "appendBool:withName:ifEqualTo:", -[SBIconView allowsIconImageView](self, "allowsIconImageView"), CFSTR("allowsIconImageView"), 0);
          v56 = (id)objc_msgSend(v6, "appendBool:withName:ifEqualTo:", -[SBIconView isResizing](self, "isResizing"), CFSTR("isResizing"), 1);
          -[SBIconView overrideBadgeNumberOrString](self, "overrideBadgeNumberOrString");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          v58 = (id)objc_msgSend(v6, "appendObject:withName:skipIfNil:", v57, CFSTR("overrideBadgeNumberOrString"), 1);

          -[SBIconView overrideIconImageAppearance](self, "overrideIconImageAppearance");
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          v60 = (id)objc_msgSend(v6, "appendObject:withName:skipIfNil:", v59, CFSTR("overrideIconImageAppearance"), 1);

          -[SBIconView overrideIconImageStyleConfiguration](self, "overrideIconImageStyleConfiguration");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          v62 = (id)objc_msgSend(v6, "appendObject:withName:skipIfNil:", v61, CFSTR("overrideIconImageStyleConfiguration"), 1);

          -[SBIconView overrideImageTintColor](self, "overrideImageTintColor");
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          v64 = (id)objc_msgSend(v6, "appendObject:withName:skipIfNil:", v63, CFSTR("overrideImageTintColor"), 1);

          -[SBIconView overrideImage](self, "overrideImage");
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          v66 = (id)objc_msgSend(v6, "appendObject:withName:skipIfNil:", v65, CFSTR("overrideImage"), 1);

          return v6;
      }
  }
}

- (BOOL)isHighlighted
{
  return (*((unsigned __int8 *)self + 553) >> 5) & 1;
}

- (id)pauseReasonsDescriptions
{
  id v3;
  unint64_t v4;
  uint64_t v5;
  const __CFString *v6;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v4 = ((unint64_t)*((unsigned __int16 *)self + 276) >> 4) & 0x1F;
  if ((_DWORD)v4)
  {
    v5 = 1;
    do
    {
      if ((v4 & v5) != 0)
      {
        v6 = CFSTR("windowless");
        switch(v5)
        {
          case 1:
            goto LABEL_12;
          case 2:
            v6 = CFSTR("iconless");
            goto LABEL_12;
          case 3:
          case 5:
          case 6:
          case 7:
            break;
          case 4:
            v6 = CFSTR("occluded");
            goto LABEL_12;
          case 8:
            v6 = CFSTR("scrolling");
            goto LABEL_12;
          default:
            if (v5 == 16)
            {
              v6 = CFSTR("content visibility");
            }
            else
            {
              if (v5 != 0x40000000)
                break;
              v6 = CFSTR("other");
            }
LABEL_12:
            objc_msgSend(v3, "addObject:", v6);
            break;
        }
      }
      v4 &= ~v5;
      v5 *= 2;
    }
    while (v4);
  }
  return v3;
}

- (BOOL)isTouchDownInIcon
{
  return *((_BYTE *)self + 555) & 1;
}

- (BOOL)isLabelHidden
{
  return (*((unsigned __int8 *)self + 555) >> 1) & 1;
}

- (BOOL)isLabelAccessoryHidden
{
  return (*((unsigned __int8 *)self + 555) >> 2) & 1;
}

- (double)iconLabelAlpha
{
  return self->_iconLabelAlpha;
}

- (double)iconImageAlpha
{
  return self->_iconImageAlpha;
}

- (double)iconAccessoryAlpha
{
  return self->_iconAccessoryAlpha;
}

- (id)folder
{
  void *v2;
  void *v3;

  -[SBIconView folderIcon](self, "folderIcon");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "folder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (SBFolderIcon)folderIcon
{
  void *v2;
  void *v3;
  SBFolderIcon *v4;

  -[SBIconView icon](self, "icon");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isFolderIcon"))
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

- (id)labelImageWithParameters:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[SBIconView reuseDelegate](self, "reuseDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "iconView:labelImageWithParameters:", self, v4);
  else
    +[SBIconLabelImage imageWithParameters:](SBIconLabelImage, "imageWithParameters:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)didMoveToWindow
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  objc_super v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v15.receiver = self;
  v15.super_class = (Class)SBIconView;
  -[SBIconView didMoveToWindow](&v15, sel_didMoveToWindow);
  -[SBIconView window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if ((*((_BYTE *)self + 555) & 1) != 0 && !v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBIconView touchesCancelled:withEvent:](self, "touchesCancelled:withEvent:", v4, 0);

    -[SBIconView setPaused:forReason:](self, "setPaused:forReason:", 1, 1);
    goto LABEL_7;
  }
  -[SBIconView setPaused:forReason:](self, "setPaused:forReason:", v3 == 0, 1);
  if (!v3)
  {
LABEL_7:
    -[SBIconView dismissContextMenuWithCompletion:](self, "dismissContextMenuWithCompletion:", 0);
    -[SBIconView dismissConfigurationCardImmediately](self, "dismissConfigurationCardImmediately");
    -[SBIconView dismissStackConfigurationCardImmediately](self, "dismissStackConfigurationCardImmediately");
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v5 = (void *)-[NSHashTable copy](self->_observers, "copy", 0);
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v12;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v12 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v9);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v10, "iconViewDidBecomeWindowless:", self);
          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
      }
      while (v7);
    }
    goto LABEL_16;
  }
  if (!-[SBIconView usesSceneUserInterfaceStyleForImage](self, "usesSceneUserInterfaceStyleForImage"))
    return;
  -[SBIconView _iconImageView](self, "_iconImageView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateImageAnimated:", 0);
LABEL_16:

}

- (void)dismissContextMenuWithCompletion:(id)a3
{
  NSMutableArray *performAfterContextMenuBlocks;
  void *v5;
  void *v6;
  BOOL v7;
  void *v8;
  void *v9;
  void (**v10)(_QWORD);

  v10 = (void (**)(_QWORD))a3;
  if (-[SBIconView isContextMenuInteractionActive](self, "isContextMenuInteractionActive"))
  {
    if (v10)
    {
      performAfterContextMenuBlocks = self->_performAfterContextMenuBlocks;
      v5 = (void *)objc_msgSend(v10, "copy");
      v6 = _Block_copy(v5);
      -[NSMutableArray addObject:](performAfterContextMenuBlocks, "addObject:", v6);

    }
    v7 = -[SBIconView isDragging](self, "isDragging");
    v8 = v10;
    if (!v7)
    {
      -[SBIconView contextMenuInteraction](self, "contextMenuInteraction");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "dismissMenu");

LABEL_8:
      v8 = v10;
    }
  }
  else
  {
    v8 = v10;
    if (v10)
    {
      v10[2](v10);
      goto LABEL_8;
    }
  }

}

- (BOOL)isCursorActive
{
  return -[NSCountedSet count](self->_activePointerRegions, "count") != 0;
}

- (BOOL)isShowingConfigurationCard
{
  void *v2;
  BOOL v3;

  -[SBIconView currentConfigurationInteraction](self, "currentConfigurationInteraction");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (void)dismissConfigurationCardImmediately
{
  id v2;

  -[SBIconView currentConfigurationInteraction](self, "currentConfigurationInteraction");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "endConfigurationImmediately");

}

- (SBHIconViewConfigurationInteraction)currentConfigurationInteraction
{
  return self->_currentConfigurationInteraction;
}

- (void)dismissStackConfigurationCardImmediately
{
  id v2;

  -[SBIconView currentStackConfigurationInteraction](self, "currentStackConfigurationInteraction");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "endConfigurationImmediately");

}

- (SBHIconViewConfigurationInteraction)currentStackConfigurationInteraction
{
  return self->_currentStackConfigurationInteraction;
}

- (id)_makeIconImageView
{
  void *v3;
  id v4;
  void *v5;

  -[SBIconView reuseDelegate](self, "reuseDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "imageViewForIconView:", self);
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = objc_alloc_init(-[SBIconView expectedIconImageViewClass](self, "expectedIconImageViewClass"));
  }
  v5 = v4;
  -[SBIconView _configureIconImageView:](self, "_configureIconImageView:", v4);

  return v5;
}

- (void)tapGestureDidChange:(id)a3
{
  id v4;

  v4 = a3;
  if (objc_msgSend(v4, "state") == 3)
  {
    kdebug_trace();
    -[SBIconView _handleTapWithModifierFlags:](self, "_handleTapWithModifierFlags:", objc_msgSend(v4, "modifierFlags"));
  }

}

- (void)_handleTapWithModifierFlags:(int64_t)a3
{
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  int v9;
  NSObject *v10;
  void *v11;
  SBHIconLaunchContext *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t v23[128];
  uint8_t buf[4];
  SBIconView *v25;
  __int16 v26;
  int64_t v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  -[SBIconView actionDelegate](self, "actionDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconView window](self, "window");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  SBLogIcon();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    v25 = self;
    v26 = 2048;
    v27 = a3;
    v28 = 2048;
    v29 = v5;
    v30 = 2048;
    v31 = v6;
    _os_log_impl(&dword_1CFEF3000, v7, OS_LOG_TYPE_DEFAULT, "Handle tap: %@, modifiers: %lx, delegate: %p, window: %p", buf, 0x2Au);
  }

  if (v6)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v5, "iconTapped:modifierFlags:", self, a3);
    }
    else if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v5, "iconTapped:", self);
    }
    else
    {
      -[SBIconView icon](self, "icon");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "isLaunchEnabled");
      SBLogIcon();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v25) = v9;
        _os_log_impl(&dword_1CFEF3000, v10, OS_LOG_TYPE_DEFAULT, "delegate does not want to handle tap, going to icon. launch enabled: %{BOOL}u", buf, 8u);
      }

      -[SBIconView location](self, "location");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_alloc_init(SBHIconLaunchContext);
      -[SBHIconLaunchContext setIconView:](v12, "setIconView:", self);
      objc_msgSend(v8, "launchFromLocation:context:", v11, v12);

    }
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v13 = (void *)-[NSHashTable copy](self->_observers, "copy", 0);
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v20;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v20 != v16)
            objc_enumerationMutation(v13);
          v18 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v17);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v18, "iconViewDidHandleTap:", self);
          ++v17;
        }
        while (v15 != v17);
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v15);
    }

  }
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  id v6;
  objc_super v7;

  v6 = a3;
  v7.receiver = self;
  v7.super_class = (Class)SBIconView;
  -[SBIconView touchesCancelled:withEvent:](&v7, sel_touchesCancelled_withEvent_, v6, a4);
  if ((_touchesContainNonIndirectTouch(v6) & 1) != 0 || !objc_msgSend(v6, "count"))
  {
    *((_BYTE *)self + 555) &= ~1u;
    -[SBIconView _delegateTouchEnded:](self, "_delegateTouchEnded:", 1);
    if (!-[SBIconView isDragging](self, "isDragging"))
      -[SBIconView setHighlighted:](self, "setHighlighted:", 0);
  }

}

- (void)setHighlighted:(BOOL)a3
{
  char v3;
  char v4;

  v3 = *((_BYTE *)self + 553);
  if (((((v3 & 0x20) == 0) ^ a3) & 1) == 0)
  {
    if (a3)
      v4 = 32;
    else
      v4 = 0;
    *((_BYTE *)self + 553) = v3 & 0xDF | v4;
    -[SBIconView _updateBrightness](self, "_updateBrightness");
  }
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  int v8;
  void *v9;
  NSObject *v10;
  UITapGestureRecognizer *tapGestureRecognizer;
  void *v12;
  objc_super v13;
  uint8_t buf[4];
  id v15;
  __int16 v16;
  UITapGestureRecognizer *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v13.receiver = self;
  v13.super_class = (Class)SBIconView;
  v7 = a3;
  -[SBIconView touchesBegan:withEvent:](&v13, sel_touchesBegan_withEvent_, v7, v6);
  v8 = _touchesContainNonIndirectTouch(v7);

  if (v8)
  {
    *((_BYTE *)self + 555) |= 1u;
    objc_msgSend(MEMORY[0x1E0C99D68], "date", v13.receiver, v13.super_class);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBIconView setLastTouchDownDate:](self, "setLastTouchDownDate:", v9);

    if ((*((_BYTE *)self + 553) & 0x40) != 0 && *((char *)self + 553) < 0)
      -[SBIconView iconInteractedWhenDisabled](self, "iconInteractedWhenDisabled");
    SBLogIcon();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      tapGestureRecognizer = self->_tapGestureRecognizer;
      *(_DWORD *)buf = 138543618;
      v15 = v6;
      v16 = 2114;
      v17 = tapGestureRecognizer;
      _os_log_impl(&dword_1CFEF3000, v10, OS_LOG_TYPE_DEFAULT, "SBIconView touches began with event: %{public}@, tap gesture: %{public}@", buf, 0x16u);
    }

    -[SBIconView actionDelegate](self, "actionDelegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v12, "iconTouchBegan:", self);
    }
    else if (-[SBIconView isEnabled](self, "isEnabled")
           && -[SBIconView _delegateTapAllowed](self, "_delegateTapAllowed"))
    {
      -[SBIconView setHighlighted:](self, "setHighlighted:", 1);
    }

  }
}

- (void)setLastTouchDownDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 912);
}

- (BOOL)_dragInteraction:(id)a3 canExcludeCompetingGestureRecognizer:(id)a4
{
  id v5;
  id v6;
  _BOOL4 v7;

  v5 = a4;
  -[SBIconView tapGestureRecognizer](self, "tapGestureRecognizer");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 == v5)
    v7 = !-[SBIconView shouldTapGestureRecognizeAlongsideDragInteractionGestures](self, "shouldTapGestureRecognizeAlongsideDragInteractionGestures");
  else
    LOBYTE(v7) = 1;

  return v7;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v5;
  id v6;
  BOOL v7;
  void *v8;
  NSObject *v9;
  objc_class *v10;
  void *v11;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[SBIconView tapGestureRecognizer](self, "tapGestureRecognizer");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 != v5)
    return 1;
  -[SBIconView behaviorDelegate](self, "behaviorDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0 && (objc_msgSend(v8, "iconShouldAllowTap:", self) & 1) == 0)
  {
    SBLogIcon();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = (objc_class *)objc_opt_class();
      NSStringFromClass(v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543362;
      v14 = v11;
      _os_log_impl(&dword_1CFEF3000, v9, OS_LOG_TYPE_DEFAULT, "Not allowing tap gesture to receive touch because the delegate (%{public}@) said so.", (uint8_t *)&v13, 0xCu);

    }
    v7 = 0;
  }
  else
  {
    v7 = 1;
  }

  return v7;
}

- (UITapGestureRecognizer)tapGestureRecognizer
{
  return self->_tapGestureRecognizer;
}

- (BOOL)shouldTapGestureRecognizeAlongsideDragInteractionGestures
{
  return 1;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  BOOL v8;
  void *v9;
  char v10;
  NSObject *v11;
  const char *v12;
  void *v13;
  objc_class *v14;
  void *v15;
  NSObject *v16;
  uint8_t buf[4];
  NSObject *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SBIconView tapGestureRecognizer](self, "tapGestureRecognizer");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    -[SBIconView behaviorDelegate](self, "behaviorDelegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0 && (objc_msgSend(v9, "iconShouldAllowTap:", self) & 1) == 0)
    {
      v13 = (void *)MEMORY[0x1E0CB3940];
      v14 = (objc_class *)objc_opt_class();
      NSStringFromClass(v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "stringWithFormat:", CFSTR("the delegate (%@) said so."), v15);
      v11 = objc_claimAutoreleasedReturnValue();

    }
    else
    {
      if (!self->_customIconImageViewController)
      {
LABEL_26:
        v8 = 1;
LABEL_31:

        goto LABEL_32;
      }
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v10 = -[SBIconViewCustomImageViewControlling isUserInteractionEnabled](self->_customIconImageViewController, "isUserInteractionEnabled") ^ 1;
      else
        v10 = 0;
      v8 = 1;
      if (-[SBIconView isEditing](self, "isEditing"))
        goto LABEL_31;
      if ((v10 & 1) != 0)
        goto LABEL_31;
      -[SBIconView effectiveIconImageAlpha](self, "effectiveIconImageAlpha");
      if ((BSFloatIsZero() & 1) != 0)
        goto LABEL_31;
      v11 = CFSTR("we're not editing, the custom view controller's user interaction is enabled, and the effective icon alpha isn't zero.");
    }
    SBLogIcon();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v19 = v11;
      _os_log_impl(&dword_1CFEF3000, v16, OS_LOG_TYPE_DEFAULT, "Not allowing tap gesture to begin because %{public}@", buf, 0xCu);
    }

    goto LABEL_30;
  }
  -[SBCloseBoxView actionTapGestureRecognizer](self->_closeBox, "actionTapGestureRecognizer");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 == v4)
  {
    -[SBIconView behaviorDelegate](self, "behaviorDelegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) == 0 || (objc_msgSend(v9, "iconShouldAllowCloseBoxTap:", self) & 1) != 0)
      goto LABEL_26;
    SBLogIcon();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v12 = "Not allowing close box tap gesture to begin because delegate said so.";
LABEL_29:
      _os_log_impl(&dword_1CFEF3000, v11, OS_LOG_TYPE_DEFAULT, v12, buf, 2u);
    }
LABEL_30:

    v8 = 0;
    goto LABEL_31;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[SBIconAccessoryView actionTapGestureRecognizer](self->_accessoryView, "actionTapGestureRecognizer");
    v7 = (id)objc_claimAutoreleasedReturnValue();

    if (v7 == v4)
    {
      -[SBIconView behaviorDelegate](self, "behaviorDelegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) == 0 || (objc_msgSend(v9, "iconShouldAllowAccessoryTap:", self) & 1) != 0)
        goto LABEL_26;
      SBLogIcon();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v12 = "Not allowing accessory view (badge) tap gesture to begin because delegate said so.";
        goto LABEL_29;
      }
      goto LABEL_30;
    }
  }
  v8 = 1;
LABEL_32:

  return v8;
}

- (void)_delegateTouchEnded:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  -[SBIconView actionDelegate](self, "actionDelegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "icon:touchEnded:", self, v3);

}

- (id)actionDelegate
{
  void *v3;
  void *v4;
  id v5;
  id v6;

  -[SBIconView overrideActionDelegate](self, "overrideActionDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[SBIconView delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v5 = v6;
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v6, "actionDelegateForIconView:", self);
      v5 = (id)objc_claimAutoreleasedReturnValue();

    }
  }

  return v5;
}

- (SBIconViewActionDelegate)overrideActionDelegate
{
  return (SBIconViewActionDelegate *)objc_loadWeakRetained((id *)&self->_overrideActionDelegate);
}

- (BOOL)isPaused
{
  return (*((_WORD *)self + 276) & 0x1F0) != 0;
}

- (void)_configureIconImageView:(id)a3
{
  void *v4;
  void *v5;
  char isKindOfClass;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;

  v15 = a3;
  objc_msgSend(v15, "setShowsSquareCorners:", (*((unsigned __int8 *)self + 557) >> 4) & 1);
  objc_msgSend(v15, "setJittering:", (*((unsigned __int8 *)self + 554) >> 1) & 1);
  objc_msgSend(v15, "setIconView:", self);
  -[SBIconView iconImageCache](self, "iconImageCache");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setIconImageCache:", v4);

  objc_opt_self();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  isKindOfClass = objc_opt_isKindOfClass();

  v7 = v15;
  if ((isKindOfClass & 1) != 0)
  {
    v8 = v15;
    -[SBIconView reuseDelegate](self, "reuseDelegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "hasCustomBackgroundView")
      && (objc_opt_respondsToSelector() & 1) != 0
      && (objc_msgSend(v8, "backgroundView"),
          v10 = (void *)objc_claimAutoreleasedReturnValue(),
          v11 = objc_msgSend(v9, "iconView:shouldContinueToUseBackgroundViewForComponents:", self, v10),
          v10,
          v11))
    {
      -[SBIconView _updateConfigurationForIconImageView:](self, "_updateConfigurationForIconImageView:", v8);
    }
    else
    {
      -[SBIconView behaviorDelegate](self, "behaviorDelegate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v13 = objc_msgSend(v12, "iconViewComponentBackgroundViewTypeForIconView:", self);
      else
        v13 = 2;
      v14 = -[SBIconView newComponentBackgroundViewOfType:](self, "newComponentBackgroundViewOfType:", v13);
      -[SBIconView _configureViewAsFolderIconImageView:](self, "_configureViewAsFolderIconImageView:", v14);
      objc_msgSend(v8, "setBackgroundView:", v14);

    }
    v7 = v15;
  }

}

- (void)_updateBrightness
{
  double v3;
  double v4;

  -[SBIconView effectiveBrightness](self, "effectiveBrightness");
  v4 = v3;
  -[SBIconImageView setBrightness:](self->_iconImageView, "setBrightness:");
  -[SBIconAccessoryView setAccessoryBrightness:](self->_accessoryView, "setAccessoryBrightness:", v4);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[SBIconViewCustomImageViewControlling setBrightness:](self->_customIconImageViewController, "setBrightness:", v4);
}

- (double)effectiveBrightness
{
  double result;
  _BOOL4 v3;

  if ((*((_BYTE *)self + 553) & 0x40) == 0 || (result = 0.5, *((char *)self + 553) < 0))
  {
    if ((*((_BYTE *)self + 553) & 0x20) != 0)
    {
      return 0.6;
    }
    else
    {
      v3 = -[SBIconView isTimedOut](self, "isTimedOut");
      result = 1.0;
      if (v3)
        return 0.5;
    }
  }
  return result;
}

- (BOOL)isTimedOut
{
  void *v3;
  BOOL v4;

  -[SBIconView icon](self, "icon");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isTimedOut"))
    v4 = -[SBIconView allowsBlockedForScreenTimeExpiration](self, "allowsBlockedForScreenTimeExpiration");
  else
    v4 = 0;

  return v4;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (BOOL)_dragInteraction:(id)a3 shouldDelayCompetingGestureRecognizer:(id)a4
{
  return 1;
}

- (void)iconLaunchEnabledDidChange:(id)a3
{
  SBIcon *v4;
  SBIcon *icon;

  v4 = (SBIcon *)a3;
  BSDispatchQueueAssertMain();
  icon = self->_icon;

  if (icon == v4)
  {
    -[SBIconView _updateBrightness](self, "_updateBrightness");
    -[SBIconView _updateLaunchDisabled](self, "_updateLaunchDisabled");
  }
}

- (void)iconAccessoriesDidUpdate:(id)a3
{
  SBIcon *v4;
  SBIcon *icon;
  void *v6;
  _BOOL8 v7;

  v4 = (SBIcon *)a3;
  BSDispatchQueueAssertMain();
  icon = self->_icon;

  if (icon == v4)
  {
    -[SBIconView window](self, "window");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[SBIconView _updateLabelArea](self, "_updateLabelArea");
    if (v6)
      v7 = -[SBIcon shouldAnimateProgress](self->_icon, "shouldAnimateProgress");
    else
      v7 = 0;
    -[SBIconView _updateProgressAnimated:](self, "_updateProgressAnimated:", v7);
    -[SBIconView _updateIconImageAdornmentsAnimated:](self, "_updateIconImageAdornmentsAnimated:", v6 != 0);
  }
}

- (void)_updateProgressAnimated:(BOOL)a3
{
  _BOOL8 v3;
  SBIconImageView *iconImageView;
  int64_t v6;
  _BOOL8 v7;

  v3 = a3;
  iconImageView = self->_iconImageView;
  v6 = -[SBIconView progressState](self, "progressState");
  v7 = -[SBIcon isProgressPaused](self->_icon, "isProgressPaused");
  -[SBIcon progressPercent](self->_icon, "progressPercent");
  -[SBIconImageView setProgressState:paused:percent:animated:](iconImageView, "setProgressState:paused:percent:animated:", v6, v7, v3);
  -[SBIconImageView setProgressAlpha:](self->_iconImageView, "setProgressAlpha:", self->_iconAccessoryAlpha);
}

- (int64_t)progressState
{
  if (-[SBIconView allowsProgressState](self, "allowsProgressState"))
    return -[SBIcon progressState](self->_icon, "progressState");
  else
    return 0;
}

- (BOOL)allowsProgressState
{
  return (*((unsigned __int8 *)self + 556) >> 6) & 1;
}

uint64_t __55__SBIconView_matchingIconViewWithConfigurationOptions___block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;

  objc_msgSend(*(id *)(a1 + 32), "configureMatchingIconView:", *(_QWORD *)(a1 + 40));
  v2 = *(void **)(a1 + 40);
  v3 = *MEMORY[0x1E0C9D538];
  v4 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  objc_msgSend(v2, "frame");
  return objc_msgSend(v2, "setFrame:", v3, v4);
}

- (void)configureMatchingIconView:(id)a3
{
  void *v4;
  void *v5;
  BOOL v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  SBHIconViewNonPoolingImageCache *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  char v26;
  void *v27;
  void *v28;
  id v29;

  v29 = a3;
  -[SBIconView icon](self, "icon");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconImageView displayedImage](self->_iconImageView, "displayedImage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    v6 = v4 == 0;
  else
    v6 = 1;
  if (v6)
  {
    v12 = 0;
  }
  else
  {
    -[SBIconImageView displayedImageAppearance](self->_iconImageView, "displayedImageAppearance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBIconView iconImageInfo](self, "iconImageInfo");
    v12 = -[SBHIconImageCache initWithName:iconImageInfo:]([SBHIconViewNonPoolingImageCache alloc], "initWithName:iconImageInfo:", &stru_1E8D8E958, v8, v9, v10, v11);
    -[SBHIconImageCache cacheImage:forIcon:imageAppearance:](v12, "cacheImage:forIcon:imageAppearance:", v5, v4, v7);

  }
  -[SBIconView location](self, "location");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setLocation:", v13);

  -[SBIconView listLayoutProvider](self, "listLayoutProvider");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setListLayoutProvider:", v14);

  if (v12)
  {
    objc_msgSend(v29, "setIconImageCache:", v12);
  }
  else
  {
    -[SBIconView iconImageCache](self, "iconImageCache");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setIconImageCache:", v15);

  }
  -[SBIconView folderIconImageCache](self, "folderIconImageCache");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setFolderIconImageCache:", v16);

  objc_msgSend(v29, "setIconContentScalingEnabled:", (*((unsigned __int8 *)self + 555) >> 3) & 1);
  -[SBIconView iconContentScale](self, "iconContentScale");
  objc_msgSend(v29, "setIconContentScale:");
  objc_msgSend(v29, "setStartsDragMoreQuickly:", -[SBIconView startsDragMoreQuickly](self, "startsDragMoreQuickly"));
  objc_msgSend(v29, "setFolderBackgroundStyle:", -[SBIconView folderBackgroundStyle](self, "folderBackgroundStyle"));
  objc_msgSend(v29, "setAllowsEditingAnimation:", -[SBIconView allowsEditingAnimation](self, "allowsEditingAnimation"));
  objc_msgSend(v29, "setAllowsCloseBox:", -[SBIconView allowsCloseBox](self, "allowsCloseBox"));
  objc_msgSend(v29, "setAllowsAccessoryView:", -[SBIconView allowsAccessoryView](self, "allowsAccessoryView"));
  objc_msgSend(v29, "setAllowsResizeHandle:", -[SBIconView allowsResizeHandle](self, "allowsResizeHandle"));
  objc_msgSend(v29, "setAllowsAdornmentsOverIconImage:", -[SBIconView allowsAdornmentsOverIconImage](self, "allowsAdornmentsOverIconImage"));
  -[SBIconView continuityInfo](self, "continuityInfo");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setContinuityInfo:", v17);

  -[SBIconView legibilitySettings](self, "legibilitySettings");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setLegibilitySettings:", v18);

  if ((*((_BYTE *)self + 557) & 8) != 0)
  {
    -[SBIconView iconImageInfo](self, "iconImageInfo");
    objc_msgSend(v29, "setIconImageInfo:");
  }
  -[SBIconView traitCollection](self, "traitCollection");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "sbh_iconImageAppearance");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    objc_msgSend(v29, "traitOverrides");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_self();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setObject:forTrait:", v20, v22);

    objc_msgSend(v29, "setOverrideIconImageAppearance:", v20);
  }
  -[SBIconView delegate](self, "delegate");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setDelegate:", v23);

  objc_msgSend(v29, "setIcon:", v4);
  objc_msgSend(v29, "customIconImageViewController");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (v24)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[SBIconView customIconImageViewController](self, "customIconImageViewController");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_opt_respondsToSelector();

      if ((v26 & 1) != 0)
      {
        -[SBIconView customIconImageViewController](self, "customIconImageViewController");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "setImageViewAlignment:", objc_msgSend(v27, "imageViewAlignment"));

      }
    }
  }
  -[SBIconView iconImageCache](self, "iconImageCache");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setIconImageCache:", v28);

}

- (void)setStartsDragMoreQuickly:(BOOL)a3
{
  char v3;
  char v4;

  v3 = *((_BYTE *)self + 555);
  if (((((v3 & 0x40) == 0) ^ a3) & 1) == 0)
  {
    if (a3)
      v4 = 64;
    else
      v4 = 0;
    *((_BYTE *)self + 555) = v3 & 0xBF | v4;
    -[SBIconView _updateDragInteractionLiftDelay](self, "_updateDragInteractionLiftDelay");
  }
}

- (void)setIconContentScalingEnabled:(BOOL)a3
{
  char v3;
  char v5;

  v3 = *((_BYTE *)self + 555);
  if (((((v3 & 8) == 0) ^ a3) & 1) == 0)
  {
    if (a3)
      v5 = 8;
    else
      v5 = 0;
    *((_BYTE *)self + 555) = v3 & 0xF7 | v5;
    -[SBIconView _toggleContentContainerViewIfNecessary](self, "_toggleContentContainerViewIfNecessary");
    -[SBIconView _updateIconContentScale](self, "_updateIconContentScale");
  }
}

- (void)setAllowsEditingAnimation:(BOOL)a3
{
  char v3;
  char v4;

  v3 = *((_BYTE *)self + 554);
  if (((((v3 & 8) == 0) ^ a3) & 1) == 0)
  {
    if (a3)
      v4 = 8;
    else
      v4 = 0;
    *((_BYTE *)self + 554) = v3 & 0xF7 | v4;
    -[SBIconView _updateJitterAnimated:](self, "_updateJitterAnimated:", 0);
  }
}

- (double)iconContentScale
{
  return self->_iconContentScale;
}

- (SBFolderIconImageCache)folderIconImageCache
{
  return self->_folderIconImageCache;
}

- (void)setFolderBackgroundStyle:(unint64_t)a3
{
  id v4;

  -[SBIconView _folderIconImageView](self, "_folderIconImageView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundStyle:", a3);

}

- (unint64_t)folderBackgroundStyle
{
  void *v2;
  unint64_t v3;

  -[SBIconView _folderIconImageView](self, "_folderIconImageView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "backgroundStyle");

  return v3;
}

- (BOOL)allowsEditingAnimation
{
  return (*((unsigned __int8 *)self + 554) >> 3) & 1;
}

- (BOOL)allowsCloseBox
{
  return (*((unsigned __int8 *)self + 554) >> 5) & 1;
}

void __51__SBIconView__shouldAlwaysHaveContentContainerView__block_invoke()
{
  void *v0;
  id v1;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "bundleIdentifier");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  _shouldAlwaysHaveContentContainerView_shouldAlwaysHaveContentContainerView = objc_msgSend(v0, "isEqualToString:", CFSTR("com.apple.CarPlayApp")) ^ 1;

}

- (void)updateCustomIconImageViewController
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  BOOL v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;

  -[SBIconView overrideCustomIconImageViewController](self, "overrideCustomIconImageViewController");
  v3 = objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    if (-[SBIconView allowsCustomIconImageViewController](self, "allowsCustomIconImageViewController"))
    {
      -[SBIconView behaviorDelegate](self, "behaviorDelegate");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v4, "customImageViewControllerForIconView:", self);
        v5 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v5 = 0;
      }
      v10 = v5;

      v3 = v10;
    }
    else
    {
      v3 = 0;
    }
  }
  v11 = (void *)v3;
  -[SBIconView setCustomIconImageViewController:](self, "setCustomIconImageViewController:", v3);
  v6 = -[SBIconView isIconImageViewBorrowed](self, "isIconImageViewBorrowed");
  v7 = v11;
  if (!v6)
  {
    objc_msgSend(v11, "viewIfLoaded");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8 && (objc_msgSend(v8, "isDescendantOfView:", self) & 1) == 0)
      -[SBIconView _insertIconImageView:](self, "_insertIconImageView:", v9);

    v7 = v11;
  }

}

- (void)setCustomIconImageViewController:(id)a3
{
  id v3;
  SBIconViewCustomImageViewControlling *v5;
  SBIconViewCustomImageViewControlling *customIconImageViewController;
  SBIconViewCustomImageViewControlling *v7;
  BOOL v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  char v16;
  void *v17;
  SBIconView *v18;
  void *v19;
  char v20;
  double v21;
  void *v22;
  char v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  void *v30;
  void *v31;
  id v32;
  BOOL v33;
  void *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _QWORD v39[5];
  SBIconViewCustomImageViewControlling *v40;
  uint8_t v41[128];
  uint8_t buf[4];
  SBIconView *v43;
  __int16 v44;
  void *v45;
  uint64_t v46;

  v3 = a3;
  v46 = *MEMORY[0x1E0C80C00];
  v5 = (SBIconViewCustomImageViewControlling *)a3;
  customIconImageViewController = self->_customIconImageViewController;
  if (customIconImageViewController != v5)
  {
    v7 = customIconImageViewController;
    v8 = -[SBIconView isIconImageViewBorrowed](self, "isIconImageViewBorrowed");
    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[SBIconViewCustomImageViewControlling setHost:](v5, "setHost:", self);
    if (v5)
    {
      objc_getAssociatedObject(v5, &SBHIconViewCustomViewControllerParentIconViewKey);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "weakObjectValue");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      if (v10)
      {
        if ((objc_msgSend(v10, "isIconImageViewBorrowed") & 1) == 0)
        {
          SBLogIcon();
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            v43 = self;
            v44 = 2112;
            v45 = v11;
            _os_log_impl(&dword_1CFEF3000, v12, OS_LOG_TYPE_DEFAULT, "Icon view %@ is stealing icon image view controller from %@ without anyone borrowing it", buf, 0x16u);
          }

        }
        v31 = v9;
        v32 = v3;
        v33 = v8;
        objc_msgSend(v11, "borrowedIconImageViewAssertion");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "extraInfo");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectForKey:", CFSTR("options"));
        v15 = objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend((id)v15, "unsignedIntegerValue");

        objc_msgSend(v11, "location");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v15) = objc_msgSend(v17, "isEqualToString:", CFSTR("SBIconLocationAddWidgetSheet"));

        if ((v15 & 1) == 0 && (v16 & 1) == 0)
          objc_msgSend(v11, "setCustomIconImageViewController:", 0);

        v8 = v33;
        v9 = v31;
        v3 = v32;
      }

    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[SBIconViewCustomImageViewControlling removeCustomImageViewControllerObserver:](v7, "removeCustomImageViewControllerObserver:", self);
    if (!v8)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        -[SBIconViewCustomImageViewControlling setUserVisibilityStatus:](v7, "setUserVisibilityStatus:", 1);
      if ((objc_opt_respondsToSelector() & 1) != 0)
        -[SBIconViewCustomImageViewControlling setContentVisibility:](v7, "setContentVisibility:", 2);
    }
    if ((objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      -[SBIconViewCustomImageViewControlling host](v7, "host");
      v18 = (SBIconView *)objc_claimAutoreleasedReturnValue();

      if (v18 == self)
        -[SBIconViewCustomImageViewControlling setHost:](v7, "setHost:", 0);
    }
    if (v5 && self->_iconImageView)
      -[SBIconView _destroyIconImageView](self, "_destroyIconImageView");
    -[SBIconViewCustomImageViewControlling viewIfLoaded](self->_customIconImageViewController, "viewIfLoaded");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v19, "isDescendantOfView:", self))
      objc_msgSend(v19, "removeFromSuperview");
    if (v19)
      v20 = v8;
    else
      v20 = 1;
    if ((v20 & 1) == 0)
    {
      objc_msgSend(v19, "alpha");
      if (v21 < 1.0)
        objc_msgSend(v19, "setAlpha:", 1.0);
    }
    v34 = v19;
    objc_storeStrong((id *)&self->_customIconImageViewController, v3);
    if (v5)
    {
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithWeakObject:", self);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_setAssociatedObject(v5, &SBHIconViewCustomViewControllerParentIconViewKey, v22, (void *)1);

    }
    if (v7)
      objc_setAssociatedObject(v7, &SBHIconViewCustomViewControllerParentIconViewKey, 0, (void *)1);
    if (v5)
      v23 = v8;
    else
      v23 = 1;
    if ((v23 & 1) == 0)
    {
      v24 = (void *)MEMORY[0x1E0DC3F10];
      v39[0] = MEMORY[0x1E0C809B0];
      v39[1] = 3221225472;
      v39[2] = __47__SBIconView_setCustomIconImageViewController___block_invoke;
      v39[3] = &unk_1E8D84EF0;
      v39[4] = self;
      v40 = v5;
      objc_msgSend(v24, "performWithoutAnimation:", v39);

    }
    -[SBIconView _updateJitter:](self, "_updateJitter:", 1);
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v25 = (void *)-[NSHashTable copy](self->_observers, "copy");
    v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
    if (v26)
    {
      v27 = v26;
      v28 = *(_QWORD *)v36;
      do
      {
        for (i = 0; i != v27; ++i)
        {
          if (*(_QWORD *)v36 != v28)
            objc_enumerationMutation(v25);
          v30 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v30, "iconView:didChangeCustomImageViewController:", self, v7);
        }
        v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
      }
      while (v27);
    }

  }
}

- (void)prepareToCrossfadeImageWithView:(id)a3 options:(unint64_t)a4
{
  -[SBIconView prepareToCrossfadeImageWithView:anchorPoint:options:](self, "prepareToCrossfadeImageWithView:anchorPoint:options:", a3, a4, 0.5, 0.5);
}

+ (BOOL)supportsPreviewInteraction
{
  return 1;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  id WeakRetained;
  objc_super v6;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0DC45B8], 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0DC48E8], 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0DC44D0], 0);
  -[SBIconView setIcon:](self, "setIcon:", 0);
  -[SBIconView _invalidateHomeButtonPressConsumingAssertion](self, "_invalidateHomeButtonPressConsumingAssertion");
  -[PTSettings removeKeyObserver:](self->_iconEditingSettings, "removeKeyObserver:", self);
  +[SBHIconViewContextMenuStateController sharedInstance](SBHIconViewContextMenuStateController, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "unregisterIconView:", self);

  -[BSInvalidatable invalidate](self->_springBoardIconStyleObservation, "invalidate");
  WeakRetained = objc_loadWeakRetained((id *)&self->_appPrototectionSubjectMonitorSubscription);
  objc_msgSend(WeakRetained, "invalidate");

  v6.receiver = self;
  v6.super_class = (Class)SBIconView;
  -[SBIconView dealloc](&v6, sel_dealloc);
}

- (void)setHomeButtonPressConsumingAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_homeButtonPressConsumingAssertion, a3);
}

- (void)_invalidateHomeButtonPressConsumingAssertion
{
  void *v3;

  -[SBIconView homeButtonPressConsumingAssertion](self, "homeButtonPressConsumingAssertion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  -[SBIconView setHomeButtonPressConsumingAssertion:](self, "setHomeButtonPressConsumingAssertion:", 0);
}

- (BSInvalidatable)homeButtonPressConsumingAssertion
{
  return self->_homeButtonPressConsumingAssertion;
}

- (id)matchingIconViewWithConfigurationOptions:(unint64_t)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v13[5];
  id v14;

  v5 = objc_alloc((Class)objc_opt_class());
  -[SBIconView listLayoutProvider](self, "listLayoutProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithConfigurationOptions:listLayoutProvider:", a3, v6);

  v8 = (void *)MEMORY[0x1E0DC3F10];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __55__SBIconView_matchingIconViewWithConfigurationOptions___block_invoke;
  v13[3] = &unk_1E8D84EF0;
  v13[4] = self;
  v9 = v7;
  v14 = v9;
  objc_msgSend(v8, "performWithoutAnimation:", v13);
  v10 = v14;
  v11 = v9;

  return v11;
}

- (SBIconView)initWithConfigurationOptions:(unint64_t)a3 listLayoutProvider:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  int v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  SBIconView *v25;
  SBIconView *v26;
  double v27;
  double v28;
  uint64_t v34;
  _UILegibilitySettings *legibilitySettings;
  id v36;
  uint64_t v37;
  UIView *scalingContainer;
  void *v39;
  uint64_t v40;
  SBHIconEditingSettings *iconEditingSettings;
  uint64_t v42;
  SBHIconResizingSettings *iconResizingSettings;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  objc_super v49;

  v7 = a4;
  objc_msgSend((id)objc_opt_class(), "defaultIconLocation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(v7, "layoutForIconLocation:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "iconImageInfo");
    v13 = v12;
    v15 = v14;
    if (v9)
    {
      v16 = v10;
      v17 = v11;

      v18 = 0;
      goto LABEL_6;
    }
  }
  else
  {
    objc_msgSend(0, "iconImageInfo");
    v13 = v19;
    v15 = v20;
  }
  objc_msgSend((id)objc_opt_class(), "defaultIconImageSize");
  v16 = v21;
  v17 = v22;
  v18 = 1;
LABEL_6:
  objc_msgSend((id)objc_opt_class(), "defaultIconViewSizeForIconImageSize:configurationOptions:", a3, v16, v17);
  v49.receiver = self;
  v49.super_class = (Class)SBIconView;
  v25 = -[SBIconView initWithFrame:](&v49, sel_initWithFrame_, 0.0, 0.0, v23, v24);
  v26 = v25;
  if (v25)
  {
    objc_storeStrong((id *)&v25->_listLayoutProvider, a4);
    *((_BYTE *)v26 + 557) = *((_BYTE *)v26 + 557) & 0xDF | (2 * a3) & 0x20;
    *((_BYTE *)v26 + 557) = *((_BYTE *)v26 + 557) & 0xFE | ((a3 & 2) == 0);
    *((_BYTE *)v26 + 557) = *((_BYTE *)v26 + 557) & 0xFD | (a3 >> 2) & 2;
    objc_storeStrong((id *)&v26->_iconLocation, v8);
    v26->_iconLabelAlpha = 1.0;
    v26->_iconAccessoryAlpha = 1.0;
    v26->_iconImageAlpha = 1.0;
    v26->_iconImageInfo.size.width = v16;
    v26->_iconImageInfo.size.height = v17;
    if (v18)
    {
      objc_msgSend((id)objc_opt_class(), "defaultIconImageScale");
      v26->_iconImageInfo.scale = v27;
      objc_msgSend((id)objc_opt_class(), "defaultIconImageCornerRadius");
      v15 = v28;
    }
    else
    {
      v26->_iconImageInfo.scale = v13;
    }
    v26->_iconImageInfo.continuousCornerRadius = v15;
    *((_BYTE *)v26 + 558) = *((_BYTE *)v26 + 558) & 0xF9 | (2
                                                          * (objc_msgSend((id)objc_opt_class(), "defaultImageLoadingBehavior") & 3));
    *((_BYTE *)v26 + 556) = (*((_BYTE *)v26 + 556) & 0xDF | a3 & 0x20) ^ 0x20;
    v26->_approximateLayoutPosition.horizontal = 0;
    v26->_approximateLayoutPosition.vertical = 0;
    __asm { FMOV            V0.2D, #-5.0 }
    *(_OWORD *)&v26->_cursorHitTestPadding.top = _Q0;
    *(_OWORD *)&v26->_cursorHitTestPadding.bottom = _Q0;
    *((_BYTE *)v26 + 554) = (a3 & 0x80 | *((_BYTE *)v26 + 554) & 0x7F) ^ 0x80;
    objc_msgSend((id)objc_opt_class(), "defaultLegibilitySettings");
    v34 = objc_claimAutoreleasedReturnValue();
    legibilitySettings = v26->_legibilitySettings;
    v26->_legibilitySettings = (_UILegibilitySettings *)v34;

    v26->_displayedLabelAccessoryType = 0;
    v26->_enabled = 1;
    v26->_iconContentScale = 1.0;
    *((_BYTE *)v26 + 556) |= 0x40u;
    *((_BYTE *)v26 + 554) |= 8u;
    v26->_editingAnimationStrength = 1.0;
    *((_BYTE *)v26 + 554) |= 0x20u;
    *((_BYTE *)v26 + 555) |= 0x20u;
    *((_WORD *)v26 + 276) = *((_WORD *)v26 + 276) & 0xFE0F | 0x30;
    -[SBIconView setOpaque:](v26, "setOpaque:", 0);
    -[SBIconView setExclusiveTouch:](v26, "setExclusiveTouch:", 1);
    v26->_customIconImageViewControllerPriority = 0;
    if (objc_msgSend((id)objc_opt_class(), "_shouldAlwaysHaveContentContainerView"))
    {
      v36 = objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "contentContainerViewClass"));
      -[SBIconView bounds](v26, "bounds");
      v37 = objc_msgSend(v36, "initWithFrame:");
      scalingContainer = v26->_scalingContainer;
      v26->_scalingContainer = (UIView *)v37;

      -[SBIconView addSubview:](v26, "addSubview:", v26->_scalingContainer);
    }
    -[SBIconView configureForLabelAllowed:](v26, "configureForLabelAllowed:", (a3 & 2) == 0);
    if ((a3 & 4) != 0)
      -[SBIconView setUserInteractionEnabled:](v26, "setUserInteractionEnabled:", 0);
    else
      -[SBIconView addGesturesAndInteractionsIfNecessary](v26, "addGesturesAndInteractionsIfNecessary");
    -[SBIconView updateParallaxSettings](v26, "updateParallaxSettings");
    if (__sb__runningInSpringBoard())
    {
      +[SBHHomeScreenDomain rootSettings](SBHHomeScreenDomain, "rootSettings");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "iconEditingSettings");
      v40 = objc_claimAutoreleasedReturnValue();
      iconEditingSettings = v26->_iconEditingSettings;
      v26->_iconEditingSettings = (SBHIconEditingSettings *)v40;

      -[PTSettings addKeyObserver:](v26->_iconEditingSettings, "addKeyObserver:", v26);
      objc_msgSend(v39, "iconResizingSettings");
      v42 = objc_claimAutoreleasedReturnValue();
      iconResizingSettings = v26->_iconResizingSettings;
      v26->_iconResizingSettings = (SBHIconResizingSettings *)v42;

    }
    -[SBIconView _applyIconEditingSettings](v26, "_applyIconEditingSettings");
    if ((__sb__runningInSpringBoard() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CF96A8], "subjectMonitorRegistry");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "addMonitor:subjectMask:subscriptionOptions:", v26, 1, 1);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_storeWeak((id *)&v26->_appPrototectionSubjectMonitorSubscription, v45);

    }
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "addObserver:selector:name:object:", v26, sel__backgroundContrastDidChange_, *MEMORY[0x1E0DC45B8], 0);
    objc_msgSend(v46, "addObserver:selector:name:object:", v26, sel__contentSizeCategoryDidChange_, *MEMORY[0x1E0DC48E8], 0);
    objc_msgSend(v46, "addObserver:selector:name:object:", v26, sel__boldTextStatusDidChange_, *MEMORY[0x1E0DC44D0], 0);
    objc_msgSend(v46, "addObserver:selector:name:object:", v26, sel__refreshAccessoryViewNotification_, CFSTR("SBIconViewRefreshAccessoryViewNotification"), 0);
    +[SBHIconViewContextMenuStateController sharedInstance](SBHIconViewContextMenuStateController, "sharedInstance");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "registerIconView:", v26);

  }
  return v26;
}

+ (unint64_t)defaultImageLoadingBehavior
{
  return 0;
}

+ (CGSize)defaultIconImageSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 50.0;
  v3 = 50.0;
  result.height = v3;
  result.width = v2;
  return result;
}

+ (double)defaultIconImageCornerRadius
{
  return 20.0;
}

- (void)configureForLabelAllowed:(BOOL)a3
{
  _BOOL8 v4;

  v4 = !a3;
  -[SBIconView setLabelHidden:](self, "setLabelHidden:", v4);
  -[SBIconView setLabelAccessoryHidden:](self, "setLabelAccessoryHidden:", v4);
  -[SBIconView _updateFrameToIconViewSize](self, "_updateFrameToIconViewSize");
}

- (void)setLabelHidden:(BOOL)a3
{
  int v4;
  char v5;
  char v6;

  v4 = !-[SBIconView allowsLabelArea](self, "allowsLabelArea") || a3;
  v5 = *((_BYTE *)self + 555);
  if (((v4 ^ ((v5 & 2) == 0)) & 1) == 0)
  {
    if (v4)
      v6 = 2;
    else
      v6 = 0;
    *((_BYTE *)self + 555) = v5 & 0xFD | v6;
    -[SBIconView _updateLabelAnimated:](self, "_updateLabelAnimated:", 0);
  }
}

- (void)setLabelAccessoryHidden:(BOOL)a3
{
  int v4;
  char v5;
  char v6;

  v4 = !-[SBIconView allowsLabelArea](self, "allowsLabelArea") || a3;
  v5 = *((_BYTE *)self + 555);
  if (((v4 ^ ((v5 & 4) == 0)) & 1) == 0)
  {
    if (v4)
      v6 = 4;
    else
      v6 = 0;
    *((_BYTE *)self + 555) = v5 & 0xFB | v6;
    -[SBIconView _updateLabelAreaAnimated:](self, "_updateLabelAreaAnimated:", 0);
  }
}

- (void)_applyIconEditingSettings
{
  _BOOL4 v3;
  UILabel *iconIndexLabel;
  UILabel *v5;
  UILabel *v6;
  UILabel *v7;
  void *v8;
  UILabel *v9;
  void *v10;
  UILabel *v11;
  void *v12;
  UILabel *v13;
  void *v14;
  void *v15;
  UILabel *v16;

  -[SBIconView _updateDragInteractionLiftDelay](self, "_updateDragInteractionLiftDelay");
  v3 = -[SBHIconEditingSettings showIndexLabels](self->_iconEditingSettings, "showIndexLabels");
  iconIndexLabel = self->_iconIndexLabel;
  if (v3)
  {
    if (!iconIndexLabel)
    {
      v5 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
      v6 = self->_iconIndexLabel;
      self->_iconIndexLabel = v5;

      v7 = self->_iconIndexLabel;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu"), self->_debugIconIndex);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setText:](v7, "setText:", v8);

      v9 = self->_iconIndexLabel;
      objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:weight:design:", *MEMORY[0x1E0DC13A8], 24.0, *MEMORY[0x1E0DC1438]);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setFont:](v9, "setFont:", v10);

      v11 = self->_iconIndexLabel;
      objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setTextColor:](v11, "setTextColor:", v12);

      v13 = self->_iconIndexLabel;
      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.6);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setBackgroundColor:](v13, "setBackgroundColor:", v14);

      -[UILabel setTextAlignment:](self->_iconIndexLabel, "setTextAlignment:", 1);
      -[SBIconView contentContainerView](self, "contentContainerView");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "addSubview:", self->_iconIndexLabel);

      -[SBIconView setNeedsLayout](self, "setNeedsLayout");
    }
  }
  else if (iconIndexLabel)
  {
    -[UILabel removeFromSuperview](iconIndexLabel, "removeFromSuperview");
    v16 = self->_iconIndexLabel;
    self->_iconIndexLabel = 0;

  }
}

+ (id)defaultLegibilitySettings
{
  return (id)objc_msgSend(MEMORY[0x1E0DC4270], "sharedInstanceForStyle:", 1);
}

+ (CGSize)defaultIconViewSizeForIconImageSize:(CGSize)a3 configurationOptions:(unint64_t)a4
{
  double height;
  CGFloat width;
  double v6;
  double v7;
  double v8;
  CGSize result;

  height = a3.height;
  width = a3.width;
  if ((a4 & 2) == 0)
  {
    objc_msgSend(a1, "_labelHeight");
    height = height + v6;
  }
  v7 = width;
  v8 = height;
  result.height = v8;
  result.width = v7;
  return result;
}

+ (Class)contentContainerViewClass
{
  return (Class)objc_opt_self();
}

+ (BOOL)_shouldAlwaysHaveContentContainerView
{
  if (_shouldAlwaysHaveContentContainerView_onceToken != -1)
    dispatch_once(&_shouldAlwaysHaveContentContainerView_onceToken, &__block_literal_global_169_0);
  return _shouldAlwaysHaveContentContainerView_shouldAlwaysHaveContentContainerView;
}

+ (NSString)defaultIconLocation
{
  return (NSString *)CFSTR("SBIconLocationRoot");
}

- (SBIconLabelViewFactory)iconLabelViewFactory
{
  SBIconLabelViewFactory *iconLabelViewFactory;
  SBIconLabelViewFactory *v4;
  SBIconLabelViewFactory *v5;

  iconLabelViewFactory = self->_iconLabelViewFactory;
  if (!iconLabelViewFactory)
  {
    -[SBIconView createNewIconLabelViewFactory](self, "createNewIconLabelViewFactory");
    v4 = (SBIconLabelViewFactory *)objc_claimAutoreleasedReturnValue();
    v5 = self->_iconLabelViewFactory;
    self->_iconLabelViewFactory = v4;

    iconLabelViewFactory = self->_iconLabelViewFactory;
  }
  return iconLabelViewFactory;
}

- (id)createNewIconLabelViewFactory
{
  return +[SBIconLabelViewDefaultFactory sharedInstance](SBIconLabelViewDefaultFactory, "sharedInstance");
}

- (void)setCustomIconImageViewControllerPriority:(unint64_t)a3
{
  self->_customIconImageViewControllerPriority = a3;
}

- (BOOL)iconImageSizeMatchesBoundsSize
{
  return self->_iconImageSizeMatchesBoundsSize;
}

- (void)_destroyAccessoryView:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[SBIconView reuseDelegate](self, "reuseDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "iconView:willRemoveIconAccessoryView:", self, v5);
  if (objc_msgSend(v5, "isDescendantOfView:", self))
    objc_msgSend(v5, "removeFromSuperview");

}

- (void)cleanupAfterCrossfade
{
  void *v3;
  uint64_t v4;
  SBIconImageCrossfadeView *crossfadeView;
  void *v6;
  id v7;

  if (self->_crossfadeView)
  {
    -[SBIconView setCrossfadeFraction:](self, "setCrossfadeFraction:", 0.0);
    -[SBIconView setCrossfadeCornerRadius:](self, "setCrossfadeCornerRadius:", 0.0);
    -[SBIconView setMorphFraction:](self, "setMorphFraction:", 0.0);
    -[SBIconImageCrossfadeView cleanup](self->_crossfadeView, "cleanup");
    -[SBIconView subviews](self, "subviews");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "indexOfObject:", self->_crossfadeView);

    -[SBIconImageCrossfadeView removeFromSuperview](self->_crossfadeView, "removeFromSuperview");
    crossfadeView = self->_crossfadeView;
    self->_crossfadeView = 0;

    -[SBIconView updateAccessoryViewContainerIfNecessary](self, "updateAccessoryViewContainerIfNecessary");
    -[SBIconView currentImageView](self, "currentImageView");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setHidden:", 0);
    -[SBIconView contentContainerView](self, "contentContainerView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "insertSubview:atIndex:", v7, v4);

    -[SBIconView _updateIconImageAdornmentsAnimated:](self, "_updateIconImageAdornmentsAnimated:", 0);
    -[SBIconView _updateJitter](self, "_updateJitter");

  }
}

- (void)setIconLabelAlpha:(double)a3
{
  if (self->_iconLabelAlpha != a3)
  {
    self->_iconLabelAlpha = a3;
    -[SBIconView effectiveIconLabelAlpha](self, "effectiveIconLabelAlpha");
    -[SBIconView _applyIconLabelAlpha:](self, "_applyIconLabelAlpha:");
  }
}

- (void)setCrossfadeCornerRadius:(double)a3
{
  -[SBIconImageCrossfadeView setAppSnapshotCornerRadius:](self->_crossfadeView, "setAppSnapshotCornerRadius:", a3);
}

- (void)setMorphFraction:(double)a3
{
  -[SBIconImageCrossfadeView setMorphFraction:](self->_crossfadeView, "setMorphFraction:", a3);
  -[SBIconView setNeedsLayout](self, "setNeedsLayout");
  -[SBIconView layoutIfNeeded](self, "layoutIfNeeded");
}

- (void)setCrossfadeFraction:(double)a3
{
  double v5;

  -[SBIconImageCrossfadeView setCrossfadeFraction:](self->_crossfadeView, "setCrossfadeFraction:");
  v5 = 1.0 - a3;
  -[SBIconView setIconAccessoryAlpha:](self, "setIconAccessoryAlpha:", v5);
  -[SBIconView setIconLabelAlpha:](self, "setIconLabelAlpha:", v5);
}

- (void)setIconAccessoryAlpha:(double)a3
{
  if (self->_iconAccessoryAlpha != a3)
  {
    self->_iconAccessoryAlpha = a3;
    -[SBIconView effectiveIconAccessoryAlpha](self, "effectiveIconAccessoryAlpha");
    -[SBIconView _applyIconAccessoryAlpha:](self, "_applyIconAccessoryAlpha:");
  }
}

- (void)_createAccessoryViewIfNecessary
{
  objc_class *v3;
  void *v4;
  SBIconAccessoryView *v5;
  SBIconAccessoryView *accessoryView;
  SBIconAccessoryView *v7;
  SBIconAccessoryView *v8;
  SBIconAccessoryView *v9;
  __int128 v10;
  void *v11;
  void *v12;
  UIPointerInteraction *v13;
  UIPointerInteraction *accessoryViewCursorInteraction;
  _OWORD v15[3];

  v3 = (objc_class *)objc_msgSend((id)objc_opt_class(), "defaultViewClassForAccessoryType:", -[SBIconView currentAccessoryType](self, "currentAccessoryType"));
  if ((-[SBIconAccessoryView isMemberOfClass:](self->_accessoryView, "isMemberOfClass:", v3) & 1) == 0)
  {
    -[SBIconView reuseDelegate](self, "reuseDelegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBIconView _destroyAccessoryView](self, "_destroyAccessoryView");
    if (v3)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v4, "iconView:iconAccessoryViewOfClass:", self, v3);
        v5 = (SBIconAccessoryView *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v5 = (SBIconAccessoryView *)objc_alloc_init(v3);
      }
      accessoryView = self->_accessoryView;
      self->_accessoryView = v5;

      if ((objc_opt_respondsToSelector() & 1) != 0)
        -[SBIconAccessoryView setLegibilityStyle:](self->_accessoryView, "setLegibilityStyle:", -[_UILegibilitySettings style](self->_legibilitySettings, "style"));
      v7 = self->_accessoryView;
      -[SBIconView effectiveBrightness](self, "effectiveBrightness");
      -[SBIconAccessoryView setAccessoryBrightness:](v7, "setAccessoryBrightness:");
      v8 = self->_accessoryView;
      -[SBIconView effectiveIconAccessoryAlpha](self, "effectiveIconAccessoryAlpha");
      -[SBIconAccessoryView setAlpha:](v8, "setAlpha:");
      v9 = self->_accessoryView;
      v10 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
      v15[0] = *MEMORY[0x1E0C9BAA8];
      v15[1] = v10;
      v15[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
      -[SBIconAccessoryView setTransform:](v9, "setTransform:", v15);
      -[SBIconView updateParallaxSettings](self, "updateParallaxSettings");
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        -[SBIconView listLayout](self, "listLayout");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[SBIconAccessoryView setListLayout:](self->_accessoryView, "setListLayout:", v11);
        -[SBIconAccessoryView sizeToFit](self->_accessoryView, "sizeToFit");

      }
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", self, sel__accessoryViewTapGestureChanged_);
        objc_msgSend(v12, "setDelegate:", self);
        -[SBIconAccessoryView addGestureRecognizer:](self->_accessoryView, "addGestureRecognizer:", v12);
        -[SBIconAccessoryView setActionTapGestureRecognizer:](self->_accessoryView, "setActionTapGestureRecognizer:", v12);
        v13 = (UIPointerInteraction *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3B18]), "initWithDelegate:", self->_accessoryView);
        accessoryViewCursorInteraction = self->_accessoryViewCursorInteraction;
        self->_accessoryViewCursorInteraction = v13;

        -[SBIconAccessoryView addInteraction:](self->_accessoryView, "addInteraction:", self->_accessoryViewCursorInteraction);
      }
      -[SBIconView updateAccessoryViewOverrideIconImageAppearance](self, "updateAccessoryViewOverrideIconImageAppearance");
    }

  }
  if (self->_accessoryView)
    -[SBIconView updateAccessoryViewContainerIfNecessary](self, "updateAccessoryViewContainerIfNecessary");
}

+ (Class)defaultViewClassForAccessoryType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 2)
    return (Class)0;
  else
    return (Class)(id)objc_opt_self();
}

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  id v4;
  BOOL v5;
  objc_super v7;

  v4 = a3;
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("zPosition")) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SBIconView;
    v5 = -[SBIconView _shouldAnimatePropertyWithKey:](&v7, sel__shouldAnimatePropertyWithKey_, v4);
  }

  return v5;
}

- (SBIconView)initWithFrame:(CGRect)a3
{
  return -[SBIconView initWithConfigurationOptions:listLayoutProvider:](self, "initWithConfigurationOptions:listLayoutProvider:", 0, 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (CGPoint)_centerForAccessoryView
{
  void *v3;
  SBIconAccessoryView *accessoryView;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGPoint result;

  if (self->_accessoryView)
  {
    -[SBIconView currentImageView](self, "currentImageView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    accessoryView = self->_accessoryView;
    objc_msgSend(v3, "bounds");
    -[SBIconAccessoryView accessoryCenterForIconBounds:](accessoryView, "accessoryCenterForIconBounds:");
    v6 = v5;
    v8 = v7;
    -[SBIconView contentContainerView](self, "contentContainerView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "convertPoint:fromView:", v3, v6, v8);
    v11 = v10;
    v13 = v12;

  }
  else
  {
    v11 = *MEMORY[0x1E0C9D538];
    v13 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  }
  v14 = v11;
  v15 = v13;
  result.y = v15;
  result.x = v14;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  double y;
  double x;
  __int128 v6;
  BOOL v7;
  uint64_t v8;
  double v9;
  double v10;
  _QWORD v11[5];
  CGAffineTransform v12;
  objc_super v13;
  _QWORD v14[5];
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v17;

  y = a3.origin.y;
  x = a3.origin.x;
  -[SBIconView bounds](self, "bounds", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  memset(&v17, 0, sizeof(v17));
  -[SBIconView transform](self, "transform");
  t1 = v17;
  v6 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  *(_OWORD *)&t2.a = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)&t2.c = v6;
  *(_OWORD *)&t2.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  v7 = CGAffineTransformEqualToTransform(&t1, &t2);
  v8 = MEMORY[0x1E0C809B0];
  if (!v7)
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __23__SBIconView_setFrame___block_invoke;
    v14[3] = &unk_1E8D84C50;
    v14[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v14);
  }
  -[SBIconView iconViewSize](self, "iconViewSize");
  v13.receiver = self;
  v13.super_class = (Class)SBIconView;
  -[SBIconView setFrame:](&v13, sel_setFrame_, x, y, v9, v10);
  if (!v7)
  {
    v11[1] = 3221225472;
    v12 = v17;
    v11[0] = v8;
    v11[2] = __23__SBIconView_setFrame___block_invoke_2;
    v11[3] = &unk_1E8D88798;
    v11[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v11);
  }
  -[SBIconView bounds](self, "bounds");
  if ((BSSizeEqualToSize() & 1) == 0)
    -[SBIconView _notifyObserversSizeDidChange](self, "_notifyObserversSizeDidChange");
}

- (void)_notifyObserversSizeDidChange
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = (void *)-[NSHashTable copy](self->_observers, "copy", 0);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * v7);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v8, "iconViewSizeDidChange:", self);
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

- (void)setShowsSquareCorners:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *((_BYTE *)self + 557) = *((_BYTE *)self + 557) & 0xEF | v3;
  -[SBIconImageView setShowsSquareCorners:](self->_iconImageView, "setShowsSquareCorners:");
}

- (void)setAllIconElementsButLabelHidden:(BOOL)a3
{
  unsigned int v3;
  char v5;

  v3 = *((unsigned __int8 *)self + 558);
  if (a3 != v3 >> 7)
  {
    if (a3)
      v5 = 0x80;
    else
      v5 = 0;
    *((_BYTE *)self + 558) = v5 & 0x80 | v3 & 0x7F;
    -[SBIconView _updateAllComponentAlphas](self, "_updateAllComponentAlphas");
    -[SBIconView _updateCursorInteractionsEnabled](self, "_updateCursorInteractionsEnabled");
  }
}

- (void)_updateAllComponentAlphas
{
  -[SBIconView _updateAllComponentAlphasAnimated:](self, "_updateAllComponentAlphasAnimated:", 0);
}

- (unint64_t)visibleMiniIconListIndex
{
  void *v2;
  unint64_t v3;

  -[SBIconView _folderIconImageView](self, "_folderIconImageView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "visibleMiniIconListIndex");

  return v3;
}

uint64_t __43__SBIconView__updateAccessoryViewAnimated___block_invoke(uint64_t result)
{
  void *v1;
  CGAffineTransform *v2;
  void *v3;
  __int128 v4;
  CGAffineTransform v5;
  _OWORD v6[3];

  if (*(_BYTE *)(result + 48))
  {
    if (*(_BYTE *)(result + 49))
      return result;
    v1 = *(void **)(result + 40);
    CGAffineTransformMakeScale(&v5, 0.01, 0.01);
    v2 = &v5;
    v3 = v1;
  }
  else
  {
    if (!*(_BYTE *)(result + 49))
      return result;
    v3 = *(void **)(result + 32);
    v4 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    v6[0] = *MEMORY[0x1E0C9BAA8];
    v6[1] = v4;
    v6[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    v2 = (CGAffineTransform *)v6;
  }
  return objc_msgSend(v3, "setTransform:", v2);
}

+ (double)labelMaximumHeightForContentSizeCategory:(id)a3
{
  __int128 v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  __int128 v10;
  __int128 v11;

  v3 = *(_OWORD *)(MEMORY[0x1E0DC49E8] + 16);
  v10 = *MEMORY[0x1E0DC49E8];
  v11 = v3;
  +[SBIconLabelImageParametersBuilder defaultFontForContentSizeCategory:languageInsets:](SBIconLabelImageParametersBuilder, "defaultFontForContentSizeCategory:languageInsets:", a3, &v10);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ascender");
  v6 = v5;
  objc_msgSend(v4, "descender");
  *(float *)&v7 = v6 + fabs(v7) + fabs(*(double *)&v10) + fabs(*(double *)&v11);
  v8 = ceilf(*(float *)&v7);

  return v8;
}

- (void)scrollToTopOfFirstPageAnimated:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[SBIconView _folderIconImageView](self, "_folderIconImageView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scrollToTopOfFirstPageAnimated:", v3);

}

- (NSString)representedFolderIconLocation
{
  return (NSString *)CFSTR("SBIconLocationFolder");
}

void __43__SBIconView__updateAccessoryViewAnimated___block_invoke_4(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  id v4;

  if (*(unsigned __int8 *)(a1 + 48) == a2)
    objc_msgSend(*(id *)(a1 + 32), "_destroyAccessoryView");
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "accessoryViewAnimator");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if (WeakRetained == v4)
    objc_msgSend(*(id *)(a1 + 32), "setAccessoryViewAnimator:", 0);
}

- (id)matchingIconViewByAddingConfigurationOptions:(unint64_t)a3 removingConfigurationOptions:(unint64_t)a4
{
  return -[SBIconView matchingIconViewWithConfigurationOptions:](self, "matchingIconViewWithConfigurationOptions:", (-[SBIconView configurationOptions](self, "configurationOptions") | a3) & ~a4);
}

uint64_t __50__SBIconView__configureViewAsFolderIconImageView___block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "iconImageSize");
  objc_msgSend(v2, "setFrame:", 0.0, 0.0, v3, v4);
  objc_msgSend(*(id *)(a1 + 32), "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "iconImageCornerRadius");
  objc_msgSend(v5, "setCornerRadius:");

  objc_msgSend(*(id *)(a1 + 32), "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setCornerCurve:", *MEMORY[0x1E0CD2A68]);

  objc_msgSend(*(id *)(a1 + 32), "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setMasksToBounds:", 1);

  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

- (double)iconImageCornerRadius
{
  double v2;

  -[SBIconView iconImageInfo](self, "iconImageInfo");
  return v2;
}

- (id)shortcutsDelegate
{
  id v3;
  void *v4;

  -[SBIconView delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "shortcutsDelegateForIconView:", self);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

void __57__SBIconView__fetchApplicationShortcutItemsIfAppropriate__block_invoke_2(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "icon");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqual:", *(_QWORD *)(a1 + 40));

  if (v3)
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 48), "composedApplicationShortcutItems");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setFetchedApplicationShortcutItems:", v5);

  }
}

void __57__SBIconView__fetchApplicationShortcutItemsIfAppropriate__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;

  v3 = a2;
  v5 = *(id *)(a1 + 40);
  v4 = v3;
  BSDispatchMain();

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideAccessoryIconImageAppearance, 0);
  objc_storeStrong((id *)&self->_windowSceneUserInterfaceStyleChangeRegistration, 0);
  objc_storeStrong((id *)&self->_overrideImage, 0);
  objc_storeStrong((id *)&self->_overrideImageTintColor, 0);
  objc_storeStrong((id *)&self->_resizeGestureHandler, 0);
  objc_storeStrong((id *)&self->_springBoardIconImageStyleConfiguration, 0);
  objc_storeStrong((id *)&self->_springBoardIconStyleObservation, 0);
  objc_storeStrong((id *)&self->_resizeHandle, 0);
  objc_destroyWeak((id *)&self->_borrowedIconImageViewAssertion);
  objc_storeStrong((id *)&self->_fetchedApplicationShortcutItems, 0);
  objc_storeStrong((id *)&self->_closeBoxAnimator, 0);
  objc_storeStrong((id *)&self->_currentStackConfigurationInteraction, 0);
  objc_storeStrong((id *)&self->_currentConfigurationInteraction, 0);
  objc_storeStrong((id *)&self->_homeButtonPressConsumingAssertion, 0);
  objc_storeStrong((id *)&self->_contextMenuInteraction, 0);
  objc_storeStrong((id *)&self->_editingModeGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_accessoryViewAnimator, 0);
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
  objc_destroyWeak((id *)&self->_liftingDragSession);
  objc_storeStrong((id *)&self->_dragInteraction, 0);
  objc_storeStrong((id *)&self->_dropInteraction, 0);
  objc_storeStrong((id *)&self->_resizeHandleCursorInteraction, 0);
  objc_storeStrong((id *)&self->_accessoryViewCursorInteraction, 0);
  objc_storeStrong((id *)&self->_closeBoxCursorInteraction, 0);
  objc_storeStrong((id *)&self->_iconViewCursorInteraction, 0);
  objc_destroyWeak((id *)&self->_appPrototectionSubjectMonitorSubscription);
  objc_storeStrong((id *)&self->_accessibilityTintColor, 0);
  objc_storeStrong((id *)&self->_folderIconBackgroundView, 0);
  objc_storeStrong((id *)&self->_folderIcon, 0);
  objc_storeStrong((id *)&self->_folderIconImageCache, 0);
  objc_storeStrong((id *)&self->_iconImageCache, 0);
  objc_storeStrong((id *)&self->_listLayoutProvider, 0);
  objc_storeStrong((id *)&self->_overrideCustomIconImageViewController, 0);
  objc_storeStrong((id *)&self->_customIconImageViewController, 0);
  objc_storeStrong((id *)&self->_continuityInfo, 0);
  objc_storeStrong((id *)&self->_overrideBadgeNumberOrString, 0);
  objc_storeStrong((id *)&self->_lastTouchDownDate, 0);
  objc_storeStrong((id *)&self->_overrideIconImageStyleConfiguration, 0);
  objc_storeStrong((id *)&self->_overrideIconImageAppearance, 0);
  objc_storeStrong((id *)&self->_applicationShortcutItems, 0);
  objc_storeStrong((id *)&self->_legibilitySettings, 0);
  objc_destroyWeak((id *)&self->_overrideDraggingDelegate);
  objc_destroyWeak((id *)&self->_overrideActionDelegate);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_resizeGestureContext, 0);
  objc_storeStrong((id *)&self->_iconLabelViewFactory, 0);
  objc_storeStrong((id *)&self->_activePointerRegions, 0);
  objc_storeStrong((id *)&self->_iconContextMenuActivity, 0);
  objc_storeStrong((id *)&self->_dismissingContextMenuInteractionConfigurations, 0);
  objc_storeStrong((id *)&self->_contextMenuInteractionConfigurations, 0);
  objc_storeStrong((id *)&self->_droppingAssertions, 0);
  objc_storeStrong((id *)&self->_droppingURLs, 0);
  objc_storeStrong((id *)&self->_performAfterContextMenuBlocks, 0);
  objc_storeStrong((id *)&self->_recentsDocumentExtensionProvider, 0);
  objc_storeStrong((id *)&self->_labelFont, 0);
  objc_storeStrong((id *)&self->_forbidContextMenusAssertions, 0);
  objc_storeStrong((id *)&self->_forbidAccessoryUpdatesAssertions, 0);
  objc_storeStrong((id *)&self->_forbidEditingModeReasons, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_scalingContainer, 0);
  objc_storeStrong((id *)&self->_snapshotProvider, 0);
  objc_storeStrong((id *)&self->_iconIndexLabel, 0);
  objc_storeStrong((id *)&self->_iconResizingSettings, 0);
  objc_storeStrong((id *)&self->_iconEditingSettings, 0);
  objc_storeStrong((id *)&self->_focusProxyView, 0);
  objc_storeStrong((id *)&self->_focusEffectPlatterView, 0);
  objc_storeStrong((id *)&self->_dropGlow, 0);
  objc_storeStrong((id *)&self->_labelAccessoryView, 0);
  objc_storeStrong((id *)&self->_labelView, 0);
  objc_storeStrong((id *)&self->_closeBox, 0);
  objc_storeStrong((id *)&self->_accessoryView, 0);
  objc_storeStrong((id *)&self->_temporarySnapshotContainerViewForDragPreview, 0);
  objc_storeStrong((id *)&self->_snapshotContainerView, 0);
  objc_storeStrong((id *)&self->_crossfadeView, 0);
  objc_storeStrong((id *)&self->_iconImageView, 0);
  objc_storeStrong((id *)&self->_iconLocation, 0);
  objc_storeStrong((id *)&self->_icon, 0);
}

void __40__SBIconView_applicationShortcutService__block_invoke()
{
  id v0;
  void *v1;

  if ((__sb__runningInSpringBoard() & 1) == 0)
  {
    v0 = objc_alloc_init(MEMORY[0x1E0DAADA8]);
    v1 = (void *)applicationShortcutService__applicationShortcutService;
    applicationShortcutService__applicationShortcutService = (uint64_t)v0;

  }
}

+ (CGSize)defaultIconViewSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  objc_msgSend(a1, "defaultIconImageSize");
  v4 = v3;
  v6 = v5;
  objc_msgSend(a1, "_labelHeight");
  v8 = v6 + v7;
  v9 = v4;
  result.height = v8;
  result.width = v9;
  return result;
}

+ (void)activateShortcut:(id)a3 withBundleIdentifier:(id)a4 forIconView:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  void *v32;
  double v33;
  CGFloat v34;
  double v35;
  CGFloat v36;
  double v37;
  CGFloat v38;
  double v39;
  CGFloat v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  int v45;
  void *v46;
  int v47;
  void *v48;
  int v49;
  void *v50;
  int v51;
  void *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  uint64_t v57;
  _BOOL8 v58;
  void *v59;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  uint64_t v68;
  void *v69;
  void *v70;
  id v71;
  void *v72;
  _QWORD v73[4];
  id v74;
  void *v75;
  _QWORD v76[4];
  _QWORD v77[5];
  CGRect v78;

  v77[4] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v7, "type");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("com.apple.springboardhome.application-shortcut-item.appStoreLink"));

  if (!v11)
  {
    objc_msgSend(v7, "type");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "isEqualToString:", CFSTR("com.apple.springboardhome.application-shortcut-item.share"));

    if (v17)
    {
      objc_msgSend(v7, "userInfo");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = *MEMORY[0x1E0CD8110];
      objc_msgSend(v18, "objectForKey:", *MEMORY[0x1E0CD8110]);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v13)
        goto LABEL_13;
      objc_msgSend(v9, "window");
      v14 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setObject:forKeyedSubscript:", v13, v19);
      objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "userInterfaceIdiom");

      if ((v21 & 0xFFFFFFFFFFFFFFFBLL) == 1)
      {
        objc_msgSend(v14, "screen");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "frame");
        v24 = v23;
        v26 = v25;
        v28 = v27;
        v30 = v29;
        objc_msgSend(v9, "superview");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "coordinateSpace");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "convertRect:toCoordinateSpace:", v32, v24, v26, v28, v30);
        v34 = v33;
        v36 = v35;
        v38 = v37;
        v40 = v39;

        v78.origin.x = v34;
        v78.origin.y = v36;
        v78.size.width = v38;
        v78.size.height = v40;
        NSStringFromCGRect(v78);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setObject:forKeyedSubscript:", v41, *MEMORY[0x1E0CD8118]);

      }
      v42 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CD8068]), "initWithParameters:", v15);
      objc_msgSend(v14, "rootViewController");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "presentViewController:animated:completion:", v42, 1, 0);

    }
    else
    {
      objc_msgSend(v7, "type");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = objc_msgSend(v44, "isEqualToString:", CFSTR("com.apple.springboardhome.application-shortcut-item.show-all-windows"));

      if (v45)
      {
        if (activateShortcut_withBundleIdentifier_forIconView__onceToken != -1)
          dispatch_once(&activateShortcut_withBundleIdentifier_forIconView__onceToken, &__block_literal_global_56);
        objc_msgSend((id)activateShortcut_withBundleIdentifier_forIconView__multiWindowService, "triggerShowAllWindowsForApplicationBundleIdentifier:", v8);
        goto LABEL_13;
      }
      objc_msgSend(v7, "type");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = objc_msgSend(v46, "isEqualToString:", CFSTR("com.apple.springboardhome.application-shortcut-item.delete-app"));

      if (v47)
      {
        objc_msgSend(v9, "icon");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setUninstalled");
        objc_msgSend(v13, "completeUninstall");
        goto LABEL_12;
      }
      objc_msgSend(v7, "type");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = objc_msgSend(v48, "isEqualToString:", CFSTR("com.apple.springboardhome.application-shortcut-item.add-to-home-screen"));

      if (v49)
      {
        objc_msgSend((id)objc_opt_class(), "homeScreenService");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addApplicationIconToHomeScreenWithBundleIdentifier:", v8);
        goto LABEL_12;
      }
      objc_msgSend(v7, "type");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = objc_msgSend(v50, "isEqualToString:", CFSTR("com.apple.springboardhome.application-shortcut-item.app-protection"));

      if (v51)
      {
        objc_msgSend(v9, "icon");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v13, "isApplicationIcon"))
          goto LABEL_12;
        v14 = v13;
        objc_msgSend(v7, "userInfo");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "objectForKey:", kSBHIconAppProtectionFeatureUserInfoKey);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        v54 = objc_msgSend(v53, "unsignedIntegerValue");

        objc_msgSend(v7, "userInfo");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "objectForKey:", kSBHIconAppProtectionActionUserInfoKey);
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        v57 = objc_msgSend(v56, "unsignedIntegerValue");

        objc_msgSend(v14, "changeEnablement:ofFeature:", v57, v54);
        goto LABEL_11;
      }
      v58 = objc_msgSend(v7, "activationMode") == 1;
      v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3848]), "initWithSBSShortcutItem:", v7);
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v14 = (id)objc_claimAutoreleasedReturnValue();
      v76[0] = *MEMORY[0x1E0D22D00];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v58);
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      v77[0] = v59;
      v76[1] = *MEMORY[0x1E0D22CE0];
      v75 = v13;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v75, 1);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      v61 = *MEMORY[0x1E0D22D88];
      v77[1] = v60;
      v77[2] = MEMORY[0x1E0C9AAB0];
      v62 = *MEMORY[0x1E0D22D58];
      v76[2] = v61;
      v76[3] = v62;
      v77[3] = *MEMORY[0x1E0DAB810];
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v77, v76, 4);
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "addEntriesFromDictionary:", v63);

      objc_msgSend(v7, "targetContentIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "targetContentIdentifier");
      v64 = (void *)objc_claimAutoreleasedReturnValue();

      if (v64)
        objc_msgSend(v14, "setObject:forKey:", v15, *MEMORY[0x1E0DC5D08]);
      if (SBFIsChamoisExternalDisplayControllerAvailable())
      {
        objc_msgSend(v9, "_screen");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v65, "displayConfiguration");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v66, "deviceName");
        v67 = (void *)objc_claimAutoreleasedReturnValue();

        if (v67)
          objc_msgSend(v14, "setObject:forKey:", v67, *MEMORY[0x1E0DAB868]);

      }
      objc_msgSend(MEMORY[0x1E0D23158], "optionsWithDictionary:", v14);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      if (activateShortcut_withBundleIdentifier_forIconView__onceToken_49 != -1)
        dispatch_once(&activateShortcut_withBundleIdentifier_forIconView__onceToken_49, &__block_literal_global_50_1);
      objc_msgSend(v7, "bundleIdentifierToLaunch");
      v68 = objc_claimAutoreleasedReturnValue();
      v69 = (void *)v68;
      if (v68)
        v70 = (void *)v68;
      else
        v70 = v8;
      v71 = v70;

      v72 = (void *)activateShortcut_withBundleIdentifier_forIconView__openApplicationService;
      v73[0] = MEMORY[0x1E0C809B0];
      v73[1] = 3221225472;
      v73[2] = __64__SBIconView_activateShortcut_withBundleIdentifier_forIconView___block_invoke_3;
      v73[3] = &unk_1E8D8B718;
      v74 = v8;
      objc_msgSend(v72, "openApplication:withOptions:completion:", v71, v42, v73);

    }
    goto LABEL_10;
  }
  objc_msgSend(v7, "userInfo");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKey:", kSBHIconAppStoreURLUserInfoKey);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "openURL:withOptions:", v15, 0);
LABEL_10:

LABEL_11:
LABEL_12:

  }
LABEL_13:

}

void __64__SBIconView_activateShortcut_withBundleIdentifier_forIconView___block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0DAAD70]);
  v1 = (void *)activateShortcut_withBundleIdentifier_forIconView__multiWindowService;
  activateShortcut_withBundleIdentifier_forIconView__multiWindowService = (uint64_t)v0;

}

void __64__SBIconView_activateShortcut_withBundleIdentifier_forIconView___block_invoke_2()
{
  uint64_t v0;
  void *v1;

  SBSCreateOpenApplicationService();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)activateShortcut_withBundleIdentifier_forIconView__openApplicationService;
  activateShortcut_withBundleIdentifier_forIconView__openApplicationService = v0;

}

void __64__SBIconView_activateShortcut_withBundleIdentifier_forIconView___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;

  v4 = a3;
  if (v4)
  {
    SBLogIcon();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __64__SBIconView_activateShortcut_withBundleIdentifier_forIconView___block_invoke_3_cold_1(a1, (uint64_t)v4, v5);

  }
}

+ (id)homeScreenService
{
  if (homeScreenService_onceToken_1 != -1)
    dispatch_once(&homeScreenService_onceToken_1, &__block_literal_global_52_0);
  return (id)homeScreenService__homeScreenService_1;
}

void __31__SBIconView_homeScreenService__block_invoke()
{
  id v0;
  void *v1;

  if ((__sb__runningInSpringBoard() & 1) == 0)
  {
    v0 = objc_alloc_init(MEMORY[0x1E0DAAE90]);
    v1 = (void *)homeScreenService__homeScreenService_1;
    homeScreenService__homeScreenService_1 = (uint64_t)v0;

  }
}

+ (void)setDebugContinuityItem:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&__debugContinuityItem, a3);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "postNotificationName:object:", CFSTR("SBIconViewRefreshAccessoryViewNotification"), 0);

  }
}

+ (id)applicationIconMultitaskingMenus
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  if (__sb__runningInSpringBoard())
  {
    if (SBFEffectiveDeviceClass() != 2)
      return MEMORY[0x1E0C9AA60];
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "userInterfaceIdiom");

    if (v5 != 1)
      return MEMORY[0x1E0C9AA60];
  }
  objc_msgSend(a1, "applicationIconMultitaskingMenu");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "applicationIconSplitViewMenu");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "applicationIconStageManagerMenu");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  __SBIconViewOwnerWantsMultitaskingKeyboardShortcuts = 1;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v6)
    objc_msgSend(v9, "addObject:", v6);
  if (v7)
    objc_msgSend(v10, "addObject:", v7);
  if (v8)
    objc_msgSend(v10, "addObject:", v8);

  return v10;
}

+ (id)applicationIconMultitaskingMenu
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  if (__sb__runningInSpringBoard())
  {
    if (SBFEffectiveDeviceClass() != 2)
      return 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "userInterfaceIdiom");

    if (v4 != 1)
      return 0;
  }
  __SBIconViewOwnerWantsMultitaskingKeyboardShortcuts = 1;
  objc_msgSend(MEMORY[0x1E0DC3930], "keyCommandWithInput:modifierFlags:action:", *MEMORY[0x1E0DC4D90], 0x800000, sel__handleActivateAppExposeKeyShortcut_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_nonRepeatableKeyCommand");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_allowGlobeModifierKeyCommand");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  SBHBundle();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("APP_EXPOSE_DISCOVERABILITY"), &stru_1E8D8E958, CFSTR("SpringBoardHome"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDiscoverabilityTitle:", v9);

  objc_msgSend(MEMORY[0x1E0DAAED8], "systemKeyCommandOverlayEnvironment");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_setEventDeferringEnvironment:", v10);

  v11 = (void *)MEMORY[0x1E0DC39D0];
  SBHBundle();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("MULTITASKING_MENU_TITLE"), &stru_1E8D8E958, CFSTR("SpringBoardHome"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "menuWithTitle:children:", v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

+ (id)applicationIconSplitViewMenu
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
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
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v26[4];

  v26[3] = *MEMORY[0x1E0C80C00];
  if (__sb__runningInSpringBoard())
  {
    if (SBFEffectiveDeviceClass() != 2)
      return 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "userInterfaceIdiom");

    if (v4 != 1)
      return 0;
  }
  __SBIconViewOwnerWantsMultitaskingKeyboardShortcuts = 1;
  objc_msgSend(MEMORY[0x1E0DAAED8], "systemKeyCommandOverlayEnvironment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3930], "keyCommandWithInput:modifierFlags:action:", CFSTR("f"), 0x800000, sel__handleMakeFullscreenKeyShortcut_);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_nonRepeatableKeyCommand");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_allowGlobeModifierKeyCommand");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  SBHBundle();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("MAKE_FULLSCREEN_DISCOVERABILITY"), &stru_1E8D8E958, CFSTR("SpringBoardHome"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setDiscoverabilityTitle:", v10);

  objc_msgSend(v8, "_setEventDeferringEnvironment:", v5);
  objc_msgSend(MEMORY[0x1E0DC3930], "keyCommandWithInput:modifierFlags:action:", *MEMORY[0x1E0DC4E10], 8650752, sel__handleMakeSplitLeftKeyShortcut_);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_nonRepeatableKeyCommand");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "_allowGlobeModifierKeyCommand");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  SBHBundle();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("MAKE_LEFT_SPLIT_DISCOVERABILITY"), &stru_1E8D8E958, CFSTR("SpringBoardHome"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setDiscoverabilityTitle:", v15);

  objc_msgSend(v13, "_setEventDeferringEnvironment:", v5);
  objc_msgSend(MEMORY[0x1E0DC3930], "keyCommandWithInput:modifierFlags:action:", *MEMORY[0x1E0DC4E28], 8650752, sel__handleMakeSplitRightKeyShortcut_);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "_nonRepeatableKeyCommand");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "_allowGlobeModifierKeyCommand");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  SBHBundle();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("MAKE_RIGHT_SPLIT_DISCOVERABILITY"), &stru_1E8D8E958, CFSTR("SpringBoardHome"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setDiscoverabilityTitle:", v20);

  objc_msgSend(v18, "_setEventDeferringEnvironment:", v5);
  v21 = (void *)MEMORY[0x1E0DC39D0];
  SBHBundle();
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("SPLIT_VIEW_MENU_TITLE"), &stru_1E8D8E958, CFSTR("SpringBoardHome"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v8;
  v26[1] = v13;
  v26[2] = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 3);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "menuWithTitle:children:", v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

+ (id)applicationIconStageManagerMenu
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  if (__sb__runningInSpringBoard())
  {
    if (SBFEffectiveDeviceClass() != 2)
      return 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "userInterfaceIdiom");

    if (v4 != 1)
      return 0;
  }
  __SBIconViewOwnerWantsMultitaskingKeyboardShortcuts = 1;
  objc_msgSend(MEMORY[0x1E0DC3930], "keyCommandWithInput:modifierFlags:action:", *MEMORY[0x1E0DC4E30], 8650752, sel__handleAddWindowToSetCommand_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_nonRepeatableKeyCommand");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_allowGlobeModifierKeyCommand");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  SBHBundle();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("ADD_ANOTHER_WINDOW_DISCOVERABILITY"), &stru_1E8D8E958, CFSTR("SpringBoardHome"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDiscoverabilityTitle:", v9);

  objc_msgSend(MEMORY[0x1E0DAAED8], "systemKeyCommandOverlayEnvironment");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_setEventDeferringEnvironment:", v10);

  v11 = (void *)MEMORY[0x1E0DC39D0];
  SBHBundle();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("STAGE_MANAGER_MENU_TITLE"), &stru_1E8D8E958, CFSTR("SpringBoardHome"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "menuWithTitle:children:", v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (SBIconView)initWithConfigurationOptions:(unint64_t)a3
{
  return -[SBIconView initWithConfigurationOptions:listLayoutProvider:](self, "initWithConfigurationOptions:listLayoutProvider:", a3, 0);
}

- (id)gridSizeClass
{
  void *v2;
  void *v3;

  -[SBIconView icon](self, "icon");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "gridSizeClass");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend((id)objc_opt_class(), "defaultGridSizeClass");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v3;
}

+ (NSString)defaultGridSizeClass
{
  return (NSString *)CFSTR("SBHIconGridSizeClassDefault");
}

- (void)setIconImageInfo:(SBIconImageInfo *)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  char v12;
  SBIconImageInfo *p_iconImageInfo;
  _BOOL8 v14;

  v7 = v6;
  v8 = v5;
  v9 = v4;
  v10 = v3;
  v12 = *((_BYTE *)self + 557);
  if ((v12 & 8) == 0)
    goto LABEL_4;
  p_iconImageInfo = &self->_iconImageInfo;
  if (SBIconImageInfoEqualToIconImageInfo(v3, v4, v5, v6, self->_iconImageInfo.size.width, self->_iconImageInfo.size.height, self->_iconImageInfo.scale, self->_iconImageInfo.continuousCornerRadius))
  {
    return;
  }
  v12 = *((_BYTE *)self + 557);
  if ((v12 & 8) != 0)
  {
    v14 = !SBIconImageInfoSizeAndScaleEqualToIconImageInfo(v10, v9, v8, v7, p_iconImageInfo->size.width, p_iconImageInfo->size.height, p_iconImageInfo->scale);
    v12 = *((_BYTE *)self + 557);
  }
  else
  {
LABEL_4:
    v14 = 1;
  }
  *((_BYTE *)self + 557) = v12 | 8;
  self->_iconImageInfo.size.width = v10;
  self->_iconImageInfo.size.height = v9;
  self->_iconImageInfo.scale = v8;
  self->_iconImageInfo.continuousCornerRadius = v7;
  -[SBIconView _updateAfterManualIconImageInfoChangeInvalidatingLayout:](self, "_updateAfterManualIconImageInfoChangeInvalidatingLayout:", v14);
}

- (void)_updateAfterManualIconImageInfoChangeInvalidatingLayout:(BOOL)a3
{
  _BOOL4 v3;
  id v5;

  v3 = a3;
  -[SBIconView customIconImageViewController](self, "customIconImageViewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[SBIconView iconImageInfo](self, "iconImageInfo");
    objc_msgSend(v5, "setIconImageInfo:");
  }
  if (v3)
  {
    -[SBIconView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
    -[SBIconView _updateFrameToIconViewSize](self, "_updateFrameToIconViewSize");
    -[SBIconView _updateLabelArea](self, "_updateLabelArea");
  }

}

- (void)setBoundsSizeFromIconImageSize:(CGSize)a3
{
  double v4;
  double v5;

  -[SBIconView iconViewSizeForIconImageSize:](self, "iconViewSizeForIconImageSize:", a3.width, a3.height);
  -[SBIconView setBounds:](self, "setBounds:", 0.0, 0.0, v4, v5);
}

- (BOOL)allowsAdornmentsOverIconImage
{
  return (*((unsigned __int8 *)self + 555) >> 5) & 1;
}

- (void)setAllowsAdornmentsOverIconImage:(BOOL)a3
{
  -[SBIconView setAllowsAdornmentsOverIconImage:animated:](self, "setAllowsAdornmentsOverIconImage:animated:", a3, 0);
}

- (void)setAllowsAdornmentsOverIconImage:(BOOL)a3 animated:(BOOL)a4
{
  char v4;
  char v5;

  v4 = *((_BYTE *)self + 555);
  if (((((v4 & 0x20) == 0) ^ a3) & 1) == 0)
  {
    if (a3)
      v5 = 32;
    else
      v5 = 0;
    *((_BYTE *)self + 555) = v4 & 0xDF | v5;
    -[SBIconView _updateIconImageAdornmentsAnimated:](self, "_updateIconImageAdornmentsAnimated:", a4);
  }
}

- (void)_updateIconImageAdornmentsAnimated:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  -[SBIconView _updateCloseBoxAnimated:](self, "_updateCloseBoxAnimated:");
  -[SBIconView _updateAccessoryViewAnimated:](self, "_updateAccessoryViewAnimated:", v3);
  -[SBIconView _updateResizeHandleAnimated:](self, "_updateResizeHandleAnimated:", v3);
}

- (void)setOverrideIconImageAppearance:(id)a3
{
  SBHIconImageAppearance *v4;
  SBHIconImageAppearance *overrideIconImageAppearance;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    v4 = (SBHIconImageAppearance *)objc_msgSend(v8, "copy");
    overrideIconImageAppearance = self->_overrideIconImageAppearance;
    self->_overrideIconImageAppearance = v4;

    -[SBIconView customIconImageViewController](self, "customIconImageViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      -[SBIconView setOverrideImageAppearance:onCustomIconImageViewController:](self, "setOverrideImageAppearance:onCustomIconImageViewController:", v8, v6);
    }
    else
    {
      -[SBIconView _iconImageView](self, "_iconImageView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "updateImageAnimated:", 1);

    }
    -[SBIconView updateAccessoryViewOverrideIconImageAppearance](self, "updateAccessoryViewOverrideIconImageAppearance");

  }
}

- (void)setOverrideIconImageStyleConfiguration:(id)a3
{
  SBHIconImageStyleConfiguration *v4;
  SBHIconImageStyleConfiguration *overrideIconImageStyleConfiguration;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    v4 = (SBHIconImageStyleConfiguration *)objc_msgSend(v8, "copy");
    overrideIconImageStyleConfiguration = self->_overrideIconImageStyleConfiguration;
    self->_overrideIconImageStyleConfiguration = v4;

    -[SBIconView customIconImageViewController](self, "customIconImageViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      -[SBIconView setOverrideImageStyleConfiguration:onCustomIconImageViewController:](self, "setOverrideImageStyleConfiguration:onCustomIconImageViewController:", v8, v6);
    }
    else
    {
      -[SBIconView _iconImageView](self, "_iconImageView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "updateImageAnimated:", 1);

    }
    -[SBIconView updateAccessoryViewOverrideIconImageAppearance](self, "updateAccessoryViewOverrideIconImageAppearance");

  }
}

- (BOOL)usesSceneUserInterfaceStyleForImage
{
  return *((_BYTE *)self + 560) & 1;
}

- (void)setUsesSceneUserInterfaceStyleForImage:(BOOL)a3
{
  char v3;
  void *v5;
  id v6;

  v3 = *((_BYTE *)self + 560);
  if (((((v3 & 1) == 0) ^ a3) & 1) == 0)
  {
    *((_BYTE *)self + 560) = v3 & 0xFE | a3;
    -[SBIconView _iconImageView](self, "_iconImageView");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "updateImageAnimated:", 1);
    -[SBIconView window](self, "window");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBIconView updateWindowSceneUserInterfaceStyleChangeRegistrationForWindow:](self, "updateWindowSceneUserInterfaceStyleChangeRegistrationForWindow:", v5);

  }
}

- (void)updateWindowSceneUserInterfaceStyleChangeRegistrationForWindow:(id)a3
{
  void *v4;
  void *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "windowScene");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconView windowSceneUserInterfaceStyleChangeRegistration](self, "windowSceneUserInterfaceStyleChangeRegistration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[SBIconView usesSceneUserInterfaceStyleForImage](self, "usesSceneUserInterfaceStyleForImage");
  if (!v6 || v5)
  {
    if (v5)
      v10 = v6;
    else
      v10 = 1;
    if ((v10 & 1) == 0)
    {
      objc_msgSend(v4, "unregisterForTraitChanges:", v5);
      -[SBIconView setWindowSceneUserInterfaceStyleChangeRegistration:](self, "setWindowSceneUserInterfaceStyleChangeRegistration:", 0);
    }
  }
  else
  {
    objc_opt_self();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "registerForTraitChanges:withTarget:action:", v8, self, sel_windowSceneUserInterfaceStyleChanged);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[SBIconView setWindowSceneUserInterfaceStyleChangeRegistration:](self, "setWindowSceneUserInterfaceStyleChangeRegistration:", v9);
  }

}

- (void)windowSceneUserInterfaceStyleChanged
{
  id v2;

  -[SBIconView _iconImageView](self, "_iconImageView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateImageAnimated:", 1);

}

- (id)effectiveIconImageAppearance
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  -[SBIconView overrideIconImageAppearance](self, "overrideIconImageAppearance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconView overrideIconImageStyleConfiguration](self, "overrideIconImageStyleConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[SBIconView usesSceneUserInterfaceStyleForImage](self, "usesSceneUserInterfaceStyleForImage"))
    goto LABEL_5;
  -[SBIconView window](self, "window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "windowScene");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "traitCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconView springBoardIconImageStyleConfiguration](self, "springBoardIconImageStyleConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = objc_msgSend(v7, "userInterfaceStyle");
    objc_msgSend(MEMORY[0x1E0DC3E88], "sbh_traitCollectionWithIconImageStyleConfiguration:userInterfaceStyle:", v8, v9);
    v10 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v10;
  }

  if (!v7)
  {
LABEL_5:
    -[SBIconView traitCollection](self, "traitCollection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(MEMORY[0x1E0DC3E88], "sbh_iconImageAppearanceFromTraitCollection:overrideIconImageAppearance:overrideIconImageStyleConfiguration:", v7, v3, v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)effectiveIconImageStyleConfiguration
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  -[SBIconView overrideIconImageAppearance](self, "overrideIconImageAppearance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    +[SBHIconImageStyleConfiguration styleConfigurationWithIconImageAppearance:](SBHIconImageStyleConfiguration, "styleConfigurationWithIconImageAppearance:", v3);
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[SBIconView overrideIconImageStyleConfiguration](self, "overrideIconImageStyleConfiguration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      v4 = v5;
    }
    else
    {
      -[SBIconView traitCollection](self, "traitCollection");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "sbh_iconImageStyleConfiguration");
      v4 = (id)objc_claimAutoreleasedReturnValue();

    }
  }

  return v4;
}

- (void)setOverrideImageTintColor:(id)a3
{
  UIColor *v4;
  UIColor *overrideImageTintColor;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;

  v10 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    v4 = (UIColor *)objc_msgSend(v10, "copy");
    overrideImageTintColor = self->_overrideImageTintColor;
    self->_overrideImageTintColor = v4;

    -[SBIconView updateAccessoryViewContainerIfNecessary](self, "updateAccessoryViewContainerIfNecessary");
    -[SBIconView _iconImageView](self, "_iconImageView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "canOverrideImageTintColor") & 1) != 0)
    {
      if (v10)
      {
        if ((objc_msgSend(v7, "sbh_hasFilterWithName:", CFSTR("overrideTint")) & 1) != 0)
        {
          v10 = objc_retainAutorelease(v10);
          objc_msgSend(v7, "setValue:forKeyPath:", objc_msgSend(v10, "CGColor"), CFSTR("filters.overrideTint.inputColor"));
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2E60]);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setName:", CFSTR("overrideTint"));
          v10 = objc_retainAutorelease(v10);
          v9 = objc_msgSend(v10, "CGColor");
          objc_msgSend(v8, "setValue:forKey:", v9, *MEMORY[0x1E0CD2D00]);
          objc_msgSend(v7, "sbh_addFilter:", v8);

        }
        goto LABEL_8;
      }
    }
    else
    {

    }
    objc_msgSend(v7, "sbh_removeFilterWithName:", CFSTR("overrideTint"));
    v10 = 0;
LABEL_8:
    objc_msgSend(v6, "effectiveIconImageAppearanceDidChange");

  }
}

- (void)setOverrideImage:(id)a3
{
  void *v5;
  id v6;

  v6 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_overrideImage, a3);
    -[SBIconView _iconImageView](self, "_iconImageView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "updateImageAnimated:", 0);

  }
}

- (BOOL)isCustomIconImageViewHitTestingDisabled
{
  return (*((unsigned __int8 *)self + 558) >> 4) & 1;
}

- (void)setCustomIconImageViewHitTestingDisabled:(BOOL)a3
{
  char v3;
  char v4;

  v3 = *((_BYTE *)self + 558);
  if (((((v3 & 0x10) == 0) ^ a3) & 1) == 0)
  {
    if (a3)
      v4 = 16;
    else
      v4 = 0;
    *((_BYTE *)self + 558) = v3 & 0xEF | v4;
    -[SBIconView _updateCustomIconImageViewControllerHitTesting](self, "_updateCustomIconImageViewControllerHitTesting");
  }
}

- (void)_updateCustomIconImageViewControllerHitTesting
{
  void *v3;
  id v4;

  -[SBIconView customIconImageViewController](self, "customIconImageViewController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bs_setHitTestingDisabled:", -[SBIconView isCustomIconImageViewHitTestingDisabled](self, "isCustomIconImageViewHitTestingDisabled"));

}

- (void)setCustomIconImageViewControllerPresentationMode:(unint64_t)a3
{
  id v4;

  -[SBIconView customIconImageViewController](self, "customIconImageViewController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "setPresentationMode:", a3);

}

- (unint64_t)customIconImageViewControllerPresentationMode
{
  void *v2;
  unint64_t v3;

  -[SBIconView customIconImageViewController](self, "customIconImageViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v3 = objc_msgSend(v2, "presentationMode");
  else
    v3 = 0;

  return v3;
}

- (BOOL)isCancelingDrag
{
  return *((unsigned __int8 *)self + 555) >> 7;
}

- (BOOL)disallowCursorInteraction
{
  return (*((unsigned __int8 *)self + 558) >> 3) & 1;
}

- (unint64_t)contentVisibility
{
  unint64_t v2;

  v2 = ((unint64_t)*((unsigned __int8 *)self + 559) >> 5) & 3;
  if (!(_DWORD)v2)
    return -[SBIconView isPaused](self, "isPaused");
  return v2;
}

- (void)setContentVisibility:(unint64_t)a3
{
  unint64_t v3;
  id v6;

  v3 = *((unsigned __int8 *)self + 559);
  if (((v3 >> 5) & 3) != a3)
  {
    *((_BYTE *)self + 559) = v3 & 0x9F | (32 * (a3 & 3));
    -[SBIconView setPaused:forReason:](self, "setPaused:forReason:", a3 != 0, 16);
    -[SBIconImageView setContentVisibility:](self->_iconImageView, "setContentVisibility:", a3);
    -[SBIconView customIconImageViewController](self, "customIconImageViewController");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v6, "setContentVisibility:", a3);

  }
}

- (BOOL)showsSquareCorners
{
  return (*((unsigned __int8 *)self + 557) >> 4) & 1;
}

- (double)_continuousCornerRadius
{
  double result;

  if ((*((_BYTE *)self + 557) & 0x10) != 0)
    return 0.0;
  -[SBIconView iconImageCornerRadius](self, "iconImageCornerRadius");
  return result;
}

- (void)setListLayoutProvider:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  SBIconListLayoutProvider *v7;
  SBIconViewCustomImageViewControlling *v8;
  SBCloseBoxView *closeBox;
  void *v10;
  _QWORD v11[5];
  _QWORD v12[5];

  v4 = a4;
  v7 = (SBIconListLayoutProvider *)a3;
  if (self->_listLayoutProvider != v7)
  {
    objc_storeStrong((id *)&self->_listLayoutProvider, a3);
    v8 = self->_customIconImageViewController;
    if (v4)
    {
      -[SBIconImageView willAnimateIconImageInfoChange](self->_iconImageView, "willAnimateIconImageInfoChange");
      v11[4] = self;
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __45__SBIconView_setListLayoutProvider_animated___block_invoke;
      v12[3] = &unk_1E8D84C50;
      v12[4] = self;
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __45__SBIconView_setListLayoutProvider_animated___block_invoke_2;
      v11[3] = &unk_1E8D84F68;
      objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:completion:", v12, v11, 0.3);
    }
    else
    {
      -[SBIconView _updateFrameToIconViewSize](self, "_updateFrameToIconViewSize");
      -[SBIconImageView iconImageInfoDidChange](self->_iconImageView, "iconImageInfoDidChange");
    }
    -[SBIconView _updateLabelAnimated:](self, "_updateLabelAnimated:", v4);
    -[SBIconView _destroyAccessoryView](self, "_destroyAccessoryView");
    -[SBIconView _updateAccessoryViewAnimated:](self, "_updateAccessoryViewAnimated:", 0);
    closeBox = self->_closeBox;
    -[SBIconView listLayout](self, "listLayout");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBCloseBoxView setListLayout:](closeBox, "setListLayout:", v10);

    -[SBIconView iconImageInfo](self, "iconImageInfo");
    -[SBIconViewCustomImageViewControlling setIconImageInfo:](v8, "setIconImageInfo:");
    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[SBIconViewCustomImageViewControlling setListLayoutProvider:](v8, "setListLayoutProvider:", v7);

  }
}

uint64_t __45__SBIconView_setListLayoutProvider_animated___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "_updateFrameToIconViewSize");
  result = objc_msgSend(*(id *)(a1 + 32), "shouldAnimateFrameOfIconImageView");
  if ((_DWORD)result)
  {
    objc_msgSend(*(id *)(a1 + 32), "_frameForImageView");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 432), "sbf_setBoundsAndPositionFromFrame:");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 432), "iconImageInfoDidChange");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 432), "layoutIfNeeded");
    return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
  }
  return result;
}

uint64_t __45__SBIconView_setListLayoutProvider_animated___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 432), "didAnimateIconImageInfoChange");
}

- (BOOL)allowsContextMenus
{
  return -[NSHashTable count](self->_forbidContextMenusAssertions, "count") == 0;
}

- (id)disallowContextMenusForReason:(id)a3
{
  id v4;
  SBIconViewAssertion *v5;
  void *v6;
  SBIconViewAssertion *v7;
  NSHashTable *forbidContextMenusAssertions;
  NSHashTable *v9;
  NSHashTable *v10;
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = [SBIconViewAssertion alloc];
  v12 = CFSTR("reason");
  v13[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[SBIconViewAssertion initWithAssertionType:iconView:extraInfo:](v5, "initWithAssertionType:iconView:extraInfo:", 3, self, v6);

  forbidContextMenusAssertions = self->_forbidContextMenusAssertions;
  if (!forbidContextMenusAssertions)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v9 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
    v10 = self->_forbidContextMenusAssertions;
    self->_forbidContextMenusAssertions = v9;

    forbidContextMenusAssertions = self->_forbidContextMenusAssertions;
  }
  -[NSHashTable addObject:](forbidContextMenusAssertions, "addObject:", v7);
  if (-[SBIconView isShowingContextMenu](self, "isShowingContextMenu"))
    -[SBIconView dismissContextMenuWithCompletion:](self, "dismissContextMenuWithCompletion:", 0);

  return v7;
}

- (void)removeForbidContextMenusAssertion:(id)a3
{
  -[NSHashTable removeObject:](self->_forbidContextMenusAssertions, "removeObject:", a3);
}

- (void)performAfterContextMenusDismissUsingBlock:(id)a3
{
  NSMutableArray *performAfterContextMenuBlocks;
  void *v5;
  void *v6;
  void (**v7)(void);

  v7 = (void (**)(void))a3;
  if (-[SBIconView isShowingContextMenu](self, "isShowingContextMenu"))
  {
    performAfterContextMenuBlocks = self->_performAfterContextMenuBlocks;
    v5 = (void *)objc_msgSend(v7, "copy");

    v6 = _Block_copy(v5);
    -[NSMutableArray addObject:](performAfterContextMenuBlocks, "addObject:", v6);

    v7 = (void (**)(void))v5;
  }
  else
  {
    v7[2]();
  }

}

- (SBIconContinuityItem)continuityItem
{
  void *v3;
  void *v4;

  if (os_variant_has_internal_content() && -[SBIconView _debugContinuity](self, "_debugContinuity"))
  {
    objc_msgSend((id)objc_opt_class(), "debugContinuityItem");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[SBIconView continuityInfo](self, "continuityInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[SBIconContinuityItem itemForContinuityInfo:](SBIconContinuityItem, "itemForContinuityInfo:", v4);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (SBIconContinuityItem *)v3;
}

- (UIImage)iconImageSnapshot
{
  return (UIImage *)-[SBIconImageView snapshot](self->_iconImageView, "snapshot");
}

- (UIView)iconImageSnapshotView
{
  void *crossfadeView;
  char v4;
  void *v5;
  void *v7;
  uint64_t v8;

  crossfadeView = self->_crossfadeView;
  if (!crossfadeView)
  {
    v4 = objc_opt_respondsToSelector();
    crossfadeView = self->_customIconImageViewController;
    if ((v4 & 1) == 0)
    {
      if (crossfadeView)
      {
        objc_msgSend(crossfadeView, "view");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "snapshotView");
        v8 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        -[SBIconImageView snapshot](self->_iconImageView, "snapshot");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v7)
        {
          v5 = 0;
          goto LABEL_10;
        }
        v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v7);
      }
      v5 = (void *)v8;
LABEL_10:

      return (UIView *)v5;
    }
  }
  objc_msgSend(crossfadeView, "snapshotView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  return (UIView *)v5;
}

- (CGPoint)iconImageCenter
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGPoint result;

  -[SBIconView currentImageView](self, "currentImageView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "center");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.y = v8;
  result.x = v7;
  return result;
}

- (CGSize)iconImageVisibleSize
{
  SBIconImageView *iconImageView;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  CGFloat v12;
  double v13;
  double v14;
  double v15;
  CGAffineTransform v16;
  CGSize result;

  iconImageView = self->_iconImageView;
  if (iconImageView)
  {
    -[SBIconImageView visibleBounds](iconImageView, "visibleBounds");
    v5 = v4;
    v7 = v6;
  }
  else
  {
    -[SBIconView currentImageView](self, "currentImageView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bounds");
    v5 = v9;
    v7 = v10;

  }
  -[SBIconView iconContentScale](self, "iconContentScale");
  v12 = v11;
  if ((BSFloatIsOne() & 1) == 0)
  {
    CGAffineTransformMakeScale(&v16, v12, v12);
    v13 = v7 * v16.c;
    v7 = v7 * v16.d + v16.b * v5;
    v5 = v13 + v16.a * v5;
  }
  v14 = v5;
  v15 = v7;
  result.height = v15;
  result.width = v14;
  return result;
}

- (CGRect)iconImageVisibleFrame
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGRect result;

  -[SBIconView iconImageVisibleSize](self, "iconImageVisibleSize");
  -[SBIconView iconImageFrame](self, "iconImageFrame");
  -[SBIconView _screen](self, "_screen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scale");

  UIRectCenteredIntegralRectScale();
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (void)setIconImageAndAccessoryAlpha:(double)a3
{
  -[SBIconView setIconImageAlpha:](self, "setIconImageAlpha:");
  -[SBIconView setIconAccessoryAlpha:](self, "setIconAccessoryAlpha:", a3);
}

+ (double)iconLiftAlpha
{
  return 1.0;
}

- (void)_setForcingIconContentScalingEnabled:(BOOL)a3
{
  char v3;
  char v4;

  v3 = *((_BYTE *)self + 555);
  if (((((v3 & 0x10) == 0) ^ a3) & 1) == 0)
  {
    if (a3)
      v4 = 16;
    else
      v4 = 0;
    *((_BYTE *)self + 555) = v3 & 0xEF | v4;
    -[SBIconView _toggleContentContainerViewIfNecessary](self, "_toggleContentContainerViewIfNecessary");
  }
}

- (double)effectiveIconContentScale
{
  double result;

  if (!-[SBIconView isIconContentScalingEnabled](self, "isIconContentScalingEnabled"))
    return 1.0;
  -[SBIconView iconContentScale](self, "iconContentScale");
  return result;
}

- (BOOL)_shouldHaveContentContainerView
{
  return objc_msgSend((id)objc_opt_class(), "_shouldAlwaysHaveContentContainerView");
}

- (void)_toggleContentContainerViewIfNecessary
{
  _BOOL4 v3;
  UIView *scalingContainer;
  BOOL v5;
  char v6;

  v3 = -[SBIconView _shouldHaveContentContainerView](self, "_shouldHaveContentContainerView");
  scalingContainer = self->_scalingContainer;
  if (scalingContainer)
    v5 = 1;
  else
    v5 = !v3;
  if (v5)
  {
    if (scalingContainer)
      v6 = v3;
    else
      v6 = 1;
    if ((v6 & 1) == 0)
      -[SBIconView _disableContentContainerView](self, "_disableContentContainerView");
  }
  else
  {
    -[SBIconView _enableContentContainerView](self, "_enableContentContainerView");
  }
}

- (void)_enableContentContainerView
{
  void *v3;
  _QWORD v4[5];

  if (!self->_scalingContainer)
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __41__SBIconView__enableContentContainerView__block_invoke;
    v4[3] = &unk_1E8D84C50;
    v4[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v4);
    -[SBIconView iconContentScale](self, "iconContentScale");
    -[SBIconView _applyIconContentScale:](self, "_applyIconContentScale:");
    -[SBIconView layer](self, "layer");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setAllowsGroupBlending:", 1);

    -[SBIconView _toggleGroupBlendingIfNecessary](self, "_toggleGroupBlendingIfNecessary");
  }
}

uint64_t __41__SBIconView__enableContentContainerView__block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "contentContainerViewClass"));
  objc_msgSend(*(id *)(a1 + 32), "bounds");
  v3 = objc_msgSend(v2, "initWithFrame:");
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 576);
  *(_QWORD *)(v4 + 576) = v3;

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "subviews", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 576), "addSubview:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v10++));
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

  return objc_msgSend(*(id *)(a1 + 32), "addSubview:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 576));
}

- (void)_disableContentContainerView
{
  UIView *scalingContainer;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  UIView *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  scalingContainer = self->_scalingContainer;
  if (scalingContainer)
  {
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    -[UIView subviews](scalingContainer, "subviews", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v11;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v11 != v7)
            objc_enumerationMutation(v4);
          -[SBIconView addSubview:](self, "addSubview:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v8++));
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v6);
    }

    -[UIView removeFromSuperview](self->_scalingContainer, "removeFromSuperview");
    v9 = self->_scalingContainer;
    self->_scalingContainer = 0;

    -[SBIconView _toggleGroupBlendingIfNecessary](self, "_toggleGroupBlendingIfNecessary");
  }
}

- (void)_updateIconContentScale
{
  double v3;
  double v4;
  double v5;
  _BOOL4 v6;
  BOOL v7;
  double v8;

  v3 = 1.0;
  v4 = 1.0;
  if (-[SBIconView isIconContentScalingEnabled](self, "isIconContentScalingEnabled"))
  {
    -[SBIconView iconContentScale](self, "iconContentScale");
    v4 = v5;
  }
  v6 = -[SBIconView isDragLifted](self, "isDragLifted");
  v7 = -[SBIconView isShowingContextMenu](self, "isShowingContextMenu");
  if (v6 && !v7)
  {
    -[SBIconView _additionalLiftScale](self, "_additionalLiftScale");
    v3 = v8;
  }
  -[SBIconView _applyIconContentScale:](self, "_applyIconContentScale:", v4 * v3);
}

- (void)_applyIconContentScale:(double)a3
{
  UIView *scalingContainer;
  CGAffineTransform *v6;
  __int128 v7;
  UIView *v8;
  CGAffineTransform v9;
  CGAffineTransform v10;

  if ((BSFloatIsOne() & 1) != 0 || !-[SBIconView isIconContentScalingEnabled](self, "isIconContentScalingEnabled"))
  {
    scalingContainer = self->_scalingContainer;
    v7 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    *(_OWORD *)&v10.a = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)&v10.c = v7;
    *(_OWORD *)&v10.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    v6 = &v10;
  }
  else
  {
    memset(&v10, 0, sizeof(v10));
    CGAffineTransformMakeScale(&v10, a3, a3);
    scalingContainer = self->_scalingContainer;
    v9 = v10;
    v6 = &v9;
  }
  -[UIView setTransform:](scalingContainer, "setTransform:", v6, *(_OWORD *)&v9.a, *(_OWORD *)&v9.c, *(_OWORD *)&v9.tx, *(_QWORD *)&v10.a, *(_QWORD *)&v10.b, *(_QWORD *)&v10.c, *(_QWORD *)&v10.d, *(_QWORD *)&v10.tx, *(_QWORD *)&v10.ty);
  -[SBIconView bounds](self, "bounds");
  -[UIView setBounds:](self->_scalingContainer, "setBounds:");
  v8 = self->_scalingContainer;
  UIRectGetCenter();
  -[UIView setCenter:](v8, "setCenter:");
}

- (double)_additionalLiftScale
{
  void *v3;
  double v4;
  double v5;

  -[SBIconView dragDelegate](self, "dragDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "additionalDragLiftScaleForIconView:", self);
    v5 = v4;
  }
  else
  {
    v5 = 1.1;
  }

  return v5;
}

- (BOOL)isDragLifted
{
  return (*((unsigned __int8 *)self + 556) >> 2) & 1;
}

- (void)_acquireHomeButtonPressConsumingAssertionIfNecessary
{
  void *v3;
  void *v4;
  id v5;

  if ((__sb__runningInSpringBoard() & 1) == 0)
  {
    -[SBIconView homeButtonPressConsumingAssertion](self, "homeButtonPressConsumingAssertion");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v3)
    {
      objc_msgSend(MEMORY[0x1E0DAAE70], "sharedInstance");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "beginConsumingPressesForButtonKind:eventConsumer:priority:", 1, self, 0);
      v5 = (id)objc_claimAutoreleasedReturnValue();

      -[SBIconView setHomeButtonPressConsumingAssertion:](self, "setHomeButtonPressConsumingAssertion:", v5);
    }
  }
}

- (id)_visiblyActiveDataSource
{
  void *v3;
  void *v4;
  void *v5;

  -[SBIconView customIconImageViewController](self, "customIconImageViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "visiblyActiveDataSource");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[SBIconView icon](self, "icon");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "isLeafIcon"))
    {
      objc_msgSend(v5, "activeDataSource");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v4 = 0;
    }

  }
  return v4;
}

- (id)configurationUIDelegate
{
  id v3;
  void *v4;

  -[SBIconView delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "configurationUIDelegateForIconView:", self);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (BOOL)supportsConfigurationCard
{
  void *v3;
  void *v4;
  char v5;

  -[SBIconView configurationUIDelegate](self, "configurationUIDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[SBIconView _visiblyActiveDataSource](self, "_visiblyActiveDataSource");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
      v5 = objc_msgSend(v3, "iconView:supportsConfigurationForDataSource:", self, v4);
    else
      v5 = 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)supportsStackConfigurationCard
{
  void *v2;
  char v3;

  -[SBIconView icon](self, "icon");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "supportsStackConfiguration");

  return v3;
}

- (BOOL)isShowingStackConfigurationCard
{
  void *v2;
  BOOL v3;

  -[SBIconView currentStackConfigurationInteraction](self, "currentStackConfigurationInteraction");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (void)presentConfigurationCard
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;

  -[SBIconView currentConfigurationInteraction](self, "currentConfigurationInteraction");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[SBIconView configurationUIDelegate](self, "configurationUIDelegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[SBIconView _visiblyActiveDataSource](self, "_visiblyActiveDataSource");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5)
      {
        objc_msgSend(v4, "iconView:configurationInteractionForDataSource:", self, v5);
        v7 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setDelegate:", self);
        -[SBIconView setCurrentConfigurationInteraction:](self, "setCurrentConfigurationInteraction:", v7);
      }
      else
      {
        v7 = 0;
      }

    }
    else
    {
      v7 = 0;
    }

    v3 = v7;
  }
  v8 = v3;
  objc_msgSend(v3, "beginConfiguration");
  objc_msgSend(MEMORY[0x1E0DA9D78], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "emitEvent:", 58);

}

- (void)presentStackConfigurationCard
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  id v18;

  -[SBIconView currentStackConfigurationInteraction](self, "currentStackConfigurationInteraction");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_class();
  v5 = v3;
  if (v4)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;
  }
  else
  {
    v6 = 0;
  }
  v16 = v6;

  v7 = v16;
  if (!v16)
  {
    -[SBIconView currentConfigurationInteraction](self, "currentConfigurationInteraction");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v7 = 0;
    }
    else
    {
      -[SBIconView configurationUIDelegate](self, "configurationUIDelegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v9, "stackConfigurationInteractionForIconView:", self);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_opt_class();
        v12 = v10;
        if (v11)
        {
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v13 = v12;
          else
            v13 = 0;
        }
        else
        {
          v13 = 0;
        }
        v14 = v13;

        v17 = v14;
        objc_msgSend(v17, "setDelegate:", self);
        -[SBIconView setCurrentStackConfigurationInteraction:](self, "setCurrentStackConfigurationInteraction:", v17);

      }
      else
      {
        v17 = 0;
      }

      v7 = v17;
    }
  }
  v18 = v7;
  objc_msgSend(v7, "beginConfiguration");
  objc_msgSend(MEMORY[0x1E0DA9D78], "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "emitEvent:", 59);

}

- (void)popStackConfigurationCard
{
  id v2;

  -[SBIconView currentStackConfigurationInteraction](self, "currentStackConfigurationInteraction");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "popConfiguration");

}

- (void)dismissStackConfigurationCard
{
  id v2;

  -[SBIconView currentStackConfigurationInteraction](self, "currentStackConfigurationInteraction");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "endConfiguration");

}

- (void)popConfigurationCard
{
  id v2;

  -[SBIconView currentConfigurationInteraction](self, "currentConfigurationInteraction");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "popConfiguration");

}

- (void)dismissConfigurationCard
{
  id v2;

  -[SBIconView currentConfigurationInteraction](self, "currentConfigurationInteraction");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "endConfiguration");

}

- (id)containerViewControllerForConfigurationInteraction:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[SBIconView configurationUIDelegate](self, "configurationUIDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v5, "iconView:containerViewControllerForConfigurationInteraction:", self, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)containerViewForConfigurationInteraction:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[SBIconView configurationUIDelegate](self, "configurationUIDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v5, "iconView:containerViewForConfigurationInteraction:", self, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[SBIconView containerViewControllerForConfigurationInteraction:](self, "containerViewControllerForConfigurationInteraction:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v7;
  }

  return v6;
}

- (CGRect)contentBoundingRectForConfigurationInteraction:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  CGRect result;

  v4 = a3;
  -[SBIconView configurationUIDelegate](self, "configurationUIDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v5, "iconView:contentBoundingRectForConfigurationInteraction:", self, v4);
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;
  }
  else
  {
    -[SBIconView containerViewForConfigurationInteraction:](self, "containerViewForConfigurationInteraction:", v4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "bounds");
    v7 = v15;
    v9 = v16;
    v11 = v17;
    v13 = v18;
    v4 = v14;
  }

  v19 = v7;
  v20 = v9;
  v21 = v11;
  v22 = v13;
  result.size.height = v22;
  result.size.width = v21;
  result.origin.y = v20;
  result.origin.x = v19;
  return result;
}

- (int64_t)userInterfaceStyleForConfigurationInteraction:(id)a3
{
  id v4;
  void *v5;
  int64_t v6;
  void *v7;

  v4 = a3;
  -[SBIconView configurationUIDelegate](self, "configurationUIDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v6 = objc_msgSend(v5, "iconView:userInterfaceStyleForConfigurationInteraction:", self, v4);
  }
  else
  {
    -[SBIconView traitCollection](self, "traitCollection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v7, "userInterfaceStyle");

  }
  return v6;
}

- (id)homeScreenContentViewForConfigurationInteraction:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[SBIconView configurationUIDelegate](self, "configurationUIDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v5, "iconView:homeScreenContentViewForConfigurationInteraction:", self, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)configurationInteractionWillBegin:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[SBIconView _updateIconImageAdornmentsAnimated:](self, "_updateIconImageAdornmentsAnimated:", 0);
    -[SBIconView setAllowsEditingAnimation:](self, "setAllowsEditingAnimation:", 0);
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[SBIconView _updateIconImageAdornmentsAnimated:](self, "_updateIconImageAdornmentsAnimated:", 0);
    -[SBIconView setAllowsEditingAnimation:](self, "setAllowsEditingAnimation:", 0);
  }
  -[SBIconView configurationUIDelegate](self, "configurationUIDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "iconView:configurationWillBeginWithInteraction:", self, v5);

}

- (void)configurationInteractionDidBegin:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[SBIconView configurationUIDelegate](self, "configurationUIDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "iconView:configurationDidBeginWithInteraction:", self, v5);

}

- (void)configurationInteractionDidCommit:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[SBIconView configurationUIDelegate](self, "configurationUIDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "iconView:configurationDidUpdateWithInteraction:", self, v5);

}

- (void)configurationInteractionWillEnd:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[SBIconView configurationUIDelegate](self, "configurationUIDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "iconView:configurationWillEndWithInteraction:", self, v5);

}

- (void)configurationInteractionDidEnd:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[SBIconView setCurrentConfigurationInteraction:](self, "setCurrentConfigurationInteraction:", 0);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[SBIconView setCurrentStackConfigurationInteraction:](self, "setCurrentStackConfigurationInteraction:", 0);
  -[SBIconView _updateIconImageAdornmentsAnimated:](self, "_updateIconImageAdornmentsAnimated:", 1);
  -[SBIconView setAllowsEditingAnimation:](self, "setAllowsEditingAnimation:", 1);
  -[SBIconView configurationUIDelegate](self, "configurationUIDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "iconView:configurationDidEndWithInteraction:", self, v5);

}

- (double)verticalMarginPercentageForConfigurationInteraction:(id)a3
{
  void *v4;
  double v5;
  double v6;

  -[SBIconView configurationUIDelegate](self, "configurationUIDelegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -1.0;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v4, "verticalMarginPercentageForConfigurationOfIconView:", self);
    v5 = v6;
  }

  return v5;
}

- (id)newCaptureOnlyBackgroundView
{
  void (**v3)(void);
  void *v4;
  void (**v5)(_QWORD, _QWORD, _QWORD);
  void *v6;
  id v7;

  -[SBIconViewCustomImageViewControlling backgroundViewProvider](self->_customIconImageViewController, "backgroundViewProvider");
  v3 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v3[2]();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[SBIconViewCustomImageViewControlling backgroundViewConfigurator](self->_customIconImageViewController, "backgroundViewConfigurator");
      v5 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      if (v5 && (objc_opt_respondsToSelector() & 1) != 0)
      {
        -[SBIconViewCustomImageViewControlling visiblyActiveDataSource](self->_customIconImageViewController, "visiblyActiveDataSource");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        if (v6)
          ((void (**)(_QWORD, void *, void *))v5)[2](v5, v4, v6);

      }
    }
    else
    {
      v5 = 0;
    }
    objc_msgSend(v4, "setCaptureOnly:", 1);
    v7 = v4;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)representativeIconViewForModalInteractions
{
  unint64_t v3;
  void *v4;
  void *v5;

  v3 = -[SBIconView configurationOptions](self, "configurationOptions");
  UIAccessibilityIsReduceMotionEnabled();
  objc_opt_self();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)objc_msgSend(objc_alloc((Class)v4), "initWithConfigurationOptions:", v3 | 0x14);
  objc_msgSend(v5, "configureBorrowingIconImageViewFromIconView:", self);
  objc_msgSend(v5, "setEditing:", 0);
  objc_msgSend(v5, "setAllowsEditingAnimation:", 0);
  -[SBIconView iconImageInfo](self, "iconImageInfo");
  objc_msgSend(v5, "setIconImageInfo:");
  -[SBIconView bounds](self, "bounds");
  objc_msgSend(v5, "setFrame:");
  objc_msgSend(v5, "layoutIfNeeded");
  return v5;
}

- (BOOL)sharesIconTintColorWithSpringBoard
{
  return (*((unsigned __int8 *)self + 559) >> 4) & 1;
}

- (void)setSharesIconTintColorWithSpringBoard:(BOOL)a3
{
  char v3;
  _BOOL4 v4;
  char v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = *((_BYTE *)self + 559);
  if (((((v3 & 0x10) == 0) ^ a3) & 1) == 0)
  {
    v4 = a3;
    if (a3)
      v6 = 16;
    else
      v6 = 0;
    *((_BYTE *)self + 559) = v3 & 0xEF | v6;
    -[SBIconView springBoardIconStyleObservation](self, "springBoardIconStyleObservation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v7;
    if (v4 && (v8 = __sb__runningInSpringBoard(), v7 = v11, (v8 & 1) == 0))
    {
      objc_msgSend((id)objc_opt_class(), "homeScreenService");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addHomeScreenIconStyleObserver:", self);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBIconView setSpringBoardIconStyleObservation:](self, "setSpringBoardIconStyleObservation:", v10);

    }
    else
    {
      if (!v7)
      {
LABEL_11:

        return;
      }
      objc_msgSend(v7, "invalidate");
      -[SBIconView setSpringBoardIconStyleObservation:](self, "setSpringBoardIconStyleObservation:", 0);
    }
    v7 = v11;
    goto LABEL_11;
  }
}

- (void)homeScreenService:(id)a3 homeScreenIconStyleConfigurationDidChange:(id)a4
{
  id v4;
  void *v5;

  objc_msgSend(a4, "sbh_iconImageStyleConfiguration", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v5;
  BSDispatchMain();

}

void __74__SBIconView_homeScreenService_homeScreenIconStyleConfigurationDidChange___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "setSpringBoardIconImageStyleConfiguration:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "traitOverrides");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(_QWORD *)(a1 + 40);
  objc_opt_self();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forTrait:", v2, v3);

}

+ (BOOL)showsPopovers
{
  void *v2;
  char v3;

  +[SBHHomeScreenDomain rootSettings](SBHHomeScreenDomain, "rootSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "showPopOvers");

  return v3;
}

- (BOOL)_hasPopover
{
  int v3;
  BOOL v4;
  void *v5;
  void *v6;
  __int16 v7;

  if (!objc_msgSend((id)objc_opt_class(), "showsPopovers"))
    return 0;
  v3 = (*(unsigned __int16 *)((char *)self + 557) >> 7) & 3;
  if (v3)
    return v3 == 1;
  -[SBIconView applicationBundleIdentifierForShortcuts](self, "applicationBundleIdentifierForShortcuts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconView recentsDocumentExtensionProvider](self, "recentsDocumentExtensionProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "canShowRecentsDocumentExtensionProviderForBundleIdentifier:", v5))
    v7 = 128;
  else
    v7 = 256;
  *(_WORD *)((char *)self + 557) = *(_WORD *)((char *)self + 557) & 0xFE7F | v7;

  v4 = (*(_WORD *)((char *)self + 557) & 0x180) == 128;
  return v4;
}

- (id)recentsDocumentExtensionProvider
{
  SBHRecentsDocumentExtensionProvider *recentsDocumentExtensionProvider;
  SBHRecentsDocumentExtensionProvider *v4;
  void *v5;
  SBHRecentsDocumentExtensionProvider *v6;
  SBHRecentsDocumentExtensionProvider *v7;
  SBHRecentsDocumentExtensionProvider *v8;

  if (objc_msgSend((id)objc_opt_class(), "showsPopovers"))
  {
    recentsDocumentExtensionProvider = self->_recentsDocumentExtensionProvider;
    if (recentsDocumentExtensionProvider)
    {
      v4 = recentsDocumentExtensionProvider;
    }
    else
    {
      -[SBIconView shortcutsDelegate](self, "shortcutsDelegate");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = self->_recentsDocumentExtensionProvider;
      if (!v6)
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v5, "recentDocumentExtensionProviderForIconView:", self);
          v7 = (SBHRecentsDocumentExtensionProvider *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v7 = objc_alloc_init(SBHRecentsDocumentExtensionProvider);
        }
        v8 = self->_recentsDocumentExtensionProvider;
        self->_recentsDocumentExtensionProvider = v7;

        -[SBHRecentsDocumentExtensionProvider setUsesIntrinsicContentSizeBasedOnScreenSize:](self->_recentsDocumentExtensionProvider, "setUsesIntrinsicContentSizeBasedOnScreenSize:", 1);
        v6 = self->_recentsDocumentExtensionProvider;
      }
      v4 = v6;

    }
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  NSObject *v9;
  SBIconViewContextMenuContext *v10;
  void *v11;
  BOOL v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  id v21;
  id v22;
  void *v24;
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;
  id v29;
  _QWORD v30[4];
  id v31;
  id v32;
  id v33;
  BOOL v34;
  uint8_t buf[4];
  const char *v36;
  __int16 v37;
  int v38;
  uint64_t v39;

  y = a4.y;
  x = a4.x;
  v39 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (objc_msgSend((id)objc_opt_class(), "supportsPreviewInteraction")
    && -[SBIconView allowsContextMenus](self, "allowsContextMenus"))
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[SBIconViewCustomImageViewControlling willShowContextMenuAtLocation:](self->_customIconImageViewController, "willShowContextMenuAtLocation:", x, y);
    -[SBIconView shortcutsDelegate](self, "shortcutsDelegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0
      && !objc_msgSend(v8, "iconViewShouldBeginShortcutsPresentation:", self))
    {
      v17 = 0;
    }
    else
    {
      if (-[NSHashTable count](self->_contextMenuInteractionConfigurations, "count"))
      {
        SBLogIconContextMenu();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          v36 = "-[SBIconView contextMenuInteraction:configurationForMenuAtLocation:]";
          v37 = 1024;
          v38 = 2557;
          _os_log_impl(&dword_1CFEF3000, v9, OS_LOG_TYPE_DEFAULT, "%s:%d Warning; there is already a context menu interaction in flight!!!",
            buf,
            0x12u);
        }

      }
      v10 = -[SBIconViewContextMenuContext initWithIconView:location:]([SBIconViewContextMenuContext alloc], "initWithIconView:location:", self, x, y);
      -[SBIconView applicationBundleIdentifierForShortcuts](self, "applicationBundleIdentifierForShortcuts");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBIconView recentsDocumentExtensionProvider](self, "recentsDocumentExtensionProvider");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = -[SBIconView _hasPopover](self, "_hasPopover");
      -[SBIconView effectiveApplicationShortcutItems](self, "effectiveApplicationShortcutItems");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v13, "count"))
        v14 = 1;
      else
        v14 = v12;

      if ((v14 & 1) != 0)
      {
        -[SBIconView applicationBundleURLForShortcuts](self, "applicationBundleURLForShortcuts");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15)
          v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D01700]), "initWithURL:", v15);
        else
          v16 = 0;
        objc_initWeak((id *)buf, self);
        v18 = (void *)MEMORY[0x1E0DC36B8];
        v19 = MEMORY[0x1E0C809B0];
        v30[0] = MEMORY[0x1E0C809B0];
        v30[1] = 3221225472;
        v30[2] = __68__SBIconView_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_2;
        v30[3] = &unk_1E8D8B7A0;
        objc_copyWeak(&v33, (id *)buf);
        v34 = v12;
        v31 = v11;
        v20 = v24;
        v32 = v20;
        v25[0] = v19;
        v25[1] = 3221225472;
        v25[2] = __68__SBIconView_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_3;
        v25[3] = &unk_1E8D8B868;
        objc_copyWeak(&v29, (id *)buf);
        v26 = v20;
        v21 = v15;
        v27 = v21;
        v22 = v16;
        v28 = v22;
        objc_msgSend(v18, "configurationWithIdentifier:previewProvider:actionProvider:", v10, v30, v25);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        objc_destroyWeak(&v29);
        objc_destroyWeak(&v33);
        objc_destroyWeak((id *)buf);

      }
      else
      {
        objc_msgSend(MEMORY[0x1E0DC36B8], "configurationWithIdentifier:previewProvider:actionProvider:", v10, 0, &__block_literal_global_241);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[SBIconView setLastContextMenuInteractionFailedToLoad:](self, "setLastContextMenuInteractionFailedToLoad:", 1);
      }
      objc_msgSend(v17, "setPreferredMenuElementOrder:", 1);

    }
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

uint64_t __68__SBIconView_contextMenuInteraction_configurationForMenuAtLocation___block_invoke()
{
  return 0;
}

id __68__SBIconView_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  void *v4;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained
    && *(_BYTE *)(a1 + 56)
    && (objc_msgSend(*(id *)(a1 + 32), "recentsDocumentViewControllerForBundleIdentifier:", *(_QWORD *)(a1 + 40)),
        (v3 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v4 = (void *)v3;
    v5 = (void *)objc_opt_new();
    objc_msgSend(v5, "setGroupNameBase:", CFSTR("SBIconView"));
    objc_msgSend(v5, "setBackgroundScale:", 0.05);
    objc_msgSend(v5, "setContentViewController:", v4);
    objc_msgSend(*(id *)(a1 + 32), "setDelegate:", v5);
    objc_msgSend(WeakRetained, "setLastContextMenuInteractionFailedToLoad:", 0);

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

id __68__SBIconView_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_3(id *a1, void *a2)
{
  id WeakRetained;
  void *v4;
  id v5;
  void (**v6)(void *, void *);
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char isKindOfClass;
  unint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  void *v24;
  void *v25;
  id *location;
  id v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _QWORD aBlock[4];
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  _QWORD v48[2];
  _BYTE v49[128];
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v29 = a2;
  WeakRetained = objc_loadWeakRetained(a1 + 7);
  if (!WeakRetained)
  {
    v25 = 0;
    goto LABEL_29;
  }
  v28 = WeakRetained;
  objc_msgSend(WeakRetained, "effectiveApplicationShortcutItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __68__SBIconView_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_4;
  aBlock[3] = &unk_1E8D8B840;
  v5 = v4;
  v42 = v5;
  location = &v47;
  objc_copyWeak(&v47, a1 + 7);
  v43 = a1[4];
  v44 = v28;
  v45 = a1[5];
  v46 = a1[6];
  v6 = (void (**)(void *, void *))_Block_copy(aBlock);
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v37, v50, 16);
  if (!v8)
    goto LABEL_18;
  v9 = *(_QWORD *)v38;
  do
  {
    for (i = 0; i != v8; ++i)
    {
      if (*(_QWORD *)v38 != v9)
        objc_enumerationMutation(v7);
      v11 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
      v6[2](v6, v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        objc_msgSend(v11, "type", location);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setAccessibilityIdentifier:", v13);

        if (+[SBHIconApplicationShortcutListComposer sbh_isDestructiveShortcutItem:](SBHIconApplicationShortcutListComposer, "sbh_isDestructiveShortcutItem:", v11))
        {
          objc_opt_self();
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          isKindOfClass = objc_opt_isKindOfClass();

          if ((isKindOfClass & 1) != 0)
            objc_msgSend(v12, "setAttributes:", 2);
        }
        v16 = +[SBHIconApplicationShortcutListComposer sbh_shortcutSectionForItem:](SBHIconApplicationShortcutListComposer, "sbh_shortcutSectionForItem:", v11);
        v17 = v32;
        if (v16)
        {
          v17 = v31;
          if (v16 != 1)
          {
            if (v16 != 2)
              goto LABEL_16;
            v17 = v30;
          }
        }
        objc_msgSend(v17, "addObject:", v12);
      }
LABEL_16:

    }
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v37, v50, 16);
  }
  while (v8);
LABEL_18:

  v18 = (void *)objc_msgSend(v32, "mutableCopy");
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v48[0] = v31;
  v48[1] = v30;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v48, 2);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v33, v49, 16);
  if (v20)
  {
    v21 = *(_QWORD *)v34;
    do
    {
      for (j = 0; j != v20; ++j)
      {
        if (*(_QWORD *)v34 != v21)
          objc_enumerationMutation(v19);
        v23 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * j);
        if (objc_msgSend(v23, "count", location))
        {
          objc_msgSend(MEMORY[0x1E0DC39D0], "menuWithTitle:image:identifier:options:children:", &stru_1E8D8E958, 0, 0, 1, v23);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "addObject:", v24);

        }
      }
      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v33, v49, 16);
    }
    while (v20);
  }

  objc_msgSend(MEMORY[0x1E0DC39D0], "menuWithTitle:children:", &stru_1E8D8E958, v18);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(location);
  WeakRetained = v28;
LABEL_29:

  return v25;
}

id __68__SBIconView_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  __CFString *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  int v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  void *v57;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  _QWORD v69[4];
  id v70;
  id v71;
  id v72[2];
  id v73;
  id v74;
  _QWORD v75[4];
  id v76;
  _QWORD v77[4];
  id v78;
  _QWORD v79[4];
  id v80;
  _QWORD v81[4];
  id v82;
  _QWORD v83[4];
  id v84;
  _QWORD v85[4];
  id v86;
  _QWORD aBlock[4];
  id v88;
  id v89[2];
  _QWORD v90[3];

  v90[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)objc_msgSend(*(id *)(a1 + 32), "indexOfObject:", v3);
  objc_msgSend(v3, "type");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v68, "isEqualToString:", CFSTR("com.apple.springboardhome.application-shortcut-item.change-widget-size")))
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __68__SBIconView_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_5;
    aBlock[3] = &unk_1E8D8B7C8;
    objc_copyWeak(v89, (id *)(a1 + 72));
    v89[1] = v4;
    v88 = *(id *)(a1 + 40);
    v67 = _Block_copy(aBlock);
    objc_msgSend(*(id *)(a1 + 48), "listLayout");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    SBHIconListLayoutSupportedIconGridSizeClasses(v63);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "supportedIconGridSizeClassesForResize");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "gridSizeClassSetByIntersectingWithGridSizeClassSet:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "icon");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "gridSizeClass");
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v6, "count") < 2)
    {
      v8 = 0;
LABEL_63:

      objc_destroyWeak(v89);
      goto LABEL_64;
    }
    v22 = (void *)MEMORY[0x1E0DC3888];
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v90[0] = v23;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v90, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "configurationWithPaletteColors:", v24);
    v61 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithPointSize:", 21.0);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "configurationByApplyingConfiguration:", v61);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "gridSizeClassDomain");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "containsGridSizeClass:inDomain:", CFSTR("SBHIconGridSizeClassDefault"), v25))
    {
      objc_msgSend(v65, "applicationBundleID");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v65, "isWidgetStackIcon") & 1) != 0)
      {
        v27 = v26;
      }
      else
      {
        v28 = objc_msgSend(v65, "isWidgetIcon");
        if (v6)
          v29 = v28;
        else
          v29 = 0;
        if (v29 == 1)
        {
          objc_msgSend(v65, "activeDataSource");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            objc_msgSend(v30, "containerBundleIdentifier");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v27 = 0;
          }

        }
        else
        {
          v27 = v26;
        }
        if (!v27)
          goto LABEL_33;
        objc_msgSend(MEMORY[0x1E0DC3870], "_systemImageNamed:withConfiguration:", CFSTR("app.grid.2x2.topbackward.filled"), v64);
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = (void *)MEMORY[0x1E0DC3428];
        v85[0] = MEMORY[0x1E0C809B0];
        v85[1] = 3221225472;
        v85[2] = __68__SBIconView_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_7;
        v85[3] = &unk_1E8D8B7F0;
        v86 = v67;
        objc_msgSend(v31, "actionWithTitle:image:identifier:handler:", &stru_1E8D8E958, 0, CFSTR("com.apple.springboardhome.application-shortcut-item.change-widget-to-app-icon"), v85);
        v32 = v59;
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        if (v7 == CFSTR("SBHIconGridSizeClassDefault")
          || (v34 = -[__CFString isEqualToString:](v7, "isEqualToString:", CFSTR("SBHIconGridSizeClassDefault")),
              (_DWORD)v34))
        {
          objc_msgSend(v33, "setAttributes:", 1);
        }
        else
        {
          __68__SBIconView_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_6(0.35, v34, v59);
          v35 = objc_claimAutoreleasedReturnValue();

          v32 = (void *)v35;
        }
        objc_msgSend(v33, "setImage:", v32);
        objc_msgSend(v5, "addObject:", v33);

      }
    }
LABEL_33:
    if (objc_msgSend(v6, "containsGridSizeClass:inDomain:", CFSTR("SBHIconGridSizeClassSmall"), v25))
    {
      objc_msgSend(MEMORY[0x1E0DC3870], "_systemImageNamed:withConfiguration:", CFSTR("widget.small"), v64);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = (void *)MEMORY[0x1E0DC3428];
      v83[0] = MEMORY[0x1E0C809B0];
      v83[1] = 3221225472;
      v83[2] = __68__SBIconView_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_8;
      v83[3] = &unk_1E8D8B7F0;
      v84 = v67;
      objc_msgSend(v37, "actionWithTitle:image:identifier:handler:", &stru_1E8D8E958, 0, CFSTR("com.apple.springboardhome.application-shortcut-item.change-widget-size-small"), v83);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7 == CFSTR("SBHIconGridSizeClassSmall")
        || (v39 = -[__CFString isEqualToString:](v7, "isEqualToString:", CFSTR("SBHIconGridSizeClassSmall")), (_DWORD)v39))
      {
        objc_msgSend(v38, "setAttributes:", 1);
      }
      else
      {
        __68__SBIconView_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_6(0.35, v39, v36);
        v40 = objc_claimAutoreleasedReturnValue();

        v36 = (void *)v40;
      }
      objc_msgSend(v38, "setImage:", v36);
      objc_msgSend(v5, "addObject:", v38);

    }
    if (objc_msgSend(v6, "containsGridSizeClass:inDomain:", CFSTR("SBHIconGridSizeClassMedium"), v25))
    {
      objc_msgSend(MEMORY[0x1E0DC3870], "_systemImageNamed:withConfiguration:", CFSTR("widget.medium"), v64);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = (void *)MEMORY[0x1E0DC3428];
      v81[0] = MEMORY[0x1E0C809B0];
      v81[1] = 3221225472;
      v81[2] = __68__SBIconView_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_9;
      v81[3] = &unk_1E8D8B7F0;
      v82 = v67;
      objc_msgSend(v42, "actionWithTitle:image:identifier:handler:", &stru_1E8D8E958, 0, CFSTR("com.apple.springboardhome.application-shortcut-item.change-widget-size-medium"), v81);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7 == CFSTR("SBHIconGridSizeClassMedium")
        || (v44 = -[__CFString isEqualToString:](v7, "isEqualToString:", CFSTR("SBHIconGridSizeClassMedium")),
            (_DWORD)v44))
      {
        objc_msgSend(v43, "setAttributes:", 1);
      }
      else
      {
        __68__SBIconView_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_6(0.35, v44, v41);
        v45 = objc_claimAutoreleasedReturnValue();

        v41 = (void *)v45;
      }
      objc_msgSend(v43, "setImage:", v41);
      objc_msgSend(v5, "addObject:", v43);

    }
    if (objc_msgSend(v6, "containsGridSizeClass:inDomain:", CFSTR("SBHIconGridSizeClassLarge"), v25))
    {
      objc_msgSend(MEMORY[0x1E0DC3870], "_systemImageNamed:withConfiguration:", CFSTR("widget.large"), v64);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = (void *)MEMORY[0x1E0DC3428];
      v79[0] = MEMORY[0x1E0C809B0];
      v79[1] = 3221225472;
      v79[2] = __68__SBIconView_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_10;
      v79[3] = &unk_1E8D8B7F0;
      v80 = v67;
      objc_msgSend(v47, "actionWithTitle:image:identifier:handler:", CFSTR("L"), 0, CFSTR("com.apple.springboardhome.application-shortcut-item.change-widget-size-large"), v79);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7 == CFSTR("SBHIconGridSizeClassLarge")
        || (v49 = -[__CFString isEqualToString:](v7, "isEqualToString:", CFSTR("SBHIconGridSizeClassLarge")), (_DWORD)v49))
      {
        objc_msgSend(v48, "setAttributes:", 1);
      }
      else
      {
        __68__SBIconView_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_6(0.35, v49, v46);
        v50 = objc_claimAutoreleasedReturnValue();

        v46 = (void *)v50;
      }
      objc_msgSend(v48, "setImage:", v46);
      objc_msgSend(v5, "addObject:", v48);

    }
    if (objc_msgSend(v6, "containsGridSizeClass:inDomain:", CFSTR("SBHIconGridSizeClassExtraLarge"), v25))
    {
      objc_msgSend(MEMORY[0x1E0DC3870], "_systemImageNamed:withConfiguration:", CFSTR("widget.extralarge"), v64);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = (void *)MEMORY[0x1E0DC3428];
      v77[0] = MEMORY[0x1E0C809B0];
      v77[1] = 3221225472;
      v77[2] = __68__SBIconView_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_11;
      v77[3] = &unk_1E8D8B7F0;
      v78 = v67;
      objc_msgSend(v52, "actionWithTitle:image:identifier:handler:", CFSTR("XL"), 0, CFSTR("com.apple.springboardhome.application-shortcut-item.change-widget-size-extralarge"), v77);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7 == CFSTR("SBHIconGridSizeClassExtraLarge")
        || (v54 = -[__CFString isEqualToString:](v7, "isEqualToString:", CFSTR("SBHIconGridSizeClassExtraLarge")),
            (_DWORD)v54))
      {
        objc_msgSend(v53, "setAttributes:", 1);
      }
      else
      {
        __68__SBIconView_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_6(0.35, v54, v51);
        v55 = objc_claimAutoreleasedReturnValue();

        v51 = (void *)v55;
      }
      objc_msgSend(v53, "setImage:", v51);
      objc_msgSend(v5, "addObject:", v53);

    }
    if (objc_msgSend(v6, "containsGridSizeClass:inDomain:", CFSTR("SBHIconGridSizeClassNewsLargeTall"), v25))
    {
      v56 = (void *)MEMORY[0x1E0DC3428];
      v75[0] = MEMORY[0x1E0C809B0];
      v75[1] = 3221225472;
      v75[2] = __68__SBIconView_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_12;
      v75[3] = &unk_1E8D8B7F0;
      v76 = v67;
      objc_msgSend(v56, "actionWithTitle:image:identifier:handler:", CFSTR("LT"), 0, CFSTR("com.apple.springboardhome.application-shortcut-item.change-widget-size-newsLargeTall"), v75);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7 == CFSTR("SBHIconGridSizeClassNewsLargeTall")
        || -[__CFString isEqualToString:](v7, "isEqualToString:", CFSTR("SBHIconGridSizeClassNewsLargeTall")))
      {
        objc_msgSend(v57, "setAttributes:", 1);
      }
      objc_msgSend(v5, "addObject:", v57);

    }
    objc_msgSend(MEMORY[0x1E0DC39D0], "menuWithTitle:image:identifier:options:children:", &stru_1E8D8E958, 0, CFSTR("com.apple.springboardhome.application-shortcut-item.change-widget-size"), 129, v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setPreferredElementSize:", 0);

    goto LABEL_63;
  }
  v9 = *(_QWORD *)(a1 + 56);
  v73 = 0;
  v74 = 0;
  objc_msgSend(v3, "sb_buildIconImageWithApplicationBundleURL:image:systemImageName:", v9, &v74, &v73);
  v5 = v74;
  v10 = v73;
  objc_msgSend(v3, "localizedTitle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 64), "localizedStringForKey:value:table:", v11, 0, CFSTR("InfoPlist"));
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  if (v12)
    v14 = (void *)v12;
  else
    v14 = v11;
  v15 = v14;

  objc_msgSend(v3, "localizedSubtitle");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 64), "localizedStringForKey:value:table:", v16, 0, CFSTR("InfoPlist"));
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = (void *)v17;
  if (v17)
    v19 = (void *)v17;
  else
    v19 = v16;
  v20 = v19;

  v21 = (void *)MEMORY[0x1E0DC3428];
  v69[0] = MEMORY[0x1E0C809B0];
  v69[1] = 3221225472;
  v69[2] = __68__SBIconView_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_13;
  v69[3] = &unk_1E8D8B818;
  objc_copyWeak(v72, (id *)(a1 + 72));
  v70 = v3;
  v72[1] = v4;
  v71 = *(id *)(a1 + 40);
  objc_msgSend(v21, "actionWithTitle:image:identifier:handler:", v15, v5, 0, v69);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v20, "length"))
    objc_msgSend(v8, "setDiscoverabilityTitle:", v20);

  objc_destroyWeak(v72);
LABEL_64:

  return v8;
}

void __68__SBIconView_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_5(uint64_t a1, void *a2)
{
  id WeakRetained;
  id v4;
  id v5;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0DAADA0]);
    objc_msgSend(v4, "setType:", v5);
    if (objc_msgSend(WeakRetained, "shouldActivateApplicationShortcutItem:atIndex:", v4, *(_QWORD *)(a1 + 48)))objc_msgSend((id)objc_opt_class(), "activateShortcut:withBundleIdentifier:forIconView:", v4, *(_QWORD *)(a1 + 32), WeakRetained);

  }
}

id __68__SBIconView_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_6(double a1, uint64_t a2, void *a3)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (void *)MEMORY[0x1E0DC3658];
  v5 = a3;
  objc_msgSend(v4, "labelColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "colorWithAlphaComponent:", a1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "imageWithTintColor:renderingMode:", v7, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

uint64_t __68__SBIconView_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __68__SBIconView_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __68__SBIconView_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_9(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __68__SBIconView_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_10(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __68__SBIconView_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_11(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __68__SBIconView_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_12(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __68__SBIconView_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_13(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  int v4;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v5 = WeakRetained;
    v4 = objc_msgSend(WeakRetained, "shouldActivateApplicationShortcutItem:atIndex:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56));
    v3 = v5;
    if (v4)
    {
      objc_msgSend((id)objc_opt_class(), "activateShortcut:withBundleIdentifier:forIconView:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), v5);
      v3 = v5;
    }
  }

}

- (id)_contextMenuInteraction:(id)a3 overrideSuggestedActionsForConfiguration:(id)a4
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (id)_contextMenuInteraction:(id)a3 styleForMenuWithConfiguration:(id)a4
{
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DC40C8], "defaultStyle", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHasInteractivePreview:", 1);
  objc_msgSend(v5, "setPreferredLayout:", 1);
  objc_msgSend(v5, "setPreventPreviewRasterization:", 1);
  if (!-[SBIcon isWidgetIcon](self->_icon, "isWidgetIcon"))
    objc_msgSend(v5, "setPreviewOverlapsMenu:", 1);
  -[SBIconView window](self, "window");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "safeAreaInsets");
  v8 = v7;
  v10 = v9;

  v11 = 8.0;
  if (v8 < 8.0)
    v8 = 8.0;
  if (v10 < 8.0)
    v10 = 8.0;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[SBIconViewCustomImageViewControlling minimumPreferredEdgeInsetsForContextMenu](self->_customIconImageViewController, "minimumPreferredEdgeInsetsForContextMenu");
    UIEdgeInsetsMax();
    v8 = v13;
    v10 = v14;
    v11 = v15;
  }
  else
  {
    v12 = 8.0;
  }
  objc_msgSend(v5, "setPreferredEdgeInsets:", v8, v12, v10, v11);
  -[SBIconView shortcutsDelegate](self, "shortcutsDelegate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v16, "containerViewForPresentingContextMenuForIconView:", self);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[SBIconView window](self, "window");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "rootViewController");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "view");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v5, "setContainerView:", v17);
  if (UIAccessibilityIsReduceTransparencyEnabled())
  {
    v20 = (void *)MEMORY[0x1E0DC3660];
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.8);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "colorEffectColor:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = v22;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setPreferredBackgroundEffects:", v23);

  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v16, "iconView:willUseContextMenuStyle:", self, v5);

  return v5;
}

- (BOOL)_contextMenuInteractionShouldAllowDragAfterDismiss:(id)a3
{
  return 1;
}

- (id)contextMenuInteraction:(id)a3 configuration:(id)a4 highlightPreviewForItemWithIdentifier:(id)a5
{
  return -[SBIconView _contextMenuInteraction:previewForIconWithConfigurationOptions:highlighted:](self, "_contextMenuInteraction:previewForIconWithConfigurationOptions:highlighted:", a3, 18, 1);
}

- (id)contextMenuInteraction:(id)a3 configuration:(id)a4 dismissalPreviewForItemWithIdentifier:(id)a5
{
  return -[SBIconView _contextMenuInteraction:previewForIconWithConfigurationOptions:highlighted:](self, "_contextMenuInteraction:previewForIconWithConfigurationOptions:highlighted:", a3, 6, 0);
}

- (id)_contextMenuInteraction:(id)a3 previewForIconWithConfigurationOptions:(unint64_t)a4 highlighted:(BOOL)a5
{
  _BOOL8 v5;
  SBIconView *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  SBIconView *v23;
  void *v24;
  NSObject *v25;
  NSObject *v26;
  SBIcon *icon;
  id v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  _OWORD v46[3];
  uint8_t buf[4];
  SBIcon *v48;
  __int16 v49;
  void *v50;
  __int16 v51;
  SBIconView *v52;
  uint64_t v53;

  v5 = a5;
  v53 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "view");
  v7 = (SBIconView *)objc_claimAutoreleasedReturnValue();

  if (v7 != self)
  {
    SBLogIcon();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[SBIconView _contextMenuInteraction:previewForIconWithConfigurationOptions:highlighted:].cold.3(v8, v9, v10, v11, v12, v13, v14, v15);
LABEL_4:
    v16 = 0;
    goto LABEL_19;
  }
  -[SBIconView window](self, "window");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v17)
  {
    SBLogIcon();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[SBIconView _contextMenuInteraction:previewForIconWithConfigurationOptions:highlighted:].cold.1(v8, v31, v32, v33, v34, v35, v36, v37);
    goto LABEL_4;
  }
  -[SBIconView setHighlighted:](self, "setHighlighted:", v5);
  v8 = objc_alloc_init(MEMORY[0x1E0DC3B78]);
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSObject setBackgroundColor:](v8, "setBackgroundColor:", v18);

  -[SBIconView iconImageCenter](self, "iconImageCenter");
  v20 = v19;
  v22 = v21;
  v23 = self;
  -[SBIconView currentImageView](v23, "currentImageView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  SBLogIcon();
  v25 = objc_claimAutoreleasedReturnValue();
  v26 = v25;
  if (v24)
  {
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      icon = v23->_icon;
      *(_DWORD *)buf = 138412802;
      v48 = icon;
      v49 = 2112;
      v50 = v24;
      v51 = 2112;
      v52 = v23;
      _os_log_impl(&dword_1CFEF3000, v26, OS_LOG_TYPE_DEFAULT, "Configuring preview for icon '%@' w/ currentImageView '%@' contentContainerView '%@'", buf, 0x20u);
    }

    v28 = objc_alloc(MEMORY[0x1E0DC3B88]);
    -[SBIconView contentContainerView](v23, "contentContainerView");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v29;
    if (v29)
      objc_msgSend(v29, "transform");
    else
      memset(v46, 0, sizeof(v46));
    v26 = objc_msgSend(v28, "initWithContainer:center:transform:", v23, v46, v20, v22);

    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D90]), "initWithView:parameters:target:", v24, v8, v26);
    objc_msgSend(v16, "set_springboardPlatterStyle:", 1);
  }
  else
  {
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      -[SBIconView _contextMenuInteraction:previewForIconWithConfigurationOptions:highlighted:].cold.2(v26, v38, v39, v40, v41, v42, v43, v44);
    v16 = 0;
  }

LABEL_19:
  return v16;
}

- (void)contextMenuInteraction:(id)a3 willDisplayMenuForConfiguration:(id)a4 animator:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void (**v12)(_QWORD);
  _QWORD v13[5];
  id v14;
  _QWORD v15[5];
  id v16;
  void (**v17)(_QWORD);
  _QWORD aBlock[5];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __78__SBIconView_contextMenuInteraction_willDisplayMenuForConfiguration_animator___block_invoke;
  aBlock[3] = &unk_1E8D84C50;
  aBlock[4] = self;
  v12 = (void (**)(_QWORD))_Block_copy(aBlock);
  -[SBIconView _contextMenuConfigurationWillPresent:forInteraction:](self, "_contextMenuConfigurationWillPresent:forInteraction:", v9, v8);
  if (v10)
  {
    v15[0] = v11;
    v15[1] = 3221225472;
    v15[2] = __78__SBIconView_contextMenuInteraction_willDisplayMenuForConfiguration_animator___block_invoke_2;
    v15[3] = &unk_1E8D8B890;
    v15[4] = self;
    v16 = v8;
    v17 = v12;
    objc_msgSend(v10, "addAnimations:", v15);
    v13[0] = v11;
    v13[1] = 3221225472;
    v13[2] = __78__SBIconView_contextMenuInteraction_willDisplayMenuForConfiguration_animator___block_invoke_3;
    v13[3] = &unk_1E8D84EF0;
    v13[4] = self;
    v14 = v9;
    objc_msgSend(v10, "addCompletion:", v13);

  }
  else
  {
    -[SBIconView setHighlighted:](self, "setHighlighted:", 0);
    if (objc_msgSend(v8, "menuAppearance") != 2)
      v12[2](v12);
    -[SBIconView _contextMenuConfigurationDidPresent:](self, "_contextMenuConfigurationDidPresent:", v9);
  }

}

uint64_t __78__SBIconView_contextMenuInteraction_willDisplayMenuForConfiguration_animator___block_invoke(uint64_t a1)
{
  void *v1;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(v1, "effectiveIconLabelAlpha");
  return objc_msgSend(v1, "_applyIconLabelAlpha:");
}

uint64_t __78__SBIconView_contextMenuInteraction_willDisplayMenuForConfiguration_animator___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "setHighlighted:", 0);
  result = objc_msgSend(*(id *)(a1 + 40), "menuAppearance");
  if (result != 2)
    return objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:options:animations:completion:", 327680, *(_QWORD *)(a1 + 48), 0, 0.2, 0.0);
  return result;
}

uint64_t __78__SBIconView_contextMenuInteraction_willDisplayMenuForConfiguration_animator___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_contextMenuConfigurationDidPresent:", *(_QWORD *)(a1 + 40));
}

- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void (**v12)(_QWORD);
  void *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  _QWORD v17[4];
  void (**v18)(_QWORD);
  id location;
  _QWORD aBlock[5];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __70__SBIconView_contextMenuInteraction_willEndForConfiguration_animator___block_invoke;
  aBlock[3] = &unk_1E8D84C50;
  aBlock[4] = self;
  v12 = (void (**)(_QWORD))_Block_copy(aBlock);
  -[SBIconView _contextMenuConfigurationWillDismiss:](self, "_contextMenuConfigurationWillDismiss:", v9);
  if (v10)
  {
    objc_initWeak(&location, self);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "postNotificationName:object:userInfo:", CFSTR("SBIconViewWillAnimateContextMenuNotification"), self, 0);

    v17[0] = v11;
    v17[1] = 3221225472;
    v17[2] = __70__SBIconView_contextMenuInteraction_willEndForConfiguration_animator___block_invoke_2;
    v17[3] = &unk_1E8D859C0;
    v18 = v12;
    objc_msgSend(v10, "addAnimations:", v17);
    v14[0] = v11;
    v14[1] = 3221225472;
    v14[2] = __70__SBIconView_contextMenuInteraction_willEndForConfiguration_animator___block_invoke_3;
    v14[3] = &unk_1E8D88E90;
    objc_copyWeak(&v16, &location);
    v15 = v9;
    objc_msgSend(v10, "addCompletion:", v14);

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
  else
  {
    v12[2](v12);
    -[SBIconView _contextMenuConfigurationDidDismiss:](self, "_contextMenuConfigurationDidDismiss:", v9);
  }

}

uint64_t __70__SBIconView_contextMenuInteraction_willEndForConfiguration_animator___block_invoke(uint64_t a1)
{
  void *v1;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(v1, "effectiveIconLabelAlpha");
  return objc_msgSend(v1, "_applyIconLabelAlpha:");
}

uint64_t __70__SBIconView_contextMenuInteraction_willEndForConfiguration_animator___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:options:animations:completion:", 327680, *(_QWORD *)(a1 + 32), 0, 0.2, 0.0);
}

void __70__SBIconView_contextMenuInteraction_willEndForConfiguration_animator___block_invoke_3(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "postNotificationName:object:userInfo:", CFSTR("SBIconViewDidAnimateContextMenuNotification"), WeakRetained, 0);

    objc_msgSend(WeakRetained, "_contextMenuConfigurationDidDismiss:", *(_QWORD *)(a1 + 32));
  }

}

- (void)_contextMenuConfigurationWillPresent:(id)a3 forInteraction:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  NSHashTable *contextMenuInteractionConfigurations;
  NSHashTable *v12;
  NSHashTable *v13;
  OS_os_activity *v14;
  OS_os_activity *iconContextMenuActivity;
  NSMutableArray *v16;
  NSMutableArray *performAfterContextMenuBlocks;
  void *v18;
  void *v19;
  int v20;
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  SBLogIconContextMenu();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v8, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 136315906;
    v21 = "-[SBIconView _contextMenuConfigurationWillPresent:forInteraction:]";
    v22 = 1024;
    v23 = 3005;
    v24 = 2112;
    v25 = v10;
    v26 = 2112;
    v27 = v6;
    _os_log_impl(&dword_1CFEF3000, v9, OS_LOG_TYPE_DEFAULT, "%s:%d %@ (%@)", (uint8_t *)&v20, 0x26u);

  }
  objc_msgSend(v8, "setContextMenuInteraction:", v7);

  -[SBIconView _updateAllComponentAlphas](self, "_updateAllComponentAlphas");
  contextMenuInteractionConfigurations = self->_contextMenuInteractionConfigurations;
  if (!contextMenuInteractionConfigurations)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "hashTableWithOptions:", 0);
    v12 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
    v13 = self->_contextMenuInteractionConfigurations;
    self->_contextMenuInteractionConfigurations = v12;

    contextMenuInteractionConfigurations = self->_contextMenuInteractionConfigurations;
  }
  -[NSHashTable addObject:](contextMenuInteractionConfigurations, "addObject:", v6);
  if (!self->_iconContextMenuActivity)
  {
    v14 = (OS_os_activity *)_os_activity_create(&dword_1CFEF3000, "Icon Context Menu", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    iconContextMenuActivity = self->_iconContextMenuActivity;
    self->_iconContextMenuActivity = v14;

    os_activity_scope_enter((os_activity_t)self->_iconContextMenuActivity, &self->_iconContextMenuActivityState);
  }
  -[SBIconView _toggleContentContainerViewIfNecessary](self, "_toggleContentContainerViewIfNecessary");
  if (!self->_performAfterContextMenuBlocks)
  {
    v16 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    performAfterContextMenuBlocks = self->_performAfterContextMenuBlocks;
    self->_performAfterContextMenuBlocks = v16;

  }
  -[SBIconView shortcutsDelegate](self, "shortcutsDelegate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v18, "iconViewShortcutsPresentationWillBegin:", self);
  -[SBIconView _acquireHomeButtonPressConsumingAssertionIfNecessary](self, "_acquireHomeButtonPressConsumingAssertionIfNecessary");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "postNotificationName:object:", CFSTR("SBIconViewWillPresentContextMenuNotification"), self);

  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[SBIconViewCustomImageViewControlling setShowingContextMenu:](self->_customIconImageViewController, "setShowingContextMenu:", 1);

}

- (void)_contextMenuConfigurationDidPresent:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  SBLogIconContextMenu();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v5, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 136315906;
    v10 = "-[SBIconView _contextMenuConfigurationDidPresent:]";
    v11 = 1024;
    v12 = 3046;
    v13 = 2112;
    v14 = v7;
    v15 = 2112;
    v16 = v4;
    _os_log_impl(&dword_1CFEF3000, v6, OS_LOG_TYPE_DEFAULT, "%s:%d %@ (%@)", (uint8_t *)&v9, 0x26u);

  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "postNotificationName:object:", CFSTR("SBIconViewDidPresentContextMenuNotification"), self);

}

- (void)_contextMenuConfigurationWillDismiss:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  NSHashTable *dismissingContextMenuInteractionConfigurations;
  NSHashTable *v9;
  NSHashTable *v10;
  void *v11;
  SBHRecentsDocumentExtensionProvider *recentsDocumentExtensionProvider;
  void *v13;
  void *v14;
  int v15;
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  SBLogIconContextMenu();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v5, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 136315906;
    v16 = "-[SBIconView _contextMenuConfigurationWillDismiss:]";
    v17 = 1024;
    v18 = 3055;
    v19 = 2112;
    v20 = v7;
    v21 = 2112;
    v22 = v4;
    _os_log_impl(&dword_1CFEF3000, v6, OS_LOG_TYPE_DEFAULT, "%s:%d %@ (%@)", (uint8_t *)&v15, 0x26u);

  }
  dismissingContextMenuInteractionConfigurations = self->_dismissingContextMenuInteractionConfigurations;
  if (!dismissingContextMenuInteractionConfigurations)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "hashTableWithOptions:", 5);
    v9 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
    v10 = self->_dismissingContextMenuInteractionConfigurations;
    self->_dismissingContextMenuInteractionConfigurations = v9;

    dismissingContextMenuInteractionConfigurations = self->_dismissingContextMenuInteractionConfigurations;
  }
  -[NSHashTable addObject:](dismissingContextMenuInteractionConfigurations, "addObject:", v4);
  -[SBIconView shortcutsDelegate](self, "shortcutsDelegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v11, "iconViewShortcutsPresentationWillFinish:", self);
  -[SBIconView _invalidateHomeButtonPressConsumingAssertion](self, "_invalidateHomeButtonPressConsumingAssertion");
  recentsDocumentExtensionProvider = self->_recentsDocumentExtensionProvider;
  self->_recentsDocumentExtensionProvider = 0;

  objc_msgSend(v5, "contextMenuNotificationUserInfo");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "postNotificationName:object:userInfo:", CFSTR("SBIconViewWillDismissContextMenuNotification"), self, v13);

  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[SBIconViewCustomImageViewControlling setShowingContextMenu:](self->_customIconImageViewController, "setShowingContextMenu:", 0);

}

- (void)_contextMenuConfigurationDidDismiss:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  NSMutableArray *performAfterContextMenuBlocks;
  NSHashTable *contextMenuInteractionConfigurations;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  OS_os_activity *iconContextMenuActivity;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _QWORD v29[5];
  uint8_t v30[128];
  uint8_t buf[4];
  const char *v32;
  __int16 v33;
  int v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  SBLogIconContextMenu();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v5, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315906;
    v32 = "-[SBIconView _contextMenuConfigurationDidDismiss:]";
    v33 = 1024;
    v34 = 3085;
    v35 = 2112;
    v36 = v7;
    v37 = 2112;
    v38 = v4;
    _os_log_impl(&dword_1CFEF3000, v6, OS_LOG_TYPE_DEFAULT, "%s:%d %@ (%@)", buf, 0x26u);

  }
  -[SBIconView shortcutsDelegate](self, "shortcutsDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v8, "iconViewShortcutsPresentationDidFinish:", self);
  objc_msgSend(v5, "contextMenuNotificationUserInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "postNotificationName:object:userInfo:", CFSTR("SBIconViewDidDismissContextMenuNotification"), self, v9);

  -[NSHashTable removeObject:](self->_contextMenuInteractionConfigurations, "removeObject:", v4);
  -[NSHashTable removeObject:](self->_dismissingContextMenuInteractionConfigurations, "removeObject:", v4);
  -[SBIconView _toggleContentContainerViewIfNecessary](self, "_toggleContentContainerViewIfNecessary");
  -[SBIconView _updateAllComponentAlphas](self, "_updateAllComponentAlphas");
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __50__SBIconView__contextMenuConfigurationDidDismiss___block_invoke;
  v29[3] = &unk_1E8D84C50;
  v29[4] = self;
  objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:", v29, 0.2);
  if (!-[NSHashTable count](self->_contextMenuInteractionConfigurations, "count"))
  {
    SBLogIconContextMenu();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v5, "identifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315906;
      v32 = "-[SBIconView _contextMenuConfigurationDidDismiss:]";
      v33 = 1024;
      v34 = 3107;
      v35 = 2112;
      v36 = v12;
      v37 = 2112;
      v38 = v4;
      _os_log_impl(&dword_1CFEF3000, v11, OS_LOG_TYPE_DEFAULT, "%s:%d %@ (%@) -- Flushing any performAfterContextMenuBlocks; resetting state.",
        buf,
        0x26u);

    }
    v13 = -[NSMutableArray copy](self->_performAfterContextMenuBlocks, "copy");
    v14 = (void *)v13;
    v15 = (void *)MEMORY[0x1E0C9AA60];
    if (v13)
      v15 = (void *)v13;
    v16 = v15;

    performAfterContextMenuBlocks = self->_performAfterContextMenuBlocks;
    self->_performAfterContextMenuBlocks = 0;

    contextMenuInteractionConfigurations = self->_contextMenuInteractionConfigurations;
    self->_contextMenuInteractionConfigurations = 0;

    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v19 = v16;
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v26;
      do
      {
        v23 = 0;
        do
        {
          if (*(_QWORD *)v26 != v22)
            objc_enumerationMutation(v19);
          (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v23) + 16))(*(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v23));
          ++v23;
        }
        while (v21 != v23);
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
      }
      while (v21);
    }

    if (self->_iconContextMenuActivity)
    {
      os_activity_scope_leave(&self->_iconContextMenuActivityState);
      iconContextMenuActivity = self->_iconContextMenuActivity;
      self->_iconContextMenuActivity = 0;

    }
  }

}

uint64_t __50__SBIconView__contextMenuConfigurationDidDismiss___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateIconContentScale");
}

- (void)contextMenuInteraction:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5
{
  id v6;
  _QWORD v7[5];

  v6 = a5;
  objc_msgSend(v6, "setPreferredCommitStyle:", 0);
  if (objc_msgSend((id)objc_opt_class(), "supportsTapGesture"))
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __95__SBIconView_contextMenuInteraction_willPerformPreviewActionForMenuWithConfiguration_animator___block_invoke;
    v7[3] = &unk_1E8D84C50;
    v7[4] = self;
    objc_msgSend(v6, "addCompletion:", v7);
  }

}

uint64_t __95__SBIconView_contextMenuInteraction_willPerformPreviewActionForMenuWithConfiguration_animator___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleTap");
}

- (NSURL)applicationBundleURLForShortcuts
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[SBIconView icon](self, "icon");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconView shortcutsDelegate](self, "shortcutsDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) == 0
    || (objc_msgSend(v4, "applicationBundleURLForShortcutsWithIconView:", self),
        (v5 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    if (objc_msgSend(v3, "isApplicationIcon") && (objc_msgSend(v3, "isTimedOut") & 1) == 0)
    {
      objc_msgSend(v3, "application");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "bundleURL");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v5 = 0;
    }
  }

  return (NSURL *)v5;
}

- (NSString)applicationBundleIdentifierForShortcuts
{
  void *v3;
  void *v4;
  void *v5;

  -[SBIconView applicationBundleURLForShortcuts](self, "applicationBundleURLForShortcuts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[SBIconView icon](self, "icon");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "applicationBundleID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return (NSString *)v5;
}

- (BOOL)shouldActivateApplicationShortcutItem:(id)a3 atIndex:(unint64_t)a4
{
  id v6;
  void *v7;
  char v8;

  v6 = a3;
  -[SBIconView shortcutsDelegate](self, "shortcutsDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v8 = objc_msgSend(v7, "iconView:shouldActivateApplicationShortcutItem:atIndex:", self, v6, a4);
  else
    v8 = 1;

  return v8;
}

- (NSArray)effectiveApplicationShortcutItems
{
  void *v3;
  void *v4;
  uint64_t v5;

  -[SBIconView shortcutsDelegate](self, "shortcutsDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconView applicationShortcutItems](self, "applicationShortcutItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    -[SBIconView fetchedApplicationShortcutItems](self, "fetchedApplicationShortcutItems");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "iconView:applicationShortcutItemsWithProposedItems:", self, v4);
    v5 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v5;
  }

  return (NSArray *)v4;
}

- (id)_multitaskingAppShortcutService
{
  if (_multitaskingAppShortcutService_onceToken != -1)
    dispatch_once(&_multitaskingAppShortcutService_onceToken, &__block_literal_global_310);
  return (id)_multitaskingAppShortcutService_service;
}

void __45__SBIconView__multitaskingAppShortcutService__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0DAAF10]);
  v1 = (void *)_multitaskingAppShortcutService_service;
  _multitaskingAppShortcutService_service = (uint64_t)v0;

}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  id v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  unsigned __int8 v13;
  uint64_t v14;
  objc_super v16;

  v6 = a4;
  if (__sb__runningInSpringBoard())
  {
    if (SBFEffectiveDeviceClass() != 2 || __SBIconViewOwnerWantsMultitaskingKeyboardShortcuts != 1)
      goto LABEL_20;
    goto LABEL_7;
  }
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "userInterfaceIdiom") != 1)
  {
LABEL_19:

    goto LABEL_20;
  }
  v8 = __SBIconViewOwnerWantsMultitaskingKeyboardShortcuts;

  if ((v8 & 1) != 0)
  {
LABEL_7:
    -[SBIconView icon](self, "icon");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((__sb__runningInSpringBoard() & 1) != 0
      || !objc_msgSend(v7, "isApplicationIcon")
      || (-[SBIconView _multitaskingAppShortcutService](self, "_multitaskingAppShortcutService"),
          v9 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v7, "applicationBundleID"),
          v10 = (void *)objc_claimAutoreleasedReturnValue(),
          v11 = SBHMultitaskingApplicationSupportedShortcutActionMaskFromSBSMask(objc_msgSend(v9, "supportedShortcutActionsForBundleIdentifier:", v10)),
          v10,
          v9,
          !v11))
    {
      -[SBIconView shortcutsDelegate](self, "shortcutsDelegate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v11 = objc_msgSend(v12, "supportedMultitaskingShortcutActionsForIconView:", self);
      else
        v11 = 0;

    }
    if (sel__handleMakeFullscreenKeyShortcut_ == a3)
    {
      v14 = 1;
    }
    else if (sel__handleMakeSplitLeftKeyShortcut_ == a3)
    {
      v14 = 2;
    }
    else if (sel__handleMakeSplitRightKeyShortcut_ == a3)
    {
      v14 = 4;
    }
    else if (sel__handleActivateAppExposeKeyShortcut_ == a3)
    {
      v14 = 8;
    }
    else
    {
      if (sel__handleAddWindowToSetCommand_ != a3)
        goto LABEL_19;
      v14 = 16;
    }
    v13 = (v11 & v14) != 0;

    goto LABEL_27;
  }
LABEL_20:
  v16.receiver = self;
  v16.super_class = (Class)SBIconView;
  v13 = -[SBIconView canPerformAction:withSender:](&v16, sel_canPerformAction_withSender_, a3, v6);
LABEL_27:

  return v13;
}

- (void)_handleMakeFullscreenKeyShortcut:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  -[SBIconView icon](self, "icon", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isApplicationIcon"))
  {
    -[SBIconView _multitaskingAppShortcutService](self, "_multitaskingAppShortcutService");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "applicationBundleID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "performMultitaskingShortcutAction:forBundleIdentifier:", 0, v5);

  }
}

- (void)_handleMakeSplitLeftKeyShortcut:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  -[SBIconView icon](self, "icon", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isApplicationIcon"))
  {
    -[SBIconView _multitaskingAppShortcutService](self, "_multitaskingAppShortcutService");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "applicationBundleID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "performMultitaskingShortcutAction:forBundleIdentifier:", 1, v5);

  }
}

- (void)_handleMakeSplitRightKeyShortcut:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  -[SBIconView icon](self, "icon", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isApplicationIcon"))
  {
    -[SBIconView _multitaskingAppShortcutService](self, "_multitaskingAppShortcutService");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "applicationBundleID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "performMultitaskingShortcutAction:forBundleIdentifier:", 2, v5);

  }
}

- (void)_handleActivateAppExposeKeyShortcut:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  -[SBIconView icon](self, "icon", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isApplicationIcon"))
  {
    -[SBIconView _multitaskingAppShortcutService](self, "_multitaskingAppShortcutService");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "applicationBundleID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "performMultitaskingShortcutAction:forBundleIdentifier:", 3, v5);

  }
}

- (void)_handleAddWindowToSetCommand:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  -[SBIconView icon](self, "icon", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isApplicationIcon"))
  {
    -[SBIconView _multitaskingAppShortcutService](self, "_multitaskingAppShortcutService");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "applicationBundleID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "performMultitaskingShortcutAction:forBundleIdentifier:", 4, v5);

  }
}

+ (double)labelAccessoryViewBaseRightMargin
{
  return 2.0;
}

+ (double)labelAccessoryViewAdditionalRightMarginForType:(int64_t)a3
{
  void *v4;
  NSString *v5;
  _BOOL4 v6;
  double v7;
  uint64_t v8;
  int v9;
  int v10;
  int v11;
  double v12;
  _BOOL4 v13;
  void *v14;
  double v15;
  double v16;
  BOOL v17;
  double v18;
  void *v19;

  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preferredContentSizeCategory");
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();

  if (v5)
    v6 = UIContentSizeCategoryCompareToCategory(v5, (UIContentSizeCategory)*MEMORY[0x1E0DC4918]) != NSOrderedDescending;
  else
    v6 = 1;
  v7 = 0.0;
  if ((unint64_t)(a3 - 1) <= 1)
  {
    v8 = __sb__runningInSpringBoard();
    if ((_DWORD)v8)
    {
      if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
      {
        v9 = 0;
        v10 = 0;
        goto LABEL_16;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
      a3 = objc_claimAutoreleasedReturnValue();
      if (objc_msgSend((id)a3, "userInterfaceIdiom"))
      {
        v10 = 0;
        v9 = 1;
        goto LABEL_16;
      }
    }
    v9 = v8 ^ 1;
    v11 = __sb__runningInSpringBoard();
    if (v11)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
      v8 = objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v8, "_referenceBounds");
    }
    BSSizeRoundForScale();
    if (v12 >= *(double *)(MEMORY[0x1E0DAB260] + 40))
    {
      v13 = 1;
      if ((v11 & 1) == 0)
        goto LABEL_23;
      goto LABEL_18;
    }
    v10 = v11 ^ 1;
LABEL_16:
    if ((__sb__runningInSpringBoard() & 1) != 0)
    {
      v13 = SBFEffectiveDeviceClass() == 2;
      if (!v10)
        goto LABEL_18;
LABEL_23:

      if ((v9 & 1) != 0)
      {
LABEL_19:

        if (!v13)
        {
LABEL_20:
          objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "scale");
          v16 = v15;

          if (v16 > 1.0)
            goto LABEL_29;
          v17 = !v6;
          v18 = 2.0;
          goto LABEL_26;
        }
LABEL_25:
        v17 = !v6;
        v18 = 2.5;
LABEL_26:
        if (v17)
          v7 = 0.0;
        else
          v7 = v18;
        goto LABEL_29;
      }
LABEL_24:
      if (!v13)
        goto LABEL_20;
      goto LABEL_25;
    }
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v19, "userInterfaceIdiom") == 1;

    if ((v10 & 1) != 0)
      goto LABEL_23;
LABEL_18:
    if (v9)
      goto LABEL_19;
    goto LABEL_24;
  }
LABEL_29:

  return v7;
}

- (double)labelAccessoryTotalWidth
{
  double v2;
  double v3;
  double v4;

  -[SBIconLabelAccessoryView intrinsicContentSize](self->_labelAccessoryView, "intrinsicContentSize");
  v3 = v2;
  objc_msgSend((id)objc_opt_class(), "labelAccessoryViewBaseRightMargin");
  return v3 + v4;
}

+ (Class)defaultViewClassForLabelAccessoryType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 3)
    return (Class)0;
  else
    return (Class)(id)objc_opt_class();
}

- (double)_labelVerticalOffset
{
  return -1.5;
}

- (CGRect)_frameForVisibleImage
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_visibleImageRect.origin.x;
  y = self->_visibleImageRect.origin.y;
  width = self->_visibleImageRect.size.width;
  height = self->_visibleImageRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGRect)_frameForLabelAccessory
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  CGRect result;

  -[SBIconLabelView image](self->_labelView, "image");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconLabelView imageParameters](self->_labelView, "imageParameters");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconView _frameForLabel](self, "_frameForLabel");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[SBIconView _frameForImageView](self, "_frameForImageView");
  -[SBIconView _frameForLabelAccessoryViewWithLabelFrame:labelImage:labelImageParameters:imageFrame:](self, "_frameForLabelAccessoryViewWithLabelFrame:labelImage:labelImageParameters:imageFrame:", v3, v4, v6, v8, v10, v12, v13, v14, v15, v16);
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v24 = v23;

  v25 = v18;
  v26 = v20;
  v27 = v22;
  v28 = v24;
  result.size.height = v28;
  result.size.width = v27;
  result.origin.y = v26;
  result.origin.x = v25;
  return result;
}

- (CGRect)_frameForLabelHighlight
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
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
  CGRect result;

  -[SBIconView _labelImage](self, "_labelImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "parameters");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconView _frameForLabel](self, "_frameForLabel");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  objc_msgSend(v4, "textInsets");
  v14 = SBHEdgeInsetsInvert(v13);
  v16 = v15;
  v18 = v17;
  v20 = v19;
  objc_msgSend(v3, "alignmentRectInsets");
  v25 = v16 + v6 + v21;
  v26 = v14 + v8 + v22;
  v27 = v10 - (v21 + v23) - (v16 + v20);
  v28 = v12 - (v22 + v24) - (v14 + v18);

  v29 = v25;
  v30 = v26;
  v31 = v27;
  v32 = v28;
  result.size.height = v32;
  result.size.width = v31;
  result.origin.y = v30;
  result.origin.x = v29;
  return result;
}

- (CGRect)_frameForLabelAccessoryViewWithLabelFrame:(CGRect)a3 labelImage:(id)a4 labelImageParameters:(id)a5 imageFrame:(CGRect)a6
{
  double height;
  double width;
  double y;
  CGFloat x;
  id v12;
  id v13;
  int v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  SBIconLabelAccessoryView *labelAccessoryView;
  double v25;
  double v26;
  double v27;
  double v28;
  _BOOL4 v29;
  double v30;
  void *v31;
  uint64_t v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v51;
  double v52;
  CGFloat v53;
  double v54;
  double v55;
  CGRect v56;
  CGRect v57;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v12 = a5;
  v13 = a4;
  v14 = objc_msgSend(v13, "hasBaseline");
  objc_msgSend(v13, "baselineOffsetFromBottom");
  objc_msgSend(v13, "alignmentRectInsets");
  v16 = v15;
  v18 = v17;
  v48 = v20;
  v49 = v19;

  objc_msgSend(v12, "maxSize");
  v22 = v21;

  v52 = x;
  v53 = width;
  if (v22 > 0.0)
  {
    v56.origin.x = x;
    v56.origin.y = y;
    v56.size.width = width;
    v56.size.height = height;
    CGRectGetWidth(v56);
  }
  v23 = 0.0;
  labelAccessoryView = self->_labelAccessoryView;
  -[SBIconView bounds](self, "bounds");
  -[SBIconLabelAccessoryView sizeThatFits:](labelAccessoryView, "sizeThatFits:", v25, v26);
  v55 = v27;
  v54 = v28;
  objc_msgSend((id)objc_opt_class(), "labelAccessoryViewBaseRightMargin");
  objc_msgSend((id)objc_opt_class(), "labelAccessoryViewAdditionalRightMarginForType:", self->_displayedLabelAccessoryType);
  v29 = -[SBIconLabelAccessoryView hasBaseline](self->_labelAccessoryView, "hasBaseline");
  if (v29)
  {
    -[SBIconLabelAccessoryView baselineOffsetFromBottom](self->_labelAccessoryView, "baselineOffsetFromBottom");
    v23 = v30;
  }
  -[SBIconView traitCollection](self, "traitCollection");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "displayScale");

  if ((*((_BYTE *)self + 555) & 2) != 0)
  {
    -[SBIconView bounds](self, "bounds");
    CGRectGetMidX(v57);
    v37 = v55;
    UICeilToScale();
    v39 = v38;
    -[SBIconView _labelBaselineOffsetFromImage](self, "_labelBaselineOffsetFromImage");
    CGRectGetMaxY(a6);
    v40 = v54;
    UICeilToScale();
  }
  else
  {
    v51 = y;
    v32 = objc_msgSend((id)*MEMORY[0x1E0DC4730], "userInterfaceLayoutDirection");
    v33 = v52 + v18;
    v34 = y + v16;
    v35 = width - (v18 + v48);
    v36 = height - (v16 + v49);
    if (v32 == 1)
      CGRectGetMaxX(*(CGRect *)&v33);
    else
      CGRectGetMinX(*(CGRect *)&v33);
    v37 = v55;
    UIFloorToScale();
    v39 = v42;
    v40 = v54;
    if ((v14 & v29) != 1)
    {
      UIFloorToScale();
      v43 = v51 + v44;
      goto LABEL_14;
    }
    SBHAlignSizeInRectUsingBaseline(v55, v54, v23, v52, v51, v53, height);
    UIFloorToScale();
  }
  v43 = v41;
LABEL_14:
  v45 = v39;
  v46 = v37;
  v47 = v40;
  result.size.height = v47;
  result.size.width = v46;
  result.origin.y = v43;
  result.origin.x = v45;
  return result;
}

- (CGPoint)_centerForCloseBox
{
  void *v3;
  void *customIconImageViewController;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  double v24;
  uint64_t v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  double v30;
  double v31;
  double v32;
  double v33;
  CGPoint result;
  CGRect v35;

  if (self->_closeBox)
  {
    -[SBIconView currentImageView](self, "currentImageView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    customIconImageViewController = self->_customIconImageViewController;
    if (!customIconImageViewController)
      customIconImageViewController = self->_iconImageView;
    v5 = customIconImageViewController;
    objc_msgSend(v5, "visibleBounds");
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;
    -[SBIconView contentContainerView](self, "contentContainerView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "convertRect:fromView:", v3, v7, v9, v11, v13);
    v16 = v15;
    v18 = v17;
    v20 = v19;
    v22 = v21;

    -[SBIconView iconImageInfo](self, "iconImageInfo");
    v24 = v23 + (v23 + 2.66666667) * -0.707106781;
    v25 = objc_msgSend((id)*MEMORY[0x1E0DC4730], "userInterfaceLayoutDirection");

    v26 = v16;
    v27 = v18;
    v28 = v20;
    v29 = v22;
    if (v25 == 1)
      v30 = CGRectGetMaxX(*(CGRect *)&v26) - v24;
    else
      v30 = v24 + CGRectGetMinX(*(CGRect *)&v26);
    v35.origin.x = v16;
    v35.origin.y = v18;
    v35.size.width = v20;
    v35.size.height = v22;
    v31 = v24 + CGRectGetMinY(v35);

  }
  else
  {
    v30 = *MEMORY[0x1E0C9D538];
    v31 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  }
  v32 = v30;
  v33 = v31;
  result.y = v33;
  result.x = v32;
  return result;
}

- (unint64_t)userVisibilityStatus
{
  return ((unint64_t)*((unsigned __int8 *)self + 559) >> 1) & 3;
}

+ (double)defaultMaxLabelWidthDeltaForContentSizeCategory:(id)a3
{
  void *v3;
  void *v4;
  NSString *v5;
  NSString *v6;
  int v7;
  char v8;
  double v9;
  int v10;
  int v11;
  char v12;
  double v13;
  double v14;
  int v16;
  char v17;
  double v18;
  double v19;

  v5 = (NSString *)a3;
  v6 = v5;
  if (v5 && UIContentSizeCategoryIsAccessibilityCategory(v5))
  {
    v7 = __sb__runningInSpringBoard();
    v8 = v7;
    if (v7)
    {
      if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
      {
        v9 = 27.5;
        goto LABEL_24;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v3, "userInterfaceIdiom"))
      {
        v9 = 27.5;
        goto LABEL_23;
      }
    }
    v16 = __sb__runningInSpringBoard();
    v17 = v16;
    if (v16)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "_referenceBounds");
    }
    BSSizeRoundForScale();
    v18 = 5.0;
    if (v19 >= *(double *)(MEMORY[0x1E0DAB260] + 56))
      v18 = 10.0;
    v9 = v18 * 2.1 + 17.0;
    if ((v17 & 1) != 0)
      goto LABEL_22;
    goto LABEL_21;
  }
  v10 = __sb__runningInSpringBoard();
  v8 = v10;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 27.0;
    if (objc_msgSend(v3, "userInterfaceIdiom"))
      goto LABEL_23;
LABEL_15:
    v11 = __sb__runningInSpringBoard();
    v12 = v11;
    if (v11)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "_referenceBounds");
    }
    BSSizeRoundForScale();
    v13 = 5.0;
    if (v14 >= *(double *)(MEMORY[0x1E0DAB260] + 56))
      v13 = 10.0;
    v9 = v13 * 2.0 + 17.0;
    if ((v12 & 1) != 0)
    {
LABEL_22:
      if ((v8 & 1) != 0)
        goto LABEL_24;
LABEL_23:

      goto LABEL_24;
    }
LABEL_21:

    goto LABEL_22;
  }
  if (!SBFEffectiveDeviceClass())
    goto LABEL_15;
  v9 = 27.0;
  if (SBFEffectiveDeviceClass() == 1)
    goto LABEL_15;
LABEL_24:

  return v9;
}

+ (double)defaultMaxLabelHeight
{
  _BOOL4 v2;
  void *v3;
  double result;

  if (__sb__runningInSpringBoard())
  {
    v2 = SBFEffectiveDeviceClass() == 2;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = objc_msgSend(v3, "userInterfaceIdiom") == 1;

  }
  result = 26.0;
  if (v2)
    return 29.0;
  return result;
}

+ (CGSize)maxLabelSizeForIconImageSize:(CGSize)a3
{
  double width;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  width = a3.width;
  objc_msgSend((id)*MEMORY[0x1E0DC4730], "preferredContentSizeCategory", a3.width, a3.height);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "defaultMaxLabelWidthDeltaForContentSizeCategory:", v5);
  v7 = width + v6;
  objc_msgSend(a1, "defaultMaxLabelHeight");
  v9 = v8;

  v10 = v7;
  v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

+ (CGSize)maxLabelSizeForIconImageSize:(CGSize)a3 contentSizeCategory:(id)a4 options:(unint64_t)a5
{
  double width;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  width = a3.width;
  objc_msgSend(a1, "defaultMaxLabelWidthDeltaForContentSizeCategory:", a4, a5, a3.width, a3.height);
  v8 = width + v7;
  objc_msgSend(a1, "defaultMaxLabelHeight");
  v10 = v9;
  v11 = v8;
  result.height = v10;
  result.width = v11;
  return result;
}

+ (CGSize)maxLabelSizeForListLayout:(id)a3 contentSizeCategory:(id)a4 options:(unint64_t)a5
{
  id v8;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGSize result;

  v8 = a4;
  v9 = a3;
  objc_msgSend(v9, "iconImageInfo");
  objc_msgSend(a1, "maxLabelSizeForListLayout:iconImageSize:contentSizeCategory:options:", v9, v8, a5);
  v11 = v10;
  v13 = v12;

  v14 = v11;
  v15 = v13;
  result.height = v15;
  result.width = v14;
  return result;
}

- (SBIconLabelView)labelView
{
  return self->_labelView;
}

- (id)displayedLabelFont
{
  void *v2;
  void *v3;

  -[SBIconLabelView imageParameters](self->_labelView, "imageParameters");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "font");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_labelHidingReason
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  const __CFString *v7;

  if ((*((_BYTE *)self + 555) & 2) != 0)
    return CFSTR("hideLabel iVar");
  if (!-[SBIconView allowsLabelArea](self, "allowsLabelArea"))
    return CFSTR("label area");
  -[SBIconView icon](self, "icon");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return CFSTR("icon is nil");
  -[SBIconView listLayout](self, "listLayout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = SBHIconListLayoutShowsLabels(v4);

  if (!v5)
    return CFSTR("list layout");
  -[SBIconView behaviorDelegate](self, "behaviorDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    if (objc_msgSend(v6, "iconViewDisplaysLabel:", self))
      v7 = 0;
    else
      v7 = CFSTR("behavior delegate");
  }
  else
  {
    v7 = 0;
  }

  return (id)v7;
}

- (void)_updateLabelAnimated:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  _BOOL4 v7;
  SBIconLabelView *v8;
  SBIconLabelAccessoryView *v9;
  SBIconLabelAccessoryView *v10;
  void *labelAccessoryView;
  void *v12;
  void *v13;
  SBIconLabelView *labelView;
  int v15;
  SBIconLabelView *v16;
  SBIconLabelView *v17;
  SBIconLabelView *v18;
  SBIconLabelView *v19;
  void *v20;
  SBIconLabelView *v21;
  uint64_t v22;
  void (**v23)(void *, SBIconLabelView *, id);
  SBIconLabelView *v24;
  SBIconLabelAccessoryView *v25;
  SBIconLabelView *v26;
  SBIconLabelView *v27;
  SBIconLabelAccessoryView *v28;
  _QWORD aBlock[5];

  v3 = a3;
  if (-[SBIconView _shouldShowLabel](self, "_shouldShowLabel"))
  {
    -[SBIconView _labelImageParameters](self, "_labelImageParameters");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "text");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "length") != 0;

  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  v8 = self->_labelView;
  v9 = self->_labelAccessoryView;
  v10 = v9;
  if (v7)
  {
    v28 = v9;
    -[SBIconView _updateLabelAccessoryView](self, "_updateLabelAccessoryView");
    -[SBIconView _legibilitySettingsWithParameters:](self, "_legibilitySettingsWithParameters:", v5);
    labelAccessoryView = (void *)objc_claimAutoreleasedReturnValue();
    -[SBIconView iconLabelViewFactory](self, "iconLabelViewFactory");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBIconView contentContainerView](self, "contentContainerView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    labelView = self->_labelView;
    if (labelView)
    {
      v15 = objc_msgSend(v12, "canUseIconLabelView:toDisplayLabelWithSettings:imageParameters:forIconView:", labelView, labelAccessoryView, v5, self);
      v16 = self->_labelView;
      if (v15)
      {
        -[SBIconLabelView updateIconLabelWithSettings:imageParameters:](v16, "updateIconLabelWithSettings:imageParameters:", labelAccessoryView, v5);
LABEL_17:

        v10 = v28;
        goto LABEL_18;
      }
      if (v16 && !v3)
        -[SBIconLabelView removeFromSuperview](v16, "removeFromSuperview");
    }
    v27 = v8;
    objc_msgSend(v12, "iconLabelViewWithSettings:imageParameters:forIconView:", labelAccessoryView, v5, self);
    v18 = (SBIconLabelView *)objc_claimAutoreleasedReturnValue();
    v19 = self->_labelView;
    self->_labelView = v18;

    -[SBIconLabelView setAccessibilityIdentifier:](self->_labelView, "setAccessibilityIdentifier:", CFSTR("label-view"));
    -[SBIconView currentImageView](self, "currentImageView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = self->_labelView;
    if (v20)
      objc_msgSend(v13, "insertSubview:belowSubview:", v21, v20);
    else
      objc_msgSend(v13, "addSubview:", v21);

    v8 = v27;
    goto LABEL_17;
  }
  if (!v3)
    goto LABEL_19;
  v17 = self->_labelView;
  self->_labelView = 0;

  labelAccessoryView = self->_labelAccessoryView;
  self->_labelAccessoryView = 0;
LABEL_18:

LABEL_19:
  -[SBIconLabelView setHidden:](self->_labelView, "setHidden:", !v7);
  -[SBIconLabelAccessoryView setHidden:](self->_labelAccessoryView, "setHidden:", !v7);
  -[SBIconView effectiveIconLabelAlpha](self, "effectiveIconLabelAlpha");
  if (v3)
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __35__SBIconView__updateLabelAnimated___block_invoke;
    aBlock[3] = &__block_descriptor_40_e61_v56__0__UIView_8__UIView_16_CGRect__CGPoint_dd__CGSize_dd__24l;
    aBlock[4] = v22;
    v23 = (void (**)(void *, SBIconLabelView *, id))_Block_copy(aBlock);
    v24 = self->_labelView;
    v25 = self->_labelAccessoryView;
    v26 = v24;
    -[SBIconView _frameForLabel](self, "_frameForLabel");
    v23[2](v23, v8, v26);
    -[SBIconView _frameForLabelAccessory](self, "_frameForLabelAccessory");
    v23[2](v23, (SBIconLabelView *)v10, v25);

  }
  else
  {
    -[SBIconView _applyIconLabelAlpha:](self, "_applyIconLabelAlpha:");
  }
  -[SBIconView setNeedsLayout](self, "setNeedsLayout");

}

void __35__SBIconView__updateLabelAnimated___block_invoke(uint64_t a1, void *a2, void *a3, double a4, double a5, double a6, double a7)
{
  id v13;
  id v14;
  void *v15;
  double v16;
  _QWORD v17[4];
  id v18;

  v13 = a2;
  v14 = a3;
  v15 = v14;
  if (v14 != v13)
  {
    if (v14)
    {
      objc_msgSend(v14, "setFrame:", a4, a5, a6, a7);
      objc_msgSend(v15, "setAlpha:", *(double *)(a1 + 32));
      objc_msgSend(v15, "scaleAndBlurForDuration:initiallyHidden:visibleAlpha:completion:", 1, 0, 0.3, *(double *)(a1 + 32));
    }
    else if (v13)
    {
      v16 = *(double *)(a1 + 32);
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __35__SBIconView__updateLabelAnimated___block_invoke_2;
      v17[3] = &unk_1E8D84C50;
      v18 = v13;
      objc_msgSend(v18, "scaleAndBlurForDuration:initiallyHidden:visibleAlpha:completion:", 0, v17, 0.3, v16);

    }
  }

}

uint64_t __35__SBIconView__updateLabelAnimated___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
}

- (void)setLabelStyle:(int64_t)a3
{
  char v3;

  v3 = *((_BYTE *)self + 558);
  if ((uint64_t)(char)(2 * v3) >> 6 != a3)
  {
    *((_BYTE *)self + 558) = v3 & 0x9F | (32 * (a3 & 3));
    -[SBIconView _toggleGroupBlendingIfNecessary](self, "_toggleGroupBlendingIfNecessary");
    -[SBIconView _updateLabel](self, "_updateLabel");
  }
}

- (double)lastLineBaseline
{
  void *v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  double v13;
  double v14;
  CGRect v16;

  -[SBIconLabelView image](self->_labelView, "image");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconView _frameForLabel](self, "_frameForLabel");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  objc_msgSend(v3, "baselineOffsetFromBottom");
  v13 = v12;
  v16.origin.x = v5;
  v16.origin.y = v7;
  v16.size.width = v9;
  v16.size.height = v11;
  v14 = CGRectGetMaxY(v16) - v13;

  return v14;
}

- (double)baselineOffsetFromBottom
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  double v12;
  CGRect v14;

  -[SBIconView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[SBIconView lastLineBaseline](self, "lastLineBaseline");
  v12 = v11;
  v14.origin.x = v4;
  v14.origin.y = v6;
  v14.size.width = v8;
  v14.size.height = v10;
  return CGRectGetMaxY(v14) - v12;
}

- (void)setIconLabelViewFactory:(id)a3
{
  SBIconLabelViewFactory *v5;
  SBIconLabelViewFactory *v6;

  v5 = (SBIconLabelViewFactory *)a3;
  if (self->_iconLabelViewFactory != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_iconLabelViewFactory, a3);
    -[SBIconView _updateLabel](self, "_updateLabel");
    v5 = v6;
  }

}

- (id)_legibilitySettingsWithPrimaryColor:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = (objc_class *)MEMORY[0x1E0DC4270];
  v5 = a3;
  v6 = [v4 alloc];
  v7 = -[_UILegibilitySettings style](self->_legibilitySettings, "style");
  -[_UILegibilitySettings secondaryColor](self->_legibilitySettings, "secondaryColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UILegibilitySettings shadowColor](self->_legibilitySettings, "shadowColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v6, "initWithStyle:primaryColor:secondaryColor:shadowColor:", v7, v5, v8, v9);

  return v10;
}

- (id)_legibilitySettingsWithStyle:(int64_t)a3 primaryColor:(id)a4
{
  objc_class *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = (objc_class *)MEMORY[0x1E0DC4270];
  v7 = a4;
  v8 = [v6 alloc];
  -[_UILegibilitySettings secondaryColor](self->_legibilitySettings, "secondaryColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UILegibilitySettings shadowColor](self->_legibilitySettings, "shadowColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v8, "initWithStyle:primaryColor:secondaryColor:shadowColor:", a3, v7, v9, v10);

  return v11;
}

- (UIView)labelAccessoryView
{
  return (UIView *)self->_labelAccessoryView;
}

- (void)_updateLabelAreaAnimated:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  -[SBIconView _updateLabelAccessoryView](self, "_updateLabelAccessoryView");
  -[SBIconView _updateLabelAnimated:](self, "_updateLabelAnimated:", v3);
}

- (BOOL)allowsIconImageView
{
  return *((unsigned __int8 *)self + 554) >> 7;
}

- (void)setAllowsIconImageView:(BOOL)a3
{
  unsigned int v3;
  char v4;

  v3 = *((unsigned __int8 *)self + 554);
  if (a3 != v3 >> 7)
  {
    if (a3)
      v4 = 0x80;
    else
      v4 = 0;
    *((_BYTE *)self + 554) = v4 & 0x80 | v3 & 0x7F;
    -[SBIconView _updateIconImageViewAnimated:](self, "_updateIconImageViewAnimated:", 0);
  }
}

- (BOOL)allowsCustomIconImageViewController
{
  void *v2;
  void *v3;
  int v4;

  -[SBIconView icon](self, "icon");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "isPlaceholder") ^ 1;
  else
    LOBYTE(v4) = 0;

  return v4;
}

- (void)setOverrideCustomIconImageViewController:(id)a3
{
  SBIconViewCustomImageViewControlling *v5;
  SBIconViewCustomImageViewControlling *v6;

  v5 = (SBIconViewCustomImageViewControlling *)a3;
  if (self->_overrideCustomIconImageViewController != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_overrideCustomIconImageViewController, a3);
    -[SBIconView _updateIconImageViewAnimated:](self, "_updateIconImageViewAnimated:", 0);
    v5 = v6;
  }

}

- (BOOL)isIconImageViewBorrowed
{
  void *v2;
  BOOL v3;

  -[SBIconView borrowedIconImageViewAssertion](self, "borrowedIconImageViewAssertion");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (BOOL)shouldUpdateFrameOfIconImageView
{
  void *v4;
  char v5;

  if (-[SBIconView isIconImageViewBorrowed](self, "isIconImageViewBorrowed"))
    return 0;
  -[SBIconView currentImageView](self, "currentImageView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isDescendantOfView:", self);

  return v5;
}

- (BOOL)shouldAnimateFrameOfIconImageView
{
  _BOOL4 v3;

  v3 = -[SBIconView shouldUpdateFrameOfIconImageView](self, "shouldUpdateFrameOfIconImageView");
  if (v3)
    LOBYTE(v3) = self->_customIconImageViewController == 0;
  return v3;
}

- (id)borrowIconImageView
{
  return -[SBIconView borrowIconImageViewWithOptions:](self, "borrowIconImageViewWithOptions:", 0);
}

- (id)borrowIconImageViewWithOptions:(unint64_t)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  SBIconViewAssertion *v10;

  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v6, CFSTR("options"));

  -[SBIconView customIconImageViewController](self, "customIconImageViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "parentViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
      objc_msgSend(v5, "setObject:forKey:", v9, CFSTR("parentViewController"));

  }
  v10 = -[SBIconViewAssertion initWithAssertionType:iconView:extraInfo:]([SBIconViewAssertion alloc], "initWithAssertionType:iconView:extraInfo:", 2, self, v5);
  -[SBIconView setBorrowedIconImageViewAssertion:](self, "setBorrowedIconImageViewAssertion:", v10);

  return v10;
}

- (void)removeBorrowedIconImageViewAssertion:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  __int128 v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _OWORD v23[3];
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SBIconView borrowedIconImageViewAssertion](self, "borrowedIconImageViewAssertion");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    -[SBIconView setBorrowedIconImageViewAssertion:](self, "setBorrowedIconImageViewAssertion:", 0);
    -[SBIconView customIconImageViewController](self, "customIconImageViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBIconView currentImageView](self, "currentImageView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v7, "isDescendantOfView:", self) & 1) == 0)
    {
      objc_msgSend(v7, "removeFromSuperview");
      objc_msgSend(v4, "extraInfo");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      if (v6)
      {
        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("parentViewController"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "parentViewController");

      }
      -[SBIconView _insertIconImageView:](self, "_insertIconImageView:", v7);

    }
    -[SBIconView _updateIconImageViewAnimated:](self, "_updateIconImageViewAnimated:", 0);
    if (v6)
      -[SBIconView configureCustomIconImageViewController:](self, "configureCustomIconImageViewController:", v6);
    v18 = v6;
    -[SBIconView _updateAllComponentAlphas](self, "_updateAllComponentAlphas");
    -[SBIconView _updateBrightness](self, "_updateBrightness");
    -[SBIconView _updateJitter:](self, "_updateJitter:", 1);
    v11 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    v23[0] = *MEMORY[0x1E0C9BAA8];
    v23[1] = v11;
    v23[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    objc_msgSend(v7, "setTransform:", v23);
    -[SBIconView setNeedsLayout](self, "setNeedsLayout");
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v12 = (void *)-[NSHashTable copy](self->_observers, "copy");
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v20;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v20 != v15)
            objc_enumerationMutation(v12);
          v17 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v16);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v17, "iconView:didChangeCustomImageViewController:", self, 0);
          ++v16;
        }
        while (v14 != v16);
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
      }
      while (v14);
    }

  }
}

- (void)stealIconImageView
{
  SBIconImageView *iconImageView;

  -[SBIconImageView removeFromSuperview](self->_iconImageView, "removeFromSuperview");
  iconImageView = self->_iconImageView;
  self->_iconImageView = 0;

  -[SBIconView _updateIconImageViewAnimated:](self, "_updateIconImageViewAnimated:", 0);
}

- (id)disableImageUpdatesForReason:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[SBIconViewCustomImageViewControlling disableImageUpdatesForReason:](self->_customIconImageViewController, "disableImageUpdatesForReason:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[SBIconView _iconImageView](self, "_iconImageView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "disableImageUpdatesForReason:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (int64_t)_widgetBackgroundMaterialForDataSource:(id)a3
{
  id v3;
  char isKindOfClass;

  v3 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
    return 19;
  else
    return objc_msgSend((id)objc_opt_class(), "defaultWidgetBackgroundRecipe");
}

void __47__SBIconView_setCustomIconImageViewController___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "configureCustomIconImageViewController:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 40), "view");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_insertIconImageView:", v2);
  objc_msgSend(*(id *)(a1 + 32), "_updateAllComponentAlphas");

}

- (void)configureCustomIconImageViewController:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  id location;
  _QWORD v16[5];
  id v17;

  v4 = a3;
  -[SBIconView setCurrentImageStyleAsOverridesOnCustomIconImageViewController:](self, "setCurrentImageStyleAsOverridesOnCustomIconImageViewController:", v4);
  v5 = MEMORY[0x1E0C809B0];
  v6 = (void *)*MEMORY[0x1E0DC4730];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __53__SBIconView_configureCustomIconImageViewController___block_invoke;
  v16[3] = &unk_1E8D84EF0;
  v16[4] = self;
  v7 = v4;
  v17 = v7;
  objc_msgSend(v6, "_performBlockAfterCATransactionCommits:", v16);
  objc_msgSend(v7, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconView _frameForImageView](self, "_frameForImageView");
  objc_msgSend(v8, "setFrame:");
  -[SBIconView _updateCustomIconImageViewControllerHitTesting](self, "_updateCustomIconImageViewControllerHitTesting");
  -[SBIconView iconImageInfo](self, "iconImageInfo");
  objc_msgSend(v7, "setIconImageInfo:");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v7, "setEditing:", -[SBIconView isEditing](self, "isEditing"));
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_initWeak(&location, self);
    v13[0] = v5;
    v13[1] = 3221225472;
    v13[2] = __53__SBIconView_configureCustomIconImageViewController___block_invoke_2;
    v13[3] = &unk_1E8D8B948;
    objc_copyWeak(&v14, &location);
    objc_msgSend(v7, "setBackgroundViewProvider:", v13);
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_initWeak(&location, self);
    v11[0] = v5;
    v11[1] = 3221225472;
    v11[2] = __53__SBIconView_configureCustomIconImageViewController___block_invoke_3;
    v11[3] = &unk_1E8D8B970;
    objc_copyWeak(&v12, &location);
    objc_msgSend(v7, "setBackgroundViewConfigurator:", v11);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v7, "setUserInteractionEnabled:", -[SBIconView isUserInteractionEnabled](self, "isUserInteractionEnabled"));
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v7, "setPauseReasons:", ((unint64_t)*((unsigned __int16 *)self + 276) >> 4) & 0x1F);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v7, "setLegibilitySettings:", self->_legibilitySettings);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v7, "addCustomImageViewControllerObserver:", self);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v7, "setUserVisibilityStatus:", ((unint64_t)*((unsigned __int8 *)self + 559) >> 1) & 3);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v9 = -[SBIconView approximateLayoutPosition](self, "approximateLayoutPosition");
    objc_msgSend(v7, "setApproximateLayoutPosition:", v9, v10);
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v7, "setContentVisibility:", -[SBIconView contentVisibility](self, "contentVisibility"));

}

uint64_t __53__SBIconView_configureCustomIconImageViewController___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "resetOverridesOnCustomIconImageViewController:", *(_QWORD *)(a1 + 40));
}

id __53__SBIconView_configureCustomIconImageViewController___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = (void *)objc_msgSend(WeakRetained, "newComponentBackgroundViewOfType:", 4);

  return v2;
}

void __53__SBIconView_configureCustomIconImageViewController___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  id WeakRetained;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;

  v5 = a2;
  v6 = a3;
  v7 = objc_opt_class();
  v14 = v5;
  if (v7)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v8 = v14;
    else
      v8 = 0;
  }
  else
  {
    v8 = 0;
  }
  v9 = v8;

  if (v9)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    v11 = objc_msgSend(WeakRetained, "_widgetBackgroundMaterialForDataSource:", v6);

    if (v11 != objc_msgSend(v9, "recipe"))
      objc_msgSend(v9, "setRecipe:", v11);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v9, "groupNameBase");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringByAppendingString:", CFSTR("-AppPrediction"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v9, "setGroupNameBase:", v13);
      objc_msgSend(v9, "setUseBuiltInAlphaTransformerAndBackdropScaleAdjustment:", 1);

    }
  }

}

- (void)setOverrideImageAppearance:(id)a3 onCustomIconImageViewController:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  v5 = a4;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v5, "setOverrideIconImageAppearance:", v8);
  }
  else
  {
    objc_msgSend(v5, "traitOverrides");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_self();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
      objc_msgSend(v6, "setObject:forTrait:", v8, v7);
    else
      objc_msgSend(v6, "removeTrait:", v7);

  }
}

- (void)setOverrideImageStyleConfiguration:(id)a3 onCustomIconImageViewController:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  v5 = a4;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v5, "setOverrideIconImageStyleConfiguration:", v8);
  }
  else
  {
    objc_msgSend(v5, "traitOverrides");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_self();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
      objc_msgSend(v6, "setObject:forTrait:", v8, v7);
    else
      objc_msgSend(v6, "removeTrait:", v7);

  }
}

- (void)setCurrentImageStyleAsOverridesOnCustomIconImageViewController:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[SBIconView effectiveIconImageStyleConfiguration](self, "effectiveIconImageStyleConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 && ((objc_opt_respondsToSelector() & 1) != 0 || (objc_opt_respondsToSelector() & 1) == 0))
  {
    -[SBIconView setOverrideImageStyleConfiguration:onCustomIconImageViewController:](self, "setOverrideImageStyleConfiguration:onCustomIconImageViewController:", v4, v6);
  }
  else
  {
    -[SBIconView effectiveIconImageAppearance](self, "effectiveIconImageAppearance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBIconView setOverrideImageAppearance:onCustomIconImageViewController:](self, "setOverrideImageAppearance:onCustomIconImageViewController:", v5, v6);

  }
}

- (void)resetOverridesOnCustomIconImageViewController:(id)a3
{
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  -[SBIconView overrideIconImageStyleConfiguration](self, "overrideIconImageStyleConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconView overrideIconImageAppearance](self, "overrideIconImageAppearance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
      if (v4)
      {
        objc_msgSend(v11, "traitOverrides");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_self();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:forTrait:", v4, v10);

        v6 = 1;
      }
      else
      {
        v6 = 0;
      }
      goto LABEL_6;
    }
LABEL_5:
    objc_msgSend(v11, "setOverrideIconImageStyleConfiguration:", v4);
    v6 = 0;
LABEL_6:
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v11, "setOverrideIconImageAppearance:", v5);
      goto LABEL_9;
    }
    if (!v5)
    {
LABEL_9:
      if ((v6 & 1) != 0)
        goto LABEL_19;
      goto LABEL_13;
    }
LABEL_17:
    objc_msgSend(v11, "traitOverrides");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_self();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forTrait:", v5, v8);
    goto LABEL_18;
  }

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v4 = 0;
    goto LABEL_5;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    v4 = 0;
    goto LABEL_17;
  }
  objc_msgSend(v11, "setOverrideIconImageAppearance:", v5);
  v4 = 0;
LABEL_13:
  objc_msgSend(v11, "traitOverrides");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeTrait:", v8);
LABEL_18:

LABEL_19:
}

uint64_t __43__SBIconView__updateAccessoryViewAnimated___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
  return objc_msgSend(*(id *)(a1 + 40), "setAlpha:", 1.0);
}

uint64_t __43__SBIconView__updateAccessoryViewAnimated___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_destroyAccessoryView:", *(_QWORD *)(a1 + 40));
}

uint64_t __43__SBIconView__updateAccessoryViewAnimated___block_invoke_5(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  void *v4;
  void *v5;
  __int128 v6;
  _OWORD v8[3];

  objc_msgSend(*(id *)(a1 + 32), "_createAccessoryViewIfNecessary");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 464), "configureForIcon:infoProvider:", *(_QWORD *)(a1 + 40));
  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 464), "displayingAccessory");
  v3 = *(_QWORD **)(a1 + 32);
  if ((_DWORD)v2)
  {
    v4 = (void *)v3[58];
    objc_msgSend(v3, "_centerForAccessoryView");
    objc_msgSend(v4, "setCenter:");
    v5 = *(void **)(*(_QWORD *)(a1 + 32) + 464);
    v6 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    v8[0] = *MEMORY[0x1E0C9BAA8];
    v8[1] = v6;
    v8[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    objc_msgSend(v5, "setTransform:", v8);
  }
  else
  {
    objc_msgSend(v3, "_destroyAccessoryView");
  }
  objc_msgSend(*(id *)(a1 + 32), "_setShowingAccessoryView:", v2);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 464), "layoutIfNeeded");
}

uint64_t __43__SBIconView__updateAccessoryViewAnimated___block_invoke_6(uint64_t a1)
{
  void *v1;
  CGAffineTransform v3;

  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 464);
  CGAffineTransformMakeScale(&v3, 0.01, 0.01);
  return objc_msgSend(v1, "setTransform:", &v3);
}

uint64_t __43__SBIconView__updateAccessoryViewAnimated___block_invoke_7(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_destroyAccessoryView");
}

- (id)accessoryViewContainerView
{
  if (-[SBIconView shouldPutAccessoryViewInsideImageView](self, "shouldPutAccessoryViewInsideImageView"))
    -[SBIconView currentImageView](self, "currentImageView");
  else
    -[SBIconView contentContainerView](self, "contentContainerView");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)shouldPutAccessoryViewInsideImageView
{
  BOOL v2;
  void *v3;

  if (self->_crossfadeView)
    return 0;
  -[SBIconView overrideImageTintColor](self, "overrideImageTintColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v3 == 0;

  return v2;
}

- (void)updateAccessoryViewContainerIfNecessary
{
  id v3;
  id v4;

  if (self->_accessoryView)
  {
    -[SBIconView accessoryViewContainerView](self, "accessoryViewContainerView");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[SBIconAccessoryView superview](self->_accessoryView, "superview");
    v3 = (id)objc_claimAutoreleasedReturnValue();

    if (v3 != v4)
      objc_msgSend(v4, "addSubview:", self->_accessoryView);
    objc_msgSend(v4, "bringSubviewToFront:", self->_accessoryView);

  }
}

- (void)setOverrideAccessoryIconImageAppearance:(id)a3
{
  SBHIconImageAppearance *v4;
  SBHIconImageAppearance *overrideAccessoryIconImageAppearance;
  id v6;

  v6 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    v4 = (SBHIconImageAppearance *)objc_msgSend(v6, "copy");
    overrideAccessoryIconImageAppearance = self->_overrideAccessoryIconImageAppearance;
    self->_overrideAccessoryIconImageAppearance = v4;

    -[SBIconView updateAccessoryViewOverrideIconImageAppearance](self, "updateAccessoryViewOverrideIconImageAppearance");
  }

}

- (id)effectiveOverrideAccessoryIconImageAppearance
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  -[SBIconView overrideAccessoryIconImageAppearance](self, "overrideAccessoryIconImageAppearance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[SBIconView overrideIconImageAppearance](self, "overrideIconImageAppearance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      -[SBIconView overrideIconImageStyleConfiguration](self, "overrideIconImageStyleConfiguration");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (v4)
      {
        -[SBIconView icon](self, "icon");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0DC3E88], "sbh_highestLevelTraitCollectionForView:", self);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = objc_msgSend(v6, "userInterfaceStyle");

        if (objc_msgSend(v5, "isWidgetIcon"))
          objc_msgSend(v4, "widgetAppearanceWithUserInterfaceStyle:", v7);
        else
          objc_msgSend(v4, "iconImageAppearanceWithUserInterfaceStyle:", v7);
        v3 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v3 = 0;
      }

    }
  }
  return v3;
}

- (id)effectiveAccessoryIconImageAppearance
{
  void *v3;

  -[SBIconView overrideAccessoryIconImageAppearance](self, "overrideAccessoryIconImageAppearance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[SBIconView effectiveIconImageAppearance](self, "effectiveIconImageAppearance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (void)updateAccessoryViewOverrideIconImageAppearance
{
  id v3;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[SBIconView effectiveOverrideAccessoryIconImageAppearance](self, "effectiveOverrideAccessoryIconImageAppearance");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    -[SBIconAccessoryView setOverrideIconImageAppearance:](self->_accessoryView, "setOverrideIconImageAppearance:", v3);

  }
}

- (CGSize)accessorySize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGSize result;

  -[SBIconView listLayout](self, "listLayout");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = SBHIconListLayoutIconAccessorySize(v2);
  v5 = v4;

  v6 = v3;
  v7 = v5;
  result.height = v7;
  result.width = v6;
  return result;
}

- (id)badgeString
{
  void *v3;
  char isKindOfClass;
  void *v5;

  objc_opt_self();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[SBIconAccessoryView text](self->_accessoryView, "text");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (void)_accessoryViewTapGestureChanged:(id)a3
{
  id v4;

  if (objc_msgSend(a3, "state") == 3)
  {
    -[SBIconView actionDelegate](self, "actionDelegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v4, "iconAccessoryViewTapped:", self);

  }
}

- (id)_automationID
{
  void *v2;
  void *v3;

  -[SBIcon automationID](self->_icon, "automationID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("BTN "), "stringByAppendingString:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)pointMostlyInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y;
  CGFloat x;
  CGPoint v7;
  CGRect v8;
  CGRect v9;

  y = a3.y;
  x = a3.x;
  -[SBIconView bounds](self, "bounds", a4);
  v9 = CGRectInset(v8, -25.0, -25.0);
  v7.x = x;
  v7.y = y;
  return CGRectContainsPoint(v9, v7);
}

uint64_t __23__SBIconView_setFrame___block_invoke(uint64_t a1)
{
  void *v1;
  __int128 v2;
  _OWORD v4[3];

  v1 = *(void **)(a1 + 32);
  v2 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v4[0] = *MEMORY[0x1E0C9BAA8];
  v4[1] = v2;
  v4[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  return objc_msgSend(v1, "setTransform:", v4);
}

uint64_t __23__SBIconView_setFrame___block_invoke_2(uint64_t a1)
{
  void *v1;
  __int128 v2;
  _OWORD v4[3];

  v1 = *(void **)(a1 + 32);
  v2 = *(_OWORD *)(a1 + 56);
  v4[0] = *(_OWORD *)(a1 + 40);
  v4[1] = v2;
  v4[2] = *(_OWORD *)(a1 + 72);
  return objc_msgSend(v1, "setTransform:", v4);
}

- (id)tintColor
{
  return 0;
}

+ (CAFrameRateRange)_jitterAnimationFrameRateRange
{
  return CAFrameRateRangeMake(80.0, 120.0, 120.0);
}

+ (unsigned)_jitterAnimationHighFrameRateReason
{
  return 1114146;
}

+ (id)_jitterXTranslationAnimationWithStrength:(double)a3
{
  return (id)objc_msgSend(a1, "_jitterXTranslationAnimationWithAmount:", a3 * 0.4);
}

+ (id)_jitterXTranslationAnimationWithAmount:(double)a3
{
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;

  objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("transform.translation.x"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDuration:", 0.134);
  objc_msgSend(v5, "setBeginTime:", (double)arc4random_uniform(0x64u) / 100.0);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFromValue:", v6);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", -a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setToValue:", v7);

  LODWORD(v8) = 1052266988;
  LODWORD(v9) = 1059145646;
  LODWORD(v10) = 0;
  LODWORD(v11) = 1.0;
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", v8, v10, v9, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTimingFunction:", v12);

  LODWORD(v13) = 2139095040;
  objc_msgSend(v5, "setRepeatCount:", v13);
  objc_msgSend(v5, "setAutoreverses:", 1);
  objc_msgSend(v5, "setRemovedOnCompletion:", 0);
  objc_msgSend(a1, "_jitterAnimationFrameRateRange");
  objc_msgSend(v5, "setPreferredFrameRateRange:");
  objc_msgSend(v5, "setHighFrameRateReason:", objc_msgSend(a1, "_jitterAnimationHighFrameRateReason"));
  return v5;
}

+ (id)_jitterYTranslationAnimationWithStrength:(double)a3
{
  return (id)objc_msgSend(a1, "_jitterYTranslationAnimationWithAmount:", a3 * 0.4);
}

+ (id)_jitterYTranslationAnimationWithAmount:(double)a3
{
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;

  objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("transform.translation.y"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDuration:", 0.142);
  objc_msgSend(v5, "setBeginTime:", (double)arc4random_uniform(0x64u) / 100.0);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFromValue:", v6);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", -a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setToValue:", v7);

  LODWORD(v8) = 1052266988;
  LODWORD(v9) = 1059145646;
  LODWORD(v10) = 0;
  LODWORD(v11) = 1.0;
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", v8, v10, v9, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTimingFunction:", v12);

  LODWORD(v13) = 2139095040;
  objc_msgSend(v5, "setRepeatCount:", v13);
  objc_msgSend(v5, "setAutoreverses:", 1);
  objc_msgSend(v5, "setRemovedOnCompletion:", 0);
  objc_msgSend(a1, "_jitterAnimationFrameRateRange");
  objc_msgSend(v5, "setPreferredFrameRateRange:");
  objc_msgSend(v5, "setHighFrameRateReason:", objc_msgSend(a1, "_jitterAnimationHighFrameRateReason"));
  return v5;
}

+ (id)_jitterRotationAnimationWithStrength:(double)a3
{
  return (id)objc_msgSend(a1, "_jitterRotationAnimationWithAmount:", a3 * 0.03);
}

+ (id)_jitterRotationAnimationWithAmount:(double)a3
{
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;

  objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("transform.rotation"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDuration:", 0.128);
  objc_msgSend(v5, "setBeginTime:", (double)arc4random_uniform(0x64u) / 100.0);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", -a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFromValue:", v6);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setToValue:", v7);

  LODWORD(v8) = 1052266988;
  LODWORD(v9) = 1059145646;
  LODWORD(v10) = 0;
  LODWORD(v11) = 1.0;
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", v8, v10, v9, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTimingFunction:", v12);

  LODWORD(v13) = 2139095040;
  objc_msgSend(v5, "setRepeatCount:", v13);
  objc_msgSend(v5, "setAutoreverses:", 1);
  objc_msgSend(v5, "setRemovedOnCompletion:", 0);
  objc_msgSend(a1, "_jitterAnimationFrameRateRange");
  objc_msgSend(v5, "setPreferredFrameRateRange:");
  objc_msgSend(v5, "setHighFrameRateReason:", objc_msgSend(a1, "_jitterAnimationHighFrameRateReason"));
  return v5;
}

+ (id)_jitterRampDownAnimationWithAnimation:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CD2710];
  objc_msgSend(a3, "keyPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "animationWithKeyPath:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setDuration:", 0.3);
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3050]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTimingFunction:", v6);

  objc_msgSend(v5, "setRemovedOnCompletion:", 1);
  objc_msgSend((id)objc_opt_class(), "_jitterAnimationFrameRateRange");
  objc_msgSend(v5, "setPreferredFrameRateRange:");
  objc_msgSend(v5, "setHighFrameRateReason:", objc_msgSend((id)objc_opt_class(), "_jitterAnimationHighFrameRateReason"));
  return v5;
}

- (void)_updateJitterAnimated:(BOOL)a3
{
  -[SBIconView _updateJitter:animated:](self, "_updateJitter:animated:", 0, a3);
}

- (void)_updateJitter:(BOOL)a3
{
  -[SBIconView _updateJitter:animated:](self, "_updateJitter:animated:", a3, 1);
}

- (void)_updateJitter:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL4 v5;
  SBIcon *icon;
  void *v9;
  id v10;

  v4 = a4;
  v5 = a3;
  if (!-[SBIconView isEditing](self, "isEditing")
    || (*((_BYTE *)self + 554) & 8) == 0
    || (*((_BYTE *)self + 553) & 4) != 0
    || -[SBIconView isPaused](self, "isPaused")
    || -[SBIconView isDragging](self, "isDragging") && !-[SBIconView isGrabbed](self, "isGrabbed")
    || self->_crossfadeView)
  {
    LODWORD(icon) = 0;
  }
  else
  {
    icon = self->_icon;
    if (icon)
      LODWORD(icon) = !-[SBIconView isResizing](self, "isResizing");
  }
  if ((_DWORD)icon != (*((_BYTE *)self + 554) & 2) >> 1 || v5)
  {
    if ((_DWORD)icon)
      -[SBIconView _addJitterAnimated:](self, "_addJitterAnimated:", v4);
    else
      -[SBIconView _removeJitterAnimated:](self, "_removeJitterAnimated:", v4);
    -[SBIconView _iconImageView](self, "_iconImageView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setJittering:", (*((unsigned __int8 *)self + 554) >> 1) & 1);

    -[SBIconView customIconImageViewController](self, "customIconImageViewController");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v10, "setJittering:", (*((unsigned __int8 *)self + 554) >> 1) & 1);

  }
}

- (void)_addJitterAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  char v7;
  id v8;

  v3 = a3;
  +[SBHHomeScreenDomain rootSettings](SBHHomeScreenDomain, "rootSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "iconSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "suppressJitter");

  if ((v7 & 1) == 0)
  {
    *((_BYTE *)self + 554) |= 2u;
    if (-[SBIconView suppressesDefaultEditingAnimation](self, "suppressesDefaultEditingAnimation"))
    {
      -[SBIconView _removeDefaultJitterAnimationsAnimated:](self, "_removeDefaultJitterAnimationsAnimated:", v3);
    }
    else
    {
      -[SBIconView _iconImageView](self, "_iconImageView");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend((id)objc_opt_class(), "hasCustomJitter") & 1) == 0 && (*((_BYTE *)self + 554) & 4) == 0)
        -[SBIconView _addDefaultJitterAnimationsAnimated:](self, "_addDefaultJitterAnimationsAnimated:", v3);

    }
  }
}

- (void)_removeJitterAnimated:(BOOL)a3
{
  *((_BYTE *)self + 554) &= ~2u;
  -[SBIconView _removeDefaultJitterAnimationsAnimated:](self, "_removeDefaultJitterAnimationsAnimated:", a3);
}

- (void)_addDefaultJitterAnimationsAnimated:(BOOL)a3
{
  _BOOL8 v3;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v3 = a3;
  *((_BYTE *)self + 554) |= 4u;
  -[SBIconView editingAnimationStrength](self, "editingAnimationStrength");
  v6 = v5;
  +[SBIconView _jitterXTranslationAnimationWithStrength:](SBIconView, "_jitterXTranslationAnimationWithStrength:");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  -[SBIconView _rampUpJitterAnimation:animationKey:rampKey:animated:](self, "_rampUpJitterAnimation:animationKey:rampKey:animated:", v13, CFSTR("SBIconXTranslation"), CFSTR("SBIconXTranslationRamp"), v3);
  +[SBIconView _jitterYTranslationAnimationWithStrength:](SBIconView, "_jitterYTranslationAnimationWithStrength:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconView _rampUpJitterAnimation:animationKey:rampKey:animated:](self, "_rampUpJitterAnimation:animationKey:rampKey:animated:", v7, CFSTR("SBIconYTranslation"), CFSTR("SBIconYTranslationRamp"), v3);
  -[SBIconView gridSizeClass](self, "gridSizeClass");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconView listLayoutProvider](self, "listLayoutProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconView location](self, "location");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "layoutForIconLocation:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  +[SBIconView _jitterRotationAnimationWithStrength:](SBIconView, "_jitterRotationAnimationWithStrength:", v6 * SBHIconListLayoutEditingAnimationStrengthForGridSizeClass(v11, v8));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconView _rampUpJitterAnimation:animationKey:rampKey:animated:](self, "_rampUpJitterAnimation:animationKey:rampKey:animated:", v12, CFSTR("SBIconRotation"), CFSTR("SBIconRotationRamp"), v3);

}

- (void)_removeDefaultJitterAnimationsAnimated:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  *((_BYTE *)self + 554) &= ~4u;
  -[SBIconView _rampDownJitterAnimationForKey:rampKey:animated:](self, "_rampDownJitterAnimationForKey:rampKey:animated:", CFSTR("SBIconXTranslation"), CFSTR("SBIconXTranslationRamp"), a3);
  -[SBIconView _rampDownJitterAnimationForKey:rampKey:animated:](self, "_rampDownJitterAnimationForKey:rampKey:animated:", CFSTR("SBIconYTranslation"), CFSTR("SBIconYTranslationRamp"), v3);
  -[SBIconView _rampDownJitterAnimationForKey:rampKey:animated:](self, "_rampDownJitterAnimationForKey:rampKey:animated:", CFSTR("SBIconRotation"), CFSTR("SBIconRotationRamp"), v3);
}

- (void)_rampUpJitterAnimation:(id)a3 animationKey:(id)a4 rampKey:(id)a5 animated:(BOOL)a6
{
  id v8;
  id v9;
  id v10;

  v8 = a4;
  v9 = a3;
  -[SBIconView layer](self, "layer");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addAnimation:forKey:", v9, v8);

}

- (void)_rampDownJitterAnimationForKey:(id)a3 rampKey:(id)a4 animated:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v5 = a5;
  v12 = a3;
  v8 = a4;
  -[SBIconView layer](self, "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "animationForKey:", v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    if (v5)
    {
      +[SBIconView _jitterRampDownAnimationWithAnimation:](SBIconView, "_jitterRampDownAnimationWithAnimation:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addAnimation:forKey:", v11, v8);

    }
    objc_msgSend(v9, "removeAnimationForKey:", v12);
  }

}

- (BOOL)suppressesDefaultEditingAnimation
{
  return (*((unsigned __int8 *)self + 554) >> 4) & 1;
}

- (void)setSuppressesDefaultEditingAnimation:(BOOL)a3
{
  char v3;
  char v4;

  v3 = *((_BYTE *)self + 554);
  if (((((v3 & 0x10) == 0) ^ a3) & 1) == 0)
  {
    if (a3)
      v4 = 16;
    else
      v4 = 0;
    *((_BYTE *)self + 554) = v3 & 0xEF | v4;
    -[SBIconView _updateJitter:animated:](self, "_updateJitter:animated:", 1, 0);
  }
}

- (BOOL)refusesRecipientStatus
{
  return (*((unsigned __int8 *)self + 553) >> 4) & 1;
}

- (void)setRefusesRecipientStatus:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *((_BYTE *)self + 553) = *((_BYTE *)self + 553) & 0xEF | v3;
}

- (BOOL)canReceiveGrabbedIcon:(id)a3
{
  id v4;
  void *v5;
  SBIcon *icon;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  SBIcon *v13;
  char v14;

  v4 = a3;
  -[SBIconView behaviorDelegate](self, "behaviorDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*((_BYTE *)self + 553) & 0x10) != 0
    || (objc_msgSend(v4, "isFolderIcon") & 1) != 0
    || (objc_msgSend(v4, "isWidgetStackIcon") & 1) != 0
    || v4 && !objc_msgSend(v4, "canBeReceivedByIcon")
    || !-[SBIcon canReceiveGrabbedIcon](self->_icon, "canReceiveGrabbedIcon"))
  {
    goto LABEL_16;
  }
  if (v4)
  {
    icon = self->_icon;
    if (icon)
    {
      -[SBIcon gridSizeClass](icon, "gridSizeClass");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "gridSizeClass");
      v8 = objc_claimAutoreleasedReturnValue();
      if (v7 == (void *)v8)
      {

      }
      else
      {
        v9 = (void *)v8;
        -[SBIcon gridSizeClass](self->_icon, "gridSizeClass");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "gridSizeClass");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v10, "isEqualToString:", v11);

        if (!v12)
        {
LABEL_16:
          v14 = 0;
          goto LABEL_17;
        }
      }
    }
  }
  if (v4)
  {
    v13 = self->_icon;
    if (v13)
    {
      if ((-[SBIcon isEqual:](v13, "isEqual:", v4) & 1) != 0)
        goto LABEL_16;
    }
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v14 = objc_msgSend(v5, "icon:canReceiveGrabbedIcon:", self, v4);
  else
    v14 = 1;
LABEL_17:

  return v14;
}

- (id)markAsDropping
{
  SBIconViewAssertion *v3;
  NSHashTable *droppingAssertions;
  NSHashTable *v5;
  NSHashTable *v6;
  NSObject *v7;
  int v9;
  SBIconView *v10;
  __int16 v11;
  SBIconViewAssertion *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = -[SBIconViewAssertion initWithAssertionType:iconView:extraInfo:]([SBIconViewAssertion alloc], "initWithAssertionType:iconView:extraInfo:", 0, self, 0);
  droppingAssertions = self->_droppingAssertions;
  if (!droppingAssertions)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v5 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
    v6 = self->_droppingAssertions;
    self->_droppingAssertions = v5;

    droppingAssertions = self->_droppingAssertions;
  }
  -[NSHashTable addObject:](droppingAssertions, "addObject:", v3);
  SBLogIcon();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v9 = 134218242;
    v10 = self;
    v11 = 2112;
    v12 = v3;
    _os_log_impl(&dword_1CFEF3000, v7, OS_LOG_TYPE_INFO, "%p: Adding SBIconView isDropping assertion: %@", (uint8_t *)&v9, 0x16u);
  }

  -[SBIconView _toggleContentContainerViewIfNecessary](self, "_toggleContentContainerViewIfNecessary");
  -[SBIconView _updateAllComponentAlphas](self, "_updateAllComponentAlphas");
  return v3;
}

- (void)removeDroppingAssertion:(id)a3
{
  id v4;
  NSObject *v5;
  NSHashTable *droppingAssertions;
  int v7;
  SBIconView *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  SBLogIcon();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v7 = 134218242;
    v8 = self;
    v9 = 2112;
    v10 = v4;
    _os_log_impl(&dword_1CFEF3000, v5, OS_LOG_TYPE_INFO, "%p: Remove SBIconView isDropping assertion: %@", (uint8_t *)&v7, 0x16u);
  }

  -[NSHashTable removeObject:](self->_droppingAssertions, "removeObject:", v4);
  if (!-[NSHashTable count](self->_droppingAssertions, "count"))
  {
    droppingAssertions = self->_droppingAssertions;
    self->_droppingAssertions = 0;

  }
  -[SBIconView _toggleContentContainerViewIfNecessary](self, "_toggleContentContainerViewIfNecessary");
  -[SBIconView _updateAllComponentAlphas](self, "_updateAllComponentAlphas");

}

- (void)iconInteractedWhenDisabled
{
  *((_BYTE *)self + 554) |= 1u;
  *((_BYTE *)self + 553) &= ~0x80u;
  -[SBIconView _updateBrightness](self, "_updateBrightness");
  -[SBIconView _updateLabel](self, "_updateLabel");
}

- (BOOL)showsDropGlow
{
  return (*((unsigned __int8 *)self + 557) >> 2) & 1;
}

- (void)setShowsDropGlow:(BOOL)a3 animator:(id)a4
{
  _BOOL8 v4;
  id v6;
  UIView *v7;
  UIView *dropGlow;
  UIView *v9;
  __int128 v10;
  void *v11;
  UIView *v12;
  void *v13;
  void *v14;
  UIView *v15;
  uint64_t v16;
  UIView *v17;
  UIView *v18;
  char v19;
  _QWORD v20[4];
  UIView *v21;
  SBIconView *v22;
  BOOL v23;
  _QWORD v24[5];
  UIView *v25;
  BOOL v26;
  _OWORD v27[3];

  v4 = a3;
  v6 = a4;
  if (self->_iconImageView)
  {
    if (v4 && !self->_dropGlow)
    {
      v7 = -[SBIconView newComponentBackgroundViewOfType:](self, "newComponentBackgroundViewOfType:", 3);
      dropGlow = self->_dropGlow;
      self->_dropGlow = v7;

      -[SBIconView _configureViewAsFolderIconImageView:](self, "_configureViewAsFolderIconImageView:", self->_dropGlow);
      v9 = self->_dropGlow;
      v10 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
      v27[0] = *MEMORY[0x1E0C9BAA8];
      v27[1] = v10;
      v27[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
      -[UIView setTransform:](v9, "setTransform:", v27);
      -[UIView setAlpha:](self->_dropGlow, "setAlpha:", 0.0);
      -[SBIconView currentImageView](self, "currentImageView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = self->_dropGlow;
      objc_msgSend(v11, "center");
      -[UIView setCenter:](v12, "setCenter:");
      -[SBIconView contentContainerView](self, "contentContainerView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "insertSubview:belowSubview:", self->_dropGlow, v11);

    }
    -[SBIconView superview](self, "superview");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "sendSubviewToBack:", self);

  }
  else if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[SBIconViewCustomImageViewControlling setOverlapping:](self->_customIconImageViewController, "setOverlapping:", v4);
  }
  v15 = self->_dropGlow;
  v16 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __40__SBIconView_setShowsDropGlow_animator___block_invoke;
  v24[3] = &unk_1E8D89918;
  v24[4] = self;
  v26 = v4;
  v17 = v15;
  v25 = v17;
  objc_msgSend(v6, "addAnimations:", v24);
  v20[0] = v16;
  v20[1] = 3221225472;
  v20[2] = __40__SBIconView_setShowsDropGlow_animator___block_invoke_2;
  v20[3] = &unk_1E8D8B9C0;
  v23 = v4;
  v21 = v17;
  v22 = self;
  v18 = v17;
  objc_msgSend(v6, "addCompletion:", v20);
  if (v4)
    v19 = 4;
  else
    v19 = 0;
  *((_BYTE *)self + 557) = *((_BYTE *)self + 557) & 0xFB | v19;

}

void __40__SBIconView_setShowsDropGlow_animator___block_invoke(uint64_t a1)
{
  double v2;
  void *v3;
  __int128 v4;
  void *v5;
  void *v6;
  double v7;
  CGAffineTransform v8;

  objc_msgSend(*(id *)(a1 + 32), "setOverlapping:", *(unsigned __int8 *)(a1 + 48));
  v2 = 1.0;
  if (!*(_BYTE *)(a1 + 48))
    v2 = 0.0;
  objc_msgSend(*(id *)(a1 + 40), "setAlpha:", v2);
  v3 = *(void **)(a1 + 40);
  if (*(_BYTE *)(a1 + 48))
  {
    CGAffineTransformMakeScale(&v8, 1.2, 1.2);
  }
  else
  {
    v4 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    *(_OWORD *)&v8.a = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)&v8.c = v4;
    *(_OWORD *)&v8.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  }
  objc_msgSend(v3, "setTransform:", &v8);
  objc_msgSend(*(id *)(a1 + 32), "_folderIconImageView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  v7 = 1.2;
  if (!*(_BYTE *)(a1 + 48))
    v7 = 1.0;
  objc_msgSend(v5, "setBackgroundScale:", v7, *(_OWORD *)&v8.a, *(_OWORD *)&v8.c, *(_OWORD *)&v8.tx);

}

void __40__SBIconView_setShowsDropGlow_animator___block_invoke_2(uint64_t a1, uint64_t a2)
{
  _QWORD *v3;
  void *v4;
  id v5;

  if (!a2 && !*(_BYTE *)(a1 + 48))
  {
    objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
    v4 = *(void **)(a1 + 32);
    v3 = *(_QWORD **)(a1 + 40);
    if (v4 == (void *)v3[62])
    {
      v3[62] = 0;

      v3 = *(_QWORD **)(a1 + 40);
    }
    objc_msgSend(v3, "_folderIconImageView");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setBackgroundScale:", 1.0);

  }
}

- (void)setShowsFocusEffect:(BOOL)a3
{
  _BOOL4 v3;
  SBIconFocusEffectPlatterView *v5;
  SBIconFocusEffectPlatterView *v6;
  id v7;
  void *v8;
  char v9;
  _QWORD v10[4];
  SBIconFocusEffectPlatterView *v11;
  SBIconView *v12;
  char v13;

  v3 = a3;
  v5 = self->_focusEffectPlatterView;
  v6 = v5;
  if (v3)
  {
    v7 = objc_alloc(MEMORY[0x1E0DC3F38]);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __34__SBIconView_setShowsFocusEffect___block_invoke;
    v10[3] = &unk_1E8D89918;
    v11 = v6;
    v12 = self;
    v13 = 1;
    v8 = (void *)objc_msgSend(v7, "initWithDuration:curve:animations:", 2, v10, 0.1333);
    objc_msgSend(v8, "startAnimation");

    v9 = 8;
  }
  else
  {
    -[SBIconFocusEffectPlatterView removeFromSuperview](v5, "removeFromSuperview");
    if (v6 == self->_focusEffectPlatterView)
    {
      self->_focusEffectPlatterView = 0;

    }
    v9 = 0;
  }
  *((_BYTE *)self + 553) = *((_BYTE *)self + 553) & 0xF7 | v9;

}

uint64_t __34__SBIconView_setShowsFocusEffect___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  double v5;

  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "_focusEffectBoundsForFocused:withFocusOutset:", *(unsigned __int8 *)(a1 + 48), 5.5);
  objc_msgSend(v2, "setBounds:");
  v3 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "_focusEffectCenter");
  objc_msgSend(v3, "setCenter:");
  v4 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "iconImageCornerRadius");
  objc_msgSend(v4, "_setContinuousCornerRadius:", v5 + 5.5);
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

- (CGRect)_focusEffectBounds
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  -[SBIconView _focusEffectBoundsForFocused:withFocusOutset:](self, "_focusEffectBoundsForFocused:withFocusOutset:", (*((unsigned __int8 *)self + 553) >> 3) & 1, 5.5);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (CGRect)_focusEffectBoundsForFocused:(BOOL)a3 withFocusOutset:(double)a4
{
  _BOOL4 v4;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  CGRect result;

  v4 = a3;
  -[SBIconView currentImageView](self, "currentImageView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;

  -[SBIconView customIconImageViewController](self, "customIconImageViewController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v15, "focusEffectBounds");
    v8 = v16;
    v10 = v17;
    v12 = v18;
    v14 = v19;
  }
  UIRectInsetEdges();
  if (v4)
  {
    v8 = v20;
    v10 = v21;
    v12 = v22;
    v14 = v23;
  }

  v24 = v8;
  v25 = v10;
  v26 = v12;
  v27 = v14;
  result.size.height = v27;
  result.size.width = v26;
  result.origin.y = v25;
  result.origin.x = v24;
  return result;
}

- (CGPoint)_focusEffectCenter
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGPoint result;

  -[SBIconView customIconImageViewController](self, "customIconImageViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "focusEffectCenter");
    v5 = v4;
    v7 = v6;
  }
  else
  {
    -[SBIconView currentImageView](self, "currentImageView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "center");
    v5 = v9;
    v7 = v10;

  }
  v11 = v5;
  v12 = v7;
  result.y = v12;
  result.x = v11;
  return result;
}

- (void)setIconFadeFraction:(double)a3
{
  -[SBIconImageCrossfadeView setSourceFadeFraction:](self->_crossfadeView, "setSourceFadeFraction:", a3);
}

- (void)setCrossfadeViewFadeFraction:(double)a3
{
  -[SBIconImageCrossfadeView setCrossfadeViewFadeFraction:](self->_crossfadeView, "setCrossfadeViewFadeFraction:", a3);
}

- (BOOL)isCrossfadingImageWithView
{
  return self->_crossfadeView != 0;
}

- (UIColor)accessibilityTintColor
{
  UIColor *v3;
  void *v4;

  v3 = self->_accessibilityTintColor;
  if (!v3)
  {
    -[SBIconView behaviorDelegate](self, "behaviorDelegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v4, "accessibilityTintColorForIconView:", self);
      v3 = (UIColor *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v3 = 0;
    }

  }
  return v3;
}

+ (id)draggedItemBundleIdentifiersInDrag:(id)a3
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  char isKindOfClass;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(v3, "items", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v9), "localObject");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_self();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) != 0)
        {
          objc_msgSend(v10, "uniqueIdentifier");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (v13)
            objc_msgSend(v4, "addObject:", v13);

        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

  return v4;
}

- (int64_t)draggingStartLocation
{
  void *v3;
  int64_t v4;
  void *v5;

  -[SBIconView location](self, "location");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((SBIconLocationGroupContainsLocation(CFSTR("SBIconLocationGroupFloatingDock"), v3) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((SBIconLocationGroupContainsLocation(CFSTR("SBIconLocationGroupRoot"), v3) & 1) != 0
         || (objc_msgSend(v3, "isEqualToString:", CFSTR("SBIconLocationFolder")) & 1) != 0
         || (SBIconLocationGroupContainsLocation(CFSTR("SBIconLocationGroupDock"), v3) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SBIconLocationStackConfiguration")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SBIconLocationAddWidgetSheet")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((SBIconLocationGroupContainsLocation(CFSTR("SBIconLocationGroupAppLibrary"), v3) & 1) != 0)
  {
    v4 = 4;
  }
  else if (SBIconLocationGroupContainsLocation(CFSTR("SBIconLocationGroupTodayView"), v3))
  {
    v4 = 10;
  }
  else
  {
    v4 = 0;
  }
  -[SBIconView dragDelegate](self, "dragDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v4 = objc_msgSend(v5, "iconView:draggingStartLocationWithProposedStartLocation:", self, v4);

  return v4;
}

- (id)draggingLaunchActions
{
  void *v3;
  void *v4;

  -[SBIconView dragDelegate](self, "dragDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "launchActionsForIconView:", self);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)draggingLaunchURL
{
  void *v3;
  void *v4;

  -[SBIconView dragDelegate](self, "dragDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "launchURLForIconView:", self);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)dragPreviewForItem:(id)a3 session:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(MEMORY[0x1E0DC3768]);
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setBackgroundColor:", v9);

  -[SBIconView dragDelegate](self, "dragDelegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v10, "iconView:dragPreviewForItem:session:previewParameters:", self, v6, v7, v8);
  else
    -[SBIconView defaultDragPreviewWithParameters:](self, "defaultDragPreviewWithParameters:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)defaultDragPreview
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc_init(MEMORY[0x1E0DC3768]);
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v4);

  -[SBIconView defaultDragPreviewWithParameters:](self, "defaultDragPreviewWithParameters:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)defaultDragPreviewWithParameters:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  id v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  char v19;
  CGFloat v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  char v30;
  double v31;
  void *v32;
  id v33;
  void *v34;
  CGFloat v35;
  void *v36;
  void *v37;
  CGAffineTransform v39;
  CGAffineTransform v40;
  CGAffineTransform v41;

  v4 = a3;
  -[SBIconView customIconImageViewController](self, "customIconImageViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconView iconImageInfo](self, "iconImageInfo");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  if (v5)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v5, "snapshotView");
      v12 = (id)objc_claimAutoreleasedReturnValue();
      -[SBIconView _setTemporarySnapshotViewForDragPreview:](self, "_setTemporarySnapshotViewForDragPreview:", v12);
      objc_msgSend(v12, "_setContinuousCornerRadius:", v11);
      objc_msgSend(v12, "setClipsToBounds:", 1);
    }
    else
    {
      objc_msgSend(v5, "view");
      v12 = (id)objc_claimAutoreleasedReturnValue();
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v5, "snapshotViewCenter");
      v22 = v21;
      v24 = v23;
      objc_msgSend(v5, "view");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBIconView convertPoint:fromView:](self, "convertPoint:fromView:", v25, v22, v24);
      v16 = v26;
      v18 = v27;

    }
    else
    {
      -[SBIconView iconImageCenter](self, "iconImageCenter");
      v16 = v28;
      v18 = v29;
    }
    v30 = objc_opt_respondsToSelector();
    v20 = 1.0;
    if ((v30 & 1) != 0)
    {
      objc_msgSend(v5, "snapshotViewScaleFactor");
      v20 = v31;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v5, "snapshotViewVisiblePath");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v32 = 0;
    }
    v19 = v30 ^ 1;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v5, "willUsePreviewParameters:", v4);
    if (v32)
    {
      v33 = v32;
      v34 = v33;
      goto LABEL_19;
    }
  }
  else
  {
    v12 = objc_alloc_init(-[SBIconView expectedIconImageViewClass](self, "expectedIconImageViewClass"));
    -[SBIconView _configureIconImageView:](self, "_configureIconImageView:", v12);
    -[SBIconView icon](self, "icon");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBIconView location](self, "location");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setIcon:location:animated:", v13, v14, 0);

    -[SBIconView iconImageCenter](self, "iconImageCenter");
    v16 = v15;
    v18 = v17;
    v19 = 1;
    v20 = 1.0;
  }
  objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithRoundedRect:cornerRadius:", 0.0, 0.0, v7, v9, v11);
  v33 = (id)objc_claimAutoreleasedReturnValue();
  v34 = 0;
LABEL_19:
  objc_msgSend(v4, "setVisiblePath:", v33);
  memset(&v41, 0, sizeof(v41));
  CGAffineTransformMakeScale(&v41, v20, v20);
  if ((v19 & 1) != 0)
  {
    -[SBIconView effectiveIconContentScale](self, "effectiveIconContentScale");
    v39 = v41;
    CGAffineTransformScale(&v40, &v39, v35, v35);
    v41 = v40;
  }
  v40 = v41;
  objc_msgSend(v12, "setTransform:", &v40);
  v36 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3770]), "initWithContainer:center:", self, v16, v18);
  v37 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D88]), "initWithView:parameters:target:", v12, v4, v36);

  return v37;
}

- (id)dragItems
{
  void *v3;
  void *v4;
  void *v5;
  void *v7;
  void *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  -[SBIconView icon](self, "icon");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3 || (objc_msgSend(v3, "isPlaceholder") & 1) != 0 || -[SBIconView isPaused](self, "isPaused"))
  {
    v5 = (void *)MEMORY[0x1E0C9AA60];
  }
  else
  {
    -[SBIconView dragDelegate](self, "dragDelegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v7, "dragItemsForIconView:", self);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      SBHIconDragItemWithIconAndIconView(v4, self, (void *)*MEMORY[0x1E0DAB500]);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9[0] = v8;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }

  return v5;
}

+ (id)dragContextForDragItem:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  objc_msgSend(a3, "itemProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "teamData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4
    && (v5 = (void *)MEMORY[0x1E0CB3710],
        objc_opt_self(),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v5, "unarchivedObjectOfClass:fromData:error:", v6, v4, 0),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v6,
        v7))
  {
    v8 = objc_alloc(MEMORY[0x1E0DAAD68]);
    objc_msgSend(v7, "uniqueIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v8, "initWithUniqueIdentifier:withLaunchActions:startLocation:", v9, 0, SBHAppDragLocalContextStartLocationToSBSLocation(objc_msgSend(v7, "startLocation")));

    objc_msgSend(v7, "applicationBundleIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setApplicationBundleIdentifier:", v11);

    objc_msgSend(v7, "launchURL");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setLaunchURL:", v12);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)cleanUpAfterDropAnimation
{
  -[SBIconView setGrabbed:](self, "setGrabbed:", 0);
  -[SBIconView setDragging:updateImmediately:](self, "setDragging:updateImmediately:", 0, 1);
  -[SBIconView _setTemporarySnapshotViewForDragPreview:](self, "_setTemporarySnapshotViewForDragPreview:", 0);
  -[SBIconView _updateIconImageViewAnimated:](self, "_updateIconImageViewAnimated:", 0);
}

- (void)cancelDrag
{
  id v2;

  -[SBIconView dragInteraction](self, "dragInteraction");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_cancelDrag");

}

- (void)cancelDragLift
{
  id v2;

  -[SBIconView dragInteraction](self, "dragInteraction");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_cancelLift");

}

- (BOOL)dragsSupportSystemDragsByDefault
{
  return 1;
}

- (id)dragDelegate
{
  void *v3;
  void *v4;
  id v5;
  id v6;

  -[SBIconView overrideDraggingDelegate](self, "overrideDraggingDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[SBIconView delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v5 = v6;
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v6, "draggingDelegateForIconView:", self);
      v5 = (id)objc_claimAutoreleasedReturnValue();

    }
  }

  return v5;
}

- (BOOL)canBeginDrags
{
  void *v3;
  BOOL v4;

  -[SBIconView dragDelegate](self, "dragDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (objc_opt_respondsToSelector() & 1) == 0 || objc_msgSend(v3, "iconViewCanBeginDrags:", self);

  return v4;
}

- (id)supportedIconGridSizeClasses
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  -[SBIconView icon](self, "icon");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "supportedGridSizeClasses");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBIconView behaviorDelegate](self, "behaviorDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v5, "supportedGridSizeClassesForIconView:", self);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "gridSizeClassSetByIntersectingWithGridSizeClassSet:", v6);
    v7 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v7;
  }

  return v4;
}

- (id)supportedIconGridSizeClassesForResize
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  -[SBIconView icon](self, "icon");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "supportedGridSizeClasses");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBIconView behaviorDelegate](self, "behaviorDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v5, "supportedIconGridSizeClassesForResizeOfIconView:", self);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "gridSizeClassSetByUnioningWithGridSizeClassSet:", v6);
    v7 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v7;
  }

  return v4;
}

- (SBHIconGridSizeClassDomain)gridSizeClassDomain
{
  void *v3;
  void *v4;

  -[SBIconView behaviorDelegate](self, "behaviorDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) == 0
    || (objc_msgSend(v3, "gridSizeClassDomainForIconView:", self),
        (v4 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    +[SBHIconGridSizeClassDomain globalDomain](SBHIconGridSizeClassDomain, "globalDomain");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (SBHIconGridSizeClassDomain *)v4;
}

- (id)iconGridSizeClassSizes
{
  void *v2;
  void *v3;

  -[SBIconView listLayout](self, "listLayout");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  SBHIconListLayoutIconGridSizeClassSizes(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)removeAssertion:(id)a3
{
  id v4;

  v4 = a3;
  switch(objc_msgSend(v4, "assertionType"))
  {
    case 0:
      -[SBIconView removeDroppingAssertion:](self, "removeDroppingAssertion:", v4);
      break;
    case 1:
      -[SBIconView removeForbidAccessoryUpdatesAssertion:](self, "removeForbidAccessoryUpdatesAssertion:", v4);
      break;
    case 2:
      -[SBIconView removeBorrowedIconImageViewAssertion:](self, "removeBorrowedIconImageViewAssertion:", v4);
      break;
    case 3:
      -[SBIconView removeForbidContextMenusAssertion:](self, "removeForbidContextMenusAssertion:", v4);
      break;
    default:
      break;
  }

}

- (void)purgeCachedEditingViewData
{
  unsigned int v3;
  int v4;
  SBCloseBoxView *closeBox;

  v3 = *((unsigned __int8 *)self + 552);
  v4 = (v3 >> 2) & 3;
  if (v4)
  {
    if (v4 == 2)
      *((_BYTE *)self + 552) = v3 & 0xF3 | 4;
  }
  else
  {
    -[SBCloseBoxView removeFromSuperview](self->_closeBox, "removeFromSuperview");
    closeBox = self->_closeBox;
    self->_closeBox = 0;

  }
}

- (id)dropDelegate
{
  id v3;
  void *v4;

  -[SBIconView delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "droppingDelegateForIconView:", self);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (id)claimBindingsForDropSession:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _BOOL8 v8;
  id v9;
  id v10;
  id v11;
  void (**v12)(void *, _BOOL8);
  id v13;
  _QWORD aBlock[4];
  id v16;
  id v17;
  id v18;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3778], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sessionForDropSession:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = v3;
  v8 = objc_msgSend(v7, "_dataOwner") == 2 || objc_msgSend(v7, "_dataOwner") == 3;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __42__SBIconView_claimBindingsForDropSession___block_invoke;
  aBlock[3] = &unk_1E8D87728;
  v16 = v7;
  v17 = v6;
  v9 = v4;
  v18 = v9;
  v10 = v6;
  v11 = v7;
  v12 = (void (**)(void *, _BOOL8))_Block_copy(aBlock);
  v12[2](v12, v8);
  v12[2](v12, !v8);
  v13 = v9;

  return v13;
}

void __42__SBIconView_claimBindingsForDropSession___block_invoke(uint64_t a1, unsigned int a2)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  id obj;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
  id v38;
  void *v39;
  void *v40;
  uint64_t v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  id v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  uint8_t buf[4];
  void *v58;
  __int16 v59;
  uint64_t v60;
  _BYTE v61[128];
  _BYTE v62[128];
  _BYTE v63[128];
  uint64_t v64;

  v2 = a1;
  v64 = *MEMORY[0x1E0C80C00];
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "items");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v63, 16);
  if (v31)
  {
    v30 = *(_QWORD *)v54;
    v3 = 0x1E0CA5000uLL;
    v33 = v2;
    do
    {
      v4 = 0;
      do
      {
        if (*(_QWORD *)v54 != v30)
          objc_enumerationMutation(obj);
        v32 = v4;
        v5 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * v4);
        v49 = 0u;
        v50 = 0u;
        v51 = 0u;
        v52 = 0u;
        objc_msgSend(v5, "itemProvider");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "registeredTypeIdentifiers");
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        v36 = v7;
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v49, v62, 16);
        if (v8)
        {
          v9 = v8;
          v10 = *(_QWORD *)v50;
          v34 = *(_QWORD *)v50;
          do
          {
            v11 = 0;
            v35 = v9;
            do
            {
              if (*(_QWORD *)v50 != v10)
                objc_enumerationMutation(v36);
              v12 = *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * v11);
              v47 = 0u;
              v48 = 0u;
              objc_msgSend(*(id *)(v2 + 40), "info");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              v14 = v13;
              if (v13)
              {
                objc_msgSend(v13, "auditToken");
              }
              else
              {
                v47 = 0u;
                v48 = 0u;
              }

              objc_msgSend(*(id *)(v3 + 2248), "documentProxyForName:type:MIMEType:isContentManaged:sourceAuditToken:", 0, v12, 0, a2, &v47);
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              v46 = 0;
              objc_msgSend(v15, "availableClaimBindingsForMode:error:", 2, &v46);
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              v17 = v46;
              if (v16)
              {
                v38 = v17;
                v39 = v15;
                v40 = v16;
                v41 = v11;
                objc_msgSend(*(id *)(v2 + 48), "addObjectsFromArray:", v16);
                v44 = 0u;
                v45 = 0u;
                v42 = 0u;
                v43 = 0u;
                v18 = *(id *)(v2 + 48);
                v19 = -[NSObject countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v42, v61, 16);
                if (v19)
                {
                  v20 = v19;
                  v21 = *(_QWORD *)v43;
                  do
                  {
                    for (i = 0; i != v20; ++i)
                    {
                      if (*(_QWORD *)v43 != v21)
                        objc_enumerationMutation(v18);
                      v23 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
                      SBLogCommon();
                      v24 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
                      {
                        objc_msgSend(v23, "bundleRecord");
                        v25 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v25, "bundleIdentifier");
                        v26 = (void *)objc_claimAutoreleasedReturnValue();
                        *(_DWORD *)buf = 138412546;
                        v58 = v26;
                        v59 = 2112;
                        v60 = v12;
                        _os_log_impl(&dword_1CFEF3000, v24, OS_LOG_TYPE_DEFAULT, "Claim: %@ %@", buf, 0x16u);

                      }
                    }
                    v20 = -[NSObject countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v42, v61, 16);
                  }
                  while (v20);
                  v2 = v33;
                  v10 = v34;
                  v3 = 0x1E0CA5000;
                  v9 = v35;
                }
                v27 = v38;
                v15 = v39;
LABEL_26:

                v16 = v40;
                v11 = v41;
                goto LABEL_27;
              }
              v27 = v17;
              if (v17)
              {
                v40 = 0;
                v41 = v11;
                SBLogCommon();
                v18 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  v58 = v27;
                  _os_log_impl(&dword_1CFEF3000, v18, OS_LOG_TYPE_DEFAULT, "Error looking up LS claim bindings while examining types for drop. Error: %@", buf, 0xCu);
                }
                goto LABEL_26;
              }
LABEL_27:

              ++v11;
            }
            while (v11 != v9);
            v28 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v49, v62, 16);
            v9 = v28;
          }
          while (v28);
        }

        v4 = v32 + 1;
      }
      while (v32 + 1 != v31);
      v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v63, 16);
    }
    while (v31);
  }

}

- (id)URLsForDropSession:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  NSObject *v22;
  NSObject *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t k;
  void *v33;
  dispatch_time_t v34;
  void *v36;
  id obj;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  dispatch_queue_t v41;
  id v42;
  void *v43;
  _QWORD v44[4];
  id v45;
  NSObject *v46;
  id v47;
  NSObject *v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  _BYTE v65[128];
  _BYTE v66[128];
  _BYTE v67[128];
  _BYTE v68[128];
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0DC3778], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sessionForDropSession:", v4);
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0CA5898];
  -[SBIconView icon](self, "icon");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "applicationBundleID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bundleRecordWithBundleIdentifier:allowPlaceholder:error:", v8, 0, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = 0u;
  v62 = 0u;
  v63 = 0u;
  v64 = 0u;
  v36 = v9;
  objc_msgSend(v9, "claimRecords");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v61, v68, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v62;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v62 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * i);
        v57 = 0u;
        v58 = 0u;
        v59 = 0u;
        v60 = 0u;
        objc_msgSend(v16, "URLSchemes");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v57, v67, 16);
        if (v18)
        {
          v19 = v18;
          v20 = *(_QWORD *)v58;
          do
          {
            for (j = 0; j != v19; ++j)
            {
              if (*(_QWORD *)v58 != v20)
                objc_enumerationMutation(v17);
              objc_msgSend(v10, "addObject:", *(_QWORD *)(*((_QWORD *)&v57 + 1) + 8 * j));
            }
            v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v57, v67, 16);
          }
          while (v19);
        }

      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v61, v68, 16);
    }
    while (v13);
  }

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v42 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "count"))
  {
    v22 = dispatch_group_create();
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v23 = objc_claimAutoreleasedReturnValue();
    v41 = dispatch_queue_create("com.apple.SpringBoard.SBIconView.URLsForDropSession.serial-queue", v23);

    v55 = 0u;
    v56 = 0u;
    v53 = 0u;
    v54 = 0u;
    objc_msgSend(v4, "items");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v39 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v66, 16);
    if (v39)
    {
      v38 = *(_QWORD *)v54;
      v24 = (void *)*MEMORY[0x1E0CEC618];
      do
      {
        v25 = 0;
        do
        {
          if (*(_QWORD *)v54 != v38)
            objc_enumerationMutation(obj);
          v40 = v25;
          v26 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * v25);
          v49 = 0u;
          v50 = 0u;
          v51 = 0u;
          v52 = 0u;
          objc_msgSend(v26, "itemProvider");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "registeredTypeIdentifiers");
          v28 = (void *)objc_claimAutoreleasedReturnValue();

          v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v49, v65, 16);
          if (v29)
          {
            v30 = v29;
            v31 = *(_QWORD *)v50;
            do
            {
              for (k = 0; k != v30; ++k)
              {
                if (*(_QWORD *)v50 != v31)
                  objc_enumerationMutation(v28);
                objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * k));
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                if (v33 && objc_msgSend(v24, "conformsToType:", v33))
                {
                  dispatch_group_enter(v22);
                  v44[0] = MEMORY[0x1E0C809B0];
                  v44[1] = 3221225472;
                  v44[2] = __33__SBIconView_URLsForDropSession___block_invoke;
                  v44[3] = &unk_1E8D8B9E8;
                  v45 = v10;
                  v46 = v41;
                  v47 = v42;
                  v48 = v22;
                  objc_msgSend(v43, "loadURLForItem:completion:", v26, v44);

                }
              }
              v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v49, v65, 16);
            }
            while (v30);
          }

          v25 = v40 + 1;
        }
        while (v40 + 1 != v39);
        v39 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v66, 16);
      }
      while (v39);
    }

    v34 = dispatch_time(0, 3000000000);
    dispatch_group_wait(v22, v34);

  }
  return v42;
}

void __33__SBIconView_URLsForDropSession___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;

  v6 = a2;
  if (v6)
  {
    v3 = *(void **)(a1 + 32);
    objc_msgSend(v6, "scheme");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v3) = objc_msgSend(v3, "containsObject:", v4);

    if ((_DWORD)v3)
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __33__SBIconView_URLsForDropSession___block_invoke_2;
      block[3] = &unk_1E8D84EF0;
      v5 = *(NSObject **)(a1 + 40);
      v8 = *(id *)(a1 + 48);
      v9 = v6;
      dispatch_sync(v5, block);

    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));

}

uint64_t __33__SBIconView_URLsForDropSession___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", *(_QWORD *)(a1 + 40));
}

- (BOOL)dropInteraction:(id)a3 canHandleSession:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  NSArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  char v15;
  NSArray *v16;
  NSArray *droppingURLs;
  BOOL v18;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  if (_os_feature_enabled_impl())
  {
    -[SBIconView icon](self, "icon");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "applicationBundleID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "length") && objc_msgSend(v6, "isLeafIcon"))
    {
      v20 = v6;
      -[SBIconView claimBindingsForDropSession:](self, "claimBindingsForDropSession:", v5);
      v21 = 0u;
      v22 = 0u;
      v23 = 0u;
      v24 = 0u;
      v8 = (NSArray *)(id)objc_claimAutoreleasedReturnValue();
      v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v22;
        while (2)
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v22 != v11)
              objc_enumerationMutation(v8);
            objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * i), "bundleRecord");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "bundleIdentifier");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = objc_msgSend(v7, "isEqualToString:", v14);

            if ((v15 & 1) != 0)
            {
              v18 = 1;
              v16 = v8;
              goto LABEL_17;
            }
          }
          v10 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
          if (v10)
            continue;
          break;
        }
      }

      -[SBIconView URLsForDropSession:](self, "URLsForDropSession:", v5);
      v16 = (NSArray *)objc_claimAutoreleasedReturnValue();
      if (-[NSArray count](v16, "count"))
      {
        droppingURLs = self->_droppingURLs;
        self->_droppingURLs = v16;
        v18 = 1;
        v16 = droppingURLs;
      }
      else
      {
        v18 = 0;
      }
LABEL_17:
      v6 = v20;

    }
    else
    {
      v18 = 0;
    }

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (id)dropInteraction:(id)a3 sessionDidUpdate:(id)a4
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3788]), "initWithDropOperation:", 2);
}

- (void)dropInteraction:(id)a3 sessionDidEnter:(id)a4
{
  void *v5;
  id v6;

  v6 = a4;
  -[SBIconView setHighlighted:](self, "setHighlighted:", 1);
  -[SBIconView dropDelegate](self, "dropDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "iconView:dropSessionDidEnter:", self, v6);

}

- (void)dropInteraction:(id)a3 sessionDidExit:(id)a4
{
  NSArray *droppingURLs;
  void *v6;
  id v7;

  v7 = a4;
  -[SBIconView setHighlighted:](self, "setHighlighted:", 0);
  droppingURLs = self->_droppingURLs;
  self->_droppingURLs = 0;

  -[SBIconView dropDelegate](self, "dropDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v6, "iconView:dropSessionDidExit:", self, v7);

}

- (void)dropInteraction:(id)a3 performDrop:(id)a4
{
  id v5;
  SBHIconLaunchContext *v6;
  void *v7;
  NSArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[5];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  if (-[NSArray count](self->_droppingURLs, "count"))
  {
    v6 = objc_alloc_init(SBHIconLaunchContext);
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v8 = self->_droppingURLs;
    v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v19;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v19 != v11)
            objc_enumerationMutation(v8);
          v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3A78]), "initWithURL:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v12));
          objc_msgSend(v7, "addObject:", v13);

          ++v12;
        }
        while (v10 != v12);
        v10 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v10);
    }

    -[SBHIconLaunchContext setActions:](v6, "setActions:", v7);
    -[SBHIconLaunchContext setIconView:](v6, "setIconView:", self);
    -[SBIconView icon](self, "icon");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBIconView location](self, "location");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "launchFromLocation:context:", v15, v6);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3778], "sharedInstance");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "sessionForDropSession:", v5);
    v6 = (SBHIconLaunchContext *)objc_claimAutoreleasedReturnValue();

    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __42__SBIconView_dropInteraction_performDrop___block_invoke;
    v17[3] = &unk_1E8D8BA10;
    v17[4] = self;
    -[SBHIconLaunchContext requestDragContinuationEndpointWithCompletion:](v6, "requestDragContinuationEndpointWithCompletion:", v17);
  }

}

void __42__SBIconView_dropInteraction_performDrop___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;

  v2 = a2;
  v3 = v2;
  if (v2)
  {
    v4 = v2;
    BSDispatchMain();

  }
}

void __42__SBIconView_dropInteraction_performDrop___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  SBHIconLaunchContext *v6;

  v6 = objc_alloc_init(SBHIconLaunchContext);
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3A70]), "initWithDragContinuationEndpoint:", *(_QWORD *)(a1 + 32));
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHIconLaunchContext setActions:](v6, "setActions:", v3);

  -[SBHIconLaunchContext setIconView:](v6, "setIconView:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 40), "icon");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "location");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "launchFromLocation:context:", v5, v6);

}

- (void)dropInteraction:(id)a3 sessionDidEnd:(id)a4
{
  NSArray *droppingURLs;

  -[SBIconView setHighlighted:](self, "setHighlighted:", 0, a4);
  droppingURLs = self->_droppingURLs;
  self->_droppingURLs = 0;

}

- (int64_t)_dropInteraction:(id)a3 dataOwnerForSession:(id)a4
{
  void *v5;
  void *v6;
  int64_t v7;

  -[SBIconView icon](self, "icon", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isLeafIcon"))
  {
    -[SBIconView _visiblyActiveDataSource](self, "_visiblyActiveDataSource");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v7 = objc_msgSend(v6, "dataOwnershipRoleAsDragDropTargetForIcon:", v5);
    else
      v7 = 0;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)dragInteraction:(id)a3 itemsForBeginningSession:(id)a4
{
  void *v5;

  if (-[SBIconView canBeginDrags](self, "canBeginDrags", a3, a4))
  {
    -[SBIconView dragItems](self, "dragItems");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = (void *)MEMORY[0x1E0C9AA60];
  }
  return v5;
}

- (id)dragInteraction:(id)a3 previewForLiftingItem:(id)a4 session:(id)a5
{
  return -[SBIconView dragPreviewForItem:session:](self, "dragPreviewForItem:session:", a4, a5);
}

- (void)dragInteraction:(id)a3 willAnimateLiftWithAnimator:(id)a4 session:(id)a5
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  _QWORD v12[5];
  id v13;
  _QWORD v14[5];

  v7 = a4;
  v8 = a5;
  -[SBIconView setLiftingDragSession:](self, "setLiftingDragSession:", v8);
  -[SBIconView dragDelegate](self, "dragDelegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v9, "iconView:willAnimateDragLiftWithAnimator:session:", self, v7, v8);
  v10 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __66__SBIconView_dragInteraction_willAnimateLiftWithAnimator_session___block_invoke;
  v14[3] = &unk_1E8D84C50;
  v14[4] = self;
  objc_msgSend(v7, "addAnimations:", v14);
  v12[0] = v10;
  v12[1] = 3221225472;
  v12[2] = __66__SBIconView_dragInteraction_willAnimateLiftWithAnimator_session___block_invoke_2;
  v12[3] = &unk_1E8D86588;
  v12[4] = self;
  v13 = v8;
  v11 = v8;
  objc_msgSend(v7, "addCompletion:", v12);

}

uint64_t __66__SBIconView_dragInteraction_willAnimateLiftWithAnimator_session___block_invoke(uint64_t a1)
{
  if ((objc_msgSend(*(id *)(a1 + 32), "isShowingContextMenu") & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "_setForcingIconContentScalingEnabled:", 1);
  objc_msgSend(*(id *)(a1 + 32), "setDragLifted:", 1);
  objc_msgSend(*(id *)(a1 + 32), "_updateIconContentScale");
  return objc_msgSend(*(id *)(a1 + 32), "_updateAllComponentAlphas");
}

uint64_t __66__SBIconView_dragInteraction_willAnimateLiftWithAnimator_session___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "liftingDragSession");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 40);

  if (v2 == v3)
  {
    if ((objc_msgSend(*(id *)(a1 + 32), "isShowingContextMenu") & 1) == 0)
      objc_msgSend(*(id *)(a1 + 32), "_setForcingIconContentScalingEnabled:", 0);
    objc_msgSend(*(id *)(a1 + 32), "setLiftingDragSession:", 0);
    objc_msgSend(*(id *)(a1 + 32), "setDragLifted:", 0);
  }
  objc_msgSend(*(id *)(a1 + 32), "_updateIconContentScale");
  return objc_msgSend(*(id *)(a1 + 32), "_updateAllComponentAlphas");
}

- (void)_dragInteraction:(id)a3 liftAnimationDidChangeDirection:(int64_t)a4
{
  _BOOL8 v6;
  void *v7;
  _QWORD v8[5];
  BOOL v9;

  v6 = a4 != 1;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __63__SBIconView__dragInteraction_liftAnimationDidChangeDirection___block_invoke;
  v8[3] = &unk_1E8D85BB8;
  v8[4] = self;
  v9 = a4 == 1;
  objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:", v8, 0.225);
  -[SBIconView setDragLifted:](self, "setDragLifted:", v6);
  -[SBIconView dragDelegate](self, "dragDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v7, "iconView:dragLiftAnimationDidChangeDirection:", self, a4);

}

uint64_t __63__SBIconView__dragInteraction_liftAnimationDidChangeDirection___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setDragging:updateImmediately:", *(_BYTE *)(a1 + 40) == 0, 1);
}

- (BOOL)dragInteraction:(id)a3 sessionIsRestrictedToDraggingApplication:(id)a4
{
  return 0;
}

- (id)dragInteraction:(id)a3 sessionForAddingItems:(id)a4 withTouchAtPoint:(CGPoint)a5
{
  return (id)objc_msgSend(a4, "firstObject", a3, a5.x, a5.y);
}

- (id)dragInteraction:(id)a3 itemsForAddingToSession:(id)a4 withTouchAtPoint:(CGPoint)a5
{
  id v7;
  id v8;
  SBIcon *icon;
  void *v10;
  void *v11;

  v7 = a3;
  v8 = a4;
  icon = self->_icon;
  if (icon && !-[SBIcon canBeAddedToMultiItemDrag](icon, "canBeAddedToMultiItemDrag"))
  {
    v11 = (void *)MEMORY[0x1E0C9AA60];
  }
  else
  {
    -[SBIconView dragDelegate](self, "dragDelegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0
      && !objc_msgSend(v10, "iconView:canAddDragItemsToSession:", self, v8))
    {
      v11 = (void *)MEMORY[0x1E0C9AA60];
    }
    else
    {
      -[SBIconView dragItems](self, "dragItems");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  return v11;
}

- (void)dragInteraction:(id)a3 session:(id)a4 willAddItems:(id)a5 forInteraction:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;

  v13 = a4;
  v9 = a5;
  v10 = a6;
  -[SBIconView dragInteraction](self, "dragInteraction");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  if (v11 == v10)
  {
    -[SBIconView setAddedToDrag:](self, "setAddedToDrag:", 1);
    -[SBIconView dragDelegate](self, "dragDelegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v12, "iconView:willAddDragItems:toSession:", self, v9, v13);

  }
}

- (void)dragInteraction:(id)a3 sessionWillBegin:(id)a4
{
  -[SBIconView dragSessionWillBegin:](self, "dragSessionWillBegin:", a4);
}

- (void)dragInteraction:(id)a3 session:(id)a4 willEndWithOperation:(unint64_t)a5
{
  -[SBIconView dragSession:willEndWithOperation:](self, "dragSession:willEndWithOperation:", a4, a5);
}

- (void)dragInteraction:(id)a3 session:(id)a4 didEndWithOperation:(unint64_t)a5
{
  -[SBIconView dragSession:didEndWithOperation:](self, "dragSession:didEndWithOperation:", a4, a5);
}

- (void)dragSession:(id)a3 didEndWithOperation:(unint64_t)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[SBIconView setDragging:updateImmediately:](self, "setDragging:updateImmediately:", 0, 1);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v7 = (void *)-[NSHashTable copy](self->_observers, "copy", 0);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v11);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v12, "iconViewDidEndDrag:", self);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v12, "iconView:dragSession:didEndWithOperation:", self, v6, a4);
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }

  -[SBIconView dragDelegate](self, "dragDelegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v13, "iconView:didEndDragSession:withOperation:", self, v6, a4);

}

- (void)dragSession:(id)a3 willEndWithOperation:(unint64_t)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = (void *)-[NSHashTable copy](self->_observers, "copy", 0);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v11);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v12, "iconView:dragSession:willEndWithOperation:", self, v6, a4);
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }

  -[SBIconView dragDelegate](self, "dragDelegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v13, "iconView:session:willEndWithOperation:", self, v6, a4);

}

- (void)dragSessionWillBegin:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SBIconView setDragging:updateImmediately:](self, "setDragging:updateImmediately:", 1, 1);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = (void *)-[NSHashTable copy](self->_observers, "copy", 0);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v9);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v10, "iconViewWillBeginDrag:", self);
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  -[SBIconView dragDelegate](self, "dragDelegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v11, "iconViewWillBeginDrag:session:", self, v4);

}

- (id)dragInteraction:(id)a3 previewForCancellingItem:(id)a4 withDefault:(id)a5
{
  id v7;
  void *v8;
  SBIconView *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  __int128 v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v27;
  id v28;
  _OWORD v29[3];
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v28 = a5;
  -[SBIconView setCancelingDrag:](self, "setCancelingDrag:", 1);
  -[SBIconView dragDelegate](self, "dragDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = self;
  v10 = v9;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v8, "iconViewWillCancelDrag:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v11 = (void *)-[NSHashTable copy](v9->_observers, "copy", v8);
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v31;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v31 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v15);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v16, "iconView:willCancelDragForItem:", v9, v7);
        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    }
    while (v13);
  }

  objc_msgSend(v10, "superview");
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = (void *)v17;
  if (v10 && v17)
  {
    objc_msgSend(v10, "dropContainerView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_alloc(MEMORY[0x1E0DC3770]);
    objc_msgSend(v10, "center");
    objc_msgSend(v19, "convertPoint:fromView:", v18);
    v21 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    v29[0] = *MEMORY[0x1E0C9BAA8];
    v29[1] = v21;
    v29[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    v22 = (void *)objc_msgSend(v20, "initWithContainer:center:transform:", v19, v29);
    v23 = v28;
    objc_msgSend(v28, "retargetedPreviewWithTarget:", v22);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "set_springboardPlatterStyle:", 1);
    -[SBIconView dragDelegate](v9, "dragDelegate");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v25, "iconView:willUsePreviewForCancelling:targetIconView:", v9, v24, v10);

  }
  else
  {
    objc_msgSend(v7, "localObject");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v23 = v28;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(v19, "setCancelsViaScaleAndFade:", 1);
    v24 = 0;
    v25 = v27;
  }

  return v24;
}

- (void)dragInteraction:(id)a3 item:(id)a4 willAnimateCancelWithAnimator:(id)a5
{
  id v7;
  id v8;
  void *v9;
  _QWORD v10[5];

  v7 = a4;
  v8 = a5;
  -[SBIconView dragDelegate](self, "dragDelegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v9, "iconView:item:willAnimateDragCancelWithAnimator:", self, v7, v8);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __65__SBIconView_dragInteraction_item_willAnimateCancelWithAnimator___block_invoke;
  v10[3] = &unk_1E8D863E0;
  v10[4] = self;
  objc_msgSend(v8, "addCompletion:", v10);

}

uint64_t __65__SBIconView_dragInteraction_item_willAnimateCancelWithAnimator___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setCancelingDrag:", 0);
}

- (id)_dragInteraction:(id)a3 sessionPropertiesForSession:(id)a4
{
  void *v5;
  id v6;

  -[SBIconView dragDelegate](self, "dragDelegate", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[SBIconView dragsSupportSystemDragsByDefault](self, "dragsSupportSystemDragsByDefault")
    && ((objc_opt_respondsToSelector() & 1) == 0
     || (objc_msgSend(v5, "dragsSupportSystemDragsForIconView:", self) & 1) != 0))
  {
    v6 = 0;
  }
  else
  {
    v6 = objc_alloc_init(MEMORY[0x1E0DC4108]);
    objc_msgSend(v6, "set_supportsSystemDrag:", 0);
  }

  return v6;
}

- (void)willMoveToWindow:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBIconView;
  v4 = a3;
  -[SBIconView willMoveToWindow:](&v5, sel_willMoveToWindow_, v4);
  -[SBIconView updateWindowSceneUserInterfaceStyleChangeRegistrationForWindow:](self, "updateWindowSceneUserInterfaceStyleChangeRegistrationForWindow:", v4, v5.receiver, v5.super_class);

}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  objc_super v9;

  v6 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBIconView;
  -[SBIconView touchesMoved:withEvent:](&v9, sel_touchesMoved_withEvent_, v6, a4);
  if (_touchesContainNonIndirectTouch(v6))
  {
    -[SBIconView actionDelegate](self, "actionDelegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v6, "anyObject");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "icon:touchMoved:", self, v8);

    }
    else if (-[SBIconView isEnabled](self, "isEnabled")
           && -[SBIconView _delegateTapAllowed](self, "_delegateTapAllowed"))
    {
      -[SBIconView setHighlighted:](self, "setHighlighted:", -[SBIconView isTouchDownInIcon](self, "isTouchDownInIcon"));
    }

  }
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBIconView;
  v6 = a3;
  -[SBIconView touchesEnded:withEvent:](&v7, sel_touchesEnded_withEvent_, v6, a4);
  LODWORD(a4) = _touchesContainNonIndirectTouch(v6);

  if ((_DWORD)a4)
  {
    *((_BYTE *)self + 555) &= ~1u;
    -[SBIconView _delegateTouchEnded:](self, "_delegateTouchEnded:", 0, v7.receiver, v7.super_class);
    -[SBIconView setHighlighted:](self, "setHighlighted:", 0);
  }
}

- (void)setTouchDownInIcon:(BOOL)a3
{
  *((_BYTE *)self + 555) = *((_BYTE *)self + 555) & 0xFE | a3;
}

- (void)_handleTap
{
  -[SBIconView _handleTapWithModifierFlags:](self, "_handleTapWithModifierFlags:", 0);
}

- (void)editingModeGestureRecognizerDidFire:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  void *v13;
  id v14;
  id v15;
  id v16;
  id location;

  v4 = a3;
  if (objc_msgSend(v4, "state") == 1)
  {
    -[SBIconView behaviorDelegate](self, "behaviorDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, self);
    v10 = MEMORY[0x1E0C809B0];
    v11 = 3221225472;
    v12 = __50__SBIconView_editingModeGestureRecognizerDidFire___block_invoke;
    v13 = &unk_1E8D8BA38;
    v6 = v5;
    v14 = v6;
    objc_copyWeak(&v16, &location);
    v15 = v4;
    v7 = _Block_copy(&v10);
    if (-[SBIconView isContextMenuInteractionActive](self, "isContextMenuInteractionActive", v10, v11, v12, v13))
    {
      -[SBIconView dismissContextMenuWithCompletion:](self, "dismissContextMenuWithCompletion:", v7);
    }
    else
    {
      -[SBIconView window](self, "window");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "rootViewController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "dismissViewControllerAnimated:completion:", 1, v7);

    }
    objc_destroyWeak(&v16);

    objc_destroyWeak(&location);
  }

}

void __50__SBIconView_editingModeGestureRecognizerDidFire___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v2 = *(void **)(a1 + 32);
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(v2, "iconView:editingModeGestureRecognizerDidFire:", WeakRetained, *(_QWORD *)(a1 + 40));

  }
}

- (void)consumeSinglePressUpForButtonKind:(int64_t)a3
{
  if (a3 == 1)
    -[SBIconView dismissContextMenuWithCompletion:](self, "dismissContextMenuWithCompletion:", 0);
}

- (BOOL)closeBoxShouldTrack:(id)a3
{
  SBCloseBoxView *v4;
  void *v5;
  SBCloseBoxView *closeBox;
  char v7;

  v4 = (SBCloseBoxView *)a3;
  -[SBIconView behaviorDelegate](self, "behaviorDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  closeBox = self->_closeBox;

  if (closeBox == v4 && (objc_opt_respondsToSelector() & 1) != 0)
    v7 = objc_msgSend(v5, "iconShouldAllowCloseBoxTap:", self);
  else
    v7 = 1;

  return v7;
}

- (void)pressesBegan:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  objc_super v9;

  v6 = a3;
  v7 = a4;
  if (pressesContainSelect(v6))
    -[SBIconView setHighlighted:](self, "setHighlighted:", 1);
  objc_msgSend(v6, "objectsPassingTest:", &__block_literal_global_2346);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if ((*((_BYTE *)self + 553) & 0x40) != 0 && *((char *)self + 553) < 0)
    -[SBIconView iconInteractedWhenDisabled](self, "iconInteractedWhenDisabled");
  if (objc_msgSend(v8, "count"))
  {
    v9.receiver = self;
    v9.super_class = (Class)SBIconView;
    -[SBIconView pressesBegan:withEvent:](&v9, sel_pressesBegan_withEvent_, v8, v7);
  }

}

- (void)pressesChanged:(id)a3 withEvent:(id)a4
{
  id v6;
  void *v7;
  objc_super v8;

  v6 = a4;
  objc_msgSend(a3, "objectsPassingTest:", &__block_literal_global_2346);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count"))
  {
    v8.receiver = self;
    v8.super_class = (Class)SBIconView;
    -[SBIconView pressesChanged:withEvent:](&v8, sel_pressesChanged_withEvent_, v7, v6);
  }

}

- (void)pressesCancelled:(id)a3 withEvent:(id)a4
{
  id v6;
  void *v7;
  objc_super v8;

  v6 = a4;
  objc_msgSend(a3, "objectsPassingTest:", &__block_literal_global_2346);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count"))
  {
    v8.receiver = self;
    v8.super_class = (Class)SBIconView;
    -[SBIconView pressesCancelled:withEvent:](&v8, sel_pressesCancelled_withEvent_, v7, v6);
  }

}

- (void)pressesEnded:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  objc_super v9;

  v6 = a3;
  v7 = a4;
  if (pressesContainSelect(v6))
  {
    -[SBIconView performTap](self, "performTap");
    -[SBIconView setHighlighted:](self, "setHighlighted:", 0);
  }
  objc_msgSend(v6, "objectsPassingTest:", &__block_literal_global_2346);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "count"))
  {
    v9.receiver = self;
    v9.super_class = (Class)SBIconView;
    -[SBIconView pressesEnded:withEvent:](&v9, sel_pressesEnded_withEvent_, v8, v7);
  }

}

- (void)_setTemporarySnapshotViewForDragPreview:(id)a3
{
  id v4;
  UIView *temporarySnapshotContainerViewForDragPreview;
  void *v6;
  UIView *v7;
  UIView *v8;
  UIView *v9;
  id v10;

  v4 = a3;
  temporarySnapshotContainerViewForDragPreview = self->_temporarySnapshotContainerViewForDragPreview;
  v10 = v4;
  if (v4)
  {
    if (temporarySnapshotContainerViewForDragPreview)
    {
      -[UIView subviews](temporarySnapshotContainerViewForDragPreview, "subviews");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "makeObjectsPerformSelector:", sel_removeFromSuperview);

    }
    else
    {
      v8 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
      v9 = self->_temporarySnapshotContainerViewForDragPreview;
      self->_temporarySnapshotContainerViewForDragPreview = v8;

      -[UIView setCenter:](self->_temporarySnapshotContainerViewForDragPreview, "setCenter:", -500.0, -500.0);
    }
    -[UIView addSubview:](self->_temporarySnapshotContainerViewForDragPreview, "addSubview:", v10);
    -[SBIconView addSubview:](self, "addSubview:", self->_temporarySnapshotContainerViewForDragPreview);
  }
  else
  {
    -[UIView removeFromSuperview](temporarySnapshotContainerViewForDragPreview, "removeFromSuperview");
    v7 = self->_temporarySnapshotContainerViewForDragPreview;
    self->_temporarySnapshotContainerViewForDragPreview = 0;

  }
}

- (id)newComponentBackgroundViewOfType:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  -[SBIconView reuseDelegate](self, "reuseDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) == 0)
    goto LABEL_5;
  objc_msgSend(v5, "iconView:backgroundViewForComponentsOfType:", self, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend((id)objc_opt_class(), "groupNameBaseForComponentBackgroundViewOfType:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setGroupNameBase:", v7);

  }
  if (!v6)
  {
LABEL_5:
    v8 = (void *)objc_opt_class();
    -[SBIconView contentContainerView](self, "contentContainerView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "traitCollection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "componentBackgroundViewOfType:compatibleWithTraitCollection:initialWeighting:", a3, v10, 1.0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

+ (id)componentBackgroundView
{
  return (id)objc_msgSend(a1, "componentBackgroundViewOfType:", 0);
}

+ (id)componentBackgroundViewOfType:(int64_t)a3
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0DC3E88], "traitCollectionWithUserInterfaceStyle:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "componentBackgroundViewOfType:compatibleWithTraitCollection:initialWeighting:", a3, v5, 1.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)groupNameBaseForComponentBackgroundViewOfType:(int64_t)a3
{
  if ((unint64_t)a3 > 5)
    return 0;
  else
    return off_1E8D8BB20[a3];
}

+ (int64_t)defaultWidgetBackgroundRecipe
{
  return 3;
}

+ (id)componentBackgroundViewOfType:(int64_t)a3 compatibleWithTraitCollection:(id)a4 initialWeighting:(double)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v19[3];
  _QWORD v20[4];

  v20[3] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = v8;
  if (a3 == 6)
  {
    v10 = 0;
  }
  else
  {
    if (!v8)
    {
      objc_msgSend(MEMORY[0x1E0DC3E88], "traitCollectionWithUserInterfaceStyle:", 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    if (a3 == 4)
    {
      objc_msgSend(MEMORY[0x1E0D47498], "materialViewWithRecipe:", objc_msgSend(a1, "defaultWidgetBackgroundRecipe"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3E88], "traitCollectionWithUserInterfaceStyle:", 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v19[0] = v11;
      v20[0] = CFSTR("folderLight");
      objc_msgSend(MEMORY[0x1E0DC3E88], "traitCollectionWithUserInterfaceStyle:", 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v19[1] = v12;
      v20[1] = CFSTR("folderLight");
      objc_msgSend(MEMORY[0x1E0DC3E88], "traitCollectionWithUserInterfaceStyle:", 2);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v19[2] = v13;
      v20[2] = CFSTR("folderDark");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 3);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      v15 = (void *)MEMORY[0x1E0D47498];
      SBHBundle();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "materialViewWithRecipeNamesByTraitCollection:inBundle:options:initialWeighting:scaleAdjustment:compatibleWithTraitCollection:", v14, v16, 0, 0, v9, a5);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(a1, "groupNameBaseForComponentBackgroundViewOfType:", a3);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setGroupNameBase:", v17);

  }
  return v10;
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  UIPointerInteraction *v7;
  id v8;
  void *v9;
  double top;
  double left;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  void *v21;

  v7 = (UIPointerInteraction *)a3;
  v8 = a5;
  if (-[SBIconView _isCursorInteractionEnabled](self, "_isCursorInteractionEnabled")
    && self->_iconViewCursorInteraction == v7)
  {
    -[SBIconView iconImageFrame](self, "iconImageFrame");
    top = self->_cursorHitTestPadding.top;
    left = self->_cursorHitTestPadding.left;
    v13 = v12 + left;
    v15 = v14 + top;
    v17 = v16 - (left + self->_cursorHitTestPadding.right);
    v19 = v18 - (top + self->_cursorHitTestPadding.bottom);
    v20 = (void *)MEMORY[0x1E0DC3B28];
    objc_msgSend(v8, "identifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "regionWithRect:identifier:", v21, v13, v15, v17, v19);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  void *v4;
  void *v6;
  int v7;
  SBIconImageView *iconImageView;

  if (self->_iconViewCursorInteraction == a3)
  {
    -[SBIconView icon](self, "icon");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isWidgetIcon");

    if (v7)
    {
      -[SBIconView _pointerStyleForWidgetIcon](self, "_pointerStyleForWidgetIcon");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      iconImageView = self->_iconImageView;
      if (iconImageView && !-[SBIconImageView hasOpaqueImage](iconImageView, "hasOpaqueImage"))
      {
        -[SBIconView _pointerStyleForLibraryAdditionalItemsIndicatorIcon](self, "_pointerStyleForLibraryAdditionalItemsIndicatorIcon");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        -[SBIconView _pointerStyleForAppIcon](self, "_pointerStyleForAppIcon");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
      }
    }
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (void)pointerInteraction:(id)a3 willEnterRegion:(id)a4 animator:(id)a5
{
  id v6;
  NSCountedSet *activePointerRegions;
  NSCountedSet *v8;
  NSCountedSet *v9;
  id v10;

  v6 = a4;
  activePointerRegions = self->_activePointerRegions;
  v10 = v6;
  if (!activePointerRegions)
  {
    v8 = (NSCountedSet *)objc_alloc_init(MEMORY[0x1E0CB3550]);
    v9 = self->_activePointerRegions;
    self->_activePointerRegions = v8;

    v6 = v10;
    activePointerRegions = self->_activePointerRegions;
  }
  -[NSCountedSet addObject:](activePointerRegions, "addObject:", v6);

}

- (void)pointerInteraction:(id)a3 willExitRegion:(id)a4 animator:(id)a5
{
  id v7;
  void *v8;
  _QWORD v9[5];
  id v10;

  v7 = a4;
  v8 = v7;
  if (a5)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __57__SBIconView_pointerInteraction_willExitRegion_animator___block_invoke;
    v9[3] = &unk_1E8D853D8;
    v9[4] = self;
    v10 = v7;
    objc_msgSend(a5, "addCompletion:", v9);

  }
  else
  {
    -[NSCountedSet removeObject:](self->_activePointerRegions, "removeObject:", v7);
  }

}

uint64_t __57__SBIconView_pointerInteraction_willExitRegion_animator___block_invoke(uint64_t result, int a2)
{
  if (a2)
    return objc_msgSend(*(id *)(*(_QWORD *)(result + 32) + 792), "removeObject:", *(_QWORD *)(result + 40));
  return result;
}

- (id)_pointerStyleForAppIcon
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  id v11;
  void *v12;
  void *v13;
  SBIconAccessoryView *accessoryView;
  SBCloseBoxView *closeBox;
  void *v16;
  SBIconAccessoryView **v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  SBCloseBoxView *v24;
  SBIconAccessoryView *v25;
  _QWORD v26[3];

  v26[2] = *MEMORY[0x1E0C80C00];
  -[SBIconView currentImageView](self, "currentImageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    v19 = 0;
    goto LABEL_15;
  }
  -[SBIconView iconImageInfo](self, "iconImageInfo");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = objc_alloc_init(MEMORY[0x1E0DC3B78]);
  objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithRoundedRect:cornerRadius:", 0.0, 0.0, v6, v8, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setVisiblePath:", v12);

  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D90]), "initWithView:parameters:", v3, v11);
  objc_msgSend(v13, "set_springboardPlatterStyle:", 1);
  accessoryView = self->_accessoryView;
  closeBox = self->_closeBox;
  if (accessoryView)
  {
    if (closeBox)
    {
      v26[0] = self->_closeBox;
      v26[1] = accessoryView;
      v16 = (void *)MEMORY[0x1E0C99D20];
      v17 = (SBIconAccessoryView **)v26;
      v18 = 2;
LABEL_10:
      objc_msgSend(v16, "arrayWithObjects:count:", v17, v18);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "_setAccessoryViews:", v20);

      goto LABEL_11;
    }
    v25 = self->_accessoryView;
    v16 = (void *)MEMORY[0x1E0C99D20];
    v17 = &v25;
LABEL_9:
    v18 = 1;
    goto LABEL_10;
  }
  if (closeBox)
  {
    v24 = self->_closeBox;
    v16 = (void *)MEMORY[0x1E0C99D20];
    v17 = (SBIconAccessoryView **)&v24;
    goto LABEL_9;
  }
LABEL_11:
  if (-[SBIconView isEditing](self, "isEditing"))
  {
    objc_msgSend(MEMORY[0x1E0DC3B10], "effectWithPreview:", v13);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setPreferredTintMode:", 0);
    v22 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3AF8], "effectWithPreview:", v13);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3B30], "shapeWithRoundedRect:cornerRadius:", 0.0, 0.0, v6, v8, v10);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(MEMORY[0x1E0DC3B38], "styleWithEffect:shape:", v21, v22);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_15:
  return v19;
}

- (id)_pointerStyleForWidgetIcon
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[SBIconView currentImageView](self, "currentImageView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D90]), "initWithView:", v2);
    objc_msgSend(MEMORY[0x1E0DC3B10], "effectWithPreview:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setPrefersShadow:", 1);
    objc_msgSend(MEMORY[0x1E0DC3B38], "styleWithEffect:shape:", v4, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)_pointerStyleForLibraryAdditionalItemsIndicatorIcon
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[SBIconView currentImageView](self, "currentImageView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D90]), "initWithView:", v2);
    objc_msgSend(MEMORY[0x1E0DC3B20], "effectWithPreview:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3B38], "styleWithEffect:shape:", v4, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)canShowCloseBox
{
  void *v3;
  char v4;
  void *v5;
  char v6;

  if ((*((_BYTE *)self + 554) & 0x20) == 0)
    return 0;
  -[SBIconView icon](self, "icon");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isPlaceholder");

  if ((v4 & 1) != 0
    || -[SBIconView isShowingConfigurationCard](self, "isShowingConfigurationCard")
    || -[SBIconView isShowingStackConfigurationCard](self, "isShowingStackConfigurationCard")
    || -[SBIconView isOverlapping](self, "isOverlapping")
    || !-[SBIconView allowsAdornmentsOverIconImage](self, "allowsAdornmentsOverIconImage"))
  {
    return 0;
  }
  -[SBIconView behaviorDelegate](self, "behaviorDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v6 = objc_msgSend(v5, "iconViewDisplaysCloseBox:", self);
  else
    v6 = 1;

  return v6;
}

+ (Class)_closeBoxClassForType:(int64_t)a3
{
  if ((unint64_t)a3 > 1)
    return (Class)0;
  else
    return (Class)(id)objc_opt_self();
}

+ (int64_t)closeBoxTypeForView:(id)a3
{
  id v3;
  void *v4;
  char isKindOfClass;
  int64_t v6;
  void *v7;
  char v8;
  NSObject *v9;

  v3 = a3;
  objc_opt_self();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    v6 = 1;
  }
  else
  {
    objc_opt_self();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_opt_isKindOfClass();

    if ((v8 & 1) == 0)
    {
      SBLogIcon();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        +[SBIconView closeBoxTypeForView:].cold.1((uint64_t)v3, v9);

    }
    v6 = 0;
  }

  return v6;
}

- (int64_t)_closeBoxType
{
  void *v3;
  int64_t v4;

  -[SBIconView behaviorDelegate](self, "behaviorDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v4 = objc_msgSend(v3, "closeBoxTypeForIconView:", self);
  else
    v4 = 0;

  return v4;
}

- (void)_createCloseBoxIfNecessary
{
  int64_t v3;
  SBCloseBoxView *closeBox;
  id v5;
  id v6;
  SBCloseBoxView *v7;
  SBCloseBoxView *v8;
  SBCloseBoxView *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  UIPointerInteraction *v14;
  UIPointerInteraction *closeBoxCursorInteraction;
  id v16;

  -[SBIconView icon](self, "icon");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    v3 = -[SBIconView _closeBoxType](self, "_closeBoxType");
    if (!self->_closeBox)
      goto LABEL_6;
    if (v3 != objc_msgSend((id)objc_opt_class(), "closeBoxTypeForView:", self->_closeBox))
    {
      -[SBCloseBoxView removeFromSuperview](self->_closeBox, "removeFromSuperview");
      closeBox = self->_closeBox;
      self->_closeBox = 0;

    }
    if (!self->_closeBox)
    {
LABEL_6:
      v5 = objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "_closeBoxClassForType:", v3));
      v6 = -[SBIconView newComponentBackgroundViewOfType:](self, "newComponentBackgroundViewOfType:", 1);
      v7 = (SBCloseBoxView *)objc_msgSend(v5, "initWithFrame:backgroundView:", v6, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
      v8 = self->_closeBox;
      self->_closeBox = v7;

      -[SBCloseBoxView setDelegate:](self->_closeBox, "setDelegate:", self);
      v9 = self->_closeBox;
      -[SBIconView listLayout](self, "listLayout");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBCloseBoxView setListLayout:](v9, "setListLayout:", v10);

      v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", self, sel__closeBoxTapGestureChanged_);
      objc_msgSend(v11, "setDelegate:", self);
      -[SBCloseBoxView addGestureRecognizer:](self->_closeBox, "addGestureRecognizer:", v11);
      -[SBCloseBoxView setActionTapGestureRecognizer:](self->_closeBox, "setActionTapGestureRecognizer:", v11);
      -[SBCloseBoxView sizeToFit](self->_closeBox, "sizeToFit");
      -[SBHomeScreenButton materialView](self->_closeBox, "materialView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setLegibilityStyle:", -[_UILegibilitySettings style](self->_legibilitySettings, "style"));

      -[SBIconView badgeParallaxSettings](self, "badgeParallaxSettings");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      SBFApplyParallaxSettingsToView();
      v14 = (UIPointerInteraction *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3B18]), "initWithDelegate:", self->_closeBox);
      closeBoxCursorInteraction = self->_closeBoxCursorInteraction;
      self->_closeBoxCursorInteraction = v14;

      -[SBCloseBoxView addInteraction:](self->_closeBox, "addInteraction:", self->_closeBoxCursorInteraction);
    }
  }

}

uint64_t __43__SBIconView__updateCloseBoxWithAnimation___block_invoke(uint64_t a1)
{
  void *v2;
  __int128 v3;
  _QWORD *v4;
  void *v5;
  _OWORD v7[3];

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 472), "_removeAllAnimations:", 0);
  objc_msgSend(*(id *)(a1 + 32), "_createCloseBoxIfNecessary");
  objc_msgSend(*(id *)(a1 + 40), "addSubview:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 472));
  objc_msgSend(*(id *)(a1 + 40), "bringSubviewToFront:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 472));
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 472);
  v3 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v7[0] = *MEMORY[0x1E0C9BAA8];
  v7[1] = v3;
  v7[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  objc_msgSend(v2, "setTransform:", v7);
  v4 = *(_QWORD **)(a1 + 32);
  v5 = (void *)v4[59];
  objc_msgSend(v4, "effectiveIconAccessoryAlpha");
  objc_msgSend(v5, "setAlpha:");
  objc_msgSend(*(id *)(a1 + 32), "setNeedsLayout");
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

uint64_t __43__SBIconView__updateCloseBoxWithAnimation___block_invoke_2(uint64_t a1)
{
  void *v2;
  CGAffineTransform v4;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 472);
  CGAffineTransformMakeScale(&v4, 0.01, 0.01);
  objc_msgSend(v2, "setTransform:", &v4);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 472), "setAlpha:", 0.0);
}

uint64_t __43__SBIconView__updateCloseBoxWithAnimation___block_invoke_3(uint64_t a1)
{
  void *v2;
  __int128 v3;
  void *v4;
  _OWORD v6[3];

  v2 = *(void **)(a1 + 32);
  v3 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v6[0] = *MEMORY[0x1E0C9BAA8];
  v6[1] = v3;
  v6[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  objc_msgSend(v2, "setTransform:", v6);
  v4 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "effectiveIconAccessoryAlpha");
  return objc_msgSend(v4, "setAlpha:");
}

uint64_t __43__SBIconView__updateCloseBoxWithAnimation___block_invoke_4(uint64_t a1)
{
  void *v2;
  CGAffineTransform v4;

  v2 = *(void **)(a1 + 32);
  CGAffineTransformMakeScale(&v4, 0.01, 0.01);
  objc_msgSend(v2, "setTransform:", &v4);
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

- (void)_animateCloseBoxWithAnimation:(int64_t)a3 animationBlock:(id)a4
{
  id v6;
  id v7;
  double v8;
  double v9;
  void *v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, uint64_t);
  void *v15;
  SBIconView *v16;
  id v17[2];
  id location;

  v6 = a4;
  if (a3 == 1)
  {
    v7 = objc_alloc(MEMORY[0x1E0DC3F38]);
    v8 = 1.73557;
    v9 = 0.4;
  }
  else
  {
    if (a3)
    {
LABEL_7:
      objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v6);
      -[SBIconView _checkAndRemoveCloseBoxAfterAnimation](self, "_checkAndRemoveCloseBoxAfterAnimation");
      -[SBIconView setCloseBoxAnimator:](self, "setCloseBoxAnimator:", 0);
      goto LABEL_8;
    }
    v7 = objc_alloc(MEMORY[0x1E0DC3F38]);
    v8 = 0.34071;
    v9 = 0.9;
  }
  v10 = (void *)objc_msgSend(v7, "initWithDuration:dampingRatio:animations:", v6, v8, v9);
  if (!v10)
    goto LABEL_7;
  v11 = -[SBIconView shouldShowCloseBox](self, "shouldShowCloseBox");
  objc_initWeak(&location, v10);
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __59__SBIconView__animateCloseBoxWithAnimation_animationBlock___block_invoke;
  v15 = &unk_1E8D8BA60;
  v17[1] = (id)v11;
  v16 = self;
  objc_copyWeak(v17, &location);
  objc_msgSend(v10, "addCompletion:", &v12);
  -[SBIconView setCloseBoxAnimator:](self, "setCloseBoxAnimator:", v10, v12, v13, v14, v15, v16);
  objc_msgSend(v10, "startAnimation");
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);

LABEL_8:
}

void __59__SBIconView__animateCloseBoxWithAnimation_animationBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  id v4;

  if (*(_QWORD *)(a1 + 48) == a2)
    objc_msgSend(*(id *)(a1 + 32), "_checkAndRemoveCloseBoxAfterAnimation");
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "closeBoxAnimator");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if (WeakRetained == v4)
    objc_msgSend(*(id *)(a1 + 32), "setCloseBoxAnimator:", 0);
}

- (void)_checkAndRemoveCloseBoxAfterAnimation
{
  SBCloseBoxView *closeBox;

  if (!-[SBIconView _isShowingCloseBox](self, "_isShowingCloseBox"))
  {
    -[SBCloseBoxView removeFromSuperview](self->_closeBox, "removeFromSuperview");
    if ((*((_BYTE *)self + 552) & 0xC) == 4)
    {
      closeBox = self->_closeBox;
      self->_closeBox = 0;

    }
  }
  *((_BYTE *)self + 552) &= 0xF3u;
}

- (void)_setShowingCloseBox:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *((_BYTE *)self + 556) = *((_BYTE *)self + 556) & 0xEF | v3;
}

- (void)_closeBoxTapGestureChanged:(id)a3
{
  id v4;

  if (objc_msgSend(a3, "state") == 3)
  {
    -[SBIconView actionDelegate](self, "actionDelegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v4, "iconCloseBoxTapped:", self);

  }
}

- (BOOL)allowsBlockedForScreenTimeExpiration
{
  return (*((_BYTE *)self + 557) & 0x40) == 0;
}

- (void)setAllowsBlockedForScreenTimeExpiration:(BOOL)a3
{
  char v3;
  char v5;

  v3 = *((_BYTE *)self + 557);
  if (a3 == (v3 & 0x40) >> 6)
  {
    if (a3)
      v5 = 0;
    else
      v5 = 64;
    *((_BYTE *)self + 557) = v3 & 0xBF | v5;
    -[SBIconView _updateBrightness](self, "_updateBrightness");
    -[SBIconView _updateLabelArea](self, "_updateLabelArea");
  }
}

- (BOOL)allowsResizeHandle
{
  return (*((unsigned __int8 *)self + 554) >> 6) & 1;
}

- (void)setAllowsResizeHandle:(BOOL)a3
{
  char v3;
  char v4;

  v3 = *((_BYTE *)self + 554);
  if (((((v3 & 0x40) == 0) ^ a3) & 1) == 0)
  {
    if (a3)
      v4 = 64;
    else
      v4 = 0;
    *((_BYTE *)self + 554) = v3 & 0xBF | v4;
    -[SBIconView _updateResizeHandleAnimated:](self, "_updateResizeHandleAnimated:", 1);
  }
}

- (BOOL)shouldShowResizeHandle
{
  _BOOL4 v3;

  v3 = -[SBIconView isEditing](self, "isEditing");
  if (v3)
    LOBYTE(v3) = -[SBIconView canShowResizeHandle](self, "canShowResizeHandle");
  return v3;
}

- (BOOL)canShowResizeHandle
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;

  if (!-[SBIconView allowsResizeHandle](self, "allowsResizeHandle"))
    return 0;
  -[SBIconView icon](self, "icon");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "supportedGridSizeClasses");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v4, "count") < 2
    || -[SBIconView isShowingConfigurationCard](self, "isShowingConfigurationCard")
    || -[SBIconView isShowingStackConfigurationCard](self, "isShowingStackConfigurationCard")
    || !-[SBIconView allowsAdornmentsOverIconImage](self, "allowsAdornmentsOverIconImage"))
  {
    v6 = 0;
  }
  else
  {
    -[SBIconView behaviorDelegate](self, "behaviorDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (objc_opt_respondsToSelector() & 1) == 0
      || objc_msgSend(v5, "iconViewDisplaysResizeHandle:", self);

  }
  return v6;
}

- (BOOL)isShowingResizeHandle
{
  return self->_resizeHandle != 0;
}

- (void)_updateResizeHandleAnimated:(BOOL)a3
{
  _BOOL4 v3;
  _BOOL4 v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  id v15;
  double v16;
  double v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  uint64_t v22;
  _QWORD v23[4];
  id v24;
  _QWORD v25[4];
  id v26;
  _QWORD v27[4];
  id v28;
  double v29;
  _QWORD v30[4];
  id v31;
  _QWORD v32[4];
  id v33;
  uint64_t v34;
  uint64_t v35;

  v3 = a3;
  v5 = -[SBIconView shouldShowResizeHandle](self, "shouldShowResizeHandle");
  v6 = -[SBIconView isShowingResizeHandle](self, "isShowingResizeHandle");
  if (!v5 || v6)
  {
    if (v5 || !v6)
      return;
    -[SBIconView resizeHandle](self, "resizeHandle");
    v15 = (id)objc_claimAutoreleasedReturnValue();
    -[SBIconView setResizeHandle:](self, "setResizeHandle:", 0);
    if (v3)
    {
      v21 = (void *)MEMORY[0x1E0DC3F10];
      v22 = MEMORY[0x1E0C809B0];
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = __42__SBIconView__updateResizeHandleAnimated___block_invoke_4;
      v25[3] = &unk_1E8D84C50;
      v26 = v15;
      v23[0] = v22;
      v23[1] = 3221225472;
      v23[2] = __42__SBIconView__updateResizeHandleAnimated___block_invoke_5;
      v23[3] = &unk_1E8D84F68;
      v15 = v26;
      v24 = v15;
      objc_msgSend(v21, "animateWithDuration:animations:completion:", v25, v23, 0.3);

    }
    else
    {
      objc_msgSend(v15, "removeFromSuperview");
    }
  }
  else
  {
    -[SBIconView _makeResizeHandle](self, "_makeResizeHandle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBIconView setResizeHandle:](self, "setResizeHandle:", v7);
    -[SBIconView contentContainerView](self, "contentContainerView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addSubview:", v7);
    -[SBIconView _centerForResizeHandle](self, "_centerForResizeHandle");
    v10 = v9;
    v12 = v11;
    v13 = (void *)MEMORY[0x1E0DC3F10];
    v14 = MEMORY[0x1E0C809B0];
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __42__SBIconView__updateResizeHandleAnimated___block_invoke;
    v32[3] = &unk_1E8D886D8;
    v15 = v7;
    v33 = v15;
    v34 = v10;
    v35 = v12;
    objc_msgSend(v13, "performWithoutAnimation:", v32);
    -[SBIconView effectiveIconAccessoryAlpha](self, "effectiveIconAccessoryAlpha");
    v17 = v16;
    if (v3)
    {
      v18 = (void *)MEMORY[0x1E0DC3F10];
      v30[0] = v14;
      v30[1] = 3221225472;
      v30[2] = __42__SBIconView__updateResizeHandleAnimated___block_invoke_2;
      v30[3] = &unk_1E8D84C50;
      v19 = v15;
      v31 = v19;
      objc_msgSend(v18, "performWithoutAnimation:", v30);
      v20 = (void *)MEMORY[0x1E0DC3F10];
      v27[0] = v14;
      v27[1] = 3221225472;
      v27[2] = __42__SBIconView__updateResizeHandleAnimated___block_invoke_3;
      v27[3] = &unk_1E8D84C78;
      v28 = v19;
      v29 = v17;
      objc_msgSend(v20, "animateWithDuration:animations:", v27, 0.3);

    }
    else
    {
      objc_msgSend(v15, "setAlpha:", v16);
    }

  }
}

uint64_t __42__SBIconView__updateResizeHandleAnimated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setCenter:", *(double *)(a1 + 40), *(double *)(a1 + 48));
}

uint64_t __42__SBIconView__updateResizeHandleAnimated___block_invoke_2(uint64_t a1)
{
  void *v2;
  CGAffineTransform v4;

  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
  v2 = *(void **)(a1 + 32);
  CGAffineTransformMakeScale(&v4, 0.75, 0.75);
  return objc_msgSend(v2, "setTransform:", &v4);
}

uint64_t __42__SBIconView__updateResizeHandleAnimated___block_invoke_3(uint64_t a1)
{
  void *v2;
  __int128 v3;
  _OWORD v5[3];

  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", *(double *)(a1 + 40));
  v2 = *(void **)(a1 + 32);
  v3 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v5[0] = *MEMORY[0x1E0C9BAA8];
  v5[1] = v3;
  v5[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  return objc_msgSend(v2, "setTransform:", v5);
}

uint64_t __42__SBIconView__updateResizeHandleAnimated___block_invoke_4(uint64_t a1)
{
  void *v2;
  CGAffineTransform v4;

  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
  v2 = *(void **)(a1 + 32);
  CGAffineTransformMakeScale(&v4, 0.75, 0.75);
  return objc_msgSend(v2, "setTransform:", &v4);
}

uint64_t __42__SBIconView__updateResizeHandleAnimated___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
}

- (id)_makeResizeHandle
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  uint64_t v13;
  SBHIconResizeHandle *v14;
  SBHIconResizeHandle *v15;
  void *v16;
  UIPointerInteraction *v17;
  UIPointerInteraction *resizeHandleCursorInteraction;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;

  v3 = -[SBIconView newComponentBackgroundViewOfType:](self, "newComponentBackgroundViewOfType:", 5);
  -[SBIconView iconImageInfo](self, "iconImageInfo");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v25 = 0u;
  SBIconResizeHandleMetricsForIconResizingSettings(self->_iconResizingSettings, (uint64_t)&v25);
  -[SBIconView behaviorDelegate](self, "behaviorDelegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    if (v12)
    {
      objc_msgSend(v12, "resizeHandleMetricsForIconView:", self);
    }
    else
    {
      v23 = 0u;
      v24 = 0u;
      v21 = 0u;
      v22 = 0u;
      v20 = 0u;
    }
    v27 = v22;
    v28 = v23;
    v29 = v24;
    v25 = v20;
    v26 = v21;
  }
  else if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v12, "pathLengthForResizeHandleOfIconView:", self);
    *((_QWORD *)&v25 + 1) = v13;
  }
  v14 = [SBHIconResizeHandle alloc];
  v22 = v27;
  v23 = v28;
  v24 = v29;
  v20 = v25;
  v21 = v26;
  v15 = -[SBHIconResizeHandle initWithMetrics:iconImageInfo:backgroundView:](v14, "initWithMetrics:iconImageInfo:backgroundView:", &v20, v3, v5, v7, v9, v11);
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3AA0]), "initWithTarget:action:", self, sel_resizeGestureRecognizerDidUpdate_);
  objc_msgSend(v16, "_setHysteresis:", 0.0);
  objc_msgSend(v16, "setDelaysTouchesBegan:", 0);
  -[SBHIconResizeHandle setResizingGestureRecognizer:](v15, "setResizingGestureRecognizer:", v16);
  -[SBHIconResizeHandle setAccessibilityIdentifier:](v15, "setAccessibilityIdentifier:", CFSTR("icon-resize-handle"));
  v17 = (UIPointerInteraction *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3B18]), "initWithDelegate:", v15);
  resizeHandleCursorInteraction = self->_resizeHandleCursorInteraction;
  self->_resizeHandleCursorInteraction = v17;

  -[SBHIconResizeHandle addInteraction:](v15, "addInteraction:", self->_resizeHandleCursorInteraction);
  return v15;
}

- (CGPoint)_centerForResizeHandle
{
  void *v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  double v13;
  double v14;
  double v15;
  uint64_t v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  double v24;
  CGPoint result;
  CGRect v26;

  -[SBIconView resizeHandle](self, "resizeHandle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconView iconImageFrame](self, "iconImageFrame");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  objc_msgSend(v3, "sizeThatFits:", v8, v10);
  v13 = v12;
  v15 = v14 * 0.5;
  v16 = objc_msgSend((id)*MEMORY[0x1E0DC4730], "userInterfaceLayoutDirection");
  v17 = v5;
  v18 = v7;
  v19 = v9;
  v20 = v11;
  if (v16 == 1)
    v21 = v15 + CGRectGetMinX(*(CGRect *)&v17);
  else
    v21 = CGRectGetMaxX(*(CGRect *)&v17) - v15;
  v26.origin.x = v5;
  v26.origin.y = v7;
  v26.size.width = v9;
  v26.size.height = v11;
  v22 = CGRectGetMaxY(v26) + v13 * -0.5;

  v23 = v21;
  v24 = v22;
  result.y = v24;
  result.x = v23;
  return result;
}

- (BOOL)isResizing
{
  return *((unsigned __int8 *)self + 559) >> 7;
}

- (void)setResizing:(BOOL)a3
{
  unsigned int v3;
  char v4;

  v3 = *((unsigned __int8 *)self + 559);
  if (a3 != v3 >> 7)
  {
    if (a3)
      v4 = 0x80;
    else
      v4 = 0;
    *((_BYTE *)self + 559) = v4 & 0x80 | v3 & 0x7F;
    -[SBIconView _updateJitter](self, "_updateJitter");
  }
}

- (void)resizeGestureRecognizerDidUpdate:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  char v7;
  _BOOL8 v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  NSMutableDictionary *resizeGestureContext;
  NSObject *v15;
  uint64_t v16;
  NSMutableDictionary *v17;
  NSObject *v18;
  void *v19;
  char v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  NSMutableDictionary *v26;
  void *v27;
  void *v28;
  int v29;
  double v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  _BOOL4 v38;
  double v39;
  double v40;
  _BOOL4 v42;
  uint64_t v44;
  NSMutableDictionary *v45;
  uint64_t v46;
  NSMutableDictionary *v47;
  NSMutableDictionary *v48;
  NSMutableDictionary *v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  double v54;
  double v55;
  double v56;
  double v57;
  NSObject *v58;
  _QWORD v59[4];
  id v60;
  SBIconView *v61;
  CGAffineTransform v62;
  _QWORD v63[4];
  NSMutableDictionary *v64;
  _QWORD v65[2];
  _QWORD v66[2];
  uint8_t buf[4];
  double v68;
  __int16 v69;
  double v70;
  __int16 v71;
  double v72;
  __int16 v73;
  double v74;
  uint64_t v75;

  v75 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SBIconView resizeHandle](self, "resizeHandle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "state");
  v7 = v6 - 1;
  if ((unint64_t)(v6 - 1) <= 4 && ((0x1Du >> v7) & 1) != 0)
  {
    v8 = (v7 & 0x1F) == 0;
    -[SBIconView setResizing:](self, "setResizing:", v8);
    objc_msgSend(v5, "setHighlighted:", v8);
    objc_msgSend(v5, "setResizing:", v8);
  }
  -[SBIconView resizeGestureHandler](self, "resizeGestureHandler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    if ((unint64_t)(v6 - 3) < 3)
    {
      objc_msgSend(v5, "setHighlighted:", 0);
      objc_msgSend(v5, "setResizing:", 0);
      -[SBIconView setNeedsLayout](self, "setNeedsLayout");
      -[SBIconView currentImageView](self, "currentImageView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)MEMORY[0x1E0DC3F10];
      v59[0] = MEMORY[0x1E0C809B0];
      v59[1] = 3221225472;
      v59[2] = __47__SBIconView_resizeGestureRecognizerDidUpdate___block_invoke_657;
      v59[3] = &unk_1E8D84EF0;
      v10 = v11;
      v60 = v10;
      v61 = self;
      objc_msgSend(v12, "animateWithDuration:animations:", v59, 0.3);
      -[SBIconView behaviorDelegate](self, "behaviorDelegate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v13, "iconViewDidEndTrackingPossibleResize:context:", self, self->_resizeGestureContext);
      resizeGestureContext = self->_resizeGestureContext;
      self->_resizeGestureContext = 0;

      goto LABEL_10;
    }
    if (v6 == 2)
    {
      -[NSMutableDictionary objectForKey:](self->_resizeGestureContext, "objectForKey:", CFSTR("SBIconViewGestureResizing"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "BOOLValue");

      if ((v20 & 1) != 0)
        goto LABEL_11;
      -[NSMutableDictionary objectForKey:](self->_resizeGestureContext, "objectForKey:", CFSTR("SBIconViewGestureResizeFinishTime"));
      v10 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "locationInView:", v5);
      v22 = v21;
      v24 = v23;
      if (v10)
      {
        objc_msgSend(v10, "unsignedLongLongValue");
        mach_continuous_time();
        BSTimeDifferenceFromMachTimeToMachTime();
        if (v25 < 0.2)
          goto LABEL_10;
        -[NSMutableDictionary removeObjectForKey:](self->_resizeGestureContext, "removeObjectForKey:", CFSTR("SBIconViewGestureResizeFinishTime"));
        v26 = self->_resizeGestureContext;
        *(double *)v65 = v22;
        *(double *)&v65[1] = v24;
        objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v65, "{CGPoint=dd}");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKey:](v26, "setObject:forKey:", v27, CFSTR("SBIconViewGestureCenterPoint"));

      }
      -[NSMutableDictionary objectForKey:](self->_resizeGestureContext, "objectForKey:", CFSTR("SBIconViewGestureHasResized"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v28, "BOOLValue");

      if (v29)
        v30 = 10.0;
      else
        v30 = 20.0;
      -[NSMutableDictionary objectForKey:](self->_resizeGestureContext, "objectForKey:", CFSTR("SBIconViewGestureCenterPoint"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "CGPointValue");
      v33 = v32;
      v35 = v34;

      v36 = vabdd_f64(v22, v33);
      v37 = vabdd_f64(v24, v35);
      v38 = v37 > v30;
      if (v36 > v30)
        v38 = 0;
      v39 = v22 - v33;
      v40 = v24 - v35;
      if (v37 <= v30 && v36 <= v30)
      {
        if ((v29 & 1) != 0)
          goto LABEL_10;
        v54 = v36 / 20.0;
        v55 = v37 / 20.0;
        if (v39 >= 0.0)
          v56 = v54 * 0.1;
        else
          v56 = -(v54 * 0.1);
        if (v40 >= 0.0)
          v57 = v55 * 0.1;
        else
          v57 = -(v55 * 0.1);
        SBLogWidgets();
        v58 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v58, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 134218752;
          v68 = v56;
          v69 = 2048;
          v70 = v57;
          v71 = 2048;
          v72 = v54;
          v73 = 2048;
          v74 = v55;
          _os_log_debug_impl(&dword_1CFEF3000, v58, OS_LOG_TYPE_DEBUG, "updating gesture resize scale to %f,%f (progress: %f,%f)", buf, 0x2Au);
        }

        -[SBIconView currentImageView](self, "currentImageView");
        v17 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
        CGAffineTransformMakeScale(&v62, v56 + 1.0, v57 + 1.0);
        -[NSMutableDictionary setTransform:](v17, "setTransform:", &v62);
        -[SBIconView setNeedsLayout](self, "setNeedsLayout");
        objc_msgSend(v5, "setHighlighted:", 1);
      }
      else
      {
        v42 = v36 > v37;
        if (v37 <= v30)
          v42 = 1;
        if (v40 >= 0.0)
          v38 = 0;
        if (v36 <= v30 || !v42)
          v44 = v38;
        else
          v44 = v39 < 0.0;
        v45 = self->_resizeGestureContext;
        v46 = MEMORY[0x1E0C9AAB0];
        -[NSMutableDictionary setObject:forKey:](v45, "setObject:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("SBIconViewGestureResizing"));
        -[NSMutableDictionary setObject:forKey:](v45, "setObject:forKey:", v46, CFSTR("SBIconViewGestureHasResized"));
        v63[0] = MEMORY[0x1E0C809B0];
        v63[1] = 3221225472;
        v63[2] = __47__SBIconView_resizeGestureRecognizerDidUpdate___block_invoke;
        v63[3] = &unk_1E8D84C50;
        v64 = v45;
        v17 = v45;
        -[SBIconView _initiateResizeToSmallerSize:completionHandler:](self, "_initiateResizeToSmallerSize:completionHandler:", v44, v63);

      }
    }
    else
    {
      if (v6 != 1)
        goto LABEL_11;
      SBLogWidgetResizing();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1CFEF3000, v15, OS_LOG_TYPE_DEFAULT, "starting gesture for resize", buf, 2u);
      }

      objc_msgSend(v5, "setHighlighted:", 1);
      objc_msgSend(v5, "setResizing:", 1);
      -[SBIconView behaviorDelegate](self, "behaviorDelegate");
      v10 = (id)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) == 0
        || (objc_msgSend(v10, "resizeGestureHandlerForIconView:", self), (v16 = objc_claimAutoreleasedReturnValue()) == 0))
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          v47 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
          v48 = self->_resizeGestureContext;
          self->_resizeGestureContext = v47;

          v49 = self->_resizeGestureContext;
          v50 = (void *)MEMORY[0x1E0CB3B18];
          objc_msgSend(v5, "bounds");
          UIRectGetCenter();
          v66[0] = v51;
          v66[1] = v52;
          objc_msgSend(v50, "valueWithBytes:objCType:", v66, "{CGPoint=dd}");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary setObject:forKey:](v49, "setObject:forKey:", v53, CFSTR("SBIconViewGestureCenterPoint"));

          objc_msgSend(v10, "iconViewDidBeginTrackingPossibleResize:context:", self, self->_resizeGestureContext);
        }
        goto LABEL_10;
      }
      v17 = (NSMutableDictionary *)v16;
      SBLogWidgetResizing();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v68 = *(double *)&v17;
        _os_log_impl(&dword_1CFEF3000, v18, OS_LOG_TYPE_DEFAULT, "got gesture handler for resize: %@", buf, 0xCu);
      }

      -[SBIconView setResizeGestureHandler:](self, "setResizeGestureHandler:", v17);
      -[NSMutableDictionary iconView:resizeGestureRecognizerDidUpdate:](v17, "iconView:resizeGestureRecognizerDidUpdate:", self, v4);
    }

    goto LABEL_10;
  }
  v10 = v9;
  objc_msgSend(v9, "iconView:resizeGestureRecognizerDidUpdate:", self, v4);
LABEL_10:

LABEL_11:
}

void __47__SBIconView_resizeGestureRecognizerDidUpdate___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  uint8_t v5[16];

  objc_msgSend(*(id *)(a1 + 32), "removeObjectForKey:", CFSTR("SBIconViewGestureResizing"));
  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", mach_continuous_time());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v3, CFSTR("SBIconViewGestureResizeFinishTime"));

  SBLogWidgets();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1CFEF3000, v4, OS_LOG_TYPE_INFO, "gesture resize animation finished", v5, 2u);
  }

}

uint64_t __47__SBIconView_resizeGestureRecognizerDidUpdate___block_invoke_657(uint64_t a1)
{
  void *v2;
  __int128 v3;
  _OWORD v5[3];

  v2 = *(void **)(a1 + 32);
  v3 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v5[0] = *MEMORY[0x1E0C9BAA8];
  v5[1] = v3;
  v5[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  objc_msgSend(v2, "setTransform:", v5);
  return objc_msgSend(*(id *)(a1 + 40), "layoutIfNeeded");
}

- (id)nextSmallerGridSizeClassForResize
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[SBIconView icon](self, "icon");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconView supportedIconGridSizeClassesForResize](self, "supportedIconGridSizeClassesForResize");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconView iconGridSizeClassSizes](self, "iconGridSizeClassSizes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "gridSizeClass");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "gridSizeClassSmallerThanGridSizeClass:allowedGridSizeClasses:", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)nextLargerGridSizeClassForResize
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[SBIconView icon](self, "icon");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconView supportedIconGridSizeClassesForResize](self, "supportedIconGridSizeClassesForResize");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconView iconGridSizeClassSizes](self, "iconGridSizeClassSizes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "gridSizeClass");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "gridSizeClassLargerThanGridSizeClass:allowedGridSizeClasses:", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)_initiateResizeToSmallerSize:(BOOL)a3 completionHandler:(id)a4
{
  _BOOL4 v4;
  void (**v6)(_QWORD);
  void *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v4 = a3;
  v13 = *MEMORY[0x1E0C80C00];
  v6 = (void (**)(_QWORD))a4;
  if (v4)
    -[SBIconView nextSmallerGridSizeClassForResize](self, "nextSmallerGridSizeClassForResize");
  else
    -[SBIconView nextLargerGridSizeClassForResize](self, "nextLargerGridSizeClassForResize");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    SBLogWidgets();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 138543362;
      v12 = v7;
      _os_log_impl(&dword_1CFEF3000, v8, OS_LOG_TYPE_DEFAULT, "initiating gesture resize to grid size %{public}@", (uint8_t *)&v11, 0xCu);
    }

    -[SBIconView actionDelegate](self, "actionDelegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v9, "iconView:wantsResizeToGridSizeClass:completionHandler:", self, v7, v6);
    }
    else if (v6)
    {
      SBLogWidgets();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v11 = 138543362;
        v12 = v7;
        _os_log_impl(&dword_1CFEF3000, v10, OS_LOG_TYPE_DEFAULT, "Can't initiate resize to %{public}@ because delegate doesn't implement", (uint8_t *)&v11, 0xCu);
      }

      v6[2](v6);
    }

  }
  else if (v6)
  {
    v6[2](v6);
  }

}

void __32__SBIconView_hitTest_withEvent___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v7;
  uint64_t v8;
  void *v9;

  objc_msgSend(a2, "convertPoint:fromView:", *(_QWORD *)(a1 + 32), *(double *)(a1 + 56), *(double *)(a1 + 64));
  objc_msgSend(a2, "hitTest:withEvent:", *(_QWORD *)(a1 + 40));
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
    *a4 = 1;
}

- (BOOL)_delegateTapAllowed
{
  void *v3;
  char v4;

  -[SBIconView behaviorDelegate](self, "behaviorDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v4 = objc_msgSend(v3, "iconShouldAllowTap:", self);
  else
    v4 = 0;

  return v4;
}

- (void)settings:(id)a3 changedValueForKey:(id)a4
{
  if (self->_iconEditingSettings == a3)
    -[SBIconView _applyIconEditingSettings](self, "_applyIconEditingSettings");
}

- (void)setAllowsProgressState:(BOOL)a3
{
  char v3;
  char v5;
  _BOOL8 v6;
  id v7;

  v3 = *((_BYTE *)self + 556);
  if (((((v3 & 0x40) == 0) ^ a3) & 1) == 0)
  {
    if (a3)
      v5 = 64;
    else
      v5 = 0;
    *((_BYTE *)self + 556) = v3 & 0xBF | v5;
    if (a3)
    {
      -[SBIconView window](self, "window");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      if (v7)
        v6 = -[SBIcon shouldAnimateProgress](self->_icon, "shouldAnimateProgress");
      else
        v6 = 0;
      -[SBIconView _updateProgressAnimated:](self, "_updateProgressAnimated:", v6);

    }
    else
    {
      -[SBIconView _updateProgressAnimated:](self, "_updateProgressAnimated:");
    }
  }
}

- (void)_backgroundContrastDidChange:(id)a3
{
  SBIconLabelView *labelView;

  -[SBIconLabelView removeFromSuperview](self->_labelView, "removeFromSuperview", a3);
  labelView = self->_labelView;
  self->_labelView = 0;

  -[SBIconView _updateLabel](self, "_updateLabel");
}

- (void)_contentSizeCategoryDidChange:(id)a3
{
  -[SBIconView _updateLabelArea](self, "_updateLabelArea", a3);
  -[SBIconView dismissContextMenuWithCompletion:](self, "dismissContextMenuWithCompletion:", 0);
}

- (void)_boldTextStatusDidChange:(id)a3
{
  -[SBIconView _updateLabelArea](self, "_updateLabelArea", a3);
  -[SBIconView _updateAccessoryViewAnimated:](self, "_updateAccessoryViewAnimated:", 0);
}

- (void)_refreshAccessoryViewNotification:(id)a3
{
  -[SBIconView _updateAccessoryViewAnimated:](self, "_updateAccessoryViewAnimated:", 1);
}

- (BOOL)isFolderIconFrozen
{
  return (*((unsigned __int8 *)self + 556) >> 3) & 1;
}

- (unint64_t)visibleMiniIconCount
{
  void *v2;
  unint64_t v3;

  -[SBIconView _folderIconImageView](self, "_folderIconImageView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "visibleMiniIconCount");

  return v3;
}

- (unint64_t)firstVisibleMiniIconIndex
{
  void *v2;
  unint64_t v3;

  -[SBIconView _folderIconImageView](self, "_folderIconImageView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "firstVisibleMiniIconIndex");

  return v3;
}

- (unint64_t)centerVisibleMiniIconIndex
{
  void *v2;
  unint64_t v3;

  -[SBIconView _folderIconImageView](self, "_folderIconImageView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "centerVisibleMiniIconIndex");

  return v3;
}

- (unint64_t)lastVisibleMiniIconIndex
{
  void *v2;
  unint64_t v3;

  -[SBIconView _folderIconImageView](self, "_folderIconImageView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "lastVisibleMiniIconIndex");

  return v3;
}

- (CGRect)frameForMiniIconAtIndex:(unint64_t)a3
{
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGRect result;

  -[SBIconView _folderIconImageView](self, "_folderIconImageView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "frameForMiniIconAtIndex:", a3);
  -[SBIconView convertRect:fromView:](self, "convertRect:fromView:", v5);
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  v14 = v7;
  v15 = v9;
  v16 = v11;
  v17 = v13;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (CGRect)visibleImageRelativeFrameForMiniIconAtIndex:(unint64_t)a3
{
  void *v5;
  double v6;
  CGFloat x;
  double v8;
  CGFloat y;
  double v10;
  CGFloat width;
  double v12;
  CGFloat height;
  double v14;
  CGFloat v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGAffineTransform v20;
  CGRect v21;
  CGRect v22;
  CGRect result;

  -[SBIconView _folderIconImageView](self, "_folderIconImageView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "visibleImageRelativeFrameForMiniIconAtIndex:", a3);
  x = v6;
  y = v8;
  width = v10;
  height = v12;

  -[SBIconView iconContentScale](self, "iconContentScale");
  v15 = v14;
  if ((BSFloatIsOne() & 1) == 0)
  {
    CGAffineTransformMakeScale(&v20, v15, v15);
    v21.origin.x = x;
    v21.origin.y = y;
    v21.size.width = width;
    v21.size.height = height;
    v22 = CGRectApplyAffineTransform(v21, &v20);
    x = v22.origin.x;
    y = v22.origin.y;
    width = v22.size.width;
    height = v22.size.height;
  }
  v16 = x;
  v17 = y;
  v18 = width;
  v19 = height;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (void)scrollToFirstGapAnimated:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[SBIconView _folderIconImageView](self, "_folderIconImageView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scrollToFirstGapAnimated:", v3);

}

- (void)scrollToTopOfPage:(unint64_t)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;

  v4 = a4;
  -[SBIconView _folderIconImageView](self, "_folderIconImageView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "scrollToTopOfPage:animated:", a3, v4);

}

- (void)scrollToGapOrTopIfFullOfPage:(unint64_t)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;

  v4 = a4;
  -[SBIconView _folderIconImageView](self, "_folderIconImageView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "scrollToGapOrTopIfFullOfPage:animated:", a3, v4);

}

- (BOOL)isAnimatingScrolling
{
  void *v2;
  char v3;

  -[SBIconView _folderIconImageView](self, "_folderIconImageView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isAnimating");

  return v3;
}

- (void)setIconGridImageAlpha:(double)a3
{
  id v4;

  -[SBIconView _folderIconImageView](self, "_folderIconImageView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIconGridImageAlpha:", a3);

}

- (void)setBackgroundAndIconGridImageAlpha:(double)a3
{
  id v4;

  -[SBIconView _folderIconImageView](self, "_folderIconImageView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundAndIconGridImageAlpha:", a3);

}

- (id)prepareForIconDrop
{
  return -[SBIconView disableImageUpdatesForReason:](self, "disableImageUpdatesForReason:", CFSTR("IconDrop"));
}

- (void)prepareToCrossfadeWithFloatyFolderView:(id)a3 allowFolderInteraction:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;

  v4 = a4;
  v6 = a3;
  -[SBIconView setAllowsEditingAnimation:](self, "setAllowsEditingAnimation:", 0);
  -[SBIconView _folderIconImageView](self, "_folderIconImageView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "prepareToCrossfadeWithFloatyFolderView:allowFolderInteraction:", v6, v4);

}

- (void)setFloatyFolderCrossfadeFraction:(double)a3
{
  void *v5;
  double v6;

  -[SBIconView _folderIconImageView](self, "_folderIconImageView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFloatyFolderCrossfadeFraction:", a3);

  v6 = 1.0 - a3;
  -[SBIconView setIconAccessoryAlpha:](self, "setIconAccessoryAlpha:", v6);
  -[SBIconView setIconLabelAlpha:](self, "setIconLabelAlpha:", v6);
}

- (void)cleanupAfterFloatyFolderCrossfade
{
  id v3;

  -[SBIconView setAllowsEditingAnimation:](self, "setAllowsEditingAnimation:", 1);
  -[SBIconView setFloatyFolderCrossfadeFraction:](self, "setFloatyFolderCrossfadeFraction:", 0.0);
  -[SBIconView _folderIconImageView](self, "_folderIconImageView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cleanupAfterFloatyFolderCrossfade");

}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBIconView succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
}

- (void)iconImageDidUpdate:(id)a3
{
  SBIcon *v4;
  SBIcon *icon;

  v4 = (SBIcon *)a3;
  BSDispatchQueueAssertMain();
  icon = self->_icon;

  if (icon == v4)
  {
    -[SBIconView _updateIconImageViewAnimated:](self, "_updateIconImageViewAnimated:", 0);
    -[SBIconView _updateBrightness](self, "_updateBrightness");
  }
}

- (void)appProtectionSubjectsChanged:(id)a3 forSubscription:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  _QWORD block[5];

  v5 = (void *)MEMORY[0x1E0CF9688];
  v6 = a3;
  -[SBIconView icon](self, "icon");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "applicationBundleID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "applicationWithBundleIdentifier:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v6, "containsObject:", v9);

  if (v10)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __59__SBIconView_appProtectionSubjectsChanged_forSubscription___block_invoke;
    block[3] = &unk_1E8D84C50;
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
}

uint64_t __59__SBIconView_appProtectionSubjectsChanged_forSubscription___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchApplicationShortcutItemsIfAppropriate");
}

- (void)startForbiddingEditingModeWithReason:(id)a3
{
  id v4;
  NSCountedSet *forbidEditingModeReasons;
  NSCountedSet *v6;
  NSCountedSet *v7;
  id v8;

  v4 = a3;
  forbidEditingModeReasons = self->_forbidEditingModeReasons;
  v8 = v4;
  if (!forbidEditingModeReasons)
  {
    objc_msgSend(MEMORY[0x1E0CB3550], "set");
    v6 = (NSCountedSet *)objc_claimAutoreleasedReturnValue();
    v7 = self->_forbidEditingModeReasons;
    self->_forbidEditingModeReasons = v6;

    v4 = v8;
    forbidEditingModeReasons = self->_forbidEditingModeReasons;
  }
  -[NSCountedSet addObject:](forbidEditingModeReasons, "addObject:", v4);
  -[SBIconView _applyEditingStateAnimated:](self, "_applyEditingStateAnimated:", 1);

}

- (void)endForbiddingEditingModeWithReason:(id)a3
{
  id v4;
  NSCountedSet *forbidEditingModeReasons;
  int v6;
  NSCountedSet *v7;
  id v8;

  v4 = a3;
  forbidEditingModeReasons = self->_forbidEditingModeReasons;
  if (forbidEditingModeReasons)
  {
    v8 = v4;
    v6 = -[NSCountedSet containsObject:](forbidEditingModeReasons, "containsObject:", v4);
    v4 = v8;
    if (v6)
    {
      -[NSCountedSet removeObject:](self->_forbidEditingModeReasons, "removeObject:", v8);
      if (!-[NSCountedSet count](self->_forbidEditingModeReasons, "count"))
      {
        v7 = self->_forbidEditingModeReasons;
        self->_forbidEditingModeReasons = 0;

      }
      -[SBIconView _applyEditingStateAnimated:](self, "_applyEditingStateAnimated:", 1);
      v4 = v8;
    }
  }

}

- (id)startForbiddingAccessoryUpdatesWithReason:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  NSHashTable *v7;
  NSHashTable *forbidAccessoryUpdatesAssertions;
  SBIconViewAssertion *v9;
  void *v10;
  void *v11;
  SBIconViewAssertion *v12;
  _QWORD v14[2];
  _QWORD v15[3];

  v4 = a4;
  v15[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!self->_forbidAccessoryUpdatesAssertions)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v7 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
    forbidAccessoryUpdatesAssertions = self->_forbidAccessoryUpdatesAssertions;
    self->_forbidAccessoryUpdatesAssertions = v7;

  }
  v9 = [SBIconViewAssertion alloc];
  v14[0] = CFSTR("reason");
  v14[1] = CFSTR("animated");
  v15[0] = v6;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[SBIconViewAssertion initWithAssertionType:iconView:extraInfo:](v9, "initWithAssertionType:iconView:extraInfo:", 1, self, v11);

  -[NSHashTable addObject:](self->_forbidAccessoryUpdatesAssertions, "addObject:", v12);
  -[SBIconView _updateAccessoryViewAnimated:](self, "_updateAccessoryViewAnimated:", v4);

  return v12;
}

- (void)removeForbidAccessoryUpdatesAssertion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSHashTable *forbidAccessoryUpdatesAssertions;

  v4 = a3;
  objc_msgSend(v4, "extraInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("animated"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLValue");

  -[NSHashTable removeObject:](self->_forbidAccessoryUpdatesAssertions, "removeObject:", v4);
  if (!-[NSHashTable count](self->_forbidAccessoryUpdatesAssertions, "count"))
  {
    forbidAccessoryUpdatesAssertions = self->_forbidAccessoryUpdatesAssertions;
    self->_forbidAccessoryUpdatesAssertions = 0;

  }
  -[SBIconView _updateAccessoryViewAnimated:](self, "_updateAccessoryViewAnimated:", v7);
}

- (BOOL)_selfOrCustomViewCanBecomeFocused
{
  void *v3;
  _BOOL4 v4;

  -[SBIconView behaviorDelegate](self, "behaviorDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(v3, "iconViewCanBecomeFocused:", self))
    v4 = !-[NSString isEqualToString:](self->_iconLocation, "isEqualToString:", CFSTR("SBIconLocationNone"));
  else
    LOBYTE(v4) = 0;

  return v4;
}

- (BOOL)canBecomeFocused
{
  return !self->_focusProxyView
      && -[SBIconView _selfOrCustomViewCanBecomeFocused](self, "_selfOrCustomViewCanBecomeFocused");
}

- (BOOL)focusProxyCanBecomeFocused
{
  return self->_focusProxyView
      && -[SBIconView _selfOrCustomViewCanBecomeFocused](self, "_selfOrCustomViewCanBecomeFocused");
}

- (BOOL)canBecomeFirstResponder
{
  return 0;
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  void *focusProxyView;
  id v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a3;
  focusProxyView = self->_focusProxyView;
  if (!focusProxyView)
    focusProxyView = self;
  v6 = focusProxyView;
  objc_msgSend(v17, "nextFocusedItem");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 == v6)
  {
    -[SBIconView behaviorDelegate](self, "behaviorDelegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v10 = objc_msgSend(v9, "focusEffectTypeForIconView:", self);
      if (v10 == 1)
      {
        -[SBIconView setFocusEffect:](self, "setFocusEffect:", 0);
        -[SBIconView setupFocusEffectPlatterView](self, "setupFocusEffectPlatterView");
        -[SBIconView setShowsFocusEffect:](self, "setShowsFocusEffect:", 1);
      }
      else if (!v10)
      {
        -[SBIconView iconImageInfo](self, "iconImageInfo");
        v11 = (void *)MEMORY[0x1E0DC37D8];
        objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithRoundedRect:cornerRadius:", 0.0, 0.0, v12, v13, v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "effectWithPath:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v16, "setPosition:", 1);
        -[SBIconView setFocusEffect:](self, "setFocusEffect:", v16);

      }
    }

  }
  else
  {
    objc_msgSend(v17, "previouslyFocusedItem");
    v8 = (id)objc_claimAutoreleasedReturnValue();

    if (v8 == v6 && self->_focusEffectPlatterView)
      -[SBIconView setShowsFocusEffect:](self, "setShowsFocusEffect:", 0);
  }

}

- (void)setupFocusEffectPlatterView
{
  SBIconFocusEffectPlatterView *v3;
  SBIconFocusEffectPlatterView *v4;
  double v5;
  void *v6;
  void *v7;
  SBIconFocusEffectPlatterView *focusEffectPlatterView;

  if (!self->_focusEffectPlatterView)
  {
    v3 = [SBIconFocusEffectPlatterView alloc];
    -[SBIconView _focusEffectBoundsForFocused:withFocusOutset:](self, "_focusEffectBoundsForFocused:withFocusOutset:", 1, 6.05);
    v4 = -[SBIconFocusEffectPlatterView initWithFrame:](v3, "initWithFrame:");
    -[SBIconFocusEffectPlatterView setAlpha:](v4, "setAlpha:", 0.0);
    -[SBIconView _focusEffectCenter](self, "_focusEffectCenter");
    -[SBIconFocusEffectPlatterView setCenter:](v4, "setCenter:");
    -[SBIconView iconImageCornerRadius](self, "iconImageCornerRadius");
    -[SBIconFocusEffectPlatterView _setContinuousCornerRadius:](v4, "_setContinuousCornerRadius:", v5 + 6.05);
    -[SBIconFocusEffectPlatterView layoutIfNeeded](v4, "layoutIfNeeded");
    -[SBIconView contentContainerView](self, "contentContainerView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBIconView currentImageView](self, "currentImageView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "insertSubview:belowSubview:", v4, v7);

    focusEffectPlatterView = self->_focusEffectPlatterView;
    self->_focusEffectPlatterView = v4;

  }
}

- (BOOL)wantsFocusProxyView
{
  return (*((unsigned __int8 *)self + 559) >> 3) & 1;
}

- (void)setWantsFocusProxyView:(BOOL)a3
{
  char v3;
  char v5;
  UIFocusItem *focusProxyView;
  SBHFocusProxyView *v7;
  UIFocusItem *v8;
  UIFocusItem *v9;
  void *v10;

  v3 = *((_BYTE *)self + 559);
  if (((((v3 & 8) == 0) ^ a3) & 1) == 0)
  {
    if (a3)
      v5 = 8;
    else
      v5 = 0;
    *((_BYTE *)self + 559) = v3 & 0xF7 | v5;
    focusProxyView = self->_focusProxyView;
    if (a3)
    {
      if (!focusProxyView)
      {
        v7 = -[SBHFocusProxyView initWithProxyableView:]([SBHFocusProxyView alloc], "initWithProxyableView:", self);
        v8 = self->_focusProxyView;
        self->_focusProxyView = (UIFocusItem *)v7;

        -[SBIconView superview](self, "superview");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "insertSubview:belowSubview:", self->_focusProxyView, self);

      }
    }
    else if (focusProxyView)
    {
      -[UIFocusItem removeFromSuperview](focusProxyView, "removeFromSuperview");
      v9 = self->_focusProxyView;
      self->_focusProxyView = 0;

    }
  }
}

- (BOOL)lastContextMenuInteractionFailedToLoad
{
  return self->_lastContextMenuInteractionFailedToLoad;
}

- (SBIconViewDragDelegate)overrideDraggingDelegate
{
  return (SBIconViewDragDelegate *)objc_loadWeakRetained((id *)&self->_overrideDraggingDelegate);
}

- (void)setOverrideDraggingDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_overrideDraggingDelegate, a3);
}

- (NSArray)applicationShortcutItems
{
  return self->_applicationShortcutItems;
}

- (void)setApplicationShortcutItems:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 880);
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void)setPaused:(BOOL)a3
{
  self->_paused = a3;
}

- (double)editingAnimationStrength
{
  return self->_editingAnimationStrength;
}

- (SBHIconImageAppearance)overrideIconImageAppearance
{
  return self->_overrideIconImageAppearance;
}

- (SBHIconImageStyleConfiguration)overrideIconImageStyleConfiguration
{
  return self->_overrideIconImageStyleConfiguration;
}

- (UIEdgeInsets)cursorHitTestPadding
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_cursorHitTestPadding.top;
  left = self->_cursorHitTestPadding.left;
  bottom = self->_cursorHitTestPadding.bottom;
  right = self->_cursorHitTestPadding.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (NSDate)lastTouchDownDate
{
  return self->_lastTouchDownDate;
}

- (BOOL)showsImageAndLabelDuringDrop
{
  return self->_showsImageAndLabelDuringDrop;
}

- (void)setLabelFont:(id)a3
{
  objc_storeStrong((id *)&self->_labelFont, a3);
}

- (unint64_t)customIconImageViewControllerPriority
{
  return self->_customIconImageViewControllerPriority;
}

- (SBIconViewCustomImageViewControlling)overrideCustomIconImageViewController
{
  return self->_overrideCustomIconImageViewController;
}

- (void)setFolderIcon:(id)a3
{
  objc_storeStrong((id *)&self->_folderIcon, a3);
}

- (void)setFolderIconBackgroundView:(id)a3
{
  objc_storeStrong((id *)&self->_folderIconBackgroundView, a3);
}

- (void)setAccessibilityTintColor:(id)a3
{
  objc_storeStrong((id *)&self->_accessibilityTintColor, a3);
}

- (unint64_t)debugIconIndex
{
  return self->_debugIconIndex;
}

- (void)setIconImageSizeMatchesBoundsSize:(BOOL)a3
{
  self->_iconImageSizeMatchesBoundsSize = a3;
}

- (SBIconApproximateLayoutPosition)approximateLayoutPosition
{
  SBIconApproximateLayoutPosition *p_approximateLayoutPosition;
  unint64_t horizontal;
  unint64_t vertical;
  SBIconApproximateLayoutPosition result;

  p_approximateLayoutPosition = &self->_approximateLayoutPosition;
  horizontal = self->_approximateLayoutPosition.horizontal;
  vertical = p_approximateLayoutPosition->vertical;
  result.vertical = vertical;
  result.horizontal = horizontal;
  return result;
}

- (UIView)focusProxyView
{
  return (UIView *)self->_focusProxyView;
}

- (APSubjectMonitorSubscription)appPrototectionSubjectMonitorSubscription
{
  return (APSubjectMonitorSubscription *)objc_loadWeakRetained((id *)&self->_appPrototectionSubjectMonitorSubscription);
}

- (void)setAppPrototectionSubjectMonitorSubscription:(id)a3
{
  objc_storeWeak((id *)&self->_appPrototectionSubjectMonitorSubscription, a3);
}

- (UIPointerInteraction)iconViewCursorInteraction
{
  return self->_iconViewCursorInteraction;
}

- (UIPointerInteraction)closeBoxCursorInteraction
{
  return self->_closeBoxCursorInteraction;
}

- (UIPointerInteraction)accessoryViewCursorInteraction
{
  return self->_accessoryViewCursorInteraction;
}

- (UIPointerInteraction)resizeHandleCursorInteraction
{
  return self->_resizeHandleCursorInteraction;
}

- (UIDropInteraction)dropInteraction
{
  return self->_dropInteraction;
}

- (UIDragSession)liftingDragSession
{
  return (UIDragSession *)objc_loadWeakRetained((id *)&self->_liftingDragSession);
}

- (int64_t)displayedLabelAccessoryType
{
  return self->_displayedLabelAccessoryType;
}

- (UILongPressGestureRecognizer)editingModeGestureRecognizer
{
  return self->_editingModeGestureRecognizer;
}

- (UIContextMenuInteraction)contextMenuInteraction
{
  return self->_contextMenuInteraction;
}

- (void)setCurrentConfigurationInteraction:(id)a3
{
  objc_storeStrong((id *)&self->_currentConfigurationInteraction, a3);
}

- (void)setCurrentStackConfigurationInteraction:(id)a3
{
  objc_storeStrong((id *)&self->_currentStackConfigurationInteraction, a3);
}

- (void)setCloseBoxAnimator:(id)a3
{
  objc_storeStrong((id *)&self->_closeBoxAnimator, a3);
}

- (NSArray)fetchedApplicationShortcutItems
{
  return self->_fetchedApplicationShortcutItems;
}

- (SBIconViewAssertion)borrowedIconImageViewAssertion
{
  return (SBIconViewAssertion *)objc_loadWeakRetained((id *)&self->_borrowedIconImageViewAssertion);
}

- (void)setBorrowedIconImageViewAssertion:(id)a3
{
  objc_storeWeak((id *)&self->_borrowedIconImageViewAssertion, a3);
}

- (SBHIconResizeHandle)resizeHandle
{
  return self->_resizeHandle;
}

- (void)setResizeHandle:(id)a3
{
  objc_storeStrong((id *)&self->_resizeHandle, a3);
}

- (BSInvalidatable)springBoardIconStyleObservation
{
  return self->_springBoardIconStyleObservation;
}

- (void)setSpringBoardIconStyleObservation:(id)a3
{
  objc_storeStrong((id *)&self->_springBoardIconStyleObservation, a3);
}

- (SBHIconImageStyleConfiguration)springBoardIconImageStyleConfiguration
{
  return self->_springBoardIconImageStyleConfiguration;
}

- (void)setSpringBoardIconImageStyleConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_springBoardIconImageStyleConfiguration, a3);
}

- (SBIconViewResizeGestureHandling)resizeGestureHandler
{
  return self->_resizeGestureHandler;
}

- (void)setResizeGestureHandler:(id)a3
{
  objc_storeStrong((id *)&self->_resizeGestureHandler, a3);
}

- (UIColor)overrideImageTintColor
{
  return self->_overrideImageTintColor;
}

- (UIImage)overrideImage
{
  return self->_overrideImage;
}

- (UITraitChangeRegistration)windowSceneUserInterfaceStyleChangeRegistration
{
  return self->_windowSceneUserInterfaceStyleChangeRegistration;
}

- (void)setWindowSceneUserInterfaceStyleChangeRegistration:(id)a3
{
  objc_storeStrong((id *)&self->_windowSceneUserInterfaceStyleChangeRegistration, a3);
}

- (SBHIconImageAppearance)overrideAccessoryIconImageAppearance
{
  return self->_overrideAccessoryIconImageAppearance;
}

void __64__SBIconView_activateShortcut_withBundleIdentifier_forIconView___block_invoke_3_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = 138543618;
  v5 = v3;
  v6 = 2114;
  v7 = a2;
  _os_log_error_impl(&dword_1CFEF3000, log, OS_LOG_TYPE_ERROR, "Could not launch application with application shortcut item: %{public}@, error: %{public}@.", (uint8_t *)&v4, 0x16u);
}

- (void)_contextMenuInteraction:(uint64_t)a3 previewForIconWithConfigurationOptions:(uint64_t)a4 highlighted:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4_0(&dword_1CFEF3000, a1, a3, "Unable to generate targeted preview, not contained within a window.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_2();
}

- (void)_contextMenuInteraction:(uint64_t)a3 previewForIconWithConfigurationOptions:(uint64_t)a4 highlighted:(uint64_t)a5 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4_0(&dword_1CFEF3000, a1, a3, "Unable to generate targeted preview, currentImageView is nil.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_2();
}

- (void)_contextMenuInteraction:(uint64_t)a3 previewForIconWithConfigurationOptions:(uint64_t)a4 highlighted:(uint64_t)a5 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4_0(&dword_1CFEF3000, a1, a3, "Unable to generate targeted preview, the view associated with the interaction was foreign.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_2();
}

+ (void)closeBoxTypeForView:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1CFEF3000, a2, OS_LOG_TYPE_ERROR, "Bad view passed into closeBoxTypeForView: %@", (uint8_t *)&v2, 0xCu);
}

@end
