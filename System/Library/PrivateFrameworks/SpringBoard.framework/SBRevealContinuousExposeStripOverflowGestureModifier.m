@implementation SBRevealContinuousExposeStripOverflowGestureModifier

- (SBRevealContinuousExposeStripOverflowGestureModifier)initWithGestureID:(id)a3 initialAppLayout:(id)a4
{
  id v8;
  SBRevealContinuousExposeStripOverflowGestureModifier *v9;
  void *v11;
  objc_super v12;

  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SBRevealContinuousExposeStripOverflowGestureModifier;
  v9 = -[SBGestureSwitcherModifier initWithGestureID:](&v12, sel_initWithGestureID_, a3);
  if (v9)
  {
    if (!v8)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, v9, CFSTR("SBRevealContinuousExposeStripOverflowGestureModifier.m"), 44, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("initialAppLayout"));

    }
    objc_storeStrong((id *)&v9->_initialAppLayout, a4);
  }

  return v9;
}

- (id)animationAttributesForLayoutElement:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBRevealContinuousExposeStripOverflowGestureModifier;
  -[SBGestureSwitcherModifier animationAttributesForLayoutElement:](&v9, sel_animationAttributesForLayoutElement_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v4, "switcherLayoutElementType"))
  {
    v6 = (void *)objc_msgSend(v5, "mutableCopy");
    -[SBRevealContinuousExposeStripOverflowGestureModifier _layoutSettingsForAppLayout:](self, "_layoutSettingsForAppLayout:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setLayoutSettings:", v7);

    v5 = v6;
  }

  return v5;
}

- (id)_layoutSettingsForAppLayout:(id)a3
{
  id v4;
  double v5;
  double v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CAFrameRateRange v14;

  v4 = objc_alloc_init(MEMORY[0x1E0DA9E08]);
  objc_msgSend(v4, "setDefaultValues");
  if (self->_showingAppSwitcherLayout)
  {
    objc_msgSend(v4, "setTrackingResponse:", 0.15);
    objc_msgSend(v4, "setTrackingDampingRatio:", 0.85);
  }
  if (self->_beginAnimatingAppSwitcherLayoutProperty)
  {
    -[SBRevealContinuousExposeStripOverflowGestureModifier presentationValueForAnimatableProperty:](self, "presentationValueForAnimatableProperty:", CFSTR("SBRevealContinuousExposeStripOverflowGestureModifierAnimatablePropertyIdentifier"));
    v6 = v5;
    v7 = objc_alloc_init(MEMORY[0x1E0DA9E08]);
    objc_msgSend(v7, "setDefaultValues");
    objc_msgSend(v4, "trackingResponse");
    v9 = v8;
    objc_msgSend(v7, "response");
    v11 = v6 * (v9 - v10);
    objc_msgSend(v7, "response");
    objc_msgSend(v7, "setTrackingResponse:", v12 + v11);

    v4 = v7;
  }
  v14 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v4, "setFrameRateRange:highFrameRateReason:", 1114113, *(double *)&v14.minimum, *(double *)&v14.maximum, *(double *)&v14.preferred);
  return v4;
}

- (id)handleGestureEvent:(id)a3
{
  id v4;
  void *v5;
  double v6;
  SBAppSwitcherContinuousExposeSwitcherModifier *v7;
  SBSwitcherModifier *continuousExposeAppSwitcherModifier;
  void *v9;
  void *v10;
  NSString *v11;
  NSString *appExposeBundleIdentifier;
  SBAppLayout *v13;
  SBAppLayout *initialAppLayout;
  void *v15;
  double v16;
  int showingAppSwitcherLayout;
  int v18;
  SBPerformTransitionSwitcherEventResponse *v19;
  void *v20;
  SBPerformTransitionSwitcherEventResponse *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  SBScrollToAppLayoutSwitcherEventResponse *v30;
  uint64_t v31;
  void *v32;
  SBPerformTransitionSwitcherEventResponse *v33;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  objc_super v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v39.receiver = self;
  v39.super_class = (Class)SBRevealContinuousExposeStripOverflowGestureModifier;
  -[SBGestureSwitcherModifier handleGestureEvent:](&v39, sel_handleGestureEvent_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "translationInContainerView");
  self->_translation = fabs(v6);
  if (objc_msgSend(v4, "phase") == 1)
  {
    v7 = objc_alloc_init(SBAppSwitcherContinuousExposeSwitcherModifier);
    continuousExposeAppSwitcherModifier = self->_continuousExposeAppSwitcherModifier;
    self->_continuousExposeAppSwitcherModifier = &v7->super;

    -[SBAppLayout itemForLayoutRole:](self->_initialAppLayout, "itemForLayoutRole:", 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bundleIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (NSString *)objc_msgSend(v10, "copy");
    appExposeBundleIdentifier = self->_appExposeBundleIdentifier;
    self->_appExposeBundleIdentifier = v11;

    objc_msgSend(v4, "selectedAppLayout");
    v13 = (SBAppLayout *)objc_claimAutoreleasedReturnValue();
    initialAppLayout = self->_initialAppLayout;
    self->_initialAppLayout = v13;

    self->_showingAppSwitcherLayout = 0;
    -[SBRevealContinuousExposeStripOverflowGestureModifier chamoisLayoutAttributes](self, "chamoisLayoutAttributes");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stripWidth");
    self->_stripWidth = v16;

    goto LABEL_24;
  }
  if (objc_msgSend(v4, "phase") != 2)
  {
    if (objc_msgSend(v4, "phase") != 3)
      goto LABEL_24;
    if ((objc_msgSend(v4, "isCanceled") & 1) != 0 || self->_translation <= 0.0)
    {
      +[SBSwitcherTransitionRequest requestForActivatingAppLayout:](SBSwitcherTransitionRequest, "requestForActivatingAppLayout:", self->_initialAppLayout);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = -[SBPerformTransitionSwitcherEventResponse initWithTransitionRequest:gestureInitiated:]([SBPerformTransitionSwitcherEventResponse alloc], "initWithTransitionRequest:gestureInitiated:", v32, 1);
      SBAppendSwitcherModifierResponse(v33, v5);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_23:
      v5 = v22;
      goto LABEL_24;
    }
    v19 = [SBPerformTransitionSwitcherEventResponse alloc];
    +[SBSwitcherTransitionRequest requestForActivatingAppSwitcher](SBSwitcherTransitionRequest, "requestForActivatingAppSwitcher");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = -[SBPerformTransitionSwitcherEventResponse initWithTransitionRequest:gestureInitiated:](v19, "initWithTransitionRequest:gestureInitiated:", v20, 1);

    SBAppendSwitcherModifierResponse(v21, v5);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    -[SBRevealContinuousExposeStripOverflowGestureModifier appLayouts](self, "appLayouts", 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
    if (v24)
    {
      v25 = v24;
      v26 = 0;
      v27 = *(_QWORD *)v36;
LABEL_11:
      v28 = 0;
      v29 = v26;
      while (1)
      {
        if (*(_QWORD *)v36 != v27)
          objc_enumerationMutation(v23);
        v26 = *(id *)(*((_QWORD *)&v35 + 1) + 8 * v28);

        if (objc_msgSend(v26, "environment") == 1)
          break;
        ++v28;
        v29 = v26;
        if (v25 == v28)
        {
          v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
          if (v25)
            goto LABEL_11;
          break;
        }
      }

      if (!v26)
        goto LABEL_22;
      v30 = -[SBScrollToAppLayoutSwitcherEventResponse initWithAppLayout:alignment:animated:]([SBScrollToAppLayoutSwitcherEventResponse alloc], "initWithAppLayout:alignment:animated:", v26, 0, 0);
      SBAppendSwitcherModifierResponse(v30, v22);
      v31 = objc_claimAutoreleasedReturnValue();

      v22 = (void *)v31;
    }
    else
    {
      v26 = v23;
    }

LABEL_22:
    goto LABEL_23;
  }
  showingAppSwitcherLayout = self->_showingAppSwitcherLayout;
  v18 = self->_translation > self->_stripWidth;
  self->_showingAppSwitcherLayout = v18;
  if (showingAppSwitcherLayout != v18)
    self->_beginAnimatingAppSwitcherLayoutProperty = 1;
LABEL_24:

  return v5;
}

- (id)handleTransitionEvent:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SBRevealContinuousExposeStripOverflowGestureModifier;
  v4 = a3;
  -[SBGestureSwitcherModifier handleTransitionEvent:](&v8, sel_handleTransitionEvent_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "phase", v8.receiver, v8.super_class);

  if (v6 >= 2)
    -[SBChainableModifier setState:](self, "setState:", 1);
  return v5;
}

- (double)scaleForIndex:(unint64_t)a3
{
  uint64_t v5;
  SBSwitcherModifier *continuousExposeAppSwitcherModifier;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double stripWidth;
  double v12;
  double v13;
  _QWORD v15[7];
  objc_super v16;
  uint64_t v17;
  double *v18;
  uint64_t v19;
  uint64_t v20;

  v17 = 0;
  v18 = (double *)&v17;
  v19 = 0x2020000000;
  v20 = 0;
  v16.receiver = self;
  v16.super_class = (Class)SBRevealContinuousExposeStripOverflowGestureModifier;
  -[SBRevealContinuousExposeStripOverflowGestureModifier scaleForIndex:](&v16, sel_scaleForIndex_);
  v20 = v5;
  if (self->_showingAppSwitcherLayout)
  {
    continuousExposeAppSwitcherModifier = self->_continuousExposeAppSwitcherModifier;
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __70__SBRevealContinuousExposeStripOverflowGestureModifier_scaleForIndex___block_invoke;
    v15[3] = &unk_1E8E9FD08;
    v15[4] = self;
    v15[5] = &v17;
    v15[6] = a3;
    -[SBChainableModifier performTransactionWithTemporaryChildModifier:usingBlock:](self, "performTransactionWithTemporaryChildModifier:usingBlock:", continuousExposeAppSwitcherModifier, v15);
  }
  -[SBRevealContinuousExposeStripOverflowGestureModifier appLayouts](self, "appLayouts");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndex:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[SBAppLayout isOrContainsAppLayout:](self->_initialAppLayout, "isOrContainsAppLayout:", v8))
  {
    BSUIConstrainValueToIntervalWithRubberBand();
    v10 = v9;
    stripWidth = self->_stripWidth;
    -[SBRevealContinuousExposeStripOverflowGestureModifier _finalScaleForFullScreenAppLayout](self, "_finalScaleForFullScreenAppLayout");
    v13 = ((v12 + -1.0) * (v10 * (stripWidth + stripWidth) + 0.0) + 1.0) * v18[3];
    v18[3] = v13;
  }
  else
  {
    v13 = v18[3];
  }

  _Block_object_dispose(&v17, 8);
  return v13;
}

