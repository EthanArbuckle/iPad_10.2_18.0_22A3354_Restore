@implementation SBContinuousExposeWindowDragSwitcherModifier

- (SBContinuousExposeWindowDragSwitcherModifier)initWithGestureID:(id)a3 initialAppLayout:(id)a4 selectedDisplayItem:(id)a5
{
  id v10;
  id v11;
  char *v12;
  SBSplitDisplayItemSwitcherModifier *v13;
  SBContinuousExposeWindowDragDestinationSwitcherModifier *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  SBContinuousExposeAutoLayoutController *v19;
  void *v20;
  void *v22;
  void *v23;
  objc_super v24;
  CAFrameRateRange v25;

  v10 = a4;
  v11 = a5;
  v24.receiver = self;
  v24.super_class = (Class)SBContinuousExposeWindowDragSwitcherModifier;
  v12 = -[SBGestureSwitcherModifier initWithGestureID:](&v24, sel_initWithGestureID_, a3);
  if (v12)
  {
    if (v11)
    {
      if (v10)
      {
LABEL_4:
        objc_storeStrong((id *)v12 + 32, a4);
        objc_storeStrong((id *)v12 + 33, a5);
        *(_OWORD *)(v12 + 136) = SBInvalidPoint;
        v12[192] = objc_msgSend(*((id *)v12 + 32), "containsItem:", *((_QWORD *)v12 + 33));
        v13 = -[SBSplitDisplayItemSwitcherModifier initWithDisplayItem:]([SBSplitDisplayItemSwitcherModifier alloc], "initWithDisplayItem:", *((_QWORD *)v12 + 33));
        objc_msgSend(v12, "addChildModifier:", v13);
        v14 = -[SBContinuousExposeWindowDragDestinationSwitcherModifier initWithSelectedDisplayItem:initialAppLayout:delegate:]([SBContinuousExposeWindowDragDestinationSwitcherModifier alloc], "initWithSelectedDisplayItem:initialAppLayout:delegate:", *((_QWORD *)v12 + 33), *((_QWORD *)v12 + 32), v12);
        v15 = (void *)*((_QWORD *)v12 + 28);
        *((_QWORD *)v12 + 28) = v14;

        objc_msgSend(v12, "addChildModifier:", *((_QWORD *)v12 + 28));
        v16 = objc_msgSend(objc_alloc(MEMORY[0x1E0DA9E08]), "initWithDefaultValues");
        v17 = (void *)*((_QWORD *)v12 + 27);
        *((_QWORD *)v12 + 27) = v16;

        objc_msgSend(*((id *)v12 + 27), "setResponse:", 0.36);
        objc_msgSend(*((id *)v12 + 27), "setDampingRatio:", 1.0);
        v18 = (void *)*((_QWORD *)v12 + 27);
        v25 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
        objc_msgSend(v18, "setFrameRateRange:highFrameRateReason:", 1114113, *(double *)&v25.minimum, *(double *)&v25.maximum, *(double *)&v25.preferred);
        v19 = objc_alloc_init(SBContinuousExposeAutoLayoutController);
        v20 = (void *)*((_QWORD *)v12 + 31);
        *((_QWORD *)v12 + 31) = v19;

        goto LABEL_5;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, v12, CFSTR("SBContinuousExposeWindowDragSwitcherModifier.m"), 60, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("selectedDisplayItem"));

      if (v10)
        goto LABEL_4;
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, v12, CFSTR("SBContinuousExposeWindowDragSwitcherModifier.m"), 61, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("initialAppLayout"));

    goto LABEL_4;
  }
LABEL_5:

  return (SBContinuousExposeWindowDragSwitcherModifier *)v12;
}

- (void)didMoveToParentModifier:(id)a3
{
  SBContinuousExposeAutoLayoutSpace *v5;
  SBContinuousExposeAutoLayoutSpace *initialAutoLayoutSpace;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBContinuousExposeWindowDragSwitcherModifier;
  -[SBChainableModifier didMoveToParentModifier:](&v7, sel_didMoveToParentModifier_);
  if (a3 && !self->_initialAutoLayoutSpace)
  {
    if (self->_initialAppLayout)
    {
      -[SBSwitcherModifier autoLayoutSpaceForAppLayout:](self, "autoLayoutSpaceForAppLayout:");
      v5 = (SBContinuousExposeAutoLayoutSpace *)objc_claimAutoreleasedReturnValue();
      initialAutoLayoutSpace = self->_initialAutoLayoutSpace;
      self->_initialAutoLayoutSpace = v5;

      objc_storeStrong((id *)&self->_previousAutoLayoutSpace, self->_initialAutoLayoutSpace);
    }
  }
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  id v5;
  id v6;
  id v7;
  id v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SBContinuousExposeWindowDragSwitcherModifier;
  -[SBGestureSwitcherModifier descriptionBuilderWithMultilinePrefix:](&v10, sel_descriptionBuilderWithMultilinePrefix_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "appendObject:withName:", self->_initialAppLayout, CFSTR("initialAppLayout"));
  v6 = (id)objc_msgSend(v4, "appendObject:withName:", self->_selectedDisplayItem, CFSTR("selectedDisplayItem"));
  v7 = (id)objc_msgSend(v4, "appendPoint:withName:", CFSTR("initialAnchorPoint"), self->_initialAnchorPoint.x, self->_initialAnchorPoint.y);
  v8 = (id)objc_msgSend(v4, "appendPoint:withName:", CFSTR("anchorPoint"), self->_anchorPoint.x, self->_anchorPoint.y);
  return v4;
}

- (SBAppLayout)proposedAppLayout
{
  return -[SBContinuousExposeWindowDragDestinationSwitcherModifier proposedAppLayout](self->_destinationModifier, "proposedAppLayout");
}

- (id)appLayoutByAddingAppLayout:(id)a3 toAppLayout:(id)a4
{
  return -[SBContinuousExposeWindowDragDestinationSwitcherModifier appLayoutByAddingAppLayout:toAppLayout:](self->_destinationModifier, "appLayoutByAddingAppLayout:toAppLayout:", a3, a4);
}

- (void)updateProposedAppLayoutWithAppLayout:(id)a3 andInitialAppLayout:(id)a4
{
  id v7;
  id v8;

  objc_storeStrong((id *)&self->_initialAppLayout, a4);
  v7 = a4;
  v8 = a3;
  -[SBContinuousExposeWindowDragDestinationSwitcherModifier updateProposedAppLayoutWithAppLayout:andInitialAppLayout:](self->_destinationModifier, "updateProposedAppLayoutWithAppLayout:andInitialAppLayout:", v8, v7);

}

- (CGPoint)preferredCenterForSelectedItemInDestinationModifier:(id)a3 clippingToInitialStageArea:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  void *v7;
  uint64_t v8;
  double x;
  double y;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  SBContinuousExposeAutoLayoutSpace *initialAutoLayoutSpace;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  double v29;
  double v30;
  double v31;
  CGPoint result;
  CGRect v33;
  CGRect v34;
  CGRect v35;

  v4 = a4;
  -[SBContinuousExposeWindowDragSwitcherModifier _appLayoutContainingDisplayItem:](self, "_appLayoutContainingDisplayItem:", self->_selectedDisplayItem);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBContinuousExposeWindowDragSwitcherModifier appLayouts](self, "appLayouts");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "indexOfObject:", v6);

  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    x = self->_location.x;
    y = self->_location.y;
  }
  else
  {
    -[SBContinuousExposeWindowDragSwitcherModifier frameForIndex:](self, "frameForIndex:", v8);
    v12 = v11;
    v14 = v13;
    -[SBContinuousExposeWindowDragSwitcherModifier scaleForIndex:](self, "scaleForIndex:", v8);
    x = self->_location.x + (0.5 - self->_anchorPoint.x) * (v15 * v12);
    y = self->_location.y + (0.5 - self->_anchorPoint.y) * (v15 * v14);
    if (v4)
    {
      initialAutoLayoutSpace = self->_initialAutoLayoutSpace;
      if (initialAutoLayoutSpace)
      {
        -[SBContinuousExposeAutoLayoutSpace stageArea](initialAutoLayoutSpace, "stageArea");
        v18 = v17;
        v20 = v19;
        v22 = v21;
        v24 = v23;
        -[SBContinuousExposeAutoLayoutSpace boundingBox](self->_initialAutoLayoutSpace, "boundingBox");
        v35.origin.x = v25;
        v35.origin.y = v26;
        v35.size.width = v27;
        v35.size.height = v28;
        v33.origin.x = v18;
        v33.origin.y = v20;
        v33.size.width = v22;
        v33.size.height = v24;
        v34 = CGRectUnion(v33, v35);
        v29 = v12 * 0.5 + v34.origin.x;
        if (x < v29)
          x = v29;
        if (y >= v34.origin.y + v34.size.height - v14 * 0.5)
          y = v34.origin.y + v34.size.height - v14 * 0.5;
      }
    }
  }

  v30 = x;
  v31 = y;
  result.y = v31;
  result.x = v30;
  return result;
}

