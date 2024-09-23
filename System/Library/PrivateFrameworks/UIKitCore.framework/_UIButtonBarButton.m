@implementation _UIButtonBarButton

- (UIEdgeInsets)alignmentRectInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  -[_UIButtonBarButtonVisualProvider buttonAlignmentRectInsets:](self->_visualProvider, "buttonAlignmentRectInsets:", self);
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (void)setBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_super v8;
  objc_super v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (-[UIView _willForceLayoutForBoundsChangeToNewBounds:]((_BOOL8)self, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height)&& (*(_QWORD *)&self->super.super._viewFlags & 0x200000000000000) != 0)
  {
    self->_autolayoutIsCleanForBoundsChange = 1;
    v9.receiver = self;
    v9.super_class = (Class)_UIButtonBarButton;
    -[UIView setBounds:](&v9, sel_setBounds_, x, y, width, height);
    if (!self->_autolayoutIsCleanForBoundsChange)
    {
      v8.receiver = self;
      v8.super_class = (Class)_UIButtonBarButton;
      -[UIView _is_setNeedsLayout](&v8, sel__is_setNeedsLayout);
      -[UIView layoutIfNeeded](self, "layoutIfNeeded");
      self->_autolayoutIsCleanForBoundsChange = 1;
    }
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)_UIButtonBarButton;
    -[UIView setBounds:](&v9, sel_setBounds_, x, y, width, height);
  }
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  -[_UIButtonBarButtonVisualProvider buttonIntrinsicContentSize:](self->_visualProvider, "buttonIntrinsicContentSize:", self);
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)_is_setNeedsLayout
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UIButtonBarButton;
  -[UIView _is_setNeedsLayout](&v3, sel__is_setNeedsLayout);
  self->_autolayoutIsCleanForBoundsChange = 0;
}