uint64_t __70__SBRevealContinuousExposeStripOverflowGestureModifier_scaleForIndex___block_invoke(_QWORD *a1)
{
  uint64_t result;
  uint64_t v3;

  result = objc_msgSend(*(id *)(a1[4] + 144), "scaleForIndex:", a1[6]);
  *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = v3;
  return result;
}

- (CGRect)frameForIndex:(unint64_t)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  SBSwitcherModifier *continuousExposeAppSwitcherModifier;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double stripWidth;
  double v15;
  double v16;
  void *v17;
  void *v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  double v24;
  double v25;
  CGFloat v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double MidX;
  id *v32;
  uint64_t v33;
  double v34;
  double v35;
  double v36;
  double v37;
  uint64_t v38;
  double v39;
  void *v40;
  double *v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double MaxX;
  double v54;
  double v55;
  _QWORD v56[7];
  objc_super v57;
  uint64_t v58;
  double *v59;
  uint64_t v60;
  void *v61;
  __int128 v62;
  __int128 v63;
  CGRect v64;
  CGRect v65;
  CGRect v66;
  CGRect result;

  v58 = 0;
  v59 = (double *)&v58;
  v60 = 0x4010000000;
  v61 = &unk_1D0FA064E;
  v62 = 0u;
  v63 = 0u;
  v57.receiver = self;
  v57.super_class = (Class)SBRevealContinuousExposeStripOverflowGestureModifier;
  -[SBRevealContinuousExposeStripOverflowGestureModifier frameForIndex:](&v57, sel_frameForIndex_);
  *(_QWORD *)&v62 = v5;
  *((_QWORD *)&v62 + 1) = v6;
  *(_QWORD *)&v63 = v7;
  *((_QWORD *)&v63 + 1) = v8;
  if (self->_showingAppSwitcherLayout)
  {
    continuousExposeAppSwitcherModifier = self->_continuousExposeAppSwitcherModifier;
    v56[0] = MEMORY[0x1E0C809B0];
    v56[1] = 3221225472;
    v56[2] = __70__SBRevealContinuousExposeStripOverflowGestureModifier_frameForIndex___block_invoke;
    v56[3] = &unk_1E8E9FD08;
    v56[4] = self;
    v56[5] = &v58;
    v56[6] = a3;
    -[SBChainableModifier performTransactionWithTemporaryChildModifier:usingBlock:](self, "performTransactionWithTemporaryChildModifier:usingBlock:", continuousExposeAppSwitcherModifier, v56);
  }
  -[SBRevealContinuousExposeStripOverflowGestureModifier appLayouts](self, "appLayouts");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectAtIndex:", a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[SBAppLayout isOrContainsAppLayout:](self->_initialAppLayout, "isOrContainsAppLayout:", v11))
  {
    BSUIConstrainValueToIntervalWithRubberBand();
    v13 = v12;
    stripWidth = self->_stripWidth;
    -[SBRevealContinuousExposeStripOverflowGestureModifier _finalScaleForFullScreenAppLayout](self, "_finalScaleForFullScreenAppLayout");
    v16 = v15;
    -[SBSwitcherModifier autoLayoutSpaceForAppLayout:](self, "autoLayoutSpaceForAppLayout:", self->_initialAppLayout);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "configuration");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "containerBounds");
    v20 = v19;
    v22 = v21;
    v24 = v23;
    v26 = v25;

    -[SBRevealContinuousExposeStripOverflowGestureModifier containerViewBounds](self, "containerViewBounds");
    v54 = v27;
    v55 = v16;
    v28 = v13;
    v29 = stripWidth;
    v64.origin.x = v20;
    v64.origin.y = v22;
    v64.size.width = v24;
    v64.size.height = v26;
    MaxX = CGRectGetMaxX(v64);
    v30 = v59[4];
    v65.origin.x = v20;
    v65.origin.y = v22;
    v65.size.width = v24;
    v65.size.height = v26;
    MidX = CGRectGetMidX(v65);
    v32 = (id *)MEMORY[0x1E0CEB258];
    v33 = objc_msgSend((id)*MEMORY[0x1E0CEB258], "userInterfaceLayoutDirection");
    v34 = v28 * (v29 + v29) + 0.0;
    v35 = 1.0 - ((v55 + -1.0) * v34 + 1.0);
    v36 = -(v35 * (v30 - MidX));
    if (v33 != 1)
      v36 = v35 * (v30 - MidX);
    v37 = v59[5];
    v59[4] = v59[4] - v36;
    v66.origin.x = v20;
    v66.origin.y = v22;
    v66.size.width = v24;
    v66.size.height = v26;
    v59[5] = v59[5] - v35 * (v37 - CGRectGetMidY(v66));
    v38 = objc_msgSend(*v32, "userInterfaceLayoutDirection");
    v39 = v34 * ((1.0 - v55) * v24 * 0.5 + v54 - MaxX) + 0.0;
    if (v38 == 1)
      v39 = -v39;
    v59[4] = v39 + v59[4];
  }
  else
  {
    if (objc_msgSend((id)*MEMORY[0x1E0CEB258], "userInterfaceLayoutDirection") == 1)
    {
      -[SBRevealContinuousExposeStripOverflowGestureModifier chamoisLayoutAttributes](self, "chamoisLayoutAttributes");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "screenEdgePadding");
      BSUIConstrainValueToIntervalWithRubberBand();
      v41 = v59;
      v43 = v59[4] - v42;
    }
    else
    {
      -[SBRevealContinuousExposeStripOverflowGestureModifier chamoisLayoutAttributes](self, "chamoisLayoutAttributes");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "screenEdgePadding");
      BSUIConstrainValueToIntervalWithRubberBand();
      v41 = v59;
      v43 = v44 + v59[4];
    }
    v41[4] = v43;

  }
  v45 = v59[4];
  v46 = v59[5];
  v47 = v59[6];
  v48 = v59[7];

  _Block_object_dispose(&v58, 8);
  v49 = v45;
  v50 = v46;
  v51 = v47;
  v52 = v48;
  result.size.height = v52;
  result.size.width = v51;
  result.origin.y = v50;
  result.origin.x = v49;
  return result;
}