- (id)handleEvent:(id)a3
{
  SBContinuousExposeWindowDragDestinationSwitcherModifier *destinationModifier;
  id v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  SBContinuousExposeAutoLayoutSpace *v13;
  SBContinuousExposeAutoLayoutSpace *previousAutoLayoutSpace;
  objc_super v16;

  destinationModifier = self->_destinationModifier;
  v5 = a3;
  -[SBContinuousExposeWindowDragDestinationSwitcherModifier proposedAppLayout](destinationModifier, "proposedAppLayout");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "containsItem:", self->_selectedDisplayItem);

  v16.receiver = self;
  v16.super_class = (Class)SBContinuousExposeWindowDragSwitcherModifier;
  -[SBGestureSwitcherModifier handleEvent:](&v16, sel_handleEvent_, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBContinuousExposeWindowDragDestinationSwitcherModifier proposedAppLayout](self->_destinationModifier, "proposedAppLayout");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "containsItem:", self->_selectedDisplayItem);

  if (v7 != v10)
  {
    -[SBContinuousExposeWindowDragSwitcherModifier _baseLayoutSettings](self, "_baseLayoutSettings");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBContinuousExposeWindowDragSwitcherModifier _beginAnimatingAnchorPointRampingPropertyWithMode:settings:](self, "_beginAnimatingAnchorPointRampingPropertyWithMode:settings:", 3, v11);

  }
  -[SBContinuousExposeWindowDragSwitcherModifier proposedAppLayout](self, "proposedAppLayout");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBSwitcherModifier autoLayoutSpaceForAppLayout:](self, "autoLayoutSpaceForAppLayout:", v12);
  v13 = (SBContinuousExposeAutoLayoutSpace *)objc_claimAutoreleasedReturnValue();
  previousAutoLayoutSpace = self->_previousAutoLayoutSpace;
  self->_previousAutoLayoutSpace = v13;

  return v8;
}

- (id)handleGestureEvent:(id)a3
{
  id v4;
  void *v5;
  CGPoint *p_location;
  CGFloat v7;
  CGFloat v8;
  int *v9;
  BOOL v10;
  uint64_t v11;
  uint64_t v12;
  int *v13;
  void *v14;
  void *v15;
  void *v16;
  CGFloat v17;
  CGFloat v18;
  uint64_t v19;
  char v20;
  void *v21;
  uint64_t v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double width;
  double height;
  void *v29;
  void *v30;
  double x;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  void *v42;
  void *v43;
  SBContinuousExposeAutoLayoutConfiguration *v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  void *v57;
  SBContinuousExposeAutoLayoutConfiguration *v58;
  void *v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  CGFloat v65;
  uint64_t v66;
  SBUpdateLayoutSwitcherEventResponse *v67;
  void *v68;
  SBUpdateLayoutSwitcherEventResponse *v69;
  _BOOL4 v70;
  uint64_t v71;
  void *v72;
  uint64_t v73;
  int v74;
  int v75;
  _BOOL4 v76;
  void *v82;
  SBPerformTransitionSwitcherEventResponse *v83;
  uint64_t v84;
  void *v85;
  uint64_t v86;
  void *v87;
  void *v88;
  uint64_t v89;
  void *v90;
  void *v91;
  double v92;
  double v93;
  char v94;
  void *v95;
  uint64_t v96;
  char v97;
  CGPoint *p_anchorPoint;
  void *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  void *v104;
  void *v105;
  void *v106;
  double v107;
  double v108;
  double v109;
  double v110;
  double v111;
  double v112;
  double v113;
  double v114;
  double v115;
  double v116;
  double v117;
  double v118;
  void *v119;
  void *v120;
  uint64_t v121;
  void *v122;
  SBPerformTransitionSwitcherEventResponse *v123;
  void *v124;
  char v125;
  SBUpdateContinuousExposeStripsPresentationResponse *v126;
  uint64_t v127;
  void *v129;
  char v130;
  double v131;
  void *v132;
  double v133;
  void *v134;
  id v135;
  id v136;
  uint64_t v137;
  void *v138;
  void *v139;
  objc_super v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  _QWORD v145[5];
  _QWORD v146[9];
  objc_super v147;
  objc_super v148;
  _QWORD v149[5];
  objc_super v150;
  _BYTE v151[128];
  uint64_t v152;

  v152 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v150.receiver = self;
  v150.super_class = (Class)SBContinuousExposeWindowDragSwitcherModifier;
  -[SBGestureSwitcherModifier handleGestureEvent:](&v150, sel_handleGestureEvent_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  p_location = &self->_location;
  objc_msgSend(v4, "locationInContainerView");
  self->_location.x = v7;
  self->_location.y = v8;
  v9 = &OBJC_IVAR___SBiPadOSPlatformSwitcherModifier__lastGesturedDisplayItem;
  v10 = (objc_msgSend(v4, "isCanceled") & 1) != 0
     || -[SBContinuousExposeWindowDragDestinationSwitcherModifier proposedDestination](self->_destinationModifier, "proposedDestination") == 0;
  self->_gestureWasCanceled = v10;
  v11 = objc_msgSend(v4, "phase");
  v12 = v11;
  v13 = &OBJC_IVAR___SBiPadOSPlatformSwitcherModifier__lastGesturedDisplayItem;
  if (v11 == 2)
  {
    if ((-[SBContinuousExposeWindowDragSwitcherModifier prefersDockHidden](self, "prefersDockHidden") & 1) != 0)
      goto LABEL_20;
    v138 = v5;
    -[SBContinuousExposeWindowDragSwitcherModifier proposedAppLayout](self, "proposedAppLayout");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBSwitcherModifier autoLayoutSpaceForAppLayout:](self, "autoLayoutSpaceForAppLayout:", v29);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "autoLayoutItemForDisplayItemIfExists:", self->_selectedDisplayItem);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (v30)
    {
      v135 = v4;
      x = p_location->x;
      objc_msgSend(v14, "stageArea");
      v33 = v32;
      v35 = v34;
      objc_msgSend(v30, "size");
      v37 = v36;
      v133 = v38;
      v39 = x + (0.5 - self->_anchorPoint.x) * v38;
      *(double *)&v146[5] = v33 + v36 * 0.5;
      *(double *)&v146[7] = v33 + v35 - v36 * 0.5;
      v146[6] = 1;
      v146[8] = 1;
      BSUIConstrainValueToIntervalWithRubberBand();
      v41 = v40;
      v42 = (void *)objc_msgSend(v14, "mutableCopy");
      objc_msgSend(v42, "autoLayoutItemForDisplayItem:", self->_selectedDisplayItem);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v131 = v39;
      objc_msgSend(v43, "setPosition:", v39, v41);
      v44 = [SBContinuousExposeAutoLayoutConfiguration alloc];
      -[SBContinuousExposeWindowDragSwitcherModifier containerViewBounds](self, "containerViewBounds");
      v46 = v45;
      v48 = v47;
      v50 = v49;
      v52 = v51;
      -[SBContinuousExposeWindowDragSwitcherModifier screenScale](self, "screenScale");
      v54 = v53;
      -[SBContinuousExposeWindowDragSwitcherModifier floatingDockHeight](self, "floatingDockHeight");
      v56 = v55;
      -[SBContinuousExposeWindowDragSwitcherModifier chamoisLayoutAttributes](self, "chamoisLayoutAttributes");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v58 = -[SBContinuousExposeAutoLayoutConfiguration initWithContainerBounds:screenScale:dockHeightWithBottomEdgePadding:chamoisLayoutAttributes:](v44, "initWithContainerBounds:screenScale:dockHeightWithBottomEdgePadding:chamoisLayoutAttributes:", v57, v46, v48, v50, v52, v54, v56);

      -[SBContinuousExposeAutoLayoutController spaceByPerformingAutoLayoutWithSpace:previousSpace:configuration:options:](self->_autoLayoutController, "spaceByPerformingAutoLayoutWithSpace:previousSpace:configuration:options:", v42, 0, v58, 0);
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "stageArea");
      v62 = v60 + v61;
      -[SBContinuousExposeAutoLayoutSpace stageArea](self->_previousAutoLayoutSpace, "stageArea");
      if (v62 != v63 + v64)
        -[SBContinuousExposeWindowDragSwitcherModifier _beginStageRubberbandingRampingPropertyWithMode:settings:](self, "_beginStageRubberbandingRampingPropertyWithMode:settings:", 3, self->_stageRubberbandingSettings);
      v65 = v41 - (0.5 - self->_anchorPoint.y) * v37;
      p_location->x = v131 - (0.5 - self->_anchorPoint.x) * v133;
      self->_location.y = v65;

      v4 = v135;
      v9 = &OBJC_IVAR___SBiPadOSPlatformSwitcherModifier__lastGesturedDisplayItem;
      v13 = &OBJC_IVAR___SBiPadOSPlatformSwitcherModifier__lastGesturedDisplayItem;
    }

    v5 = v138;
  }
  else
  {
    if (v11 != 1)
      goto LABEL_20;
    -[SBContinuousExposeWindowDragSwitcherModifier _appLayoutContainingDisplayItem:](self, "_appLayoutContainingDisplayItem:", self->_selectedDisplayItem);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBContinuousExposeWindowDragSwitcherModifier draggingAppLayoutsForWindowDrag](self, "draggingAppLayoutsForWindowDrag");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v149[0] = MEMORY[0x1E0C809B0];
    v149[1] = 3221225472;
    v149[2] = __67__SBContinuousExposeWindowDragSwitcherModifier_handleGestureEvent___block_invoke;
    v149[3] = &unk_1E8E9DF78;
    v149[4] = self;
    objc_msgSend(v15, "bs_firstObjectPassingTest:", v149);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "sizeOfSelectedDisplayItem");
    self->_sizeOfSelectedDisplayItem.width = v17;
    self->_sizeOfSelectedDisplayItem.height = v18;
    v19 = objc_msgSend(v16, "preferredDisplayOrdinal");
    self->_dragBeganInOtherSwitcher = v19 != -[SBContinuousExposeWindowDragSwitcherModifier displayOrdinal](self, "displayOrdinal");
    v20 = objc_msgSend(v4, "isDraggingFromContinuousExposeStrips");
    self->_dragBeganInAnyStrip = v20;
    self->_dragBeganOnAnyStage = v20 ^ 1;
    if (v14)
    {
      -[SBContinuousExposeWindowDragSwitcherModifier appLayouts](self, "appLayouts");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "indexOfObject:", v14);

      objc_msgSend(v4, "locationInSelectedDisplayItem");
      v24 = v23;
      v26 = v25;
      if (self->_dragBeganInOtherSwitcher)
      {
        width = self->_sizeOfSelectedDisplayItem.width;
        height = self->_sizeOfSelectedDisplayItem.height;
      }
      else
      {
        v148.receiver = self;
        v148.super_class = (Class)SBContinuousExposeWindowDragSwitcherModifier;
        -[SBContinuousExposeWindowDragSwitcherModifier frameForIndex:](&v148, sel_frameForIndex_, v22);
        v66 = objc_msgSend(v14, "layoutRoleForItem:", self->_selectedDisplayItem);
        SBRectWithSize();
        v147.receiver = self;
        v147.super_class = (Class)SBContinuousExposeWindowDragSwitcherModifier;
        -[SBContinuousExposeWindowDragSwitcherModifier frameForLayoutRole:inAppLayout:withBounds:](&v147, sel_frameForLayoutRole_inAppLayout_withBounds_, v66, v14);
      }
      self->_anchorPoint.x = v24 / width;
      self->_anchorPoint.y = v26 / height;
      self->_initialAnchorPoint = self->_anchorPoint;
      v67 = -[SBUpdateLayoutSwitcherEventResponse initWithOptions:updateMode:]([SBUpdateLayoutSwitcherEventResponse alloc], "initWithOptions:updateMode:", 2, 2);
      SBAppendSwitcherModifierResponse(v67, v5);
      v68 = (void *)objc_claimAutoreleasedReturnValue();

      v69 = -[SBUpdateLayoutSwitcherEventResponse initWithOptions:updateMode:]([SBUpdateLayoutSwitcherEventResponse alloc], "initWithOptions:updateMode:", 8, 3);
      SBAppendSwitcherModifierResponse(v69, v68);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v9 = &OBJC_IVAR___SBiPadOSPlatformSwitcherModifier__lastGesturedDisplayItem;
    v13 = &OBJC_IVAR___SBiPadOSPlatformSwitcherModifier__lastGesturedDisplayItem;
  }

