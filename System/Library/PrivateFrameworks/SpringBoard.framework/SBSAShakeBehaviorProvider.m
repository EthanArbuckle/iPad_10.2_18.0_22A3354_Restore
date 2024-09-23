@implementation SBSAShakeBehaviorProvider

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
  v7.super_class = (Class)SBSAShakeBehaviorProvider;
  -[SBSASequencedBehaviorProvider nameForPhase:](&v7, sel_nameForPhase_);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)a3 <= 4)
  {
    v5 = off_1E8EB2C40[a3];

    v4 = v5;
  }
  return v4;
}

- (BOOL)canProceedWithContext:(id)a3 shouldRetry:(BOOL *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  BOOL v15;
  BOOL v16;
  _QWORD v18[4];
  id v19;

  v6 = a3;
  -[SBSASequencedBehaviorProvider participatingElementIdentification](self, "participatingElementIdentification");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(v6, "elementContexts");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = SAElementIdentityEqualToIdentity();

    if (v10)
    {
      objc_msgSend(v6, "preferences");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "elementLayoutTransition");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "initialElementContexts");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __63__SBSAShakeBehaviorProvider_canProceedWithContext_shouldRetry___block_invoke;
      v18[3] = &unk_1E8EA3748;
      v19 = v7;
      objc_msgSend(v13, "bs_firstObjectPassingTest:", v18);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14 != 0;

      v16 = 1;
      if (!a4)
        goto LABEL_7;
      goto LABEL_6;
    }
  }
  v16 = 0;
  v15 = 0;
  if (a4)
LABEL_6:
    *a4 = v16;
LABEL_7:

  return v15;
}

uint64_t __63__SBSAShakeBehaviorProvider_canProceedWithContext_shouldRetry___block_invoke()
{
  return SAElementIdentityEqualToIdentity();
}

- (id)updatedContextFromContext:(id)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;
  _QWORD v15[10];
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)SBSAShakeBehaviorProvider;
  -[SBSASequencedBehaviorProvider updatedContextFromContext:](&v16, sel_updatedContextFromContext_, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[SBSASequencedBehaviorProvider activePhase](self, "activePhase") == 1
    || -[SBSASequencedBehaviorProvider activePhase](self, "activePhase") == 2)
  {
    objc_msgSend(v5, "inertContainerFrame");
    objc_msgSend((id)objc_opt_class(), "settings");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "shakeSensorExpansion");
    objc_msgSend(v5, "displayScale");
    v14 = v7;
    UIRectCenteredXInRectScale();
    objc_msgSend(v6, "shakeSensorOffset", v14);
    objc_msgSend(v5, "layoutDirection");
    UIRectIntegralWithScale();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __55__SBSAShakeBehaviorProvider_updatedContextFromContext___block_invoke;
    v15[3] = &unk_1E8EB2BD0;
    v15[4] = self;
    v15[5] = a2;
    v15[6] = v8;
    v15[7] = v9;
    v15[8] = v10;
    v15[9] = v11;
    v12 = objc_msgSend(v5, "copyWithBlock:", v15);

    v5 = (void *)v12;
  }
  return v5;
}

void __55__SBSAShakeBehaviorProvider_updatedContextFromContext___block_invoke(uint64_t a1, void *a2)
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
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", v8, v9, CFSTR("SBSAShakeBehaviorProvider.m"), 90, CFSTR("Unexpected class – expected '%@', got '%@'"), v10, v12);

LABEL_9:
    v6 = 0;
  }

  objc_msgSend(v6, "setInertContainerFrame:", *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
}

