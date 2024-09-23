@implementation SBMedusaWindowDragGestureDestinationModifier

- (SBMedusaWindowDragGestureDestinationModifier)initWithSelectedLeafAppLayout:(id)a3 initialMainAppLayout:(id)a4 initialFloatingAppLayout:(id)a5 initialFloatingConfiguration:(int64_t)a6 delegate:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  SBMedusaWindowDragGestureDestinationModifier *v17;
  SBMedusaWindowDragGestureDestinationModifier *v18;
  objc_super v20;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a7;
  v20.receiver = self;
  v20.super_class = (Class)SBMedusaWindowDragGestureDestinationModifier;
  v17 = -[SBSwitcherModifier init](&v20, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_selectedLeafAppLayout, a3);
    objc_storeStrong((id *)&v18->_initialMainAppLayout, a4);
    objc_storeStrong((id *)&v18->_initialFloatingAppLayout, a5);
    v18->_initialFloatingConfiguration = a6;
    objc_storeStrong((id *)&v18->_currentAppLayout, a4);
    objc_storeStrong((id *)&v18->_proposedAppLayout, a4);
    objc_storeWeak((id *)&v18->_dragDestinationDelegate, v16);
    v18->_gesturePhase = 0;
    v18->_currentDestination = 0;
  }

  return v18;
}

- (void)didMoveToParentModifier:(id)a3
{
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBMedusaWindowDragGestureDestinationModifier;
  -[SBChainableModifier didMoveToParentModifier:](&v6, sel_didMoveToParentModifier_);
  if (a3)
  {
    -[SBAppLayout itemForLayoutRole:](self->_selectedLeafAppLayout, "itemForLayoutRole:", 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    self->_supportsMedusa = -[SBMedusaWindowDragGestureDestinationModifier displayItemSupportsMedusa:](self, "displayItemSupportsMedusa:", v5);
    self->_supportsCenterRole = -[SBMedusaWindowDragGestureDestinationModifier displayItemSupportsCenterRole:](self, "displayItemSupportsCenterRole:", v5);

  }
}

- (id)handleGestureEvent:(id)a3
{
  id v4;
  void *v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  SBSwitcherModifierEventResponse *pendingEnterPlatterZoneResponse;
  uint64_t v13;
  SBSwitcherModifierEventResponse *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  int v21;
  int v22;
  void *v23;
  SBPerformTransitionSwitcherEventResponse *v24;
  uint64_t v25;
  void *v26;
  SBPerformTransitionSwitcherEventResponse *v27;
  uint64_t v28;
  _QWORD v30[5];
  objc_super v31;

  v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)SBMedusaWindowDragGestureDestinationModifier;
  -[SBSwitcherModifier handleGestureEvent:](&v31, sel_handleGestureEvent_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  self->_gesturePhase = objc_msgSend(v4, "phase");
  objc_msgSend(v4, "locationInContainerView");
  self->_location.x = v6;
  self->_location.y = v7;
  objc_msgSend(v4, "translationInContainerView");
  self->_translation.x = v8;
  self->_translation.y = v9;
  objc_msgSend(v4, "averageTouchVelocityOverTimeDuration:", 0.0416666667);
  self->_velocity.x = v10;
  self->_velocity.y = v11;
  pendingEnterPlatterZoneResponse = self->_pendingEnterPlatterZoneResponse;
  if (pendingEnterPlatterZoneResponse)
  {
    SBAppendSwitcherModifierResponse(pendingEnterPlatterZoneResponse, v5);
    v13 = objc_claimAutoreleasedReturnValue();

    v14 = self->_pendingEnterPlatterZoneResponse;
    self->_pendingEnterPlatterZoneResponse = 0;

    v5 = (void *)v13;
  }
  if (objc_msgSend(v4, "phase") == 1)
  {
    -[SBMedusaWindowDragGestureDestinationModifier draggingAppLayoutsForWindowDrag](self, "draggingAppLayoutsForWindowDrag");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __67__SBMedusaWindowDragGestureDestinationModifier_handleGestureEvent___block_invoke;
    v30[3] = &unk_1E8E9DF78;
    v30[4] = self;
    objc_msgSend(v15, "bs_firstObjectPassingTest:", v30);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = objc_msgSend(v16, "preferredDisplayOrdinal");
    v18 = -[SBMedusaWindowDragGestureDestinationModifier displayOrdinal](self, "displayOrdinal");
    self->_dragBeganInOtherSwitcher = v17 != v18;
    self->_dragBeganInOurSwitcher = v17 == v18;

  }
  -[SBMedusaWindowDragGestureDestinationModifier _updateForWindowDrag](self, "_updateForWindowDrag");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  SBAppendSwitcherModifierResponse(v19, v5);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = -[SBAppLayout containsAllItemsFromAppLayout:](self->_proposedAppLayout, "containsAllItemsFromAppLayout:", self->_selectedLeafAppLayout);
  -[SBMedusaWindowDragGestureDestinationModifier _updateCurrentDropAction](self, "_updateCurrentDropAction");
  v22 = -[SBAppLayout containsAllItemsFromAppLayout:](self->_proposedAppLayout, "containsAllItemsFromAppLayout:", self->_selectedLeafAppLayout);
  if (objc_msgSend(v4, "phase") == 2 && v21 != v22)
  {
    -[SBMedusaWindowDragGestureDestinationModifier _transitionRequestForDestination:complete:](self, "_transitionRequestForDestination:complete:", self->_currentDestination, 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = -[SBPerformTransitionSwitcherEventResponse initWithTransitionRequest:gestureInitiated:]([SBPerformTransitionSwitcherEventResponse alloc], "initWithTransitionRequest:gestureInitiated:", v23, 1);
    SBAppendSwitcherModifierResponse(v24, v20);
    v25 = objc_claimAutoreleasedReturnValue();

    v20 = (void *)v25;
  }
  if (objc_msgSend(v4, "phase") == 3)
  {
    -[SBMedusaWindowDragGestureDestinationModifier _transitionRequestForDestination:complete:](self, "_transitionRequestForDestination:complete:", self->_currentDestination, 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = -[SBPerformTransitionSwitcherEventResponse initWithTransitionRequest:gestureInitiated:]([SBPerformTransitionSwitcherEventResponse alloc], "initWithTransitionRequest:gestureInitiated:", v26, 1);
    SBAppendSwitcherModifierResponse(v27, v20);
    v28 = objc_claimAutoreleasedReturnValue();

    v20 = (void *)v28;
  }

  return v20;
}

uint64_t __67__SBMedusaWindowDragGestureDestinationModifier_handleGestureEvent___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 96);
  v3 = a2;
  objc_msgSend(v2, "itemForLayoutRole:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "containsItem:", v4);

  return v5;
}

- (id)handleResizeProgressEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v5 = v4;
  if (*(_WORD *)&self->_isResizingToFullScreen)
  {
    objc_msgSend(v4, "progress");
    self->_isResizingToFullScreen = BSFloatIsOne() ^ 1;
    -[SBMedusaWindowDragGestureDestinationModifier medusaSettings](self, "medusaSettings");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dropAnimationUnblurThresholdPercentage");
    self->_hasResizedEnoughToUnblur = BSFloatGreaterThanOrEqualToFloat();

  }
  v9.receiver = self;
  v9.super_class = (Class)SBMedusaWindowDragGestureDestinationModifier;
  -[SBSwitcherModifier handleResizeProgressEvent:](&v9, sel_handleResizeProgressEvent_, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)isLayoutRoleBlurred:(int64_t)a3 inAppLayout:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  int v9;
  unsigned __int8 v10;
  objc_super v12;

  v6 = a4;
  if (self->_isResizingToFullScreen
    && -[SBAppLayout isFullScreen](self->_currentAppLayout, "isFullScreen")
    && (objc_msgSend(v6, "itemForLayoutRole:", 1),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        -[SBAppLayout itemForLayoutRole:](self->_currentAppLayout, "itemForLayoutRole:", 1),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v7, "isEqual:", v8),
        v8,
        v7,
        v9)
    || self->_gesturePhase == 3 && self->_currentDestination - 11 <= 1)
  {
    v10 = !self->_hasResizedEnoughToUnblur;
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)SBMedusaWindowDragGestureDestinationModifier;
    v10 = -[SBMedusaWindowDragGestureDestinationModifier isLayoutRoleBlurred:inAppLayout:](&v12, sel_isLayoutRoleBlurred_inAppLayout_, a3, v6);
  }

  return v10;
}