uint64_t __70__SBRevealContinuousExposeStripOverflowGestureModifier_frameForIndex___block_invoke(_QWORD *a1)
{
  uint64_t result;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  result = objc_msgSend(*(id *)(a1[4] + 144), "frameForIndex:", a1[6]);
  v3 = *(_QWORD **)(a1[5] + 8);
  v3[4] = v4;
  v3[5] = v5;
  v3[6] = v6;
  v3[7] = v7;
  return result;
}

- (CGPoint)anchorPointForIndex:(unint64_t)a3
{
  SBSwitcherModifier *continuousExposeAppSwitcherModifier;
  double v4;
  double v5;
  double v6;
  double v7;
  double *v8;
  double v9;
  double v10;
  objc_super v11;
  _QWORD v12[7];
  uint64_t v13;
  double *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  CGPoint result;

  v13 = 0;
  v14 = (double *)&v13;
  v15 = 0x3010000000;
  v17 = 0;
  v18 = 0;
  v16 = &unk_1D0FA064E;
  if (self->_showingAppSwitcherLayout)
  {
    continuousExposeAppSwitcherModifier = self->_continuousExposeAppSwitcherModifier;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __76__SBRevealContinuousExposeStripOverflowGestureModifier_anchorPointForIndex___block_invoke;
    v12[3] = &unk_1E8E9FD08;
    v12[4] = self;
    v12[5] = &v13;
    v12[6] = a3;
    -[SBChainableModifier performTransactionWithTemporaryChildModifier:usingBlock:](self, "performTransactionWithTemporaryChildModifier:usingBlock:", continuousExposeAppSwitcherModifier, v12);
    v4 = v14[4];
    v5 = v14[5];
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)SBRevealContinuousExposeStripOverflowGestureModifier;
    -[SBRevealContinuousExposeStripOverflowGestureModifier anchorPointForIndex:](&v11, sel_anchorPointForIndex_, a3);
    v4 = v6;
    v5 = v7;
    v8 = v14;
    v14[4] = v6;
    v8[5] = v7;
  }
  _Block_object_dispose(&v13, 8);
  v9 = v4;
  v10 = v5;
  result.y = v10;
  result.x = v9;
  return result;
}

uint64_t __76__SBRevealContinuousExposeStripOverflowGestureModifier_anchorPointForIndex___block_invoke(_QWORD *a1)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  result = objc_msgSend(*(id *)(a1[4] + 144), "anchorPointForIndex:", a1[6]);
  v3 = *(_QWORD *)(a1[5] + 8);
  *(_QWORD *)(v3 + 32) = v4;
  *(_QWORD *)(v3 + 40) = v5;
  return result;
}

- (UIRectCornerRadii)cornerRadiiForIndex:(unint64_t)a3
{
  SBSwitcherModifier *continuousExposeAppSwitcherModifier;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  objc_super v17;
  _QWORD v18[7];
  uint64_t v19;
  double *v20;
  uint64_t v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  UIRectCornerRadii result;

  v19 = 0;
  v20 = (double *)&v19;
  v21 = 0x4010000000;
  v22 = &unk_1D0FA064E;
  v23 = 0u;
  v24 = 0u;
  if (self->_showingAppSwitcherLayout)
  {
    continuousExposeAppSwitcherModifier = self->_continuousExposeAppSwitcherModifier;
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __76__SBRevealContinuousExposeStripOverflowGestureModifier_cornerRadiiForIndex___block_invoke;
    v18[3] = &unk_1E8E9FD08;
    v18[4] = self;
    v18[5] = &v19;
    v18[6] = a3;
    -[SBChainableModifier performTransactionWithTemporaryChildModifier:usingBlock:](self, "performTransactionWithTemporaryChildModifier:usingBlock:", continuousExposeAppSwitcherModifier, v18);
    v4 = v20[4];
    v5 = v20[5];
    v6 = v20[6];
    v7 = v20[7];
  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)SBRevealContinuousExposeStripOverflowGestureModifier;
    -[SBRevealContinuousExposeStripOverflowGestureModifier cornerRadiiForIndex:](&v17, sel_cornerRadiiForIndex_, a3);
    v4 = v8;
    v5 = v9;
    v6 = v10;
    v7 = v11;
    v12 = v20;
    v20[4] = v8;
    v12[5] = v9;
    v12[6] = v10;
    v12[7] = v11;
  }
  _Block_object_dispose(&v19, 8);
  v13 = v4;
  v14 = v5;
  v15 = v6;
  v16 = v7;
  result.topRight = v16;
  result.bottomRight = v15;
  result.bottomLeft = v14;
  result.topLeft = v13;
  return result;
}