LABEL_20:
  v70 = -[SBContinuousExposeWindowDragSwitcherModifier _anyProposedAppLayoutContainsSelectedDisplayItem](self, "_anyProposedAppLayoutContainsSelectedDisplayItem");
  v71 = v9[952];
  objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa + v71), "proposedAppLayout");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v73 = v13[949];
  v74 = objc_msgSend(v72, "containsItem:", *(Class *)((char *)&self->super.super.super.super.isa + v73));

  if (self->_dragBeganInOurSwitcher && (v74 & 1) == 0 && v70
    || (self->_dragBeganInOtherSwitcher ? (v75 = v74) : (v75 = 0),
        v75 == 1 || (self->_dragBeganInAnyStrip ? (v76 = v70) : (v76 = 0), v76)))
  {
    __asm { FMOV            V0.2D, #0.5 }
    self->_anchorPoint = _Q0;
  }
  else
  {
    v97 = !self->_dragBeganOnAnyStage || v70;
    p_anchorPoint = &self->_anchorPoint;
    if ((v97 & 1) != 0)
      *p_anchorPoint = self->_initialAnchorPoint;
    else
      p_anchorPoint->x = 0.4;
  }
  if (v12 == 3)
  {
    if (self->_gestureWasCanceled)
    {
      +[SBSwitcherTransitionRequest requestForActivatingAppLayout:](SBSwitcherTransitionRequest, "requestForActivatingAppLayout:", self->_initialAppLayout);
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      v83 = -[SBPerformTransitionSwitcherEventResponse initWithTransitionRequest:gestureInitiated:]([SBPerformTransitionSwitcherEventResponse alloc], "initWithTransitionRequest:gestureInitiated:", v82, 1);
      SBAppendSwitcherModifierResponse(v83, v5);
      v84 = objc_claimAutoreleasedReturnValue();

      v5 = (void *)v84;
    }
    else
    {
      -[SBContinuousExposeWindowDragSwitcherModifier appLayouts](self, "appLayouts");
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      v86 = MEMORY[0x1E0C809B0];
      v146[0] = MEMORY[0x1E0C809B0];
      v146[1] = 3221225472;
      v146[2] = __67__SBContinuousExposeWindowDragSwitcherModifier_handleGestureEvent___block_invoke_2;
      v146[3] = &unk_1E8E9DF78;
      v146[4] = self;
      objc_msgSend(v85, "bs_firstObjectPassingTest:", v146);
      v87 = (void *)objc_claimAutoreleasedReturnValue();

      -[SBContinuousExposeWindowDragSwitcherModifier appLayouts](self, "appLayouts");
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      v89 = objc_msgSend(v88, "indexOfObject:", v87);

      objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa + v71), "proposedAppLayout");
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBContinuousExposeWindowDragSwitcherModifier chamoisLayoutAttributes](self, "chamoisLayoutAttributes");
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v91, "maximumWindowHeightWithDock");
      objc_msgSend(v91, "screenEdgePadding");
      -[SBContinuousExposeWindowDragSwitcherModifier frameForIndex:](self, "frameForIndex:", v89);
      -[SBContinuousExposeWindowDragSwitcherModifier anchorPointForIndex:](self, "anchorPointForIndex:", v89);
      UIRectGetCenter();
      objc_msgSend(v4, "velocityInContainerView");
      v94 = 0;
      if (v93 > 2500.0 && v93 > fabs(v92))
      {
        if (BSFloatGreaterThanOrEqualToFloat())
        {
          v145[0] = v86;
          v145[1] = 3221225472;
          v145[2] = __67__SBContinuousExposeWindowDragSwitcherModifier_handleGestureEvent___block_invoke_3;
          v145[3] = &unk_1E8E9DF50;
          v145[4] = self;
          objc_msgSend(v90, "appLayoutWithItemsPassingTest:", v145);
          v95 = v91;
          v96 = objc_claimAutoreleasedReturnValue();

          v94 = 1;
          v90 = (void *)v96;
          v91 = v95;
        }
        else
        {
          v94 = 0;
        }
      }
      v137 = v73;
      if (objc_msgSend(v90, "containsItem:", *(Class *)((char *)&self->super.super.super.super.isa + v73)))
      {
        v130 = v94;
        v132 = v91;
        v134 = v87;
        v139 = v5;
        v136 = v4;
        -[SBSwitcherModifier autoLayoutSpaceForAppLayout:](self, "autoLayoutSpaceForAppLayout:", v90);
        v141 = 0u;
        v142 = 0u;
        v143 = 0u;
        v144 = 0u;
        v129 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v129, "items");
        v99 = (void *)objc_claimAutoreleasedReturnValue();
        v100 = objc_msgSend(v99, "countByEnumeratingWithState:objects:count:", &v141, v151, 16);
        if (v100)
        {
          v101 = v100;
          v102 = *(_QWORD *)v142;
          do
          {
            v103 = 0;
            v104 = v90;
            do
            {
              if (*(_QWORD *)v142 != v102)
                objc_enumerationMutation(v99);
              v105 = *(void **)(*((_QWORD *)&v141 + 1) + 8 * v103);
              objc_msgSend(v105, "displayItem");
              v106 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v105, "position");
              v108 = v107;
              v110 = v109;
              -[SBContinuousExposeWindowDragSwitcherModifier containerViewBounds](self, "containerViewBounds");
              +[SBDisplayItemLayoutAttributes normalizedPointForPoint:inBounds:](SBDisplayItemLayoutAttributes, "normalizedPointForPoint:inBounds:", v108, v110, v111, v112, v113, v114);
              v116 = v115;
              v118 = v117;
              objc_msgSend(v104, "layoutAttributesForItem:", v106);
              v119 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v119, "attributesByModifyingNormalizedCenter:", v116, v118);
              v120 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v104, "appLayoutByModifyingLayoutAttributes:forItem:", v120, v106);
              v90 = (void *)objc_claimAutoreleasedReturnValue();

              ++v103;
              v104 = v90;
            }
            while (v101 != v103);
            v101 = objc_msgSend(v99, "countByEnumeratingWithState:objects:count:", &v141, v151, 16);
          }
          while (v101);
        }

        if ((v130 & 1) == 0)
        {
          -[SBContinuousExposeWindowDragSwitcherModifier appLayoutByBringingItemToFront:inAppLayout:](self, "appLayoutByBringingItemToFront:inAppLayout:", *(Class *)((char *)&self->super.super.super.super.isa + v137), v90);
          v121 = objc_claimAutoreleasedReturnValue();

          v90 = (void *)v121;
        }
        v87 = v134;
        v4 = v136;
        v5 = v139;

        v91 = v132;
      }
      if (!v90)
      {
        +[SBAppLayout homeScreenAppLayout](SBAppLayout, "homeScreenAppLayout");
        v90 = (void *)objc_claimAutoreleasedReturnValue();
      }
      +[SBSwitcherTransitionRequest requestForActivatingAppLayout:](SBSwitcherTransitionRequest, "requestForActivatingAppLayout:", v90);
      v122 = (void *)objc_claimAutoreleasedReturnValue();
      v123 = -[SBPerformTransitionSwitcherEventResponse initWithTransitionRequest:gestureInitiated:]([SBPerformTransitionSwitcherEventResponse alloc], "initWithTransitionRequest:gestureInitiated:", v122, 1);
      SBAppendSwitcherModifierResponse(v123, v5);
      v124 = (void *)objc_claimAutoreleasedReturnValue();

      -[SBContinuousExposeWindowDragSwitcherModifier continuousExposeStripProgress](self, "continuousExposeStripProgress");
      v140.receiver = self;
      v140.super_class = (Class)SBContinuousExposeWindowDragSwitcherModifier;
      -[SBContinuousExposeWindowDragSwitcherModifier continuousExposeStripProgress](&v140, sel_continuousExposeStripProgress);
      v125 = BSFloatEqualToFloat();
      if (v90
        && (v125 & 1) == 0
        && (objc_msgSend(v90, "containsItem:", *(Class *)((char *)&self->super.super.super.super.isa + v137)) & 1) == 0)
      {
        v126 = -[SBUpdateContinuousExposeStripsPresentationResponse initWithPresentationOptions:dismissalOptions:]([SBUpdateContinuousExposeStripsPresentationResponse alloc], "initWithPresentationOptions:dismissalOptions:", 1, 0);
        SBAppendSwitcherModifierResponse(v126, v124);
        v127 = objc_claimAutoreleasedReturnValue();

        v124 = (void *)v127;
      }

      v5 = v124;
    }
  }

  return v5;
}

