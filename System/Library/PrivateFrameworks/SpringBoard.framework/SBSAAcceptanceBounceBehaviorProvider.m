@implementation SBSAAcceptanceBounceBehaviorProvider

- (SBSAAcceptanceBounceBehaviorProvider)initWithParticipantIdentifier:(id)a3 style:(int64_t)a4 triggeredBlock:(id)a5
{
  id v8;
  SBSAAcceptanceBounceBehaviorProvider *v9;
  SBSAAcceptanceBounceBehaviorProvider *v10;
  uint64_t v11;
  id triggeredBlock;
  objc_super v14;

  v8 = a5;
  v14.receiver = self;
  v14.super_class = (Class)SBSAAcceptanceBounceBehaviorProvider;
  v9 = -[SBSASequencedBehaviorProvider initWithParticipantIdentifier:](&v14, sel_initWithParticipantIdentifier_, a3);
  v10 = v9;
  if (v9)
  {
    v9->_style = a4;
    v11 = objc_msgSend(v8, "copy");
    triggeredBlock = v10->_triggeredBlock;
    v10->_triggeredBlock = (id)v11;

  }
  return v10;
}

- (void)removeFromParentProvider
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1D0540000, log, OS_LOG_TYPE_DEBUG, "AcceptanceBounceBehaviorProvider triggered block upon removal", v1, 2u);
}

- (int64_t)finalPhase
{
  return 4;
}

- (id)nameForPhase:(int64_t)a3
{
  void *v4;
  __CFString *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBSAAcceptanceBounceBehaviorProvider;
  -[SBSASequencedBehaviorProvider nameForPhase:](&v7, sel_nameForPhase_);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)a3 <= 4)
  {
    v5 = off_1E8EBFEB8[a3];

    v4 = v5;
  }
  return v4;
}

- (BOOL)canProceedWithContext:(id)a3 shouldRetry:(BOOL *)a4
{
  return 1;
}

- (BOOL)canPersistAcrossLayoutStateChangesToNewElementContexts:(id)a3
{
  int v4;

  v4 = objc_msgSend(a3, "bs_containsObjectPassingTest:", &__block_literal_global_377) ^ 1;
  if (self->_shouldBeRemovedUponLayoutChange)
    return 0;
  else
    return v4;
}

BOOL __95__SBSAAcceptanceBounceBehaviorProvider_canPersistAcrossLayoutStateChangesToNewElementContexts___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "layoutMode") == 3;
}

- (id)updatedContextFromContext:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;
  _QWORD v16[10];
  objc_super v17;

  v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)SBSAAcceptanceBounceBehaviorProvider;
  -[SBSASequencedBehaviorProvider updatedContextFromContext:](&v17, sel_updatedContextFromContext_, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[SBSASequencedBehaviorProvider activePhase](self, "activePhase") == 1 && self->_style)
  {
    objc_msgSend(v6, "inertContainerFrame");
    objc_msgSend((id)objc_opt_class(), "settings");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "acceptanceSideBounceXSensorExpansion");
    objc_msgSend(v6, "displayScale");
    v15 = v8;
    UIRectCenteredXInRectScale();
    objc_msgSend(v7, "acceptanceSideBounceXSensorOffset", v15);
    UIRectIntegralWithScale();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __66__SBSAAcceptanceBounceBehaviorProvider_updatedContextFromContext___block_invoke;
    v16[3] = &unk_1E8EB2BD0;
    v16[4] = self;
    v16[5] = a2;
    v16[6] = v9;
    v16[7] = v10;
    v16[8] = v11;
    v16[9] = v12;
    v13 = objc_msgSend(v6, "copyWithBlock:", v16);

    v6 = (void *)v13;
  }

  return v5;
}

