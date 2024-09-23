@implementation _UIPointerArbiterCore_iOS

- (_UIPointerArbiterCore_iOS)init
{
  _UIPointerArbiterCore_iOS *v2;
  uint64_t v3;
  PSPointerClientController *pointerClientController;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UIPointerArbiterCore_iOS;
  v2 = -[_UIPointerArbiterCore_iOS init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    pointerClientController = v2->_pointerClientController;
    v2->_pointerClientController = (PSPointerClientController *)v3;

    -[PSPointerClientController setDelegate:](v2->_pointerClientController, "setDelegate:", v2);
    v2->_lastMaterialLuminance = 0;
  }
  return v2;
}

- (void)applyStyle:(id)a3 forRegion:(id)a4 effectSourceHandler:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void (**v13)(_QWORD);
  void *v14;
  void *v15;
  id v16;
  unint64_t v17;
  NSObject *v18;
  NSObject *v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  id v24;
  void (**v25)(_QWORD);
  id v26[2];
  _BYTE location[12];
  __int16 v28;
  int64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void (**)(_QWORD))a6;
  if (-[_UIPointerArbiterCore_iOS pointerState](self, "pointerState") == 1)
  {
    -[_UIPointerArbiterCore_iOS _hoverRegionWithStyle:forRegion:](self, "_hoverRegionWithStyle:forRegion:", v10, v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)(-[_UIPointerArbiterCore_iOS transactionRevisionID](self, "transactionRevisionID") + 1);
    -[_UIPointerArbiterCore_iOS setTransactionRevisionID:](self, "setTransactionRevisionID:", v15);
    objc_initWeak((id *)location, self);
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __81___UIPointerArbiterCore_iOS_applyStyle_forRegion_effectSourceHandler_completion___block_invoke;
    v20[3] = &unk_1E16C7E68;
    objc_copyWeak(v26, (id *)location);
    v16 = v14;
    v21 = v16;
    v22 = v11;
    v24 = v12;
    v23 = v10;
    v26[1] = v15;
    v25 = v13;
    -[_UIPointerArbiterCore_iOS _performTransactionUsingBlock:](self, "_performTransactionUsingBlock:", v20);

    objc_destroyWeak(v26);
    objc_destroyWeak((id *)location);

  }
  else
  {
    v17 = applyStyle_forRegion_effectSourceHandler_completion____s_category;
    if (!applyStyle_forRegion_effectSourceHandler_completion____s_category)
    {
      v17 = __UILogCategoryGetNode("UIPointerArbiter", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v17, (unint64_t *)&applyStyle_forRegion_effectSourceHandler_completion____s_category);
    }
    v18 = *(NSObject **)(v17 + 8);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = v18;
      *(_DWORD *)location = 138412546;
      *(_QWORD *)&location[4] = v11;
      v28 = 2048;
      v29 = -[_UIPointerArbiterCore_iOS pointerState](self, "pointerState");
      _os_log_impl(&dword_185066000, v19, OS_LOG_TYPE_DEFAULT, "Ignoring applyStyle:forRegion: %@ because pointer state is not enabled (%ld)", location, 0x16u);

    }
    if (v13)
      v13[2](v13);
  }

}

- (void)exitRegion:(id)a3 removeStyle:(BOOL)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16[2];
  BOOL v17;
  id location;

  v8 = a3;
  v9 = a5;
  v10 = (void *)(-[_UIPointerArbiterCore_iOS transactionRevisionID](self, "transactionRevisionID") + 1);
  -[_UIPointerArbiterCore_iOS setTransactionRevisionID:](self, "setTransactionRevisionID:", v10);
  objc_initWeak(&location, self);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __63___UIPointerArbiterCore_iOS_exitRegion_removeStyle_completion___block_invoke;
  v13[3] = &unk_1E16C7E90;
  objc_copyWeak(v16, &location);
  v17 = a4;
  v11 = v8;
  v14 = v11;
  v16[1] = v10;
  v12 = v9;
  v15 = v12;
  -[_UIPointerArbiterCore_iOS _performTransactionUsingBlock:](self, "_performTransactionUsingBlock:", v13);

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);

}

- (void)_setActiveHoverRegion:(id)a3 style:(id)a4 forPointerRegion:(id)a5 transactionID:(unint64_t)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  void (**v15)(_QWORD);
  void *v16;
  _QWORD v17[4];
  id v18;
  id v19;
  void (**v20)(_QWORD);
  id v21[2];
  id location;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = (void (**)(_QWORD))a7;
  if (v12)
  {
    -[_UIPointerArbiterCore_iOS setActivePointerStyle:](self, "setActivePointerStyle:", v13);
    -[_UIPointerArbiterCore_iOS setActivePointerRegion:](self, "setActivePointerRegion:", v14);
    -[_UIPointerArbiterCore_iOS setLastSentHoverRegion:](self, "setLastSentHoverRegion:", v12);
LABEL_4:
    objc_initWeak(&location, self);
    -[_UIPointerArbiterCore_iOS pointerClientController](self, "pointerClientController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __99___UIPointerArbiterCore_iOS__setActiveHoverRegion_style_forPointerRegion_transactionID_completion___block_invoke;
    v17[3] = &unk_1E16C7EB8;
    v18 = v12;
    objc_copyWeak(v21, &location);
    v21[1] = (id)a6;
    v19 = v14;
    v20 = v15;
    objc_msgSend(v16, "setActiveHoverRegion:transitionCompletion:", v18, v17);

    objc_destroyWeak(v21);
    objc_destroyWeak(&location);
    goto LABEL_5;
  }
  -[_UIPointerArbiterCore_iOS setActivePointerStyle:](self, "setActivePointerStyle:", 0);
  -[_UIPointerArbiterCore_iOS setActivePointerRegion:](self, "setActivePointerRegion:", 0);
  -[_UIPointerArbiterCore_iOS setLastSentHoverRegion:](self, "setLastSentHoverRegion:", 0);
  if (-[_UIPointerArbiterCore_iOS pointerState](self, "pointerState"))
    goto LABEL_4;
  -[_UIPointerArbiterCore_iOS _clearMatchMoveSourceForRegion:immediately:](self, "_clearMatchMoveSourceForRegion:immediately:", v14, 0);
  if (v15)
    v15[2](v15);
LABEL_5:

}

