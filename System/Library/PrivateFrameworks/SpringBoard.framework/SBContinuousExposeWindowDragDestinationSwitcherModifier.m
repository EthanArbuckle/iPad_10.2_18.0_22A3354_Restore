@implementation SBContinuousExposeWindowDragDestinationSwitcherModifier

- (SBContinuousExposeWindowDragDestinationSwitcherModifier)initWithSelectedDisplayItem:(id)a3 initialAppLayout:(id)a4 delegate:(id)a5
{
  id v10;
  id v11;
  id v12;
  SBContinuousExposeWindowDragDestinationSwitcherModifier *v13;
  void *v15;
  void *v16;
  void *v17;
  objc_super v18;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v18.receiver = self;
  v18.super_class = (Class)SBContinuousExposeWindowDragDestinationSwitcherModifier;
  v13 = -[SBSwitcherModifier init](&v18, sel_init);
  if (v13)
  {
    if (v10)
    {
      if (v11)
        goto LABEL_4;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, v13, CFSTR("SBContinuousExposeWindowDragDestinationSwitcherModifier.m"), 47, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("selectedDisplayItem"));

      if (v11)
      {
LABEL_4:
        if (v12)
        {
LABEL_5:
          objc_storeStrong((id *)&v13->_selectedDisplayItem, a3);
          objc_storeStrong((id *)&v13->_initialAppLayout, a4);
          objc_storeWeak((id *)&v13->_destinationDelegate, v12);
          v13->_proposedDestination = 0;
          objc_storeStrong((id *)&v13->_proposedAppLayout, v13->_initialAppLayout);
          objc_storeStrong((id *)&v13->_lastAppLayoutForStripCalculation, v13->_initialAppLayout);
          goto LABEL_6;
        }
LABEL_9:
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, v13, CFSTR("SBContinuousExposeWindowDragDestinationSwitcherModifier.m"), 49, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("delegate"));

        goto LABEL_5;
      }
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, v13, CFSTR("SBContinuousExposeWindowDragDestinationSwitcherModifier.m"), 48, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("initialAppLayout"));

    if (v12)
      goto LABEL_5;
    goto LABEL_9;
  }
LABEL_6:

  return v13;
}

- (void)didMoveToParentModifier:(id)a3
{
  SBContinuousExposeAutoLayoutSpace *v5;
  SBContinuousExposeAutoLayoutSpace *initialAutoLayoutSpace;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBContinuousExposeWindowDragDestinationSwitcherModifier;
  -[SBChainableModifier didMoveToParentModifier:](&v7, sel_didMoveToParentModifier_);
  if (a3)
  {
    if (!self->_initialAutoLayoutSpace)
    {
      -[SBSwitcherModifier autoLayoutSpaceForAppLayout:](self, "autoLayoutSpaceForAppLayout:", self->_initialAppLayout);
      v5 = (SBContinuousExposeAutoLayoutSpace *)objc_claimAutoreleasedReturnValue();
      initialAutoLayoutSpace = self->_initialAutoLayoutSpace;
      self->_initialAutoLayoutSpace = v5;

    }
  }
}