void __66__SBSAAcceptanceBounceBehaviorProvider_updatedContextFromContext___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  Class v10;
  objc_class *v11;
  void *v12;
  id v13;

  v13 = a2;
  if (!v13)
    goto LABEL_9;
  objc_opt_self();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v13;
  if (v3)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
  }
  else
  {
    v5 = 0;
  }
  v6 = v5;

  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(a1 + 32);
    v8 = *(_QWORD *)(a1 + 40);
    v10 = NSClassFromString(CFSTR("SBSAContextMutator"));
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", v8, v9, CFSTR("SBSAAcceptanceBounceBehaviorProvider.m"), 109, CFSTR("Unexpected class – expected '%@', got '%@'"), v10, v12);

LABEL_9:
    v6 = 0;
  }

  objc_msgSend(v6, "setInertContainerFrame:", *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
}

- (id)updatedPreferencesFromPreferences:(id)a3 context:(id)a4 relevantPropertyIdentity:(id *)a5
{
  id v8;
  id v9;
  int64_t v10;
  uint64_t v11;
  void *v12;
  SBSAElementLayoutTransition *lastSeenLastChangingElementTransition;
  SBSAElementLayoutTransition *v15;
  SBSAElementLayoutTransition *v16;
  char v17;
  SBSAElementLayoutTransition *v18;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = -[SBSASequencedBehaviorProvider activePhase](self, "activePhase");
  switch(v10)
  {
    case 3:
      if (!self->_triggeredBlock)
      {
        lastSeenLastChangingElementTransition = self->_lastSeenLastChangingElementTransition;
        objc_msgSend(v8, "lastChangingElementLayoutTransition");
        v15 = (SBSAElementLayoutTransition *)objc_claimAutoreleasedReturnValue();
        v16 = v15;
        if (lastSeenLastChangingElementTransition)
        {
          v17 = BSEqualObjects();

          if ((v17 & 1) == 0)
            self->_shouldBeRemovedUponLayoutChange = 1;
        }
        else
        {
          v18 = self->_lastSeenLastChangingElementTransition;
          self->_lastSeenLastChangingElementTransition = v15;

        }
      }
      -[SBSAAcceptanceBounceBehaviorProvider _updatedRevealAcceptedElementPreferencesFromPreferences:context:relevantPropertyIdentity:](self, "_updatedRevealAcceptedElementPreferencesFromPreferences:context:relevantPropertyIdentity:", v8, v9, a5);
      v11 = objc_claimAutoreleasedReturnValue();
      break;
    case 2:
      -[SBSAAcceptanceBounceBehaviorProvider _updatedReboundingPreferencesFromPreferences:context:relevantPropertyIdentity:](self, "_updatedReboundingPreferencesFromPreferences:context:relevantPropertyIdentity:", v8, v9, a5);
      v11 = objc_claimAutoreleasedReturnValue();
      break;
    case 1:
      -[SBSAAcceptanceBounceBehaviorProvider _updatedStretchingPreferencesFromPreferences:context:relevantPropertyIdentity:](self, "_updatedStretchingPreferencesFromPreferences:context:relevantPropertyIdentity:", v8, v9, a5);
      v11 = objc_claimAutoreleasedReturnValue();
      break;
    default:
      v19.receiver = self;
      v19.super_class = (Class)SBSAAcceptanceBounceBehaviorProvider;
      -[SBSASequencedBehaviorProvider updatedPreferencesFromPreferences:context:relevantPropertyIdentity:](&v19, sel_updatedPreferencesFromPreferences_context_relevantPropertyIdentity_, v8, v9, a5);
      v11 = objc_claimAutoreleasedReturnValue();
      break;
  }
  v12 = (void *)v11;

  return v12;
}

- (BOOL)phaseIsTimeDelayBased:(int64_t)a3
{
  BOOL result;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBSAAcceptanceBounceBehaviorProvider;
  result = -[SBSASequencedBehaviorProvider phaseIsTimeDelayBased:](&v6, sel_phaseIsTimeDelayBased_);
  if (a3 == 4 || (a3 & 0xFFFFFFFFFFFFFFFELL) == 2)
    return 1;
  return result;
}

