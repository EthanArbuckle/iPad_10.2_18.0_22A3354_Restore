@implementation SBMainSwitcherRootSwitcherModifier

- (SBMainSwitcherRootSwitcherModifier)init
{
  SBMainSwitcherRootSwitcherModifier *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBMainSwitcherRootSwitcherModifier;
  result = -[SBSwitcherModifier init](&v3, sel_init);
  if (result)
    *(_QWORD *)&result->_floatingCardSize.height = 1;
  return result;
}

- (id)adjustedAppLayoutsForAppLayouts:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SBMainSwitcherRootSwitcherModifier;
  -[SBMainSwitcherRootSwitcherModifier adjustedAppLayoutsForAppLayouts:](&v8, sel_adjustedAppLayoutsForAppLayouts_, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bs_filter:", &__block_literal_global_55);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bs_filter:", &__block_literal_global_3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "arrayByAddingObjectsFromArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

BOOL __70__SBMainSwitcherRootSwitcherModifier_adjustedAppLayoutsForAppLayouts___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "environment") == 2;
}

BOOL __70__SBMainSwitcherRootSwitcherModifier_adjustedAppLayoutsForAppLayouts___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "environment") != 2;
}

- (id)gestureModifierForGestureEvent:(id)a3
{
  id v4;
  void *v5;
  SBGridSwipeUpGestureSwitcherModifier *v6;
  SBDragAndDropGestureRootSwitcherModifier *v7;
  void *v8;
  SBGridSwipeUpGestureSwitcherModifier *v9;
  void *v10;
  SBMedusaWindowDragGestureRootSwitcherModifier *v11;
  void *v12;

  v4 = a3;
  objc_msgSend(v4, "gestureID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[SBMainSwitcherRootSwitcherModifier _correctFloorModifierToHandleEvent](self, "_correctFloorModifierToHandleEvent")&& objc_msgSend(v4, "gestureType") == 2)
  {
    v6 = -[SBGridSwipeUpGestureSwitcherModifier initWithGestureID:]([SBGridSwipeUpGestureSwitcherModifier alloc], "initWithGestureID:", v5);
  }
  else
  {
    v6 = 0;
  }
  if (objc_msgSend(v4, "gestureType") == 6)
  {
    v7 = -[SBDragAndDropGestureRootSwitcherModifier initWithStartingEnvironmentMode:floatingSwitcherVisible:fullScreenAppLayout:]([SBDragAndDropGestureRootSwitcherModifier alloc], "initWithStartingEnvironmentMode:floatingSwitcherVisible:fullScreenAppLayout:", *(_QWORD *)&self->_floatingCardSize.height, LOBYTE(self->_environmentMode), *(_QWORD *)&self->_floatingSwitcherVisible);
LABEL_12:

    v6 = (SBGridSwipeUpGestureSwitcherModifier *)v7;
    goto LABEL_13;
  }
  if (objc_msgSend(v4, "gestureType") == 8)
  {
    v8 = *(void **)&self->_floatingSwitcherVisible;
    if (v8)
    {
      v9 = v8;
    }
    else
    {
      +[SBAppLayout homeScreenAppLayout](SBAppLayout, "homeScreenAppLayout");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "appLayoutByModifyingPreferredDisplayOrdinal:", -[SBMainSwitcherRootSwitcherModifier displayOrdinal](self, "displayOrdinal"));
      v9 = (SBGridSwipeUpGestureSwitcherModifier *)objc_claimAutoreleasedReturnValue();

    }
    v11 = [SBMedusaWindowDragGestureRootSwitcherModifier alloc];
    objc_msgSend(v4, "selectedAppLayout");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[SBMedusaWindowDragGestureRootSwitcherModifier initWithSelectedLeafAppLayout:currentMainAppLayout:currentFloatingAppLayout:currentFloatingConfiguration:](v11, "initWithSelectedLeafAppLayout:currentMainAppLayout:currentFloatingAppLayout:currentFloatingConfiguration:", v12, v9, self->_appLayout, self->_floatingAppLayout);

    v6 = v9;
    goto LABEL_12;
  }
LABEL_13:

  return v6;
}