- (void)_clearMatchMoveSourceForRegion:(id)a3 immediately:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  id v7;
  void *v8;
  void *v9;
  dispatch_time_t v10;
  _QWORD v11[5];
  id v12;

  v4 = a4;
  v6 = a3;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __72___UIPointerArbiterCore_iOS__clearMatchMoveSourceForRegion_immediately___block_invoke;
  v11[3] = &unk_1E16B1B50;
  v11[4] = self;
  v12 = v6;
  v7 = v6;
  v8 = _Block_copy(v11);
  v9 = v8;
  if (v4)
  {
    (*((void (**)(void *))v8 + 2))(v8);
  }
  else
  {
    v10 = dispatch_time(0, 2000000000);
    dispatch_after(v10, MEMORY[0x1E0C80D38], v9);
  }

}

- (int64_t)pointerState
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  int64_t v6;
  void *v7;

  -[_UIPointerArbiterCore_iOS pointerClientController](self, "pointerClientController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "clientInteractionState");
  v5 = 1;
  if (v4 == 2)
    v5 = 2;
  if (v4)
    v6 = v5;
  else
    v6 = 0;

  if (v6 == 1)
  {
    -[_UIPointerArbiterCore_iOS scrollingRegion](self, "scrollingRegion");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
      v6 = 3;
    else
      v6 = 1;
  }
  if (self->_updatesPausedViaAssertion)
    return 0;
  else
    return v6;
}

- (void)_notifyPointerStateDidChange
{
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  +[_UIPointerArbiter sharedArbiter](_UIPointerArbiter, "sharedArbiter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:", 0x1E1751EA0, v2);

}

- (void)beginScrollingWithRegion:(id)a3
{
  id v4;
  unint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  id v13;
  unint64_t v14;
  NSObject *v15;
  int v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[_UIPointerArbiterCore_iOS pointerState](self, "pointerState"))
  {
    v5 = qword_1ECD7DD88;
    if (!qword_1ECD7DD88)
    {
      v5 = __UILogCategoryGetNode("UIPointerArbiter", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v5, (unint64_t *)&qword_1ECD7DD88);
    }
    v6 = *(NSObject **)(v5 + 8);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v16 = 138412290;
      v17 = v4;
      _os_log_impl(&dword_185066000, v6, OS_LOG_TYPE_DEFAULT, "beginScrollingWithRegion: %@", (uint8_t *)&v16, 0xCu);
    }
    -[_UIPointerArbiterCore_iOS lastSentHoverRegion](self, "lastSentHoverRegion");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      v13 = 0;
LABEL_20:
      -[_UIPointerArbiterCore_iOS applyStyle:forRegion:effectSourceHandler:completion:](self, "applyStyle:forRegion:effectSourceHandler:completion:", v13, v4, 0, 0);
      -[_UIPointerArbiterCore_iOS setScrollingRegion:](self, "setScrollingRegion:", v4);
      -[_UIPointerArbiterCore_iOS _notifyPointerStateDidChange](self, "_notifyPointerStateDidChange");

      goto LABEL_21;
    }
    -[_UIPointerArbiterCore_iOS activePointerStyle](self, "activePointerStyle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      if (objc_msgSend(v8, "type") == 2)
      {
        objc_msgSend(v9, "pointerShape");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "beamLength");
        v12 = v11;

        if (v12 > 0.0)
        {
          v13 = (id)objc_msgSend(v9, "copy");
          objc_msgSend(v13, "setConstrainedAxes:", 0);
LABEL_19:

          goto LABEL_20;
        }
      }
      if (!objc_msgSend(v9, "type"))
      {
        v13 = v9;
        goto LABEL_19;
      }
    }
    v13 = 0;
    goto LABEL_19;
  }
  v14 = _MergedGlobals_1058;
  if (!_MergedGlobals_1058)
  {
    v14 = __UILogCategoryGetNode("UIPointerArbiter", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v14, (unint64_t *)&_MergedGlobals_1058);
  }
  v15 = *(NSObject **)(v14 + 8);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = 138412290;
    v17 = v4;
    _os_log_impl(&dword_185066000, v15, OS_LOG_TYPE_DEFAULT, "Ignoring beginScrollingWithRegion: %@ because pointer state is disabled", (uint8_t *)&v16, 0xCu);
  }
LABEL_21:

}

- (void)endScrollingWithRegion:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  unint64_t v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  unint64_t v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  dispatch_time_t v17;
  _QWORD v18[4];
  id v19;
  _UIPointerArbiterCore_iOS *v20;
  uint8_t buf[4];
  id v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[_UIPointerArbiterCore_iOS scrollingRegion](self, "scrollingRegion");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5
    && (v6 = (void *)v5,
        -[_UIPointerArbiterCore_iOS scrollingRegion](self, "scrollingRegion"),
        v7 = (id)objc_claimAutoreleasedReturnValue(),
        v7,
        v6,
        v7 == v4))
  {
    v12 = qword_1ECD7DD98;
    if (!qword_1ECD7DD98)
    {
      v12 = __UILogCategoryGetNode("UIPointerArbiter", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v12, (unint64_t *)&qword_1ECD7DD98);
    }
    v13 = *(NSObject **)(v12 + 8);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v22 = v4;
      _os_log_impl(&dword_185066000, v13, OS_LOG_TYPE_DEFAULT, "endScrollingWithRegion: %@", buf, 0xCu);
    }
    -[_UIPointerArbiterCore_iOS setScrollingRegion:](self, "setScrollingRegion:", 0);
    -[_UIPointerArbiterCore_iOS _notifyPointerStateDidChange](self, "_notifyPointerStateDidChange");
    v14 = (void *)UIApp;
    objc_msgSend(v4, "referenceView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "_window");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "_resendHoverEventForWindow:", v16);

    v17 = dispatch_time(0, 50000000);
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __52___UIPointerArbiterCore_iOS_endScrollingWithRegion___block_invoke;
    v18[3] = &unk_1E16B1B50;
    v19 = v4;
    v20 = self;
    dispatch_after(v17, MEMORY[0x1E0C80D38], v18);

  }
  else
  {
    v8 = qword_1ECD7DD90;
    if (!qword_1ECD7DD90)
    {
      v8 = __UILogCategoryGetNode("UIPointerArbiter", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v8, (unint64_t *)&qword_1ECD7DD90);
    }
    v9 = *(NSObject **)(v8 + 8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = v9;
      -[_UIPointerArbiterCore_iOS scrollingRegion](self, "scrollingRegion");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v22 = v4;
      v23 = 2112;
      v24 = v11;
      _os_log_impl(&dword_185066000, v10, OS_LOG_TYPE_DEFAULT, "Ignoring endScrollingWithRegion: %@ because scrollingRegion does not match: %@", buf, 0x16u);

    }
  }

}

