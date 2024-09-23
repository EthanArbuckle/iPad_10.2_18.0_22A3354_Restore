@implementation SBSAMitosisTransitionProvider

- (int64_t)finalPhase
{
  return 5;
}

- (id)nameForPhase:(int64_t)a3
{
  void *v4;
  __CFString *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBSAMitosisTransitionProvider;
  -[SBSASequencedBehaviorProvider nameForPhase:](&v7, sel_nameForPhase_);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)a3 <= 5)
  {
    v5 = off_1E8EB6678[a3];

    v4 = v5;
  }
  return v4;
}

- (BOOL)canProceedWithContext:(id)a3 shouldRetry:(BOOL *)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  BOOL v10;
  int v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v20[4];
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[SBSASequencedBehaviorProvider participatingElementIdentification](self, "participatingElementIdentification");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    objc_msgSend(v6, "elementContexts");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    v10 = v9 != 0;
    if (!v9)
      goto LABEL_17;
    v11 = 0;
    v12 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v23 != v12)
          objc_enumerationMutation(v8);
        v11 |= SAElementIdentityEqualToIdentity();
      }
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v9);

    if ((v11 & 1) != 0)
    {
      objc_msgSend(v6, "preferences");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "elementLayoutTransition");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "initialElementContexts");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __67__SBSAMitosisTransitionProvider_canProceedWithContext_shouldRetry___block_invoke;
      v20[3] = &unk_1E8EA3748;
      v21 = v7;
      objc_msgSend(v16, "bs_firstObjectPassingTest:", v20);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17)
      {
        objc_msgSend(v6, "preferences");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v9) = objc_msgSend(v18, "isCollisionImminent") ^ 1;

      }
      else
      {
        LOBYTE(v9) = 0;
      }
      v8 = v21;
LABEL_17:

      if (!a4)
        goto LABEL_14;
      goto LABEL_13;
    }
  }
  v10 = 0;
  LOBYTE(v9) = 0;
  if (a4)
LABEL_13:
    *a4 = v10;
LABEL_14:

  return v9;
}

uint64_t __67__SBSAMitosisTransitionProvider_canProceedWithContext_shouldRetry___block_invoke()
{
  return SAElementIdentityEqualToIdentity();
}

- (BOOL)canPersistAcrossLayoutStateChangesToNewElementContexts:(id)a3
{
  return 1;
}

- (id)updatedPreferencesFromPreferences:(id)a3 context:(id)a4 relevantPropertyIdentity:(id *)a5
{
  id v9;
  id v10;
  int64_t v11;
  char *v12;
  void *v13;
  char *v14;
  char *v15;
  char *v16;
  void *v17;
  void *v18;
  _QWORD v20[6];
  objc_super v21;

  v9 = a3;
  v10 = a4;
  v11 = -[SBSASequencedBehaviorProvider activePhase](self, "activePhase");
  switch(v11)
  {
    case 3:
      SBLogSystemAperturePreferencesStackMitosis();
      v14 = (char *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_DEBUG))
        -[SBSAMitosisTransitionProvider updatedPreferencesFromPreferences:context:relevantPropertyIdentity:].cold.4(v10, v14);

      -[SBSAMitosisTransitionProvider _updatedPrimaryLayoutPreferencesFromPreferences:context:relevantPropertyIdentity:](self, "_updatedPrimaryLayoutPreferencesFromPreferences:context:relevantPropertyIdentity:", v9, v10, a5);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 2:
      SBLogSystemAperturePreferencesStackMitosis();
      v15 = (char *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled((os_log_t)v15, OS_LOG_TYPE_DEBUG))
        -[SBSAMitosisTransitionProvider updatedPreferencesFromPreferences:context:relevantPropertyIdentity:].cold.3(v10, v15);

      -[SBSAMitosisTransitionProvider _updatedBabyHeadstartPreferencesFromPreferences:context:relevantPropertyIdentity:](self, "_updatedBabyHeadstartPreferencesFromPreferences:context:relevantPropertyIdentity:", v9, v10, a5);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 1:
      SBLogSystemAperturePreferencesStackMitosis();
      v12 = (char *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_DEBUG))
        -[SBSAMitosisTransitionProvider updatedPreferencesFromPreferences:context:relevantPropertyIdentity:].cold.2(v10, v12);

      -[SBSAMitosisTransitionProvider _updatedInitialUnanimatedPreferencesFromPreferences:context:relevantPropertyIdentity:](self, "_updatedInitialUnanimatedPreferencesFromPreferences:context:relevantPropertyIdentity:", v9, v10, a5);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      SBLogSystemAperturePreferencesStackMitosis();
      v16 = (char *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_DEBUG))
        -[SBSAMitosisTransitionProvider updatedPreferencesFromPreferences:context:relevantPropertyIdentity:].cold.1(v10, v16);

      v21.receiver = self;
      v21.super_class = (Class)SBSAMitosisTransitionProvider;
      -[SBSASequencedBehaviorProvider updatedPreferencesFromPreferences:context:relevantPropertyIdentity:](&v21, sel_updatedPreferencesFromPreferences_context_relevantPropertyIdentity_, v9, v10, a5);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      break;
  }
  v17 = v13;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __100__SBSAMitosisTransitionProvider_updatedPreferencesFromPreferences_context_relevantPropertyIdentity___block_invoke;
  v20[3] = &unk_1E8E9E9D0;
  v20[4] = self;
  v20[5] = a2;
  v18 = (void *)objc_msgSend(v13, "copyWithBlock:", v20);

  return v18;
}