- (id)handleTransitionEvent:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  SBAppLayout *v7;
  SBAppLayout *appLayout;
  void *v9;
  objc_super v11;

  v4 = a3;
  *(_QWORD *)&self->_floatingCardSize.height = objc_msgSend(v4, "toEnvironmentMode");
  LOBYTE(self->_environmentMode) = objc_msgSend(v4, "toFloatingSwitcherVisible");
  BYTE1(self->_environmentMode) = SBPeekConfigurationIsValid(objc_msgSend(v4, "toPeekConfiguration"));
  objc_msgSend(v4, "toAppLayout");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(void **)&self->_floatingSwitcherVisible;
  *(_QWORD *)&self->_floatingSwitcherVisible = v5;

  objc_msgSend(v4, "toFloatingAppLayout");
  v7 = (SBAppLayout *)objc_claimAutoreleasedReturnValue();
  appLayout = self->_appLayout;
  self->_appLayout = v7;

  self->_floatingAppLayout = (SBAppLayout *)objc_msgSend(v4, "toFloatingConfiguration");
  -[SBMainSwitcherRootSwitcherModifier _setCardSizesWithEvent:](self, "_setCardSizesWithEvent:", v4);
  v11.receiver = self;
  v11.super_class = (Class)SBMainSwitcherRootSwitcherModifier;
  -[SBFluidSwitcherRootSwitcherModifier handleTransitionEvent:](&v11, sel_handleTransitionEvent_, v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)handleGestureEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  SBMixedGridSwitcherModifier *v12;
  SBMixedGridHomeGestureRootSwitcherModifier *v13;
  NSObject *v14;
  objc_class *v15;
  void *v16;
  void *v17;
  objc_super v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)SBMainSwitcherRootSwitcherModifier;
  -[SBFluidSwitcherRootSwitcherModifier handleGestureEvent:](&v19, sel_handleGestureEvent_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBMainSwitcherRootSwitcherModifier switcherSettings](self, "switcherSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "effectiveSwitcherStyle");

  if (v7 == 2)
  {
    -[SBMainSwitcherRootSwitcherModifier _setCardSizesWithEvent:](self, "_setCardSizesWithEvent:", 0);
    v8 = (void *)MEMORY[0x1E0CB3940];
    SBStringForFluidSwitcherGestureType(objc_msgSend(v4, "gestureType"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithFormat:", CFSTR("%@"), v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[SBChainableModifier childModifierByKey:](self, "childModifierByKey:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v11
      && objc_msgSend(v4, "gestureType") == 1
      && objc_msgSend(v4, "phase") == 1
      && !BYTE1(self->_environmentMode))
    {
      v12 = -[SBMixedGridSwitcherModifier initWithFullScreenCardSize:floatingCardSize:]([SBMixedGridSwitcherModifier alloc], "initWithFullScreenCardSize:floatingCardSize:", *(double *)&self->super._hasPerformedInitialSetup, self->_fullScreenCardSize.width, self->_fullScreenCardSize.height, self->_floatingCardSize.width);
      v13 = -[SBMixedGridHomeGestureRootSwitcherModifier initWithStartingEnvironmentMode:selectedAppLayout:mixedGridModifier:]([SBMixedGridHomeGestureRootSwitcherModifier alloc], "initWithStartingEnvironmentMode:selectedAppLayout:mixedGridModifier:", *(_QWORD *)&self->_floatingCardSize.height, *(_QWORD *)&self->_floatingSwitcherVisible, v12);
      -[SBChainableModifier addChildModifier:atLevel:key:](self, "addChildModifier:atLevel:key:", v13, 3, v10);
      SBLogAppSwitcher();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        v15 = (objc_class *)objc_opt_class();
        NSStringFromClass(v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[SBChainableModifier succinctDescription](v13, "succinctDescription");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v21 = v16;
        v22 = 2112;
        v23 = v17;
        _os_log_impl(&dword_1D0540000, v14, OS_LOG_TYPE_INFO, "[%@] Adding child modifier for gesture %@.", buf, 0x16u);

      }
    }

  }
  return v5;
}

- (id)responseForProposedChildResponse:(id)a3 childModifier:(id)a4 event:(id)a5
{
  void *v6;
  void *v7;
  _QWORD v9[5];
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SBMainSwitcherRootSwitcherModifier;
  -[SBFluidSwitcherRootSwitcherModifier responseForProposedChildResponse:childModifier:event:](&v10, sel_responseForProposedChildResponse_childModifier_event_, a3, a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __91__SBMainSwitcherRootSwitcherModifier_responseForProposedChildResponse_childModifier_event___block_invoke;
  v9[3] = &unk_1E8EA5850;
  v9[4] = self;
  objc_msgSend(v6, "responseByTransformingResponseWithTransformer:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id __91__SBMainSwitcherRootSwitcherModifier_responseForProposedChildResponse_childModifier_event___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v3 = a2;
  if (objc_msgSend(v3, "type") == 31)
  {
    v4 = *(void **)(a1 + 32);
    v5 = v3;
    objc_msgSend(v5, "modifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "level");
    objc_msgSend(v5, "key");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "addChildModifier:atLevel:key:", v6, v7, v8);
    v3 = 0;
  }
  return v3;
}

- (id)transitionModifierForMainTransitionEvent:(id)a3
{
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  SBSwitcherShelf *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  SBAppExposeToFullScreenSwitcherModifier *v21;
  void *v22;
  void *v23;
  SBSwitcherToAppExposeSwitcherModifier *v24;
  void *v25;
  SBAppExposeToHomeSwitcherModifier *v26;
  SBShelfZoomTransitionModifier *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  int v35;
  SBShelfZoomTransitionModifier *v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  SBSplitViewToSlideOverSwitcherModifier *v42;
  uint64_t *v43;
  id v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  SBSplitViewToSlideOverSwitcherModifier *v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  int v56;
  SBSplitViewToPeekTransitionSwitcherModifier *v57;
  uint64_t v58;
  SBSplitViewToSlideOverSwitcherModifier *v59;
  uint64_t *v60;
  void *v61;
  id v62;
  uint64_t v63;
  void *v64;
  void *v65;
  void *v66;
  SBSlideOverToFullScreenSwitcherModifier *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  SBCenterWindowToSlideOverSwitcherModifier *v72;
  void *v73;
  uint64_t v74;
  void *v75;
  SBCenterWindowToSlideOverSwitcherModifier *v76;
  SBFullScreenToPeekSwitcherModifier *v77;
  uint64_t v78;
  uint64_t v79;
  void *v80;
  void *v81;
  uint64_t v82;
  void *v83;
  void *v84;

  v5 = a3;
  objc_msgSend(v5, "transitionID");
  v6 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fromAppLayout");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fromFloatingAppLayout");
  v79 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "toAppLayout");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "toFloatingAppLayout");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fromAppExposeBundleID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "toAppExposeBundleID");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  v82 = objc_msgSend(v5, "fromEnvironmentMode");
  v8 = objc_msgSend(v5, "toEnvironmentMode");
  v9 = objc_msgSend(v5, "fromFloatingConfiguration");
  v10 = objc_msgSend(v5, "toFloatingConfiguration");
  -[SBMainSwitcherRootSwitcherModifier switcherSettings](self, "switcherSettings");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "effectiveSwitcherStyle");

  if (!v7 && v84 && v8 == 2)
  {
    -[SBMainSwitcherRootSwitcherModifier floorModifierForTransitionEvent:](self, "floorModifierForTransitionEvent:", v5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (SBSwitcherShelf *)objc_msgSend(v13, "copy");

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBMainSwitcherRootSwitcherModifier.m"), 213, CFSTR("Expected instance of SBAppExposeGridSwitcherModifier"));

    }
    v15 = (void *)v6;
    if (v82 != 1)
    {
      v16 = (void *)v79;
      v17 = v80;
      v18 = v83;
      if (v82 == 2)
      {
        v24 = -[SBSwitcherToAppExposeSwitcherModifier initWithTransitionID:bundleIdentifier:appExposeModifier:]([SBSwitcherToAppExposeSwitcherModifier alloc], "initWithTransitionID:bundleIdentifier:appExposeModifier:", v15, v84, v14);
        goto LABEL_35;
      }
      if (v82 != 3)
      {
        v24 = 0;
        goto LABEL_35;
      }
      -[SBFluidSwitcherRootSwitcherModifier floorModifier](self, "floorModifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (void *)objc_msgSend(v19, "copy");

      v18 = v83;
      v21 = -[SBAppExposeToFullScreenSwitcherModifier initWithTransitionID:direction:fullScreenAppLayout:floatingAppLayout:bundleIdentifier:appExposeModifier:fullScreenModifier:]([SBAppExposeToFullScreenSwitcherModifier alloc], "initWithTransitionID:direction:fullScreenAppLayout:floatingAppLayout:bundleIdentifier:appExposeModifier:fullScreenModifier:", v15, 1, v80, v79, v84, v14, v20);
LABEL_18:
      v24 = (SBSwitcherToAppExposeSwitcherModifier *)v21;

LABEL_35:
      goto LABEL_36;
    }
    v26 = -[SBAppExposeToHomeSwitcherModifier initWithTransitionID:direction:bundleIdentifier:appExposeModifier:]([SBAppExposeToHomeSwitcherModifier alloc], "initWithTransitionID:direction:bundleIdentifier:appExposeModifier:", v6, 1, v84, v14);
    goto LABEL_26;
  }
  if (v7 && !v84 && v82 == 2)
  {
    -[SBFluidSwitcherRootSwitcherModifier floorModifier](self, "floorModifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (SBSwitcherShelf *)objc_msgSend(v22, "copy");

    objc_opt_class();
    v15 = (void *)v6;
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v71, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBMainSwitcherRootSwitcherModifier.m"), 226, CFSTR("Expected instance of SBAppExposeGridSwitcherModifier"));

    }
    v17 = v80;
    if (v8 != 1)
    {
      v16 = (void *)v79;
      if (v8 == 3)
      {
        -[SBMainSwitcherRootSwitcherModifier floorModifierForTransitionEvent:](self, "floorModifierForTransitionEvent:", v5);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = (void *)objc_msgSend(v23, "copy");

        -[SBMainSwitcherRootSwitcherModifier _ensureModifier:startsInFinalStateOfEvent:](self, "_ensureModifier:startsInFinalStateOfEvent:", v20, v5);
        v18 = v83;
        v21 = -[SBAppExposeToFullScreenSwitcherModifier initWithTransitionID:direction:fullScreenAppLayout:floatingAppLayout:bundleIdentifier:appExposeModifier:fullScreenModifier:]([SBAppExposeToFullScreenSwitcherModifier alloc], "initWithTransitionID:direction:fullScreenAppLayout:floatingAppLayout:bundleIdentifier:appExposeModifier:fullScreenModifier:", v15, 0, v83, v81, v7, v14, v20);
        goto LABEL_18;
      }
      v24 = 0;
LABEL_34:
      v18 = v83;
      goto LABEL_35;
    }
    v24 = -[SBAppExposeToHomeSwitcherModifier initWithTransitionID:direction:bundleIdentifier:appExposeModifier:]([SBAppExposeToHomeSwitcherModifier alloc], "initWithTransitionID:direction:bundleIdentifier:appExposeModifier:", v15, 0, v7, v14);
LABEL_33:
    v16 = (void *)v79;
    goto LABEL_34;
  }
  v15 = (void *)v6;
  if (v7 && v84 && v8 == 2)
  {
    -[SBMainSwitcherRootSwitcherModifier floorModifierForTransitionEvent:](self, "floorModifierForTransitionEvent:", v5);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (SBSwitcherShelf *)objc_msgSend(v25, "copy");

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v75, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBMainSwitcherRootSwitcherModifier.m"), 242, CFSTR("Expected instance of SBAppExposeGridSwitcherModifier"));

    }
    v26 = -[SBSwitcherToAppExposeSwitcherModifier initWithTransitionID:bundleIdentifier:appExposeModifier:]([SBSwitcherToAppExposeSwitcherModifier alloc], "initWithTransitionID:bundleIdentifier:appExposeModifier:", v6, v7, v14);
    goto LABEL_26;
  }
  v78 = v8;
  if (objc_msgSend(v5, "isCenterWindowZoomingUpFromShelfEvent"))
  {
    objc_msgSend(v5, "fromShelf");
    v14 = (SBSwitcherShelf *)objc_claimAutoreleasedReturnValue();
    v27 = [SBShelfZoomTransitionModifier alloc];
    v28 = v6;
    v29 = 1;
LABEL_31:
    v17 = v80;
    v18 = v83;
    v24 = -[SBShelfZoomTransitionModifier initWithTransitionID:direction:fromAppLayout:toAppLayout:shelf:](v27, "initWithTransitionID:direction:fromAppLayout:toAppLayout:shelf:", v28, v29, v80, v83, v14);
    v16 = (void *)v79;
    goto LABEL_35;
  }
  v31 = v82;
  if (!v7 && v84 && v82 == 3)
  {
    objc_msgSend(v80, "itemForLayoutRole:", 4);
    v32 = objc_claimAutoreleasedReturnValue();
    v31 = 3;
    if (v32)
    {
      v33 = (void *)v32;
      objc_msgSend(v83, "itemForLayoutRole:", 4);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      if (v34)
      {

        v31 = 3;
      }
      else
      {
        v35 = objc_msgSend(v80, "hasSameItemsInLayoutRoles:asAppLayout:", 6, v83);

        v31 = 3;
        if (v35)
        {
          v36 = [SBShelfZoomTransitionModifier alloc];
          objc_msgSend(v5, "toShelf");
          v14 = (SBSwitcherShelf *)objc_claimAutoreleasedReturnValue();
          v27 = v36;
          v28 = v6;
          v29 = 0;
          goto LABEL_31;
        }
      }
    }
  }
  else if (v7 && !v84 && v82 == 3)
  {
    v14 = -[SBSwitcherShelf initWithBundleIdentifier:layoutRole:displayMode:]([SBSwitcherShelf alloc], "initWithBundleIdentifier:layoutRole:displayMode:", v7, 0, 0);
    v26 = -[SBShelfIconBounceTransitionModifier initWithTransitionID:shelf:]([SBShelfIconBounceTransitionModifier alloc], "initWithTransitionID:shelf:", v6, v14);
LABEL_26:
    v24 = (SBSwitcherToAppExposeSwitcherModifier *)v26;
    v17 = v80;
    goto LABEL_33;
  }
  if (v12 != 2)
  {
    v24 = 0;
    v16 = (void *)v79;
    v17 = v80;
    goto LABEL_57;
  }
  if (v31 != 2 || v78 != 3)
  {
    v16 = (void *)v79;
    if (v31 == 2 && v78 == 1)
    {
      -[SBFluidSwitcherRootSwitcherModifier floorModifier](self, "floorModifier");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = (void *)objc_msgSend(v37, "copy");

      v24 = -[SBMixedGridToHomeSwitcherModifier initWithTransitionID:direction:mixedGridModifier:]([SBMixedGridToHomeSwitcherModifier alloc], "initWithTransitionID:direction:mixedGridModifier:", v6, 0, v38);
LABEL_74:
      v17 = v80;
      goto LABEL_75;
    }
    if (v78 == 2)
    {
      v17 = v80;
      if (SBPeekConfigurationIsValid(objc_msgSend(v5, "toPeekConfiguration")))
      {
LABEL_64:
        v24 = 0;
        goto LABEL_75;
      }
      switch(v82)
      {
        case 1:
          v44 = -[SBMainSwitcherRootSwitcherModifier _newMultitaskingModifierForEnvironmentMode:](self, "_newMultitaskingModifierForEnvironmentMode:", 2);
          v45 = (void *)objc_msgSend(v44, "copy");

          v24 = -[SBMixedGridToHomeSwitcherModifier initWithTransitionID:direction:mixedGridModifier:]([SBMixedGridToHomeSwitcherModifier alloc], "initWithTransitionID:direction:mixedGridModifier:", v15, 1, v45);
          break;
        case 2:
          v24 = -[SBTransitionSwitcherModifier initWithTransitionID:]([SBGridSwipeUpToSwitcherSwitcherModifier alloc], "initWithTransitionID:", v15);
          goto LABEL_75;
        case 3:
          -[SBMainSwitcherRootSwitcherModifier floorModifierForTransitionEvent:](self, "floorModifierForTransitionEvent:", v5);
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          v45 = (void *)objc_msgSend(v61, "copy");

          v62 = -[SBMainSwitcherRootSwitcherModifier _newMultitaskingModifierForEnvironmentMode:](self, "_newMultitaskingModifierForEnvironmentMode:", 2);
          v24 = -[SBMixedGridToFullScreenSwitcherModifier initWithTransitionID:direction:fullScreenAppLayout:floatingAppLayout:floatingConfiguration:gridModifier:fullScreenModifier:]([SBMixedGridToFullScreenSwitcherModifier alloc], "initWithTransitionID:direction:fullScreenAppLayout:floatingAppLayout:floatingConfiguration:gridModifier:fullScreenModifier:", v15, 1, v80, v79, v9, v62, v45);

          break;
        default:
          goto LABEL_64;
      }

      goto LABEL_75;
    }
    if (objc_msgSend(v5, "isPrimaryToSlideOverEvent"))
    {
      v42 = [SBSplitViewToSlideOverSwitcherModifier alloc];
      v43 = &SBLayoutRolePrimary;
LABEL_72:
      v46 = *v43;
      objc_msgSend(v5, "fromAppLayout");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "toFloatingAppLayout");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = v42;
      v50 = v6;
      v51 = v46;
      v52 = v47;
      v53 = v48;
      v54 = 0;
LABEL_73:
      v24 = -[SBSplitViewToSlideOverSwitcherModifier initWithTransitionID:transitioningLayoutRole:splitViewAppLayout:slideOverAppLayout:direction:](v49, "initWithTransitionID:transitioningLayoutRole:splitViewAppLayout:slideOverAppLayout:direction:", v50, v51, v52, v53, v54);

      v16 = (void *)v79;
      goto LABEL_74;
    }
    if (objc_msgSend(v5, "isSideToSlideOverEvent"))
    {
      v42 = [SBSplitViewToSlideOverSwitcherModifier alloc];
      v43 = &SBLayoutRoleSide;
      goto LABEL_72;
    }
    if (objc_msgSend(v5, "isSlideOverToSideEvent"))
    {
      v59 = [SBSplitViewToSlideOverSwitcherModifier alloc];
      v60 = &SBLayoutRoleSide;
LABEL_90:
      v63 = *v60;
      objc_msgSend(v5, "toAppLayout");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "fromFloatingAppLayout");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = v59;
      v50 = v6;
      v51 = v63;
      v52 = v47;
      v53 = v48;
      v54 = 1;
      goto LABEL_73;
    }
    if (objc_msgSend(v5, "isSlideOverToPrimaryEvent"))
    {
      v59 = [SBSplitViewToSlideOverSwitcherModifier alloc];
      v60 = &SBLayoutRolePrimary;
      goto LABEL_90;
    }
    if (objc_msgSend(v5, "isEnteringAnyPeekEvent")
      && (objc_msgSend(v5, "fromAppLayout"),
          v65 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v65, "itemForLayoutRole:", 2),
          v66 = (void *)objc_claimAutoreleasedReturnValue(),
          v66,
          v65,
          !v66))
    {
      if ((-[SBMainSwitcherRootSwitcherModifier isReduceMotionEnabled](self, "isReduceMotionEnabled") & 1) == 0)
      {
        v77 = [SBFullScreenToPeekSwitcherModifier alloc];
        objc_msgSend(v5, "fromAppLayout");
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "toAppLayout");
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "fromFloatingAppLayout");
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "toFloatingAppLayout");
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        v74 = -[SBFullScreenToPeekSwitcherModifier initWithTransitionID:fromAppLayout:toAppLayout:fromFloatingAppLayout:toFloatingAppLayout:peekConfiguration:](v77, "initWithTransitionID:fromAppLayout:toAppLayout:fromFloatingAppLayout:toFloatingAppLayout:peekConfiguration:", v6, v68, v69, v70, v73, objc_msgSend(v5, "toPeekConfiguration"));
        goto LABEL_102;
      }
    }
    else
    {
      if (objc_msgSend(v5, "isSlideOverToFullScreenEvent"))
      {
        v67 = [SBSlideOverToFullScreenSwitcherModifier alloc];
        objc_msgSend(v5, "fromFloatingAppLayout");
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "toAppLayout");
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "fromAppLayout");
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = -[SBSlideOverToFullScreenSwitcherModifier initWithTransitionID:slideOverAppLayout:fullScreenAppLayout:replacingMainAppLayout:](v67, "initWithTransitionID:slideOverAppLayout:fullScreenAppLayout:replacingMainAppLayout:", v6, v68, v69, v70);
LABEL_103:

        goto LABEL_104;
      }
      if (objc_msgSend(v5, "isCenterWindowToSlideOverEvent"))
      {
        v72 = [SBCenterWindowToSlideOverSwitcherModifier alloc];
        objc_msgSend(v5, "fromAppLayout");
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "fromAppLayout");
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "fromFloatingAppLayout");
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "toFloatingAppLayout");
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        v74 = -[SBCenterWindowToSlideOverSwitcherModifier initWithTransitionID:fromAppLayout:toAppLayout:fromFloatingAppLayout:toFloatingAppLayout:toFloatingConfiguration:direction:](v72, "initWithTransitionID:fromAppLayout:toAppLayout:fromFloatingAppLayout:toFloatingAppLayout:toFloatingConfiguration:direction:", v6, v68, v69, v70, v73, objc_msgSend(v5, "toFloatingConfiguration"), 0);
LABEL_102:
        v24 = (SBSwitcherToAppExposeSwitcherModifier *)v74;

        v15 = (void *)v6;
        goto LABEL_103;
      }
      if (objc_msgSend(v5, "isSlideOverToCenterWindowEvent"))
      {
        v76 = [SBCenterWindowToSlideOverSwitcherModifier alloc];
        objc_msgSend(v5, "fromAppLayout");
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "toAppLayout");
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "fromFloatingAppLayout");
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "toFloatingAppLayout");
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        v74 = -[SBCenterWindowToSlideOverSwitcherModifier initWithTransitionID:fromAppLayout:toAppLayout:fromFloatingAppLayout:toFloatingAppLayout:toFloatingConfiguration:direction:](v76, "initWithTransitionID:fromAppLayout:toAppLayout:fromFloatingAppLayout:toFloatingAppLayout:toFloatingConfiguration:direction:", v6, v68, v69, v70, v73, objc_msgSend(v5, "toFloatingConfiguration"), 1);
        goto LABEL_102;
      }
    }
    v24 = 0;
    v15 = (void *)v6;