uint64_t __76__SBRevealContinuousExposeStripOverflowGestureModifier_cornerRadiiForIndex___block_invoke(_QWORD *a1)
{
  uint64_t result;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  result = objc_msgSend(*(id *)(a1[4] + 144), "cornerRadiiForIndex:", a1[6]);
  v3 = *(_QWORD **)(a1[5] + 8);
  v3[4] = v4;
  v3[5] = v5;
  v3[6] = v6;
  v3[7] = v7;
  return result;
}

- (double)perspectiveAngleForAppLayout:(id)a3
{
  id v4;
  uint64_t v5;
  double translation;
  double stripWidth;
  SBSwitcherModifier *continuousExposeAppSwitcherModifier;
  BOOL v9;
  double v10;
  _QWORD v12[5];
  id v13;
  uint64_t *v14;
  objc_super v15;
  uint64_t v16;
  double *v17;
  uint64_t v18;
  uint64_t v19;

  v4 = a3;
  v16 = 0;
  v17 = (double *)&v16;
  v18 = 0x2020000000;
  v19 = 0;
  v15.receiver = self;
  v15.super_class = (Class)SBRevealContinuousExposeStripOverflowGestureModifier;
  -[SBRevealContinuousExposeStripOverflowGestureModifier perspectiveAngleForAppLayout:](&v15, sel_perspectiveAngleForAppLayout_, v4);
  v19 = v5;
  translation = self->_translation;
  stripWidth = self->_stripWidth;
  if (self->_showingAppSwitcherLayout)
  {
    continuousExposeAppSwitcherModifier = self->_continuousExposeAppSwitcherModifier;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __85__SBRevealContinuousExposeStripOverflowGestureModifier_perspectiveAngleForAppLayout___block_invoke;
    v12[3] = &unk_1E8E9FD30;
    v14 = &v16;
    v12[4] = self;
    v13 = v4;
    -[SBChainableModifier performTransactionWithTemporaryChildModifier:usingBlock:](self, "performTransactionWithTemporaryChildModifier:usingBlock:", continuousExposeAppSwitcherModifier, v12);

  }
  v9 = -[SBAppLayout isOrContainsAppLayout:](self->_initialAppLayout, "isOrContainsAppLayout:", v4);
  v10 = v17[3];
  if (!v9)
  {
    v10 = v10 + fmin(fmax(translation / stripWidth + 0.0, 0.0), 1.0) * (v10 * 0.5 - v10);
    v17[3] = v10;
  }
  _Block_object_dispose(&v16, 8);

  return v10;
}

uint64_t __85__SBRevealContinuousExposeStripOverflowGestureModifier_perspectiveAngleForAppLayout___block_invoke(_QWORD *a1)
{
  uint64_t result;
  uint64_t v3;

  result = objc_msgSend(*(id *)(a1[4] + 144), "perspectiveAngleForAppLayout:", a1[5]);
  *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = v3;
  return result;
}

- (id)visibleAppLayouts
{
  SBSwitcherModifier *continuousExposeAppSwitcherModifier;
  uint64_t v3;
  void *v4;
  id v5;
  objc_super v7;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__0;
  v13 = __Block_byref_object_dispose__0;
  v14 = 0;
  if (self->_showingAppSwitcherLayout)
  {
    continuousExposeAppSwitcherModifier = self->_continuousExposeAppSwitcherModifier;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __73__SBRevealContinuousExposeStripOverflowGestureModifier_visibleAppLayouts__block_invoke;
    v8[3] = &unk_1E8E9DFA0;
    v8[4] = self;
    v8[5] = &v9;
    -[SBChainableModifier performTransactionWithTemporaryChildModifier:usingBlock:](self, "performTransactionWithTemporaryChildModifier:usingBlock:", continuousExposeAppSwitcherModifier, v8);
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SBRevealContinuousExposeStripOverflowGestureModifier;
    -[SBRevealContinuousExposeStripOverflowGestureModifier visibleAppLayouts](&v7, sel_visibleAppLayouts);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)v10[5];
    v10[5] = v3;

  }
  v5 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v5;
}

void __73__SBRevealContinuousExposeStripOverflowGestureModifier_visibleAppLayouts__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "visibleAppLayouts");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (CGRect)frameForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 withBounds:(CGRect)a5
{
  double height;
  double width;
  double y;
  double x;
  id v11;
  void *v12;
  SBSwitcherModifier *continuousExposeAppSwitcherModifier;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  objc_super v27;
  _QWORD v28[5];
  id v29;
  uint64_t *v30;
  int64_t v31;
  double v32;
  double v33;
  double v34;
  double v35;
  uint64_t v36;
  double *v37;
  uint64_t v38;
  void *v39;
  __int128 v40;
  __int128 v41;
  CGRect result;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v11 = a4;
  v12 = v11;
  v36 = 0;
  v37 = (double *)&v36;
  v38 = 0x4010000000;
  v39 = &unk_1D0FA064E;
  v40 = 0u;
  v41 = 0u;
  if (self->_showingAppSwitcherLayout)
  {
    continuousExposeAppSwitcherModifier = self->_continuousExposeAppSwitcherModifier;
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __98__SBRevealContinuousExposeStripOverflowGestureModifier_frameForLayoutRole_inAppLayout_withBounds___block_invoke;
    v28[3] = &unk_1E8E9FD58;
    v30 = &v36;
    v31 = a3;
    v28[4] = self;
    v29 = v11;
    v32 = x;
    v33 = y;
    v34 = width;
    v35 = height;
    -[SBChainableModifier performTransactionWithTemporaryChildModifier:usingBlock:](self, "performTransactionWithTemporaryChildModifier:usingBlock:", continuousExposeAppSwitcherModifier, v28);

    v14 = v37[4];
    v15 = v37[5];
    v16 = v37[6];
    v17 = v37[7];
  }
  else
  {
    v27.receiver = self;
    v27.super_class = (Class)SBRevealContinuousExposeStripOverflowGestureModifier;
    -[SBRevealContinuousExposeStripOverflowGestureModifier frameForLayoutRole:inAppLayout:withBounds:](&v27, sel_frameForLayoutRole_inAppLayout_withBounds_, a3, v11, x, y, width, height);
    v14 = v18;
    v15 = v19;
    v16 = v20;
    v17 = v21;
    v22 = v37;
    v37[4] = v18;
    v22[5] = v19;
    v22[6] = v20;
    v22[7] = v21;
  }
  _Block_object_dispose(&v36, 8);

  v23 = v14;
  v24 = v15;
  v25 = v16;
  v26 = v17;
  result.size.height = v26;
  result.size.width = v25;
  result.origin.y = v24;
  result.origin.x = v23;
  return result;
}