void __100__SBSAMitosisTransitionProvider_updatedPreferencesFromPreferences_context_relevantPropertyIdentity___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  Class v11;
  objc_class *v12;
  void *v13;
  id v14;

  v14 = a2;
  if (!v14)
    goto LABEL_9;
  objc_opt_self();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v14;
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
    v10 = a1 + 32;
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(_QWORD *)(v10 + 8);
    v11 = NSClassFromString(CFSTR("SBSAPreferencesMutator"));
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", v9, v8, CFSTR("SBSAMitosisTransitionProvider.m"), 115, CFSTR("Unexpected class – expected '%@', got '%@'"), v11, v13);

LABEL_9:
    v6 = 0;
  }

  objc_msgSend(v6, "setBlobEnabled:", 1);
}

- (BOOL)phaseIsTimeDelayBased:(int64_t)a3
{
  return (a3 & 0xFFFFFFFFFFFFFFFELL) == 2;
}

- (double)milestoneForPhase:(int64_t)a3
{
  double result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBSAMitosisTransitionProvider;
  -[SBSASequencedBehaviorProvider milestoneForPhase:](&v5, sel_milestoneForPhase_);
  if (a3 == 4)
    objc_msgSend(&unk_1E91CF8F8, "bs_CGFloatValue");
  return result;
}

- (double)delayForPhase:(int64_t)a3
{
  void *v3;
  double v4;
  double v5;

  if (a3 != 3)
    return 0.0;
  objc_msgSend((id)objc_opt_class(), "settings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mitosisHeadstartDelay");
  v5 = v4;

  return v5;
}

- (id)_updatedInitialUnanimatedPreferencesFromPreferences:(id)a3 context:(id)a4 relevantPropertyIdentity:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  _QWORD v12[5];
  id v13;
  SEL v14;

  v8 = a4;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __118__SBSAMitosisTransitionProvider__updatedInitialUnanimatedPreferencesFromPreferences_context_relevantPropertyIdentity___block_invoke;
  v12[3] = &unk_1E8EA4230;
  v13 = v8;
  v14 = a2;
  v12[4] = self;
  v9 = v8;
  v10 = (void *)objc_msgSend(a3, "copyWithBlock:", v12);

  return v10;
}

void __118__SBSAMitosisTransitionProvider__updatedInitialUnanimatedPreferencesFromPreferences_context_relevantPropertyIdentity___block_invoke(uint64_t a1, void *a2)
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
  void *v16;
  unint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  int v22;
  void *v23;
  uint64_t v24;
  void *v25;
  SBSAInterfaceElementPropertyIdentity *v26;
  void *v27;
  void *v28;
  SBSAInterfaceElementPropertyIdentity *v29;
  void *v30;
  SBSAInterfaceElementPropertyIdentity *v31;
  void *v32;
  SBSAInterfaceElementPropertyIdentity *v33;
  void *v34;
  SBSAInterfaceElementPropertyIdentity *v35;
  SBSAInterfaceElementPropertyIdentity *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  SBSAInterfaceElementPropertyIdentity *v40;
  id v41;
  void *v42;
  void *v43;
  SBSAInterfaceElementPropertyIdentity *v44;
  _QWORD v45[5];
  id v46;
  id v47;
  uint64_t v48;
  uint64_t v49;

  v3 = a2;
  v41 = v3;
  if (!v3)
    goto LABEL_9;
  objc_opt_self();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v41;
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

  v3 = v41;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(a1 + 48);
    v10 = *(_QWORD *)(a1 + 32);
    v11 = NSClassFromString(CFSTR("SBSAPreferencesMutator"));
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", v9, v10, CFSTR("SBSAMitosisTransitionProvider.m"), 151, CFSTR("Unexpected class – expected '%@', got '%@'"), v11, v13);

    v3 = v41;