- (id)handleGestureEvent:(id)a3
{
  id v4;
  void *v5;
  CGPoint *p_location;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  SBDisplayItemLayoutAttributes *v15;
  SBDisplayItemLayoutAttributes *initialSelectedDisplayItemLayoutAttributes;
  void *v17;
  void *v18;
  uint64_t v19;
  double v20;
  double v21;
  double x;
  CGFloat y;
  int v24;
  int *v25;
  int *v26;
  CGPoint *p_initialLocation;
  void *v28;
  BOOL v29;
  int v30;
  _BOOL4 v31;
  double v32;
  double v33;
  void *v34;
  void *v35;
  char v36;
  _BOOL4 v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  int v45;
  BOOL v46;
  char v47;
  double stripWidthForCancelZone;
  double v49;
  _BOOL4 v50;
  uint64_t v51;
  int *v52;
  void *v53;
  id *v54;
  int v55;
  void *v56;
  int *v57;
  void *v58;
  unint64_t v59;
  int *v60;
  void *v61;
  void *v62;
  unint64_t v63;
  int v64;
  uint64_t v65;
  id v66;
  uint64_t v67;
  id v68;
  uint64_t v69;
  id v70;
  int *v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  void *v84;
  void *v85;
  uint64_t v86;
  id v87;
  double v88;
  double v89;
  double v90;
  double v91;
  void *v92;
  void *v93;
  uint64_t v94;
  SBDisplayItem *selectedDisplayItem;
  id v96;
  double v97;
  double v98;
  uint64_t v99;
  id v100;
  int v101;
  uint64_t v102;
  int v103;
  int v104;
  int v105;
  void *v106;
  uint64_t v107;
  BOOL v108;
  void *v109;
  void *v110;
  uint64_t v111;
  void *v112;
  int v113;
  void *v114;
  uint64_t v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  double v121;
  double v122;
  double v123;
  double v124;
  double v125;
  double v126;
  double v127;
  double v128;
  double v129;
  double v130;
  double v131;
  double v132;
  double v133;
  double v134;
  double v135;
  double v136;
  double v137;
  double v138;
  double v139;
  double v140;
  double v141;
  double v142;
  double v143;
  double v144;
  double v145;
  double v146;
  double v147;
  double v148;
  double v149;
  double v150;
  void *v151;
  void *v152;
  double v153;
  double v154;
  double v155;
  double v156;
  double v157;
  double v158;
  double v159;
  double v160;
  double v161;
  double v162;
  double v163;
  double v164;
  double v165;
  double v166;
  double v167;
  double v168;
  double v169;
  double v170;
  double v171;
  double v172;
  double v173;
  id v174;
  void *v175;
  void *v176;
  double v177;
  double v178;
  double v179;
  double v180;
  void *v181;
  id v182;
  void *v183;
  uint64_t v184;
  id v185;
  void *v186;
  id v187;
  uint64_t v188;
  double v189;
  double v190;
  double v191;
  double v192;
  double v193;
  double v194;
  double v195;
  double v196;
  double v197;
  double v198;
  double v199;
  double v200;
  uint64_t v201;
  uint64_t v202;
  uint64_t v203;
  id v204;
  void *v205;
  uint64_t v206;
  SBPerformTransitionSwitcherEventResponse *v207;
  void *v208;
  SBInvalidateContinuousExposeIdentifiersEventResponse *v209;
  uint64_t v211;
  void *v212;
  _BOOL4 v213;
  void *v214;
  _BOOL4 v215;
  int v216;
  void *v217;
  void *v218;
  int v219;
  void *v220;
  void *v221;
  _QWORD v222[5];
  _QWORD v223[5];
  _QWORD v224[5];
  objc_super v225;
  CGPoint v226;
  CGRect v227;
  CGRect v228;

  v4 = a3;
  v225.receiver = self;
  v225.super_class = (Class)SBContinuousExposeWindowDragDestinationSwitcherModifier;
  -[SBSwitcherModifier handleGestureEvent:](&v225, sel_handleGestureEvent_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  p_location = &self->_location;
  objc_msgSend(v4, "locationInContainerView");
  self->_location.x = v7;
  self->_location.y = v8;
  objc_msgSend(v4, "velocityInContainerView");
  self->_velocity.x = v9;
  self->_velocity.y = v10;
  -[SBContinuousExposeWindowDragDestinationSwitcherModifier chamoisLayoutAttributes](self, "chamoisLayoutAttributes");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBContinuousExposeWindowDragDestinationSwitcherModifier containerViewBounds](self, "containerViewBounds");
  v13 = v12;
  if (objc_msgSend(v4, "phase") == 1)
  {
    self->_initialLocation = *p_location;
    -[SBContinuousExposeWindowDragDestinationSwitcherModifier _appLayoutContainingDisplayItem:](self, "_appLayoutContainingDisplayItem:", self->_selectedDisplayItem);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "layoutAttributesForItem:", self->_selectedDisplayItem);
    v15 = (SBDisplayItemLayoutAttributes *)objc_claimAutoreleasedReturnValue();
    initialSelectedDisplayItemLayoutAttributes = self->_initialSelectedDisplayItemLayoutAttributes;
    self->_initialSelectedDisplayItemLayoutAttributes = v15;

    -[SBContinuousExposeWindowDragDestinationSwitcherModifier draggingAppLayoutsForWindowDrag](self, "draggingAppLayoutsForWindowDrag");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v224[0] = MEMORY[0x1E0C809B0];
    v224[1] = 3221225472;
    v224[2] = __78__SBContinuousExposeWindowDragDestinationSwitcherModifier_handleGestureEvent___block_invoke;
    v224[3] = &unk_1E8E9DF78;
    v224[4] = self;
    objc_msgSend(v17, "bs_firstObjectPassingTest:", v224);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = objc_msgSend(v18, "preferredDisplayOrdinal");
    self->_dragBeganInOtherSwitcher = v19 != -[SBContinuousExposeWindowDragDestinationSwitcherModifier displayOrdinal](self, "displayOrdinal");

LABEL_94:
    goto LABEL_95;
  }
  v221 = v11;
  -[SBContinuousExposeWindowDragDestinationSwitcherModifier _frameForSelectedDisplayItemAddingToStage:](self, "_frameForSelectedDisplayItemAddingToStage:", 0);
  v21 = v20;
  x = p_location->x;
  y = self->_location.y;
  -[SBContinuousExposeWindowDragDestinationSwitcherModifier containerViewBounds](self, "containerViewBounds");
  v226.x = x;
  v226.y = y;
  v24 = 0;
  v25 = &OBJC_IVAR___SBPhysicalButtonZStackPolicyAssistant__foregroundCaptureSceneTargets;
  v26 = &OBJC_IVAR___SBPhysicalButtonZStackPolicyAssistant__foregroundCaptureSceneTargets;
  v220 = v5;
  if (CGRectContainsPoint(v227, v226))
  {
    -[SBContinuousExposeWindowDragDestinationSwitcherModifier containerViewBounds](self, "containerViewBounds");
    p_initialLocation = &self->_initialLocation;
    if (!CGRectContainsPoint(v228, self->_initialLocation))
    {
      v24 = 1;
      goto LABEL_39;
    }
    -[SBAppLayout allItems](self->_initialAppLayout, "allItems");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v28, "count") == 1)
    {
      v29 = -[SBAppLayout containsItem:](self->_initialAppLayout, "containsItem:", self->_selectedDisplayItem);

      if (v29)
      {
        v24 = 1;
        v25 = &OBJC_IVAR___SBPhysicalButtonZStackPolicyAssistant__foregroundCaptureSceneTargets;
        v26 = &OBJC_IVAR___SBPhysicalButtonZStackPolicyAssistant__foregroundCaptureSceneTargets;
        goto LABEL_39;
      }
    }
    else
    {

    }
    v215 = -[SBAppLayout containsItem:](self->_initialAppLayout, "containsItem:", self->_selectedDisplayItem);
    v30 = -[SBContinuousExposeWindowDragDestinationSwitcherModifier isRTLEnabled](self, "isRTLEnabled");
    v31 = p_initialLocation->x < v13 * 0.5;
    if (v30)
      v31 = p_initialLocation->x >= v13 * 0.5;
    v213 = v31;
    -[SBSwitcherModifier autoLayoutSpaceForAppLayout:](self, "autoLayoutSpaceForAppLayout:", self->_proposedAppLayout, p_initialLocation->x);
    v218 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v218, "boundingBox");
    v33 = v32;
    -[SBContinuousExposeWindowDragDestinationSwitcherModifier switcherSettings](self, "switcherSettings");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "chamoisSettings");
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    if (-[SBAppLayout containsItem:](self->_initialAppLayout, "containsItem:", self->_selectedDisplayItem))
    {
      v36 = -[SBContinuousExposeWindowDragDestinationSwitcherModifier isContinuousExposeStripVisible](self, "isContinuousExposeStripVisible");
      v37 = -[SBAppLayout containsItem:](self->_proposedAppLayout, "containsItem:", self->_selectedDisplayItem);
      if ((v36 & 1) != 0 || !v37)
      {
        objc_msgSend(v11, "stripWidth");
        v43 = v42;
        objc_msgSend(v35, "stripDropZoneMultiplier");
        v39 = v43 * v44;
      }
      else
      {
        objc_msgSend(v11, "screenEdgePadding");
        v39 = v38;
      }
    }
    else
    {
      objc_msgSend(v11, "stripWidth");
      if (v40 >= (v13 - v33) * 0.5)
        v39 = (v13 - v33) * 0.5;
      else
        v39 = v40;
      -[SBContinuousExposeWindowDragDestinationSwitcherModifier continuousExposeStripProgress](self, "continuousExposeStripProgress");
      if (BSFloatGreaterThanFloat())
      {
        objc_msgSend(v11, "stripWidth");
        if (v39 < v41)
          v39 = v41;
      }
    }
    v45 = -[SBContinuousExposeWindowDragDestinationSwitcherModifier isRTLEnabled](self, "isRTLEnabled");
    v46 = x > v39;
    if (v45)
      v46 = x < v13 - v39;
    if (v46 || BSFloatIsZero())
      self->_stripWidthForCancelZone = v39;
    if (objc_msgSend(v35, "useLeadingWindowEdgeForDropZoneCalculations"))
      x = v21;
    v47 = -[SBContinuousExposeWindowDragDestinationSwitcherModifier isRTLEnabled](self, "isRTLEnabled");
    stripWidthForCancelZone = self->_stripWidthForCancelZone;
    if ((v47 & 1) != 0)
    {
      v26 = &OBJC_IVAR___SBPhysicalButtonZStackPolicyAssistant__foregroundCaptureSceneTargets;
      if (x >= v13 - stripWidthForCancelZone)
        goto LABEL_33;
    }
    else
    {
      v26 = &OBJC_IVAR___SBPhysicalButtonZStackPolicyAssistant__foregroundCaptureSceneTargets;
      if (x <= stripWidthForCancelZone)
      {
LABEL_33:
        if (-[SBAppLayout containsItem:](self->_initialAppLayout, "containsItem:", self->_selectedDisplayItem))
        {
          objc_msgSend(v11, "screenEdgePadding");
          v50 = self->_location.y <= v49 + v49;
        }
        else
        {
          v50 = 0;
        }
        goto LABEL_38;
      }
    }
    v50 = 1;