uint64_t __98__SBRevealContinuousExposeStripOverflowGestureModifier_frameForLayoutRole_inAppLayout_withBounds___block_invoke(uint64_t a1)
{
  uint64_t result;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "frameForLayoutRole:inAppLayout:withBounds:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88));
  v3 = *(_QWORD **)(*(_QWORD *)(a1 + 48) + 8);
  v3[4] = v4;
  v3[5] = v5;
  v3[6] = v6;
  v3[7] = v7;
  return result;
}

- (double)scaleForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  id v6;
  void *v7;
  SBSwitcherModifier *continuousExposeAppSwitcherModifier;
  double v9;
  double v10;
  objc_super v12;
  _QWORD v13[5];
  id v14;
  uint64_t *v15;
  int64_t v16;
  uint64_t v17;
  double *v18;
  uint64_t v19;
  uint64_t v20;

  v6 = a4;
  v7 = v6;
  v17 = 0;
  v18 = (double *)&v17;
  v19 = 0x2020000000;
  v20 = 0;
  if (self->_showingAppSwitcherLayout)
  {
    continuousExposeAppSwitcherModifier = self->_continuousExposeAppSwitcherModifier;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __87__SBRevealContinuousExposeStripOverflowGestureModifier_scaleForLayoutRole_inAppLayout___block_invoke;
    v13[3] = &unk_1E8E9FD80;
    v15 = &v17;
    v16 = a3;
    v13[4] = self;
    v14 = v6;
    -[SBChainableModifier performTransactionWithTemporaryChildModifier:usingBlock:](self, "performTransactionWithTemporaryChildModifier:usingBlock:", continuousExposeAppSwitcherModifier, v13);

    v9 = v18[3];
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)SBRevealContinuousExposeStripOverflowGestureModifier;
    -[SBRevealContinuousExposeStripOverflowGestureModifier scaleForLayoutRole:inAppLayout:](&v12, sel_scaleForLayoutRole_inAppLayout_, a3, v6);
    v9 = v10;
    v18[3] = v10;
  }
  _Block_object_dispose(&v17, 8);

  return v9;
}

uint64_t __87__SBRevealContinuousExposeStripOverflowGestureModifier_scaleForLayoutRole_inAppLayout___block_invoke(_QWORD *a1)
{
  uint64_t result;
  uint64_t v3;

  result = objc_msgSend(*(id *)(a1[4] + 144), "scaleForLayoutRole:inAppLayout:", a1[7], a1[5]);
  *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = v3;
  return result;
}

- (BOOL)shouldPinLayoutRolesToSpace:(unint64_t)a3
{
  SBSwitcherModifier *continuousExposeAppSwitcherModifier;
  unsigned __int8 v4;
  objc_super v6;
  _QWORD v7[7];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  if (self->_showingAppSwitcherLayout)
  {
    continuousExposeAppSwitcherModifier = self->_continuousExposeAppSwitcherModifier;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __84__SBRevealContinuousExposeStripOverflowGestureModifier_shouldPinLayoutRolesToSpace___block_invoke;
    v7[3] = &unk_1E8E9FD08;
    v7[4] = self;
    v7[5] = &v8;
    v7[6] = a3;
    -[SBChainableModifier performTransactionWithTemporaryChildModifier:usingBlock:](self, "performTransactionWithTemporaryChildModifier:usingBlock:", continuousExposeAppSwitcherModifier, v7);
    v4 = *((_BYTE *)v9 + 24) != 0;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)SBRevealContinuousExposeStripOverflowGestureModifier;
    v4 = -[SBRevealContinuousExposeStripOverflowGestureModifier shouldPinLayoutRolesToSpace:](&v6, sel_shouldPinLayoutRolesToSpace_, a3);
    *((_BYTE *)v9 + 24) = v4;
  }
  _Block_object_dispose(&v8, 8);
  return v4;
}

uint64_t __84__SBRevealContinuousExposeStripOverflowGestureModifier_shouldPinLayoutRolesToSpace___block_invoke(_QWORD *a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1[4] + 144), "shouldPinLayoutRolesToSpace:", a1[6]);
  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = result;
  return result;
}

- (double)opacityForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5
{
  id v8;
  void *v9;
  SBSwitcherModifier *continuousExposeAppSwitcherModifier;
  double v11;
  double v12;
  objc_super v14;
  _QWORD v15[5];
  id v16;
  uint64_t *v17;
  int64_t v18;
  unint64_t v19;
  uint64_t v20;
  double *v21;
  uint64_t v22;
  uint64_t v23;

  v8 = a4;
  v9 = v8;
  v20 = 0;
  v21 = (double *)&v20;
  v22 = 0x2020000000;
  v23 = 0;
  if (self->_showingAppSwitcherLayout)
  {
    continuousExposeAppSwitcherModifier = self->_continuousExposeAppSwitcherModifier;
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __97__SBRevealContinuousExposeStripOverflowGestureModifier_opacityForLayoutRole_inAppLayout_atIndex___block_invoke;
    v15[3] = &unk_1E8E9FDA8;
    v17 = &v20;
    v18 = a3;
    v15[4] = self;
    v16 = v8;
    v19 = a5;
    -[SBChainableModifier performTransactionWithTemporaryChildModifier:usingBlock:](self, "performTransactionWithTemporaryChildModifier:usingBlock:", continuousExposeAppSwitcherModifier, v15);

    v11 = v21[3];
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)SBRevealContinuousExposeStripOverflowGestureModifier;
    -[SBRevealContinuousExposeStripOverflowGestureModifier opacityForLayoutRole:inAppLayout:atIndex:](&v14, sel_opacityForLayoutRole_inAppLayout_atIndex_, a3, v8, a5);
    v11 = v12;
    v21[3] = v12;
  }
  _Block_object_dispose(&v20, 8);

  return v11;
}

uint64_t __97__SBRevealContinuousExposeStripOverflowGestureModifier_opacityForLayoutRole_inAppLayout_atIndex___block_invoke(_QWORD *a1)
{
  uint64_t result;
  uint64_t v3;

  result = objc_msgSend(*(id *)(a1[4] + 144), "opacityForLayoutRole:inAppLayout:atIndex:", a1[7], a1[5], a1[8]);
  *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = v3;
  return result;
}

- (double)shadowOpacityForLayoutRole:(int64_t)a3 atIndex:(unint64_t)a4
{
  SBSwitcherModifier *continuousExposeAppSwitcherModifier;
  double v5;
  double v6;
  objc_super v8;
  _QWORD v9[8];
  uint64_t v10;
  double *v11;
  uint64_t v12;
  uint64_t v13;

  v10 = 0;
  v11 = (double *)&v10;
  v12 = 0x2020000000;
  v13 = 0;
  if (self->_showingAppSwitcherLayout)
  {
    continuousExposeAppSwitcherModifier = self->_continuousExposeAppSwitcherModifier;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __91__SBRevealContinuousExposeStripOverflowGestureModifier_shadowOpacityForLayoutRole_atIndex___block_invoke;
    v9[3] = &unk_1E8E9FDD0;
    v9[4] = self;
    v9[5] = &v10;
    v9[6] = a3;
    v9[7] = a4;
    -[SBChainableModifier performTransactionWithTemporaryChildModifier:usingBlock:](self, "performTransactionWithTemporaryChildModifier:usingBlock:", continuousExposeAppSwitcherModifier, v9);
    v5 = v11[3];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)SBRevealContinuousExposeStripOverflowGestureModifier;
    -[SBRevealContinuousExposeStripOverflowGestureModifier shadowOpacityForLayoutRole:atIndex:](&v8, sel_shadowOpacityForLayoutRole_atIndex_, a3, a4);
    v5 = v6;
    v11[3] = v6;
  }
  _Block_object_dispose(&v10, 8);
  return v5;
}