- (id)updatedPreferencesFromPreferences:(id)a3 context:(id)a4 relevantPropertyIdentity:(id *)a5
{
  id v8;
  id v9;
  uint64_t v10;
  void *v11;

  v8 = a3;
  v9 = a4;
  switch(-[SBSASequencedBehaviorProvider activePhase](self, "activePhase"))
  {
    case 1:
      -[SBSAShakeBehaviorProvider _updatedKickingPreferencesFromPreferences:context:relevantPropertyIdentity:](self, "_updatedKickingPreferencesFromPreferences:context:relevantPropertyIdentity:", v8, v9, a5);
      v10 = objc_claimAutoreleasedReturnValue();
      break;
    case 2:
      -[SBSAShakeBehaviorProvider _updatedPreparingToSettlePreferencesFromPreferences:context:relevantPropertyIdentity:](self, "_updatedPreparingToSettlePreferencesFromPreferences:context:relevantPropertyIdentity:", v8, v9, a5);
      v10 = objc_claimAutoreleasedReturnValue();
      break;
    case 3:
    case 4:
      -[SBSAShakeBehaviorProvider _updatedSettlingPreferencesFromPreferences:context:relevantPropertyIdentity:](self, "_updatedSettlingPreferencesFromPreferences:context:relevantPropertyIdentity:", v8, v9, a5);
      v10 = objc_claimAutoreleasedReturnValue();
      break;
    default:
      -[SBSAShakeBehaviorProvider _updatedIdlePreferencesFromPreferences:context:](self, "_updatedIdlePreferencesFromPreferences:context:", v8, v9);
      v10 = objc_claimAutoreleasedReturnValue();
      break;
  }
  v11 = (void *)v10;

  return v11;
}

- (double)milestoneForPhase:(int64_t)a3
{
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SBSAShakeBehaviorProvider;
  -[SBSASequencedBehaviorProvider milestoneForPhase:](&v10, sel_milestoneForPhase_);
  if (a3 == 4)
  {
    objc_msgSend(&unk_1E91CF8F8, "bs_CGFloatValue");
    return v8;
  }
  else
  {
    if (a3 == 3)
    {
      objc_msgSend((id)objc_opt_class(), "settings");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "secondShakeMilestone");
      goto LABEL_7;
    }
    v5 = v4;
    if (a3 == 2)
    {
      objc_msgSend((id)objc_opt_class(), "settings");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "firstShakeMilestone");
LABEL_7:
      v5 = v7;

    }
  }
  return v5;
}

- (id)_updatedKickingPreferencesFromPreferences:(id)a3 context:(id)a4 relevantPropertyIdentity:(id *)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  _QWORD v14[5];
  id v15;
  uint64_t *v16;
  SEL v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v9 = a3;
  v10 = a4;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__74;
  v22 = __Block_byref_object_dispose__74;
  v23 = 0;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __104__SBSAShakeBehaviorProvider__updatedKickingPreferencesFromPreferences_context_relevantPropertyIdentity___block_invoke;
  v14[3] = &unk_1E8EB2C20;
  v17 = a2;
  v14[4] = self;
  v11 = v10;
  v15 = v11;
  v16 = &v18;
  v12 = (void *)objc_msgSend(v9, "copyWithBlock:", v14);
  if (a5)
    *a5 = objc_retainAutorelease((id)v19[5]);

  _Block_object_dispose(&v18, 8);
  return v12;
}

void __104__SBSAShakeBehaviorProvider__updatedKickingPreferencesFromPreferences_context_relevantPropertyIdentity___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  Class v11;
  objc_class *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  SBSAInterfaceElementPropertyIdentity *v19;
  void *v20;
  SBSAInterfaceElementPropertyIdentity *v21;
  void *v22;
  SBSAInterfaceElementPropertyIdentity *v23;
  void *v24;
  SBSAInterfaceElementPropertyIdentity *v25;
  void *v26;
  void *v27;
  id v28;
  double v29;
  double v30;
  uint64_t v31;
  uint64_t v32;
  double v33;
  double v34;
  uint64_t v35;
  double v36;
  uint64_t v37;
  void *v38;
  SBSAInterfaceElementPropertyIdentity *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  id obj;
  uint64_t v50;
  void *v51;
  _QWORD v52[8];
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (!v3)
    goto LABEL_9;
  objc_opt_self();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v3;
  if (v4)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;
  }
  else
  {
    v6 = 0;
  }
  v7 = v6;

  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(a1 + 56);
    v10 = *(_QWORD *)(a1 + 32);
    v11 = NSClassFromString(CFSTR("SBSAPreferencesMutator"));
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", v9, v10, CFSTR("SBSAShakeBehaviorProvider.m"), 135, CFSTR("Unexpected class – expected '%@', got '%@'"), v11, v13);