- (void)configureBackButtonFromBarItem:(id)a3 withAppearanceDelegate:(id)a4
{
  _UIButtonBarButtonVisualProvider *visualProvider;
  id v8;
  void *v9;
  id obj;

  visualProvider = self->_visualProvider;
  v8 = a4;
  obj = a3;
  if (!-[_UIButtonBarButtonVisualProvider supportsBackButtons](visualProvider, "supportsBackButtons"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIButtonBarButton.m"), 475, CFSTR("Attempt to create a back-button styled bar button from a visual style that does not support back buttons (button=%p, visual style=%@)"), self, self->_visualProvider);

  }
  objc_storeWeak((id *)&self->_visualProvider->_barButtonItem, obj);
  -[_UIButtonBarButton _configureFromBarItem:appearanceDelegate:isBackButton:useBreadcrumbStyle:](self, "_configureFromBarItem:appearanceDelegate:isBackButton:useBreadcrumbStyle:", obj, v8, 1, 0);

}

- (void)configureFromBarItem:(id)a3 withAppearanceDelegate:(id)a4
{
  UIBarButtonItem **p_barButtonItem;
  id v7;
  id v8;

  p_barButtonItem = &self->_visualProvider->_barButtonItem;
  v7 = a4;
  v8 = a3;
  objc_storeWeak((id *)p_barButtonItem, v8);
  -[_UIButtonBarButton _configureFromBarItem:appearanceDelegate:isBackButton:useBreadcrumbStyle:](self, "_configureFromBarItem:appearanceDelegate:isBackButton:useBreadcrumbStyle:", v8, v7, 0, 0);

}

- (void)_configureFromBarItem:(id)a3 appearanceDelegate:(id)a4 isBackButton:(BOOL)a5 useBreadcrumbStyle:(BOOL)a6
{
  id v10;
  uint64_t v11;
  BOOL v13;
  NSDate *v14;
  NSDate *appearanceDate;
  id v16;

  v16 = a3;
  v10 = a4;
  self->_backButton = a5;
  self->_breadcrumb = a5 && a6;
  if (objc_msgSend(v16, "isSystemItem"))
  {
    v11 = objc_msgSend(v16, "systemItem");
    v13 = v11 == 1 || v11 == 24;
    self->_acceptsInauthenticTouches = v13;
  }
  else
  {
    self->_acceptsInauthenticTouches = 0;
  }
  -[_UIButtonBarButtonVisualProvider configureButton:withAppearanceDelegate:fromBarItem:](self->_visualProvider, "configureButton:withAppearanceDelegate:fromBarItem:", self, v10, v16);
  -[_UIButtonBarButtonVisualProvider updateButton:toUseButtonShapes:](self->_visualProvider, "updateButton:toUseButtonShapes:", self, _AXSButtonShapesEnabled() != 0);
  -[_UIButtonBarButton setEnabled:](self, "setEnabled:", objc_msgSend(v16, "isEnabled"));
  -[_UIButtonBarButton setSelected:](self, "setSelected:", objc_msgSend(v16, "isSelected"));
  if ((char *)objc_msgSend(v16, "action") == sel_assistantPaste_forEvent_)
  {
    -[UIControl addTarget:action:forControlEvents:](self, "addTarget:action:forControlEvents:", self, sel_pasteTouchDown, 1);
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v14 = (NSDate *)objc_claimAutoreleasedReturnValue();
    appearanceDate = self->_appearanceDate;
    self->_appearanceDate = v14;

  }
  -[_UIButtonBarButton _applyDeferredSymbolEffects](self, "_applyDeferredSymbolEffects");

}

- (void)setEnabled:(BOOL)a3
{
  _BOOL8 v4;
  objc_super v5;

  v4 = -[_UIButtonBarButtonVisualProvider buttonEnabledState:forRequestedState:](self->_visualProvider, "buttonEnabledState:forRequestedState:", self, a3);
  v5.receiver = self;
  v5.super_class = (Class)_UIButtonBarButton;
  -[UIControl setEnabled:](&v5, sel_setEnabled_, v4);
  -[_UIButtonBarButtonVisualProvider updateButton:forEnabledState:](self->_visualProvider, "updateButton:forEnabledState:", self, -[UIControl isEnabled](self, "isEnabled"));
}

- (void)setSelected:(BOOL)a3
{
  _BOOL8 v4;
  objc_super v5;

  v4 = -[_UIButtonBarButtonVisualProvider buttonSelectionState:forRequestedState:](self->_visualProvider, "buttonSelectionState:forRequestedState:", self, a3);
  v5.receiver = self;
  v5.super_class = (Class)_UIButtonBarButton;
  -[UIControl setSelected:](&v5, sel_setSelected_, v4);
  -[_UIButtonBarButtonVisualProvider updateButton:forSelectedState:](self->_visualProvider, "updateButton:forSelectedState:", self, -[UIControl isSelected](self, "isSelected"));
}

- (void)_applyDeferredSymbolEffects
{
  void *v3;
  void *v4;
  void *v5;
  id WeakRetained;
  _QWORD aBlock[4];
  id v8;

  -[_UIButtonBarButtonVisualProvider symbolImageView](self->_visualProvider, "symbolImageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __49___UIButtonBarButton__applyDeferredSymbolEffects__block_invoke;
    aBlock[3] = &unk_1E16B5810;
    v8 = v3;
    v5 = _Block_copy(aBlock);

  }
  else
  {
    v5 = 0;
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_visualProvider->_barButtonItem);
  objc_msgSend(WeakRetained, "_applyDeferredSymbolEffects:", v5);

}

- (NSLayoutConstraint)widthMinimizingConstraint
{
  NSLayoutConstraint *widthMinimizingConstraint;
  void *v4;
  NSLayoutConstraint *v5;
  NSLayoutConstraint *v6;
  double v7;

  widthMinimizingConstraint = self->_widthMinimizingConstraint;
  if (!widthMinimizingConstraint)
  {
    -[UIView widthAnchor](self, "widthAnchor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "constraintEqualToConstant:", 0.0);
    v5 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    v6 = self->_widthMinimizingConstraint;
    self->_widthMinimizingConstraint = v5;

    -[NSLayoutConstraint setIdentifier:](self->_widthMinimizingConstraint, "setIdentifier:", CFSTR("_UIButtonBarButton.widthMinimizingConstraint"));
    LODWORD(v7) = 1132068864;
    -[NSLayoutConstraint setPriority:](self->_widthMinimizingConstraint, "setPriority:", v7);
    widthMinimizingConstraint = self->_widthMinimizingConstraint;
  }
  return widthMinimizingConstraint;
}

- (BOOL)isBackButton
{
  return self->_backButton;
}

- (void)setPreferredMenuElementOrder:(int64_t)a3
{
  self->_preferredMenuElementOrder = a3;
}

- (void)setSpringLoaded:(BOOL)a3
{
  _BOOL4 v3;
  _UIButtonBarButtonVisualProvider *v5;
  _UIButtonBarButtonVisualProvider *v6;
  _QWORD v7[4];
  _UIButtonBarButtonVisualProvider *v8;

  v3 = a3;
  v5 = self->_visualProvider;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __38___UIButtonBarButton_setSpringLoaded___block_invoke;
  v7[3] = &unk_1E16B57C8;
  v8 = v5;
  v6 = v5;
  -[UIView _setSpringLoaded:interactionInitializer:](self, v3, v7);

}

- (_UIBarButtonItemData)appearanceData
{
  return self->_appearanceData;
}

- (BOOL)isBreadcrumb
{
  return self->_breadcrumb;
}

- (void)setAppearanceData:(id)a3
{
  id v5;
  _UIBarButtonItemData *v6;
  _UIBarButtonItemData *v7;
  BOOL v8;
  _UIBarButtonItemData *v9;

  v5 = a3;
  v6 = self->_appearanceData;
  v7 = (_UIBarButtonItemData *)v5;
  v9 = v7;
  if (v6 == v7)
  {

  }
  else
  {
    if (v7 && v6)
    {
      v8 = -[_UIBarAppearanceData isEqual:](v6, "isEqual:", v7);

      if (v8)
        goto LABEL_9;
    }
    else
    {

    }
    objc_storeStrong((id *)&self->_appearanceData, a3);
    -[_UIButtonBarButton setNeedsAppearanceUpdate](self, "setNeedsAppearanceUpdate");
  }
LABEL_9:

}

- (_UIButtonBarButtonVisualProvider)visualProvider
{
  return self->_visualProvider;
}

- (_UIButtonBarButton)initWithVisualProvider:(id)a3
{
  id v4;
  _UIButtonBarButton *v5;
  uint64_t v6;
  _UIButtonBarButtonVisualProvider *visualProvider;
  void *v8;
  void *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_UIButtonBarButton;
  v5 = -[UIControl initWithFrame:](&v11, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    visualProvider = v5->_visualProvider;
    v5->_visualProvider = (_UIButtonBarButtonVisualProvider *)v6;

    v5->_visualProvider->_button = v5;
    v8 = (void *)objc_opt_new();
    objc_msgSend(v8, "setDelegate:", v5);
    -[UIView addInteraction:](v5, "addInteraction:", v8);
    -[_UIButtonBarButton set_selectionInteraction:](v5, "set_selectionInteraction:", v8);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObserver:selector:name:object:", v5, sel__accessibilitySettingsChanged_, CFSTR("UIAccessibilityButtonShapesEnabledStatusDidChangeNotification"), 0);

  }
  return v5;
}

- (void)setNeedsAppearanceUpdate
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_visualProvider->_barButtonItem);

  if (WeakRetained)
  {
    -[_UIButtonBarButtonVisualProvider updateButton:appearance:](self->_visualProvider, "updateButton:appearance:", self, self->_appearanceData);
    -[UIView setNeedsLayout](self, "setNeedsLayout");
    if (+[UIView _isInAnimationBlockWithAnimationsEnabled](UIView, "_isInAnimationBlockWithAnimationsEnabled"))
    {
      -[UIView layoutIfNeeded](self, "layoutIfNeeded");
    }
  }
}