- (double)delayForPhase:(int64_t)a3
{
  double v5;
  double v6;
  void *v7;
  void *v8;
  double v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SBSAAcceptanceBounceBehaviorProvider;
  -[SBSASequencedBehaviorProvider delayForPhase:](&v11, sel_delayForPhase_);
  v6 = v5;
  objc_msgSend((id)objc_opt_class(), "settings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  switch(a3)
  {
    case 4:
      if (self->_style)
        objc_msgSend(v7, "acceptanceSideBounceFinishingDelay");
      else
        objc_msgSend(v7, "acceptanceUpBounceFinishingDelay");
      goto LABEL_13;
    case 3:
      if (self->_style)
        objc_msgSend(v7, "acceptanceSideBounceItemAppearanceDelayOffset");
      else
        objc_msgSend(v7, "acceptanceUpBounceItemAppearanceDelayOffset");
      goto LABEL_13;
    case 2:
      if (self->_style)
        objc_msgSend(v7, "acceptanceSideBounceReboundDelay");
      else
        objc_msgSend(v7, "acceptanceUpBounceReboundDelay");
LABEL_13:
      v6 = v9;
      break;
  }

  return v6;
}

- (id)_updatedStretchingPreferencesFromPreferences:(id)a3 context:(id)a4 relevantPropertyIdentity:(id *)a5
{
  _QWORD v6[6];

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __118__SBSAAcceptanceBounceBehaviorProvider__updatedStretchingPreferencesFromPreferences_context_relevantPropertyIdentity___block_invoke;
  v6[3] = &unk_1E8E9E9D0;
  v6[4] = self;
  v6[5] = a2;
  return (id)objc_msgSend(a3, "copyWithBlock:", v6, a4, a5);
}

void __118__SBSAAcceptanceBounceBehaviorProvider__updatedStretchingPreferencesFromPreferences_context_relevantPropertyIdentity___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  Class v10;
  objc_class *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  SBSAInterfaceElementPropertyIdentity *v25;
  void *v26;
  SBSAInterfaceElementPropertyIdentity *v27;
  void *v28;
  SBSAInterfaceElementPropertyIdentity *v29;
  void *v30;
  SBSAInterfaceElementPropertyIdentity *v31;
  void *v32;
  void *v33;
  void *v34;
  id obj;
  uint64_t v36;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _QWORD v42[5];
  id v43;
  uint64_t v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if (!v2)
    goto LABEL_9;
  objc_opt_self();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v2;
  if (v3)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
  }
  else
  {
    v5 = 0;
  }
  v6 = v5;

  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(a1 + 32);
    v8 = *(_QWORD *)(a1 + 40);
    v10 = NSClassFromString(CFSTR("SBSAPreferencesMutator"));
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", v8, v9, CFSTR("SBSAAcceptanceBounceBehaviorProvider.m"), 165, CFSTR("Unexpected class – expected '%@', got '%@'"), v10, v12);

