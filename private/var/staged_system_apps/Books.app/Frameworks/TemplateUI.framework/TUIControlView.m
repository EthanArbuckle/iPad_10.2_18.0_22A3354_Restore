@implementation TUIControlView

- (TUIControlView)initWithFrame:(CGRect)a3
{
  TUIControlView *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TUIControlView;
  result = -[TUIControlView initWithFrame:](&v4, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (result)
    result->_cachedDynamicMenuDataLock._os_unfair_lock_opaque = 0;
  return result;
}

+ (id)renderModelWithStateToButtonAttributes:(id)a3 stateToRenderModel:(id)a4 imageModelIDToResource:(id)a5 actionHandler:(id)a6 viewState:(id)a7 linkEntities:(id)a8 type:(unint64_t)a9 role:(unint64_t)a10 userInterfaceStyle:(unint64_t)a11 enabled:(BOOL)a12 pressScale:(double)a13 touchInsets:(UIEdgeInsets)a14 identifier:(id)a15 style:(id)a16 pointer:(id)a17 focusStyle:(id)a18 menu:(id)a19 contextMenuIsPrimaryAction:(BOOL)a20 name:(id)a21 axAttributes:(id)a22 enableBackgroundForHighlightPreview:(BOOL)a23 enableShadowForHighlightPreview:(BOOL)a24
{
  double right;
  double bottom;
  double left;
  double top;
  id v32;
  id v33;
  id v34;
  TUIRenderModelButton *v35;
  void *v36;
  TUIRenderModelButton *v37;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  id v42;
  id v43;
  id v44;
  id v46;
  id v47;
  id v48;
  id v49;
  id v51;
  id v53;
  void *v55;
  id v56;

  right = a14.right;
  bottom = a14.bottom;
  left = a14.left;
  top = a14.top;
  v49 = a22;
  v47 = a21;
  v43 = a19;
  v56 = a18;
  v32 = a17;
  v48 = a16;
  v44 = a15;
  v42 = a8;
  v33 = a7;
  v46 = a6;
  v51 = a5;
  v34 = a4;
  v53 = a3;
  v35 = [TUIRenderModelButton alloc];
  v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "tuiReuseIdentifier"));
  LOWORD(v41) = __PAIR16__(a24, a23);
  LOBYTE(v40) = a20;
  LOBYTE(v39) = a12;
  v36 = v34;
  v37 = -[TUIRenderModelButton initWithReuseIdentifier:identifier:style:stateToButtonAttributes:stateToRenderModel:imageModelIDToResource:actionHandler:viewState:linkEntities:type:role:userInterfaceStyle:enabled:pressScale:touchInsets:pointer:focusStyle:menu:contextMenuIsPrimaryAction:name:axAttributes:enableBackgroundForHighlightPreview:enableShadowForHighlightPreview:](v35, "initWithReuseIdentifier:identifier:style:stateToButtonAttributes:stateToRenderModel:imageModelIDToResource:actionHandler:viewState:linkEntities:type:role:userInterfaceStyle:enabled:pressScale:touchInsets:pointer:focusStyle:menu:contextMenuIsPrimaryAction:name:axAttributes:enableBackgroundForHighlightPreview:enableShadowForHighlightPreview:", v55, v44, v48, v53, v34, v51, a13, top, left, bottom, right, v46, v33, v42, a9,
          a10,
          a11,
          v39,
          v32,
          v56,
          v43,
          v40,
          v47,
          v49,
          v41);

  return v37;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;
  _QWORD v7[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TUIInteractiveBaseView control](self, "control"));
  objc_msgSend(v3, "removeTarget:action:forControlEvents:", self, "_buttonPressed:", 64);
  objc_msgSend(v3, "removeObserver:forKeyPath:", self, CFSTR("enabled"));
  objc_msgSend(v3, "removeObserver:forKeyPath:", self, CFSTR("highlighted"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TUIInteractiveBaseView renderModel](self, "renderModel"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "imageModelIDToResource"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_171FB8;
  v7[3] = &unk_23D8A0;
  v7[4] = self;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v7);

  v6.receiver = self;
  v6.super_class = (Class)TUIControlView;
  -[TUIControlView dealloc](&v6, "dealloc");
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  objc_super v7;
  _QWORD block[5];

  if (off_2CAE00 == a6)
  {
    if (+[NSThread isMainThread](NSThread, "isMainThread", a3, a4, a5))
    {
      -[TUIInteractiveBaseView updateFromState](self, "updateFromState");
    }
    else
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1720B0;
      block[3] = &unk_23D938;
      block[4] = self;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    }
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)TUIControlView;
    -[TUIControlView observeValueForKeyPath:ofObject:change:context:](&v7, "observeValueForKeyPath:ofObject:change:context:", a3, a4, a5);
  }
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  unsigned int v15;
  void *v16;
  void *v17;
  id v18;
  objc_super v20;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TUIInteractiveBaseView control](self, "control"));
  objc_msgSend(v8, "convertPoint:fromView:", self, x, y);
  v10 = v9;
  v12 = v11;

  if ((-[TUIControlView isHidden](self, "isHidden") & 1) != 0
    || (-[TUIControlView alpha](self, "alpha"), v13 < 0.01)
    || (v14 = (void *)objc_claimAutoreleasedReturnValue(-[TUIInteractiveBaseView control](self, "control")),
        v15 = objc_msgSend(v14, "pointInside:withEvent:", v7, v10, v12),
        v14,
        !v15))
  {
    v20.receiver = self;
    v20.super_class = (Class)TUIControlView;
    v18 = -[TUIControlView hitTest:withEvent:](&v20, "hitTest:withEvent:", v7, x, y);
    v17 = (void *)objc_claimAutoreleasedReturnValue(v18);
  }
  else
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[TUIInteractiveBaseView control](self, "control"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "hitTest:withEvent:", v7, v10, v12));

  }
  return v17;
}

- (void)renderModelUpdated
{
  TUIFocusStylingHelper *focusHelper;
  void *v4;
  void *v5;
  TUIFocusStylingHelper *v6;
  void *v7;
  TUIFocusStylingHelper *v8;
  TUIFocusStylingHelper *v9;
  TUIInteractionsHelper *interactionHelper;
  TUIInteractionsHelper *v11;
  TUIInteractionsHelper *v12;
  void *v13;
  void *v14;
  TUIInteractionsHelper *v15;
  void *v16;
  void *v17;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)TUIControlView;
  -[TUIInteractiveBaseView renderModelUpdated](&v18, "renderModelUpdated");
  focusHelper = self->_focusHelper;
  if (focusHelper)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[TUIInteractiveBaseView renderModel](self, "renderModel"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "focusStyle"));
    -[TUIFocusStylingHelper updateStyle:](focusHelper, "updateStyle:", v5);
  }
  else
  {
    v6 = [TUIFocusStylingHelper alloc];
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[TUIInteractiveBaseView control](self, "control"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[TUIInteractiveBaseView renderModel](self, "renderModel"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "focusStyle"));
    v8 = -[TUIFocusStylingHelper initWithContainer:reference:style:](v6, "initWithContainer:reference:style:", self, v4, v7);
    v9 = self->_focusHelper;
    self->_focusHelper = v8;

  }
  interactionHelper = self->_interactionHelper;
  if (!interactionHelper)
  {
    v11 = -[TUIInteractionsHelper initWithView:]([TUIInteractionsHelper alloc], "initWithView:", self);
    v12 = self->_interactionHelper;
    self->_interactionHelper = v11;

    interactionHelper = self->_interactionHelper;
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[TUIInteractiveBaseView renderModel](self, "renderModel"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "linkEntities"));
  -[TUIInteractionsHelper updateWithLinkEntities:](interactionHelper, "updateWithLinkEntities:", v14);

  v15 = self->_interactionHelper;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[TUIReusableBaseView feedControllerHost](self, "feedControllerHost"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "interactionBuilder"));
  -[TUIInteractionsHelper updateInteractionsWithBuilder:](v15, "updateInteractionsWithBuilder:", v17);

}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TUIControlView;
  -[TUIInteractiveBaseView prepareForReuse](&v3, "prepareForReuse");
  -[TUIControlView _cleanUp](self, "_cleanUp");
}