uint64_t __91__SBRevealContinuousExposeStripOverflowGestureModifier_shadowOpacityForLayoutRole_atIndex___block_invoke(_QWORD *a1)
{
  uint64_t result;
  uint64_t v3;

  result = objc_msgSend(*(id *)(a1[4] + 144), "shadowOpacityForLayoutRole:atIndex:", a1[6], a1[7]);
  *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = v3;
  return result;
}

- (SBSwitcherWallpaperGradientAttributes)wallpaperGradientAttributesForIndex:(unint64_t)a3
{
  SBSwitcherModifier *continuousExposeAppSwitcherModifier;
  double v4;
  double v5;
  double v6;
  double v7;
  double *v8;
  double v9;
  double v10;
  objc_super v11;
  _QWORD v12[7];
  uint64_t v13;
  double *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  SBSwitcherWallpaperGradientAttributes result;

  v13 = 0;
  v14 = (double *)&v13;
  v15 = 0x3010000000;
  v17 = 0;
  v18 = 0;
  v16 = &unk_1D0FA064E;
  if (self->_showingAppSwitcherLayout)
  {
    continuousExposeAppSwitcherModifier = self->_continuousExposeAppSwitcherModifier;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __92__SBRevealContinuousExposeStripOverflowGestureModifier_wallpaperGradientAttributesForIndex___block_invoke;
    v12[3] = &unk_1E8E9FD08;
    v12[4] = self;
    v12[5] = &v13;
    v12[6] = a3;
    -[SBChainableModifier performTransactionWithTemporaryChildModifier:usingBlock:](self, "performTransactionWithTemporaryChildModifier:usingBlock:", continuousExposeAppSwitcherModifier, v12);
    v4 = v14[4];
    v5 = v14[5];
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)SBRevealContinuousExposeStripOverflowGestureModifier;
    -[SBRevealContinuousExposeStripOverflowGestureModifier wallpaperGradientAttributesForIndex:](&v11, sel_wallpaperGradientAttributesForIndex_, a3);
    v4 = v6;
    v5 = v7;
    v8 = v14;
    v14[4] = v6;
    v8[5] = v7;
  }
  _Block_object_dispose(&v13, 8);
  v9 = v4;
  v10 = v5;
  result.trailingAlpha = v10;
  result.leadingAlpha = v9;
  return result;
}

uint64_t __92__SBRevealContinuousExposeStripOverflowGestureModifier_wallpaperGradientAttributesForIndex___block_invoke(_QWORD *a1)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  result = objc_msgSend(*(id *)(a1[4] + 144), "wallpaperGradientAttributesForIndex:", a1[6]);
  v3 = *(_QWORD *)(a1[5] + 8);
  *(_QWORD *)(v3 + 32) = v4;
  *(_QWORD *)(v3 + 40) = v5;
  return result;
}

- (double)contentPageViewScaleForAppLayout:(id)a3 withScale:(double)a4
{
  id v6;
  void *v7;
  SBSwitcherModifier *continuousExposeAppSwitcherModifier;
  double v9;
  double v10;
  objc_super v12;
  _QWORD v13[5];
  id v14;
  uint64_t *v15;
  double v16;
  uint64_t v17;
  double *v18;
  uint64_t v19;
  uint64_t v20;

  v6 = a3;
  v7 = v6;
  v17 = 0;
  v18 = (double *)&v17;
  v19 = 0x2020000000;
  v20 = 0;
  if (self->_showingAppSwitcherLayout)
  {
    continuousExposeAppSwitcherModifier = self->_continuousExposeAppSwitcherModifier;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __99__SBRevealContinuousExposeStripOverflowGestureModifier_contentPageViewScaleForAppLayout_withScale___block_invoke;
    v13[3] = &unk_1E8E9FD80;
    v15 = &v17;
    v13[4] = self;
    v14 = v6;
    v16 = a4;
    -[SBChainableModifier performTransactionWithTemporaryChildModifier:usingBlock:](self, "performTransactionWithTemporaryChildModifier:usingBlock:", continuousExposeAppSwitcherModifier, v13);

    v9 = v18[3];
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)SBRevealContinuousExposeStripOverflowGestureModifier;
    -[SBRevealContinuousExposeStripOverflowGestureModifier contentPageViewScaleForAppLayout:withScale:](&v12, sel_contentPageViewScaleForAppLayout_withScale_, v6, a4);
    v9 = v10;
    v18[3] = v10;
  }
  _Block_object_dispose(&v17, 8);

  return v9;
}

uint64_t __99__SBRevealContinuousExposeStripOverflowGestureModifier_contentPageViewScaleForAppLayout_withScale___block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "contentPageViewScaleForAppLayout:withScale:", *(_QWORD *)(a1 + 40), *(double *)(a1 + 56));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v3;
  return result;
}

- (double)dimmingAlphaForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  id v6;
  void *v7;
  SBSwitcherModifier *continuousExposeAppSwitcherModifier;
  double v9;
  double v10;
  objc_super v12;
  _QWORD v13[5];
  id v14;
  uint64_t *v15;
  int64_t v16;
  uint64_t v17;
  double *v18;
  uint64_t v19;
  uint64_t v20;

  v6 = a4;
  v7 = v6;
  v17 = 0;
  v18 = (double *)&v17;
  v19 = 0x2020000000;
  v20 = 0;
  if (self->_showingAppSwitcherLayout)
  {
    continuousExposeAppSwitcherModifier = self->_continuousExposeAppSwitcherModifier;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __94__SBRevealContinuousExposeStripOverflowGestureModifier_dimmingAlphaForLayoutRole_inAppLayout___block_invoke;
    v13[3] = &unk_1E8E9FD80;
    v15 = &v17;
    v16 = a3;
    v13[4] = self;
    v14 = v6;
    -[SBChainableModifier performTransactionWithTemporaryChildModifier:usingBlock:](self, "performTransactionWithTemporaryChildModifier:usingBlock:", continuousExposeAppSwitcherModifier, v13);

    v9 = v18[3];
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)SBRevealContinuousExposeStripOverflowGestureModifier;
    -[SBRevealContinuousExposeStripOverflowGestureModifier dimmingAlphaForLayoutRole:inAppLayout:](&v12, sel_dimmingAlphaForLayoutRole_inAppLayout_, a3, v6);
    v9 = v10;
    v18[3] = v10;
  }
  _Block_object_dispose(&v17, 8);

  return v9;
}