uint64_t __67__SBContinuousExposeWindowDragSwitcherModifier_handleGestureEvent___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "containsItem:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 264));
}

uint64_t __67__SBContinuousExposeWindowDragSwitcherModifier_handleGestureEvent___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "containsItem:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 264));
}

uint64_t __67__SBContinuousExposeWindowDragSwitcherModifier_handleGestureEvent___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isEqual:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 264)) ^ 1;
}

- (id)handleTransitionEvent:(id)a3
{
  id v4;
  void *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)SBContinuousExposeWindowDragSwitcherModifier;
  -[SBGestureSwitcherModifier handleTransitionEvent:](&v7, sel_handleTransitionEvent_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v4, "phase") >= 2
    && (objc_msgSend(v4, "isAppLaunchDuringWindowDragGestureTransition") & 1) == 0)
  {
    -[SBChainableModifier setState:](self, "setState:", 1);
  }

  return v5;
}

- (id)appLayoutContainingAppLayout:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  -[SBContinuousExposeWindowDragDestinationSwitcherModifier proposedAppLayout](self->_destinationModifier, "proposedAppLayout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "containsAllItemsFromAppLayout:", v4))
  {
    v6 = v5;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)SBContinuousExposeWindowDragSwitcherModifier;
    -[SBContinuousExposeWindowDragSwitcherModifier appLayoutContainingAppLayout:](&v9, sel_appLayoutContainingAppLayout_, v4);
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  return v7;
}

- (id)appLayoutOnStage
{
  return -[SBContinuousExposeWindowDragDestinationSwitcherModifier proposedAppLayout](self->_destinationModifier, "proposedAppLayout");
}

- (SBAppLayout)hoveringOverAppLayout
{
  return -[SBContinuousExposeWindowDragDestinationSwitcherModifier hoveringOverAppLayout](self->_destinationModifier, "hoveringOverAppLayout");
}

- (double)continuousExposeStripProgress
{
  double v3;
  double v4;
  void *v5;
  _BOOL4 v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SBContinuousExposeWindowDragSwitcherModifier;
  -[SBContinuousExposeWindowDragSwitcherModifier continuousExposeStripProgress](&v8, sel_continuousExposeStripProgress);
  v4 = v3;
  if (-[SBContinuousExposeWindowDragSwitcherModifier _isStripStashed](self, "_isStripStashed"))
  {
    -[SBContinuousExposeWindowDragDestinationSwitcherModifier proposedAppLayout](self->_destinationModifier, "proposedAppLayout");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "containsItem:", self->_selectedDisplayItem))
    {

    }
    else
    {
      v6 = -[SBAppLayout containsItem:](self->_initialAppLayout, "containsItem:", self->_selectedDisplayItem);

      if (v6)
        return 1.0;
    }
  }
  return v4;
}