LABEL_38:
    v24 = (v215 || v213) && v50;

    v25 = &OBJC_IVAR___SBPhysicalButtonZStackPolicyAssistant__foregroundCaptureSceneTargets;
  }
LABEL_39:
  if (objc_msgSend(v4, "phase") == 3 && (fabs(self->_velocity.x) > 1000.0 || fabs(self->_velocity.y) > 1000.0))
  {
    v51 = v26[991];
    if (objc_msgSend(*(id *)((char *)&self->super.super.super.isa + v51), "containsItem:", self->_selectedDisplayItem))
    {
      -[SBSwitcherModifier autoLayoutSpaceForAppLayout:](self, "autoLayoutSpaceForAppLayout:", *(Class *)((char *)&self->super.super.super.isa + v51));
      v52 = v26;
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "stageArea");

      v26 = v52;
    }
  }
  v54 = (id *)((char *)&self->super.super.super.isa + v26[991]);
  v55 = objc_msgSend(*v54, "containsItem:", self->_selectedDisplayItem);
  if (!v24)
  {
    if (v55)
    {
      v65 = v25[988];
      if ((objc_msgSend(*(id *)((char *)&self->super.super.super.isa + v65), "containsItem:", self->_selectedDisplayItem) & 1) != 0)
      {
        v66 = *v54;
        v222[0] = MEMORY[0x1E0C809B0];
        v222[1] = 3221225472;
        v222[2] = __78__SBContinuousExposeWindowDragDestinationSwitcherModifier_handleGestureEvent___block_invoke_3;
        v222[3] = &unk_1E8E9DF50;
        v222[4] = self;
        objc_msgSend(v66, "appLayoutWithItemsPassingTest:", v222);
        v67 = objc_claimAutoreleasedReturnValue();
        v68 = *v54;
        *v54 = (id)v67;

        self->_proposedDestination = 3;
      }
      else
      {
        objc_storeStrong(v54, *(id *)((char *)&self->super.super.super.isa + v65));
        self->_proposedDestination = 0;
      }
      v216 = 1;
      v219 = 1;
      goto LABEL_60;
    }
LABEL_52:
    if (objc_msgSend(*v54, "containsItem:", self->_selectedDisplayItem))
    {
      -[SBContinuousExposeWindowDragDestinationSwitcherModifier appLayoutByBringingItemToFront:inAppLayout:](self, "appLayoutByBringingItemToFront:inAppLayout:", self->_selectedDisplayItem, *v54);
      v69 = objc_claimAutoreleasedReturnValue();
      v70 = *v54;
      *v54 = (id)v69;

      v71 = v25;
      UIRectGetCenter();
      v73 = v72;
      v75 = v74;
      -[SBContinuousExposeWindowDragDestinationSwitcherModifier containerViewBounds](self, "containerViewBounds");
      +[SBDisplayItemLayoutAttributes normalizedPointForPoint:inBounds:](SBDisplayItemLayoutAttributes, "normalizedPointForPoint:inBounds:", v73, v75, v76, v77, v78, v79);
      v81 = v80;
      v83 = v82;
      objc_msgSend(*v54, "layoutAttributesForItem:", self->_selectedDisplayItem);
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v84, "attributesByModifyingNormalizedCenter:", v81, v83);
      v85 = (void *)objc_claimAutoreleasedReturnValue();

      v25 = v71;
      objc_msgSend(*v54, "appLayoutByModifyingLayoutAttributes:forItem:", v85, self->_selectedDisplayItem);
      v86 = objc_claimAutoreleasedReturnValue();
      v87 = *v54;
      *v54 = (id)v86;

      v216 = 1;
      self->_proposedDestination = 1;

    }
    else
    {
      v216 = 0;
    }
    v219 = 0;
    goto LABEL_60;
  }
  if ((v55 & 1) != 0)
    goto LABEL_52;
  -[SBContinuousExposeWindowDragDestinationSwitcherModifier switcherSettings](self, "switcherSettings");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "chamoisSettings");
  v57 = v25;
  v58 = (void *)objc_claimAutoreleasedReturnValue();

  v59 = objc_msgSend(v58, "maximumNumberOfAppsOnStage");
  v60 = v57;
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + v57[988]), "allItems");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v223[0] = MEMORY[0x1E0C809B0];
  v223[1] = 3221225472;
  v223[2] = __78__SBContinuousExposeWindowDragDestinationSwitcherModifier_handleGestureEvent___block_invoke_2;
  v223[3] = &unk_1E8E9DF50;
  v223[4] = self;
  objc_msgSend(v61, "bs_filter:", v223);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = objc_msgSend(v62, "count");

  if (v63 >= v59 && (objc_msgSend(v58, "rejectDropsWhenStageIsFull") & 1) != 0)
  {
    v64 = 0;
  }
  else
  {
    -[SBContinuousExposeWindowDragDestinationSwitcherModifier _frameForSelectedDisplayItemAddingToStage:](self, "_frameForSelectedDisplayItemAddingToStage:", 1);
    v89 = v88;
    v91 = v90;
    -[SBContinuousExposeWindowDragDestinationSwitcherModifier _appLayoutContainingDisplayItem:](self, "_appLayoutContainingDisplayItem:", self->_selectedDisplayItem);
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v92, "layoutAttributesForItem:", self->_selectedDisplayItem);
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    v94 = objc_msgSend(v93, "isPositionSystemManaged");

    selectedDisplayItem = self->_selectedDisplayItem;
    v96 = *v54;
    UIRectGetCenter();
    -[SBContinuousExposeWindowDragDestinationSwitcherModifier _appLayoutByAddingItem:toAppLayout:size:center:positionIsSystemManaged:](self, "_appLayoutByAddingItem:toAppLayout:size:center:positionIsSystemManaged:", selectedDisplayItem, v96, v94, v89, v91, v97, v98);
    v99 = objc_claimAutoreleasedReturnValue();
    v100 = *v54;
    *v54 = (id)v99;

    self->_proposedDestination = 2;
    v64 = 1;
  }

  v216 = v64;
  v219 = v64;
  v5 = v220;
  v25 = v60;