- (void)viewDidEndDisplay
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TUIControlView;
  -[TUIInteractiveBaseView viewDidEndDisplay](&v3, "viewDidEndDisplay");
  -[TUIControlView _cleanUp](self, "_cleanUp");
}

- (void)_cleanUp
{
  TUIFocusStylingHelper *focusHelper;
  TUIInteractionsHelper *interactionHelper;
  void *v5;
  UIPointerInteraction *pointerInteraction;
  id WeakRetained;
  id v8;
  UIHoverGestureRecognizer *hoverGestureRecognizer;
  UITapGestureRecognizer *selectGestureRecognizer;
  UIGestureRecognizer *secondaryClickGestureRecognizer;

  -[TUIFocusStylingHelper reset](self->_focusHelper, "reset");
  focusHelper = self->_focusHelper;
  self->_focusHelper = 0;

  -[TUIInteractionsHelper detachInteractions](self->_interactionHelper, "detachInteractions");
  interactionHelper = self->_interactionHelper;
  self->_interactionHelper = 0;

  if (self->_pointerInteraction)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[TUIInteractiveBaseView control](self, "control"));
    objc_msgSend(v5, "removeInteraction:", self->_pointerInteraction);

    pointerInteraction = self->_pointerInteraction;
    self->_pointerInteraction = 0;

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_customContextMenuInteraction);

  if (WeakRetained)
  {
    v8 = objc_loadWeakRetained((id *)&self->_customContextMenuInteraction);
    -[TUIControlView removeInteraction:](self, "removeInteraction:", v8);

    objc_storeWeak((id *)&self->_customContextMenuInteraction, 0);
  }
  if (self->_hoverGestureRecognizer)
  {
    -[TUIControlView removeGestureRecognizer:](self, "removeGestureRecognizer:");
    hoverGestureRecognizer = self->_hoverGestureRecognizer;
    self->_hoverGestureRecognizer = 0;

  }
  if (self->_selectGestureRecognizer)
  {
    -[TUIControlView removeGestureRecognizer:](self, "removeGestureRecognizer:");
    selectGestureRecognizer = self->_selectGestureRecognizer;
    self->_selectGestureRecognizer = 0;

  }
  if (self->_secondaryClickGestureRecognizer)
  {
    -[TUIControlView removeGestureRecognizer:](self, "removeGestureRecognizer:");
    secondaryClickGestureRecognizer = self->_secondaryClickGestureRecognizer;
    self->_secondaryClickGestureRecognizer = 0;

  }
}

- (BOOL)canBecomeFocused
{
  return -[TUIFocusStylingHelper canBecomeFocused](self->_focusHelper, "canBecomeFocused");
}

- (id)focusGroupIdentifier
{
  return -[TUIFocusStylingHelper focusGroupIdentifier](self->_focusHelper, "focusGroupIdentifier");
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v6;
  TUIControlView *v7;
  TUIControlView *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  v7 = (TUIControlView *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "nextFocusedItem"));

  if (v7 == self)
  {
    -[TUIFocusStylingHelper activateEffectWithAnimationCoordinator:](self->_focusHelper, "activateEffectWithAnimationCoordinator:", v6);
  }
  else
  {
    v8 = (TUIControlView *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "previouslyFocusedItem"));

    if (v8 == self)
      -[TUIFocusStylingHelper deactivateEffectWithAnimationCoordinator:](self->_focusHelper, "deactivateEffectWithAnimationCoordinator:", v6);
  }

}

- (id)focusEffect
{
  return -[TUIFocusStylingHelper focusEffect](self->_focusHelper, "focusEffect");
}

- (id)keyCommands
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TUIInteractiveBaseView renderModel](self, "renderModel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "actionHandler"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "keyCommands"));

  return v4;
}

- (void)tui_handleSelectKey:(id)a3
{
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[TUIInteractiveBaseView renderModel](self, "renderModel", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "actionHandler"));
  objc_msgSend(v4, "invoke:view:", CFSTR("press"), self);

}

- (void)tui_handleContextMenuKey:(id)a3
{
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[TUIInteractiveBaseView renderModel](self, "renderModel", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "actionHandler"));
  objc_msgSend(v4, "invoke:view:", CFSTR("context-menu"), self);

}

+ (id)tuiReuseIdentifier
{
  return CFSTR("TUIReuseIdentifierControlView");
}

- (id)currentState
{
  void *v3;
  unsigned int v4;
  void *v5;
  unsigned int v6;
  void *v7;
  void *v8;
  void *v9;
  __CFString **v10;
  __CFString **v11;
  __CFString *v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TUIInteractiveBaseView control](self, "control"));
  v4 = objc_msgSend(v3, "isEnabled");

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TUIInteractiveBaseView control](self, "control"));
  v6 = objc_msgSend(v5, "isHighlighted");

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TUIInteractiveBaseView renderModel](self, "renderModel"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "pointer"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "refId"));

  v10 = TUIElementStateHover;
  if (!self->_hoverActive)
  {
    if (objc_msgSend(v9, "length"))
    {
      if (!-[NSMutableSet containsObject:](self->_cursorEnteredIdentifiers, "containsObject:", v9))
        v10 = TUIElementStateDefault;
    }
    else
    {
      v10 = TUIElementStateDefault;
    }
  }
  v11 = TUIElementStateDisabled;
  if (v4)
    v11 = v10;
  if (v6)
    v11 = TUIElementStateHighlighted;
  v12 = *v11;

  return v12;
}

- (void)didUpdateSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TUIControlView;
  -[TUIInteractiveBaseView didUpdateSubviews](&v3, "didUpdateSubviews");
  -[UIPointerInteraction invalidate](self->_pointerInteraction, "invalidate");
}