- (id)resizeProgressNotificationsForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  uint64_t v16;
  objc_super v18;
  _QWORD v19[4];

  v19[3] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v18.receiver = self;
  v18.super_class = (Class)SBMedusaWindowDragGestureDestinationModifier;
  -[SBMedusaWindowDragGestureDestinationModifier resizeProgressNotificationsForLayoutRole:inAppLayout:](&v18, sel_resizeProgressNotificationsForLayoutRole_inAppLayout_, a3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_isResizingToFullScreen)
  {
    if (-[SBAppLayout isFullScreen](self->_currentAppLayout, "isFullScreen"))
    {
      objc_msgSend(v6, "itemForLayoutRole:", 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBAppLayout itemForLayoutRole:](self->_currentAppLayout, "itemForLayoutRole:", 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "isEqual:", v9);

      if (v10)
      {
        -[SBMedusaWindowDragGestureDestinationModifier medusaSettings](self, "medusaSettings");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "dropAnimationUnblurThresholdPercentage");
        v13 = v12;

        v19[0] = &unk_1E91CF698;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v19[1] = v14;
        v19[2] = &unk_1E91CF6A8;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 3);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setByAddingObjectsFromArray:", v15);
        v16 = objc_claimAutoreleasedReturnValue();

        v7 = (void *)v16;
      }
    }
  }

  return v7;
}

- (id)proposedAppLayoutForWindowDrag
{
  return self->_proposedAppLayout;
}

- (void)_displayLinkFired:(id)a3
{
  CGPoint *p_velocity;
  CGFloat v5;
  CGFloat v6;
  SBSwitcherModifierEventResponse *v7;
  SBSwitcherModifierEventResponse *v8;

  if (self->_gesturePhase == 2)
  {
    p_velocity = &self->_velocity;
    -[SBMedusaWindowDragGestureDestinationModifier gestureHandlingModifier:averageVelocityOverDuration:](self, "gestureHandlingModifier:averageVelocityOverDuration:", self, 0.0416666667);
    p_velocity->x = v5;
    p_velocity->y = v6;
    -[SBMedusaWindowDragGestureDestinationModifier _updateForWindowDrag](self, "_updateForWindowDrag");
    v7 = (SBSwitcherModifierEventResponse *)objc_claimAutoreleasedReturnValue();
    if (self->_enteredPlatterZone)
    {
      v8 = v7;
      objc_storeStrong((id *)&self->_pendingEnterPlatterZoneResponse, v7);
      -[SBMedusaWindowDragGestureDestinationModifier gestureHandlingModifierRequestsUpdate:](self, "gestureHandlingModifierRequestsUpdate:", self);
      v7 = v8;
      if (self->_pendingEnterPlatterZoneResponse == v8)
      {
        self->_pendingEnterPlatterZoneResponse = 0;

        v7 = v8;
      }
    }

  }
}

- (id)_updateForWindowDrag
{
  SBPerformTransitionSwitcherEventResponse *v2;
  CADisplayLink *v5;
  CADisplayLink *displayLink;
  CADisplayLink *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double y;
  double x;
  double v19;
  double v20;
  double v21;
  double v22;
  unint64_t dragPauseCounter;
  _BOOL4 v24;
  BOOL v25;
  CADisplayLink *v26;
  void *v27;
  SBAppLayout *v28;
  SBAppLayout *currentAppLayout;
  SBAppLayout *initialMainAppLayout;
  void *v31;
  SBMutableSwitcherTransitionRequest *v32;
  _QWORD v33[5];
  CGPoint v34;
  CGRect v35;

  if (self->_enteredPlatterZone)
    goto LABEL_2;
  if (!self->_displayLink)
  {
    objc_msgSend(MEMORY[0x1E0CD2730], "displayLinkWithTarget:selector:", self, sel__displayLinkFired_);
    v5 = (CADisplayLink *)objc_claimAutoreleasedReturnValue();
    displayLink = self->_displayLink;
    self->_displayLink = v5;

    v7 = self->_displayLink;
    objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CADisplayLink addToRunLoop:forMode:](v7, "addToRunLoop:forMode:", v8, *MEMORY[0x1E0C99860]);

    self->_dragPauseCounter = 0;
  }
  -[SBMedusaWindowDragGestureDestinationModifier switcherViewBounds](self, "switcherViewBounds");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  x = self->_location.x;
  y = self->_location.y;
  v19 = self->_translation.x;
  -[SBMedusaWindowDragGestureDestinationModifier _contentDraggingCommandeerWidth](self, "_contentDraggingCommandeerWidth");
  v21 = v20;
  if (BSFloatLessThanFloat()
    && (!-[SBMedusaWindowDragGestureDestinationModifier _draggingFullScreenApp](self, "_draggingFullScreenApp")
     && -[SBMedusaWindowDragGestureDestinationModifier _isDragOverFullscreenRegionAtLocation:inBounds:](self, "_isDragOverFullscreenRegionAtLocation:inBounds:", x, y, v10, v12, v14, v16)|| -[SBMedusaWindowDragGestureDestinationModifier _layoutRoleForDraggedApp](self, "_layoutRoleForDraggedApp") == 3&& -[SBMedusaWindowDragGestureDestinationModifier _isDragOverSideGutterRegionsAtLocation:inBounds:totalContentDragGutterWidth:](self, "_isDragOverSideGutterRegionsAtLocation:inBounds:totalContentDragGutterWidth:", x, y, v10, v12, v14, v16, v21)))
  {
    ++self->_dragPauseCounter;
  }
  else
  {
    self->_dragPauseCounter = 0;
  }
  v22 = SBScreenMaximumFramesPerSecond() * 0.05;
  dragPauseCounter = self->_dragPauseCounter;
  self->_enteredPlatterZone = dragPauseCounter > (uint64_t)v22;
  if (dragPauseCounter <= (uint64_t)v22)
  {
    v35.origin.x = v10;
    v35.origin.y = v12;
    v35.size.width = v14;
    v35.size.height = v16;
    v34.x = x;
    v34.y = y;
    if (CGRectContainsPoint(v35, v34))
    {
      if (-[SBMedusaWindowDragGestureDestinationModifier _draggingFullScreenApp](self, "_draggingFullScreenApp"))
      {
        v24 = fabs(v19) > 150.0;
        if (y > 150.0)
          v24 = 1;
      }
      else if (-[SBMedusaWindowDragGestureDestinationModifier _draggingSplitViewApp](self, "_draggingSplitViewApp"))
      {
        v24 = fabs(v19) > 150.0;
        if (y <= 150.0)
          v24 = 0;
      }
      else
      {
        if (-[SBMedusaWindowDragGestureDestinationModifier _draggingCenterWindow](self, "_draggingCenterWindow"))
          v25 = fabs(v19) <= 150.0;
        else
          v25 = y <= 150.0;
        v24 = !v25;
      }
      self->_enteredPlatterZone = v24;
      if (!v24)
        goto LABEL_2;
    }
    else if (!self->_enteredPlatterZone)
    {
LABEL_2:
      v2 = 0;
      return v2;
    }
  }
  -[CADisplayLink invalidate](self->_displayLink, "invalidate");
  v26 = self->_displayLink;
  self->_displayLink = 0;

  v2 = 0;
  if (-[SBMedusaWindowDragGestureDestinationModifier _draggingSplitViewApp](self, "_draggingSplitViewApp"))
  {
    -[SBMedusaWindowDragGestureDestinationModifier _transitionRequestForDestination:complete:](self, "_transitionRequestForDestination:complete:", 7, 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "appLayout");
    v28 = (SBAppLayout *)objc_claimAutoreleasedReturnValue();
    currentAppLayout = self->_currentAppLayout;
    self->_currentAppLayout = v28;

    self->_isResizingToFullScreen = 1;
    self->_hasResizedEnoughToUnblur = 0;
    initialMainAppLayout = self->_initialMainAppLayout;
    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = __68__SBMedusaWindowDragGestureDestinationModifier__updateForWindowDrag__block_invoke;
    v33[3] = &unk_1E8E9DF50;
    v33[4] = self;
    -[SBAppLayout appLayoutWithItemsPassingTest:](initialMainAppLayout, "appLayoutWithItemsPassingTest:", v33);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (v31)
    {
      v32 = objc_alloc_init(SBMutableSwitcherTransitionRequest);
      -[SBSwitcherTransitionRequest setAppLayout:](v32, "setAppLayout:", v31);
      -[SBSwitcherTransitionRequest setSceneUpdatesOnly:](v32, "setSceneUpdatesOnly:", 1);
      v2 = -[SBPerformTransitionSwitcherEventResponse initWithTransitionRequest:gestureInitiated:]([SBPerformTransitionSwitcherEventResponse alloc], "initWithTransitionRequest:gestureInitiated:", v32, 1);

    }
    else
    {
      v2 = 0;
    }

  }
  return v2;
}

BOOL __68__SBMedusaWindowDragGestureDestinationModifier__updateForWindowDrag__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _BOOL8 v4;

  v3 = a2;
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 248), "containsItem:", v3))
    v4 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 248), "layoutRoleForItem:", v3) != 3;
  else
    v4 = 1;

  return v4;
}