LABEL_104:
    v17 = v80;
    goto LABEL_55;
  }
  v17 = v80;
  if (SBPeekConfigurationIsValid(objc_msgSend(v5, "fromPeekConfiguration")))
  {
    v24 = 0;
LABEL_55:
    v16 = (void *)v79;
LABEL_75:
    v18 = v83;
    goto LABEL_76;
  }
  v39 = -[SBMainSwitcherRootSwitcherModifier _newMultitaskingModifierForEnvironmentMode:](self, "_newMultitaskingModifierForEnvironmentMode:", 2);
  -[SBMainSwitcherRootSwitcherModifier _ensureModifier:startsInFinalStateOfEvent:](self, "_ensureModifier:startsInFinalStateOfEvent:", v39, v5);
  -[SBMainSwitcherRootSwitcherModifier floorModifierForTransitionEvent:](self, "floorModifierForTransitionEvent:", v5);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = (void *)objc_msgSend(v40, "copy");

  v24 = -[SBMixedGridToFullScreenSwitcherModifier initWithTransitionID:direction:fullScreenAppLayout:floatingAppLayout:floatingConfiguration:gridModifier:fullScreenModifier:]([SBMixedGridToFullScreenSwitcherModifier alloc], "initWithTransitionID:direction:fullScreenAppLayout:floatingAppLayout:floatingConfiguration:gridModifier:fullScreenModifier:", v15, 0, v83, v81, v10, v39, v41);
  v18 = v83;
  v16 = (void *)v79;