LABEL_9:
    v7 = 0;
  }
  v48 = v3;

  objc_msgSend((id)objc_opt_class(), "settings");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "jindoAuthErrorStretchOut");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  objc_msgSend(v7, "containerViewDescriptions");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v57, 16);
  if (v14)
  {
    v15 = v14;
    v50 = *(_QWORD *)v54;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v54 != v50)
          objc_enumerationMutation(obj);
        v17 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * i);
        v18 = (void *)objc_msgSend((id)objc_opt_class(), "newAnimatedTransitionDescriptionWithBehaviorSettings:", v51);
        v19 = [SBSAInterfaceElementPropertyIdentity alloc];
        objc_msgSend(v17, "interfaceElementIdentifier");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = -[SBSAInterfaceElementPropertyIdentity initWithAssociatedInterfaceElementIdentifier:andProperty:](v19, "initWithAssociatedInterfaceElementIdentifier:andProperty:", v20, CFSTR("bounds"));
        objc_msgSend(v7, "setAnimatedTransitionDescription:forProperty:withMilestones:", v18, v21, 0);

        v22 = (void *)objc_msgSend((id)objc_opt_class(), "newAnimatedTransitionDescriptionWithBehaviorSettings:", v51);
        v23 = [SBSAInterfaceElementPropertyIdentity alloc];
        objc_msgSend(v17, "interfaceElementIdentifier");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = -[SBSAInterfaceElementPropertyIdentity initWithAssociatedInterfaceElementIdentifier:andProperty:](v23, "initWithAssociatedInterfaceElementIdentifier:andProperty:", v24, CFSTR("center"));
        objc_msgSend(v7, "setAnimatedTransitionDescription:forProperty:withMilestones:", v22, v25, 0);

      }
      v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v57, 16);
    }
    while (v15);
  }

  objc_msgSend(v7, "containerParentViewDescription");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v26;
  if (v26)
  {
    v28 = v26;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "containerParentViewDescription");
    v28 = (id)objc_claimAutoreleasedReturnValue();
  }

  objc_msgSend(v28, "center");
  v30 = v29;
  v32 = v31;
  objc_msgSend(v47, "shakeDisplacement");
  v34 = v33;
  v35 = objc_msgSend(*(id *)(a1 + 40), "layoutDirection");
  v36 = -v34;
  if (v35 != 1)
    v36 = v34;
  v52[0] = MEMORY[0x1E0C809B0];
  v52[1] = 3221225472;
  v52[2] = __104__SBSAShakeBehaviorProvider__updatedKickingPreferencesFromPreferences_context_relevantPropertyIdentity___block_invoke_2;
  v52[3] = &unk_1E8EB2BF8;
  v37 = *(_QWORD *)(a1 + 56);
  v52[4] = *(_QWORD *)(a1 + 32);
  v52[5] = v37;
  *(double *)&v52[6] = v30 - v36;
  v52[7] = v32;
  v38 = (void *)objc_msgSend(v28, "copyWithBlock:", v52);

  objc_msgSend(v7, "setContainerParentViewDescription:", v38);
  v39 = [SBSAInterfaceElementPropertyIdentity alloc];
  objc_msgSend(v38, "interfaceElementIdentifier");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = -[SBSAInterfaceElementPropertyIdentity initWithAssociatedInterfaceElementIdentifier:andProperty:](v39, "initWithAssociatedInterfaceElementIdentifier:andProperty:", v40, CFSTR("center"));
  v42 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v43 = *(void **)(v42 + 40);
  *(_QWORD *)(v42 + 40) = v41;

  v44 = (void *)objc_opt_class();
  objc_msgSend(v47, "jindoAuthErrorShakeInitialKick");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = (void *)objc_msgSend(v44, "newAnimatedTransitionDescriptionWithBehaviorSettings:", v45);
  objc_msgSend(v7, "setAnimatedTransitionDescription:forProperty:withMilestones:", v46, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), 0);

}

