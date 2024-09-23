@implementation _UIContextMenuView

- (_UIContextMenuView)initWithFrame:(CGRect)a3
{
  _UIContextMenuView *v3;
  _UIContextMenuView *v4;
  void *v5;
  _UIContinuousSelectionGestureRecognizer *v6;
  void *v7;
  void *v8;
  void *v9;
  _UIContextMenuSelectionDelayGestureRecognizer *v10;
  void *v11;
  void *v12;
  void *v13;
  UITapGestureRecognizer *v14;
  uint64_t v15;
  UITapGestureRecognizer *v16;
  UIHoverGestureRecognizer *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  UISelectionFeedbackGenerator *v23;
  void *v24;
  int v25;
  int v27;
  void *v28;
  id v29;
  uint64_t v30;
  void *v31;
  objc_super v32;

  v32.receiver = self;
  v32.super_class = (Class)_UIContextMenuView;
  v3 = -[UIView initWithFrame:](&v32, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[UIView layer](v3, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAllowsGroupOpacity:", 0);

    -[UIView _setSafeAreaInsetsFrozen:](v4, "_setSafeAreaInsetsFrozen:", 1);
    v6 = -[UIGestureRecognizer initWithTarget:action:]([_UIContinuousSelectionGestureRecognizer alloc], "initWithTarget:action:", v4, sel__handleSelectionGesture_);
    -[_UIContextMenuView setSelectionGestureRecognizer:](v4, "setSelectionGestureRecognizer:", v6);

    -[_UIContextMenuView selectionGestureRecognizer](v4, "selectionGestureRecognizer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setName:", CFSTR("com.apple.UIKit.ContextMenuActionsListSelection"));

    -[_UIContextMenuView selectionGestureRecognizer](v4, "selectionGestureRecognizer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setDelegate:", v4);

    -[_UIContextMenuView selectionGestureRecognizer](v4, "selectionGestureRecognizer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView addGestureRecognizer:](v4, "addGestureRecognizer:", v9);

    v10 = -[UIGestureRecognizer initWithTarget:action:]([_UIContextMenuSelectionDelayGestureRecognizer alloc], "initWithTarget:action:", 0, 0);
    -[_UIContextMenuView setSelectionDelayGestureRecognizer:](v4, "setSelectionDelayGestureRecognizer:", v10);

    -[_UIContextMenuView selectionDelayGestureRecognizer](v4, "selectionDelayGestureRecognizer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setName:", CFSTR("com.apple.UIKit.ContextMenuActionsListSelectionDelay"));

    -[_UIContextMenuView selectionDelayGestureRecognizer](v4, "selectionDelayGestureRecognizer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setDelegate:", v4);

    -[_UIContextMenuView selectionDelayGestureRecognizer](v4, "selectionDelayGestureRecognizer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView addGestureRecognizer:](v4, "addGestureRecognizer:", v13);

    v14 = -[UITapGestureRecognizer initWithTarget:action:]([UITapGestureRecognizer alloc], "initWithTarget:action:", v4, sel__handleSelectPressGesture_);
    v15 = MEMORY[0x1E0C9AA60];
    -[UIGestureRecognizer setAllowedTouchTypes:](v14, "setAllowedTouchTypes:", MEMORY[0x1E0C9AA60]);
    -[UITapGestureRecognizer setAllowedPressTypes:](v14, "setAllowedPressTypes:", &unk_1E1A92A38);
    -[UIGestureRecognizer setCancelsTouchesInView:](v14, "setCancelsTouchesInView:", 1);
    -[UIView addGestureRecognizer:](v4, "addGestureRecognizer:", v14);
    v16 = -[UITapGestureRecognizer initWithTarget:action:]([UITapGestureRecognizer alloc], "initWithTarget:action:", v4, sel__handleMenuPressGesture_);

    -[UIGestureRecognizer setAllowedTouchTypes:](v16, "setAllowedTouchTypes:", v15);
    -[UITapGestureRecognizer setAllowedPressTypes:](v16, "setAllowedPressTypes:", &unk_1E1A92A50);
    -[UIView addGestureRecognizer:](v4, "addGestureRecognizer:", v16);
    v17 = -[UIHoverGestureRecognizer initWithTarget:action:]([UIHoverGestureRecognizer alloc], "initWithTarget:action:", v4, sel__handleHoverGestureRecognizer_);
    -[_UIContextMenuView setHighlightHoverGestureRecognizer:](v4, "setHighlightHoverGestureRecognizer:", v17);

    -[_UIContextMenuView highlightHoverGestureRecognizer](v4, "highlightHoverGestureRecognizer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setName:", CFSTR("com.apple.UIKit.ContextMenuActionsListHover"));

    -[_UIContextMenuView highlightHoverGestureRecognizer](v4, "highlightHoverGestureRecognizer");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setDelegate:", v4);

    -[_UIContextMenuView highlightHoverGestureRecognizer](v4, "highlightHoverGestureRecognizer");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView addGestureRecognizer:](v4, "addGestureRecognizer:", v20);

    +[_UISelectionFeedbackGeneratorConfiguration defaultConfiguration](_UISelectionFeedbackGeneratorConfiguration, "defaultConfiguration");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "tweakedConfigurationForClass:usage:", objc_opt_class(), CFSTR("retarget"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v23 = -[UIFeedbackGenerator initWithConfiguration:view:]([UISelectionFeedbackGenerator alloc], "initWithConfiguration:view:", v22, v4);
    -[_UIContextMenuView setFeedbackGenerator:](v4, "setFeedbackGenerator:", v23);

    v24 = (void *)objc_opt_new();
    -[_UIContextMenuView setSubmenus:](v4, "setSubmenus:", v24);

    if (_UIInternalPreferencesRevisionOnce != -1)
      dispatch_once(&_UIInternalPreferencesRevisionOnce, &__block_literal_global_4_20);
    v25 = _UIInternalPreferencesRevisionVar;
    if (_UIInternalPreferencesRevisionVar >= 1)
    {
      v27 = _UIInternalPreference_ClickUIDebugEnabled;
      if (_UIInternalPreferencesRevisionVar != _UIInternalPreference_ClickUIDebugEnabled)
      {
        while (v25 >= v27)
        {
          _UIInternalPreferenceSync(v25, &_UIInternalPreference_ClickUIDebugEnabled, (uint64_t)CFSTR("ClickUIDebugEnabled"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool);
          v27 = _UIInternalPreference_ClickUIDebugEnabled;
          if (v25 == _UIInternalPreference_ClickUIDebugEnabled)
            goto LABEL_5;
        }
        if (byte_1EDDA7D7C)
        {
          -[UIView layer](v4, "layer");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "setBorderWidth:", 1.0);

          +[UIColor magentaColor](UIColor, "magentaColor");
          v29 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v30 = objc_msgSend(v29, "CGColor");
          -[UIView layer](v4, "layer");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "setBorderColor:", v30);

        }
      }
    }
LABEL_5:

  }
  return v4;
}

- (void)setUserInteractionEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)_UIContextMenuView;
  -[UIView setUserInteractionEnabled:](&v7, sel_setUserInteractionEnabled_);
  -[_UIContextMenuView selectionGestureRecognizer](self, "selectionGestureRecognizer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEnabled:", v3);

  -[_UIContextMenuView highlightHoverGestureRecognizer](self, "highlightHoverGestureRecognizer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setEnabled:", v3);

}

- (void)setShowsShadow:(BOOL)a3
{
  double v3;
  id v4;

  if (self->_showsShadow != a3)
  {
    self->_showsShadow = a3;
    if (a3)
      v3 = 1.0;
    else
      v3 = 0.0;
    -[_UIContextMenuView currentListView](self, "currentListView");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setShadowAlpha:", v3);

  }
}

- (void)setReversesActionOrder:(BOOL)a3
{
  void *v4;
  _QWORD v5[5];

  if (self->_reversesActionOrder != a3)
  {
    self->_reversesActionOrder = a3;
    -[_UIContextMenuView submenus](self, "submenus");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __45___UIContextMenuView_setReversesActionOrder___block_invoke;
    v5[3] = &unk_1E16B2538;
    v5[4] = self;
    objc_msgSend(v4, "enumerateNodes:", v5);

  }
}