- (void)_updateCurrentDropAction
{
  double v3;
  double v4;
  CGFloat v5;
  double v6;
  double v7;
  double v8;
  CGFloat v9;
  double x;
  double y;
  double v12;
  double v13;
  int v14;
  _BOOL4 v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _BOOL4 supportsMedusa;
  char v20;
  int v21;
  BOOL v22;
  BOOL v23;
  BOOL v24;
  BOOL v25;
  id WeakRetained;
  uint64_t v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  void *v35;
  char v36;
  void *v37;
  uint64_t v38;
  id v39;
  unsigned __int8 v40;
  _BOOL4 dragBeganInOurSwitcher;
  SBAppLayout *v42;
  SBAppLayout *v43;
  uint64_t (**v44)(_QWORD);
  void *v45;
  uint64_t v46;
  unint64_t v47;
  void *v48;
  uint64_t (**v49)(_QWORD);
  void *v50;
  uint64_t v51;
  int64_t v52;
  uint64_t v53;
  uint64_t v54;
  BOOL v55;
  uint64_t v56;
  void *v57;
  SBAppLayout *v58;
  SBAppLayout *proposedAppLayout;
  int64_t v60;
  double v61;
  unint64_t currentDestination;
  double v63;
  double v64;
  int64_t v65;
  uint64_t v66;
  uint64_t v67;
  double v68;
  int64_t v69;
  uint64_t v70;
  uint64_t v71;
  int v72;
  _BOOL4 v73;
  char v74;
  int v75;
  _BOOL4 v76;
  uint64_t (**v77)(_QWORD);
  id v78;
  CGFloat v79;
  uint64_t v80;
  double v81;
  double v82;
  _BOOL4 v83;
  _QWORD v84[5];
  SBAppLayout *v85;
  double v86;
  double v87;
  CGFloat v88;
  CGFloat v89;
  double v90;
  CGFloat v91;
  double v92;
  double v93;
  double v94;
  uint64_t v95;
  BOOL v96;
  char v97;
  BOOL v98;
  BOOL v99;
  BOOL v100;
  _QWORD v101[4];
  id v102;
  _QWORD v103[14];
  CGPoint v104;
  CGPoint v105;
  CGPoint v106;
  CGPoint v107;
  CGPoint v108;
  CGRect v109;
  CGRect v110;
  CGRect v111;
  CGRect v112;
  CGRect v113;

  -[SBMedusaWindowDragGestureDestinationModifier switcherViewBounds](self, "switcherViewBounds");
  v79 = v3;
  v5 = v4;
  v7 = v6;
  v9 = v8;
  x = self->_location.x;
  y = self->_location.y;
  v13 = self->_velocity.x;
  v12 = self->_velocity.y;
  v81 = y + v12 * 0.15;
  v14 = -[SBMedusaWindowDragGestureDestinationModifier isRTLEnabled](self, "isRTLEnabled");
  v103[2] = __72__SBMedusaWindowDragGestureDestinationModifier__updateCurrentDropAction__block_invoke;
  v103[3] = &unk_1E8EAA068;
  v82 = x + v13 * 0.15;
  v15 = v82 < v7 * 0.5;
  v16 = MEMORY[0x1E0C809B0];
  v103[0] = MEMORY[0x1E0C809B0];
  v103[1] = 3221225472;
  v103[4] = self;
  if (v14)
    v15 = x + v13 * 0.15 >= v7 * 0.5;
  if (v15)
    v17 = 6;
  else
    v17 = 7;
  *(double *)&v103[5] = v13;
  *(double *)&v103[6] = v12;
  *(CGFloat *)&v103[7] = v79;
  *(CGFloat *)&v103[8] = v5;
  *(double *)&v103[9] = v7;
  *(CGFloat *)&v103[10] = v9;
  *(double *)&v103[11] = x;
  *(double *)&v103[12] = y;
  v18 = MEMORY[0x1D17E5550](v103);
  supportsMedusa = self->_supportsMedusa;
  v20 = -[SBMedusaWindowDragGestureDestinationModifier isInMedusaCapableSpace](self, "isInMedusaCapableSpace");
  v21 = -[SBMedusaWindowDragGestureDestinationModifier isMedusaCapable](self, "isMedusaCapable");
  -[SBMedusaWindowDragGestureDestinationModifier _fullscreenActivationRegionSize](self, "_fullscreenActivationRegionSize");
  SBRectWithSize();
  UIRectCenteredXInRect();
  v104.x = x;
  v104.y = y;
  v83 = CGRectContainsPoint(v109, v104);
  v77 = (uint64_t (**)(_QWORD))v18;
  v74 = v20;
  v75 = v21;
  v76 = supportsMedusa;
  v80 = v17;
  if (!self->_supportsCenterRole)
  {
    v23 = 0;
    v25 = 0;
    v24 = 0;
    goto LABEL_14;
  }
  -[SBMedusaWindowDragGestureDestinationModifier _universalCenterZone](self, "_universalCenterZone");
  v105.x = x;
  v105.y = y;
  v22 = CGRectContainsPoint(v110, v105);
  if (!self->_supportsCenterRole)
  {
    v23 = 0;
    goto LABEL_12;
  }
  -[SBMedusaWindowDragGestureDestinationModifier _leftFloatingZoneForCenterWindow](self, "_leftFloatingZoneForCenterWindow");
  v106.x = x;
  v106.y = y;
  v23 = CGRectContainsPoint(v111, v106);
  if (!self->_supportsCenterRole)
  {
LABEL_12:
    v24 = 0;
    goto LABEL_13;
  }
  -[SBMedusaWindowDragGestureDestinationModifier _rightFloatingZoneForCenterWindow](self, "_rightFloatingZoneForCenterWindow");
  v107.x = x;
  v107.y = y;
  v24 = CGRectContainsPoint(v112, v107);
LABEL_13:
  v25 = v22;
LABEL_14:
  WeakRetained = objc_loadWeakRetained((id *)&self->_dragDestinationDelegate);
  v27 = -[SBMedusaWindowDragGestureDestinationModifier switcherInterfaceOrientation](self, "switcherInterfaceOrientation");
  -[SBMedusaWindowDragGestureDestinationModifier _sideActivationGutterSize](self, "_sideActivationGutterSize");
  v29 = v28 + v28;
  v78 = WeakRetained;
  objc_msgSend(WeakRetained, "platterScaleForWindowDragGestureDestinationModifier:", self);
  v31 = v30;
  -[SBMedusaWindowDragGestureDestinationModifier floatingApplicationFrameInInterfaceOrientation:floatingConfiguration:](self, "floatingApplicationFrameInInterfaceOrientation:floatingConfiguration:", v27, self->_initialFloatingConfiguration);
  v33 = v29 + v31 * v32 * 0.5;
  LOBYTE(v27) = -[SBMedusaWindowDragGestureDestinationModifier isSplitViewSupported](self, "isSplitViewSupported");
  -[SBAppLayout itemForLayoutRole:](self->_selectedLeafAppLayout, "itemForLayoutRole:");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBMedusaWindowDragGestureDestinationModifier proposedAppLayoutForWindowDrag](self, "proposedAppLayoutForWindowDrag");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(v35, "containsItem:", v34);

  -[SBMedusaWindowDragGestureDestinationModifier proposedAppLayoutsForWindowDrag](self, "proposedAppLayoutsForWindowDrag");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v101[0] = v16;
  v101[1] = 3221225472;
  v101[2] = __72__SBMedusaWindowDragGestureDestinationModifier__updateCurrentDropAction__block_invoke_2;
  v101[3] = &unk_1E8E9DF78;
  v102 = v34;
  v38 = v16;
  v39 = v34;
  v40 = objc_msgSend(v37, "bs_containsObjectPassingTest:", v101);

  dragBeganInOurSwitcher = self->_dragBeganInOurSwitcher;
  v42 = self->_currentAppLayout;
  v84[0] = v38;
  v84[1] = 3221225472;
  v84[2] = __72__SBMedusaWindowDragGestureDestinationModifier__updateCurrentDropAction__block_invoke_3;
  v84[3] = &unk_1E8EAA090;
  v84[4] = self;
  v96 = v83;
  v97 = v27;
  v86 = v82;
  v87 = v81;
  v88 = v79;
  v89 = v5;
  v90 = v7;
  v91 = v9;
  v43 = v42;
  v85 = v43;
  v92 = x;
  v93 = y;
  v98 = v23;
  v99 = v24;
  v94 = v33;
  v100 = v25;
  v95 = v80;
  v44 = (uint64_t (**)(_QWORD))MEMORY[0x1D17E5550](v84);
  if (self->_dragBeganInOtherSwitcher)
  {
    v113.origin.x = v79;
    v113.origin.y = v5;
    v113.size.width = v7;
    v113.size.height = v9;
    v108.x = x;
    v108.y = y;
    if (!CGRectContainsPoint(v113, v108))
    {
      v47 = 0;
      v49 = v77;
      v48 = v78;
      goto LABEL_51;
    }
    -[SBAppLayout allItems](v43, "allItems");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = objc_msgSend(v45, "count");

    v47 = 1;
    v48 = v78;
    if (!v46 || !v76)
    {
      v49 = v77;
      goto LABEL_51;
    }
    v49 = v77;
    if (((v75 ^ 1) & 1) != 0)
      goto LABEL_51;
    if ((v74 & 1) == 0)
    {
      if (!self->_enteredPlatterZone)
      {
        -[SBAppLayout itemForLayoutRole:](self->_selectedLeafAppLayout, "itemForLayoutRole:", 1);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        if ((-[SBMedusaWindowDragGestureDestinationModifier displayItemSupportsCenterRole:](self, "displayItemSupportsCenterRole:", v50) & 1) != 0)v47 = 10;
        else
          v47 = v77[2](v77);

        goto LABEL_51;
      }
      goto LABEL_45;
    }
LABEL_31:
    v51 = v44[2](v44);
LABEL_50:
    v47 = v51;
    goto LABEL_51;
  }
  if ((dragBeganInOurSwitcher & ~v36 & v40) == 1)
  {
    v49 = v77;
    v48 = v78;
    if (-[SBMedusaWindowDragGestureDestinationModifier _draggingCenterWindow](self, "_draggingCenterWindow"))
    {
      v47 = 13;
      goto LABEL_51;
    }
    if (-[SBMedusaWindowDragGestureDestinationModifier _draggingSlideOverApp](self, "_draggingSlideOverApp"))
      goto LABEL_34;
    if (!-[SBMedusaWindowDragGestureDestinationModifier _draggingSplitViewApp](self, "_draggingSplitViewApp"))
    {
      v47 = 14;
      goto LABEL_51;
    }
    v52 = -[SBMedusaWindowDragGestureDestinationModifier _layoutRoleForDraggedApp](self, "_layoutRoleForDraggedApp");
    v53 = objc_msgSend((id)*MEMORY[0x1E0CEB258], "userInterfaceLayoutDirection");
    v54 = 2;
    if (v53 == 1)
      v54 = 1;
    v55 = v52 == v54;
    v56 = 11;
    goto LABEL_41;
  }
  v49 = v77;
  v48 = v78;
  if (!v76 || ((v75 ^ 1) & 1) != 0)
    goto LABEL_36;
  if ((v74 & 1) == 0)
  {
    if (!-[SBMedusaWindowDragGestureDestinationModifier _draggingFullScreenApp](self, "_draggingFullScreenApp"))
    {
      if (self->_enteredPlatterZone)
      {
LABEL_45:
        if (v83)
          v47 = 1;
        else
          v47 = 10;
        if (v83 || v25)
          goto LABEL_51;
        goto LABEL_49;
      }
      if (-[SBMedusaWindowDragGestureDestinationModifier _layoutRoleForDraggedApp](self, "_layoutRoleForDraggedApp") != 4)
      {
LABEL_49:
        v51 = v49[2](v49);
        goto LABEL_50;
      }
LABEL_67:
      v47 = 10;
      goto LABEL_51;
    }
LABEL_36:
    v47 = !v83;
    goto LABEL_51;
  }
  if (self->_enteredPlatterZone)
    goto LABEL_31;
  v60 = -[SBMedusaWindowDragGestureDestinationModifier _layoutRoleForDraggedApp](self, "_layoutRoleForDraggedApp");
  if (v60 == 4)
    goto LABEL_67;
  if (v60 == 3)
    goto LABEL_49;
  if (-[SBMedusaWindowDragGestureDestinationModifier _draggingFullScreenApp](self, "_draggingFullScreenApp"))
  {
LABEL_34:
    v47 = 0;
    goto LABEL_51;
  }
  if (!-[SBMedusaWindowDragGestureDestinationModifier _shouldMinimizeOrEnterSplitHomeScreen](self, "_shouldMinimizeOrEnterSplitHomeScreen")&& self->_gesturePhase >= 3)
  {
    x = v82;
  }
  v61 = v7 * 0.5;
  currentDestination = self->_currentDestination;
  if (currentDestination == 5)
  {
    v63 = -100.0;
  }
  else
  {
    if (currentDestination != 4)
      goto LABEL_70;
    v63 = 100.0;
  }
  v61 = v7 * 0.5 + v63;