- (id)obtainPointerUpdatePauseAssertion
{
  _UIAssertionController *pauseAssertionController;
  _UIAssertionController *v4;
  _UIAssertionController *v5;

  pauseAssertionController = self->_pauseAssertionController;
  if (!pauseAssertionController)
  {
    v4 = -[_UIAssertionController initWithAssertionSubject:]([_UIAssertionController alloc], "initWithAssertionSubject:", self);
    v5 = self->_pauseAssertionController;
    self->_pauseAssertionController = v4;

    pauseAssertionController = self->_pauseAssertionController;
  }
  return -[_UIAssertionController vendAssertionOfType:initialState:](pauseAssertionController, "vendAssertionOfType:initialState:", 0, 1);
}

- (void)pointerClientController:(id)a3 didInvalidatePortalSourceCollections:(id)a4 matchMoveSources:(id)a5
{
  unint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint8_t v12[16];

  v6 = pointerClientController_didInvalidatePortalSourceCollections_matchMoveSources____s_category;
  if (!pointerClientController_didInvalidatePortalSourceCollections_matchMoveSources____s_category)
  {
    v6 = __UILogCategoryGetNode("UIPointerArbiter", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v6, (unint64_t *)&pointerClientController_didInvalidatePortalSourceCollections_matchMoveSources____s_category);
  }
  v7 = *(NSObject **)(v6 + 8);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v12 = 0;
    _os_log_impl(&dword_185066000, v7, OS_LOG_TYPE_DEFAULT, "pointerClientController:didInvalidatePortalSourceCollections:matchMoveSources:", v12, 2u);
  }
  -[_UIPointerArbiterCore_iOS setPointerRegionToMatchMoveSourceMap:](self, "setPointerRegionToMatchMoveSourceMap:", 0);
  -[_UIPointerArbiterCore_iOS setPointerPortalSourceCollection:](self, "setPointerPortalSourceCollection:", 0);
  -[_UIPointerArbiterCore_iOS pointerPortalView](self, "pointerPortalView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeFromSuperview");

  -[_UIPointerArbiterCore_iOS setPointerPortalView:](self, "setPointerPortalView:", 0);
  -[_UIPointerArbiterCore_iOS overlayEffectPortalView](self, "overlayEffectPortalView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeFromSuperview");

  -[_UIPointerArbiterCore_iOS setOverlayEffectPortalView:](self, "setOverlayEffectPortalView:", 0);
  -[_UIPointerArbiterCore_iOS samplingBackdropView](self, "samplingBackdropView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "removeFromSuperview");

  -[_UIPointerArbiterCore_iOS samplingBackdropView](self, "samplingBackdropView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setPaused:", 1);

  -[_UIPointerArbiterCore_iOS setSamplingBackdropView:](self, "setSamplingBackdropView:", 0);
  -[_UIPointerArbiterCore_iOS setLastSentHoverRegion:](self, "setLastSentHoverRegion:", 0);
}