- (void)setHierarchyStyle:(unint64_t)a3
{
  id v4;

  if (self->_hierarchyStyle != a3)
  {
    self->_hierarchyStyle = a3;
    v4 = (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithMenuView:", self);
    -[_UIContextMenuView setLayout:](self, "setLayout:", v4);

  }
}

- (BOOL)kickstartActionScrubbingWithGesture:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  BOOL v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[_UIContextMenuView selectionGestureRecognizer](self, "selectionGestureRecognizer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_activeEvents");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count"))
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    -[UIView gestureRecognizers](self, "gestureRecognizers", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v16 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0 && !objc_msgSend(v12, "state"))
            -[UIGestureRecognizer addTouchesFromGestureRecognizer:](v12, (id *)v4);
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v9);
    }

    if (!objc_msgSend(v5, "state"))
      -[UIGestureRecognizer transferTouchesFromGestureRecognizer:](v5, (id *)v4);
  }
  v13 = objc_msgSend(v5, "state") > 0;

  return v13;
}

- (void)scrollToFirstSignificantAction
{
  id v2;

  -[_UIContextMenuView currentListView](self, "currentListView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scrollToFirstSignificantAction");

}

- (void)flashScrollIndicators
{
  void *v2;
  id v3;

  -[_UIContextMenuView currentListView](self, "currentListView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "collectionView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "flashScrollIndicators");

}

- (void)didCompleteMenuAppearanceAnimation
{
  id v3;

  -[_UIContextMenuView flashScrollIndicators](self, "flashScrollIndicators");
  -[_UIContextMenuView currentListView](self, "currentListView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "didCompleteMenuAppearanceAnimation");

}

- (CGRect)activeSubmenuFrameInCoordinateSpace:(id)a3
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
  CGRect result;

  v4 = a3;
  -[_UIContextMenuView currentListView](self, "currentListView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "frame");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  -[UIView convertRect:toCoordinateSpace:](self, "convertRect:toCoordinateSpace:", v4, v7, v9, v11, v13);
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;

  v22 = v15;
  v23 = v17;
  v24 = v19;
  v25 = v21;
  result.size.height = v25;
  result.size.width = v24;
  result.origin.y = v23;
  result.origin.x = v22;
  return result;
}

- (void)didMoveToWindow
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_UIContextMenuView;
  -[UIView didMoveToWindow](&v4, sel_didMoveToWindow);
  if (-[_UIContextMenuView wantsFocusDeferralIfSupported](self, "wantsFocusDeferralIfSupported"))
  {
    -[UIView _focusSystem](self, "_focusSystem");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_startDeferringFocusIfSupported");

    -[_UIContextMenuView setWantsFocusDeferralIfSupported:](self, "setWantsFocusDeferralIfSupported:", 0);
  }
}

- (CGSize)preferredContentSizeWithinContainerSize:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[_UIContextMenuView setMaxContainerSize:](self, "setMaxContainerSize:");
  -[_UIContextMenuView submenus](self, "submenus");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "nodes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8 == 1)
  {
    -[_UIContextMenuView currentListView](self, "currentListView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "preferredContentSizeWithinContainerSize:", width, height);
    objc_msgSend(v9, "setNativeContentSize:");
    objc_msgSend(v9, "nativeContentSize");
  }
  else
  {
    -[_UIContextMenuView setIsComputingPreferredSize:](self, "setIsComputingPreferredSize:", 1);
    -[_UIContextMenuView setVisibleContentSize:](self, "setVisibleContentSize:", width, 44.0);
    -[UIView setNeedsLayout](self, "setNeedsLayout");
    -[UIView layoutIfNeeded](self, "layoutIfNeeded");
    -[_UIContextMenuView layout](self, "layout");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "encompassingSize");
  }
  v12 = v10;
  v13 = v11;

  v14 = v12;
  v15 = v13;
  result.height = v15;
  result.width = v14;
  return result;
}

- (double)closestScrollTruncationDetentToHeight:(double)a3
{
  double v5;
  double result;
  void *v7;
  double v8;
  double v9;

  -[_UIContextMenuView preferredScrollTruncationDetent](self, "preferredScrollTruncationDetent");
  if (v5 <= 0.0)
  {
    -[_UIContextMenuView currentListView](self, "currentListView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "closestScrollTruncationDetentToHeight:", a3);
    v9 = v8;

    -[_UIContextMenuView setPreferredScrollTruncationDetent:](self, "setPreferredScrollTruncationDetent:", v9);
    return v9;
  }
  else
  {
    -[_UIContextMenuView preferredScrollTruncationDetent](self, "preferredScrollTruncationDetent");
  }
  return result;
}

- (void)layoutSubviews
{
  void *v3;
  _BOOL8 v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UIContextMenuView;
  -[UIView layoutSubviews](&v5, sel_layoutSubviews);
  -[_UIContextMenuView layout](self, "layout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[_UIContextMenuView isComputingPreferredSize](self, "isComputingPreferredSize");
  -[_UIContextMenuView maxContainerSize](self, "maxContainerSize");
  objc_msgSend(v3, "performLayoutForComputingPreferredContentSize:withMaxContainerSize:", v4);

  if (-[_UIContextMenuView isComputingPreferredSize](self, "isComputingPreferredSize"))
    -[_UIContextMenuView setIsComputingPreferredSize:](self, "setIsComputingPreferredSize:", 0);
}

- (_UIContextMenuListView)currentListView
{
  void *v2;
  void *v3;
  void *v4;

  -[_UIContextMenuView submenus](self, "submenus");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "current");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "listView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (_UIContextMenuListView *)v4;
}

- (id)hoveredListView
{
  void *v2;
  void *v3;

  -[_UIContextMenuView hoveredNode](self, "hoveredNode");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "listView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSArray)visibleMenus
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v7[4];
  id v8;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIContextMenuView submenus](self, "submenus");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __34___UIContextMenuView_visibleMenus__block_invoke;
  v7[3] = &unk_1E16B2538;
  v5 = v3;
  v8 = v5;
  objc_msgSend(v4, "enumerateNodes:", v7);

  return (NSArray *)v5;
}

- (void)replaceVisibleMenu:(id)a3 withMenu:(id)a4 alongsideAnimations:(id)a5
{
  -[_UIContextMenuView _displayMenu:inPlaceOfMenu:updateType:alongsideAnimations:](self, "_displayMenu:inPlaceOfMenu:updateType:alongsideAnimations:", a4, a3, 3, a5);
}

- (void)displayMenu:(id)a3 updateType:(unint64_t)a4 alongsideAnimations:(id)a5
{
  -[_UIContextMenuView _displayMenu:inPlaceOfMenu:updateType:alongsideAnimations:](self, "_displayMenu:inPlaceOfMenu:updateType:alongsideAnimations:", a3, 0, a4, a5);
}