LABEL_70:
  -[SBMedusaWindowDragGestureDestinationModifier _dismissRightBoundary](self, "_dismissRightBoundary");
  if (x > v64)
  {
    v65 = -[SBMedusaWindowDragGestureDestinationModifier _layoutRoleForDraggedApp](self, "_layoutRoleForDraggedApp");
    v66 = objc_msgSend((id)*MEMORY[0x1E0CEB258], "userInterfaceLayoutDirection");
    v67 = 2;
    if (v66 == 1)
      v67 = 1;
    if (v65 == v67)
    {
      v47 = 12;
      goto LABEL_51;
    }
  }
  -[SBMedusaWindowDragGestureDestinationModifier _dismissLeftBoundary](self, "_dismissLeftBoundary");
  if (x < v68)
  {
    v69 = -[SBMedusaWindowDragGestureDestinationModifier _layoutRoleForDraggedApp](self, "_layoutRoleForDraggedApp");
    v70 = objc_msgSend((id)*MEMORY[0x1E0CEB258], "userInterfaceLayoutDirection");
    v71 = 2;
    if (v70 != 1)
      v71 = 1;
    if (v69 == v71)
    {
      v47 = 11;
      goto LABEL_51;
    }
  }
  v72 = -[SBMedusaWindowDragGestureDestinationModifier isRTLEnabled](self, "isRTLEnabled");
  v73 = x < v61;
  if (v72)
    v73 = x >= v61;
  v55 = !v73;
  v56 = 4;
LABEL_41:
  if (v55)
    v47 = v56 + 1;
  else
    v47 = v56;
LABEL_51:
  if (self->_currentDestination != v47)
  {
    self->_currentDestination = v47;
    -[SBMedusaWindowDragGestureDestinationModifier _transitionRequestForDestination:complete:](self, "_transitionRequestForDestination:complete:", v47, 0);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "appLayout");
    v58 = (SBAppLayout *)objc_claimAutoreleasedReturnValue();
    proposedAppLayout = self->_proposedAppLayout;
    self->_proposedAppLayout = v58;

  }
}

uint64_t __72__SBMedusaWindowDragGestureDestinationModifier__updateCurrentDropAction__block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  _QWORD *v4;
  uint64_t v5;
  double v6;
  double v7;
  void *v8;
  unint64_t v9;

  objc_msgSend(*(id *)(a1 + 32), "_contentDraggingFloatingActivationWidth");
  v3 = v2;
  v4 = *(_QWORD **)(a1 + 32);
  v5 = v4[15];
  v6 = *(double *)(a1 + 40);
  v7 = *(double *)(a1 + 88);
  objc_msgSend(v4, "medusaSettings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = SBFloatingConfigurationForMovingFloatingApplication(v5, v8, v6, *(CGFloat *)(a1 + 56), *(CGFloat *)(a1 + 64), *(CGFloat *)(a1 + 72), *(CGFloat *)(a1 + 80), v3, v7);

  if (v9 > 4)
    return 0;
  else
    return qword_1D0E89378[v9];
}

uint64_t __72__SBMedusaWindowDragGestureDestinationModifier__updateCurrentDropAction__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "containsItem:", *(_QWORD *)(a1 + 32));
}