- (void)loadControlIfNeeded
{
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  UITapGestureRecognizer *v7;
  UITapGestureRecognizer *selectGestureRecognizer;
  _TUISecondaryTapGestureRecognizer *v9;
  UIGestureRecognizer *secondaryClickGestureRecognizer;
  uint64_t v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  UIPointerInteraction *pointerInteraction;
  UIPointerInteraction *v20;
  UIPointerInteraction *v21;
  UIPointerInteraction *v22;
  id v23;
  NSObject *v24;
  TUIControlView *v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  id v33;
  void *v34;
  uint64_t v35;
  id v36;
  TUIControlView *v37;
  id v38;
  NSObject *v39;
  _BOOL4 v40;
  void *v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  id v45;
  void *v46;
  id v47;
  NSObject *v48;
  id v49;
  void *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  void *v54;
  const __CFString *v55;
  void *v56;
  uint64_t v57;
  void *v58;
  const __CFString *v59;
  void *v60;
  id v61;
  TUIControlView *v62;
  void *v63;
  _QWORD v64[3];
  _QWORD v65[3];
  uint8_t buf[4];
  uint64_t v67;
  __int16 v68;
  TUIControlView *v69;
  __int16 v70;
  void *v71;

  v63 = (void *)objc_claimAutoreleasedReturnValue(-[TUIInteractiveBaseView control](self, "control"));
  if (!v63)
  {
    v3 = objc_opt_class(TUIRenderModelButton);
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[TUIInteractiveBaseView renderModel](self, "renderModel"));
    v5 = TUIDynamicCast(v3, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

    v63 = (void *)objc_claimAutoreleasedReturnValue(+[TUIUIKitButton buttonWithType:](TUIUIKitButton, "buttonWithType:", +[TUIControlView uiButtonTypeFromTUIButtonType:](TUIControlView, "uiButtonTypeFromTUIButtonType:", objc_msgSend(v6, "type"))));
    -[TUIControlView bounds](self, "bounds");
    objc_msgSend(v63, "frameForAlignmentRect:");
    objc_msgSend(v63, "setFrame:");
    objc_msgSend(v63, "setEnabled:", 1);
    objc_msgSend(v63, "setAutoresizingMask:", 18);
    objc_msgSend(v63, "addTarget:action:forControlEvents:", self, "_buttonPressed:", 64);
    objc_msgSend(v63, "addObserver:forKeyPath:options:context:", self, CFSTR("enabled"), 0, off_2CAE00);
    objc_msgSend(v63, "addObserver:forKeyPath:options:context:", self, CFSTR("highlighted"), 0, off_2CAE00);
    objc_msgSend(v63, "setTui_delegate:", self);
    -[TUIControlView addSubview:](self, "addSubview:", v63);
    -[TUIInteractiveBaseView setControl:](self, "setControl:", v63);

  }
  if (!self->_selectGestureRecognizer)
  {
    v7 = (UITapGestureRecognizer *)objc_msgSend(objc_alloc((Class)UITapGestureRecognizer), "initWithTarget:action:", self, "_selectGesture:");
    selectGestureRecognizer = self->_selectGestureRecognizer;
    self->_selectGestureRecognizer = v7;

    -[UITapGestureRecognizer setAllowedTouchTypes:](self->_selectGestureRecognizer, "setAllowedTouchTypes:", &__NSArray0__struct);
    -[UITapGestureRecognizer setAllowedPressTypes:](self->_selectGestureRecognizer, "setAllowedPressTypes:", &off_2523E0);
    -[TUIControlView addGestureRecognizer:](self, "addGestureRecognizer:", self->_selectGestureRecognizer);
  }
  if (!self->_secondaryClickGestureRecognizer)
  {
    v9 = -[_TUISecondaryTapGestureRecognizer initWithTarget:action:]([_TUISecondaryTapGestureRecognizer alloc], "initWithTarget:action:", self, "_handleSecondaryTapGesture:");
    secondaryClickGestureRecognizer = self->_secondaryClickGestureRecognizer;
    self->_secondaryClickGestureRecognizer = &v9->super;

    -[TUIControlView addGestureRecognizer:](self, "addGestureRecognizer:", self->_secondaryClickGestureRecognizer);
  }
  if (_TUIDeviceHasInternalInstall())
  {
    v11 = objc_claimAutoreleasedReturnValue(-[TUIInteractiveBaseView renderModel](self, "renderModel"));
    if (v11)
    {
      v12 = (void *)v11;
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[TUIInteractiveBaseView renderModel](self, "renderModel"));
      v14 = objc_opt_respondsToSelector(v13, "pointer");

      if ((v14 & 1) == 0)
      {
        v23 = TUIRenderModelLog();
        v24 = objc_claimAutoreleasedReturnValue(v23);
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
          sub_17EFE0(self);

        v25 = self;
        v26 = 0;
        v62 = v25;
        do
        {
          v27 = objc_opt_class(TUIFeedView);
          v28 = TUIDynamicCast(v27, v25);
          v29 = objc_claimAutoreleasedReturnValue(v28);
          if (v29)
          {
            v30 = (void *)v29;
            v31 = objc_opt_class(TUIFeedViewController);
            v32 = (void *)objc_claimAutoreleasedReturnValue(-[TUIControlView scrollingDelegate](v25, "scrollingDelegate"));
            v33 = TUIDynamicCast(v31, v32);
            v34 = (void *)objc_claimAutoreleasedReturnValue(v33);

            if (v34)
              break;
          }
          v35 = objc_opt_class(TUIReusableBaseView);
          v36 = TUIDynamicCast(v35, v25);
          v37 = (TUIControlView *)objc_claimAutoreleasedReturnValue(v36);
          v38 = TUIRenderModelLog();
          v39 = objc_claimAutoreleasedReturnValue(v38);
          v40 = os_log_type_enabled(v39, OS_LOG_TYPE_ERROR);
          if (v37)
          {
            if (v40)
            {
              v41 = (void *)objc_claimAutoreleasedReturnValue(-[TUIReusableBaseView layoutAttributes](v37, "layoutAttributes"));
              v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "renderModel"));
              *(_DWORD *)buf = 134218498;
              v67 = v26;
              v68 = 2112;
              v69 = v37;
              v70 = 2112;
              v71 = v42;
              _os_log_error_impl(&dword_0, v39, OS_LOG_TYPE_ERROR, "superview[%lu]: %@, renderModel=%@", buf, 0x20u);

            }
          }
          else if (v40)
          {
            *(_DWORD *)buf = 134218242;
            v67 = v26;
            v68 = 2112;
            v69 = v25;
            _os_log_error_impl(&dword_0, v39, OS_LOG_TYPE_ERROR, "superView[%lu]: %@ (not renderModel based)", buf, 0x16u);
          }

          ++v26;
          v43 = objc_claimAutoreleasedReturnValue(-[TUIControlView superview](v25, "superview"));

          v25 = (TUIControlView *)v43;
        }
        while (v43);
        v44 = objc_opt_class(TUIFeedView);
        v45 = TUIDynamicCast(v44, v25);
        v46 = (void *)objc_claimAutoreleasedReturnValue(v45);
        v47 = TUIRenderModelLog();
        v48 = objc_claimAutoreleasedReturnValue(v47);
        if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
          sub_17EF50(v46);

        v49 = objc_alloc((Class)NSException);
        v64[0] = CFSTR("renderModel");
        v50 = (void *)objc_claimAutoreleasedReturnValue(-[TUIInteractiveBaseView renderModel](v62, "renderModel"));
        v65[0] = v50;
        v64[1] = CFSTR("renderModelIdentifier");
        v51 = (void *)objc_claimAutoreleasedReturnValue(-[TUIInteractiveBaseView renderModel](v62, "renderModel"));
        v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "identifier"));
        v53 = objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "tui_identifierToString"));
        v54 = (void *)v53;
        if (v53)
          v55 = (const __CFString *)v53;
        else
          v55 = CFSTR("nil");
        v65[1] = v55;
        v64[2] = CFSTR("renderModelReuseIdentifier");
        v56 = (void *)objc_claimAutoreleasedReturnValue(-[TUIInteractiveBaseView renderModel](v62, "renderModel"));
        v57 = objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "reuseIdentifier"));
        v58 = (void *)v57;
        if (v57)
          v59 = (const __CFString *)v57;
        else
          v59 = CFSTR("nil");
        v65[2] = v59;
        v60 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v65, v64, 3));
        v61 = objc_msgSend(v49, "initWithName:reason:userInfo:", CFSTR("InvalidRenderModel"), CFSTR("A renderModel of the wrong type is used"), v60);

        objc_exception_throw(v61);
      }
    }
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[TUIInteractiveBaseView renderModel](self, "renderModel"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "pointer"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "refId"));
  v18 = objc_msgSend(v17, "length");

  pointerInteraction = self->_pointerInteraction;
  if (pointerInteraction || !v18)
  {
    if (pointerInteraction && !v18)
    {
      objc_msgSend(v63, "removeInteraction:");
      v22 = self->_pointerInteraction;
      self->_pointerInteraction = 0;

    }
  }
  else
  {
    v20 = (UIPointerInteraction *)objc_msgSend(objc_alloc((Class)UIPointerInteraction), "initWithDelegate:", self);
    v21 = self->_pointerInteraction;
    self->_pointerInteraction = v20;

    objc_msgSend(v63, "addInteraction:", self->_pointerInteraction);
  }

}