- (void)pointerClientControllerWillDecelerate:(id)a3 targetPointerPosition:(CGPoint *)a4 velocity:(CGPoint)a5 inContextID:(unsigned int)a6 cursorRegionLookupRadius:(double)a7 cursorRegionLookupResolution:(double)a8 lookupConeAngle:(double)a9
{
  uint64_t v12;
  CGFloat y;
  CGFloat x;
  id v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  id v24;
  id v25;
  double v26;
  double v27;
  double v28;
  __double2 v30;
  uint64_t v31;
  double v32;
  unint64_t v33;
  double v34;
  double v35;
  double v36;
  double v37;
  __double2 v38;
  __double2 v39;
  __double2 v41;
  double v42;
  double v43;
  id v44;
  double v45;
  double v46;
  void *v47;
  void *v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  CGFloat v54;
  double v55;
  CGFloat v56;
  double v57;
  double v58;
  double width;
  double height;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  void *v66;
  double v67;
  CGFloat v68;
  double v69;
  CGFloat v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  id v80;
  id v81;
  id v82;
  id v83;
  id v84;
  id v85;
  CGPoint v86;
  CGRect v87;

  v12 = *(_QWORD *)&a6;
  y = a5.y;
  x = a5.x;
  v17 = a3;
  if (a4)
  {
    +[UIWindow _windowWithContextId:](UIWindow, "_windowWithContextId:", v12);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "layer");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "convertPoint:fromLayer:", 0, a4->x, a4->y);
    v21 = v20;
    v23 = v22;

    v84 = 0;
    v85 = 0;
    -[_UIPointerArbiterCore_iOS _getPointerRegion:andStyle:atLocation:inWindow:](self, "_getPointerRegion:andStyle:atLocation:inWindow:", &v85, &v84, v18, v21, v23);
    v24 = v85;
    v25 = v84;
    v72 = v23;
    if (v24)
    {
      v26 = v21;
LABEL_41:
      -[_UIPointerArbiterCore_iOS _hoverRegionWithStyle:forRegion:](self, "_hoverRegionWithStyle:forRegion:", v25, v24);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIPointerArbiterCore_iOS _coordinateSpaceSourceViewForRegion:withStyle:](self, "_coordinateSpaceSourceViewForRegion:withStyle:", v24, v25);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "convertPoint:toView:", v48, v21, v72);
      v50 = v49;
      v52 = v51;
      objc_msgSend(v18, "convertPoint:toView:", v48, v26, v23);
      v54 = v53;
      v56 = v55;
      objc_msgSend(v47, "contentBounds");
      v57 = v87.origin.x;
      v58 = v87.origin.y;
      width = v87.size.width;
      height = v87.size.height;
      v86.x = v54;
      v86.y = v56;
      if (CGRectContainsPoint(v87, v86))
      {
        if (objc_msgSend(v47, "pointerRecenteringAxes") == 3)
        {
          v50 = v57 + width * 0.5;
          v52 = v58 + height * 0.5;
        }
        else if ((objc_msgSend(v47, "pointerRecenteringAxes") & 1) != 0)
        {
          v50 = v57 + width * 0.5;
          if (v58 >= v52)
            v62 = v58;
          else
            v62 = v52;
          if (v58 + height <= v62)
            v52 = v58 + height;
          else
            v52 = v62;
        }
        else if ((objc_msgSend(v47, "pointerRecenteringAxes") & 2) != 0)
        {
          v52 = v58 + height * 0.5;
          if (v57 >= v50)
            v61 = v57;
          else
            v61 = v50;
          if (v57 + width <= v61)
            v50 = v57 + width;
          else
            v50 = v61;
        }
      }
      objc_msgSend(v48, "convertPoint:toView:", v18, v50, v52);
      v21 = v63;
      v65 = v64;

    }
    else
    {
      v27 = hypot(x, y);
      if (fabs(x) >= 2.22044605e-16)
      {
        if (fabs(y) >= 2.22044605e-16)
        {
          v28 = atan(x / y);
          if (y < 0.0)
            v28 = v28 + 3.14159265;
          if (y > 0.0 && x < 0.0)
            v28 = v28 + 6.28318531;
        }
        else
        {
          v28 = dbl_18667CB10[x > 0.0];
        }
      }
      else
      {
        v28 = 3.14159265;
        if (y > 0.0)
          v28 = 0.0;
      }
      v73 = v28;
      v30 = __sincos_stret(a9 * 0.5);
      v31 = 0;
      if (v27 <= a7)
        v32 = v27;
      else
        v32 = a7;
      v77 = (v30.__cosval * a7 + v32) / (v30.__sinval * a7);
      v78 = v32;
      v33 = vcvtpd_s64_f64(a7 / a8);
      v26 = v21;
      v74 = v21;
      v71 = a8;
      while (v31 != v33)
      {
        v75 = v26;
        v76 = v23;
        v24 = 0;
        v34 = (double)(unint64_t)++v31 * a8;
        v35 = round(v34 * 6.28318531 / a8);
        v79 = (v34 * 6.28318531 / v35 / (v34 * 6.28318531) + v34 * 6.28318531 / v35 / (v34 * 6.28318531)) * 3.14159265;
        v36 = 0.0;
        v37 = v73;
        do
        {
          v38 = __sincos_stret(v36);
          v39 = __sincos_stret(v37 - v36);
          if (v77 * (v34 * v38.__sinval) - v78 < v34 * v38.__cosval && v24 == 0)
          {
            v41 = __sincos_stret(v37 + v36);
            v42 = v72 + v34 * v41.__cosval;
            v43 = v74 + v34 * v41.__sinval;
            v82 = v25;
            v83 = 0;
            -[_UIPointerArbiterCore_iOS _getPointerRegion:andStyle:atLocation:inWindow:](self, "_getPointerRegion:andStyle:atLocation:inWindow:", &v83, &v82, v18, v43, v42);
            v24 = v83;
            v44 = v82;

            if (v24)
            {
              v75 = v43;
              v76 = v42;
              v25 = v44;
            }
            else
            {
              v80 = v44;
              v81 = 0;
              -[_UIPointerArbiterCore_iOS _getPointerRegion:andStyle:atLocation:inWindow:](self, "_getPointerRegion:andStyle:atLocation:inWindow:", &v81, &v80, v18, v74 + v34 * v39.__sinval, v72 + v34 * v39.__cosval);
              v24 = v81;
              v25 = v80;

              if (v24)
                v45 = v72 + v34 * v39.__cosval;
              else
                v45 = v76;
              v46 = v75;
              if (v24)
                v46 = v74 + v34 * v39.__sinval;
              v75 = v46;
              v76 = v45;
              if (!v24)
                v24 = 0;
            }
            v37 = v73;
          }
          else if (v24)
          {
            v21 = v74;
            v26 = v75;
            v23 = v76;
            goto LABEL_41;
          }
          v36 = v79 + v36;
        }
        while (v36 < 3.14159265);
        v21 = v74;
        v26 = v75;
        a8 = v71;
        v23 = v76;
        if (v24)
          goto LABEL_41;
      }
      v24 = 0;
      v65 = v72;
    }
    objc_msgSend(v18, "layer");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "convertPoint:toLayer:", 0, v21, v65);
    v68 = v67;
    v70 = v69;

    a4->x = v68;
    a4->y = v70;

  }
}

- (void)pointerClientControllerClientInteractionStateDidChange:(id)a3
{
  id v3;
  unint64_t v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = pointerClientControllerClientInteractionStateDidChange____s_category;
  if (!pointerClientControllerClientInteractionStateDidChange____s_category)
  {
    v4 = __UILogCategoryGetNode("UIPointerArbiter", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v4, (unint64_t *)&pointerClientControllerClientInteractionStateDidChange____s_category);
  }
  v5 = *(NSObject **)(v4 + 8);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    v9 = 134217984;
    v10 = objc_msgSend(v3, "clientInteractionState");
    _os_log_impl(&dword_185066000, v6, OS_LOG_TYPE_DEFAULT, "pointerClientControllerClientInteractionStateDidChange: %ld", (uint8_t *)&v9, 0xCu);

  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIPointerArbiter sharedArbiter](_UIPointerArbiter, "sharedArbiter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "postNotificationName:object:", 0x1E1751EA0, v8);

}

- (void)_performNextTransaction
{
  void *v3;
  void (**v4)(_QWORD, _QWORD);
  void *v5;
  _QWORD v6[4];
  id v7;
  id location;

  if (!-[_UIPointerArbiterCore_iOS hasRunningTransaction](self, "hasRunningTransaction"))
  {
    -[_UIPointerArbiterCore_iOS pendingTransactionBlocks](self, "pendingTransactionBlocks");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "firstObject");
    v4 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      -[_UIPointerArbiterCore_iOS pendingTransactionBlocks](self, "pendingTransactionBlocks");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "removeObjectAtIndex:", 0);

      -[_UIPointerArbiterCore_iOS setHasRunningTransaction:](self, "setHasRunningTransaction:", 1);
      objc_initWeak(&location, self);
      v6[0] = MEMORY[0x1E0C809B0];
      v6[1] = 3221225472;
      v6[2] = __52___UIPointerArbiterCore_iOS__performNextTransaction__block_invoke;
      v6[3] = &unk_1E16B3F40;
      objc_copyWeak(&v7, &location);
      ((void (**)(_QWORD, _QWORD *))v4)[2](v4, v6);
      objc_destroyWeak(&v7);
      objc_destroyWeak(&location);
    }

  }
}

- (void)_performTransactionUsingBlock:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[_UIPointerArbiterCore_iOS pendingTransactionBlocks](self, "pendingTransactionBlocks");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v6 = (void *)objc_opt_new();
    -[_UIPointerArbiterCore_iOS setPendingTransactionBlocks:](self, "setPendingTransactionBlocks:", v6);

  }
  -[_UIPointerArbiterCore_iOS pendingTransactionBlocks](self, "pendingTransactionBlocks");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = _Block_copy(v4);

  objc_msgSend(v7, "addObject:", v8);
  if (!-[_UIPointerArbiterCore_iOS hasRunningTransaction](self, "hasRunningTransaction"))
    -[_UIPointerArbiterCore_iOS _performNextTransaction](self, "_performNextTransaction");
}