uint64_t __72__SBMedusaWindowDragGestureDestinationModifier__updateCurrentDropAction__block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGFloat v12;
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
  double v25;
  CGFloat v26;
  int v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double MinX;
  CGFloat v33;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  _BOOL4 v38;
  BOOL v39;
  _BOOL4 v40;
  BOOL v41;
  uint64_t v42;
  double v43;
  int v44;
  double v45;
  double v46;
  _BOOL4 v47;
  BOOL v48;
  uint64_t v49;
  double v50;
  void *v51;
  BOOL v52;
  uint64_t v53;
  _BOOL4 v55;
  double v56;
  double v57;
  BOOL v58;
  CGFloat MinY;
  CGFloat MaxX;
  CGFloat v61;
  CGFloat v62;
  CGFloat v63;
  CGFloat v64;
  CGFloat v65;
  CGFloat v66;
  CGFloat v67;
  CGFloat v68;
  CGRect v69;
  CGRect v70;
  CGRect v71;
  CGRect v72;
  CGRect v73;
  CGRect v74;
  CGRect v75;
  CGRect v76;
  CGRect v77;

  if (objc_msgSend(*(id *)(a1 + 32), "_draggingFullScreenApp"))
  {
    if (*(_BYTE *)(a1 + 128))
    {
      v2 = 0;
      goto LABEL_35;
    }
    if (*(_BYTE *)(a1 + 129))
    {
      v44 = objc_msgSend(*(id *)(a1 + 32), "isRTLEnabled");
      v45 = *(double *)(a1 + 48);
      v46 = *(double *)(a1 + 80) * 0.5;
      v47 = v45 < v46;
      if (v44)
        v47 = v45 >= v46;
      v48 = !v47;
      goto LABEL_29;
    }
LABEL_34:
    v2 = 1;
    goto LABEL_35;
  }
  if (!objc_msgSend(*(id *)(a1 + 40), "isSplitConfiguration"))
  {
    if (*(_BYTE *)(a1 + 129))
    {
      v43 = *(double *)(a1 + 96);
      if (v43 < CGRectGetMinX(*(CGRect *)(a1 + 64)) + *(double *)(a1 + 112))
      {
        v41 = objc_msgSend(*(id *)(a1 + 32), "isRTLEnabled") == 0;
        v42 = 4;
        goto LABEL_18;
      }
      v50 = *(double *)(a1 + 96);
      if (v50 > CGRectGetMaxX(*(CGRect *)(a1 + 64)) - *(double *)(a1 + 112))
      {
        v48 = objc_msgSend(*(id *)(a1 + 32), "isRTLEnabled") == 0;
LABEL_29:
        v49 = 4;
        goto LABEL_30;
      }
    }
    if (*(_BYTE *)(a1 + 128))
      goto LABEL_34;
    if (!*(_BYTE *)(a1 + 132))
    {
LABEL_61:
      v2 = *(_QWORD *)(a1 + 120);
      goto LABEL_35;
    }
LABEL_49:
    v2 = 10;
    goto LABEL_35;
  }
  objc_msgSend(*(id *)(a1 + 32), "containerViewBounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  objc_msgSend(*(id *)(a1 + 32), "frameForLayoutRole:inAppLayout:withBounds:", 1, *(_QWORD *)(a1 + 40));
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  objc_msgSend(*(id *)(a1 + 32), "frameForLayoutRole:inAppLayout:withBounds:", 2, *(_QWORD *)(a1 + 40), v4, v6, v8, v10);
  v20 = v19;
  v22 = v21;
  v24 = v23;
  v26 = v25;
  v27 = objc_msgSend(*(id *)(a1 + 32), "isRTLEnabled");
  v28 = v12;
  v63 = v14;
  v64 = v12;
  v67 = v22;
  v68 = v20;
  if (v27)
    v12 = v20;
  v29 = v14;
  if (v27)
    v14 = v22;
  v30 = v16;
  v61 = v18;
  v62 = v16;
  v65 = v26;
  v66 = v24;
  if (v27)
    v16 = v24;
  v31 = v18;
  if (v27)
  {
    v18 = v26;
    v20 = v28;
    v22 = v29;
    v24 = v30;
    v26 = v31;
  }
  v69.origin.x = v12;
  v69.origin.y = v14;
  v69.size.width = v16;
  v69.size.height = v18;
  MaxX = CGRectGetMaxX(v69);
  v70.origin.x = v12;
  v70.origin.y = v14;
  v70.size.width = v16;
  v70.size.height = v18;
  MinY = CGRectGetMinY(v70);
  v71.origin.x = v20;
  v71.origin.y = v22;
  v71.size.width = v24;
  v71.size.height = v26;
  MinX = CGRectGetMinX(v71);
  v72.origin.x = v12;
  v72.origin.y = v14;
  v72.size.width = v16;
  v72.size.height = v18;
  v33 = MinX - CGRectGetMaxX(v72);
  v73.origin.x = v12;
  v73.origin.y = v14;
  v73.size.width = v16;
  v73.size.height = v18;
  v74.size.height = CGRectGetHeight(v73);
  v74.origin.y = MinY;
  v74.origin.x = MaxX;
  v74.size.width = v33;
  v75 = CGRectInset(v74, -50.0, 0.0);
  x = v75.origin.x;
  y = v75.origin.y;
  width = v75.size.width;
  height = v75.size.height;
  v75.origin.y = v63;
  v75.origin.x = v64;
  v75.size.height = v61;
  v75.size.width = v62;
  v38 = CGRectContainsPoint(v75, *(CGPoint *)(a1 + 96));
  v76.origin.y = v67;
  v76.origin.x = v68;
  v76.size.height = v65;
  v76.size.width = v66;
  v39 = CGRectContainsPoint(v76, *(CGPoint *)(a1 + 96));
  v77.origin.x = x;
  v77.origin.y = y;
  v77.size.width = width;
  v77.size.height = height;
  v40 = CGRectContainsPoint(v77, *(CGPoint *)(a1 + 96));
  if (*(_BYTE *)(a1 + 130))
  {
    v41 = objc_msgSend(*(id *)(a1 + 32), "isRTLEnabled") == 0;
    v42 = 6;
    goto LABEL_18;
  }
  if (*(_BYTE *)(a1 + 131))
  {
    v48 = objc_msgSend(*(id *)(a1 + 32), "isRTLEnabled") == 0;
    v49 = 6;
    goto LABEL_30;
  }
  v55 = v40;
  v56 = *(double *)(a1 + 96);
  if (v56 < CGRectGetMinX(*(CGRect *)(a1 + 64)) + *(double *)(a1 + 112))
  {
    v41 = objc_msgSend(*(id *)(a1 + 32), "isRTLEnabled") == 0;
    v42 = 2;
LABEL_18:
    if (v41)
      v2 = v42;
    else
      v2 = v42 + 1;
    goto LABEL_35;
  }
  v57 = *(double *)(a1 + 96);
  if (v57 > CGRectGetMaxX(*(CGRect *)(a1 + 64)) - *(double *)(a1 + 112))
  {
    v48 = objc_msgSend(*(id *)(a1 + 32), "isRTLEnabled") == 0;
    v49 = 2;
LABEL_30:
    if (v48)
      v2 = v49 + 1;
    else
      v2 = v49;
    goto LABEL_35;
  }
  if (*(_BYTE *)(a1 + 128))
    goto LABEL_34;
  if (*(_BYTE *)(a1 + 132))
    goto LABEL_49;
  if (v55)
    goto LABEL_61;
  v58 = v38 || v39;
  v2 = v38 ? 2 : 3;
  if (!v58)
    goto LABEL_61;
LABEL_35:
  if (objc_msgSend(*(id *)(a1 + 32), "_draggingSlideOverApp", *(_QWORD *)&MinY))
  {
    objc_msgSend(*(id *)(a1 + 40), "itemForLayoutRole:", 4);
    v51 = (void *)objc_claimAutoreleasedReturnValue();

    if (v51)
    {
      v52 = v2 == 5 || v2 == 3;
      v53 = 7;
      if (!v52)
        v53 = v2;
      if (v2 == 4)
        v53 = 6;
      if (v2 == 2)
        return 6;
      else
        return v53;
    }
  }
  return v2;
}

- (int64_t)_layoutRoleForDraggedApp
{
  int64_t v3;
  _BOOL4 v4;
  SBAppLayout *selectedLeafAppLayout;
  SBAppLayout *initialMainAppLayout;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (-[SBAppLayout isOrContainsAppLayout:](self->_initialFloatingAppLayout, "isOrContainsAppLayout:", self->_selectedLeafAppLayout))
  {
    return 3;
  }
  v4 = -[SBAppLayout isOrContainsAppLayout:](self->_initialMainAppLayout, "isOrContainsAppLayout:", self->_selectedLeafAppLayout);
  selectedLeafAppLayout = self->_selectedLeafAppLayout;
  if (v4)
  {
    initialMainAppLayout = self->_initialMainAppLayout;
    -[SBAppLayout itemForLayoutRole:](selectedLeafAppLayout, "itemForLayoutRole:", 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = -[SBAppLayout layoutRoleForItem:](initialMainAppLayout, "layoutRoleForItem:", v7);
  }
  else
  {
    v3 = 0;
    -[SBAppLayout itemForLayoutRole:](selectedLeafAppLayout, "itemForLayoutRole:", 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    -[SBMedusaWindowDragGestureDestinationModifier draggingAppLayoutsForWindowDrag](self, "draggingAppLayoutsForWindowDrag", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v16;
      while (2)
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v16 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
          if (objc_msgSend(v13, "containsItem:", v7))
          {
            v3 = objc_msgSend(v13, "layoutRoleForItem:", v7);
            goto LABEL_15;
          }
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        if (v10)
          continue;
        break;
      }
    }
LABEL_15:

  }
  return v3;
}

- (BOOL)_draggingFullScreenApp
{
  return -[SBAppLayout isEqual:](self->_selectedLeafAppLayout, "isEqual:", self->_initialMainAppLayout);
}

- (BOOL)_draggingSplitViewApp
{
  int v3;
  void *v4;
  void *v5;

  if (-[SBAppLayout isOrContainsAppLayout:](self->_initialMainAppLayout, "isOrContainsAppLayout:", self->_selectedLeafAppLayout)&& !-[SBAppLayout isEqual:](self->_selectedLeafAppLayout, "isEqual:", self->_initialMainAppLayout))
  {
    -[SBAppLayout itemForLayoutRole:](self->_initialMainAppLayout, "itemForLayoutRole:", 4);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBAppLayout itemForLayoutRole:](self->_selectedLeafAppLayout, "itemForLayoutRole:", 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v4, "isEqual:", v5) ^ 1;

  }
  else
  {
    LOBYTE(v3) = 0;
  }
  return v3;
}

- (BOOL)_draggingSlideOverApp
{
  return -[SBAppLayout isEqual:](self->_selectedLeafAppLayout, "isEqual:", self->_initialFloatingAppLayout);
}

- (BOOL)_draggingCenterWindow
{
  void *v3;
  void *v4;
  char v5;

  -[SBAppLayout itemForLayoutRole:](self->_initialMainAppLayout, "itemForLayoutRole:", 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBAppLayout itemForLayoutRole:](self->_selectedLeafAppLayout, "itemForLayoutRole:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqual:", v4);

  return v5;
}