- (BOOL)presentContextMenuForAccessibility
{
  void *v3;
  id WeakRetained;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TUIInteractiveBaseView control](self, "control"));
  if (objc_msgSend(v3, "showsMenuAsPrimaryAction"))
    WeakRetained = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "contextMenuInteraction"));
  else
    WeakRetained = objc_loadWeakRetained((id *)&self->_customContextMenuInteraction);
  v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(v3, "accessibilityActivationPoint");
    objc_msgSend(v5, "_presentMenuAtLocation:");
  }

  return v5 != 0;
}

- (void)_updateHoverActive
{
  _BOOL4 v3;

  v3 = (char *)-[UIHoverGestureRecognizer state](self->_hoverGestureRecognizer, "state") - 1 < (_BYTE *)&dword_0 + 2;
  if (self->_hoverActive != v3)
  {
    self->_hoverActive = v3;
    -[TUIInteractiveBaseView updateFromState](self, "updateFromState");
  }
}

- (void)_hoverGesture:(id)a3
{
  -[TUIControlView _updateHoverActive](self, "_updateHoverActive", a3);
}

- (void)configureWithModel:(id)a3 outsets:(UIEdgeInsets)a4
{
  double right;
  double bottom;
  double left;
  double top;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  UIPointerInteraction *pointerInteraction;
  void *v22;
  void *v23;
  UIHoverGestureRecognizer *hoverGestureRecognizer;
  UIHoverGestureRecognizer *v25;
  UIHoverGestureRecognizer *v26;
  UIHoverGestureRecognizer *v27;
  int64_t v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  id v53;
  uint64_t v54;
  void *i;
  uint64_t v56;
  unint64_t v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  void *v76;
  void *v77;
  void *v78;
  unsigned int v79;
  unsigned int v80;
  unsigned int v81;
  unsigned int v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  uint64_t v88;
  void *v89;
  unsigned int v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  int v96;
  id WeakRetained;
  id v98;
  id v99;
  id v100;
  id v101;
  void *v102;
  _QWORD v103[5];
  _QWORD v104[5];
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  objc_super v109;
  _QWORD v110[3];
  _BYTE v111[128];

  right = a4.right;
  bottom = a4.bottom;
  left = a4.left;
  top = a4.top;
  v9 = a3;
  v10 = objc_opt_class(TUIRenderModelButton);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[TUIInteractiveBaseView renderModel](self, "renderModel"));
  v12 = TUIDynamicCast(v10, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);

  v14 = objc_opt_class(TUIRenderModelButton);
  v15 = TUIDynamicCast(v14, v9);
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[TUIInteractiveBaseView control](self, "control"));
  v18 = objc_msgSend(v17, "buttonType");

  if (v18 != (id)+[TUIControlView uiButtonTypeFromTUIButtonType:](TUIControlView, "uiButtonTypeFromTUIButtonType:", objc_msgSend(v16, "type")))
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[TUIInteractiveBaseView control](self, "control"));
    objc_msgSend(v19, "removeFromSuperview");

    if (self->_pointerInteraction)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[TUIInteractiveBaseView control](self, "control"));
      objc_msgSend(v20, "removeInteraction:", self->_pointerInteraction);

      pointerInteraction = self->_pointerInteraction;
      self->_pointerInteraction = 0;

    }
    -[TUIInteractiveBaseView setControl:](self, "setControl:", 0);
  }
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "stateToModel"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("hover")));

  hoverGestureRecognizer = self->_hoverGestureRecognizer;
  if (v23)
  {
    if (!hoverGestureRecognizer)
    {
      v25 = (UIHoverGestureRecognizer *)objc_msgSend(objc_alloc((Class)UIHoverGestureRecognizer), "initWithTarget:action:", self, "_hoverGesture:");
      v26 = self->_hoverGestureRecognizer;
      self->_hoverGestureRecognizer = v25;

      -[TUIControlView addGestureRecognizer:](self, "addGestureRecognizer:", self->_hoverGestureRecognizer);
LABEL_10:
      self->_hoverActive = 0;
    }
  }
  else if (hoverGestureRecognizer)
  {
    -[TUIControlView removeGestureRecognizer:](self, "removeGestureRecognizer:");
    v27 = self->_hoverGestureRecognizer;
    self->_hoverGestureRecognizer = 0;

    goto LABEL_10;
  }
  v109.receiver = self;
  v109.super_class = (Class)TUIControlView;
  -[TUIInteractiveBaseView configureWithModel:outsets:](&v109, "configureWithModel:outsets:", v9, top, left, bottom, right);
  if (v13 != v16 && (objc_msgSend(v13, "isEqualToRenderModel:", v16) & 1) == 0)
  {
    v101 = v9;
    v102 = v13;
    v28 = +[TUIControlView uiButtonRoleFromTUIButtonRole:](TUIControlView, "uiButtonRoleFromTUIButtonRole:", objc_msgSend(v16, "role"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[TUIInteractiveBaseView control](self, "control"));
    objc_msgSend(v29, "setRole:", v28);

    -[TUIControlView setOverrideUserInterfaceStyle:](self, "setOverrideUserInterfaceStyle:", +[TUIControlView uiUserInterfaceStyleFromTUIUserInterfaceStyle:](TUIControlView, "uiUserInterfaceStyleFromTUIUserInterfaceStyle:", objc_msgSend(v16, "userInterfaceStyle")));
    objc_msgSend(v16, "touchInsets");
    v31 = v30;
    v33 = v32;
    v35 = v34;
    v37 = v36;
    v38 = (void *)objc_claimAutoreleasedReturnValue(-[TUIInteractiveBaseView control](self, "control"));
    objc_msgSend(v38, "setTouchInsets:", v31, v33, v35, v37);

    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "axAttributes"));
    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "axLabel"));
    v41 = (void *)objc_claimAutoreleasedReturnValue(-[TUIInteractiveBaseView control](self, "control"));
    objc_msgSend(v41, "setAccessibilityLabel:", v40);

    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "axAttributes"));
    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "axValue"));
    v44 = (void *)objc_claimAutoreleasedReturnValue(-[TUIInteractiveBaseView control](self, "control"));
    objc_msgSend(v44, "setAccessibilityValue:", v43);

    v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "axAttributes"));
    v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "axHint"));
    v47 = (void *)objc_claimAutoreleasedReturnValue(-[TUIInteractiveBaseView control](self, "control"));
    objc_msgSend(v47, "setAccessibilityHint:", v46);

    v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "axAttributes"));
    v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "axIdentifier"));
    v50 = (void *)objc_claimAutoreleasedReturnValue(-[TUIInteractiveBaseView control](self, "control"));
    objc_msgSend(v50, "setAccessibilityIdentifier:", v49);

    v107 = 0u;
    v108 = 0u;
    v105 = 0u;
    v106 = 0u;
    v110[0] = CFSTR("default");
    v110[1] = CFSTR("highlighted");
    v110[2] = CFSTR("disabled");
    v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v110, 3));
    v52 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v105, v111, 16);
    if (v52)
    {
      v53 = v52;
      v54 = *(_QWORD *)v106;
      do
      {
        for (i = 0; i != v53; i = (char *)i + 1)
        {
          if (*(_QWORD *)v106 != v54)
            objc_enumerationMutation(v51);
          v56 = *(_QWORD *)(*((_QWORD *)&v105 + 1) + 8 * (_QWORD)i);
          v57 = +[TUIControlView uiControlStateFromTUIElementState:](TUIControlView, "uiControlStateFromTUIElementState:", v56);
          v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "stateToButtonAttributes"));
          v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "objectForKeyedSubscript:", v56));

          v60 = (void *)objc_claimAutoreleasedReturnValue(-[TUIInteractiveBaseView control](self, "control"));
          v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "image"));
          objc_msgSend(v60, "setImage:forState:", v61, v57);

          v62 = (void *)objc_claimAutoreleasedReturnValue(-[TUIInteractiveBaseView control](self, "control"));
          v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "title"));
          objc_msgSend(v62, "setAttributedTitle:forState:", v63, v57);

        }
        v53 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v105, v111, 16);
      }
      while (v53);
    }

    v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "imageModelIDToResource"));
    objc_msgSend(v64, "enumerateKeysAndObjectsUsingBlock:", &stru_243370);

    v13 = v102;
    v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v102, "imageModelIDToResource"));
    v104[0] = _NSConcreteStackBlock;
    v104[1] = 3221225472;
    v104[2] = sub_1738A8;
    v104[3] = &unk_23D8A0;
    v104[4] = self;
    objc_msgSend(v65, "enumerateKeysAndObjectsUsingBlock:", v104);

    v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "imageModelIDToResource"));
    v103[0] = _NSConcreteStackBlock;
    v103[1] = 3221225472;
    v103[2] = sub_1738E8;
    v103[3] = &unk_23D8A0;
    v103[4] = self;
    objc_msgSend(v66, "enumerateKeysAndObjectsUsingBlock:", v103);

    v67 = (void *)objc_claimAutoreleasedReturnValue(-[TUIInteractiveBaseView control](self, "control"));
    -[TUIControlView bounds](self, "bounds");
    objc_msgSend(v67, "frameForAlignmentRect:");
    v69 = v68;
    v71 = v70;
    v73 = v72;
    v75 = v74;
    v76 = (void *)objc_claimAutoreleasedReturnValue(-[TUIInteractiveBaseView control](self, "control"));
    objc_msgSend(v76, "setFrame:", v69, v71, v73, v75);

    v77 = (void *)objc_claimAutoreleasedReturnValue(-[TUIInteractiveBaseView renderModel](self, "renderModel"));
    v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v77, "actionHandler"));
    v79 = objc_msgSend(v78, "hasActionForTrigger:", CFSTR("context-menu"));

    v80 = objc_msgSend(v16, "enabled");
    v81 = v80;
    if (v79 && v80)
    {
      v82 = objc_msgSend(v16, "contextMenuIsPrimaryAction");
      v83 = (void *)objc_claimAutoreleasedReturnValue(-[TUIInteractiveBaseView control](self, "control"));
      objc_msgSend(v83, "setTui_menu:", 0);

      v84 = (void *)objc_claimAutoreleasedReturnValue(-[TUIInteractiveBaseView control](self, "control"));
      v85 = v84;
      if (v82)
      {
        objc_msgSend(v84, "setContextMenuInteractionEnabled:", 1);

        v86 = (void *)objc_claimAutoreleasedReturnValue(-[TUIInteractiveBaseView control](self, "control"));
        v87 = v86;
        v88 = 1;
      }
      else
      {
        objc_msgSend(v84, "setContextMenuInteractionEnabled:", 0);

        v86 = (void *)objc_claimAutoreleasedReturnValue(-[TUIInteractiveBaseView control](self, "control"));
        v87 = v86;
        v88 = 0;
      }
      objc_msgSend(v86, "setShowsMenuAsPrimaryAction:", v88);
      v9 = v101;

      v96 = v82 ^ 1;
    }
    else
    {
      v89 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "menu"));
      if (v89)
        v90 = v81;
      else
        v90 = 0;

      if (v90 == 1)
      {
        v91 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "menu"));
        v92 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "imageModelIDToResource"));
        objc_msgSend(v91, "loadImagesFromResourceMap:", v92);

        v93 = (void *)objc_claimAutoreleasedReturnValue(-[TUIInteractiveBaseView control](self, "control"));
        objc_msgSend(v93, "setTui_menu:", v91);

      }
      else
      {
        v94 = (void *)objc_claimAutoreleasedReturnValue(-[TUIInteractiveBaseView control](self, "control"));
        objc_msgSend(v94, "setContextMenuInteractionEnabled:", 0);

        v95 = (void *)objc_claimAutoreleasedReturnValue(-[TUIInteractiveBaseView control](self, "control"));
        objc_msgSend(v95, "setShowsMenuAsPrimaryAction:", 0);

        v91 = (void *)objc_claimAutoreleasedReturnValue(-[TUIInteractiveBaseView control](self, "control"));
        objc_msgSend(v91, "setTui_menu:", 0);
      }

      v96 = 0;
      v9 = v101;
    }
    WeakRetained = objc_loadWeakRetained((id *)&self->_customContextMenuInteraction);

    if (!WeakRetained && v96)
    {
      v98 = objc_msgSend(objc_alloc((Class)UIContextMenuInteraction), "initWithDelegate:", self);
      -[TUIControlView addInteraction:](self, "addInteraction:", v98);
      objc_storeWeak((id *)&self->_customContextMenuInteraction, v98);

    }
    v99 = objc_loadWeakRetained((id *)&self->_customContextMenuInteraction);
    if (!v99)
      LOBYTE(v96) = 1;

    if ((v96 & 1) == 0)
    {
      v100 = objc_loadWeakRetained((id *)&self->_customContextMenuInteraction);
      -[TUIControlView removeInteraction:](self, "removeInteraction:", v100);

      objc_storeWeak((id *)&self->_customContextMenuInteraction, 0);
    }
  }

}