void __104__SBSAShakeBehaviorProvider__updatedKickingPreferencesFromPreferences_context_relevantPropertyIdentity___block_invoke_2(uint64_t a1, void *a2)
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
    v10 = NSClassFromString(CFSTR("SBSAViewDescriptionMutator"));
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", v8, v9, CFSTR("SBSAShakeBehaviorProvider.m"), 147, CFSTR("Unexpected class – expected '%@', got '%@'"), v10, v12);

LABEL_9:
    v6 = 0;
  }

  objc_msgSend(v6, "setCenter:", *(double *)(a1 + 48), *(double *)(a1 + 56));
}

- (CGPoint)_defaultContainerParentViewCenterFromContext:(id)a3
{
  double v3;
  double v4;
  CGPoint result;

  objc_msgSend(a3, "systemContainerBounds");
  UIRectGetCenter();
  result.y = v4;
  result.x = v3;
  return result;
}

- (id)_updatedPreparingToSettlePreferencesFromPreferences:(id)a3 context:(id)a4 relevantPropertyIdentity:(id *)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  _QWORD v14[5];
  id v15;
  uint64_t *v16;
  SEL v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v9 = a3;
  v10 = a4;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__74;
  v22 = __Block_byref_object_dispose__74;
  v23 = 0;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __114__SBSAShakeBehaviorProvider__updatedPreparingToSettlePreferencesFromPreferences_context_relevantPropertyIdentity___block_invoke;
  v14[3] = &unk_1E8EB2C20;
  v17 = a2;
  v14[4] = self;
  v11 = v10;
  v15 = v11;
  v16 = &v18;
  v12 = (void *)objc_msgSend(v9, "copyWithBlock:", v14);
  if (a5)
    *a5 = objc_retainAutorelease((id)v19[5]);

  _Block_object_dispose(&v18, 8);
  return v12;
}

void __114__SBSAShakeBehaviorProvider__updatedPreparingToSettlePreferencesFromPreferences_context_relevantPropertyIdentity___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  Class v11;
  objc_class *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  SBSAInterfaceElementPropertyIdentity *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  _QWORD v31[5];
  id v32;
  uint64_t v33;

  v3 = a2;
  v30 = v3;
  if (!v3)
    goto LABEL_9;
  objc_opt_self();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v30;
  if (v4)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;
  }
  else
  {
    v6 = 0;
  }
  v7 = v6;

  v3 = v30;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(a1 + 56);
    v10 = *(_QWORD *)(a1 + 32);
    v11 = NSClassFromString(CFSTR("SBSAPreferencesMutator"));
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", v9, v10, CFSTR("SBSAShakeBehaviorProvider.m"), 167, CFSTR("Unexpected class – expected '%@', got '%@'"), v11, v13);

    v3 = v30;
LABEL_9:
    v7 = 0;
  }

  objc_msgSend(v7, "containerParentViewDescription");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
  {
    v16 = v14;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "containerParentViewDescription");
    v16 = (id)objc_claimAutoreleasedReturnValue();
  }
  v17 = v16;

  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __114__SBSAShakeBehaviorProvider__updatedPreparingToSettlePreferencesFromPreferences_context_relevantPropertyIdentity___block_invoke_2;
  v31[3] = &unk_1E8EA4230;
  v18 = *(_QWORD *)(a1 + 32);
  v19 = *(void **)(a1 + 40);
  v33 = *(_QWORD *)(a1 + 56);
  v31[4] = v18;
  v32 = v19;
  v20 = (void *)objc_msgSend(v17, "copyWithBlock:", v31);

  objc_msgSend(v7, "setContainerParentViewDescription:", v20);
  v21 = [SBSAInterfaceElementPropertyIdentity alloc];
  objc_msgSend(v20, "interfaceElementIdentifier");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = -[SBSAInterfaceElementPropertyIdentity initWithAssociatedInterfaceElementIdentifier:andProperty:](v21, "initWithAssociatedInterfaceElementIdentifier:andProperty:", v22, CFSTR("center"));
  v24 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v25 = *(void **)(v24 + 40);
  *(_QWORD *)(v24 + 40) = v23;

  v26 = (void *)objc_opt_class();
  objc_msgSend((id)objc_opt_class(), "settings");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "jindoAuthErrorShakeSettle");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = (void *)objc_msgSend(v26, "newAnimatedTransitionDescriptionWithBehaviorSettings:", v28);
  objc_msgSend(v7, "setAnimatedTransitionDescription:forProperty:withMilestones:", v29, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), 0);

}