LABEL_76:
  if (objc_msgSend(v5, "isKeyboardShortcutInitiated")
    && v82 == 3
    && v78 == 1
    && objc_msgSend(v5, "isEnteringAnyPeekEvent"))
  {
    objc_msgSend(v5, "fromAppLayout");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = objc_msgSend(v55, "isSplitConfiguration");

    if (v56)
    {
      v57 = [SBSplitViewToPeekTransitionSwitcherModifier alloc];
      objc_msgSend(v5, "fromAppLayout");
      v14 = (SBSwitcherShelf *)objc_claimAutoreleasedReturnValue();
      v58 = -[SBSplitViewToPeekTransitionSwitcherModifier initWithTransitionID:fromAppLayout:](v57, "initWithTransitionID:fromAppLayout:", v15, v14);

      v24 = (SBSwitcherToAppExposeSwitcherModifier *)v58;
      goto LABEL_34;
    }
LABEL_57:
    v18 = v83;
  }
LABEL_36:

  return v24;
}

- (id)insertionModifierForInsertionEvent:(id)a3
{
  id v4;
  SBInsertionSwitcherModifier *v5;
  void *v6;
  SBInsertionSwitcherModifier *v7;

  v4 = a3;
  if (-[SBMainSwitcherRootSwitcherModifier _correctFloorModifierToHandleEvent](self, "_correctFloorModifierToHandleEvent"))
  {
    v5 = [SBInsertionSwitcherModifier alloc];
    objc_msgSend(v4, "appLayout");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[SBInsertionSwitcherModifier initWithAppLayout:](v5, "initWithAppLayout:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)swipeToKillModifierForSwipeToKillEvent:(id)a3
{
  id v4;
  SBSwipeToKillSwitcherModifier *v5;
  uint64_t v6;
  void *v7;
  SBSwipeToKillSwitcherModifier *v8;

  v4 = a3;
  if (-[SBMainSwitcherRootSwitcherModifier _correctFloorModifierToHandleEvent](self, "_correctFloorModifierToHandleEvent"))
  {
    v5 = [SBSwipeToKillSwitcherModifier alloc];
    v6 = objc_msgSend(v4, "layoutRole");
    objc_msgSend(v4, "appLayout");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[SBSwipeToKillSwitcherModifier initWithLayoutRole:inAppLayout:fadeOutSwipedItems:](v5, "initWithLayoutRole:inAppLayout:fadeOutSwipedItems:", v6, v7, 0);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)highlightModifierForHighlightEvent:(id)a3
{
  id v4;
  SBHighlightSwitcherModifier *v5;
  SBHighlightSwitcherModifier *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  if (-[SBMainSwitcherRootSwitcherModifier _correctFloorModifierToHandleEvent](self, "_correctFloorModifierToHandleEvent")&& (objc_msgSend(v4, "isHoverEvent") & 1) == 0)
  {
    v6 = [SBHighlightSwitcherModifier alloc];
    v7 = objc_msgSend(v4, "layoutRole");
    objc_msgSend(v4, "appLayout");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[SBHighlightSwitcherModifier initWithLayoutRole:inAppLayout:listensForHighlightEvents:](v6, "initWithLayoutRole:inAppLayout:listensForHighlightEvents:", v7, v8, 1);

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)removalModifierForRemovalEvent:(id)a3
{
  id v4;
  SBRemovalSwitcherModifier *v5;
  uint64_t v6;
  void *v7;
  SBRemovalSwitcherModifier *v8;

  v4 = a3;
  if (-[SBMainSwitcherRootSwitcherModifier _correctFloorModifierToHandleEvent](self, "_correctFloorModifierToHandleEvent"))
  {
    v5 = [SBRemovalSwitcherModifier alloc];
    v6 = objc_msgSend(v4, "layoutRole");
    objc_msgSend(v4, "appLayout");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[SBRemovalSwitcherModifier initWithLayoutRole:inAppLayout:reason:](v5, "initWithLayoutRole:inAppLayout:reason:", v6, v7, objc_msgSend(v4, "reason"));

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)floorModifierForTransitionEvent:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  BOOL v10;
  SBAppExposeGridSwitcherModifier *v11;
  void *v12;
  void *v13;
  char v14;

  v4 = a3;
  v5 = objc_opt_class();
  SBSafeCast(v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "toEnvironmentMode");
  -[SBFluidSwitcherRootSwitcherModifier floorModifier](self, "floorModifier");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v6, "toAppExposeBundleID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
      v10 = v7 == 2;
    else
      v10 = 0;
    if (v10)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0
        || (objc_msgSend(v8, "bundleIdentifier"),
            v13 = (void *)objc_claimAutoreleasedReturnValue(),
            v14 = objc_msgSend(v13, "isEqualToString:", v9),
            v13,
            (v14 & 1) == 0))
      {
        v11 = -[SBAppExposeGridSwitcherModifier initWithBundleIdentifier:fullScreenCardSize:floatingCardSize:]([SBAppExposeGridSwitcherModifier alloc], "initWithBundleIdentifier:fullScreenCardSize:floatingCardSize:", v9, *(double *)&self->super._hasPerformedInitialSetup, self->_fullScreenCardSize.width, self->_fullScreenCardSize.height, self->_floatingCardSize.width);
        goto LABEL_14;
      }
    }
    else if (v7 == 2)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0 && !SBPeekConfigurationIsValid(objc_msgSend(v6, "toPeekConfiguration")))
      {
        v11 = -[SBMixedGridSwitcherModifier initWithFullScreenCardSize:floatingCardSize:]([SBMixedGridSwitcherModifier alloc], "initWithFullScreenCardSize:floatingCardSize:", *(double *)&self->super._hasPerformedInitialSetup, self->_fullScreenCardSize.width, self->_fullScreenCardSize.height, self->_floatingCardSize.width);
LABEL_14:
        v12 = v11;

        goto LABEL_18;
      }
    }
    else if (!SBPeekConfigurationIsValid(objc_msgSend(v6, "toPeekConfiguration")))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        -[SBMainSwitcherRootSwitcherModifier _createNewDefaultFloorModifier](self, "_createNewDefaultFloorModifier");
        v11 = (SBAppExposeGridSwitcherModifier *)objc_claimAutoreleasedReturnValue();
        goto LABEL_14;
      }
    }
    v12 = v8;
    goto LABEL_18;
  }
  -[SBMainSwitcherRootSwitcherModifier _createNewDefaultFloorModifier](self, "_createNewDefaultFloorModifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
LABEL_18:

  return v12;
}