uint64_t __94__SBRevealContinuousExposeStripOverflowGestureModifier_dimmingAlphaForLayoutRole_inAppLayout___block_invoke(_QWORD *a1)
{
  uint64_t result;
  uint64_t v3;

  result = objc_msgSend(*(id *)(a1[4] + 144), "dimmingAlphaForLayoutRole:inAppLayout:", a1[7], a1[5]);
  *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = v3;
  return result;
}

- (double)titleOpacityForIndex:(unint64_t)a3
{
  SBSwitcherModifier *continuousExposeAppSwitcherModifier;
  double v4;
  double v5;
  objc_super v7;
  _QWORD v8[7];
  uint64_t v9;
  double *v10;
  uint64_t v11;
  uint64_t v12;

  v9 = 0;
  v10 = (double *)&v9;
  v11 = 0x2020000000;
  v12 = 0;
  if (self->_showingAppSwitcherLayout)
  {
    continuousExposeAppSwitcherModifier = self->_continuousExposeAppSwitcherModifier;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __77__SBRevealContinuousExposeStripOverflowGestureModifier_titleOpacityForIndex___block_invoke;
    v8[3] = &unk_1E8E9FD08;
    v8[4] = self;
    v8[5] = &v9;
    v8[6] = a3;
    -[SBChainableModifier performTransactionWithTemporaryChildModifier:usingBlock:](self, "performTransactionWithTemporaryChildModifier:usingBlock:", continuousExposeAppSwitcherModifier, v8);
    v4 = v10[3];
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SBRevealContinuousExposeStripOverflowGestureModifier;
    -[SBRevealContinuousExposeStripOverflowGestureModifier titleOpacityForIndex:](&v7, sel_titleOpacityForIndex_, a3);
    v4 = v5;
    v10[3] = v5;
  }
  _Block_object_dispose(&v9, 8);
  return v4;
}

uint64_t __77__SBRevealContinuousExposeStripOverflowGestureModifier_titleOpacityForIndex___block_invoke(_QWORD *a1)
{
  uint64_t result;
  uint64_t v3;

  result = objc_msgSend(*(id *)(a1[4] + 144), "titleOpacityForIndex:", a1[6]);
  *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = v3;
  return result;
}

- (BOOL)shouldUseAnchorPointToPinLayoutRolesToSpace:(unint64_t)a3
{
  SBSwitcherModifier *continuousExposeAppSwitcherModifier;
  unsigned __int8 v4;
  objc_super v6;
  _QWORD v7[7];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  if (self->_showingAppSwitcherLayout)
  {
    continuousExposeAppSwitcherModifier = self->_continuousExposeAppSwitcherModifier;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __100__SBRevealContinuousExposeStripOverflowGestureModifier_shouldUseAnchorPointToPinLayoutRolesToSpace___block_invoke;
    v7[3] = &unk_1E8E9FD08;
    v7[4] = self;
    v7[5] = &v8;
    v7[6] = a3;
    -[SBChainableModifier performTransactionWithTemporaryChildModifier:usingBlock:](self, "performTransactionWithTemporaryChildModifier:usingBlock:", continuousExposeAppSwitcherModifier, v7);
    v4 = *((_BYTE *)v9 + 24) != 0;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)SBRevealContinuousExposeStripOverflowGestureModifier;
    v4 = -[SBRevealContinuousExposeStripOverflowGestureModifier shouldUseAnchorPointToPinLayoutRolesToSpace:](&v6, sel_shouldUseAnchorPointToPinLayoutRolesToSpace_, a3);
    *((_BYTE *)v9 + 24) = v4;
  }
  _Block_object_dispose(&v8, 8);
  return v4;
}

uint64_t __100__SBRevealContinuousExposeStripOverflowGestureModifier_shouldUseAnchorPointToPinLayoutRolesToSpace___block_invoke(_QWORD *a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1[4] + 144), "shouldPinLayoutRolesToSpace:", a1[6]);
  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = result;
  return result;
}

- (CGRect)adjustedSpaceAccessoryViewFrame:(CGRect)a3 forAppLayout:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  void *v10;
  SBSwitcherModifier *continuousExposeAppSwitcherModifier;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  objc_super v25;
  _QWORD v26[5];
  id v27;
  uint64_t *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  uint64_t v33;
  double *v34;
  uint64_t v35;
  void *v36;
  __int128 v37;
  __int128 v38;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = a4;
  v10 = v9;
  v33 = 0;
  v34 = (double *)&v33;
  v35 = 0x4010000000;
  v36 = &unk_1D0FA064E;
  v37 = 0u;
  v38 = 0u;
  if (self->_showingAppSwitcherLayout)
  {
    continuousExposeAppSwitcherModifier = self->_continuousExposeAppSwitcherModifier;
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __101__SBRevealContinuousExposeStripOverflowGestureModifier_adjustedSpaceAccessoryViewFrame_forAppLayout___block_invoke;
    v26[3] = &unk_1E8E9FDF8;
    v28 = &v33;
    v26[4] = self;
    v29 = x;
    v30 = y;
    v31 = width;
    v32 = height;
    v27 = v9;
    -[SBChainableModifier performTransactionWithTemporaryChildModifier:usingBlock:](self, "performTransactionWithTemporaryChildModifier:usingBlock:", continuousExposeAppSwitcherModifier, v26);

    v12 = v34[4];
    v13 = v34[5];
    v14 = v34[6];
    v15 = v34[7];
  }
  else
  {
    v25.receiver = self;
    v25.super_class = (Class)SBRevealContinuousExposeStripOverflowGestureModifier;
    -[SBRevealContinuousExposeStripOverflowGestureModifier adjustedSpaceAccessoryViewFrame:forAppLayout:](&v25, sel_adjustedSpaceAccessoryViewFrame_forAppLayout_, v9, x, y, width, height);
    v12 = v16;
    v13 = v17;
    v14 = v18;
    v15 = v19;
    v20 = v34;
    v34[4] = v16;
    v20[5] = v17;
    v20[6] = v18;
    v20[7] = v19;
  }
  _Block_object_dispose(&v33, 8);

  v21 = v12;
  v22 = v13;
  v23 = v14;
  v24 = v15;
  result.size.height = v24;
  result.size.width = v23;
  result.origin.y = v22;
  result.origin.x = v21;
  return result;
}

uint64_t __101__SBRevealContinuousExposeStripOverflowGestureModifier_adjustedSpaceAccessoryViewFrame_forAppLayout___block_invoke(uint64_t a1)
{
  uint64_t result;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "adjustedSpaceAccessoryViewFrame:forAppLayout:", *(_QWORD *)(a1 + 40), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
  v3 = *(_QWORD **)(*(_QWORD *)(a1 + 48) + 8);
  v3[4] = v4;
  v3[5] = v5;
  v3[6] = v6;
  v3[7] = v7;
  return result;
}