- (CGRect)frameForIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  BOOL v7;
  _BOOL4 v8;
  void *v9;
  char v10;
  BOOL v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  uint64_t v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  uint64_t v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  uint64_t v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  uint64_t v44;
  objc_super v45;
  objc_super v46;
  CGRect result;

  -[SBContinuousExposeWindowDragSwitcherModifier appLayouts](self, "appLayouts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v6, "containsItem:", self->_selectedDisplayItem)
    || (self->_anchorPoint.x == 1.79769313e308 ? (v7 = self->_anchorPoint.y == 1.79769313e308) : (v7 = 0), v7))
  {
    v45.receiver = self;
    v45.super_class = (Class)SBContinuousExposeWindowDragSwitcherModifier;
    -[SBContinuousExposeWindowDragSwitcherModifier frameForIndex:](&v45, sel_frameForIndex_, a3);
  }
  else
  {
    v8 = -[SBContinuousExposeWindowDragSwitcherModifier _anyProposedAppLayoutContainsSelectedDisplayItem](self, "_anyProposedAppLayoutContainsSelectedDisplayItem", 1.79769313e308, 1.79769313e308);
    -[SBContinuousExposeWindowDragDestinationSwitcherModifier proposedAppLayout](self->_destinationModifier, "proposedAppLayout");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "containsItem:", self->_selectedDisplayItem);

    v11 = !self->_dragBeganInOtherSwitcher || !v8;
    if (v11 || (v10 & 1) != 0)
    {
      -[SBContinuousExposeWindowDragDestinationSwitcherModifier proposedAppLayout](self->_destinationModifier, "proposedAppLayout");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v16, "containsItem:", self->_selectedDisplayItem))
        v17 = v16;
      else
        v17 = v6;
      v18 = v17;
      -[SBContinuousExposeWindowDragSwitcherModifier displayItemLayoutAttributesCalculator](self, "displayItemLayoutAttributesCalculator");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v18, "layoutRoleForItem:", self->_selectedDisplayItem);
      -[SBContinuousExposeWindowDragSwitcherModifier containerViewBounds](self, "containerViewBounds");
      v22 = v21;
      v24 = v23;
      v26 = v25;
      v28 = v27;
      v29 = -[SBContinuousExposeWindowDragSwitcherModifier switcherInterfaceOrientation](self, "switcherInterfaceOrientation");
      -[SBContinuousExposeWindowDragSwitcherModifier chamoisLayoutAttributes](self, "chamoisLayoutAttributes");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBContinuousExposeWindowDragSwitcherModifier floatingDockHeight](self, "floatingDockHeight");
      v32 = v31;
      -[SBContinuousExposeWindowDragSwitcherModifier screenScale](self, "screenScale");
      v34 = v33;
      v35 = -[SBContinuousExposeWindowDragSwitcherModifier prefersStripHidden](self, "prefersStripHidden");
      LOBYTE(v44) = -[SBContinuousExposeWindowDragSwitcherModifier prefersDockHidden](self, "prefersDockHidden");
      objc_msgSend(v19, "frameForLayoutRole:inAppLayout:containerBounds:containerOrientation:chamoisLayoutAttributes:floatingDockHeight:screenScale:isChamoisWindowingUIEnabled:prefersStripHidden:prefersDockHidden:", v20, v18, v29, v30, 1, v35, v22, v24, v26, v28, v32, v34, v44);

    }
    if (SBSizeEqualsSize())
    {
      v46.receiver = self;
      v46.super_class = (Class)SBContinuousExposeWindowDragSwitcherModifier;
      -[SBContinuousExposeWindowDragSwitcherModifier frameForIndex:](&v46, sel_frameForIndex_, a3);
    }
    SBRectWithSize();
    UIRectCenteredAboutPoint();
  }
  v36 = v12;
  v37 = v13;
  v38 = v14;
  v39 = v15;

  v40 = v36;
  v41 = v37;
  v42 = v38;
  v43 = v39;
  result.size.height = v43;
  result.size.width = v42;
  result.origin.y = v41;
  result.origin.x = v40;
  return result;
}

- (double)scaleForIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  BOOL v7;
  double v8;
  double v9;
  BOOL v11;
  void *v12;
  int v13;
  void *v14;
  double v15;
  objc_super v16;
  objc_super v17;

  -[SBContinuousExposeWindowDragSwitcherModifier appLayouts](self, "appLayouts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v6, "containsItem:", self->_selectedDisplayItem)
    || (self->_anchorPoint.x == 1.79769313e308 ? (v7 = self->_anchorPoint.y == 1.79769313e308) : (v7 = 0), v7))
  {
    -[SBContinuousExposeWindowDragSwitcherModifier scaleForIndex:](&v16, sel_scaleForIndex_, a3, self, SBContinuousExposeWindowDragSwitcherModifier, v17.receiver, v17.super_class);
LABEL_10:
    v8 = v9;
    goto LABEL_11;
  }
  if (self->_dragBeganInAnyStrip)
  {
    if (-[SBContinuousExposeWindowDragSwitcherModifier _anyProposedAppLayoutContainsSelectedDisplayItem](self, "_anyProposedAppLayoutContainsSelectedDisplayItem", 1.79769313e308, 1.79769313e308))
    {
      v8 = 0.6;
      goto LABEL_11;
    }
LABEL_24:
    -[SBContinuousExposeWindowDragSwitcherModifier chamoisLayoutAttributes](self, "chamoisLayoutAttributes");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stripCardScale");
    v8 = v15;

    goto LABEL_11;
  }
  if (!self->_dragBeganOnAnyStage)
  {
    -[SBContinuousExposeWindowDragSwitcherModifier scaleForIndex:](&v17, sel_scaleForIndex_, a3, v16.receiver, v16.super_class, self, SBContinuousExposeWindowDragSwitcherModifier);
    goto LABEL_10;
  }
  v11 = -[SBContinuousExposeWindowDragSwitcherModifier _anyProposedAppLayoutContainsSelectedDisplayItem](self, "_anyProposedAppLayoutContainsSelectedDisplayItem", 1.79769313e308, 1.79769313e308);
  -[SBContinuousExposeWindowDragDestinationSwitcherModifier proposedAppLayout](self->_destinationModifier, "proposedAppLayout");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "containsItem:", self->_selectedDisplayItem);

  if (self->_dragBeganInOtherSwitcher)
  {
    if (v13)
      v8 = 0.6;
    else
      v8 = 1.0;
    if (((v13 | v11) & 1) == 0)
      goto LABEL_24;
  }
  else
  {
    if (v13)
      v8 = 1.0;
    else
      v8 = 0.6;
    if (((v13 | v11) & 1) == 0)
      goto LABEL_24;
  }
LABEL_11:

  return v8;
}

- (CGPoint)anchorPointForIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  double x;
  double y;
  BOOL v9;
  double v10;
  double v11;
  double v12;
  double v13;
  objc_super v14;
  CGPoint result;

  -[SBContinuousExposeWindowDragSwitcherModifier appLayouts](self, "appLayouts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v6, "containsItem:", self->_selectedDisplayItem)
    || ((x = self->_anchorPoint.x, y = self->_anchorPoint.y, x == 1.79769313e308)
      ? (v9 = y == 1.79769313e308)
      : (v9 = 0),
        v9))
  {
    v14.receiver = self;
    v14.super_class = (Class)SBContinuousExposeWindowDragSwitcherModifier;
    -[SBContinuousExposeWindowDragSwitcherModifier anchorPointForIndex:](&v14, sel_anchorPointForIndex_, a3);
    x = v10;
    y = v11;
  }

  v12 = x;
  v13 = y;
  result.y = v13;
  result.x = v12;
  return result;
}

- (BOOL)shouldUseAnchorPointToPinLayoutRolesToSpace:(unint64_t)a3
{
  void *v5;
  void *v6;
  BOOL v7;
  objc_super v9;

  -[SBContinuousExposeWindowDragSwitcherModifier appLayouts](self, "appLayouts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v6, "containsItem:", self->_selectedDisplayItem) & 1) != 0)
  {
    v7 = 0;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)SBContinuousExposeWindowDragSwitcherModifier;
    v7 = -[SBContinuousExposeWindowDragSwitcherModifier shouldUseAnchorPointToPinLayoutRolesToSpace:](&v9, sel_shouldUseAnchorPointToPinLayoutRolesToSpace_, a3);
  }

  return v7;
}