- (CGRect)_universalCenterZone
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  -[SBMedusaWindowDragGestureDestinationModifier switcherViewBounds](self, "switcherViewBounds");
  UIRectGetCenter();
  UIRectCenteredAboutPoint();
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (CGRect)_leftFloatingZoneForCenterWindow
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
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  double Height;
  double v21;
  double v22;
  double v23;
  CGFloat rect;
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect result;

  -[SBMedusaWindowDragGestureDestinationModifier switcherViewBounds](self, "switcherViewBounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[SBMedusaWindowDragGestureDestinationModifier _universalCenterZone](self, "_universalCenterZone");
  rect = v11;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v25.origin.x = v4;
  v25.origin.y = v6;
  v25.size.width = v8;
  v25.size.height = v10;
  v18 = CGRectGetWidth(v25) * 0.25;
  v26.origin.x = rect;
  v26.origin.y = v13;
  v26.size.width = v15;
  v26.size.height = v17;
  v19 = CGRectGetMinX(v26) - v18;
  v27.origin.x = v4;
  v27.origin.y = v6;
  v27.size.width = v8;
  v27.size.height = v10;
  Height = CGRectGetHeight(v27);
  v21 = 0.0;
  v22 = v19;
  v23 = v18;
  result.size.height = Height;
  result.size.width = v23;
  result.origin.y = v21;
  result.origin.x = v22;
  return result;
}

- (CGRect)_rightFloatingZoneForCenterWindow
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
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  CGFloat MaxX;
  double Height;
  double v21;
  double v22;
  double v23;
  CGFloat v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect result;

  -[SBMedusaWindowDragGestureDestinationModifier switcherViewBounds](self, "switcherViewBounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[SBMedusaWindowDragGestureDestinationModifier _universalCenterZone](self, "_universalCenterZone");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v25.origin.x = v4;
  v25.origin.y = v6;
  v25.size.width = v8;
  v25.size.height = v10;
  v24 = CGRectGetWidth(v25) * 0.25;
  v26.origin.x = v12;
  v26.origin.y = v14;
  v26.size.width = v16;
  v26.size.height = v18;
  MaxX = CGRectGetMaxX(v26);
  v27.origin.x = v4;
  v27.origin.y = v6;
  v27.size.width = v8;
  v27.size.height = v10;
  Height = CGRectGetHeight(v27);
  v21 = 0.0;
  v22 = MaxX;
  v23 = v24;
  result.size.height = Height;
  result.size.width = v23;
  result.origin.y = v21;
  result.origin.x = v22;
  return result;
}

- (double)_sideActivationGutterSize
{
  void *v2;
  double v3;
  double v4;

  -[SBMedusaWindowDragGestureDestinationModifier medusaSettings](self, "medusaSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "draggingPlatterSideActivationGutterPadding");
  v4 = v3;

  return v4;
}

- (CGSize)_fullscreenActivationRegionSize
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  double v9;
  CGSize result;

  v3 = 0x4062C00000000000;
  v4 = 0x4062C00000000000;
  if (!-[SBMedusaWindowDragGestureDestinationModifier _draggingFullScreenApp](self, "_draggingFullScreenApp"))
  {
    -[SBMedusaWindowDragGestureDestinationModifier medusaSettings](self, "medusaSettings");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "draggingPlatterFullscreenActivationRegionWidth");
    v3 = v6;
    objc_msgSend(v5, "draggingPlatterFullscreenActivationRegionHeight");
    v4 = v7;

  }
  v8 = *(double *)&v3;
  v9 = *(double *)&v4;
  result.height = v9;
  result.width = v8;
  return result;
}

- (double)_contentDraggingCommandeerWidth
{
  void *v2;
  double v3;
  double v4;

  -[SBMedusaWindowDragGestureDestinationModifier medusaSettings](self, "medusaSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contentDraggingCommandeerGutterWidth");
  v4 = v3;

  return v4;
}

- (double)_contentDraggingSideActivationWidth
{
  void *v2;
  double v3;
  double v4;

  -[SBMedusaWindowDragGestureDestinationModifier medusaSettings](self, "medusaSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contentDraggingSideActivationGutterWidth");
  v4 = v3;

  return v4;
}

- (double)_contentDraggingFloatingActivationWidth
{
  void *v2;
  double v3;
  double v4;

  -[SBMedusaWindowDragGestureDestinationModifier medusaSettings](self, "medusaSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contentDraggingFloatingActivationGutterWidth");
  v4 = v3;

  return v4;
}