LABEL_9:
    v6 = 0;
  }

  objc_msgSend((id)objc_opt_class(), "settings");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v13;
  v34 = v2;
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 80))
    objc_msgSend(v13, "acceptanceBounceSideStretch");
  else
    objc_msgSend(v13, "acceptanceBounceStretch");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "containerViewDescriptions");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v15, "mutableCopy");

  objc_msgSend(v16, "firstObject");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v42[0] = MEMORY[0x1E0C809B0];
  v42[2] = __118__SBSAAcceptanceBounceBehaviorProvider__updatedStretchingPreferencesFromPreferences_context_relevantPropertyIdentity___block_invoke_2;
  v42[3] = &unk_1E8EA4230;
  v19 = *(_QWORD *)(a1 + 32);
  v18 = *(_QWORD *)(a1 + 40);
  v43 = v17;
  v44 = v18;
  v42[1] = 3221225472;
  v42[4] = v19;
  v32 = (void *)objc_msgSend(v17, "copyWithBlock:", v42);
  objc_msgSend(v16, "replaceObjectAtIndex:withObject:", 0);
  objc_msgSend(v6, "setContainerViewDescriptions:", v16);
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  obj = v16;
  v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v45, 16);
  if (v20)
  {
    v21 = v20;
    v36 = *(_QWORD *)v39;
    do
    {
      v22 = 0;
      do
      {
        if (*(_QWORD *)v39 != v36)
          objc_enumerationMutation(obj);
        v23 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * v22);
        v24 = (void *)objc_msgSend((id)objc_opt_class(), "newAnimatedTransitionDescriptionWithBehaviorSettings:", v14);
        v25 = [SBSAInterfaceElementPropertyIdentity alloc];
        objc_msgSend(v23, "interfaceElementIdentifier");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = -[SBSAInterfaceElementPropertyIdentity initWithAssociatedInterfaceElementIdentifier:andProperty:](v25, "initWithAssociatedInterfaceElementIdentifier:andProperty:", v26, CFSTR("bounds"));
        objc_msgSend(v6, "setAnimatedTransitionDescription:forProperty:withMilestones:", v24, v27, 0);

        v28 = (void *)objc_msgSend((id)objc_opt_class(), "newAnimatedTransitionDescriptionWithBehaviorSettings:", v14);
        v29 = [SBSAInterfaceElementPropertyIdentity alloc];
        objc_msgSend(v23, "interfaceElementIdentifier");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = -[SBSAInterfaceElementPropertyIdentity initWithAssociatedInterfaceElementIdentifier:andProperty:](v29, "initWithAssociatedInterfaceElementIdentifier:andProperty:", v30, CFSTR("center"));
        objc_msgSend(v6, "setAnimatedTransitionDescription:forProperty:withMilestones:", v28, v31, 0);

        ++v22;
      }
      while (v21 != v22);
      v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v45, 16);
    }
    while (v21);
  }

}

void __118__SBSAAcceptanceBounceBehaviorProvider__updatedStretchingPreferencesFromPreferences_context_relevantPropertyIdentity___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  Class v10;
  objc_class *v11;
  void *v12;
  id v13;

  v13 = a2;
  if (!v13)
    goto LABEL_9;
  objc_opt_self();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v13;
  if (v3)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
  }
  else
  {
    v5 = 0;
  }
  v6 = v5;

  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 48);
    v9 = *(_QWORD *)(a1 + 32);
    v10 = NSClassFromString(CFSTR("SBSAViewDescriptionMutator"));
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", v8, v9, CFSTR("SBSAAcceptanceBounceBehaviorProvider.m"), 171, CFSTR("Unexpected class – expected '%@', got '%@'"), v10, v12);

LABEL_9:
    v6 = 0;
  }

  objc_msgSend(*(id *)(a1 + 40), "bounds");
  objc_msgSend(*(id *)(a1 + 40), "center");
  SBUnintegralizedRectCenteredAboutPoint();
  objc_msgSend(*(id *)(a1 + 32), "_expandedBouncingContainerViewFrameForBounceStyle:unexpandedFrame:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80));
  SBRectWithSize();
  objc_msgSend(v6, "setBounds:");
  UIRectGetCenter();
  objc_msgSend(v6, "setCenter:");

}

- (id)_updatedReboundingPreferencesFromPreferences:(id)a3 context:(id)a4 relevantPropertyIdentity:(id *)a5
{
  _QWORD v6[6];

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __118__SBSAAcceptanceBounceBehaviorProvider__updatedReboundingPreferencesFromPreferences_context_relevantPropertyIdentity___block_invoke;
  v6[3] = &unk_1E8E9E9D0;
  v6[4] = self;
  v6[5] = a2;
  return (id)objc_msgSend(a3, "copyWithBlock:", v6, a4, a5);
}