- (void)_displayMenu:(id)a3 inPlaceOfMenu:(id)a4 updateType:(unint64_t)a5 alongsideAnimations:(id)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  unint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  id v27;
  id v28;
  char v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  BOOL v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  id v53;
  uint64_t v54;
  id v55;
  id v56;
  id v57;
  void *v58;
  uint64_t v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  id v70;
  _QWORD v71[4];
  id v72;
  _QWORD v73[4];
  id v74;
  id v75;
  _UIContextMenuView *v76;
  id v77;
  uint64_t v78;
  _QWORD v79[4];
  id v80;
  id v81;
  _QWORD v82[5];
  id v83;
  id v84;
  id v85;
  uint64_t v86;
  _QWORD v87[4];
  id v88;
  id v89;
  _QWORD aBlock[5];
  _QWORD v91[4];
  id v92;
  uint64_t v93;

  v10 = a3;
  v70 = a6;
  v11 = a4;
  -[_UIContextMenuView submenus](self, "submenus");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v11)
    v14 = v11;
  else
    v14 = v10;
  objc_msgSend(v12, "nodeForMenu:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (a5 == 3)
  {
    v16 = v15;
    objc_msgSend(v16, "setMenu:", v10);
    v17 = 0;
    goto LABEL_6;
  }
  -[_UIContextMenuView departingNode](self, "departingNode");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "menu");
  v27 = (id)objc_claimAutoreleasedReturnValue();
  v28 = v10;
  v19 = v28;
  if (v27 == v28)
  {

  }
  else
  {
    if (!v28 || !v27)
    {

      if (v15)
        goto LABEL_17;
      goto LABEL_38;
    }
    v29 = objc_msgSend(v27, "isEqual:", v28);

    if ((v29 & 1) == 0)
    {
      if (v15)
      {
LABEL_17:
        v16 = v15;
        -[_UIContextMenuView submenus](self, "submenus");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "popNode");
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        -[_UIContextMenuView departingNode](self, "departingNode");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "listView");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "removeFromSuperview");

        -[_UIContextMenuView setDepartingNode:](self, "setDepartingNode:", v17);
        v69 = 0;
        a5 = 2;
        goto LABEL_32;
      }
LABEL_38:
      -[_UIContextMenuView submenus](self, "submenus");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "current");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      -[_UIContextMenuView departingNode](self, "departingNode");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "listView");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "removeFromSuperview");

      -[_UIContextMenuView setDepartingNode:](self, "setDepartingNode:", 0);
      v16 = 0;
      goto LABEL_6;
    }
  }
  -[_UIContextMenuView departingNode](self, "departingNode");
  v33 = objc_claimAutoreleasedReturnValue();
  -[_UIContextMenuView submenus](self, "submenus");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "current");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  -[_UIContextMenuView setDepartingNode:](self, "setDepartingNode:", 0);
  v16 = 0;
  if (v33)
  {
    v69 = 0;
    v20 = a5;
    v16 = (id)v33;
LABEL_30:
    -[_UIContextMenuView submenus](self, "submenus");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "addNode:", v16);

    goto LABEL_31;
  }
LABEL_6:
  -[_UIContextMenuView delegate](self, "delegate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "contextMenuView:willDisplayMenu:", self, v10);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    v20 = a5;
    if ((objc_msgSend(v19, "metadata") & 0x1000000) != 0)
    {
LABEL_22:
      v69 = 0;
      if (a5 == 3)
      {
LABEL_31:
        a5 = v20;
        goto LABEL_32;
      }
      goto LABEL_23;
    }
  }
  -[_UIContextMenuView submenus](self, "submenus");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "first");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15 == v22)
  {
    v20 = 5;
    goto LABEL_22;
  }
  if (!v15)
  {

    v17 = 0;
    v69 = 0;
    goto LABEL_32;
  }
  -[_UIContextMenuView submenus](self, "submenus");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "removeNode:", v15);
  v69 = (void *)objc_claimAutoreleasedReturnValue();

  -[_UIContextMenuView submenus](self, "submenus");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "current");
  v25 = objc_claimAutoreleasedReturnValue();

  v17 = 0;
  v20 = 4;
  v16 = (id)v25;
  if (a5 != 3)
  {
LABEL_23:
    if (!v16)
    {
      -[_UIContextMenuView visibleMenus](self, "visibleMenus");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_msgSend(v35, "count");

      v37 = 0;
      if (v20 != 3 && v36)
      {
        if (-[_UIContextMenuView hierarchyStyle](self, "hierarchyStyle") == 1)
          v37 = 1;
        else
          v37 = 2;
      }
      v16 = (id)objc_opt_new();
      v38 = -[_UIContextMenuView _newListViewWithMenu:position:](self, "_newListViewWithMenu:position:", v19, v37);
      objc_msgSend(v16, "setListView:", v38);

      objc_msgSend(v16, "setMenu:", v19);
    }
    goto LABEL_30;
  }
  a5 = 4;
  v16 = (id)v25;
LABEL_32:
  objc_msgSend(v16, "listView");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "listView");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = -[_UIContextMenuView retainHighlightOnMenuNavigation](self, "retainHighlightOnMenuNavigation");
  objc_msgSend(v41, "setAllowsFocus:", 0);
  objc_msgSend(v40, "setAllowsFocus:", 1);
  if (a5 == 5 || v41 != v40)
  {
    switch(a5)
    {
      case 0uLL:
        -[UIView traitCollection](self, "traitCollection");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setLeftOfParentWhenCascading:", objc_msgSend(v43, "layoutDirection") == 1);

        -[UIView addSubview:](self, "addSubview:", v40);
        if (v70)
        {
          +[UIViewSpringAnimationBehavior behaviorWithDampingRatio:response:](UIViewSpringAnimationBehavior, "behaviorWithDampingRatio:response:", 1.0, 0.4);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          v91[0] = MEMORY[0x1E0C809B0];
          v91[1] = 3221225472;
          v91[2] = __80___UIContextMenuView__displayMenu_inPlaceOfMenu_updateType_alongsideAnimations___block_invoke;
          v91[3] = &unk_1E16B2560;
          v92 = v70;
          v93 = 0;
          +[UIView _animateUsingSpringBehavior:tracking:animations:completion:](UIView, "_animateUsingSpringBehavior:tracking:animations:completion:", v44, 1, v91, 0);

          v45 = v92;
          goto LABEL_47;
        }
        break;
      case 1uLL:
        -[_UIContextMenuView layout](self, "layout");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "navigateDownFromNode:toNode:alongsideAnimations:completion:", v17, v16, v70, 0);
        goto LABEL_42;
      case 2uLL:
        aBlock[0] = MEMORY[0x1E0C809B0];
        aBlock[1] = 3221225472;
        aBlock[2] = __80___UIContextMenuView__displayMenu_inPlaceOfMenu_updateType_alongsideAnimations___block_invoke_3;
        aBlock[3] = &unk_1E16B2588;
        aBlock[4] = self;
        v49 = _Block_copy(aBlock);
        -[_UIContextMenuView layout](self, "layout");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "navigateUpFromNode:toNode:alongsideAnimations:completion:", v17, v16, v70, v49);

LABEL_42:
        break;
      case 3uLL:
        objc_msgSend(v40, "collectionView");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "highlightedIndexPath");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "elementAtIndexPath:", v51);
        v52 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(v40, "willStartInPlaceMenuTransition");
        v87[0] = MEMORY[0x1E0C809B0];
        v87[1] = 3221225472;
        v87[2] = __80___UIContextMenuView__displayMenu_inPlaceOfMenu_updateType_alongsideAnimations___block_invoke_4;
        v87[3] = &unk_1E16B1B50;
        v53 = v40;
        v88 = v53;
        v89 = v19;
        +[UIView _performWithoutRetargetingAnimations:](UIView, "_performWithoutRetargetingAnimations:", v87);
        v68 = (void *)v52;
        objc_msgSend(v53, "indexPathForElement:", v52);
        v54 = objc_claimAutoreleasedReturnValue();
        if (v54)
          objc_msgSend(v53, "highlightItemAtIndexPath:", v54);
        v65 = (void *)objc_opt_new();
        objc_msgSend(v65, "setTrackingDampingRatio:response:dampingRatioSmoothing:responseSmoothing:", 1.0, 0.4, 1.0, 1.0);
        v82[0] = MEMORY[0x1E0C809B0];
        v82[1] = 3221225472;
        v82[2] = __80___UIContextMenuView__displayMenu_inPlaceOfMenu_updateType_alongsideAnimations___block_invoke_5;
        v82[3] = &unk_1E16B25D8;
        v82[4] = self;
        v85 = v70;
        v86 = 3;
        v83 = v53;
        v55 = v66;
        v67 = (void *)v54;
        v56 = v55;
        v84 = v55;
        v79[0] = MEMORY[0x1E0C809B0];
        v79[1] = 3221225472;
        v79[2] = __80___UIContextMenuView__displayMenu_inPlaceOfMenu_updateType_alongsideAnimations___block_invoke_8;
        v79[3] = &unk_1E16B25B0;
        v80 = v55;
        v81 = v83;
        v57 = v56;
        +[UIView _animateUsingSpringBehavior:tracking:animations:completion:](UIView, "_animateUsingSpringBehavior:tracking:animations:completion:", v65, 1, v82, v79);

        v45 = v68;
        goto LABEL_47;
      case 4uLL:
        +[UIViewSpringAnimationBehavior behaviorWithDampingRatio:response:](UIViewSpringAnimationBehavior, "behaviorWithDampingRatio:response:", 1.0, 0.32);
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        v59 = MEMORY[0x1E0C809B0];
        v73[0] = MEMORY[0x1E0C809B0];
        v73[1] = 3221225472;
        v73[2] = __80___UIContextMenuView__displayMenu_inPlaceOfMenu_updateType_alongsideAnimations___block_invoke_9;
        v73[3] = &unk_1E16B25D8;
        v77 = v70;
        v78 = 4;
        v74 = v40;
        v75 = v69;
        v76 = self;
        v71[0] = v59;
        v71[1] = 3221225472;
        v71[2] = __80___UIContextMenuView__displayMenu_inPlaceOfMenu_updateType_alongsideAnimations___block_invoke_11;
        v71[3] = &unk_1E16B2588;
        v72 = v75;
        +[UIView _animateUsingSpringBehavior:tracking:animations:completion:](UIView, "_animateUsingSpringBehavior:tracking:animations:completion:", v58, 0, v73, v71);

        v45 = v77;