- (double)_dismissLeftBoundary
{
  void *v2;
  double v3;
  double v4;

  -[SBMedusaWindowDragGestureDestinationModifier medusaSettings](self, "medusaSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "windowSplitViewDismissalGutterWidth");
  v4 = v3;

  return v4;
}

- (double)_dismissRightBoundary
{
  double v3;
  double v4;
  void *v5;
  double v6;
  double v7;

  -[SBMedusaWindowDragGestureDestinationModifier containerViewBounds](self, "containerViewBounds");
  v4 = v3;
  -[SBMedusaWindowDragGestureDestinationModifier medusaSettings](self, "medusaSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "windowSplitViewDismissalGutterWidth");
  v7 = v4 - v6;

  return v7;
}

- (BOOL)_isDragOverFullscreenRegionAtLocation:(CGPoint)a3 inBounds:(CGRect)a4
{
  CGFloat y;
  CGFloat x;
  CGPoint v7;
  CGRect v8;

  y = a3.y;
  x = a3.x;
  -[SBMedusaWindowDragGestureDestinationModifier _fullscreenActivationRegionSize](self, "_fullscreenActivationRegionSize");
  SBRectWithSize();
  UIRectCenteredXInRect();
  v7.x = x;
  v7.y = y;
  return CGRectContainsPoint(v8, v7);
}

- (BOOL)_isDragOverSideGutterRegionsAtLocation:(CGPoint)a3 inBounds:(CGRect)a4 totalContentDragGutterWidth:(double)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v10;
  _BOOL4 v11;
  BOOL v12;
  CGPoint v14;
  CGRect v15;
  CGRect v16;
  CGRect v17;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v14.y = a3.y;
  v10 = a3.x;
  v15.origin.x = a4.origin.x;
  v15.origin.y = a4.origin.y;
  v15.size.width = a4.size.width;
  v15.size.height = height;
  v14.x = v10;
  v11 = CGRectContainsPoint(v15, v14);
  if (v11)
  {
    v16.origin.x = x;
    v16.origin.y = y;
    v16.size.width = width;
    v16.size.height = height;
    v12 = v10 < CGRectGetMinX(v16) + a5;
    v17.origin.x = x;
    v17.origin.y = y;
    v17.size.width = width;
    v17.size.height = height;
    LOBYTE(v11) = v10 > CGRectGetMaxX(v17) - a5 || v12;
  }
  return v11;
}

- (BOOL)_shouldMinimizeOrEnterSplitHomeScreen
{
  double height;
  _BOOL4 v4;
  CGRect v6;

  -[SBMedusaWindowDragGestureDestinationModifier switcherViewBounds](self, "switcherViewBounds");
  height = v6.size.height;
  v4 = CGRectContainsPoint(v6, self->_location);
  if (v4)
    LOBYTE(v4) = !self->_enteredPlatterZone && self->_location.y + self->_velocity.y * 0.15 > height * 0.5;
  return v4;
}

- (id)_transitionRequestForDestination:(unint64_t)a3 complete:(BOOL)a4
{
  _BOOL4 v4;
  SBMutableSwitcherTransitionRequest *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  SBAppLayout *v12;
  SBAppLayout *initialMainAppLayout;
  void *v14;
  void *v15;
  void *v16;
  SBMutableSwitcherTransitionRequest *v17;
  uint64_t v18;
  SBMutableSwitcherTransitionRequest *v19;
  SBAppLayout *v20;
  SBAppLayout *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  SBAppLayout *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  SBAppLayout *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  SBMutableSwitcherTransitionRequest *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  int64_t v42;
  SBMutableSwitcherTransitionRequest *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t *v47;
  void *v48;
  int64_t v49;
  SBAppLayout *v50;
  void *v51;
  void *v52;
  void *v53;
  SBMutableSwitcherTransitionRequest *v54;
  uint64_t v55;
  void *v56;
  _BOOL8 v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  id v64;
  void *v65;
  _QWORD v67[5];
  _QWORD v68[5];
  _QWORD v69[5];
  _QWORD v70[6];
  _QWORD v71[3];
  _QWORD v72[4];

  v4 = a4;
  v72[3] = *MEMORY[0x1E0C80C00];
  v8 = objc_alloc_init(SBMutableSwitcherTransitionRequest);
  if (-[SBMedusaWindowDragGestureDestinationModifier _draggingFullScreenApp](self, "_draggingFullScreenApp"))
  {
    switch(a3)
    {
      case 0uLL:
      case 1uLL:
        -[SBAppLayout appLayoutByModifyingEnvironment:](self->_selectedLeafAppLayout, "appLayoutByModifyingEnvironment:", 1);
        v12 = (SBAppLayout *)objc_claimAutoreleasedReturnValue();
        v19 = v8;
        v20 = v12;
        goto LABEL_41;
      case 2uLL:
      case 3uLL:
      case 6uLL:
      case 7uLL:
      case 8uLL:
      case 9uLL:
      case 0xAuLL:
      case 0xBuLL:
      case 0xCuLL:
      case 0xDuLL:
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        SBStringForWindowDragGestureDestination(a3);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBMedusaWindowDragGestureDestinationModifier.m"), 775, CFSTR("Unsupported destination when dragging fullscreen app: %@"), v10);

        goto LABEL_4;
      case 4uLL:
        -[SBAppLayout appLayoutByModifyingEnvironment:](self->_selectedLeafAppLayout, "appLayoutByModifyingEnvironment:", 1);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "appLayoutByModifyingConfiguration:", 3);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        -[SBSwitcherTransitionRequest setAppLayout:](v8, "setAppLayout:", v9);
        v38 = v8;
        v39 = 2;
        goto LABEL_25;
      case 5uLL:
        -[SBAppLayout appLayoutByModifyingEnvironment:](self->_selectedLeafAppLayout, "appLayoutByModifyingEnvironment:", 1);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "appLayoutByModifyingConfiguration:", 3);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        -[SBSwitcherTransitionRequest setAppLayout:](v8, "setAppLayout:", v9);
        v38 = v8;
        v39 = 3;
LABEL_25:
        -[SBSwitcherTransitionRequest setPeekConfiguration:](v38, "setPeekConfiguration:", v39);
LABEL_4:

        break;
      case 0xEuLL:
        +[SBAppLayout homeScreenAppLayout](SBAppLayout, "homeScreenAppLayout");
        v12 = (SBAppLayout *)objc_claimAutoreleasedReturnValue();
        -[SBAppLayout appLayoutByModifyingPreferredDisplayOrdinal:](v12, "appLayoutByModifyingPreferredDisplayOrdinal:", -[SBMedusaWindowDragGestureDestinationModifier displayOrdinal](self, "displayOrdinal"));
        v41 = objc_claimAutoreleasedReturnValue();
        goto LABEL_50;
      default:
        break;
    }
  }
  else
  {
    v11 = MEMORY[0x1E0C809B0];
    v70[0] = MEMORY[0x1E0C809B0];
    v70[1] = 3221225472;
    v70[2] = __90__SBMedusaWindowDragGestureDestinationModifier__transitionRequestForDestination_complete___block_invoke;
    v70[3] = &unk_1E8EAA0B8;
    v70[4] = self;
    v70[5] = a2;
    v12 = (SBAppLayout *)MEMORY[0x1D17E5550](v70);
    switch(a3)
    {
      case 0uLL:
        goto LABEL_40;
      case 1uLL:
        -[SBAppLayout appLayoutByModifyingEnvironment:](self->_selectedLeafAppLayout, "appLayoutByModifyingEnvironment:", 1);
        v41 = objc_claimAutoreleasedReturnValue();
        goto LABEL_50;
      case 2uLL:
      case 4uLL:
        if (self->_gesturePhase == 3
          && -[SBMedusaWindowDragGestureDestinationModifier _shouldMinimizeOrEnterSplitHomeScreen](self, "_shouldMinimizeOrEnterSplitHomeScreen"))
        {
          initialMainAppLayout = self->_initialMainAppLayout;
          v69[0] = v11;
          v69[1] = 3221225472;
          v69[2] = __90__SBMedusaWindowDragGestureDestinationModifier__transitionRequestForDestination_complete___block_invoke_2;
          v69[3] = &unk_1E8E9DF50;
          v69[4] = self;
          -[SBAppLayout appLayoutWithItemsPassingTest:](initialMainAppLayout, "appLayoutWithItemsPassingTest:", v69);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[SBSwitcherTransitionRequest setAppLayout:](v8, "setAppLayout:", v14);

          -[SBSwitcherTransitionRequest appLayout](v8, "appLayout");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "appLayoutByModifyingConfiguration:", -[SBAppLayout configuration](self->_initialMainAppLayout, "configuration"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[SBSwitcherTransitionRequest setAppLayout:](v8, "setAppLayout:", v16);

          v17 = v8;
          v18 = 3;
          goto LABEL_13;
        }
        v25 = -[SBAppLayout configuration](self->_initialMainAppLayout, "configuration");
        if (-[SBMedusaWindowDragGestureDestinationModifier _draggingSplitViewApp](self, "_draggingSplitViewApp"))
        {
          v26 = self->_initialMainAppLayout;
          -[SBAppLayout itemForLayoutRole:](self->_selectedLeafAppLayout, "itemForLayoutRole:", 1);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = -[SBAppLayout layoutRoleForItem:](v26, "layoutRoleForItem:", v27);

          if (v28 != 1 && SBLayoutRoleIsValidForSplitView(v28))
            v25 = ((uint64_t (*)(SBAppLayout *, uint64_t, uint64_t))v12->_cachedHash)(v12, v25, -[SBMedusaWindowDragGestureDestinationModifier switcherInterfaceOrientation](self, "switcherInterfaceOrientation"));
        }
        -[SBAppLayout appLayoutByModifyingConfiguration:](self->_currentAppLayout, "appLayoutByModifyingConfiguration:", v25);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "appLayoutByInsertingLeafAppLayout:inRole:", self->_selectedLeafAppLayout, 1);
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_51;
      case 3uLL:
      case 5uLL:
        if (self->_gesturePhase != 3
          || !-[SBMedusaWindowDragGestureDestinationModifier _shouldMinimizeOrEnterSplitHomeScreen](self, "_shouldMinimizeOrEnterSplitHomeScreen"))
        {
          v31 = -[SBAppLayout configuration](self->_initialMainAppLayout, "configuration");
          if (-[SBMedusaWindowDragGestureDestinationModifier _draggingSplitViewApp](self, "_draggingSplitViewApp"))
          {
            v32 = self->_initialMainAppLayout;
            -[SBAppLayout itemForLayoutRole:](self->_selectedLeafAppLayout, "itemForLayoutRole:", 1);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            v34 = -[SBAppLayout layoutRoleForItem:](v32, "layoutRoleForItem:", v33);

            if (v34 == 1)
              v31 = ((uint64_t (*)(SBAppLayout *, uint64_t, uint64_t))v12->_cachedHash)(v12, v31, -[SBMedusaWindowDragGestureDestinationModifier switcherInterfaceOrientation](self, "switcherInterfaceOrientation"));
          }
          -[SBAppLayout appLayoutByModifyingConfiguration:](self->_currentAppLayout, "appLayoutByModifyingConfiguration:", v31);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "appLayoutByInsertingLeafAppLayout:inRole:", self->_selectedLeafAppLayout, 2);
          v36 = objc_claimAutoreleasedReturnValue();
          goto LABEL_54;
        }
        v21 = self->_initialMainAppLayout;
        v68[0] = v11;
        v68[1] = 3221225472;
        v68[2] = __90__SBMedusaWindowDragGestureDestinationModifier__transitionRequestForDestination_complete___block_invoke_3;
        v68[3] = &unk_1E8E9DF50;
        v68[4] = self;
        -[SBAppLayout appLayoutWithItemsPassingTest:](v21, "appLayoutWithItemsPassingTest:", v68);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[SBSwitcherTransitionRequest setAppLayout:](v8, "setAppLayout:", v22);

        -[SBSwitcherTransitionRequest appLayout](v8, "appLayout");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "appLayoutByModifyingConfiguration:", -[SBAppLayout configuration](self->_initialMainAppLayout, "configuration"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[SBSwitcherTransitionRequest setAppLayout:](v8, "setAppLayout:", v24);

        v17 = v8;
        v18 = 2;
LABEL_13:
        -[SBSwitcherTransitionRequest setPeekConfiguration:](v17, "setPeekConfiguration:", v18);
        break;
      case 6uLL:
        if (-[SBAppLayout isOrContainsAppLayout:](self->_currentAppLayout, "isOrContainsAppLayout:", self->_selectedLeafAppLayout))
        {
          v42 = 1;
        }
        else
        {
          v42 = -[SBAppLayout configuration](self->_currentAppLayout, "configuration");
        }
        -[SBAppLayout appLayoutByModifyingConfiguration:](self->_currentAppLayout, "appLayoutByModifyingConfiguration:", v42);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "appLayoutByInsertingLeafAppLayout:inRole:", self->_selectedLeafAppLayout, 3);
        v52 = (void *)objc_claimAutoreleasedReturnValue();

        -[SBSwitcherTransitionRequest setAppLayout:](v8, "setAppLayout:", v52);
        v54 = v8;
        v55 = 1;
        goto LABEL_59;
      case 7uLL:
        if (-[SBAppLayout isOrContainsAppLayout:](self->_currentAppLayout, "isOrContainsAppLayout:", self->_selectedLeafAppLayout))
        {
          v49 = 1;
        }
        else
        {
          v49 = -[SBAppLayout configuration](self->_currentAppLayout, "configuration");
        }
        -[SBAppLayout appLayoutByModifyingConfiguration:](self->_currentAppLayout, "appLayoutByModifyingConfiguration:", v49);
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "appLayoutByInsertingLeafAppLayout:inRole:", self->_selectedLeafAppLayout, 3);
        v52 = (void *)objc_claimAutoreleasedReturnValue();

        -[SBSwitcherTransitionRequest setAppLayout:](v8, "setAppLayout:", v52);
        v54 = v8;
        v55 = 2;