- (BOOL)shouldPinLayoutRolesToSpace:(unint64_t)a3
{
  void *v5;
  void *v6;
  BOOL v7;
  BOOL v8;
  objc_super v10;

  -[SBContinuousExposeWindowDragSwitcherModifier appLayouts](self, "appLayouts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v6, "containsItem:", self->_selectedDisplayItem)
    || (self->_anchorPoint.x == 1.79769313e308 ? (v7 = self->_anchorPoint.y == 1.79769313e308) : (v7 = 0), v7))
  {
    v10.receiver = self;
    v10.super_class = (Class)SBContinuousExposeWindowDragSwitcherModifier;
    v8 = -[SBContinuousExposeWindowDragSwitcherModifier shouldPinLayoutRolesToSpace:](&v10, sel_shouldPinLayoutRolesToSpace_, a3);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (CGRect)frameForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 withBounds:(CGRect)a5
{
  double height;
  double width;
  double y;
  double x;
  id v11;
  BOOL v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  objc_super v21;
  CGRect result;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v11 = a4;
  if (!objc_msgSend(v11, "containsItem:", self->_selectedDisplayItem)
    || (self->_anchorPoint.x == 1.79769313e308 ? (v12 = self->_anchorPoint.y == 1.79769313e308) : (v12 = 0), v12))
  {
    v21.receiver = self;
    v21.super_class = (Class)SBContinuousExposeWindowDragSwitcherModifier;
    -[SBContinuousExposeWindowDragSwitcherModifier frameForLayoutRole:inAppLayout:withBounds:](&v21, sel_frameForLayoutRole_inAppLayout_withBounds_, a3, v11, x, y, width, height);
    x = v13;
    y = v14;
    width = v15;
    height = v16;
  }

  v17 = x;
  v18 = y;
  v19 = width;
  v20 = height;
  result.size.height = v20;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (double)opacityForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5
{
  id v8;
  double v9;
  double v10;
  objc_super v12;

  v8 = a4;
  v9 = 1.0;
  if ((objc_msgSend(v8, "containsItem:", self->_selectedDisplayItem) & 1) == 0)
  {
    v12.receiver = self;
    v12.super_class = (Class)SBContinuousExposeWindowDragSwitcherModifier;
    -[SBContinuousExposeWindowDragSwitcherModifier opacityForLayoutRole:inAppLayout:atIndex:](&v12, sel_opacityForLayoutRole_inAppLayout_atIndex_, a3, v8, a5);
    v9 = v10;
  }

  return v9;
}

- (UIRectCornerRadii)cornerRadiiForIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
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
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  objc_super v26;
  UIRectCornerRadii result;

  -[SBContinuousExposeWindowDragSwitcherModifier appLayouts](self, "appLayouts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "containsItem:", self->_selectedDisplayItem))
  {
    -[SBContinuousExposeWindowDragDestinationSwitcherModifier proposedAppLayout](self->_destinationModifier, "proposedAppLayout");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBContinuousExposeWindowDragSwitcherModifier chamoisLayoutAttributes](self, "chamoisLayoutAttributes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "containsItem:", self->_selectedDisplayItem))
    {
      -[SBContinuousExposeWindowDragSwitcherModifier displayCornerRadius](self, "displayCornerRadius");
      -[SBContinuousExposeWindowDragSwitcherModifier chamoisLayoutAttributes](self, "chamoisLayoutAttributes");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "stageCornerRadii");

      if (-[SBSwitcherModifier appLayoutContainsFullScreenDisplayItem:](self, "appLayoutContainsFullScreenDisplayItem:", v6))
      {
        BSFloatIsZero();
      }
    }
    else
    {
      objc_msgSend(v8, "stripCornerRadii");
    }
    -[SBContinuousExposeWindowDragSwitcherModifier scaleForIndex:](self, "scaleForIndex:", a3);
    SBRectCornerRadiiForRadius();
    v11 = v18;
    v13 = v19;
    v15 = v20;
    v17 = v21;

  }
  else
  {
    v26.receiver = self;
    v26.super_class = (Class)SBContinuousExposeWindowDragSwitcherModifier;
    -[SBContinuousExposeWindowDragSwitcherModifier cornerRadiiForIndex:](&v26, sel_cornerRadiiForIndex_, a3);
    v11 = v10;
    v13 = v12;
    v15 = v14;
    v17 = v16;
  }

  v22 = v11;
  v23 = v13;
  v24 = v15;
  v25 = v17;
  result.topRight = v25;
  result.bottomRight = v24;
  result.bottomLeft = v23;
  result.topLeft = v22;
  return result;
}

- (BOOL)isLayoutRoleMatchMovedToScene:(int64_t)a3 inAppLayout:(id)a4
{
  id v6;
  SBAppLayout *initialAppLayout;
  void *v8;
  SBDisplayItem *selectedDisplayItem;
  void *v10;
  BOOL v11;
  objc_super v13;

  v6 = a4;
  initialAppLayout = self->_initialAppLayout;
  objc_msgSend(v6, "itemForLayoutRole:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[SBAppLayout containsItem:](initialAppLayout, "containsItem:", v8))
  {

  }
  else
  {
    selectedDisplayItem = self->_selectedDisplayItem;
    objc_msgSend(v6, "itemForLayoutRole:", a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(selectedDisplayItem) = -[SBDisplayItem isEqual:](selectedDisplayItem, "isEqual:", v10);

    if ((selectedDisplayItem & 1) == 0)
    {
      v13.receiver = self;
      v13.super_class = (Class)SBContinuousExposeWindowDragSwitcherModifier;
      v11 = -[SBContinuousExposeWindowDragSwitcherModifier isLayoutRoleMatchMovedToScene:inAppLayout:](&v13, sel_isLayoutRoleMatchMovedToScene_inAppLayout_, a3, v6);
      goto LABEL_6;
    }
  }
  v11 = 1;
LABEL_6:

  return v11;
}

- (BOOL)wantsSceneResizesHostedContextForAppLayout:(id)a3
{
  id v4;
  BOOL v5;
  objc_super v7;

  v4 = a3;
  if (-[SBAppLayout containsAnyItemFromAppLayout:](self->_initialAppLayout, "containsAnyItemFromAppLayout:", v4)
    || (objc_msgSend(v4, "containsItem:", self->_selectedDisplayItem) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SBContinuousExposeWindowDragSwitcherModifier;
    v5 = -[SBContinuousExposeWindowDragSwitcherModifier wantsSceneResizesHostedContextForAppLayout:](&v7, sel_wantsSceneResizesHostedContextForAppLayout_, v4);
  }

  return v5;
}

- (id)visibleAppLayouts
{
  void *v3;
  void *v4;
  uint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBContinuousExposeWindowDragSwitcherModifier;
  -[SBContinuousExposeWindowDragSwitcherModifier visibleAppLayouts](&v7, sel_visibleAppLayouts);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBContinuousExposeWindowDragSwitcherModifier _appLayoutContainingDisplayItem:](self, "_appLayoutContainingDisplayItem:", self->_selectedDisplayItem);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v3, "setByAddingObject:", v4);
    v5 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v5;
  }

  return v3;
}

- (id)topMostLayoutElements
{
  void *v3;
  void *v4;
  uint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBContinuousExposeWindowDragSwitcherModifier;
  -[SBContinuousExposeWindowDragSwitcherModifier topMostLayoutElements](&v7, sel_topMostLayoutElements);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBContinuousExposeWindowDragSwitcherModifier _appLayoutContainingDisplayItem:](self, "_appLayoutContainingDisplayItem:", self->_selectedDisplayItem);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v3, "sb_arrayByInsertingOrMovingObject:toIndex:", v4, 0);
    v5 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v5;
  }

  return v3;
}