- (void)imageResourceDidChangeImage:(id)a3
{
  id v3;
  _QWORD v4[5];
  id v5;

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_173974;
  v4[3] = &unk_23D7D0;
  v4[4] = self;
  v5 = a3;
  v3 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v4);

}

- (id)_pointerTargetViewWithRefId:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[TUIInteractiveBaseView descendentViewWithRefId:](self, "descendentViewWithRefId:", v4));
  else
    v5 = 0;

  return v5;
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  double v16;
  double top;
  double v18;
  double left;
  double v20;
  double bottom;
  double v22;
  double right;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  CGFloat v29;
  double v30;
  CGFloat v31;
  double v32;
  CGFloat v33;
  double v34;
  CGFloat v35;
  CGFloat v36;
  CGFloat v37;
  void *v38;
  unsigned int v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  void *v48;
  void *v49;
  void *v50;
  CGPoint v52;
  CGRect v53;

  v7 = a4;
  if (self->_pointerInteraction == a3)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[TUIInteractiveBaseView renderModel](self, "renderModel"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "pointer"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "refId"));

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[TUIControlView _pointerTargetViewWithRefId:](self, "_pointerTargetViewWithRefId:", v11));
    if (v12)
    {
      v13 = TUIProtocolCast(&OBJC_PROTOCOL___TUITouchInsetting, v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
      v15 = v14;
      if (v14)
      {
        objc_msgSend(v14, "computedTouchInsets");
        top = v16;
        left = v18;
        bottom = v20;
        right = v22;
      }
      else
      {
        top = UIEdgeInsetsZero.top;
        left = UIEdgeInsetsZero.left;
        bottom = UIEdgeInsetsZero.bottom;
        right = UIEdgeInsetsZero.right;
      }
      objc_msgSend(v12, "bounds");
      -[TUIControlView convertRect:fromView:](self, "convertRect:fromView:", v12, left + v24, top + v25, v26 - (right + left), v27 - (bottom + top));
      v29 = v28;
      v31 = v30;
      v33 = v32;
      v35 = v34;
      objc_msgSend(v7, "location");
      v52.x = v36;
      v52.y = v37;
      v53.origin.x = v29;
      v53.origin.y = v31;
      v53.size.width = v33;
      v53.size.height = v35;
      if (CGRectContainsPoint(v53, v52)
        && (v38 = (void *)objc_claimAutoreleasedReturnValue(-[TUIInteractiveBaseView control](self, "control")),
            v39 = objc_msgSend(v38, "isEnabled"),
            v38,
            v39))
      {
        objc_msgSend(v12, "bounds");
        -[TUIControlView convertRect:fromView:](self, "convertRect:fromView:", v12);
        v41 = v40;
        v43 = v42;
        v45 = v44;
        v47 = v46;
        v48 = (void *)objc_claimAutoreleasedReturnValue(-[TUIInteractiveBaseView renderModel](self, "renderModel"));
        v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "pointer"));
        v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "refId"));
        v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIPointerRegion regionWithRect:identifier:](UIPointerRegion, "regionWithRect:identifier:", v50, v41, v43, v45, v47));

      }
      else
      {
        v8 = 0;
      }

    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  void *v5;
  TUIControlView *v6;
  TUIControlView *v7;
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
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  uint64_t v26;
  char isKindOfClass;
  void *v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double MidX;
  double v41;
  double v42;
  id v43;
  id v44;
  id v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  double v59;
  void *v60;
  void *v61;
  CGRect v62;
  CGRect v63;
  CGRect v64;

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "identifier", a3));
  v6 = (TUIControlView *)objc_claimAutoreleasedReturnValue(-[TUIControlView _pointerTargetViewWithRefId:](self, "_pointerTargetViewWithRefId:", v5));
  v7 = v6;
  if (v6)
  {
    -[TUIControlView bounds](v6, "bounds");
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v15 = v14;
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[TUIReusableBaseView feedControllerHost](self, "feedControllerHost"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "hostingContainerView"));

    v61 = v5;
    if ((-[TUIControlView isDescendantOfView:](v7, "isDescendantOfView:", v17) & 1) == 0)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[TUIReusableBaseView feedControllerHost](self, "feedControllerHost"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "hostingNavigationBar"));

      if ((-[TUIControlView isDescendantOfView:](v7, "isDescendantOfView:", v19) & 1) != 0)
      {
        v17 = v19;
      }
      else
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[TUIControlView superview](v7, "superview"));

      }
    }
    v21 = v15;
    v22 = v13;
    v23 = v11;
    v24 = v9;
    if (v7 == self)
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[TUIControlView superview](self, "superview"));
      v26 = objc_opt_class(TUINavigationItemView);
      isKindOfClass = objc_opt_isKindOfClass(v25, v26);

      v21 = v15;
      v22 = v13;
      v23 = v11;
      v24 = v9;
      if ((isKindOfClass & 1) != 0)
      {
        v28 = (void *)objc_claimAutoreleasedReturnValue(-[TUIControlView superview](self, "superview"));
        v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "superview"));
        v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "superview"));

        -[TUIControlView convertRect:toView:](self, "convertRect:toView:", v30, v9, v11, v13, v15);
        v32 = v31;
        v34 = v33;
        objc_msgSend(v30, "bounds");
        objc_msgSend(v30, "convertRect:toView:", self, v32, 0.0, v34, CGRectGetHeight(v62));
        v24 = v35;
        v23 = v36;
        v22 = v37;
        v21 = v38;

      }
    }
    v59 = v22;
    v39 = v21;
    v63.origin.x = v9;
    v63.origin.y = v11;
    v63.size.width = v13;
    v63.size.height = v15;
    MidX = CGRectGetMidX(v63);
    v64.origin.x = v9;
    v64.origin.y = v11;
    v64.size.width = v13;
    v64.size.height = v15;
    objc_msgSend(v17, "convertPoint:fromView:", v7, MidX, CGRectGetMidY(v64));
    v60 = v17;
    v43 = objc_msgSend(objc_alloc((Class)UIPreviewTarget), "initWithContainer:center:", v17, v41, v42);
    v44 = objc_alloc_init((Class)UIPreviewParameters);
    v45 = objc_msgSend(objc_alloc((Class)UITargetedPreview), "initWithView:parameters:target:", v7, v44, v43);
    v46 = (void *)objc_claimAutoreleasedReturnValue(-[TUIInteractiveBaseView renderModel](self, "renderModel"));
    v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "pointer"));
    v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "style"));
    v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "pointerEffectWithPreview:", v45));
    v50 = v49;
    if (v49)
      v51 = v49;
    else
      v51 = (id)objc_claimAutoreleasedReturnValue(+[UIPointerEffect effectWithPreview:](UIPointerEffect, "effectWithPreview:", v45));
    v52 = v51;

    v53 = (void *)objc_claimAutoreleasedReturnValue(-[TUIInteractiveBaseView renderModel](self, "renderModel"));
    v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "pointer"));
    v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "style"));
    v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "cursor"));
    v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "pointerShapeWithBounds:preview:", v45, v24, v23, v59, v39));

    v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIPointerStyle styleWithEffect:shape:](UIPointerStyle, "styleWithEffect:shape:", v52, v57));
    v5 = v61;
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (void)pointerInteraction:(id)a3 willEnterRegion:(id)a4 animator:(id)a5
{
  id v7;
  void *v8;
  NSMutableSet *cursorEnteredIdentifiers;
  NSMutableSet *v10;
  NSMutableSet *v11;
  _QWORD v12[5];

  v7 = a5;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "identifier"));
  cursorEnteredIdentifiers = self->_cursorEnteredIdentifiers;
  if (cursorEnteredIdentifiers)
  {
    if ((-[NSMutableSet containsObject:](cursorEnteredIdentifiers, "containsObject:", v8) & 1) != 0)
      goto LABEL_6;
  }
  else
  {
    v10 = objc_opt_new(NSMutableSet);
    v11 = self->_cursorEnteredIdentifiers;
    self->_cursorEnteredIdentifiers = v10;

  }
  -[NSMutableSet addObject:](self->_cursorEnteredIdentifiers, "addObject:", v8);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_174214;
  v12[3] = &unk_23D938;
  v12[4] = self;
  objc_msgSend(v7, "addAnimations:", v12);