- (id)multitaskingModifierForEvent:(id)a3
{
  return 0;
}

- (id)userScrollingModifierForScrollEvent:(id)a3
{
  if (-[SBMainSwitcherRootSwitcherModifier _correctFloorModifierToHandleEvent](self, "_correctFloorModifierToHandleEvent", a3))
  {
    return objc_alloc_init(SBScrollingSwitcherModifier);
  }
  else
  {
    return 0;
  }
}

- (id)shelfModifierForTransitionEvent:(id)a3
{
  id v4;
  void *v5;
  SBSwitcherShelf *v6;
  void *v7;
  void *v8;
  SBShelfSwitcherModifier *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  unint64_t v20;
  SBShelfSwitcherModifier *v21;
  void *v22;
  void *v23;
  void *v24;

  v4 = a3;
  objc_msgSend(v4, "toAppExposeBundleID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && objc_msgSend(v4, "toEnvironmentMode") == 3)
  {
    v6 = -[SBSwitcherShelf initWithBundleIdentifier:layoutRole:displayMode:]([SBSwitcherShelf alloc], "initWithBundleIdentifier:layoutRole:displayMode:", v5, 0, 0);
    -[SBSwitcherShelf uniqueIdentifier](v6, "uniqueIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBChainableModifier childModifierByKey:](self, "childModifierByKey:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = 0;
    if (!v8)
    {
      objc_msgSend(v4, "activatingAppLayout");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        objc_msgSend(v4, "toAppLayout");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[SBMainSwitcherRootSwitcherModifier homeScreenIconFrameForAppLayout:](self, "homeScreenIconFrameForAppLayout:", v11);
        v13 = v12;
        v15 = v14;
        v17 = v16;
        v19 = v18;

      }
      else
      {
        v13 = *MEMORY[0x1E0C9D628];
        v15 = *(double *)(MEMORY[0x1E0C9D628] + 8);
        v17 = *(double *)(MEMORY[0x1E0C9D628] + 16);
        v19 = *(double *)(MEMORY[0x1E0C9D628] + 24);
      }
      v20 = +[SBShelfSwitcherModifier contentOptionsForTransitionEvent:context:](SBShelfSwitcherModifier, "contentOptionsForTransitionEvent:context:", v4, self);
      v21 = [SBShelfSwitcherModifier alloc];
      objc_msgSend(v4, "toAppLayout");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "toFloatingAppLayout");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "fromAppLayout");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[SBShelfSwitcherModifier initWithShelf:contentOptions:activeFullScreenAppLayout:activeFloatingAppLayout:presentationTargetFrame:presentedFromAppLayout:](v21, "initWithShelf:contentOptions:activeFullScreenAppLayout:activeFloatingAppLayout:presentationTargetFrame:presentedFromAppLayout:", v6, v20, v22, v23, v24, v13, v15, v17, v19);

    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)reduceMotionModifierForReduceMotionChangedEvent:(id)a3
{
  void *v4;
  uint64_t v5;
  __objc2_class **v6;
  id v7;

  if (-[SBMainSwitcherRootSwitcherModifier isReduceMotionEnabled](self, "isReduceMotionEnabled", a3))
  {
    -[SBMainSwitcherRootSwitcherModifier switcherSettings](self, "switcherSettings");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "effectiveSwitcherStyle");

    v6 = off_1E8E97798;
    if (v5 != 1)
      v6 = off_1E8E977B0;
    v7 = objc_alloc_init(*v6);
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (id)focusedAppModifierForUpdateFocusedAppLayoutEvent:(id)a3
{
  id v3;
  SBFocusedAppLayoutSwitcherModifier *v4;
  void *v5;
  SBFocusedAppLayoutSwitcherModifier *v6;

  v3 = a3;
  v4 = [SBFocusedAppLayoutSwitcherModifier alloc];
  objc_msgSend(v3, "appLayout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[SBFocusedAppLayoutSwitcherModifier initWithFocusedAppLayout:](v4, "initWithFocusedAppLayout:", v5);
  return v6;
}

- (id)_createNewDefaultFloorModifier
{
  SBSplitViewRootSwitcherModifier *v2;
  SBFloatingFluidSwitcherRootSwitcherModifier *v3;
  SBMainSwitcherRoutingSwitcherModifier *v4;

  v2 = objc_alloc_init(SBSplitViewRootSwitcherModifier);
  v3 = objc_alloc_init(SBFloatingFluidSwitcherRootSwitcherModifier);
  v4 = -[SBMainSwitcherRoutingSwitcherModifier initWithMainModifierSubtree:floatingModifierSubtree:]([SBMainSwitcherRoutingSwitcherModifier alloc], "initWithMainModifierSubtree:floatingModifierSubtree:", v2, v3);

  return v4;
}

- (id)_newMultitaskingModifierForEnvironmentMode:(int64_t)a3
{
  void *v5;
  uint64_t v6;

  -[SBMainSwitcherRootSwitcherModifier switcherSettings](self, "switcherSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "effectiveSwitcherStyle");

  if (a3 == 2)
    return -[SBMixedGridSwitcherModifier initWithFullScreenCardSize:floatingCardSize:]([SBMixedGridSwitcherModifier alloc], "initWithFullScreenCardSize:floatingCardSize:", *(double *)&self->super._hasPerformedInitialSetup, self->_fullScreenCardSize.width, self->_fullScreenCardSize.height, self->_floatingCardSize.width);
  if (v6 == 1)
    return objc_alloc_init(SBDeckSwitcherModifier);
  -[SBMainSwitcherRootSwitcherModifier _createNewDefaultFloorModifier](self, "_createNewDefaultFloorModifier");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_setCardSizesWithEvent:(id)a3
{
  uint64_t v4;
  CGFloat v5;
  uint64_t v6;
  uint64_t v7;
  SBMainSwitcherRootSwitcherModifier *v8;
  uint64_t v9;
  CGFloat v10;
  CGFloat v11;
  id v12;

  v12 = a3;
  -[SBMainSwitcherRootSwitcherModifier containerViewBounds](self, "containerViewBounds");
  *(_QWORD *)&self->super._hasPerformedInitialSetup = v4;
  self->_fullScreenCardSize.width = v5;
  if (v12)
  {
    v6 = objc_msgSend(v12, "toInterfaceOrientation");
    v7 = objc_msgSend(v12, "toFloatingConfiguration");
    v8 = self;
    v9 = v6;
  }
  else
  {
    v9 = -[SBMainSwitcherRootSwitcherModifier switcherInterfaceOrientation](self, "switcherInterfaceOrientation");
    v8 = self;
    v7 = 2;
  }
  -[SBMainSwitcherRootSwitcherModifier floatingApplicationFrameInInterfaceOrientation:floatingConfiguration:](v8, "floatingApplicationFrameInInterfaceOrientation:floatingConfiguration:", v9, v7);
  self->_fullScreenCardSize.height = v10;
  self->_floatingCardSize.width = v11;

}

- (void)_ensureModifier:(id)a3 startsInFinalStateOfEvent:(id)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a3;
  objc_msgSend(a4, "unhandledCopy");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAnimated:", 0);
  objc_msgSend(v7, "setPhase:", 2);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __80__SBMainSwitcherRootSwitcherModifier__ensureModifier_startsInFinalStateOfEvent___block_invoke;
  v10[3] = &unk_1E8E9E820;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[SBChainableModifier performTransactionWithTemporaryChildModifier:usingBlock:](self, "performTransactionWithTemporaryChildModifier:usingBlock:", v9, v10);

}

id __80__SBMainSwitcherRootSwitcherModifier__ensureModifier_startsInFinalStateOfEvent___block_invoke(uint64_t a1)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "handleEvent:", *(_QWORD *)(a1 + 40));
}

- (BOOL)_correctFloorModifierToHandleEvent
{
  void *v3;
  char isKindOfClass;
  void *v5;

  -[SBFluidSwitcherRootSwitcherModifier floorModifier](self, "floorModifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    isKindOfClass = 1;
  }
  else
  {
    -[SBFluidSwitcherRootSwitcherModifier floorModifier](self, "floorModifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

  }
  return isKindOfClass & 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appLayout, 0);
  objc_storeStrong((id *)&self->_floatingSwitcherVisible, 0);
}

@end