- (id)animationAttributesForLayoutElement:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  UIViewFloatAnimatableProperty *anchorPointRampingProperty;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  UIViewFloatAnimatableProperty *stageRubberbandingRampingProperty;
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
  double v33;
  double v34;
  double v35;
  void *v36;
  objc_super v38;
  CAFrameRateRange v39;

  v4 = a3;
  v38.receiver = self;
  v38.super_class = (Class)SBContinuousExposeWindowDragSwitcherModifier;
  -[SBGestureSwitcherModifier animationAttributesForLayoutElement:](&v38, sel_animationAttributesForLayoutElement_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v4, "switcherLayoutElementType")
    && objc_msgSend(v4, "containsItem:", self->_selectedDisplayItem))
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DA9E08]), "initWithDefaultValues");
    -[SBContinuousExposeWindowDragSwitcherModifier _baseLayoutSettings](self, "_baseLayoutSettings");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dampingRatio");
    objc_msgSend(v6, "setTrackingDampingRatio:");
    objc_msgSend(v7, "response");
    objc_msgSend(v6, "setTrackingResponse:");
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DA9E08]), "initWithDefaultValues");
    -[SBContinuousExposeWindowDragSwitcherModifier switcherSettings](self, "switcherSettings");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "chamoisSettings");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "windowDragAnimationSettings");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    anchorPointRampingProperty = self->_anchorPointRampingProperty;
    if (anchorPointRampingProperty)
    {
      -[UIViewFloatAnimatableProperty presentationValue](anchorPointRampingProperty, "presentationValue");
      v14 = v13;
      objc_msgSend(v11, "trackingResponse");
      v16 = v15;
      objc_msgSend(v6, "trackingResponse");
      v18 = v14 * (v16 - v17);
      objc_msgSend(v6, "trackingResponse");
      v20 = v19 + v18;
    }
    else
    {
      objc_msgSend(v11, "trackingResponse");
    }
    objc_msgSend(v8, "setTrackingResponse:", v20);
    objc_msgSend(v11, "trackingDampingRatio");
    objc_msgSend(v8, "setTrackingDampingRatio:");
    v39 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
    objc_msgSend(v8, "setFrameRateRange:highFrameRateReason:", 1114113, *(double *)&v39.minimum, *(double *)&v39.maximum, *(double *)&v39.preferred);
    stageRubberbandingRampingProperty = self->_stageRubberbandingRampingProperty;
    if (stageRubberbandingRampingProperty)
    {
      -[UIViewFloatAnimatableProperty presentationValue](stageRubberbandingRampingProperty, "presentationValue");
      v23 = v22;
      objc_msgSend(v8, "trackingResponse");
      v25 = v24;
      -[SBFFluidBehaviorSettings response](self->_stageRubberbandingSettings, "response");
      v27 = v23 * (v25 - v26);
      -[SBFFluidBehaviorSettings response](self->_stageRubberbandingSettings, "response");
      v29 = v27 + v28;
      objc_msgSend(v8, "trackingDampingRatio");
      v31 = v30;
      -[SBFFluidBehaviorSettings dampingRatio](self->_stageRubberbandingSettings, "dampingRatio");
      v33 = v23 * (v31 - v32);
      -[SBFFluidBehaviorSettings dampingRatio](self->_stageRubberbandingSettings, "dampingRatio");
      v35 = v33 + v34;
      objc_msgSend(v8, "setTrackingResponse:", v29);
      objc_msgSend(v8, "setTrackingDampingRatio:", v35);
    }
    v36 = (void *)objc_msgSend(v5, "mutableCopy");
    objc_msgSend(v36, "setLayoutSettings:", v6);
    objc_msgSend(v36, "setPositionSettings:", v8);

    v5 = v36;
  }

  return v5;
}

- (SBSwitcherAsyncRenderingAttributes)asyncRenderingAttributesForAppLayout:(id)a3
{
  return (SBSwitcherAsyncRenderingAttributes)SBSwitcherAsyncRenderingAttributesMake(0, 0);
}

- (double)dimmingAlphaForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  id v6;
  double v7;
  double v8;
  objc_super v10;

  v6 = a4;
  v7 = 0.0;
  if ((objc_msgSend(v6, "containsItem:", self->_selectedDisplayItem) & 1) == 0)
  {
    v10.receiver = self;
    v10.super_class = (Class)SBContinuousExposeWindowDragSwitcherModifier;
    -[SBContinuousExposeWindowDragSwitcherModifier dimmingAlphaForLayoutRole:inAppLayout:](&v10, sel_dimmingAlphaForLayoutRole_inAppLayout_, a3, v6);
    v7 = v8;
  }

  return v7;
}

- (double)titleAndIconOpacityForIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  double v7;
  double v8;
  objc_super v10;

  -[SBContinuousExposeWindowDragSwitcherModifier appLayouts](self, "appLayouts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v6, "containsItem:", self->_selectedDisplayItem)
    || (v7 = 0.0, -[SBGestureSwitcherModifier gesturePhase](self, "gesturePhase") <= 1))
  {
    v10.receiver = self;
    v10.super_class = (Class)SBContinuousExposeWindowDragSwitcherModifier;
    -[SBContinuousExposeWindowDragSwitcherModifier titleAndIconOpacityForIndex:](&v10, sel_titleAndIconOpacityForIndex_, a3);
    v7 = v8;
  }

  return v7;
}

- (double)perspectiveAngleForAppLayout:(id)a3
{
  id v4;
  double v5;
  int v6;
  void *v7;
  double v8;
  double v9;
  objc_super v11;

  v4 = a3;
  if (objc_msgSend(v4, "containsItem:", self->_selectedDisplayItem))
  {
    v5 = 0.0;
    if (!-[SBContinuousExposeWindowDragSwitcherModifier _anyProposedAppLayoutContainsSelectedDisplayItem](self, "_anyProposedAppLayoutContainsSelectedDisplayItem"))
    {
      v6 = -[SBContinuousExposeWindowDragSwitcherModifier isRTLEnabled](self, "isRTLEnabled");
      -[SBContinuousExposeWindowDragSwitcherModifier chamoisLayoutAttributes](self, "chamoisLayoutAttributes");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stripTiltAngle");
      v5 = v8;
      if (v6)
        v5 = -v8;

    }
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)SBContinuousExposeWindowDragSwitcherModifier;
    -[SBContinuousExposeWindowDragSwitcherModifier perspectiveAngleForAppLayout:](&v11, sel_perspectiveAngleForAppLayout_, v4);
    v5 = v9;
  }

  return v5;
}

- (SBSwitcherWallpaperGradientAttributes)wallpaperGradientAttributesForIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  double Empty;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  objc_super v13;
  SBSwitcherWallpaperGradientAttributes result;

  -[SBContinuousExposeWindowDragSwitcherModifier appLayouts](self, "appLayouts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "containsItem:", self->_selectedDisplayItem))
  {
    Empty = SBSwitcherWallpaperGradientAttributesMakeEmpty();
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)SBContinuousExposeWindowDragSwitcherModifier;
    -[SBContinuousExposeWindowDragSwitcherModifier wallpaperGradientAttributesForIndex:](&v13, sel_wallpaperGradientAttributesForIndex_, a3);
  }
  v9 = Empty;
  v10 = v8;

  v11 = v9;
  v12 = v10;
  result.trailingAlpha = v12;
  result.leadingAlpha = v11;
  return result;
}

- (int64_t)shadowStyleForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  id v6;
  void *v7;
  int v8;
  int64_t v9;
  objc_super v11;

  v6 = a4;
  if (objc_msgSend(v6, "containsItem:", self->_selectedDisplayItem)
    && (-[SBContinuousExposeWindowDragSwitcherModifier proposedAppLayout](self, "proposedAppLayout"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "containsItem:", self->_selectedDisplayItem),
        v7,
        !v8))
  {
    v9 = 2;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)SBContinuousExposeWindowDragSwitcherModifier;
    v9 = -[SBContinuousExposeWindowDragSwitcherModifier shadowStyleForLayoutRole:inAppLayout:](&v11, sel_shadowStyleForLayoutRole_inAppLayout_, a3, v6);
  }

  return v9;
}

- (BOOL)isSwitcherWindowVisible
{
  return 1;
}

- (void)_beginStageRubberbandingRampingPropertyWithMode:(int64_t)a3 settings:(id)a4
{
  id v6;
  UIViewFloatAnimatableProperty *stageRubberbandingRampingProperty;
  UIViewFloatAnimatableProperty *v8;
  UIViewFloatAnimatableProperty *v9;
  UIViewFloatAnimatableProperty *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  id v15;
  UIViewFloatAnimatableProperty *v16;
  void *v17;
  UIViewFloatAnimatableProperty *v18;
  _QWORD v19[4];
  UIViewFloatAnimatableProperty *v20;
  id v21;
  _QWORD v22[5];
  id location;

  v6 = a4;
  stageRubberbandingRampingProperty = self->_stageRubberbandingRampingProperty;
  if (stageRubberbandingRampingProperty)
  {
    -[UIViewFloatAnimatableProperty invalidate](stageRubberbandingRampingProperty, "invalidate");
    v8 = self->_stageRubberbandingRampingProperty;
    self->_stageRubberbandingRampingProperty = 0;

  }
  v9 = (UIViewFloatAnimatableProperty *)objc_alloc_init(MEMORY[0x1E0CEABC0]);
  v10 = self->_stageRubberbandingRampingProperty;
  self->_stageRubberbandingRampingProperty = v9;

  -[UIViewFloatAnimatableProperty setValue:](self->_stageRubberbandingRampingProperty, "setValue:", 0.0);
  v11 = (void *)objc_msgSend(v6, "copy");
  LODWORD(v12) = *MEMORY[0x1E0CD23C0];
  LODWORD(v13) = *(_DWORD *)(MEMORY[0x1E0CD23C0] + 4);
  LODWORD(v14) = *(_DWORD *)(MEMORY[0x1E0CD23C0] + 8);
  objc_msgSend(v11, "setFrameRateRange:highFrameRateReason:", 1114112, v12, v13, v14);
  v15 = v11;

  objc_initWeak(&location, self);
  v16 = self->_stageRubberbandingRampingProperty;
  v17 = (void *)MEMORY[0x1E0CEABB0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __105__SBContinuousExposeWindowDragSwitcherModifier__beginStageRubberbandingRampingPropertyWithMode_settings___block_invoke;
  v22[3] = &unk_1E8E9DED8;
  v22[4] = self;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __105__SBContinuousExposeWindowDragSwitcherModifier__beginStageRubberbandingRampingPropertyWithMode_settings___block_invoke_2;
  v19[3] = &unk_1E8EA6DD8;
  objc_copyWeak(&v21, &location);
  v18 = v16;
  v20 = v18;
  objc_msgSend(v17, "sb_animateWithSettings:mode:animations:completion:", v15, a3, v22, v19);

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);

}