LABEL_47:

        break;
      case 5uLL:
        if (v70)
          (*((void (**)(id, uint64_t))v70 + 2))(v70, 5);
        break;
      default:
        break;
    }
  }
  -[_UIContextMenuView submenus](self, "submenus");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "current");
  v61 = (void *)objc_claimAutoreleasedReturnValue();

  if (v61)
  {
    if (!v42)
    {
      -[UIView _focusSystem](self, "_focusSystem");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      v63 = v62;
      if (v62)
        objc_msgSend(v62, "_startDeferringFocusIfSupported");
      else
        -[_UIContextMenuView setWantsFocusDeferralIfSupported:](self, "setWantsFocusDeferralIfSupported:", 1);

    }
    -[UIView setNeedsFocusUpdate](self, "setNeedsFocusUpdate");
    -[_UIContextMenuView setRetainHighlightOnMenuNavigation:](self, "setRetainHighlightOnMenuNavigation:", 0);
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIContextMenuView setAppearanceDate:](self, "setAppearanceDate:", v64);

  }
}

- (id)_newListViewWithMenu:(id)a3 position:(unint64_t)a4
{
  id v6;
  _BOOL4 v7;
  __int16 v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  double v13;
  double v14;
  int v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  _UIContextMenuListView *v25;
  _BOOL4 v26;
  double v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  int v34;
  int v36;
  void *v37;
  id v38;
  uint64_t v39;
  void *v40;

  v6 = a3;
  v7 = (objc_msgSend(v6, "metadata") & 0x10000) != 0
    && -[_UIContextMenuView hierarchyStyle](self, "hierarchyStyle") == 2;
  v8 = objc_msgSend(v6, "metadata");
  v9 = objc_msgSend(v6, "metadata");
  -[UIView traitCollection](self, "traitCollection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "userInterfaceIdiom");
  _UIContextMenuGetPlatformMetrics(v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "defaultMenuWidth");
  v14 = v13;
  v15 = objc_msgSend(v12, "leadingIndentationContributesToWidth");
  v16 = 0.0;
  v17 = 0.0;
  if ((v8 & 0x100) != 0 && v15)
  {
    _UIContextMenuGetPlatformMetrics(v11);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "leadingIndentationWidth");
    v17 = v19;

  }
  v20 = v14 + v17;
  if (v7)
  {
    _UIContextMenuGetPlatformMetrics(v11);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "menuGutterWidth");
    v16 = v22;

  }
  v23 = v20 + v16;
  if ((v9 & 0x100000000) != 0)
  {
    objc_msgSend(v12, "largePaletteWidthExtension");
    v23 = v23 + v24;
  }

  v25 = -[_UIContextMenuListView initWithFrame:]([_UIContextMenuListView alloc], "initWithFrame:", 0.0, 0.0, v23, 44.0);
  v26 = -[_UIContextMenuView showsShadow](self, "showsShadow");
  v27 = 1.0;
  if (!v26)
    v27 = 0.0;
  -[_UIContextMenuListView setShadowAlpha:](v25, "setShadowAlpha:", v27);
  -[_UIContextMenuListView setParentHierarchyStyle:](v25, "setParentHierarchyStyle:", -[_UIContextMenuView hierarchyStyle](self, "hierarchyStyle"));
  -[_UIContextMenuListView setPosition:](v25, "setPosition:", a4);
  -[_UIContextMenuListView setReversesActionOrder:](v25, "setReversesActionOrder:", -[_UIContextMenuView reversesActionOrder](self, "reversesActionOrder"));
  -[_UIContextMenuView visibleContentSize](self, "visibleContentSize");
  -[_UIContextMenuListView setVisibleContentSize:](v25, "setVisibleContentSize:");
  -[UIView layer](self, "layer");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "anchorPoint");
  v30 = v29;
  v32 = v31;
  -[UIView layer](v25, "layer");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setAnchorPoint:", v30, v32);

  -[_UIContextMenuListView setDisplayedMenu:](v25, "setDisplayedMenu:", v6);
  -[_UIContextMenuListView setAllowsBackgroundViewInteraction:](v25, "setAllowsBackgroundViewInteraction:", -[_UIContextMenuView allowsBackgroundViewInteraction](self, "allowsBackgroundViewInteraction"));
  if (_UIInternalPreferencesRevisionOnce != -1)
    dispatch_once(&_UIInternalPreferencesRevisionOnce, &__block_literal_global_4_20);
  v34 = _UIInternalPreferencesRevisionVar;
  if (_UIInternalPreferencesRevisionVar >= 1)
  {
    v36 = _UIInternalPreference_ClickUIDebugEnabled;
    if (_UIInternalPreferencesRevisionVar != _UIInternalPreference_ClickUIDebugEnabled)
    {
      while (v34 >= v36)
      {
        _UIInternalPreferenceSync(v34, &_UIInternalPreference_ClickUIDebugEnabled, (uint64_t)CFSTR("ClickUIDebugEnabled"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool);
        v36 = _UIInternalPreference_ClickUIDebugEnabled;
        if (v34 == _UIInternalPreference_ClickUIDebugEnabled)
          goto LABEL_16;
      }
      if (byte_1EDDA7D7C)
      {
        -[UIView layer](v25, "layer");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "setBorderWidth:", 1.0);

        +[UIColor blueColor](UIColor, "blueColor");
        v38 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v39 = objc_msgSend(v38, "CGColor");
        -[UIView layer](v25, "layer");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "setBorderColor:", v39);

      }
    }
  }
LABEL_16:

  return v25;
}