void __114__SBSAShakeBehaviorProvider__updatedPreparingToSettlePreferencesFromPreferences_context_relevantPropertyIdentity___block_invoke_2(uint64_t *a1, void *a2)
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
    v8 = a1[6];
    v9 = a1[4];
    v10 = NSClassFromString(CFSTR("SBSAViewDescriptionMutator"));
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", v8, v9, CFSTR("SBSAShakeBehaviorProvider.m"), 170, CFSTR("Unexpected class – expected '%@', got '%@'"), v10, v12);

LABEL_9:
    v6 = 0;
  }

  objc_msgSend((id)a1[4], "_defaultContainerParentViewCenterFromContext:", a1[5]);
  objc_msgSend(v6, "setCenter:");

}

- (id)_updatedSettlingPreferencesFromPreferences:(id)a3 context:(id)a4 relevantPropertyIdentity:(id *)a5
{
  id v9;
  id v10;
  void *v11;
  _QWORD v13[7];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v9 = a3;
  v10 = a4;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__74;
  v18 = __Block_byref_object_dispose__74;
  v19 = 0;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __105__SBSAShakeBehaviorProvider__updatedSettlingPreferencesFromPreferences_context_relevantPropertyIdentity___block_invoke;
  v13[3] = &unk_1E8EA95B0;
  v13[5] = &v14;
  v13[6] = a2;
  v13[4] = self;
  v11 = (void *)objc_msgSend(v9, "copyWithBlock:", v13);
  if (a5)
    *a5 = objc_retainAutorelease((id)v15[5]);
  _Block_object_dispose(&v14, 8);

  return v11;
}

void __105__SBSAShakeBehaviorProvider__updatedSettlingPreferencesFromPreferences_context_relevantPropertyIdentity___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  Class v11;
  objc_class *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  SBSAInterfaceElementPropertyIdentity *v21;
  void *v22;
  SBSAInterfaceElementPropertyIdentity *v23;
  SBSAInterfaceElementPropertyIdentity *v24;
  void *v25;
  SBSAInterfaceElementPropertyIdentity *v26;
  uint64_t v27;
  id *v28;
  uint64_t v29;
  void *v30;
  id obj;
  void *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (!v3)
    goto LABEL_9;
  objc_opt_self();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v3;
  if (v4)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;
  }
  else
  {
    v6 = 0;
  }
  v7 = v6;

  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = a1[6];
    v10 = a1[4];
    v11 = NSClassFromString(CFSTR("SBSAPreferencesMutator"));
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", v9, v10, CFSTR("SBSAShakeBehaviorProvider.m"), 187, CFSTR("Unexpected class – expected '%@', got '%@'"), v11, v13);

LABEL_9:
    v7 = 0;
  }
  v30 = v3;

  objc_msgSend((id)objc_opt_class(), "settings");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "jindoAuthErrorStretchSettle");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  objc_msgSend(v7, "containerViewDescriptions");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v34;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v34 != v17)
          objc_enumerationMutation(obj);
        v19 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * v18);
        v20 = (void *)objc_msgSend((id)objc_opt_class(), "newAnimatedTransitionDescriptionWithBehaviorSettings:", v32);
        v21 = [SBSAInterfaceElementPropertyIdentity alloc];
        objc_msgSend(v19, "interfaceElementIdentifier");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = -[SBSAInterfaceElementPropertyIdentity initWithAssociatedInterfaceElementIdentifier:andProperty:](v21, "initWithAssociatedInterfaceElementIdentifier:andProperty:", v22, CFSTR("bounds"));
        objc_msgSend(v7, "setAnimatedTransitionDescription:forProperty:withMilestones:", v20, v23, 0);

        v24 = [SBSAInterfaceElementPropertyIdentity alloc];
        objc_msgSend(v19, "interfaceElementIdentifier");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = -[SBSAInterfaceElementPropertyIdentity initWithAssociatedInterfaceElementIdentifier:andProperty:](v24, "initWithAssociatedInterfaceElementIdentifier:andProperty:", v25, CFSTR("center"));

        v27 = *(_QWORD *)(a1[5] + 8);
        v29 = *(_QWORD *)(v27 + 40);
        v28 = (id *)(v27 + 40);
        if (!v29)
          objc_storeStrong(v28, v26);
        objc_msgSend(v7, "setAnimatedTransitionDescription:forProperty:withMilestones:", v20, v26, 0);

        ++v18;
      }
      while (v16 != v18);
      v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    }
    while (v16);
  }

}