LABEL_6:

}

- (void)pointerInteraction:(id)a3 willExitRegion:(id)a4 animator:(id)a5
{
  id v7;
  void *v8;
  NSMutableSet *cursorEnteredIdentifiers;
  char *v10;
  NSMutableSet *v11;
  _QWORD v12[5];

  v7 = a5;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "identifier"));
  cursorEnteredIdentifiers = self->_cursorEnteredIdentifiers;
  if (cursorEnteredIdentifiers
    && -[NSMutableSet containsObject:](cursorEnteredIdentifiers, "containsObject:", v8))
  {
    v10 = (char *)-[NSMutableSet count](self->_cursorEnteredIdentifiers, "count");
    v11 = self->_cursorEnteredIdentifiers;
    if (v10 == (_BYTE *)&dword_0 + 1)
    {
      self->_cursorEnteredIdentifiers = 0;

    }
    else
    {
      -[NSMutableSet removeObject:](v11, "removeObject:", v8);
    }
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_174310;
    v12[3] = &unk_23D938;
    v12[4] = self;
    objc_msgSend(v7, "addAnimations:", v12);
  }

}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  return -[TUIControlView _contextMenuConfigurationForPoint:](self, "_contextMenuConfigurationForPoint:", a3, a4.x, a4.y);
}