- (void)_updateSelectionGestureAllowableMovementForGestureBeginningAtIndexPath:(id)a3
{
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  id v10;

  v10 = a3;
  v4 = 10.0;
  v5 = 10.0;
  if (-[_UIContextMenuView scrubbingEnabled](self, "scrubbingEnabled"))
  {
    -[_UIContextMenuView currentListView](self, "currentListView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "selectionGestureAllowableMovementForGestureBeginningAtIndexPath:", v10);
    v4 = v7;
    v5 = v8;

  }
  -[_UIContextMenuView selectionGestureRecognizer](self, "selectionGestureRecognizer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAllowableMovement:", v4, v5);

}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  uint64_t v10;
  void *v11;
  BOOL v12;

  v4 = a3;
  -[_UIContextMenuView selectionGestureRecognizer](self, "selectionGestureRecognizer");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 != v4)
    goto LABEL_4;
  objc_msgSend(v4, "locationInView:", self);
  v7 = v6;
  v9 = v8;
  -[UIGestureRecognizer _activeTouchesEvent](v4);
  v10 = objc_claimAutoreleasedReturnValue();
  -[_UIContextMenuView hitTest:withEvent:](self, "hitTest:withEvent:", v10, v7, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  LOBYTE(v10) = objc_opt_isKindOfClass();

  if ((v10 & 1) != 0)
    v12 = 0;
  else
LABEL_4:
    v12 = 1;

  return v12;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v6;
  id v7;
  id v8;
  char v9;
  void *v10;

  v6 = a4;
  v7 = a3;
  -[_UIContextMenuView selectionGestureRecognizer](self, "selectionGestureRecognizer");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 == v7)
  {
    objc_msgSend(v6, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v10, "isDescendantOfView:", self);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4
{
  id v6;
  id v7;
  id v8;
  int v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v6 = a4;
  v7 = a3;
  -[_UIContextMenuView selectionGestureRecognizer](self, "selectionGestureRecognizer");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 == v7)
  {
    -[_UIContextMenuView selectionDelayGestureRecognizer](self, "selectionDelayGestureRecognizer");
    v10 = (id)objc_claimAutoreleasedReturnValue();

    if (v10 == v6)
    {
      LOBYTE(v9) = 1;
    }
    else
    {
      -[_UIContextMenuView currentListView](self, "currentListView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "collectionView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "view");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      if (v13 == v12 || !objc_msgSend(v13, "isDescendantOfView:", v12))
        LOBYTE(v9) = 0;
      else
        v9 = objc_msgSend(v6, "_isGestureType:", 9) ^ 1;

    }
  }
  else
  {
    LOBYTE(v9) = 0;
  }

  return v9;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  return 1;
}

- (void)_handleSelectionForElement:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t);
  void *v19;
  id v20;
  id v21;

  v4 = a3;
  -[_UIContextMenuView currentListView](self, "currentListView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "displayedMenu");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "isEqual:", v6);

  if (v7)
  {
    -[_UIContextMenuView submenus](self, "submenus");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "current");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "previous");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "menu");
    v11 = objc_claimAutoreleasedReturnValue();

    v4 = (id)v11;
  }
  if (objc_msgSend(v4, "_canBeHighlighted"))
  {
    -[_UIContextMenuView _performActionForElement:](self, "_performActionForElement:", v4);
    if (objc_msgSend(v4, "_isLeaf"))
    {
      if (objc_msgSend(v4, "keepsMenuPresented"))
      {
        -[_UIContextMenuView currentListView](self, "currentListView");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "highlightedIndexPath");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
        {
          v14 = (void *)MEMORY[0x1E0C99E88];
          v16 = MEMORY[0x1E0C809B0];
          v17 = 3221225472;
          v18 = __49___UIContextMenuView__handleSelectionForElement___block_invoke;
          v19 = &unk_1E16B2600;
          v20 = v5;
          v21 = v13;
          objc_msgSend(v14, "scheduledTimerWithTimeInterval:repeats:block:", 0, &v16, 0.1);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[_UIContextMenuView setAutoUnhighlightTimer:](self, "setAutoUnhighlightTimer:", v15, v16, v17, v18, v19);

        }
      }
    }
  }

}

- (void)_handleSelectionGesture:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _BOOL8 v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  _BOOL4 v15;
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
  void *v26;
  _BOOL8 v27;
  void *v28;
  uint64_t v29;
  void *v30;
  int v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  void (*v36)(uint64_t, void *, _BYTE *);
  void *v37;
  id v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t (*v43)(uint64_t, uint64_t);
  void (*v44)(uint64_t);
  id v45;

  v4 = a3;
  -[_UIContextMenuView currentListView](self, "currentListView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "locationInView:", v5);
  objc_msgSend(v5, "indexPathForItemAtPoint:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "state");
  v8 = v7 != 1;
  if (v7 == 1)
  {
    -[_UIContextMenuView autoUnhighlightTimer](self, "autoUnhighlightTimer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "invalidate");

    -[_UIContextMenuView setAutoUnhighlightTimer:](self, "setAutoUnhighlightTimer:", 0);
    -[_UIContextMenuView _updateSelectionGestureAllowableMovementForGestureBeginningAtIndexPath:](self, "_updateSelectionGestureAllowableMovementForGestureBeginningAtIndexPath:", v6);
    -[_UIContextMenuView feedbackGenerator](self, "feedbackGenerator");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "locationInView:", v5);
    objc_msgSend(v10, "userInteractionStartedAtLocation:");

  }
  v11 = objc_msgSend(v4, "buttonMask");
  objc_msgSend(v5, "highlightedIndexPath");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v4, "state");
  if (v12)
  {
    v15 = v13 == 3 && v11 != 2;
    if (objc_msgSend(v4, "state") > 2)
    {
      if (v15)
      {
        v8 = 0;
        v15 = 1;
LABEL_20:
        -[_UIContextMenuView feedbackGenerator](self, "feedbackGenerator", v34, v35, v36, v37);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "locationInView:", v5);
        objc_msgSend(v23, "userInteractionEndedAtLocation:");

        -[_UIContextMenuView setUnselectableIndexPath:](self, "setUnselectableIndexPath:", 0);
        goto LABEL_22;
      }
LABEL_14:

      if (v11 != 2)
      {
        v40 = 0;
        v41 = &v40;
        v42 = 0x3032000000;
        v43 = __Block_byref_object_copy__8;
        v44 = __Block_byref_object_dispose__8;
        v45 = 0;
        -[_UIContextMenuView submenus](self, "submenus");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = MEMORY[0x1E0C809B0];
        v35 = 3221225472;
        v36 = __46___UIContextMenuView__handleSelectionGesture___block_invoke;
        v37 = &unk_1E16B2628;
        v38 = v4;
        v39 = &v40;
        objc_msgSend(v16, "reverseEnumerateNodes:", &v34);

        v17 = (void *)v41[5];
        if (v17)
        {
          -[_UIContextMenuView currentListView](self, "currentListView", v34, v35, v36, v37);
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          if (v17 != v18)
          {
            -[_UIContextMenuView submenus](self, "submenus");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "current");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "previous");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "menu");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            -[_UIContextMenuView _performActionForElement:](self, "_performActionForElement:", v22);

          }
        }

        _Block_object_dispose(&v40, 8);
      }
      v15 = 0;
      v6 = 0;
      goto LABEL_20;
    }
  }
  else
  {
    if (v13 > 2)
      goto LABEL_14;
    v15 = 0;
  }
LABEL_22:
  -[_UIContextMenuView currentListView](self, "currentListView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 == v24)
  {
    objc_msgSend(v4, "_allActiveTouches");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "anyObject");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = -[_UIContextMenuView _touchSupportsAutoNavigation:](self, "_touchSupportsAutoNavigation:", v26);

    objc_msgSend(v4, "locationInView:", v5);
    -[_UIContextMenuView _setHighlightedIndexPath:playFeedback:atLocation:allowAutoNavigation:](self, "_setHighlightedIndexPath:playFeedback:atLocation:allowAutoNavigation:", v6, v8, v27);
    if (!v15)
      goto LABEL_30;
  }
  else if (!v15)
  {
    goto LABEL_30;
  }
  objc_msgSend(v5, "elementAtIndexPath:", v12);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIGestureRecognizer _activeTouchesEvent](v4);
  v29 = objc_claimAutoreleasedReturnValue();
  if (v29)
  {
    v30 = (void *)v29;
    v31 = objc_msgSend(v28, "_acceptBoolMenuVisit:commandVisit:actionVisit:", 0, &__block_literal_global_12, &__block_literal_global_78);

    if (v31)
    {
      -[UIGestureRecognizer _activeTouchesEvent](v4);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "_authenticationMessage");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      +[UIPasteboard _attemptAuthenticationWithMessage:](UIPasteboard, "_attemptAuthenticationWithMessage:", v33);

    }
  }
  -[_UIContextMenuView _handleSelectionForElement:](self, "_handleSelectionForElement:", v28);

LABEL_30:
}