LABEL_9:
    v7 = 0;
  }

  v43 = v7;
  objc_msgSend(v7, "containerViewDescriptions");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v14, "mutableCopy");

  objc_msgSend(*(id *)(a1 + 40), "elementContexts");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v15, "count"))
  {
    v17 = 0;
    v42 = v15;
    do
    {
      objc_msgSend(v15, "objectAtIndex:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      SBSAElementContextAssociatedWithContainerViewDescription(v18, v16, 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v16, "indexOfObject:", v19);
      objc_msgSend(*(id *)(a1 + 32), "participatingElementIdentification");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = SAElementIdentityEqualToIdentity();

      if (v22)
      {
        v45[0] = MEMORY[0x1E0C809B0];
        v45[1] = 3221225472;
        v45[2] = __118__SBSAMitosisTransitionProvider__updatedInitialUnanimatedPreferencesFromPreferences_context_relevantPropertyIdentity___block_invoke_2;
        v45[3] = &unk_1E8EA9600;
        v23 = *(void **)(a1 + 40);
        v24 = *(_QWORD *)(a1 + 32);
        v48 = *(_QWORD *)(a1 + 48);
        v45[4] = v24;
        v46 = v23;
        v49 = v20;
        v47 = v16;
        v25 = (void *)objc_msgSend(v18, "copyWithBlock:", v45);

        objc_msgSend(v15, "replaceObjectAtIndex:withObject:", v17, v25);
        v26 = [SBSAInterfaceElementPropertyIdentity alloc];
        objc_msgSend(v25, "interfaceElementIdentifier");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = -[SBSAInterfaceElementPropertyIdentity initWithAssociatedInterfaceElementIdentifier:andProperty:](v26, "initWithAssociatedInterfaceElementIdentifier:andProperty:", v27, CFSTR("bounds"));

        v28 = (void *)objc_msgSend((id)objc_opt_class(), "newUnanimatedTransitionDescription");
        objc_msgSend(v43, "setAnimatedTransitionDescription:forProperty:withMilestones:", v28, v44, 0);

        v29 = [SBSAInterfaceElementPropertyIdentity alloc];
        objc_msgSend(v25, "interfaceElementIdentifier");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = -[SBSAInterfaceElementPropertyIdentity initWithAssociatedInterfaceElementIdentifier:andProperty:](v29, "initWithAssociatedInterfaceElementIdentifier:andProperty:", v30, CFSTR("center"));

        v32 = (void *)objc_msgSend((id)objc_opt_class(), "newUnanimatedTransitionDescription");
        objc_msgSend(v43, "setAnimatedTransitionDescription:forProperty:withMilestones:", v32, v31, 0);

        v33 = [SBSAInterfaceElementPropertyIdentity alloc];
        objc_msgSend(v25, "interfaceElementIdentifier");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = -[SBSAInterfaceElementPropertyIdentity initWithAssociatedInterfaceElementIdentifier:andProperty:](v33, "initWithAssociatedInterfaceElementIdentifier:andProperty:", v34, CFSTR("contentBounds"));

        v36 = [SBSAInterfaceElementPropertyIdentity alloc];
        objc_msgSend(v25, "interfaceElementIdentifier");
        v37 = v16;
        v38 = a1;
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = -[SBSAInterfaceElementPropertyIdentity initWithAssociatedInterfaceElementIdentifier:andProperty:](v36, "initWithAssociatedInterfaceElementIdentifier:andProperty:", v39, CFSTR("contentCenter"));

        a1 = v38;
        v16 = v37;
        objc_msgSend(v43, "associateAnimatedTransitionDescriptionOfProperty:withProperty:withMilestones:", v44, v35, 0);
        objc_msgSend(v43, "associateAnimatedTransitionDescriptionOfProperty:withProperty:withMilestones:", v31, v40, 0);

        v15 = v42;
        v18 = v25;
      }

      ++v17;
    }
    while (v17 < objc_msgSend(v15, "count"));
  }
  objc_msgSend(v43, "setContainerViewDescriptions:", v15);

}