void __118__SBSAAcceptanceBounceBehaviorProvider__updatedReboundingPreferencesFromPreferences_context_relevantPropertyIdentity___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  Class v13;
  objc_class *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  SBSAInterfaceElementPropertyIdentity *v23;
  void *v24;
  SBSAInterfaceElementPropertyIdentity *v25;
  void *v26;
  SBSAInterfaceElementPropertyIdentity *v27;
  void *v28;
  SBSAInterfaceElementPropertyIdentity *v29;
  void *v30;
  void *v31;
  id obj;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend((id)objc_opt_class(), "settings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = a1;
  v31 = v4;
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 80))
    objc_msgSend(v4, "acceptanceBounceSideRebound");
  else
    objc_msgSend(v4, "acceptanceBounceRebound");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v3;
  if (!v5)
    goto LABEL_12;
  objc_opt_self();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5;
  if (v6)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v8 = v7;
    else
      v8 = 0;
  }
  else
  {
    v8 = 0;
  }
  v9 = v8;

  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD *)(v34 + 32);
    v11 = *(_QWORD *)(v34 + 40);
    v13 = NSClassFromString(CFSTR("SBSAPreferencesMutator"));
    v14 = (objc_class *)objc_opt_class();
    NSStringFromClass(v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", v11, v12, CFSTR("SBSAAcceptanceBounceBehaviorProvider.m"), 191, CFSTR("Unexpected class – expected '%@', got '%@'"), v13, v15);

LABEL_12:
    v9 = 0;
  }
  v30 = v5;

  objc_msgSend(v9, "containerViewDescriptions");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v16, "mutableCopy");

  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  obj = v17;
  v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
  if (v18)
  {
    v19 = v18;
    v33 = *(_QWORD *)v37;
    do
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v37 != v33)
          objc_enumerationMutation(obj);
        v21 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
        v22 = (void *)objc_msgSend((id)objc_opt_class(), "newAnimatedTransitionDescriptionWithBehaviorSettings:", v35);
        v23 = [SBSAInterfaceElementPropertyIdentity alloc];
        objc_msgSend(v21, "interfaceElementIdentifier");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = -[SBSAInterfaceElementPropertyIdentity initWithAssociatedInterfaceElementIdentifier:andProperty:](v23, "initWithAssociatedInterfaceElementIdentifier:andProperty:", v24, CFSTR("bounds"));
        objc_msgSend(v9, "setAnimatedTransitionDescription:forProperty:withMilestones:", v22, v25, 0);

        v26 = (void *)objc_msgSend((id)objc_opt_class(), "newAnimatedTransitionDescriptionWithBehaviorSettings:", v35);
        v27 = [SBSAInterfaceElementPropertyIdentity alloc];
        objc_msgSend(v21, "interfaceElementIdentifier");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = -[SBSAInterfaceElementPropertyIdentity initWithAssociatedInterfaceElementIdentifier:andProperty:](v27, "initWithAssociatedInterfaceElementIdentifier:andProperty:", v28, CFSTR("center"));
        objc_msgSend(v9, "setAnimatedTransitionDescription:forProperty:withMilestones:", v26, v29, 0);

      }
      v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
    }
    while (v19);
  }

}