LABEL_60:
  v101 = objc_msgSend(*v54, "containsItem:", self->_selectedDisplayItem);
  v102 = v25[988];
  v103 = objc_msgSend(*(id *)((char *)&self->super.super.super.isa + v102), "containsItem:", self->_selectedDisplayItem);
  v104 = v103;
  v105 = v101 ^ 1;
  if (((v101 ^ 1) & 1) == 0
    && v103
    && (objc_msgSend(*(id *)((char *)&self->super.super.super.isa + v102), "allItems"),
        v106 = (void *)objc_claimAutoreleasedReturnValue(),
        v107 = objc_msgSend(v106, "count"),
        v106,
        v108 = v107 == 1,
        v5 = v220,
        v108))
  {
    objc_msgSend(*v54, "layoutAttributesForItem:", self->_selectedDisplayItem);
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v109, "attributesByModifyingPositionIsSystemManaged:", 0);
    v110 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*v54, "appLayoutByModifyingLayoutAttributes:forItem:", v110, self->_selectedDisplayItem);
    v111 = objc_claimAutoreleasedReturnValue();
    v112 = *v54;
    *v54 = (id)v111;
  }
  else
  {
    if (((v101 | v104) & 1) != 0)
      goto LABEL_68;
    -[SBContinuousExposeWindowDragDestinationSwitcherModifier _appLayoutContainingDisplayItem:](self, "_appLayoutContainingDisplayItem:", self->_selectedDisplayItem);
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v112, "appLayoutByModifyingLayoutAttributes:forItem:", self->_initialSelectedDisplayItemLayoutAttributes, self->_selectedDisplayItem);
    v110 = (void *)objc_claimAutoreleasedReturnValue();
  }

LABEL_68:
  if ((v105 | v104) == 1)
  {
LABEL_69:
    v113 = v219;
    if ((v216 & 1) == 0)
      goto LABEL_70;
    goto LABEL_86;
  }
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + v102), "allItems");
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  v115 = objc_msgSend(v114, "count");

  if (v115 == 1)
  {
    objc_msgSend(*(id *)((char *)&self->super.super.super.isa + v102), "allItems");
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v116, "firstObject");
    v117 = (void *)objc_claimAutoreleasedReturnValue();

    -[SBSwitcherModifier autoLayoutSpaceForAppLayout:](self, "autoLayoutSpaceForAppLayout:", *(Class *)((char *)&self->super.super.super.isa + v102));
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v118, "autoLayoutItemForDisplayItem:", v117);
    v119 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)((char *)&self->super.super.super.isa + v102), "layoutAttributesForItem:", v117);
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBContinuousExposeWindowDragDestinationSwitcherModifier containerViewBounds](self, "containerViewBounds");
    v122 = v121;
    v124 = v123;
    v126 = v125;
    v128 = v127;
    objc_msgSend(v11, "defaultWindowSize");
    v130 = v129;
    v132 = v131;
    objc_msgSend(v11, "screenEdgePadding");
    objc_msgSend(v120, "userSizeBeforeOverlappingInBounds:defaultSize:screenEdgePadding:", v122, v124, v126, v128, v130, v132, v133);
    v135 = v134;
    -[SBContinuousExposeWindowDragDestinationSwitcherModifier containerViewBounds](self, "containerViewBounds");
    v137 = v136;
    v139 = v138;
    v141 = v140;
    v143 = v142;
    objc_msgSend(v11, "defaultWindowSize");
    v145 = v144;
    v147 = v146;
    objc_msgSend(v11, "screenEdgePadding");
    objc_msgSend(v120, "sizeInBounds:defaultSize:screenEdgePadding:", v137, v139, v141, v143, v145, v147, v148);
    v150 = v149;
    if ((objc_msgSend(v119, "isInDefaultPosition") & 1) != 0 || v135 > v150)
    {
      -[SBSwitcherModifier autoLayoutSpaceForAppLayout:](self, "autoLayoutSpaceForAppLayout:", *v54);
      v151 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v151, "autoLayoutItemForDisplayItem:", self->_selectedDisplayItem);
      v152 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v152, "position");
      v154 = v153;
      objc_msgSend(v152, "size");
      v156 = v155;
      objc_msgSend(v151, "stageArea");
      v158 = v157;
      v160 = v159;
      objc_msgSend(v119, "position");
      v162 = v161;
      v113 = v219;
      v214 = v117;
      v217 = v151;
      v212 = v152;
      if (v154 >= v158 + v160 * 0.5)
      {
        v169 = v158 + v160 - v156 * 0.5;
        if (v154 < v169)
          v169 = v154;
        v170 = v169 - v156 * 0.5;
        v11 = v221;
        objc_msgSend(v221, "stageInterItemSpacing");
        v172 = v170 - v171;
        objc_msgSend(v119, "size");
        v168 = v172 - v173 * 0.5;
      }
      else
      {
        v163 = v156 * 0.5 + v158;
        if (v154 >= v163)
          v163 = v154;
        v164 = v156 * 0.5 + v163;
        v11 = v221;
        objc_msgSend(v221, "stageInterItemSpacing");
        v166 = v164 + v165;
        objc_msgSend(v119, "size");
        v168 = v166 + v167 * 0.5;
      }
      v174 = *v54;
      objc_msgSend(v119, "displayItem");
      v175 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v174, "layoutAttributesForItem:", v175);
      v176 = (void *)objc_claimAutoreleasedReturnValue();

      -[SBContinuousExposeWindowDragDestinationSwitcherModifier containerViewBounds](self, "containerViewBounds");
      +[SBDisplayItemLayoutAttributes normalizedPointForPoint:inBounds:](SBDisplayItemLayoutAttributes, "normalizedPointForPoint:inBounds:", v168, v162, v177, v178, v179, v180);
      objc_msgSend(v176, "attributesByModifyingNormalizedCenter:");
      v181 = (void *)objc_claimAutoreleasedReturnValue();

      v182 = *v54;
      objc_msgSend(v119, "displayItem");
      v183 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v182, "appLayoutByModifyingLayoutAttributes:forItem:", v181, v183);
      v184 = objc_claimAutoreleasedReturnValue();
      v185 = *v54;
      *v54 = (id)v184;

      goto LABEL_86;
    }

    goto LABEL_69;
  }
  v113 = v219;
  if (!v216)
  {
LABEL_70:
    if (!v113)
      goto LABEL_95;
    goto LABEL_87;
  }