- (void)_prepareContentMatchMoveSourceForPointerRegion:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, id, void *);
  void *v8;
  void *v9;
  _UIPointerContentEffectAnimationBuilder *v10;
  id v11;
  _UIPointerContentEffectAnimationBuilder *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  void (**v19)(id, id, void *);
  id v20;
  id v21;
  id location;

  v6 = a3;
  v7 = (void (**)(id, id, void *))a4;
  -[_UIPointerArbiterCore_iOS pointerRegionToMatchMoveSourceMap](self, "pointerRegionToMatchMoveSourceMap");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = [_UIPointerContentEffectAnimationBuilder alloc];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __87___UIPointerArbiterCore_iOS__prepareContentMatchMoveSourceForPointerRegion_completion___block_invoke_4;
    v14[3] = &unk_1E16C7F00;
    v16 = &__block_literal_global_239;
    v11 = v9;
    v15 = v11;
    v12 = -[_UIPointerContentEffectAnimationBuilder initWithCreationHandler:](v10, "initWithCreationHandler:", v14);
    v7[2](v7, v11, v12);

  }
  else
  {
    objc_initWeak(&location, self);
    -[_UIPointerArbiterCore_iOS pointerClientController](self, "pointerClientController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __87___UIPointerArbiterCore_iOS__prepareContentMatchMoveSourceForPointerRegion_completion___block_invoke_2;
    v17[3] = &unk_1E16C7F28;
    objc_copyWeak(&v21, &location);
    v18 = v6;
    v19 = v7;
    v20 = &__block_literal_global_239;
    objc_msgSend(v13, "createContentMatchMoveSourcesWithCount:completion:", 1, v17);

    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }

}

- (void)_preparePointerPortalSourceCollectionWithCompletion:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[5];
  id v19;

  v4 = a3;
  -[_UIPointerArbiterCore_iOS pointerPortalSourceCollection](self, "pointerPortalSourceCollection");
  v5 = objc_claimAutoreleasedReturnValue();
  if (!v5)
    goto LABEL_8;
  v6 = (void *)v5;
  -[_UIPointerArbiterCore_iOS pointerPortalView](self, "pointerPortalView");
  v7 = objc_claimAutoreleasedReturnValue();
  if (!v7)
    goto LABEL_7;
  v8 = (void *)v7;
  -[_UIPointerArbiterCore_iOS overlayEffectPortalView](self, "overlayEffectPortalView");
  v9 = objc_claimAutoreleasedReturnValue();
  if (!v9)
  {

LABEL_7:
    goto LABEL_8;
  }
  v10 = (void *)v9;
  -[_UIPointerArbiterCore_iOS samplingBackdropView](self, "samplingBackdropView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
LABEL_8:
    -[_UIPointerArbiterCore_iOS pointerClientController](self, "pointerClientController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __81___UIPointerArbiterCore_iOS__preparePointerPortalSourceCollectionWithCompletion___block_invoke;
    v18[3] = &unk_1E16C7F50;
    v18[4] = self;
    v19 = v4;
    objc_msgSend(v17, "createPointerPortalSourceCollectionWithCompletion:", v18);

    goto LABEL_9;
  }
  -[_UIPointerArbiterCore_iOS samplingBackdropView](self, "samplingBackdropView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setPaused:", 0);

  -[_UIPointerArbiterCore_iOS pointerPortalSourceCollection](self, "pointerPortalSourceCollection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIPointerArbiterCore_iOS pointerPortalView](self, "pointerPortalView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIPointerArbiterCore_iOS overlayEffectPortalView](self, "overlayEffectPortalView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIPointerArbiterCore_iOS samplingBackdropView](self, "samplingBackdropView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, void *, void *, void *, void *))v4 + 2))(v4, v13, v14, v15, v16);

LABEL_9:
}

- (id)_coordinateSpaceSourceViewForRegion:(id)a3 withStyle:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;

  v5 = a4;
  objc_msgSend(a3, "referenceView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && objc_msgSend(v5, "type") == 1)
  {
    objc_msgSend(v5, "targetedPreview");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "_sourceViewIsInViewHierarchy");

    objc_msgSend(v5, "targetedPreview");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v8)
    {
      objc_msgSend(v9, "view");
      v11 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v9, "target");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "container");
      v11 = objc_claimAutoreleasedReturnValue();

      v6 = v12;
    }

    v6 = (void *)v11;
  }

  return v6;
}