- (void)_handleHoverGestureRecognizer:(id)a3
{
  id v4;
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
  _BOOL8 v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t);
  void *v19;
  id v20;
  _UIContextMenuView *v21;

  v4 = a3;
  if (objc_msgSend(v4, "state") > 2)
  {
    v7 = 0;
  }
  else
  {
    -[_UIContextMenuView autoUnhighlightTimer](self, "autoUnhighlightTimer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "invalidate");

    -[_UIContextMenuView setAutoUnhighlightTimer:](self, "setAutoUnhighlightTimer:", 0);
    -[_UIContextMenuView currentListView](self, "currentListView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "locationInView:", v6);
    objc_msgSend(v6, "indexPathForItemAtPoint:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIContextMenuView hoverVelocityIntegrator](self, "hoverVelocityIntegrator");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      v9 = (void *)objc_opt_new();
      -[_UIContextMenuView setHoverVelocityIntegrator:](self, "setHoverVelocityIntegrator:", v9);

      -[_UIContextMenuView hoverVelocityIntegrator](self, "hoverVelocityIntegrator");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setMinimumRequiredMovement:", 1.0);

    }
    -[_UIContextMenuView hoverVelocityIntegrator](self, "hoverVelocityIntegrator");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "locationInView:", self);
    objc_msgSend(v11, "addSample:");

  }
  if (-[_UIContextMenuView hierarchyStyle](self, "hierarchyStyle") == 2)
  {
    +[UIViewSpringAnimationBehavior behaviorWithDampingRatio:response:](UIViewSpringAnimationBehavior, "behaviorWithDampingRatio:response:", 1.0, 0.4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = MEMORY[0x1E0C809B0];
    v17 = 3221225472;
    v18 = __52___UIContextMenuView__handleHoverGestureRecognizer___block_invoke;
    v19 = &unk_1E16B1B50;
    v20 = v4;
    v21 = self;
    +[UIView _animateUsingSpringBehavior:tracking:animations:completion:](UIView, "_animateUsingSpringBehavior:tracking:animations:completion:", v12, 0, &v16, 0);

  }
  objc_msgSend(v4, "_allActiveTouches", v16, v17, v18, v19);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "anyObject");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[_UIContextMenuView _touchSupportsAutoNavigation:](self, "_touchSupportsAutoNavigation:", v14);

  objc_msgSend(v4, "locationInView:", self);
  -[_UIContextMenuView _setHighlightedIndexPath:playFeedback:atLocation:allowAutoNavigation:](self, "_setHighlightedIndexPath:playFeedback:atLocation:allowAutoNavigation:", v7, 0, v15);

}

- (void)_setHighlightedIndexPath:(id)a3 playFeedback:(BOOL)a4 atLocation:(CGPoint)a5 allowAutoNavigation:(BOOL)a6
{
  _BOOL4 v6;
  double y;
  double x;
  _BOOL4 v9;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  _BOOL4 v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  _BOOL4 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v6 = a6;
  y = a5.y;
  x = a5.x;
  v9 = a4;
  v36 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  -[_UIContextMenuView currentListView](self, "currentListView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "highlightedIndexPath");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIContextMenuView selectionGestureRecognizer](self, "selectionGestureRecognizer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "numberOfTouches");

  if ((((v15 != 0) ^ -[_UIContextMenuView hasTrackingTouch](self, "hasTrackingTouch")) & 1) != 0
    || (objc_msgSend(v11, "isEqual:", v13) & 1) == 0
    && (-[_UIContextMenuView unselectableIndexPath](self, "unselectableIndexPath"),
        v16 = (void *)objc_claimAutoreleasedReturnValue(),
        v17 = objc_msgSend(v11, "isEqual:", v16),
        v16,
        (v17 & 1) == 0))
  {
    -[_UIContextMenuView setHasTrackingTouch:](self, "setHasTrackingTouch:", v15 != 0);
    -[_UIContextMenuView _clearAutoNavigationTimer](self, "_clearAutoNavigationTimer");
    -[_UIContextMenuView setUnselectableIndexPath:](self, "setUnselectableIndexPath:", 0);
    if (v13)
      objc_msgSend(v12, "unHighlightItemAtIndexPath:", v13);
    if (v11)
    {
      objc_msgSend(v12, "elementAtIndexPath:", v11);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v18 = 0;
    }
    if (objc_msgSend(v18, "_canBeHighlighted"))
    {
      v30 = v9;
      objc_msgSend(v18, "image");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      _UIImageName(v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "isEqualToString:", CFSTR("doc.on.clipboard"));

      if (v21)
      {
        -[_UIContextMenuView appearanceDate](self, "appearanceDate");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        _UIPasteboardAnalyticsReportEvent(CFSTR("ContextMenu"), v22);

      }
      v23 = v30;
      if (v6 && (v15 || -[_UIContextMenuView hierarchyStyle](self, "hierarchyStyle") == 2))
      {
        v33 = 0u;
        v34 = 0u;
        v31 = 0u;
        v32 = 0u;
        -[_UIContextMenuView highlightHoverGestureRecognizer](self, "highlightHoverGestureRecognizer");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "_allActiveTouches");
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
        if (v26)
        {
          v27 = *(_QWORD *)v32;
          while (2)
          {
            for (i = 0; i != v26; ++i)
            {
              if (*(_QWORD *)v32 != v27)
                objc_enumerationMutation(v25);
              if ((objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * i), "_isPointerTouch") & 1) != 0)
              {
                v26 = 1;
                goto LABEL_25;
              }
            }
            v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
            if (v26)
              continue;
            break;
          }
LABEL_25:
          v23 = v30;
        }

        -[_UIContextMenuView _setAutoNavigationTimerIfNecessaryForElement:isTrackpadHover:](self, "_setAutoNavigationTimerIfNecessaryForElement:isTrackpadHover:", v18, v26);
      }
      objc_msgSend(v12, "highlightItemAtIndexPath:forHover:playFeedback:", v11, v15 == 0, 1);
      if (v23)
      {
        -[_UIContextMenuView feedbackGenerator](self, "feedbackGenerator");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "selectionChangedAtLocation:", x, y);

      }
    }

  }
}

- (BOOL)_touchSupportsAutoNavigation:(id)a3
{
  return 1;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v13[5];
  id v14;
  uint64_t *v15;
  double v16;
  double v17;
  objc_super v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  CGPoint v25;
  CGRect v26;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__8;
  v23 = __Block_byref_object_dispose__8;
  v24 = 0;
  -[UIView bounds](self, "bounds");
  v25.x = x;
  v25.y = y;
  if (CGRectContainsPoint(v26, v25))
  {
    v18.receiver = self;
    v18.super_class = (Class)_UIContextMenuView;
    -[UIView hitTest:withEvent:](&v18, sel_hitTest_withEvent_, v7, x, y);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v20[5];
    v20[5] = v8;

  }
  else
  {
    -[_UIContextMenuView submenus](self, "submenus");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __40___UIContextMenuView_hitTest_withEvent___block_invoke;
    v13[3] = &unk_1E16B2690;
    v16 = x;
    v17 = y;
    v13[4] = self;
    v15 = &v19;
    v14 = v7;
    objc_msgSend(v10, "reverseEnumerateNodes:", v13);

  }
  v11 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v11;
}

- (void)_setAutoNavigationTimerIfNecessaryForElement:(id)a3 isTrackpadHover:(BOOL)a4
{
  id v5;
  double v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  _UIContextMenuView *v14;
  id v15;
  id location;

  v5 = a3;
  if ((objc_msgSend(v5, "_isLeaf") & 1) == 0)
  {
    objc_initWeak(&location, self);
    if (-[_UIContextMenuView hierarchyStyle](self, "hierarchyStyle") == 1)
      v6 = 0.5;
    else
      v6 = 0.1;
    v7 = (void *)MEMORY[0x1E0C99E88];
    v9 = MEMORY[0x1E0C809B0];
    v10 = 3221225472;
    v11 = __83___UIContextMenuView__setAutoNavigationTimerIfNecessaryForElement_isTrackpadHover___block_invoke;
    v12 = &unk_1E16B26B8;
    objc_copyWeak(&v15, &location);
    v13 = v5;
    v14 = self;
    objc_msgSend(v7, "scheduledTimerWithTimeInterval:repeats:block:", 0, &v9, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIContextMenuView setAutoNavigationTimer:](self, "setAutoNavigationTimer:", v8, v9, v10, v11, v12);

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }

}