LABEL_86:
  -[SBContinuousExposeWindowDragDestinationSwitcherModifier displayItemLayoutAttributesCalculator](self, "displayItemLayoutAttributesCalculator");
  v186 = (void *)objc_claimAutoreleasedReturnValue();
  v187 = *v54;
  v188 = -[SBContinuousExposeWindowDragDestinationSwitcherModifier switcherInterfaceOrientation](self, "switcherInterfaceOrientation");
  -[SBContinuousExposeWindowDragDestinationSwitcherModifier floatingDockHeight](self, "floatingDockHeight");
  v190 = v189;
  -[SBContinuousExposeWindowDragDestinationSwitcherModifier screenScale](self, "screenScale");
  v192 = v191;
  -[SBContinuousExposeWindowDragDestinationSwitcherModifier containerViewBounds](self, "containerViewBounds");
  v194 = v193;
  v196 = v195;
  v198 = v197;
  v200 = v199;
  v201 = -[SBContinuousExposeWindowDragDestinationSwitcherModifier prefersStripHidden](self, "prefersStripHidden");
  LOBYTE(v211) = -[SBContinuousExposeWindowDragDestinationSwitcherModifier prefersDockHidden](self, "prefersDockHidden");
  v202 = v201;
  v5 = v220;
  objc_msgSend(v186, "appLayoutByPerformingAutoLayoutForAppLayout:previousAppLayout:options:containerOrientation:chamoisLayoutAttributes:floatingDockHeight:screenScale:bounds:prefersStripHidden:prefersDockHidden:source:", v187, 0, 0, v188, v11, v202, v190, v192, v194, v196, v198, v200, v211, 11);
  v203 = objc_claimAutoreleasedReturnValue();
  v204 = *v54;
  *v54 = (id)v203;

  if (v113)
  {
LABEL_87:
    +[SBSwitcherTransitionRequest requestForActivatingAppLayout:](SBMutableSwitcherTransitionRequest, "requestForActivatingAppLayout:", *v54);
    v205 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v205;
    if (*v54)
      v206 = 3;
    else
      v206 = 1;
    objc_msgSend(v205, "setUnlockedEnvironmentMode:", v206);
    objc_msgSend(v14, "setSceneUpdatesOnly:", 1);
    objc_msgSend(v14, "setFenceSceneUpdate:", 0);
    objc_msgSend(v14, "setPreventSwitcherRecencyModelUpdates:", 1);
    v207 = -[SBPerformTransitionSwitcherEventResponse initWithTransitionRequest:gestureInitiated:]([SBPerformTransitionSwitcherEventResponse alloc], "initWithTransitionRequest:gestureInitiated:", v14, 1);
    SBAppendSwitcherModifierResponse(v207, v5);
    v208 = (void *)objc_claimAutoreleasedReturnValue();

    if (-[SBAppLayout containsAllItemsFromAppLayout:](self->_lastAppLayoutForStripCalculation, "containsAllItemsFromAppLayout:", *v54))
    {
      v5 = v208;
    }
    else
    {
      objc_storeStrong((id *)&self->_lastAppLayoutForStripCalculation, *v54);
      v209 = -[SBInvalidateContinuousExposeIdentifiersEventResponse initWithTransitioningFromAppLayout:transitioningToAppLayout:animated:]([SBInvalidateContinuousExposeIdentifiersEventResponse alloc], "initWithTransitioningFromAppLayout:transitioningToAppLayout:animated:", 0, 0, 1);
      SBAppendSwitcherModifierResponse(v209, v208);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v11 = v221;
    goto LABEL_94;
  }
LABEL_95:

  return v5;
}

uint64_t __78__SBContinuousExposeWindowDragDestinationSwitcherModifier_handleGestureEvent___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "containsItem:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 184));
}

BOOL __78__SBContinuousExposeWindowDragDestinationSwitcherModifier_handleGestureEvent___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return SBLayoutRoleIsValidForSplitView(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 192), "layoutRoleForItem:", a2));
}

uint64_t __78__SBContinuousExposeWindowDragDestinationSwitcherModifier_handleGestureEvent___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isEqual:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 184)) ^ 1;
}

- (id)proposedAppLayoutForWindowDrag
{
  return self->_proposedAppLayout;
}