- (id)_hoverRegionWithStyle:(id)a3 forRegion:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
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
  void *v23;
  void *v24;
  void *v25;
  int v26;
  uint64_t v27;
  void *v28;
  void *v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t i;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  double v44;
  void *v45;
  void *v46;
  void *v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  void *v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  void *v60;
  void *v61;
  double v62;
  CGFloat v63;
  void *v64;
  void *v65;
  void *v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  CGFloat v74;
  void *v75;
  id v76;
  uint64_t v78;
  void *v79;
  double v80;
  double x;
  double v82;
  double y;
  double v84;
  double width;
  double v86;
  double height;
  double v88;
  double v89;
  double v90;
  double v91;
  double v92;
  double v93;
  double v94;
  double v95;
  double v96;
  double v97;
  double v98;
  double v99;
  void *v100;
  int v101;
  void *v102;
  void *v103;
  double v104;
  double v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  CGAffineTransform v111;
  CGAffineTransform v112;
  CGAffineTransform v113;
  CGAffineTransform v114;
  CGRect v115;
  CGRect v116;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  v8 = 0;
  if (!v5 || !v6)
    goto LABEL_33;
  v9 = objc_alloc_init(MEMORY[0x1E0D7F410]);
  objc_msgSend(v7, "rect");
  objc_msgSend(v5, "_contentSlipMappedToRegionSize:", v10, v11);
  v13 = v12;
  v15 = v14;
  objc_msgSend(v7, "rect");
  objc_msgSend(v5, "_pointerSlipMappedToRegionSize:", v16, v17);
  v19 = v18;
  v21 = v20;
  objc_msgSend(v5, "contentScale");
  objc_msgSend(v9, "setContentHoverInverseScale:", 1.0 / v22);
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", v13, v15);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setContentSlipValue:", v23);

  objc_msgSend(v9, "setPointerRecenteringAxes:", objc_msgSend(v5, "constrainedAxes"));
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v9, "setPointerLatchingAxes:", objc_msgSend(v7, "latchingAxes"));
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", v19, v21);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setPointerSlipValue:", v24);

  objc_msgSend(v9, "setShouldPointerSuppressMirroring:", objc_msgSend(v5, "_suppressesMirroring"));
  objc_msgSend(v5, "pointerShape");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "isEmpty");

  v109 = v9;
  if (v26 || (v58 = objc_msgSend(v5, "type")) == 0)
  {
    objc_msgSend(MEMORY[0x1E0D7F428], "systemShape");
    v27 = objc_claimAutoreleasedReturnValue();
LABEL_7:
    v108 = (void *)v27;
    goto LABEL_8;
  }
  if (v58 == 2)
  {
    -[_UIPointerArbiterCore_iOS _pointerShapeForStyle:region:](self, "_pointerShapeForStyle:region:", v5, v7);
    v27 = objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  if (v58 == 1)
  {
    objc_msgSend(v5, "targetedPreview");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "target");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "container");
    v61 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "contentScale");
    v63 = v62;
    objc_msgSend(v5, "pointerShape");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "path");
    v65 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v5, "options") & 1) != 0)
    {
      -[_UIPointerArbiterCore_iOS _pointerShapeForStyle:region:](self, "_pointerShapeForStyle:region:", v5, v7);
      v78 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v65)
      {
        v66 = (void *)objc_msgSend(v65, "copy");
        objc_msgSend(v65, "bounds");
        v69 = v68 + v67 * 0.5;
        v72 = v71 + v70 * 0.5;
        CGAffineTransformMakeTranslation(&v114, -v69, -v72);
        objc_msgSend(v66, "applyTransform:", &v114);
        if ((objc_msgSend(v5, "options") & 0x40) != 0)
        {
          CGAffineTransformMakeScale(&v113, v63, v63);
          objc_msgSend(v66, "applyTransform:", &v113);
        }
        v73 = _UIPointerShapeOffsetFromModelPosition(v61, v7, v69, v72);
        CGAffineTransformMakeTranslation(&v112, v73, v74);
        objc_msgSend(v66, "applyTransform:", &v112);
        v75 = (void *)MEMORY[0x1E0D7F428];
        v76 = objc_retainAutorelease(v66);
        objc_msgSend(v75, "customShapeWithPath:usesEvenOddFillRule:", objc_msgSend(v76, "CGPath"), objc_msgSend(v76, "usesEvenOddFillRule"));
        v108 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_38;
      }
      objc_msgSend(v5, "pointerShape");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v79, "rect");
      x = v80;
      y = v82;
      width = v84;
      height = v86;

      v88 = _UIPointerShapeOffsetFromModelPosition(v61, v7, x + width * 0.5, y + height * 0.5);
      v90 = v89;
      if ((objc_msgSend(v5, "options") & 0x40) != 0)
      {
        CGAffineTransformMakeScale(&v111, v63, v63);
        v115.origin.x = x;
        v115.origin.y = y;
        v115.size.width = width;
        v115.size.height = height;
        v116 = CGRectApplyAffineTransform(v115, &v111);
        x = v116.origin.x;
        y = v116.origin.y;
        width = v116.size.width;
        height = v116.size.height;
      }
      objc_msgSend(v61, "_currentScreenScale");
      UIRectCenteredAboutPointScale(x, y, width, height, v88, v90, v91);
      v93 = v92;
      v95 = v94;
      v97 = v96;
      v99 = v98;
      objc_msgSend(v5, "pointerShape");
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      v101 = objc_msgSend(v100, "isCircle");

      v102 = (void *)MEMORY[0x1E0D7F428];
      if (!v101)
      {
        objc_msgSend(v5, "pointerShape");
        v103 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v103, "effectiveCornerRadius");
        v105 = v104;
        objc_msgSend(v5, "pointerShape");
        v106 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v106, "cornerCurve");
        v107 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v102, "roundedRectWithBounds:cornerRadius:cornerCurve:", v107, v93, v95, v97, v99, v105);
        v108 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_38;
      }
      objc_msgSend(MEMORY[0x1E0D7F428], "circleWithBounds:", v93, v95, v97, v99);
      v78 = objc_claimAutoreleasedReturnValue();
    }
    v108 = (void *)v78;
LABEL_38:

    goto LABEL_8;
  }
  v108 = 0;
LABEL_8:
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accessories");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v29, "count");

  if (v30 >= 4)
    v31 = 4;
  else
    v31 = v30;
  if (v31)
  {
    for (i = 0; i != v31; ++i)
    {
      objc_msgSend(v5, "accessories");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "objectAtIndexedSubscript:", i);
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v5, "targetedPreview");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "target");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "container");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = v37;
      if (v37)
      {
        v39 = v37;
      }
      else
      {
        objc_msgSend(v7, "referenceView");
        v39 = (id)objc_claimAutoreleasedReturnValue();
      }
      v40 = v39;

      v41 = (void *)objc_opt_new();
      objc_msgSend(v34, "shape");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "_currentScreenScale");
      -[_UIPointerArbiterCore_iOS _psPointerShapeFromUIPointerShape:atScale:](self, "_psPointerShapeFromUIPointerShape:atScale:", v42);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "setShape:", v43);

      objc_msgSend(v34, "position");
      objc_msgSend(v41, "setOffset:");
      objc_msgSend(v34, "position");
      objc_msgSend(v41, "setAngle:", v44);
      objc_msgSend(v41, "setOrientationMatchesAngle:", objc_msgSend(v34, "orientationMatchesAngle"));
      objc_msgSend(v28, "addObject:", v41);

    }
  }
  v8 = v109;
  if (objc_msgSend(v28, "count"))
    objc_msgSend(v109, "setAccessories:", v28);
  -[_UIPointerArbiterCore_iOS _coordinateSpaceSourceViewForRegion:withStyle:](self, "_coordinateSpaceSourceViewForRegion:withStyle:", v7, v5);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "layer");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "context");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v109, "setCoordinateSpaceSourceContextID:", objc_msgSend(v47, "contextId"));

  objc_msgSend(v109, "setCoordinateSpaceSourceLayerRenderID:", CALayerGetRenderId());
  objc_msgSend(v7, "rect");
  v49 = v48;
  v51 = v50;
  v53 = v52;
  v55 = v54;
  objc_msgSend(v7, "referenceView");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "convertRect:fromView:", v56, v49, v51, v53, v55);
  objc_msgSend(v109, "setContentBounds:");

  objc_msgSend(v109, "setPointerShape:", v108);
  objc_msgSend(v109, "setShouldPointerUnderlayContent:", objc_msgSend(v5, "pointerUnderlapsContent"));
  if (objc_msgSend(v5, "pointerUnderlapsContent"))
  {
    if ((objc_msgSend(v5, "options") & 2) != 0)
      v57 = 2;
    else
      v57 = 1;
  }
  else
  {
    v57 = 0;
  }
  objc_msgSend(v109, "setOverlayEffectStyle:", v57);
  objc_msgSend(v5, "_pointerIntensityForMaterialLuminance:", -[_UIPointerArbiterCore_iOS lastMaterialLuminance](self, "lastMaterialLuminance"));
  objc_msgSend(v109, "setPointerVisualIntensity:");
  objc_msgSend(v109, "setPreferredPointerMaterialLuminance:", -[_UIPointerArbiterCore_iOS lastMaterialLuminance](self, "lastMaterialLuminance"));