- (void)_clearAutoNavigationTimer
{
  void *v3;

  -[_UIContextMenuView autoNavigationTimer](self, "autoNavigationTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  -[_UIContextMenuView setAutoNavigationTimer:](self, "setAutoNavigationTimer:", 0);
}

- (void)_setHoverAutoExitTimer
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t);
  void *v9;
  id v10;
  id location;

  objc_initWeak(&location, self);
  -[_UIContextMenuView hoverAutoExitTimer](self, "hoverAutoExitTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = (void *)MEMORY[0x1E0C99E88];
    v6 = MEMORY[0x1E0C809B0];
    v7 = 3221225472;
    v8 = __44___UIContextMenuView__setHoverAutoExitTimer__block_invoke;
    v9 = &unk_1E16B26E0;
    objc_copyWeak(&v10, &location);
    objc_msgSend(v4, "scheduledTimerWithTimeInterval:repeats:block:", 0, &v6, 0.1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIContextMenuView setHoverAutoExitTimer:](self, "setHoverAutoExitTimer:", v5, v6, v7, v8, v9);

    objc_destroyWeak(&v10);
  }
  objc_destroyWeak(&location);
}

- (void)_clearHoverAutoExitTimer
{
  void *v3;

  -[_UIContextMenuView hoverAutoExitTimer](self, "hoverAutoExitTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  -[_UIContextMenuView setHoverAutoExitTimer:](self, "setHoverAutoExitTimer:", 0);
}

- (id)preferredFocusEnvironments
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  -[_UIContextMenuView currentListView](self, "currentListView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (BOOL)_allowsChangingFirstResponderForFocusUpdateWithContext:(id)a3
{
  return 0;
}

- (id)keyCommands
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[4];

  v7[3] = *MEMORY[0x1E0C80C00];
  __33___UIContextMenuView_keyCommands__block_invoke((uint64_t)CFSTR("UIKeyInputEscape"), (uint64_t)sel__handleEscapeKey_);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v2;
  __33___UIContextMenuView_keyCommands__block_invoke((uint64_t)CFSTR("UIKeyInputLeftArrow"), (uint64_t)sel__handleLeftArrowKey_);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v3;
  __33___UIContextMenuView_keyCommands__block_invoke((uint64_t)CFSTR("UIKeyInputRightArrow"), (uint64_t)sel__handleRightArrowKey_);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  id v6;
  unsigned __int8 v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
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
  BOOL v25;
  objc_super v27;

  v6 = a4;
  if (sel__handleLeftArrowKey_ == a3)
  {
    -[_UIContextMenuView submenus](self, "submenus");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "current");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v9, "leftOfParentWhenCascading") & 1) != 0)
    {
      v7 = 0;
    }
    else
    {
      -[_UIContextMenuView submenus](self, "submenus");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "current");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIContextMenuView submenus](self, "submenus");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "first");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v14 != v16;

    }
    goto LABEL_16;
  }
  if (sel__handleRightArrowKey_ == a3)
  {
    -[_UIContextMenuView currentListView](self, "currentListView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "highlightedIndexPath");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      v7 = 0;
LABEL_17:

      goto LABEL_18;
    }
    -[_UIContextMenuView currentListView](self, "currentListView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "elementAtIndexPath:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v9, "_isLeaf") & 1) != 0)
    {
      LOBYTE(v12) = 0;
    }
    else
    {
      -[_UIContextMenuView currentListView](self, "currentListView");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "displayedMenu");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v9, "isEqual:", v18) ^ 1;

    }
    -[_UIContextMenuView submenus](self, "submenus");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "current");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v20, "leftOfParentWhenCascading"))
    {
      -[_UIContextMenuView submenus](self, "submenus");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "current");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIContextMenuView submenus](self, "submenus");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "first");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v22 != v24;

    }
    else
    {
      v25 = 0;
    }

    v7 = v12 | v25;
LABEL_16:

    goto LABEL_17;
  }
  v27.receiver = self;
  v27.super_class = (Class)_UIContextMenuView;
  v7 = -[UIView canPerformAction:withSender:](&v27, sel_canPerformAction_withSender_, a3, v6);
LABEL_18:

  return v7;
}

- (void)_handleEscapeKey:(id)a3
{
  id v4;

  -[_UIContextMenuView delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "didSelectCancelActionInContextMenuView:", self);

}

- (void)_selectPreviousMenuIfPossible
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  -[_UIContextMenuView submenus](self, "submenus");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "current");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIContextMenuView submenus](self, "submenus");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "first");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 != v6)
  {
    -[_UIContextMenuView submenus](self, "submenus");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "current");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "previous");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "menu");
    v10 = (id)objc_claimAutoreleasedReturnValue();

    -[_UIContextMenuView setRetainHighlightOnMenuNavigation:](self, "setRetainHighlightOnMenuNavigation:", 1);
    -[_UIContextMenuView _handleSelectionForElement:](self, "_handleSelectionForElement:", v10);

  }
}

- (void)_handleRightArrowKey:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  id v16;

  -[_UIContextMenuView currentListView](self, "currentListView", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "highlightedIndexPath");
  v16 = (id)objc_claimAutoreleasedReturnValue();

  v5 = v16;
  if (v16)
  {
    -[_UIContextMenuView currentListView](self, "currentListView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "elementAtIndexPath:", v16);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v7, "_isLeaf") & 1) != 0
      || (-[_UIContextMenuView currentListView](self, "currentListView"),
          v8 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v8, "displayedMenu"),
          v9 = (void *)objc_claimAutoreleasedReturnValue(),
          v10 = objc_msgSend(v7, "isEqual:", v9),
          v9,
          v8,
          (v10 & 1) != 0))
    {
      -[_UIContextMenuView submenus](self, "submenus");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "current");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "leftOfParentWhenCascading");

      if (v13)
        -[_UIContextMenuView _selectPreviousMenuIfPossible](self, "_selectPreviousMenuIfPossible");
    }
    else
    {
      -[_UIContextMenuView currentListView](self, "currentListView");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "elementAtIndexPath:", v16);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      -[_UIContextMenuView setRetainHighlightOnMenuNavigation:](self, "setRetainHighlightOnMenuNavigation:", 1);
      -[_UIContextMenuView _handleSelectionForElement:](self, "_handleSelectionForElement:", v15);

    }
    v5 = v16;
  }

}

- (void)_handleMenuPressGesture:(id)a3
{
  id v4;

  -[_UIContextMenuView delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "didSelectCancelActionInContextMenuView:", self);

}

- (void)_handleSelectPressGesture:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[_UIContextMenuView currentListView](self, "currentListView", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "highlightedIndexPath");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[_UIContextMenuView currentListView](self, "currentListView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "elementAtIndexPath:", v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[_UIContextMenuView setRetainHighlightOnMenuNavigation:](self, "setRetainHighlightOnMenuNavigation:", 1);
    -[_UIContextMenuView _handleSelectionForElement:](self, "_handleSelectionForElement:", v6);

  }
}

- (void)_performActionForElement:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[_UIContextMenuView _clearAutoNavigationTimer](self, "_clearAutoNavigationTimer");
  -[_UIContextMenuView setUnselectableIndexPath:](self, "setUnselectableIndexPath:", 0);
  -[_UIContextMenuView delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contextMenuView:didSelectElement:", self, v4);

}