- (id)appLayoutByAddingAppLayout:(id)a3 toAppLayout:(id)a4
{
  id v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  uint64_t v14;
  double v15;
  double v16;
  void *v17;

  v6 = a4;
  v7 = a3;
  -[SBContinuousExposeWindowDragDestinationSwitcherModifier _frameForSelectedAppLayout:addingToStage:](self, "_frameForSelectedAppLayout:addingToStage:", v7, 0);
  v9 = v8;
  v11 = v10;
  objc_msgSend(v7, "itemForLayoutRole:", 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "layoutAttributesForItem:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_msgSend(v13, "isPositionSystemManaged");
  UIRectGetCenter();
  -[SBContinuousExposeWindowDragDestinationSwitcherModifier _appLayoutByAddingItem:toAppLayout:size:center:positionIsSystemManaged:](self, "_appLayoutByAddingItem:toAppLayout:size:center:positionIsSystemManaged:", v12, v6, v14, v9, v11, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (void)updateProposedAppLayoutWithAppLayout:(id)a3 andInitialAppLayout:(id)a4
{
  id v7;
  SBAppLayout **p_initialAppLayout;
  id v9;

  v9 = a3;
  v7 = a4;
  if (!-[SBAppLayout isEqual:](self->_proposedAppLayout, "isEqual:", v9))
    objc_storeStrong((id *)&self->_proposedAppLayout, a3);
  p_initialAppLayout = &self->_initialAppLayout;
  if (!-[SBAppLayout isEqual:](*p_initialAppLayout, "isEqual:", v7))
    objc_storeStrong((id *)p_initialAppLayout, a4);

}

- (CGRect)_frameForSelectedAppLayout:(id)a3 addingToStage:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  _BOOL4 v7;
  BOOL v8;
  BOOL v9;
  void *v10;
  SBDisplayItemLayoutAttributes *initialSelectedDisplayItemLayoutAttributes;
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
  uint64_t v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  uint64_t v34;
  void *v35;
  double v36;
  double v37;
  double v38;
  double v39;
  uint64_t v40;
  _BOOL8 v41;
  SBAppLayout *proposedAppLayout;
  id WeakRetained;
  double v44;
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
  uint64_t v56;
  CGRect result;

  v4 = a4;
  v6 = a3;
  v7 = -[SBContinuousExposeWindowDragDestinationSwitcherModifier _anyProposedAppLayoutContainsSelectedDisplayItem](self, "_anyProposedAppLayoutContainsSelectedDisplayItem");
  v8 = -[SBAppLayout containsItem:](self->_proposedAppLayout, "containsItem:", self->_selectedDisplayItem);
  v9 = !self->_dragBeganInOtherSwitcher || !v7;
  if (v9 || v8)
  {
    -[SBContinuousExposeWindowDragDestinationSwitcherModifier displayItemLayoutAttributesCalculator](self, "displayItemLayoutAttributesCalculator");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v6, "layoutRoleForItem:", self->_selectedDisplayItem);
    -[SBContinuousExposeWindowDragDestinationSwitcherModifier containerViewBounds](self, "containerViewBounds");
    v27 = v26;
    v29 = v28;
    v31 = v30;
    v33 = v32;
    v34 = -[SBContinuousExposeWindowDragDestinationSwitcherModifier switcherInterfaceOrientation](self, "switcherInterfaceOrientation");
    -[SBContinuousExposeWindowDragDestinationSwitcherModifier chamoisLayoutAttributes](self, "chamoisLayoutAttributes");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBContinuousExposeWindowDragDestinationSwitcherModifier floatingDockHeight](self, "floatingDockHeight");
    v37 = v36;
    -[SBContinuousExposeWindowDragDestinationSwitcherModifier screenScale](self, "screenScale");
    v39 = v38;
    v40 = -[SBContinuousExposeWindowDragDestinationSwitcherModifier prefersStripHidden](self, "prefersStripHidden");
    LOBYTE(v56) = -[SBContinuousExposeWindowDragDestinationSwitcherModifier prefersDockHidden](self, "prefersDockHidden");
    objc_msgSend(v10, "frameForLayoutRole:inAppLayout:containerBounds:containerOrientation:chamoisLayoutAttributes:floatingDockHeight:screenScale:isChamoisWindowingUIEnabled:prefersStripHidden:prefersDockHidden:", v25, v6, v34, v35, 1, v40, v27, v29, v31, v33, v37, v39, v56);

  }
  else
  {
    -[SBContinuousExposeWindowDragDestinationSwitcherModifier chamoisLayoutAttributes](self, "chamoisLayoutAttributes");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    initialSelectedDisplayItemLayoutAttributes = self->_initialSelectedDisplayItemLayoutAttributes;
    -[SBContinuousExposeWindowDragDestinationSwitcherModifier containerViewBounds](self, "containerViewBounds");
    v13 = v12;
    v15 = v14;
    v17 = v16;
    v19 = v18;
    objc_msgSend(v10, "defaultWindowSize");
    v21 = v20;
    v23 = v22;
    objc_msgSend(v10, "screenEdgePadding");
    -[SBDisplayItemLayoutAttributes sizeInBounds:defaultSize:screenEdgePadding:](initialSelectedDisplayItemLayoutAttributes, "sizeInBounds:defaultSize:screenEdgePadding:", v13, v15, v17, v19, v21, v23, v24);
  }

  v41 = !self->_dragBeganInOtherSwitcher && v4;
  if (!self->_dragBeganInOtherSwitcher && !v4)
  {
    proposedAppLayout = self->_proposedAppLayout;
    if (proposedAppLayout
      && -[SBAppLayout containsItem:](proposedAppLayout, "containsItem:", self->_selectedDisplayItem))
    {
      v41 = -[SBAppLayout containsItem:](self->_initialAppLayout, "containsItem:", self->_selectedDisplayItem) ^ 1;
    }
    else
    {
      v41 = 0;
    }
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_destinationDelegate);
  objc_msgSend(WeakRetained, "preferredCenterForSelectedItemInDestinationModifier:clippingToInitialStageArea:", self, v41);

  SBRectWithSize();
  UIRectCenteredAboutPoint();
  v45 = v44;
  v47 = v46;
  v49 = v48;
  v51 = v50;

  v52 = v45;
  v53 = v47;
  v54 = v49;
  v55 = v51;
  result.size.height = v55;
  result.size.width = v54;
  result.origin.y = v53;
  result.origin.x = v52;
  return result;
}