LABEL_33:
  return v8;
}

- (id)_pointerShapeForStyle:(id)a3 region:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v5 = a3;
  objc_msgSend(v5, "pointerShape");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isElastic"))
  {
    v7 = (void *)MEMORY[0x1E0D7F428];
    objc_msgSend(v6, "pinnedPoint");
    objc_msgSend(v7, "elasticRoundedRectPinnedAtPoint:");
    v8 = objc_claimAutoreleasedReturnValue();
LABEL_7:
    v12 = (void *)v8;
    goto LABEL_8;
  }
  if ((objc_msgSend(v6, "isEmpty") & 1) != 0 || (objc_msgSend(v5, "options") & 0x800) != 0)
  {
    objc_msgSend(MEMORY[0x1E0D7F428], "systemShape");
    v8 = objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  objc_msgSend(v5, "targetedPreview");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "target");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "container");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_currentScreenScale");
  -[_UIPointerArbiterCore_iOS _psPointerShapeFromUIPointerShape:atScale:](self, "_psPointerShapeFromUIPointerShape:atScale:", v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_8:
  return v12;
}

- (id)_psPointerShapeFromUIPointerShape:(id)a3 atScale:(double)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  CGFloat MinX;
  CGFloat MinY;
  double x;
  double y;
  double width;
  double height;
  void *v32;
  double v33;
  double v34;
  void *v35;
  CGFloat rect;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;

  v5 = a3;
  objc_msgSend(v5, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = (void *)MEMORY[0x1E0D7F428];
    v9 = objc_retainAutorelease(v6);
    objc_msgSend(v8, "customShapeWithPath:usesEvenOddFillRule:", objc_msgSend(v9, "CGPath"), objc_msgSend(v9, "usesEvenOddFillRule"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v5, "rect");
    v12 = v11;
    v14 = v13;
    v16 = v15;
    v18 = v17;
    UIRectCenteredAboutPointScale(v11, v13, v15, v17, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), a4);
    rect = v19;
    v21 = v20;
    v23 = v22;
    v25 = v24;
    v38.origin.x = v12;
    v38.origin.y = v14;
    v38.size.width = v16;
    v38.size.height = v18;
    MinX = CGRectGetMinX(v38);
    v39.origin.x = v12;
    v39.origin.y = v14;
    v39.size.width = v16;
    v39.size.height = v18;
    MinY = CGRectGetMinY(v39);
    v40.origin.x = rect;
    v40.origin.y = v21;
    v40.size.width = v23;
    v40.size.height = v25;
    v41 = CGRectOffset(v40, MinX, MinY);
    x = v41.origin.x;
    y = v41.origin.y;
    width = v41.size.width;
    height = v41.size.height;
    v32 = (void *)MEMORY[0x1E0D7F428];
    objc_msgSend(v5, "effectiveCornerRadius");
    v34 = v33;
    objc_msgSend(v5, "cornerCurve");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "roundedRectWithBounds:cornerRadius:cornerCurve:", v35, x, y, width, height, v34);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v10;
}

- (void)_getPointerRegion:(id *)a3 andStyle:(id *)a4 atLocation:(CGPoint)a5 inWindow:(id)a6
{
  double y;
  double x;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  id v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  void *v31;
  void *v32;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _QWORD v38[6];
  _BYTE v39[128];
  uint64_t v40;

  y = a5.y;
  x = a5.x;
  v40 = *MEMORY[0x1E0C80C00];
  v9 = a6;
  objc_msgSend(v9, "convertPoint:toWindow:", 0, x, y);
  v11 = v10;
  v13 = v12;
  v38[0] = MEMORY[0x1E0C809B0];
  v38[1] = 3221225472;
  v38[2] = __76___UIPointerArbiterCore_iOS__getPointerRegion_andStyle_atLocation_inWindow___block_invoke;
  v38[3] = &__block_descriptor_48_e32__CAPoint3D_ddd_16__0__UIWindow_8l;
  *(double *)&v38[4] = v10;
  *(double *)&v38[5] = v12;
  _UIHitTestGestureContainer(0, v9, (uint64_t)v9, 0, (uint64_t)v38, 1.0);
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)v14;
  if (!v14)
    goto LABEL_24;
  v16 = (id)v14;
  while (!_IsKindOfUIView((uint64_t)v16))
  {
LABEL_15:
    v16 = (id)objc_msgSend(v16, "_parentGestureRecognizerContainer");
    if (!v16)
      goto LABEL_24;
  }
  objc_msgSend(v16, "interactions");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v18 = v17;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
  if (!v19)
  {
LABEL_13:

    goto LABEL_15;
  }
  v20 = v19;
  v21 = *(_QWORD *)v35;
LABEL_6:
  v22 = 0;
  while (1)
  {
    if (*(_QWORD *)v35 != v21)
      objc_enumerationMutation(v18);
    v23 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * v22);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_msgSend(v23, "isEnabled") & 1) != 0)
      break;
    if (v20 == ++v22)
    {
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
      if (v20)
        goto LABEL_6;
      goto LABEL_13;
    }
  }
  v24 = v23;

  if (!v24)
    goto LABEL_15;
  objc_msgSend(v24, "view");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "convertPoint:fromView:", 0, v11, v13);
  v27 = v26;
  v29 = v28;

  objc_msgSend((id)UIApp, "_hoverEventForWindow:", v9);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "_pointerRegionAtPoint:modifiers:", objc_msgSend(v30, "modifierFlags"), v27, v29);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if (v31)
  {
    objc_msgSend(v24, "_pointerStyleForRegion:", v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (a3)
      *a3 = objc_retainAutorelease(v31);
    if (a4)
      *a4 = objc_retainAutorelease(v32);

  }
LABEL_24:

}