void __118__SBSAMitosisTransitionProvider__updatedInitialUnanimatedPreferencesFromPreferences_context_relevantPropertyIdentity___block_invoke_2(uint64_t a1, void *a2)
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
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
  int v30;
  CGFloat v31;
  CGFloat v32;
  CGFloat v33;
  CGFloat v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  CGFloat v47;
  CGFloat v48;
  CGAffineTransform v49;
  CGAffineTransform v50;
  CGAffineTransform v51;
  CGAffineTransform v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;

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
    v11 = NSClassFromString(CFSTR("SBSAContainerViewDescriptionMutator"));
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", v9, v10, CFSTR("SBSAMitosisTransitionProvider.m"), 161, CFSTR("Unexpected class – expected '%@', got '%@'"), v11, v13);

LABEL_9:
    v7 = 0;
  }

  objc_msgSend(*(id *)(a1 + 40), "inertContainerFrame");
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;
  SBSAAdjunctContainerMinimalSize(*(void **)(a1 + 40));
  BSRectWithSize();
  v23 = v22;
  v25 = v24;
  v27 = v26;
  v29 = v28;
  CGAffineTransformMakeScale(&v52, 0.5, 0.5);
  v53.origin.x = v23;
  v53.origin.y = v25;
  v53.size.width = v27;
  v53.size.height = v29;
  CGRectApplyAffineTransform(v53, &v52);
  v30 = SBSAAdjunctFrameIsOnLeft(*(_QWORD *)(a1 + 64), *(void **)(a1 + 48), *(void **)(a1 + 40));
  v31 = v15;
  v32 = v17;
  v33 = v19;
  v34 = v21;
  if (v30)
    CGRectGetMinX(*(CGRect *)&v31);
  else
    CGRectGetMaxX(*(CGRect *)&v31);
  v54.origin.x = v15;
  v54.origin.y = v17;
  v54.size.width = v19;
  v54.size.height = v21;
  CGRectGetMidY(v54);
  BSRectWithSize();
  SBUnintegralizedRectCenteredAboutPoint();
  BSRectWithSize();
  v36 = v35;
  v38 = v37;
  v40 = v39;
  v42 = v41;
  UIRectGetCenter();
  v44 = v43;
  v46 = v45;
  objc_msgSend(v7, "setBounds:", v36, v38, v40, v42);
  objc_msgSend(v7, "setCenter:", v44, v46);
  memset(&v51, 0, sizeof(v51));
  objc_msgSend(v7, "contentScale");
  SBSAAffineTransformFromContentScale((uint64_t)&v51, v47, v48);
  v49 = v51;
  CGAffineTransformInvert(&v50, &v49);
  v55.origin.x = v36;
  v55.origin.y = v38;
  v55.size.width = v40;
  v55.size.height = v42;
  v56 = CGRectApplyAffineTransform(v55, &v50);
  objc_msgSend(v7, "setContentBounds:", v56.origin.x, v56.origin.y, v56.size.width, v56.size.height);
  UIRectGetCenter();
  objc_msgSend(v7, "setContentCenter:");

}

- (id)_updatedBabyHeadstartPreferencesFromPreferences:(id)a3 context:(id)a4 relevantPropertyIdentity:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  _QWORD v12[5];
  id v13;
  SEL v14;

  v8 = a4;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __114__SBSAMitosisTransitionProvider__updatedBabyHeadstartPreferencesFromPreferences_context_relevantPropertyIdentity___block_invoke;
  v12[3] = &unk_1E8EA4230;
  v13 = v8;
  v14 = a2;
  v12[4] = self;
  v9 = v8;
  v10 = (void *)objc_msgSend(a3, "copyWithBlock:", v12);

  return v10;
}

void __114__SBSAMitosisTransitionProvider__updatedBabyHeadstartPreferencesFromPreferences_context_relevantPropertyIdentity___block_invoke(uint64_t a1, void *a2)
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
  unint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  id v23;
  uint64_t v24;
  id v25;
  __int128 v26;
  _QWORD v27[5];
  __int128 v28;

  v3 = a2;
  v25 = v3;
  if (!v3)
    goto LABEL_9;
  objc_opt_self();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v25;
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

  v3 = v25;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(a1 + 48);
    v10 = *(_QWORD *)(a1 + 32);
    v11 = NSClassFromString(CFSTR("SBSAPreferencesMutator"));
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", v9, v10, CFSTR("SBSAMitosisTransitionProvider.m"), 203, CFSTR("Unexpected class – expected '%@', got '%@'"), v11, v13);

    v3 = v25;