- (CGRect)_frameForSelectedDisplayItemAddingToStage:(BOOL)a3
{
  _BOOL8 v3;
  SBAppLayout *v5;
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
  double v16;
  double v17;
  double v18;
  CGRect result;

  v3 = a3;
  if (-[SBAppLayout containsItem:](self->_proposedAppLayout, "containsItem:", self->_selectedDisplayItem))
  {
    v5 = self->_proposedAppLayout;
  }
  else
  {
    -[SBContinuousExposeWindowDragDestinationSwitcherModifier _appLayoutContainingDisplayItem:](self, "_appLayoutContainingDisplayItem:", self->_selectedDisplayItem);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBContinuousExposeWindowDragDestinationSwitcherModifier appLayoutContainingAppLayout:](self, "appLayoutContainingAppLayout:", v6);
    v5 = (SBAppLayout *)objc_claimAutoreleasedReturnValue();

  }
  -[SBContinuousExposeWindowDragDestinationSwitcherModifier _frameForSelectedAppLayout:addingToStage:](self, "_frameForSelectedAppLayout:addingToStage:", v5, v3);
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;

  v15 = v8;
  v16 = v10;
  v17 = v12;
  v18 = v14;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (id)_appLayoutByAddingItem:(id)a3 toAppLayout:(id)a4 size:(CGSize)a5 center:(CGPoint)a6 positionIsSystemManaged:(BOOL)a7
{
  double y;
  double x;
  double height;
  double width;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
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
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  SBDisplayItemLayoutAttributes *v39;
  void *v40;
  void *v41;
  void *v42;
  SBAppLayout *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  SBAppLayout *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  uint64_t v64;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  SBDisplayItemLayoutAttributes *v69;
  void *v70;
  void *v71;
  void *v72;
  _BYTE v73[56];
  __int128 v74;
  __int128 v75;
  __int128 v76;
  uint64_t v77;
  _QWORD v78[5];
  __int128 v79;
  __int128 v80;
  __int128 v81;
  uint64_t v82;
  id v83;
  _QWORD v84[4];

  y = a6.y;
  x = a6.x;
  height = a5.height;
  width = a5.width;
  v84[1] = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  if (objc_msgSend(v15, "containsItem:", v14))
  {
    v16 = v15;
LABEL_8:
    v36 = v16;
    goto LABEL_14;
  }
  if (!v15)
  {
    -[SBContinuousExposeWindowDragDestinationSwitcherModifier appLayoutByBringingItemToFront:inAppLayout:](self, "appLayoutByBringingItemToFront:inAppLayout:", v14, self->_initialAppLayout);
    v16 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  objc_msgSend(v15, "allItems");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v17, "mutableCopy");

  v72 = v18;
  objc_msgSend(v18, "addObject:", v14);
  -[SBContinuousExposeWindowDragDestinationSwitcherModifier chamoisLayoutAttributes](self, "chamoisLayoutAttributes");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBContinuousExposeWindowDragDestinationSwitcherModifier containerViewBounds](self, "containerViewBounds");
  v21 = v20;
  v23 = v22;
  v25 = v24;
  v27 = v26;
  +[SBDisplayItemLayoutAttributes normalizedPointForPoint:inBounds:](SBDisplayItemLayoutAttributes, "normalizedPointForPoint:inBounds:", x, y, v20, v22, v24, v26);
  v29 = v28;
  v31 = v30;
  v82 = 0;
  v80 = 0u;
  v81 = 0u;
  v79 = 0u;
  -[SBContinuousExposeWindowDragDestinationSwitcherModifier draggingAppLayoutsForWindowDrag](self, "draggingAppLayoutsForWindowDrag");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v78[0] = MEMORY[0x1E0C809B0];
  v78[1] = 3221225472;
  v78[2] = __130__SBContinuousExposeWindowDragDestinationSwitcherModifier__appLayoutByAddingItem_toAppLayout_size_center_positionIsSystemManaged___block_invoke;
  v78[3] = &unk_1E8E9DF78;
  v78[4] = self;
  objc_msgSend(v32, "bs_firstObjectPassingTest:", v78);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  v70 = v19;
  v71 = v33;
  if (v33
    && (v34 = objc_msgSend(v33, "preferredDisplayOrdinal"),
        v34 != -[SBContinuousExposeWindowDragDestinationSwitcherModifier displayOrdinal](self, "displayOrdinal")))
  {
    objc_msgSend(v33, "layoutAttributesForItem:", self->_selectedDisplayItem);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = v37;
    if (v37)
    {
      objc_msgSend(v37, "attributedSize");
    }
    else
    {
      v77 = 0;
      v75 = 0u;
      v76 = 0u;
      v74 = 0u;
    }
    v79 = v74;
    v80 = v75;
    v81 = v76;
    v82 = v77;

  }
  else
  {
    objc_msgSend(v19, "defaultWindowSize");
    objc_msgSend(v19, "screenEdgePadding");
    v66 = v35;
    SBDisplayItemAttributedSizeInfer((uint64_t)&v79, width, height, v21, v23, v25, v27);
  }
  v39 = [SBDisplayItemLayoutAttributes alloc];
  SBDisplayItemAttributedSizeUnspecified((uint64_t)v73);
  v74 = v79;
  v75 = v80;
  v76 = v81;
  v77 = v82;
  LOBYTE(v66) = a7;
  v69 = -[SBDisplayItemLayoutAttributes initWithContentOrientation:lastInteractionTime:sizingPolicy:attributedSize:normalizedCenter:occlusionState:attributedUserSizeBeforeOverlapping:unoccludedPeekingCenter:positionIsSystemManaged:](v39, "initWithContentOrientation:lastInteractionTime:sizingPolicy:attributedSize:normalizedCenter:occlusionState:attributedUserSizeBeforeOverlapping:unoccludedPeekingCenter:positionIsSystemManaged:", 0, 0, 0, &v74, 0, v73, v29, v31, 0.0, 0.0, v66);
  objc_msgSend(v15, "itemsToLayoutAttributesMap");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = (void *)objc_msgSend(v40, "mutableCopy");

  v83 = v14;
  v84[0] = v69;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v84, &v83, 1);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "addEntriesFromDictionary:", v42);

  v43 = [SBAppLayout alloc];
  objc_msgSend(v15, "itemForLayoutRole:", 4);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "itemForLayoutRole:", 3);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = objc_msgSend(v15, "centerConfiguration");
  v47 = objc_msgSend(v15, "environment");
  LOBYTE(v68) = objc_msgSend(v15, "isHidden");
  v48 = -[SBAppLayout initWithItems:centerItem:floatingItem:configuration:itemsToLayoutAttributes:centerConfiguration:environment:hidden:preferredDisplayOrdinal:](v43, "initWithItems:centerItem:floatingItem:configuration:itemsToLayoutAttributes:centerConfiguration:environment:hidden:preferredDisplayOrdinal:", v72, v44, v45, 3, v41, v46, v47, v68, objc_msgSend(v15, "preferredDisplayOrdinal"));

  -[SBContinuousExposeWindowDragDestinationSwitcherModifier appLayoutByBringingItemToFront:inAppLayout:](self, "appLayoutByBringingItemToFront:inAppLayout:", v14, v48);
  v49 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBContinuousExposeWindowDragDestinationSwitcherModifier displayItemLayoutAttributesCalculator](self, "displayItemLayoutAttributesCalculator");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = -[SBContinuousExposeWindowDragDestinationSwitcherModifier switcherInterfaceOrientation](self, "switcherInterfaceOrientation");
  -[SBContinuousExposeWindowDragDestinationSwitcherModifier floatingDockHeight](self, "floatingDockHeight");
  v53 = v52;
  -[SBContinuousExposeWindowDragDestinationSwitcherModifier screenScale](self, "screenScale");
  v55 = v54;
  -[SBContinuousExposeWindowDragDestinationSwitcherModifier containerViewBounds](self, "containerViewBounds");
  v57 = v56;
  v59 = v58;
  v61 = v60;
  v63 = v62;
  v64 = -[SBContinuousExposeWindowDragDestinationSwitcherModifier prefersStripHidden](self, "prefersStripHidden");
  LOBYTE(v67) = -[SBContinuousExposeWindowDragDestinationSwitcherModifier prefersDockHidden](self, "prefersDockHidden");
  objc_msgSend(v50, "appLayoutByPerformingAutoLayoutForAppLayout:previousAppLayout:options:containerOrientation:chamoisLayoutAttributes:floatingDockHeight:screenScale:bounds:prefersStripHidden:prefersDockHidden:source:", v49, 0, 0, v51, v70, v64, v53, v55, v57, v59, v61, v63, v67, 11);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_14:
  return v36;
}