uint64_t __105__SBContinuousExposeWindowDragSwitcherModifier__beginStageRubberbandingRampingPropertyWithMode_settings___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 208), "setValue:", 1.0);
}

void __105__SBContinuousExposeWindowDragSwitcherModifier__beginStageRubberbandingRampingPropertyWithMode_settings___block_invoke_2(uint64_t a1)
{
  id *WeakRetained;
  id v3;
  void *v4;
  id v5;
  id *v6;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v6 = WeakRetained;
    v3 = WeakRetained[26];
    v4 = v3;
    if (v3 && v3 == *(id *)(a1 + 32))
    {
      v5 = v6[26];
      v6[26] = 0;

    }
    WeakRetained = v6;
  }

}

- (void)_beginAnimatingAnchorPointRampingPropertyWithMode:(int64_t)a3 settings:(id)a4
{
  id v6;
  UIViewFloatAnimatableProperty *anchorPointRampingProperty;
  UIViewFloatAnimatableProperty *v8;
  UIViewFloatAnimatableProperty *v9;
  UIViewFloatAnimatableProperty *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  id v15;
  UIViewFloatAnimatableProperty *v16;
  void *v17;
  UIViewFloatAnimatableProperty *v18;
  _QWORD v19[4];
  UIViewFloatAnimatableProperty *v20;
  id v21;
  _QWORD v22[5];
  id location;

  v6 = a4;
  anchorPointRampingProperty = self->_anchorPointRampingProperty;
  if (anchorPointRampingProperty)
  {
    -[UIViewFloatAnimatableProperty invalidate](anchorPointRampingProperty, "invalidate");
    v8 = self->_anchorPointRampingProperty;
    self->_anchorPointRampingProperty = 0;

  }
  v9 = (UIViewFloatAnimatableProperty *)objc_alloc_init(MEMORY[0x1E0CEABC0]);
  v10 = self->_anchorPointRampingProperty;
  self->_anchorPointRampingProperty = v9;

  -[UIViewFloatAnimatableProperty setValue:](self->_anchorPointRampingProperty, "setValue:", 0.0);
  v11 = (void *)objc_msgSend(v6, "copy");
  LODWORD(v12) = *MEMORY[0x1E0CD23C0];
  LODWORD(v13) = *(_DWORD *)(MEMORY[0x1E0CD23C0] + 4);
  LODWORD(v14) = *(_DWORD *)(MEMORY[0x1E0CD23C0] + 8);
  objc_msgSend(v11, "setFrameRateRange:highFrameRateReason:", 1114112, v12, v13, v14);
  v15 = v11;

  objc_initWeak(&location, self);
  v16 = self->_anchorPointRampingProperty;
  v17 = (void *)MEMORY[0x1E0CEABB0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __107__SBContinuousExposeWindowDragSwitcherModifier__beginAnimatingAnchorPointRampingPropertyWithMode_settings___block_invoke;
  v22[3] = &unk_1E8E9DED8;
  v22[4] = self;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __107__SBContinuousExposeWindowDragSwitcherModifier__beginAnimatingAnchorPointRampingPropertyWithMode_settings___block_invoke_2;
  v19[3] = &unk_1E8EA6DD8;
  objc_copyWeak(&v21, &location);
  v18 = v16;
  v20 = v18;
  objc_msgSend(v17, "sb_animateWithSettings:mode:animations:completion:", v15, a3, v22, v19);

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);

}

uint64_t __107__SBContinuousExposeWindowDragSwitcherModifier__beginAnimatingAnchorPointRampingPropertyWithMode_settings___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 200), "setValue:", 1.0);
}

void __107__SBContinuousExposeWindowDragSwitcherModifier__beginAnimatingAnchorPointRampingPropertyWithMode_settings___block_invoke_2(uint64_t a1)
{
  id *WeakRetained;
  id v3;
  void *v4;
  id v5;
  id *v6;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v6 = WeakRetained;
    v3 = WeakRetained[25];
    v4 = v3;
    if (v3 && v3 == *(id *)(a1 + 32))
    {
      v5 = v6[25];
      v6[25] = 0;

    }
    WeakRetained = v6;
  }

}

- (id)_baseLayoutSettings
{
  void *v2;
  void *v3;

  -[SBContinuousExposeWindowDragSwitcherModifier medusaSettings](self, "medusaSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resizeAnimationSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_appLayoutContainingDisplayItem:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  -[SBContinuousExposeWindowDragSwitcherModifier appLayouts](self, "appLayouts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __80__SBContinuousExposeWindowDragSwitcherModifier__appLayoutContainingDisplayItem___block_invoke;
  v9[3] = &unk_1E8E9DF78;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "bs_firstObjectPassingTest:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __80__SBContinuousExposeWindowDragSwitcherModifier__appLayoutContainingDisplayItem___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "containsItem:", *(_QWORD *)(a1 + 32));
}

- (BOOL)_isStripStashed
{
  void *v3;
  void *v4;

  -[SBContinuousExposeWindowDragDestinationSwitcherModifier proposedAppLayout](self->_destinationModifier, "proposedAppLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBSwitcherModifier autoLayoutSpaceForAppLayout:](self, "autoLayoutSpaceForAppLayout:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v3) = objc_msgSend(v4, "isStripVisible") ^ 1;
  return (char)v3;
}

- (BOOL)_anyProposedAppLayoutContainsSelectedDisplayItem
{
  SBContinuousExposeWindowDragSwitcherModifier *v2;
  void *v3;
  _QWORD v5[5];

  v2 = self;
  -[SBContinuousExposeWindowDragSwitcherModifier proposedAppLayoutsForWindowDrag](self, "proposedAppLayoutsForWindowDrag");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __96__SBContinuousExposeWindowDragSwitcherModifier__anyProposedAppLayoutContainsSelectedDisplayItem__block_invoke;
  v5[3] = &unk_1E8E9DF78;
  v5[4] = v2;
  LOBYTE(v2) = objc_msgSend(v3, "bs_containsObjectPassingTest:", v5);

  return (char)v2;
}

uint64_t __96__SBContinuousExposeWindowDragSwitcherModifier__anyProposedAppLayoutContainsSelectedDisplayItem__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "containsItem:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 264));
}

- (SBAppLayout)initialAppLayout
{
  return self->_initialAppLayout;
}

- (SBDisplayItem)selectedDisplayItem
{
  return self->_selectedDisplayItem;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedDisplayItem, 0);
  objc_storeStrong((id *)&self->_initialAppLayout, 0);
  objc_storeStrong((id *)&self->_autoLayoutController, 0);
  objc_storeStrong((id *)&self->_previousAutoLayoutSpace, 0);
  objc_storeStrong((id *)&self->_initialAutoLayoutSpace, 0);
  objc_storeStrong((id *)&self->_destinationModifier, 0);
  objc_storeStrong((id *)&self->_stageRubberbandingSettings, 0);
  objc_storeStrong((id *)&self->_stageRubberbandingRampingProperty, 0);
  objc_storeStrong((id *)&self->_anchorPointRampingProperty, 0);
}

@end