- (void)willMoveToWindow:(id)a3
{
  _UIButtonBarButtonVisualProvider *visualProvider;
  id v5;
  objc_super v6;

  visualProvider = self->_visualProvider;
  v5 = a3;
  -[_UIButtonBarButtonVisualProvider buttonWillMoveToWindow:](visualProvider, "buttonWillMoveToWindow:", v5);
  v6.receiver = self;
  v6.super_class = (Class)_UIButtonBarButton;
  -[UIView willMoveToWindow:](&v6, sel_willMoveToWindow_, v5);

}

- (void)layoutSubviews
{
  -[_UIButtonBarButtonVisualProvider buttonLayoutSubviews:baseImplementation:](self->_visualProvider, "buttonLayoutSubviews:baseImplementation:");
}

- (void)willMoveToSuperview:(id)a3
{
  _UIButtonBarButtonVisualProvider *visualProvider;
  id v5;
  objc_super v6;

  visualProvider = self->_visualProvider;
  v5 = a3;
  -[_UIButtonBarButtonVisualProvider buttonWillMoveToSuperview:](visualProvider, "buttonWillMoveToSuperview:", v5);
  v6.receiver = self;
  v6.super_class = (Class)_UIButtonBarButton;
  -[UIView willMoveToSuperview:](&v6, sel_willMoveToSuperview_, v5);

}