- (id)_updatedRevealAcceptedElementPreferencesFromPreferences:(id)a3 context:(id)a4 relevantPropertyIdentity:(id *)a5
{
  id v9;
  id v10;
  void *v11;
  SBSACalloutBlockAction *v12;
  id triggeredBlock;
  void *v14;
  SBSACalloutBlockAction *v15;
  id v16;
  void *v17;
  uint64_t v18;
  _QWORD v20[7];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  SBSACalloutBlockAction *v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__119;
  v25 = __Block_byref_object_dispose__119;
  v26 = 0;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __129__SBSAAcceptanceBounceBehaviorProvider__updatedRevealAcceptedElementPreferencesFromPreferences_context_relevantPropertyIdentity___block_invoke;
  v20[3] = &unk_1E8EA95B0;
  v20[5] = &v21;
  v20[6] = a2;
  v20[4] = self;
  v11 = (void *)objc_msgSend(v9, "copyWithBlock:", v20);
  if (self->_triggeredBlock)
  {
    v12 = [SBSACalloutBlockAction alloc];
    triggeredBlock = self->_triggeredBlock;
    v28[0] = CFSTR("acceptanceBounceProvider.completion");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[SBSACalloutBlockAction initWithCalloutBlock:reasons:](v12, "initWithCalloutBlock:reasons:", triggeredBlock, v14);

    v16 = self->_triggeredBlock;
    self->_triggeredBlock = 0;

    v27 = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v27, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v11, "copyByAddingActions:", v17);

    v11 = (void *)v18;
  }
  if (a5)
    *a5 = objc_retainAutorelease((id)v22[5]);
  _Block_object_dispose(&v21, 8);

  return v11;
}

void __129__SBSAAcceptanceBounceBehaviorProvider__updatedRevealAcceptedElementPreferencesFromPreferences_context_relevantPropertyIdentity___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  _QWORD *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  Class v15;
  objc_class *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  SBSAInterfaceElementPropertyIdentity *v29;
  void *v30;
  SBSAInterfaceElementPropertyIdentity *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  SBSAInterfaceElementPropertyIdentity *v35;
  void *v36;
  SBSAInterfaceElementPropertyIdentity *v37;
  void *v38;
  void *v39;
  SBSAInterfaceElementPropertyIdentity *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  id obj;
  void *v48;
  void *v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend((id)objc_opt_class(), "settings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  v6 = a1;
  if (*(_QWORD *)(a1[4] + 80))
    objc_msgSend(v4, "acceptanceBounceSideLayout");
  else
    objc_msgSend(v4, "acceptanceBounceLayout");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  if (*(_QWORD *)(a1[4] + 80))
    objc_msgSend(v5, "acceptanceBounceSideLayoutY");
  else
    objc_msgSend(v5, "acceptanceBounceLayoutY");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v3;
  if (!v7)
    goto LABEL_15;
  objc_opt_self();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v7;
  if (v8)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v10 = v9;
    else
      v10 = 0;
  }
  else
  {
    v10 = 0;
  }
  v11 = v10;

  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v6[6];
    v14 = v6[4];
    v15 = NSClassFromString(CFSTR("SBSAPreferencesMutator"));
    v16 = (objc_class *)objc_opt_class();
    NSStringFromClass(v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", v13, v14, CFSTR("SBSAAcceptanceBounceBehaviorProvider.m"), 209, CFSTR("Unexpected class – expected '%@', got '%@'"), v15, v17);

LABEL_15:
    v11 = 0;
  }
  v45 = v7;
  v46 = v5;

  objc_msgSend(v11, "containerViewDescriptions");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v18, "mutableCopy");

  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  obj = v19;
  v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v54, 16);
  if (v20)
  {
    v21 = v20;
    v22 = 1;
    v23 = *(_QWORD *)v51;
    do
    {
      for (i = 0; i != v21; ++i)
      {
        if (*(_QWORD *)v51 != v23)
          objc_enumerationMutation(obj);
        v25 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * i);
        v26 = (void *)objc_msgSend((id)objc_opt_class(), "newAnimatedTransitionDescriptionWithBehaviorSettings:", v49);
        v27 = v26;
        if ((v22 & 1) != 0)
        {
          v28 = objc_msgSend(v26, "copyBySettingAuxillaryBehaviorSettings:forKeyPath:", v48, CFSTR("size.height"));

          v27 = (void *)v28;
        }
        v29 = [SBSAInterfaceElementPropertyIdentity alloc];
        objc_msgSend(v25, "interfaceElementIdentifier");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = -[SBSAInterfaceElementPropertyIdentity initWithAssociatedInterfaceElementIdentifier:andProperty:](v29, "initWithAssociatedInterfaceElementIdentifier:andProperty:", v30, CFSTR("bounds"));
        objc_msgSend(v11, "setAnimatedTransitionDescription:forProperty:withMilestones:", v27, v31, 0);

        v32 = (void *)objc_msgSend((id)objc_opt_class(), "newAnimatedTransitionDescriptionWithBehaviorSettings:", v49);
        v33 = v32;
        if ((v22 & 1) != 0)
        {
          v34 = objc_msgSend(v32, "copyBySettingAuxillaryBehaviorSettings:forKeyPath:", v48, CFSTR("y"));

          v33 = (void *)v34;
        }
        v35 = [SBSAInterfaceElementPropertyIdentity alloc];
        objc_msgSend(v25, "interfaceElementIdentifier");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = -[SBSAInterfaceElementPropertyIdentity initWithAssociatedInterfaceElementIdentifier:andProperty:](v35, "initWithAssociatedInterfaceElementIdentifier:andProperty:", v36, CFSTR("center"));
        objc_msgSend(v11, "setAnimatedTransitionDescription:forProperty:withMilestones:", v33, v37, 0);

        v22 = 0;
      }
      v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v54, 16);
      v22 = 0;
    }
    while (v21);
  }

  objc_msgSend(v11, "containerViewDescriptions");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "firstObject");
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  v40 = [SBSAInterfaceElementPropertyIdentity alloc];
  objc_msgSend(v39, "interfaceElementIdentifier");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = -[SBSAInterfaceElementPropertyIdentity initWithAssociatedInterfaceElementIdentifier:andProperty:](v40, "initWithAssociatedInterfaceElementIdentifier:andProperty:", v41, CFSTR("bounds"));
  v43 = *(_QWORD *)(v6[5] + 8);
  v44 = *(void **)(v43 + 40);
  *(_QWORD *)(v43 + 40) = v42;

}