- (id)_updatedIdlePreferencesFromPreferences:(id)a3 context:(id)a4
{
  id v7;
  id v8;
  void *v9;
  _QWORD v11[5];
  id v12;
  SEL v13;

  v7 = a4;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __76__SBSAShakeBehaviorProvider__updatedIdlePreferencesFromPreferences_context___block_invoke;
  v11[3] = &unk_1E8EA4230;
  v12 = v7;
  v13 = a2;
  v11[4] = self;
  v8 = v7;
  v9 = (void *)objc_msgSend(a3, "copyWithBlock:", v11);

  return v9;
}

void __76__SBSAShakeBehaviorProvider__updatedIdlePreferencesFromPreferences_context___block_invoke(uint64_t a1, void *a2)
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
  void *v13;
  id v14;
  void *v15;
  void *v16;
  SBSAInterfaceElementPropertyIdentity *v17;
  void *v18;
  SBSAInterfaceElementPropertyIdentity *v19;
  __int128 v20;
  id v21;
  _QWORD v22[5];
  __int128 v23;

  v21 = a2;
  if (!v21)
    goto LABEL_9;
  objc_opt_self();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v21;
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
    v10 = NSClassFromString(CFSTR("SBSAPreferencesMutator"));
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", v8, v9, CFSTR("SBSAShakeBehaviorProvider.m"), 207, CFSTR("Unexpected class – expected '%@', got '%@'"), v10, v12);

LABEL_9:
    v6 = 0;
  }

  objc_msgSend(*(id *)(a1 + 40), "containerParentViewDescription");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __76__SBSAShakeBehaviorProvider__updatedIdlePreferencesFromPreferences_context___block_invoke_2;
  v22[3] = &unk_1E8EA4230;
  v22[4] = *(_QWORD *)(a1 + 32);
  v20 = *(_OWORD *)(a1 + 40);
  v14 = (id)v20;
  v23 = v20;
  v15 = (void *)objc_msgSend(v13, "copyWithBlock:", v22);
  objc_msgSend(v6, "setContainerParentViewDescription:", v15);
  v16 = (void *)objc_msgSend(*(id *)(a1 + 32), "newAnimatedTransitionDescriptionForProperty:", CFSTR("center"));
  v17 = [SBSAInterfaceElementPropertyIdentity alloc];
  objc_msgSend(v13, "interfaceElementIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[SBSAInterfaceElementPropertyIdentity initWithAssociatedInterfaceElementIdentifier:andProperty:](v17, "initWithAssociatedInterfaceElementIdentifier:andProperty:", v18, CFSTR("center"));
  objc_msgSend(v6, "setAnimatedTransitionDescription:forProperty:withMilestones:", v16, v19, 0);

}

void __76__SBSAShakeBehaviorProvider__updatedIdlePreferencesFromPreferences_context___block_invoke_2(uint64_t *a1, void *a2)
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
    v8 = a1[6];
    v9 = a1[4];
    v10 = NSClassFromString(CFSTR("SBSAViewDescriptionMutator"));
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", v8, v9, CFSTR("SBSAShakeBehaviorProvider.m"), 210, CFSTR("Unexpected class – expected '%@', got '%@'"), v10, v12);

LABEL_9:
    v6 = 0;
  }

  objc_msgSend((id)a1[4], "_defaultContainerParentViewCenterFromContext:", a1[5]);
  objc_msgSend(v6, "setCenter:");

}

@end