LABEL_9:
    v7 = 0;
  }

  objc_msgSend(v7, "containerViewDescriptions");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v14, "mutableCopy");

  if (objc_msgSend(v15, "count"))
  {
    v16 = 0;
    do
    {
      objc_msgSend(v15, "objectAtIndex:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "elementContexts");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "elementContexts");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      SBSAElementContextAssociatedWithContainerViewDescription(v17, v19, 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      v21 = objc_msgSend(v18, "indexOfObject:", v20);
      objc_msgSend(*(id *)(a1 + 40), "elementContexts");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v21) = SBSAIsElementInCollectionSensorAttached(v21, v22);

      if ((_DWORD)v21)
      {
        v27[0] = MEMORY[0x1E0C809B0];
        v27[1] = 3221225472;
        v27[2] = __114__SBSAMitosisTransitionProvider__updatedBabyHeadstartPreferencesFromPreferences_context_relevantPropertyIdentity___block_invoke_2;
        v27[3] = &unk_1E8EA4230;
        v27[4] = *(_QWORD *)(a1 + 32);
        v26 = *(_OWORD *)(a1 + 40);
        v23 = (id)v26;
        v28 = v26;
        v24 = objc_msgSend(v17, "copyWithBlock:", v27);

        objc_msgSend(v15, "replaceObjectAtIndex:withObject:", v16, v24);
        v17 = (void *)v24;
      }

      ++v16;
    }
    while (v16 < objc_msgSend(v15, "count"));
  }
  objc_msgSend(v7, "setContainerViewDescriptions:", v15);

}

void __114__SBSAMitosisTransitionProvider__updatedBabyHeadstartPreferencesFromPreferences_context_relevantPropertyIdentity___block_invoke_2(uint64_t a1, void *a2)
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
    v10 = NSClassFromString(CFSTR("SBSAContainerViewDescriptionMutator"));
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", v8, v9, CFSTR("SBSAMitosisTransitionProvider.m"), 213, CFSTR("Unexpected class – expected '%@', got '%@'"), v10, v12);

LABEL_9:
    v6 = 0;
  }

  objc_msgSend(*(id *)(a1 + 40), "inertContainerFrame");
  BSRectWithSize();
  objc_msgSend(v6, "setBounds:");
  UIRectGetCenter();
  objc_msgSend(v6, "setCenter:");

}

- (id)_updatedPrimaryLayoutPreferencesFromPreferences:(id)a3 context:(id)a4 relevantPropertyIdentity:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v7 = a3;
  v8 = a4;
  objc_msgSend(v8, "containerViewDescriptions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "containerViewDescriptions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "objectAtIndex:", (unint64_t)objc_msgSend(v10, "count") > 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "interfaceElementIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  *a5 = -[SBSAInterfaceElementPropertyIdentity initWithAssociatedInterfaceElementIdentifier:andProperty:]([SBSAInterfaceElementPropertyIdentity alloc], "initWithAssociatedInterfaceElementIdentifier:andProperty:", v12, CFSTR("bounds"));

  return v7;
}

- (void)updatedPreferencesFromPreferences:(void *)a1 context:(const char *)a2 relevantPropertyIdentity:.cold.1(void *a1, const char *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_3_0(a1, a2);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_6(&dword_1D0540000, v2, v3, "[%{public}lu] Mitosis Provider: Default Case", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_2_2();
}

- (void)updatedPreferencesFromPreferences:(void *)a1 context:(const char *)a2 relevantPropertyIdentity:.cold.2(void *a1, const char *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_3_0(a1, a2);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_6(&dword_1D0540000, v2, v3, "[%{public}lu] Mitosis Provider: Unanimated layout", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_2_2();
}

- (void)updatedPreferencesFromPreferences:(void *)a1 context:(const char *)a2 relevantPropertyIdentity:.cold.3(void *a1, const char *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_3_0(a1, a2);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_6(&dword_1D0540000, v2, v3, "[%{public}lu] Mitosis Provider: Baby Headstart", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_2_2();
}

- (void)updatedPreferencesFromPreferences:(void *)a1 context:(const char *)a2 relevantPropertyIdentity:.cold.4(void *a1, const char *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_3_0(a1, a2);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_6(&dword_1D0540000, v2, v3, "[%{public}lu] Mitosis Provider: Primary Layout", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_2_2();
}

@end