LABEL_59:
        -[SBSwitcherTransitionRequest setFloatingConfiguration:](v54, "setFloatingConfiguration:", v55);
        goto LABEL_60;
      case 8uLL:
        -[SBSwitcherTransitionRequest setAppLayout:](v8, "setAppLayout:", self->_currentAppLayout);
        v43 = v8;
        v44 = 3;
        goto LABEL_32;
      case 9uLL:
        -[SBSwitcherTransitionRequest setAppLayout:](v8, "setAppLayout:", self->_currentAppLayout);
        v43 = v8;
        v44 = 4;
LABEL_32:
        -[SBSwitcherTransitionRequest setFloatingConfiguration:](v43, "setFloatingConfiguration:", v44);
        break;
      case 0xAuLL:
        if (self->_gesturePhase == 3
          && -[SBMedusaWindowDragGestureDestinationModifier _shouldMinimizeOrEnterSplitHomeScreen](self, "_shouldMinimizeOrEnterSplitHomeScreen"))
        {
          v50 = self->_initialMainAppLayout;
          v67[0] = v11;
          v67[1] = 3221225472;
          v67[2] = __90__SBMedusaWindowDragGestureDestinationModifier__transitionRequestForDestination_complete___block_invoke_4;
          v67[3] = &unk_1E8E9DF50;
          v67[4] = self;
          -[SBAppLayout appLayoutWithItemsPassingTest:](v50, "appLayoutWithItemsPassingTest:", v67);
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          -[SBSwitcherTransitionRequest setAppLayout:](v8, "setAppLayout:", v51);

          -[SBAppLayout itemForLayoutRole:](self->_selectedLeafAppLayout, "itemForLayoutRole:", 1);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "bundleIdentifier");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          -[SBSwitcherTransitionRequest setBundleIdentifierForAppExpose:](v8, "setBundleIdentifierForAppExpose:", v48);
LABEL_43:

          goto LABEL_52;
        }
        -[SBAppLayout appLayoutByInsertingLeafAppLayout:inRole:](self->_currentAppLayout, "appLayoutByInsertingLeafAppLayout:inRole:", self->_selectedLeafAppLayout, 4);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "appLayoutByModifyingConfiguration:", 1);
        v36 = objc_claimAutoreleasedReturnValue();
LABEL_54:
        v52 = (void *)v36;

        -[SBSwitcherTransitionRequest setAppLayout:](v8, "setAppLayout:", v52);
LABEL_60:

        break;
      case 0xBuLL:
        if (self->_gesturePhase != 3)
          goto LABEL_40;
        v45 = objc_msgSend((id)*MEMORY[0x1E0CEB258], "userInterfaceLayoutDirection");
        v46 = &SBLayoutRoleSide;
        v47 = &SBLayoutRolePrimary;
        goto LABEL_37;
      case 0xCuLL:
        if (self->_gesturePhase == 3)
        {
          v45 = objc_msgSend((id)*MEMORY[0x1E0CEB258], "userInterfaceLayoutDirection");
          v46 = &SBLayoutRolePrimary;
          v47 = &SBLayoutRoleSide;
LABEL_37:
          if (v45 == 1)
            v46 = v47;
          -[SBAppLayout leafAppLayoutForRole:](self->_initialMainAppLayout, "leafAppLayoutForRole:", *v46);
          v41 = objc_claimAutoreleasedReturnValue();
LABEL_50:
          v30 = (void *)v41;
LABEL_51:
          -[SBSwitcherTransitionRequest setAppLayout:](v8, "setAppLayout:", v30);
LABEL_52:

        }
        else
        {
LABEL_40:
          v20 = self->_initialMainAppLayout;
          v19 = v8;
LABEL_41:
          -[SBSwitcherTransitionRequest setAppLayout:](v19, "setAppLayout:", v20);
        }
        break;
      case 0xDuLL:
        -[SBAppLayout appLayoutByRemovingItemInLayoutRole:](self->_currentAppLayout, "appLayoutByRemovingItemInLayoutRole:", 4);
        v41 = objc_claimAutoreleasedReturnValue();
        goto LABEL_50;
      case 0xEuLL:
        +[SBAppLayout homeScreenAppLayout](SBAppLayout, "homeScreenAppLayout");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "appLayoutByModifyingPreferredDisplayOrdinal:", -[SBMedusaWindowDragGestureDestinationModifier displayOrdinal](self, "displayOrdinal"));
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        -[SBSwitcherTransitionRequest setAppLayout:](v8, "setAppLayout:", v48);
        goto LABEL_43;
      default:
        break;
    }

  }
  v57 = !v4;
  -[SBSwitcherTransitionRequest setSceneUpdatesOnly:](v8, "setSceneUpdatesOnly:", v57);
  if (!v57)
  {
    v71[0] = *MEMORY[0x1E0DABF78];
    -[SBAppLayout itemForLayoutRole:](self->_selectedLeafAppLayout, "itemForLayoutRole:", 1);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "bundleIdentifier");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v72[0] = v59;
    v71[1] = *MEMORY[0x1E0DABF80];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v72[1] = v60;
    v71[2] = *MEMORY[0x1E0DABF88];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[SBSwitcherTransitionRequest peekConfiguration](v8, "peekConfiguration"));
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v72[2] = v61;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v72, v71, 3);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = (void *)MEMORY[0x1E0DA9D78];
    v64 = v62;
    objc_msgSend(v63, "sharedInstance");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "emitEvent:withPayload:", 51, v64);

  }
  return v8;
}

uint64_t __90__SBMedusaWindowDragGestureDestinationModifier__transitionRequestForDestination_complete___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  v5 = SBMainDisplayLayoutStateSpaceConfigurationFromAppLayoutConfiguration(a2);
  v6 = SBSpaceConfigurationForSpaceConfigurationAndInterfaceOrientation(v5, a3);
  switch(v6)
  {
    case 0:
    case 1:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = a1 + 32;
      v8 = *(_QWORD *)(a1 + 32);
      v9 = *(_QWORD *)(v10 + 8);
      SBStringForSpaceConfiguration(v6);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", v9, v8, CFSTR("SBMedusaWindowDragGestureDestinationModifier.m"), 793, CFSTR("Can't swap primary/side in space configuration: %@"), v11);

      break;
    case 2:
      v6 = 4;
      break;
    case 3:
      v6 = 3;
      break;
    case 4:
      v6 = 2;
      break;
    default:
      return SBAppLayoutConfigurationFromMainDisplayLayoutStateSpaceConfiguration(v6);
  }
  return SBAppLayoutConfigurationFromMainDisplayLayoutStateSpaceConfiguration(v6);
}

uint64_t __90__SBMedusaWindowDragGestureDestinationModifier__transitionRequestForDestination_complete___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  int v5;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 96);
  v3 = a2;
  objc_msgSend(v2, "itemForLayoutRole:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqual:", v4);

  return v5 ^ 1u;
}

uint64_t __90__SBMedusaWindowDragGestureDestinationModifier__transitionRequestForDestination_complete___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  int v5;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 96);
  v3 = a2;
  objc_msgSend(v2, "itemForLayoutRole:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqual:", v4);

  return v5 ^ 1u;
}

uint64_t __90__SBMedusaWindowDragGestureDestinationModifier__transitionRequestForDestination_complete___block_invoke_4(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  int v5;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 96);
  v3 = a2;
  objc_msgSend(v2, "itemForLayoutRole:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqual:", v4);

  return v5 ^ 1u;
}

- (BOOL)hasEnteredPlatterZone
{
  return self->_enteredPlatterZone;
}

- (unint64_t)currentDestination
{
  return self->_currentDestination;
}

- (SBAppLayout)currentAppLayout
{
  return self->_currentAppLayout;
}

- (SBAppLayout)proposedAppLayout
{
  return self->_proposedAppLayout;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proposedAppLayout, 0);
  objc_storeStrong((id *)&self->_currentAppLayout, 0);
  objc_storeStrong((id *)&self->_pendingEnterPlatterZoneResponse, 0);
  objc_destroyWeak((id *)&self->_dragDestinationDelegate);
  objc_storeStrong((id *)&self->_displayLink, 0);
  objc_storeStrong((id *)&self->_initialFloatingAppLayout, 0);
  objc_storeStrong((id *)&self->_initialMainAppLayout, 0);
  objc_storeStrong((id *)&self->_selectedLeafAppLayout, 0);
}

@end