- (void)contextMenuInteraction:(id)a3 willDisplayMenuForConfiguration:(id)a4 animator:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v17[5];
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[TUIInteractiveBaseView control](self, "control"));
  if (objc_msgSend(v11, "isStaticMenu"))
  {

  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[TUIInteractiveBaseView control](self, "control"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "tui_menu"));

    if (!v13)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[TUIReusableBaseView feedControllerHost](self, "feedControllerHost"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "contextMenuConfigurationProvider"));
      objc_msgSend(v15, "contextMenuInteraction:willDisplayMenuForConfiguration:", v8, v9);
      goto LABEL_6;
    }
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[TUIInteractiveBaseView renderModel](self, "renderModel"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "actionHandler"));
  objc_msgSend(v15, "invoke:view:", CFSTR("menuPresent"), self);
LABEL_6:

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1744A0;
  v17[3] = &unk_23D7D0;
  v17[4] = self;
  v18 = v8;
  v16 = v8;
  objc_msgSend(v10, "addCompletion:", v17);

}

- (id)contextMenuInteraction:(id)a3 configuration:(id)a4 highlightPreviewForItemWithIdentifier:(id)a5
{
  id v6;
  void *v7;
  unsigned __int8 v8;
  void *v9;
  void *v10;
  unsigned __int8 v11;
  void *v12;
  id v13;
  void *v14;
  id v15;

  v6 = objc_alloc_init((Class)UIPreviewParameters);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TUIInteractiveBaseView renderModel](self, "renderModel"));
  v8 = objc_msgSend(v7, "enableBackgroundForHighlightPreview");

  if ((v8 & 1) == 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    objc_msgSend(v6, "setBackgroundColor:", v9);

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[TUIInteractiveBaseView renderModel](self, "renderModel"));
  v11 = objc_msgSend(v10, "enableShadowForHighlightPreview");

  if ((v11 & 1) == 0)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIBezierPath bezierPath](UIBezierPath, "bezierPath"));
    objc_msgSend(v6, "setShadowPath:", v12);

  }
  v13 = objc_alloc((Class)UITargetedPreview);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[TUIInteractiveBaseView control](self, "control"));
  v15 = objc_msgSend(v13, "initWithView:parameters:", v14, v6);

  return v15;
}

- (id)contextMenuInteraction:(id)a3 configuration:(id)a4 dismissalPreviewForItemWithIdentifier:(id)a5
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;

  v6 = objc_alloc_init((Class)UIPreviewParameters);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  objc_msgSend(v6, "setBackgroundColor:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIBezierPath bezierPath](UIBezierPath, "bezierPath"));
  objc_msgSend(v6, "setShadowPath:", v8);

  v9 = objc_alloc((Class)UITargetedPreview);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[TUIInteractiveBaseView control](self, "control"));
  v11 = objc_msgSend(v9, "initWithView:parameters:", v10, v6);

  return v11;
}

- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSDictionary *cachedDynamicMenuData;
  NSDictionary *v14;
  id v15;

  v15 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TUIInteractiveBaseView control](self, "control"));
  if (objc_msgSend(v8, "isStaticMenu"))
  {

  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[TUIInteractiveBaseView control](self, "control"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "tui_menu"));

    if (!v10)
    {
      os_unfair_lock_lock(&self->_cachedDynamicMenuDataLock);
      cachedDynamicMenuData = self->_cachedDynamicMenuData;
      self->_cachedDynamicMenuData = 0;
      v14 = cachedDynamicMenuData;

      os_unfair_lock_unlock(&self->_cachedDynamicMenuDataLock);
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[TUIReusableBaseView feedControllerHost](self, "feedControllerHost"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "contextMenuConfigurationProvider"));
      objc_msgSend(v12, "contextMenuInteraction:willEndForConfiguration:withData:", v15, v7, v14);

      goto LABEL_6;
    }
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[TUIInteractiveBaseView renderModel](self, "renderModel"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "actionHandler"));
  objc_msgSend(v12, "invoke:view:", CFSTR("menuDismiss"), self);
LABEL_6:

}

- (void)button:(id)a3 contextMenuInteraction:(id)a4 willDisplayMenuForConfiguration:(id)a5 animator:(id)a6
{
  -[TUIControlView contextMenuInteraction:willDisplayMenuForConfiguration:animator:](self, "contextMenuInteraction:willDisplayMenuForConfiguration:animator:", a4, a5, a6);
}