- (BOOL)updatePresentedMenuFrom:(id)a3
{
  id v4;
  _BOOL4 v5;
  void *v6;
  id WeakRetained;
  void *v8;

  v4 = a3;
  v5 = -[_UIButtonBarButtonVisualProvider canUpdateMenuInPlace](self->_visualProvider, "canUpdateMenuInPlace");
  if (v5)
  {
    -[UIControl contextMenuInteraction](self, "contextMenuInteraction");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)&self->_visualProvider->_barButtonItem);
    objc_msgSend(WeakRetained, "menu");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    _UIControlMenuUpdateVisibleMenu(v6, v4, v8);

    -[_UIButtonBarButtonVisualProvider updateMenu](self->_visualProvider, "updateMenu");
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__selectionInteraction, 0);
  objc_storeStrong((id *)&self->_appearanceData, 0);
  objc_storeStrong((id *)&self->_appearanceDate, 0);
  objc_storeStrong((id *)&self->_heightMinimizingConstraint, 0);
  objc_storeStrong((id *)&self->_widthMinimizingConstraint, 0);
  objc_storeStrong((id *)&self->_visualProvider, 0);
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  self->_visualProvider->_button = 0;
  objc_storeWeak((id *)&self->_visualProvider->_barButtonItem, 0);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("UIAccessibilityButtonShapesEnabledStatusDidChangeNotification"), 0);

  v4.receiver = self;
  v4.super_class = (Class)_UIButtonBarButton;
  -[UIView dealloc](&v4, sel_dealloc);
}