- (CGRect)_rectOfNodeParentElement:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
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
  CGRect result;

  v4 = a3;
  objc_msgSend(v4, "previous");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "listView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "menu");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "cellForElement:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "window");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v8, "superview");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "frame");
    objc_msgSend(v10, "convertRect:toView:", self);
    v12 = v11;
    v14 = v13;
    v16 = v15;
    v18 = v17;

  }
  else
  {
    v12 = *MEMORY[0x1E0C9D628];
    v14 = *(double *)(MEMORY[0x1E0C9D628] + 8);
    v16 = *(double *)(MEMORY[0x1E0C9D628] + 16);
    v18 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  }

  v19 = v12;
  v20 = v14;
  v21 = v16;
  v22 = v18;
  result.size.height = v22;
  result.size.width = v21;
  result.origin.y = v20;
  result.origin.x = v19;
  return result;
}

- (void)_testing_tapAnAction
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[_UIContextMenuView currentListView](self, "currentListView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", 0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "elementAtIndexPath:", v4);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  v5 = v6;
  if (v6)
  {
    -[_UIContextMenuView _performActionForElement:](self, "_performActionForElement:", v6);
    v5 = v6;
  }

}

- (_UIContextMenuViewDelegate)delegate
{
  return (_UIContextMenuViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)showsShadow
{
  return self->_showsShadow;
}

- (BOOL)reversesActionOrder
{
  return self->_reversesActionOrder;
}

- (BOOL)scrubbingEnabled
{
  return self->_scrubbingEnabled;
}

- (void)setScrubbingEnabled:(BOOL)a3
{
  self->_scrubbingEnabled = a3;
}

- (BOOL)allowsBackgroundViewInteraction
{
  return self->_allowsBackgroundViewInteraction;
}

- (void)setAllowsBackgroundViewInteraction:(BOOL)a3
{
  self->_allowsBackgroundViewInteraction = a3;
}

- (CGSize)visibleContentSize
{
  double width;
  double height;
  CGSize result;

  width = self->_visibleContentSize.width;
  height = self->_visibleContentSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setVisibleContentSize:(CGSize)a3
{
  self->_visibleContentSize = a3;
}

- (unint64_t)hierarchyStyle
{
  return self->_hierarchyStyle;
}

- (unint64_t)attachmentEdge
{
  return self->_attachmentEdge;
}

- (void)setAttachmentEdge:(unint64_t)a3
{
  self->_attachmentEdge = a3;
}

- (_UIContextMenuNode)departingNode
{
  return self->_departingNode;
}

- (void)setDepartingNode:(id)a3
{
  objc_storeStrong((id *)&self->_departingNode, a3);
}

- (UICollectionViewDiffableDataSource)collectionViewDataSource
{
  return self->_collectionViewDataSource;
}

- (void)setCollectionViewDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_collectionViewDataSource, a3);
}

- (_UIContinuousSelectionGestureRecognizer)selectionGestureRecognizer
{
  return self->_selectionGestureRecognizer;
}

- (void)setSelectionGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_selectionGestureRecognizer, a3);
}

- (_UIContextMenuSelectionDelayGestureRecognizer)selectionDelayGestureRecognizer
{
  return self->_selectionDelayGestureRecognizer;
}

- (void)setSelectionDelayGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_selectionDelayGestureRecognizer, a3);
}

- (NSDate)appearanceDate
{
  return self->_appearanceDate;
}

- (void)setAppearanceDate:(id)a3
{
  objc_storeStrong((id *)&self->_appearanceDate, a3);
}

- (UIHoverGestureRecognizer)highlightHoverGestureRecognizer
{
  return self->_highlightHoverGestureRecognizer;
}

- (void)setHighlightHoverGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_highlightHoverGestureRecognizer, a3);
}

- (UISelectionFeedbackGenerator)feedbackGenerator
{
  return self->_feedbackGenerator;
}

- (void)setFeedbackGenerator:(id)a3
{
  objc_storeStrong((id *)&self->_feedbackGenerator, a3);
}

- (_UIContextMenuLinkedList)submenus
{
  return self->_submenus;
}

- (void)setSubmenus:(id)a3
{
  objc_storeStrong((id *)&self->_submenus, a3);
}

- (BOOL)isComputingPreferredSize
{
  return self->_isComputingPreferredSize;
}

- (void)setIsComputingPreferredSize:(BOOL)a3
{
  self->_isComputingPreferredSize = a3;
}

- (BOOL)retainHighlightOnMenuNavigation
{
  return self->_retainHighlightOnMenuNavigation;
}

- (void)setRetainHighlightOnMenuNavigation:(BOOL)a3
{
  self->_retainHighlightOnMenuNavigation = a3;
}

- (BOOL)shouldAvoidInputViews
{
  return self->_shouldAvoidInputViews;
}

- (void)setShouldAvoidInputViews:(BOOL)a3
{
  self->_shouldAvoidInputViews = a3;
}

- (NSTimer)autoNavigationTimer
{
  return self->_autoNavigationTimer;
}

- (void)setAutoNavigationTimer:(id)a3
{
  objc_storeStrong((id *)&self->_autoNavigationTimer, a3);
}

- (NSTimer)autoUnhighlightTimer
{
  return self->_autoUnhighlightTimer;
}

- (void)setAutoUnhighlightTimer:(id)a3
{
  objc_storeStrong((id *)&self->_autoUnhighlightTimer, a3);
}

- (NSIndexPath)unselectableIndexPath
{
  return self->_unselectableIndexPath;
}

- (void)setUnselectableIndexPath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 536);
}

- (BOOL)hasTrackingTouch
{
  return self->_hasTrackingTouch;
}

- (void)setHasTrackingTouch:(BOOL)a3
{
  self->_hasTrackingTouch = a3;
}

- (CGSize)maxContainerSize
{
  double width;
  double height;
  CGSize result;

  width = self->_maxContainerSize.width;
  height = self->_maxContainerSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setMaxContainerSize:(CGSize)a3
{
  self->_maxContainerSize = a3;
}

- (_UIContextMenuHierarchyLayout)layout
{
  return self->_layout;
}

- (void)setLayout:(id)a3
{
  objc_storeStrong((id *)&self->_layout, a3);
}

- (_UIContextMenuNode)hoveredNode
{
  return self->_hoveredNode;
}

- (void)setHoveredNode:(id)a3
{
  objc_storeStrong((id *)&self->_hoveredNode, a3);
}

- (_UIVelocityIntegrator)hoverVelocityIntegrator
{
  return self->_hoverVelocityIntegrator;
}

- (void)setHoverVelocityIntegrator:(id)a3
{
  objc_storeStrong((id *)&self->_hoverVelocityIntegrator, a3);
}

- (NSTimer)hoverAutoExitTimer
{
  return self->_hoverAutoExitTimer;
}

- (void)setHoverAutoExitTimer:(id)a3
{
  objc_storeStrong((id *)&self->_hoverAutoExitTimer, a3);
}

- (double)preferredScrollTruncationDetent
{
  return self->_preferredScrollTruncationDetent;
}

- (void)setPreferredScrollTruncationDetent:(double)a3
{
  self->_preferredScrollTruncationDetent = a3;
}

- (BOOL)wantsFocusDeferralIfSupported
{
  return self->_wantsFocusDeferralIfSupported;
}

- (void)setWantsFocusDeferralIfSupported:(BOOL)a3
{
  self->_wantsFocusDeferralIfSupported = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hoverAutoExitTimer, 0);
  objc_storeStrong((id *)&self->_hoverVelocityIntegrator, 0);
  objc_storeStrong((id *)&self->_hoveredNode, 0);
  objc_storeStrong((id *)&self->_layout, 0);
  objc_storeStrong((id *)&self->_unselectableIndexPath, 0);
  objc_storeStrong((id *)&self->_autoUnhighlightTimer, 0);
  objc_storeStrong((id *)&self->_autoNavigationTimer, 0);
  objc_storeStrong((id *)&self->_submenus, 0);
  objc_storeStrong((id *)&self->_feedbackGenerator, 0);
  objc_storeStrong((id *)&self->_highlightHoverGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_appearanceDate, 0);
  objc_storeStrong((id *)&self->_selectionDelayGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_selectionGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_collectionViewDataSource, 0);
  objc_storeStrong((id *)&self->_departingNode, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