- (CGRect)_expandedBouncingContainerViewFrameForBounceStyle:(int64_t)a3 unexpandedFrame:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
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
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  CGRect result;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  objc_msgSend((id)objc_opt_class(), "settings");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (a3 == 2)
  {
    objc_msgSend(v9, "acceptanceSideBounceYPadding");
    v12 = -v19;
    objc_msgSend(v10, "acceptanceSideBounceYPadding");
    v16 = -v20;
    objc_msgSend(v10, "acceptanceSideBounceXStretch");
    v18 = -v21;
    v14 = 0.0;
  }
  else if (a3 == 1)
  {
    objc_msgSend(v9, "acceptanceSideBounceYPadding");
    v12 = -v22;
    objc_msgSend(v10, "acceptanceSideBounceXStretch");
    v14 = -v23;
    objc_msgSend(v10, "acceptanceSideBounceYPadding");
    v16 = -v24;
    v18 = 0.0;
  }
  else if (a3)
  {
    v12 = *MEMORY[0x1E0CEB4B0];
    v14 = *(double *)(MEMORY[0x1E0CEB4B0] + 8);
    v16 = *(double *)(MEMORY[0x1E0CEB4B0] + 16);
    v18 = *(double *)(MEMORY[0x1E0CEB4B0] + 24);
  }
  else
  {
    objc_msgSend(v9, "acceptanceUpBounceYStretch");
    v12 = -v11;
    objc_msgSend(v10, "acceptanceUpBounceXPadding");
    v14 = -v13;
    objc_msgSend(v10, "acceptanceUpBounceYDownStretch");
    v16 = -v15;
    objc_msgSend(v10, "acceptanceUpBounceXPadding");
    v18 = -v17;
  }
  v25 = width - (v18 + v14);

  v26 = x + v14;
  v27 = y + v12;
  v28 = v25;
  v29 = height - (v16 + v12);
  result.size.height = v29;
  result.size.width = v28;
  result.origin.y = v27;
  result.origin.x = v26;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastSeenLastChangingElementTransition, 0);
  objc_storeStrong(&self->_triggeredBlock, 0);
}

@end