- (_UIButtonBarButton)init
{
  -[UIResponder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (_UIButtonBarButton)initWithFrame:(CGRect)a3
{
  -[UIResponder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);

  return 0;
}

- (_UIButtonBarButton)initWithCoder:(id)a3
{
  -[UIResponder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (void)encodeWithCoder:(id)a3
{
  -[UIResponder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
}

- (unint64_t)_controlEventsForActionTriggered
{
  return 64;
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL8 v4;
  objc_super v5;

  v4 = -[_UIButtonBarButtonVisualProvider buttonHighlitedState:forRequestedState:](self->_visualProvider, "buttonHighlitedState:forRequestedState:", self, a3);
  v5.receiver = self;
  v5.super_class = (Class)_UIButtonBarButton;
  -[UIControl setHighlighted:](&v5, sel_setHighlighted_, v4);
  -[_UIButtonBarButtonVisualProvider updateButton:forHighlightedState:](self->_visualProvider, "updateButton:forHighlightedState:", self, -[UIControl isHighlighted](self, "isHighlighted"));
}

- (void)_setHasActiveMenuPresentation:(BOOL)a3
{
  _BOOL8 v4;
  objc_super v5;

  v4 = -[_UIButtonBarButtonVisualProvider buttonHeldState:forRequestedState:](self->_visualProvider, "buttonHeldState:forRequestedState:", self, a3);
  v5.receiver = self;
  v5.super_class = (Class)_UIButtonBarButton;
  -[UIControl _setHasActiveMenuPresentation:](&v5, sel__setHasActiveMenuPresentation_, v4);
  -[_UIButtonBarButtonVisualProvider updateButton:forHeldState:](self->_visualProvider, "updateButton:forHeldState:", self, -[UIControl _hasActiveMenuPresentation](self, "_hasActiveMenuPresentation"));
}

- (void)_setTouchHasHighlighted:(BOOL)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UIButtonBarButton;
  -[UIControl _setTouchHasHighlighted:](&v5, sel__setTouchHasHighlighted_);
  if (!a3)
    -[_UIButtonBarButtonVisualProvider resetButtonHasHighlighted](self->_visualProvider, "resetButtonHasHighlighted");
}

- (BOOL)backButtonMaskEnabled
{
  return -[_UIButtonBarButtonVisualProvider backButtonMaskEnabled](self->_visualProvider, "backButtonMaskEnabled");
}

- (void)setBackButtonMaskEnabled:(BOOL)a3
{
  -[_UIButtonBarButtonVisualProvider setBackButtonMaskEnabled:](self->_visualProvider, "setBackButtonMaskEnabled:");
}

- (void)configureBreadcrumbBackButtonFromBarItem:(id)a3 withAppearanceDelegate:(id)a4
{
  _UIButtonBarButtonVisualProvider *visualProvider;
  id v8;
  void *v9;
  id obj;

  visualProvider = self->_visualProvider;
  v8 = a4;
  obj = a3;
  if (!-[_UIButtonBarButtonVisualProvider supportsBackButtons](visualProvider, "supportsBackButtons"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIButtonBarButton.m"), 482, CFSTR("Attempt to create a back-button styled bar button from a visual style that does not support back buttons (button=%p, visual style=%@)"), self, self->_visualProvider);

  }
  objc_storeWeak((id *)&self->_visualProvider->_barButtonItem, obj);
  -[_UIButtonBarButton _configureFromBarItem:appearanceDelegate:isBackButton:useBreadcrumbStyle:](self, "_configureFromBarItem:appearanceDelegate:isBackButton:useBreadcrumbStyle:", obj, v8, 1, 1);

}

- (NSLayoutConstraint)heightMinimizingConstraint
{
  NSLayoutConstraint *heightMinimizingConstraint;
  void *v4;
  NSLayoutConstraint *v5;
  NSLayoutConstraint *v6;
  double v7;

  heightMinimizingConstraint = self->_heightMinimizingConstraint;
  if (!heightMinimizingConstraint)
  {
    -[UIView heightAnchor](self, "heightAnchor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "constraintEqualToConstant:", 0.0);
    v5 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    v6 = self->_heightMinimizingConstraint;
    self->_heightMinimizingConstraint = v5;

    -[NSLayoutConstraint setIdentifier:](self->_heightMinimizingConstraint, "setIdentifier:", CFSTR("_UIButtonBarButton.heightMinimizingConstraint"));
    LODWORD(v7) = 1132068864;
    -[NSLayoutConstraint setPriority:](self->_heightMinimizingConstraint, "setPriority:", v7);
    heightMinimizingConstraint = self->_heightMinimizingConstraint;
  }
  return heightMinimizingConstraint;
}

- (BOOL)_acceptsInauthenticTouches
{
  return self->_acceptsInauthenticTouches;
}

- (void)pasteTouchDown
{
  _UIPasteboardAnalyticsReportEvent(CFSTR("ButtonBar"), self->_appearanceDate);
}

- (CGSize)backgroundSize
{
  double v2;
  double v3;
  CGSize result;

  -[_UIButtonBarButtonVisualProvider buttonBackgroundSize:](self->_visualProvider, "buttonBackgroundSize:", self);
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGSize)imageViewSize
{
  double v2;
  double v3;
  CGSize result;

  -[_UIButtonBarButtonVisualProvider buttonImageViewSize:](self->_visualProvider, "buttonImageViewSize:", self);
  result.height = v3;
  result.width = v2;
  return result;
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[_UIButtonBarButtonVisualProvider buttonContextMenuInteractionConfiguration](self->_visualProvider, "buttonContextMenuInteractionConfiguration", a3, a4.x, a4.y);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPreferredMenuElementOrder:", -[_UIButtonBarButton preferredMenuElementOrder](self, "preferredMenuElementOrder"));
  if (dyld_program_sdk_at_least())
  {
    -[UIView nextResponder](self, "nextResponder");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    _UITreeFindFirstAncestorMatchingCondition(v6, sel_nextResponder, &__block_literal_global_152);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "topViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setFirstResponderTarget:", v8);

  }
  return v5;
}

- (id)contextMenuInteraction:(id)a3 previewForHighlightingMenuWithConfiguration:(id)a4
{
  void *v5;
  void *v6;

  -[UIView window](self, "window", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[_UIButtonBarButtonVisualProvider buttonContextMenuTargetedPreview](self->_visualProvider, "buttonContextMenuTargetedPreview");
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

  -[UIView window](self, "window", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[_UIButtonBarButtonVisualProvider buttonContextMenuTargetedPreview](self->_visualProvider, "buttonContextMenuTargetedPreview");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)_contextMenuInteraction:(id)a3 styleForMenuWithConfiguration:(id)a4
{
  _UIButtonBarButtonVisualProvider *visualProvider;
  void *v5;
  void *v6;
  objc_super v8;

  visualProvider = self->_visualProvider;
  v8.receiver = self;
  v8.super_class = (Class)_UIButtonBarButton;
  -[UIControl _contextMenuInteraction:styleForMenuWithConfiguration:](&v8, sel__contextMenuInteraction_styleForMenuWithConfiguration_, a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIButtonBarButtonVisualProvider buttonContextMenuStyleFromDefaultStyle:](visualProvider, "buttonContextMenuStyleFromDefaultStyle:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (CGPoint)menuAttachmentPointForConfiguration:(id)a3
{
  double v3;
  double v4;
  CGPoint result;

  -[_UIButtonBarButtonVisualProvider menuAnchorPoint](self->_visualProvider, "menuAnchorPoint", a3);
  result.y = v4;
  result.x = v3;
  return result;
}

- (void)addSymbolEffect:(id)a3 options:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  void *v10;
  id v11;

  v5 = a5;
  v11 = a3;
  v8 = a4;
  -[_UIButtonBarButtonVisualProvider symbolImageView](self->_visualProvider, "symbolImageView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
    objc_msgSend(v9, "addSymbolEffect:options:animated:", v11, v8, v5);

}

- (void)removeSymbolEffectOfType:(id)a3 options:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  void *v10;
  id v11;

  v5 = a5;
  v11 = a3;
  v8 = a4;
  -[_UIButtonBarButtonVisualProvider symbolImageView](self->_visualProvider, "symbolImageView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
    objc_msgSend(v9, "removeSymbolEffectOfType:options:animated:", v11, v8, v5);

}

- (void)removeAllSymbolEffectsWithOptions:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;
  id v8;

  v4 = a4;
  v8 = a3;
  -[_UIButtonBarButtonVisualProvider symbolImageView](self->_visualProvider, "symbolImageView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
    objc_msgSend(v6, "removeAllSymbolEffectsWithOptions:animated:", v8, v4);

}

- (void)applyContentTransition:(id)a3 options:(id)a4
{
  id v6;
  void *v7;
  _UIButtonBarButtonVisualProvider *visualProvider;
  id WeakRetained;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  -[_UIButtonBarButtonVisualProvider symbolImageView](self->_visualProvider, "symbolImageView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  visualProvider = self->_visualProvider;
  if (v7)
  {
    WeakRetained = objc_loadWeakRetained((id *)&visualProvider->_barButtonItem);
    objc_msgSend(WeakRetained, "image");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setSymbolImage:withContentTransition:options:", v10, v11, v6);

    -[_UIButtonBarButtonVisualProvider updateImage](self->_visualProvider, "updateImage");
  }
  else
  {
    -[_UIButtonBarButtonVisualProvider reload](visualProvider, "reload");
  }

}

- (id)_preferredSender
{
  return objc_loadWeakRetained((id *)&self->_visualProvider->_barButtonItem);
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  id v6;
  char isKindOfClass;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;

  v6 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  -[_UIButtonBarButton _buttonBarHitRect](self, "_buttonBarHitRect");
  v12 = v8;
  v13 = v9;
  v14 = v10;
  v15 = v11;
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v6, "createRegionFromRect:targetView:identifier:selected:", self, CFSTR("com.apple.UIKit._UIButtonBarButton"), -[UIControl isSelected](self, "isSelected"), v8, v9, v10, v11);
  }
  else
  {
    objc_msgSend(v6, "view");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView convertRect:toView:](self, "convertRect:toView:", v16, v12, v13, v14, v15);
    v18 = v17;
    v20 = v19;
    v22 = v21;
    v24 = v23;

    +[UIPointerRegion regionWithRect:identifier:](UIPointerRegion, "regionWithRect:identifier:", 0, v18, v20, v22, v24);
  }
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

- (id)_targetedPreviewForInteraction:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  UIPreviewTarget *v15;
  UIPreviewTarget *v16;
  void *v17;
  UITargetedPreview *v18;

  v4 = a3;
  -[_UIButtonBarButtonVisualProvider pointerPreviewParameters](self->_visualProvider, "pointerPreviewParameters");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIButtonBarButtonVisualProvider pointerPreviewCenter](self->_visualProvider, "pointerPreviewCenter");
  v7 = v6;
  v9 = v8;
  -[UIView superview](self, "superview");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView convertPoint:toView:](self, "convertPoint:toView:", v10, v7, v9);
  v12 = v11;
  v14 = v13;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "createPreviewTargetForView:center:", self, v12, v14);
    v15 = (UIPreviewTarget *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = [UIPreviewTarget alloc];
    -[UIView superview](self, "superview");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[UIPreviewTarget initWithContainer:center:](v16, "initWithContainer:center:", v17, v12, v14);

  }
  v18 = -[UITargetedPreview initWithView:parameters:target:]([UITargetedPreview alloc], "initWithView:parameters:target:", self, v5, v15);

  return v18;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  void *v5;
  _UIButtonBarButtonVisualProvider *visualProvider;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  __objc2_class **v12;
  void *v13;
  void *v14;

  -[_UIButtonBarButton _targetedPreviewForInteraction:](self, "_targetedPreviewForInteraction:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  visualProvider = self->_visualProvider;
  objc_msgSend(v5, "target");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "container");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIButtonBarButtonVisualProvider pointerShapeInContainer:](visualProvider, "pointerShapeInContainer:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[_UIButtonBarButtonVisualProvider shouldLift](self->_visualProvider, "shouldLift"))
  {
    +[UIColor clearColor](UIColor, "clearColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "parameters");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setBackgroundColor:", v10);

    v12 = off_1E167B260;
  }
  else
  {
    v12 = off_1E167B248;
  }
  -[__objc2_class effectWithPreview:](*v12, "effectWithPreview:", v5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIPointerStyle styleWithEffect:shape:](UIPointerStyle, "styleWithEffect:shape:", v13, v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[_UIButtonBarButtonVisualProvider shouldSuppressPointerSpecularFilter](self->_visualProvider, "shouldSuppressPointerSpecularFilter"))
  {
    objc_msgSend(v14, "setOptions:", objc_msgSend(v14, "options") | 0x1000);
  }

  return v14;
}

- (void)pointerInteraction:(id)a3 willEnterRegion:(id)a4 animator:(id)a5
{
  -[_UIButtonBarButtonVisualProvider pointerWillEnter:](self->_visualProvider, "pointerWillEnter:", a5, a4);
}

- (void)pointerInteraction:(id)a3 willExitRegion:(id)a4 animator:(id)a5
{
  -[_UIButtonBarButtonVisualProvider pointerWillExit:](self->_visualProvider, "pointerWillExit:", a5, a4);
}

- (CGRect)_buttonBarHitRect
{
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
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGRect result;

  -[UIView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[UIView hitTestInsets](self, "hitTestInsets");
  v12 = v6 + v11;
  v15 = v8 - (v13 + v14);
  v17 = v10 - (v11 + v16);
  v18 = v4 + v13;
  v19 = v12;
  v20 = v15;
  result.size.height = v17;
  result.size.width = v20;
  result.origin.y = v19;
  result.origin.x = v18;
  return result;
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
  -[_UIButtonBarButton _buttonBarHitRect](self, "_buttonBarHitRect", a4);
  v9 = CGRectInset(v8, -15.0, -15.0);
  v7.x = x;
  v7.y = y;
  return CGRectContainsPoint(v9, v7);
}

- (void)_accessibilitySettingsChanged:(id)a3
{
  -[_UIButtonBarButtonVisualProvider updateButton:toUseButtonShapes:](self->_visualProvider, "updateButton:toUseButtonShapes:", self, _AXSButtonShapesEnabled() != 0);
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4;
  _UIButtonBarButton *v5;
  BOOL v6;

  v4 = a3;
  objc_msgSend(v4, "view");
  v5 = (_UIButtonBarButton *)objc_claimAutoreleasedReturnValue();
  v6 = v5 == self
    || !objc_msgSend(v4, "_isGestureType:", 0)
    || objc_msgSend(v4, "numberOfTouchesRequired") != 1
    || objc_msgSend(v4, "numberOfTapsRequired") != 1;

  return v6;
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v6;
  _UIButtonBarButton *v7;
  _UIButtonBarButton *v8;
  _UIButtonBarButton *v9;
  _UIButtonBarButtonVisualProvider *visualProvider;
  _UIButtonBarButton *v11;
  objc_super v12;

  v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_UIButtonBarButton;
  -[UIView didUpdateFocusInContext:withAnimationCoordinator:](&v12, sel_didUpdateFocusInContext_withAnimationCoordinator_, v6, a4);
  objc_msgSend(v6, "nextFocusedView");
  v7 = (_UIButtonBarButton *)objc_claimAutoreleasedReturnValue();
  if (v7 == self)
  {

LABEL_5:
    visualProvider = self->_visualProvider;
    objc_msgSend(v6, "nextFocusedView");
    v11 = (_UIButtonBarButton *)objc_claimAutoreleasedReturnValue();
    -[_UIButtonBarButtonVisualProvider updateButton:forFocusedState:](visualProvider, "updateButton:forFocusedState:", self, v11 == self);

    goto LABEL_6;
  }
  v8 = v7;
  objc_msgSend(v6, "previouslyFocusedView");
  v9 = (_UIButtonBarButton *)objc_claimAutoreleasedReturnValue();

  if (v9 == self)
    goto LABEL_5;
LABEL_6:

}

- (id)focusEffect
{
  return -[_UIButtonBarButtonVisualProvider focusEffect](self->_visualProvider, "focusEffect");
}

- (void)_selectionInteractionDidBeginHinting:(id)a3
{
  void *v3;
  char v4;
  _UIButtonBarButton *v5;

  v5 = self;
  -[UIView _focusBehavior](v5, "_focusBehavior");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "buttonSelectionMode");

  if ((v4 & 2) != 0 && -[UIControl isEnabled](v5, "isEnabled"))
    -[_UIButtonBarButton setHighlighted:](v5, "setHighlighted:", 1);

}

- (void)_selectionInteractionDidCancelHinting:(id)a3
{
  void *v3;
  char v4;
  _UIButtonBarButton *v5;

  v5 = self;
  -[UIView _focusBehavior](v5, "_focusBehavior");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "buttonSelectionMode");

  if ((v4 & 2) != 0 && -[UIControl isHighlighted](v5, "isHighlighted"))
  {
    -[_UIButtonBarButton setHighlighted:](v5, "setHighlighted:", 0);
    -[_UIButtonBarButton _setTouchHasHighlighted:](v5, "_setTouchHasHighlighted:", 0);
  }

}

- (void)_selectionInteractionDidSelect:(id)a3
{
  _UIButtonBarButton *v3;
  void *v4;
  char v5;
  void *v6;
  char v7;
  uint64_t v8;

  v3 = self;
  -[UIView _focusBehavior](v3, "_focusBehavior");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "buttonSelectionMode");

  if ((v5 & 2) != 0 && -[UIControl isHighlighted](v3, "isHighlighted"))
  {
    -[_UIButtonBarButton setHighlighted:](v3, "setHighlighted:", 0);
    -[_UIButtonBarButton _setTouchHasHighlighted:](v3, "_setTouchHasHighlighted:", 0);
  }

  -[UIView _focusBehavior](v3, "_focusBehavior");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "buttonSelectionMode");

  if ((v7 & 1) != 0)
  {
    -[UIControl sendActionsForControlEvents:](v3, "sendActionsForControlEvents:", 1);
    v8 = 64;
  }
  else
  {
    v8 = 0x2000;
  }
  -[UIControl sendActionsForControlEvents:](v3, "sendActionsForControlEvents:", v8);
}

- (int64_t)preferredMenuElementOrder
{
  return self->_preferredMenuElementOrder;
}

- (_UISelectionInteraction)_selectionInteraction
{
  return self->__selectionInteraction;
}

- (void)set_selectionInteraction:(id)a3
{
  objc_storeStrong((id *)&self->__selectionInteraction, a3);
}

@end