- (CGPoint)adjustedSpaceAccessoryViewAnchorPoint:(CGPoint)a3 forAppLayout:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  SBSwitcherModifier *continuousExposeAppSwitcherModifier;
  double v10;
  double v11;
  double v12;
  double v13;
  double *v14;
  double v15;
  double v16;
  objc_super v17;
  _QWORD v18[5];
  id v19;
  uint64_t *v20;
  double v21;
  double v22;
  uint64_t v23;
  double *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  v8 = v7;
  v23 = 0;
  v24 = (double *)&v23;
  v25 = 0x3010000000;
  v27 = 0;
  v28 = 0;
  v26 = &unk_1D0FA064E;
  if (self->_showingAppSwitcherLayout)
  {
    continuousExposeAppSwitcherModifier = self->_continuousExposeAppSwitcherModifier;
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __107__SBRevealContinuousExposeStripOverflowGestureModifier_adjustedSpaceAccessoryViewAnchorPoint_forAppLayout___block_invoke;
    v18[3] = &unk_1E8E9FDA8;
    v20 = &v23;
    v18[4] = self;
    v21 = x;
    v22 = y;
    v19 = v7;
    -[SBChainableModifier performTransactionWithTemporaryChildModifier:usingBlock:](self, "performTransactionWithTemporaryChildModifier:usingBlock:", continuousExposeAppSwitcherModifier, v18);

    v10 = v24[4];
    v11 = v24[5];
  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)SBRevealContinuousExposeStripOverflowGestureModifier;
    -[SBRevealContinuousExposeStripOverflowGestureModifier adjustedSpaceAccessoryViewAnchorPoint:forAppLayout:](&v17, sel_adjustedSpaceAccessoryViewAnchorPoint_forAppLayout_, v7, x, y);
    v10 = v12;
    v11 = v13;
    v14 = v24;
    v24[4] = v12;
    v14[5] = v13;
  }
  _Block_object_dispose(&v23, 8);

  v15 = v10;
  v16 = v11;
  result.y = v16;
  result.x = v15;
  return result;
}

uint64_t __107__SBRevealContinuousExposeStripOverflowGestureModifier_adjustedSpaceAccessoryViewAnchorPoint_forAppLayout___block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "adjustedSpaceAccessoryViewAnchorPoint:forAppLayout:", *(_QWORD *)(a1 + 40), *(double *)(a1 + 56), *(double *)(a1 + 64));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  *(_QWORD *)(v3 + 32) = v4;
  *(_QWORD *)(v3 + 40) = v5;
  return result;
}

- (id)animatablePropertyIdentifiers
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("SBRevealContinuousExposeStripOverflowGestureModifierAnimatablePropertyIdentifier"), 0);
}

- (double)modelValueForAnimatableProperty:(id)a3 currentValue:(double)a4 creating:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  double v9;
  double v10;
  objc_super v12;

  v5 = a5;
  v8 = a3;
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("SBRevealContinuousExposeStripOverflowGestureModifierAnimatablePropertyIdentifier")))
  {
    if (v5)
      v9 = 0.0;
    else
      v9 = 1.0;
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)SBRevealContinuousExposeStripOverflowGestureModifier;
    -[SBRevealContinuousExposeStripOverflowGestureModifier modelValueForAnimatableProperty:currentValue:creating:](&v12, sel_modelValueForAnimatableProperty_currentValue_creating_, v8, v5, a4);
    v9 = v10;
  }

  return v9;
}

- (int64_t)updateModeForAnimatableProperty:(id)a3
{
  id v4;
  int64_t v5;
  objc_super v7;

  v4 = a3;
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("SBRevealContinuousExposeStripOverflowGestureModifierAnimatablePropertyIdentifier")) & 1) != 0)
  {
    v5 = 3;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SBRevealContinuousExposeStripOverflowGestureModifier;
    v5 = -[SBRevealContinuousExposeStripOverflowGestureModifier updateModeForAnimatableProperty:](&v7, sel_updateModeForAnimatableProperty_, v4);
  }

  return v5;
}

- (BOOL)shouldUpdateAnimatableProperty:(id)a3
{
  id v4;
  unsigned __int8 v5;
  objc_super v7;

  v4 = a3;
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("SBRevealContinuousExposeStripOverflowGestureModifierAnimatablePropertyIdentifier")))
  {
    v5 = self->_showingAppSwitcherLayout != self->_translation > self->_stripWidth;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SBRevealContinuousExposeStripOverflowGestureModifier;
    v5 = -[SBRevealContinuousExposeStripOverflowGestureModifier shouldUpdateAnimatableProperty:](&v7, sel_shouldUpdateAnimatableProperty_, v4);
  }

  return v5;
}

- (double)_finalScaleForFullScreenAppLayout
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;

  -[SBSwitcherModifier autoLayoutSpaceForAppLayout:](self, "autoLayoutSpaceForAppLayout:", self->_initialAppLayout);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "configuration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "containerBounds");
  v6 = v5;

  -[SBRevealContinuousExposeStripOverflowGestureModifier containerViewBounds](self, "containerViewBounds");
  v8 = v7;
  if (!-[SBRevealContinuousExposeStripOverflowGestureModifier _hideDock](self, "_hideDock"))
  {
    -[SBRevealContinuousExposeStripOverflowGestureModifier floatingDockHeight](self, "floatingDockHeight");
    v8 = v8 - v9;
  }
  -[SBRevealContinuousExposeStripOverflowGestureModifier chamoisLayoutAttributes](self, "chamoisLayoutAttributes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stripVerticalEdgeSpacing");
  v12 = v8 + v11 * -2.0;

  return v12 / v6;
}

- (id)_appSwitcherDefaults
{
  SBAppSwitcherDefaults *appSwitcherDefaults;
  void *v4;
  SBAppSwitcherDefaults *v5;
  SBAppSwitcherDefaults *v6;

  appSwitcherDefaults = self->_appSwitcherDefaults;
  if (!appSwitcherDefaults)
  {
    +[SBDefaults localDefaults](SBDefaults, "localDefaults");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appSwitcherDefaults");
    v5 = (SBAppSwitcherDefaults *)objc_claimAutoreleasedReturnValue();
    v6 = self->_appSwitcherDefaults;
    self->_appSwitcherDefaults = v5;

    appSwitcherDefaults = self->_appSwitcherDefaults;
  }
  return appSwitcherDefaults;
}

- (BOOL)_hideDock
{
  int64_t v3;
  void *v4;
  void *v5;
  char v6;
  BOOL v7;

  v3 = -[SBAppLayout preferredDisplayOrdinal](self->_initialAppLayout, "preferredDisplayOrdinal");
  -[SBRevealContinuousExposeStripOverflowGestureModifier _appSwitcherDefaults](self, "_appSwitcherDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
    v6 = objc_msgSend(v4, "chamoisHideDockExternal");
  else
    v6 = objc_msgSend(v4, "chamoisHideDock");
  v7 = v6;

  return v7;
}

- (SBAppLayout)initialAppLayout
{
  return self->_initialAppLayout;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appSwitcherDefaults, 0);
  objc_storeStrong((id *)&self->_continuousExposeAppSwitcherModifier, 0);
  objc_storeStrong((id *)&self->_initialAppLayout, 0);
  objc_storeStrong((id *)&self->_appExposeBundleIdentifier, 0);
}

@end