- (void)button:(id)a3 contextMenuInteraction:(id)a4 willEndForConfiguration:(id)a5 animator:(id)a6
{
  -[TUIControlView contextMenuInteraction:willEndForConfiguration:animator:](self, "contextMenuInteraction:willEndForConfiguration:animator:", a4, a5, a6);
}

- (id)contextMenuConfigurationForButton:(id)a3 point:(CGPoint)a4
{
  return -[TUIControlView _contextMenuConfigurationForPoint:](self, "_contextMenuConfigurationForPoint:", a3, a4.x, a4.y);
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TUIInteractiveBaseView control](self, "control"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "accessibilityLabel"));

  return v3;
}

- (void)_buttonPressed:(id)a3
{
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[TUIInteractiveBaseView renderModel](self, "renderModel", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "actionHandler"));
  objc_msgSend(v4, "invoke:view:", CFSTR("press"), self);

}

- (void)_showContextMenu:(id)a3
{
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[TUIInteractiveBaseView renderModel](self, "renderModel", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "actionHandler"));
  objc_msgSend(v4, "invoke:view:", CFSTR("context-menu"), self);

}

- (void)_selectGesture:(id)a3
{
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[TUIInteractiveBaseView renderModel](self, "renderModel", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "actionHandler"));
  objc_msgSend(v4, "invoke:view:", CFSTR("press"), self);

}

- (void)_handleSecondaryTapGesture:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  id v10;

  v4 = a3;
  v10 = (id)objc_claimAutoreleasedReturnValue(-[TUIInteractiveBaseView renderModel](self, "renderModel"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "actionHandler"));
  objc_msgSend(v4, "locationInView:", self);
  v7 = v6;
  v9 = v8;

  objc_msgSend(v5, "invoke:view:point:", CFSTR("context-menu"), self, v7, v9);
}

+ (int64_t)uiButtonTypeFromTUIButtonType:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  if (qword_2CBAB0 != -1)
    dispatch_once(&qword_2CBAB0, &stru_2433B8);
  v4 = (void *)qword_2CBAA8;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v5));

  if (v6)
    v7 = objc_msgSend(v6, "integerValue");
  else
    v7 = 0;

  return (int64_t)v7;
}

+ (int64_t)uiButtonRoleFromTUIButtonRole:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  if (qword_2CBAC0 != -1)
    dispatch_once(&qword_2CBAC0, &stru_2433D8);
  v4 = (void *)qword_2CBAB8;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v5));

  if (v6)
    v7 = objc_msgSend(v6, "integerValue");
  else
    v7 = 0;

  return (int64_t)v7;
}

+ (unint64_t)uiControlStateFromTUIElementState:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a3;
  if (qword_2CBAD0 != -1)
    dispatch_once(&qword_2CBAD0, &stru_2433F8);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_2CBAC8, "objectForKeyedSubscript:", v3));
  v5 = v4;
  if (v4)
    v6 = objc_msgSend(v4, "unsignedIntegerValue");
  else
    v6 = 0;

  return (unint64_t)v6;
}

+ (int64_t)uiUserInterfaceStyleFromTUIUserInterfaceStyle:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  if (qword_2CBAE0 != -1)
    dispatch_once(&qword_2CBAE0, &stru_243418);
  v4 = (void *)qword_2CBAD8;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v5));

  if (v6)
    v7 = objc_msgSend(v6, "integerValue");
  else
    v7 = 0;

  return (int64_t)v7;
}

- (id)_contextMenuConfigurationForPoint:(CGPoint)a3
{
  CGFloat y;
  CGFloat x;
  void *v6;
  void *v7;
  unsigned int v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  _QWORD v14[4];
  id v15;
  _QWORD v16[5];
  id v17[3];
  id location;

  y = a3.y;
  x = a3.x;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TUIInteractiveBaseView renderModel](self, "renderModel"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "actionHandler"));
  v8 = objc_msgSend(v7, "hasActionForTrigger:", CFSTR("context-menu"));

  if (v8
    && (v9 = (void *)objc_claimAutoreleasedReturnValue(-[TUIReusableBaseView feedControllerHost](self, "feedControllerHost")),
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "contextMenuConfigurationProvider")),
        v10,
        v9,
        v10))
  {
    objc_initWeak(&location, self);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_17536C;
    v16[3] = &unk_243490;
    objc_copyWeak(v17, &location);
    v16[4] = self;
    v17[1] = *(id *)&x;
    v17[2] = *(id *)&y;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_175700;
    v14[3] = &unk_2432B0;
    v11 = (id)objc_claimAutoreleasedReturnValue(+[UIDeferredMenuElement elementWithUncachedProvider:](UIDeferredMenuElement, "elementWithUncachedProvider:", v16));
    v15 = v11;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIContextMenuConfiguration configurationWithIdentifier:previewProvider:actionProvider:](UIContextMenuConfiguration, "configurationWithIdentifier:previewProvider:actionProvider:", 0, 0, v14));

    objc_destroyWeak(v17);
    objc_destroyWeak(&location);
  }
  else
  {
    v12 = 0;
  }
  return v12;
}

+ (id)menuWithChildren:(id)a3
{
  return +[UIMenu menuWithTitle:image:identifier:options:children:](UIMenu, "menuWithTitle:image:identifier:options:children:", &stru_243BF0, 0, CFSTR("TUIPlatformButtonDefaultIdentifier"), 1, a3);
}

- (TUIButtonAttributes)currentButtonAttributes
{
  return self->_currentButtonAttributes;
}

- (void)setCurrentButtonAttributes:(id)a3
{
  objc_storeStrong((id *)&self->_currentButtonAttributes, a3);
}

- (UIPointerInteraction)pointerInteraction
{
  return self->_pointerInteraction;
}

- (NSMutableSet)cursorEnteredIdentifiers
{
  return self->_cursorEnteredIdentifiers;
}

- (UIHoverGestureRecognizer)hoverGestureRecognizer
{
  return self->_hoverGestureRecognizer;
}

- (BOOL)hoverActive
{
  return self->_hoverActive;
}

- (TUIFocusStylingHelper)focusHelper
{
  return self->_focusHelper;
}

- (UITapGestureRecognizer)selectGestureRecognizer
{
  return self->_selectGestureRecognizer;
}

- (UIGestureRecognizer)secondaryClickGestureRecognizer
{
  return self->_secondaryClickGestureRecognizer;
}

- (TUIInteractionsHelper)interactionHelper
{
  return self->_interactionHelper;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interactionHelper, 0);
  objc_storeStrong((id *)&self->_secondaryClickGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_selectGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_focusHelper, 0);
  objc_storeStrong((id *)&self->_hoverGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_cursorEnteredIdentifiers, 0);
  objc_storeStrong((id *)&self->_pointerInteraction, 0);
  objc_storeStrong((id *)&self->_currentButtonAttributes, 0);
  objc_storeStrong((id *)&self->_cachedDynamicMenuData, 0);
  objc_destroyWeak((id *)&self->_customContextMenuInteraction);
}

@end