uint64_t __130__SBContinuousExposeWindowDragDestinationSwitcherModifier__appLayoutByAddingItem_toAppLayout_size_center_positionIsSystemManaged___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "containsItem:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 184));
}

- (id)_appLayoutContainingDisplayItem:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  NSObject *v8;
  _BOOL4 v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, void *);
  void *v14;
  id v15;

  v4 = a3;
  -[SBContinuousExposeWindowDragDestinationSwitcherModifier appLayouts](self, "appLayouts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __91__SBContinuousExposeWindowDragDestinationSwitcherModifier__appLayoutContainingDisplayItem___block_invoke;
  v14 = &unk_1E8E9DF78;
  v6 = v4;
  v15 = v6;
  objc_msgSend(v5, "bs_firstObjectPassingTest:", &v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    SBLogCommon();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);

    if (v9)
      NSLog(CFSTR("Expected an app layout containing item '%@'"), v6, v11, v12, v13, v14);
  }

  return v7;
}

uint64_t __91__SBContinuousExposeWindowDragDestinationSwitcherModifier__appLayoutContainingDisplayItem___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "containsItem:", *(_QWORD *)(a1 + 32));
}

- (BOOL)_anyProposedAppLayoutContainsSelectedDisplayItem
{
  SBContinuousExposeWindowDragDestinationSwitcherModifier *v2;
  void *v3;
  _QWORD v5[5];

  v2 = self;
  -[SBContinuousExposeWindowDragDestinationSwitcherModifier proposedAppLayoutsForWindowDrag](self, "proposedAppLayoutsForWindowDrag");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __107__SBContinuousExposeWindowDragDestinationSwitcherModifier__anyProposedAppLayoutContainsSelectedDisplayItem__block_invoke;
  v5[3] = &unk_1E8E9DF78;
  v5[4] = v2;
  LOBYTE(v2) = objc_msgSend(v3, "bs_containsObjectPassingTest:", v5);

  return (char)v2;
}

uint64_t __107__SBContinuousExposeWindowDragDestinationSwitcherModifier__anyProposedAppLayoutContainsSelectedDisplayItem__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "containsItem:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 184));
}

- (SBDisplayItem)selectedDisplayItem
{
  return self->_selectedDisplayItem;
}

- (SBAppLayout)initialAppLayout
{
  return self->_initialAppLayout;
}

- (SBContinuousExposeWindowDragDestinationSwitcherModifierDelegate)destinationDelegate
{
  return (SBContinuousExposeWindowDragDestinationSwitcherModifierDelegate *)objc_loadWeakRetained((id *)&self->_destinationDelegate);
}

- (unint64_t)proposedDestination
{
  return self->_proposedDestination;
}

- (SBAppLayout)proposedAppLayout
{
  return self->_proposedAppLayout;
}

- (SBAppLayout)hoveringOverAppLayout
{
  return self->_hoveringOverAppLayout;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hoveringOverAppLayout, 0);
  objc_storeStrong((id *)&self->_proposedAppLayout, 0);
  objc_destroyWeak((id *)&self->_destinationDelegate);
  objc_storeStrong((id *)&self->_initialAppLayout, 0);
  objc_storeStrong((id *)&self->_selectedDisplayItem, 0);
  objc_storeStrong((id *)&self->_lastAppLayoutForStripCalculation, 0);
  objc_storeStrong((id *)&self->_initialAutoLayoutSpace, 0);
  objc_storeStrong((id *)&self->_initialSelectedDisplayItemLayoutAttributes, 0);
}

@end