- (void)backgroundLumaView:(id)a3 didTransitionToLevel:(unint64_t)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id location;

  v6 = a3;
  if (a4 == 2)
    v7 = 2;
  else
    v7 = a4 == 1;
  -[_UIPointerArbiterCore_iOS setLastMaterialLuminance:](self, "setLastMaterialLuminance:", v7);
  -[_UIPointerArbiterCore_iOS lastSentHoverRegion](self, "lastSentHoverRegion");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_initWeak(&location, self);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __69___UIPointerArbiterCore_iOS_backgroundLumaView_didTransitionToLevel___block_invoke;
    v9[3] = &unk_1E16C7F98;
    objc_copyWeak(&v10, &location);
    -[_UIPointerArbiterCore_iOS _performTransactionUsingBlock:](self, "_performTransactionUsingBlock:", v9);
    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }

}

- (BOOL)assertionActivationStateForType:(unint64_t)a3
{
  return !a3 && self->_updatesPausedViaAssertion;
}

- (void)assertionActivationStateChangedToState:(BOOL)a3 forType:(unint64_t)a4
{
  void *v6;

  if (!a4)
  {
    if (a3 && !self->_updatesPausedViaAssertion)
    {
      -[_UIPointerArbiterCore_iOS activePointerRegion](self, "activePointerRegion");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIPointerArbiterCore_iOS exitRegion:removeStyle:completion:](self, "exitRegion:removeStyle:completion:", v6, 1, 0);

    }
    self->_updatesPausedViaAssertion = a3;
    -[_UIPointerArbiterCore_iOS _notifyPointerStateDidChange](self, "_notifyPointerStateDidChange");
  }
}

- (BOOL)hasRunningTransaction
{
  return self->_hasRunningTransaction;
}

- (void)setHasRunningTransaction:(BOOL)a3
{
  self->_hasRunningTransaction = a3;
}

- (NSMutableArray)pendingTransactionBlocks
{
  return self->_pendingTransactionBlocks;
}

- (void)setPendingTransactionBlocks:(id)a3
{
  objc_storeStrong((id *)&self->_pendingTransactionBlocks, a3);
}

- (UIPointerStyle)activePointerStyle
{
  return self->_activePointerStyle;
}

- (void)setActivePointerStyle:(id)a3
{
  objc_storeStrong((id *)&self->_activePointerStyle, a3);
}

- (UIPointerRegion)activePointerRegion
{
  return self->_activePointerRegion;
}

- (void)setActivePointerRegion:(id)a3
{
  objc_storeStrong((id *)&self->_activePointerRegion, a3);
}

- (PSPointerHoverRegion)lastSentHoverRegion
{
  return self->_lastSentHoverRegion;
}

- (void)setLastSentHoverRegion:(id)a3
{
  objc_storeStrong((id *)&self->_lastSentHoverRegion, a3);
}

- (unint64_t)lastMaterialLuminance
{
  return self->_lastMaterialLuminance;
}

- (void)setLastMaterialLuminance:(unint64_t)a3
{
  self->_lastMaterialLuminance = a3;
}

- (NSMapTable)pointerRegionToMatchMoveSourceMap
{
  return self->_pointerRegionToMatchMoveSourceMap;
}

- (void)setPointerRegionToMatchMoveSourceMap:(id)a3
{
  objc_storeStrong((id *)&self->_pointerRegionToMatchMoveSourceMap, a3);
}

- (PSPointerClientController)pointerClientController
{
  return self->_pointerClientController;
}

- (void)setPointerClientController:(id)a3
{
  objc_storeStrong((id *)&self->_pointerClientController, a3);
}

- (PSPointerPortalSourceCollection)pointerPortalSourceCollection
{
  return self->_pointerPortalSourceCollection;
}

- (void)setPointerPortalSourceCollection:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (_UIPortalView)pointerPortalView
{
  return self->_pointerPortalView;
}

- (void)setPointerPortalView:(id)a3
{
  objc_storeStrong((id *)&self->_pointerPortalView, a3);
}

- (_UIPortalView)overlayEffectPortalView
{
  return self->_overlayEffectPortalView;
}

- (void)setOverlayEffectPortalView:(id)a3
{
  objc_storeStrong((id *)&self->_overlayEffectPortalView, a3);
}

- (_UILumaTrackingBackdropView)samplingBackdropView
{
  return self->_samplingBackdropView;
}

- (void)setSamplingBackdropView:(id)a3
{
  objc_storeStrong((id *)&self->_samplingBackdropView, a3);
}

- (unint64_t)transactionRevisionID
{
  return self->_transactionRevisionID;
}

- (void)setTransactionRevisionID:(unint64_t)a3
{
  self->_transactionRevisionID = a3;
}

- (UIPointerRegion)scrollingRegion
{
  return self->_scrollingRegion;
}

- (void)setScrollingRegion:(id)a3
{
  objc_storeStrong((id *)&self->_scrollingRegion, a3);
}

- (_UIAssertionController)pauseAssertionController
{
  return self->_pauseAssertionController;
}

- (void)setPauseAssertionController:(id)a3
{
  objc_storeStrong((id *)&self->_pauseAssertionController, a3);
}

- (BOOL)updatesPausedViaAssertion
{
  return self->_updatesPausedViaAssertion;
}

- (void)setUpdatesPausedViaAssertion:(BOOL)a3
{
  self->_updatesPausedViaAssertion = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pauseAssertionController, 0);
  objc_storeStrong((id *)&self->_scrollingRegion, 0);
  objc_storeStrong((id *)&self->_samplingBackdropView, 0);
  objc_storeStrong((id *)&self->_overlayEffectPortalView, 0);
  objc_storeStrong((id *)&self->_pointerPortalView, 0);
  objc_storeStrong((id *)&self->_pointerPortalSourceCollection, 0);
  objc_storeStrong((id *)&self->_pointerClientController, 0);
  objc_storeStrong((id *)&self->_pointerRegionToMatchMoveSourceMap, 0);
  objc_storeStrong((id *)&self->_lastSentHoverRegion, 0);
  objc_storeStrong((id *)&self->_activePointerRegion, 0);
  objc_storeStrong((id *)&self->_activePointerStyle, 0);
  objc_storeStrong((id *)&self->_pendingTransactionBlocks, 0);
}

@end
