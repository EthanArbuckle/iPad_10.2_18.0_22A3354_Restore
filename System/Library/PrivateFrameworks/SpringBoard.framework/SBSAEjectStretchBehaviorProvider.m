@implementation SBSAEjectStretchBehaviorProvider

- (id)preferencesFromContext:(id)a3
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  Class v11;
  objc_class *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  id v32;
  void *v33;
  id v34;
  void *v35;
  id v36;
  objc_super v38;
  _QWORD v39[7];
  _QWORD v40[5];
  id v41;
  uint64_t *v42;
  SEL v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t (*v47)(uint64_t, uint64_t);
  void (*v48)(uint64_t);
  id v49;
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  uint64_t (*v53)(uint64_t, uint64_t);
  void (*v54)(uint64_t);
  id v55;

  v50 = 0;
  v51 = &v50;
  v52 = 0x3032000000;
  v53 = __Block_byref_object_copy__54;
  v54 = __Block_byref_object_dispose__54;
  v55 = 0;
  v5 = a3;
  if (!v5)
    goto LABEL_9;
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
    v11 = NSClassFromString(CFSTR("SBSAContext"));
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSAEjectStretchBehaviorProvider.m"), 38, CFSTR("Unexpected class – expected '%@', got '%@'"), v11, v13);

LABEL_9:
    v9 = 0;
  }

  v14 = (void *)v51[5];
  v51[5] = (uint64_t)v9;

  v44 = 0;
  v45 = &v44;
  v46 = 0x3032000000;
  v47 = __Block_byref_object_copy__54;
  v48 = __Block_byref_object_dispose__54;
  objc_msgSend((id)v51[5], "preferences");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_opt_class();
  v17 = v15;
  if (v16)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v18 = v17;
    else
      v18 = 0;
  }
  else
  {
    v18 = 0;
  }
  v19 = v18;

  v49 = v19;
  objc_msgSend((id)objc_opt_class(), "settings");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)v45[5];
  v22 = MEMORY[0x1E0C809B0];
  v40[0] = MEMORY[0x1E0C809B0];
  v40[1] = 3221225472;
  v40[2] = __59__SBSAEjectStretchBehaviorProvider_preferencesFromContext___block_invoke;
  v40[3] = &unk_1E8EAEE58;
  v40[4] = self;
  v42 = &v50;
  v43 = a2;
  v23 = v20;
  v41 = v23;
  v24 = objc_msgSend(v21, "copyWithBlock:", v40);
  v25 = (void *)v45[5];
  v45[5] = v24;

  v26 = (void *)v51[5];
  v39[0] = v22;
  v39[1] = 3221225472;
  v39[2] = __59__SBSAEjectStretchBehaviorProvider_preferencesFromContext___block_invoke_22;
  v39[3] = &unk_1E8EA95B0;
  v39[4] = self;
  v39[5] = &v44;
  v39[6] = a2;
  v27 = objc_msgSend(v26, "copyWithBlock:", v39);
  v28 = (void *)v51[5];
  v51[5] = v27;

  v29 = v51[5];
  v38.receiver = self;
  v38.super_class = (Class)SBSAEjectStretchBehaviorProvider;
  -[SBSABasePreferencesProvider preferencesFromContext:](&v38, sel_preferencesFromContext_, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_opt_class();
  v32 = v30;
  if (v31)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v33 = v32;
    else
      v33 = 0;
  }
  else
  {
    v33 = 0;
  }
  v34 = v33;

  v35 = (void *)v45[5];
  v45[5] = (uint64_t)v34;

  if (self->_phase == 3)
    -[SBSABasePreferencesProvider removeFromParentProvider](self, "removeFromParentProvider");
  v36 = (id)v45[5];

  _Block_object_dispose(&v44, 8);
  _Block_object_dispose(&v50, 8);

  return v36;
}

void __59__SBSAEjectStretchBehaviorProvider_preferencesFromContext___block_invoke(uint64_t a1, void *a2)
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
  char v15;
  _QWORD *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  SBSAInterfaceElementPropertyIdentity *v25;
  void *v26;
  SBSAInterfaceElementPropertyIdentity *v27;
  void *v28;
  SBSAInterfaceElementPropertyIdentity *v29;
  void *v30;
  SBSAInterfaceElementPropertyIdentity *v31;
  SBSAInterfaceElementPropertyIdentity *v32;
  void *v33;
  SBSAInterfaceElementPropertyIdentity *v34;
  _QWORD *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  void *v39;
  SBSAInterfaceElementPropertyIdentity *v40;
  void *v41;
  SBSAInterfaceElementPropertyIdentity *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  SBSAInterfaceElementPropertyIdentity *v48;
  void *v49;
  SBSAInterfaceElementPropertyIdentity *v50;
  SBSAInterfaceElementPropertyIdentity *v51;
  void *v52;
  SBSAInterfaceElementPropertyIdentity *v53;
  id v54;
  _QWORD v55[5];
  id v56;
  id v57;
  uint64_t v58;

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
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", v9, v10, CFSTR("SBSAEjectStretchBehaviorProvider.m"), 42, CFSTR("Unexpected class – expected '%@', got '%@'"), v11, v13);

LABEL_9:
    v7 = 0;
  }

  v14 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v14 + 32) <= 1uLL)
  {
    *(_QWORD *)(v14 + 32) = 1;
    v15 = objc_msgSend(*(id *)(a1 + 32), "_isTimerExpired:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
    v16 = *(_QWORD **)(a1 + 32);
    if ((v15 & 1) != 0)
    {
      v16[4] = 2;
      SBLogSystemAperturePreferencesStackDynamicsAnimations();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        __59__SBSAEjectStretchBehaviorProvider_preferencesFromContext___block_invoke_cold_2(a1 + 48);

    }
    else
    {
      objc_msgSend(v16, "_startTimerIfNecessary:context:", v7, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
      objc_msgSend(v7, "containerViewDescriptions");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)objc_msgSend(v18, "mutableCopy");

      objc_msgSend(v19, "firstObject");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v55[0] = MEMORY[0x1E0C809B0];
      v55[2] = __59__SBSAEjectStretchBehaviorProvider_preferencesFromContext___block_invoke_2;
      v55[3] = &unk_1E8EA3798;
      v21 = *(_QWORD *)(a1 + 32);
      v22 = *(void **)(a1 + 40);
      v58 = *(_QWORD *)(a1 + 56);
      v55[4] = v21;
      v55[1] = 3221225472;
      v56 = v22;
      v57 = v20;
      v54 = v20;
      v23 = (void *)objc_msgSend(v54, "copyWithBlock:", v55);
      objc_msgSend(v19, "replaceObjectAtIndex:withObject:", 0, v23);
      objc_msgSend(v7, "setContainerViewDescriptions:", v19);
      objc_msgSend(*(id *)(a1 + 40), "ejectionStretchSettings");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = [SBSAInterfaceElementPropertyIdentity alloc];
      objc_msgSend(v23, "interfaceElementIdentifier");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = -[SBSAInterfaceElementPropertyIdentity initWithAssociatedInterfaceElementIdentifier:andProperty:](v25, "initWithAssociatedInterfaceElementIdentifier:andProperty:", v26, CFSTR("bounds"));

      v28 = (void *)objc_msgSend((id)objc_opt_class(), "newAnimatedTransitionDescriptionWithBehaviorSettings:", v24);
      objc_msgSend(v7, "setAnimatedTransitionDescription:forProperty:withMilestones:", v28, v27, 0);

      v29 = [SBSAInterfaceElementPropertyIdentity alloc];
      objc_msgSend(v23, "interfaceElementIdentifier");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = -[SBSAInterfaceElementPropertyIdentity initWithAssociatedInterfaceElementIdentifier:andProperty:](v29, "initWithAssociatedInterfaceElementIdentifier:andProperty:", v30, CFSTR("center"));
      objc_msgSend(v7, "associateAnimatedTransitionDescriptionOfProperty:withProperty:withMilestones:", v27, v31, 0);

      v32 = [SBSAInterfaceElementPropertyIdentity alloc];
      objc_msgSend(v23, "interfaceElementIdentifier");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = -[SBSAInterfaceElementPropertyIdentity initWithAssociatedInterfaceElementIdentifier:andProperty:](v32, "initWithAssociatedInterfaceElementIdentifier:andProperty:", v33, CFSTR("cornerRadius"));
      objc_msgSend(v7, "associateAnimatedTransitionDescriptionOfProperty:withProperty:withMilestones:", v27, v34, 0);

    }
  }
  v35 = *(_QWORD **)(a1 + 32);
  if (v35[4] == 2)
  {
    if (objc_msgSend(v35, "_checkContextForExpiredContractionMilestone:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40)))
    {
      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) = 3;
      SBLogSystemAperturePreferencesStackDynamicsAnimations();
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
        __59__SBSAEjectStretchBehaviorProvider_preferencesFromContext___block_invoke_cold_1(a1 + 48);
    }
    else
    {
      objc_msgSend(v7, "containerViewDescriptions");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_msgSend(v37, "mutableCopy");

      -[NSObject firstObject](v36, "firstObject");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "ejectionContractionSettings");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = [SBSAInterfaceElementPropertyIdentity alloc];
      objc_msgSend(v38, "interfaceElementIdentifier");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = -[SBSAInterfaceElementPropertyIdentity initWithAssociatedInterfaceElementIdentifier:andProperty:](v40, "initWithAssociatedInterfaceElementIdentifier:andProperty:", v41, CFSTR("bounds"));

      if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 48))
      {
        v43 = -[SBSAInterfaceElementPropertyIdentity copy](v42, "copy");
        v44 = *(_QWORD *)(a1 + 32);
        v45 = *(void **)(v44 + 48);
        *(_QWORD *)(v44 + 48) = v43;

      }
      v46 = (void *)objc_msgSend((id)objc_opt_class(), "newAnimatedTransitionDescriptionWithBehaviorSettings:", v39);
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", 0x1E91CF8F8);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setAnimatedTransitionDescription:forProperty:withMilestones:", v46, v42, v47);

      v48 = [SBSAInterfaceElementPropertyIdentity alloc];
      objc_msgSend(v38, "interfaceElementIdentifier");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = -[SBSAInterfaceElementPropertyIdentity initWithAssociatedInterfaceElementIdentifier:andProperty:](v48, "initWithAssociatedInterfaceElementIdentifier:andProperty:", v49, CFSTR("center"));
      objc_msgSend(v7, "associateAnimatedTransitionDescriptionOfProperty:withProperty:withMilestones:", v42, v50, 0);

      v51 = [SBSAInterfaceElementPropertyIdentity alloc];
      objc_msgSend(v38, "interfaceElementIdentifier");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = -[SBSAInterfaceElementPropertyIdentity initWithAssociatedInterfaceElementIdentifier:andProperty:](v51, "initWithAssociatedInterfaceElementIdentifier:andProperty:", v52, CFSTR("cornerRadius"));
      objc_msgSend(v7, "associateAnimatedTransitionDescriptionOfProperty:withProperty:withMilestones:", v42, v53, 0);

    }
  }

}

void __59__SBSAEjectStretchBehaviorProvider_preferencesFromContext___block_invoke_2(uint64_t a1, void *a2)
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
  double v13;
  double v14;
  id v15;

  v15 = a2;
  if (!v15)
    goto LABEL_9;
  objc_opt_self();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v15;
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
    v8 = *(_QWORD *)(a1 + 56);
    v9 = *(_QWORD *)(a1 + 32);
    v10 = NSClassFromString(CFSTR("SBSAContainerViewDescriptionMutator"));
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", v8, v9, CFSTR("SBSAEjectStretchBehaviorProvider.m"), 51, CFSTR("Unexpected class – expected '%@', got '%@'"), v10, v12);

LABEL_9:
    v6 = 0;
  }

  objc_msgSend(*(id *)(a1 + 40), "ejectionMaxCornerRadius");
  v14 = v13;
  objc_msgSend(*(id *)(a1 + 48), "bounds");
  objc_msgSend(*(id *)(a1 + 48), "center");
  SBUnintegralizedRectCenteredAboutPoint();
  objc_msgSend(*(id *)(a1 + 40), "ejectionYUpOffset");
  objc_msgSend(*(id *)(a1 + 40), "ejectionYStretch");
  SBRectWithSize();
  objc_msgSend(v6, "setBounds:");
  UIRectGetCenter();
  objc_msgSend(v6, "setCenter:");
  objc_msgSend(v6, "setCornerRadius:", v14);

}

void __59__SBSAEjectStretchBehaviorProvider_preferencesFromContext___block_invoke_22(_QWORD *a1, void *a2)
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
    v10 = NSClassFromString(CFSTR("SBSAContextMutator"));
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", v8, v9, CFSTR("SBSAEjectStretchBehaviorProvider.m"), 94, CFSTR("Unexpected class – expected '%@', got '%@'"), v10, v12);

LABEL_9:
    v6 = 0;
  }

  objc_msgSend(v6, "setKeyLineRequiredForTransition:", 1);
  objc_msgSend(v6, "setPreferences:", *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40));

}

- (BOOL)_isTimerExpired:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  BOOL v7;
  NSUUID *identifierOfActiveTimer;
  NSObject *v9;
  _QWORD v11[5];

  v4 = a3;
  objc_msgSend(v4, "elapsedTimerDescriptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __52__SBSAEjectStretchBehaviorProvider__isTimerExpired___block_invoke;
    v11[3] = &unk_1E8EA95D8;
    v11[4] = self;
    v6 = objc_msgSend(v5, "indexOfObjectPassingTest:", v11);
    v7 = v6 != 0x7FFFFFFFFFFFFFFFLL;
    if (v6 != 0x7FFFFFFFFFFFFFFFLL)
    {
      identifierOfActiveTimer = self->_identifierOfActiveTimer;
      self->_identifierOfActiveTimer = 0;

      SBLogSystemAperturePreferencesStackDynamicsAnimations();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        -[SBSAEjectStretchBehaviorProvider _isTimerExpired:].cold.1(v4);

    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

uint64_t __52__SBSAEjectStretchBehaviorProvider__isTimerExpired___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "timerDescriptionIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = BSEqualObjects();

  return v3;
}

- (void)_startTimerIfNecessary:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  SBSATimerDescription *v8;
  void *v9;
  SBSATimerDescription *v10;
  NSUUID *v11;
  NSUUID *identifierOfActiveTimer;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;

  v6 = a3;
  v7 = a4;
  if (!self->_identifierOfActiveTimer)
  {
    v8 = [SBSATimerDescription alloc];
    objc_msgSend((id)objc_opt_class(), "settings");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "ejectionStretchDuration");
    v10 = -[SBSATimerDescription initWithTimeInterval:](v8, "initWithTimeInterval:");

    -[SBSATimerDescription timerDescriptionIdentifier](v10, "timerDescriptionIdentifier");
    v11 = (NSUUID *)objc_claimAutoreleasedReturnValue();
    identifierOfActiveTimer = self->_identifierOfActiveTimer;
    self->_identifierOfActiveTimer = v11;

    objc_msgSend(v6, "timerDescriptions");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      objc_msgSend(v6, "timerDescriptions");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (id)objc_msgSend(v14, "mutableCopy");

    }
    else
    {
      v15 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    }

    objc_msgSend(v15, "addObject:", v10);
    objc_msgSend(v6, "setTimerDescriptions:", v15);
    SBLogSystemAperturePreferencesStackDynamicsAnimations();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      -[SBSAEjectStretchBehaviorProvider _startTimerIfNecessary:context:].cold.1(v7);

  }
}

- (BOOL)_checkContextForExpiredContractionMilestone:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  int v11;
  SBSAInterfaceElementPropertyIdentity *pendingCollapsePropertyIdentity;
  BOOL v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (!self->_pendingCollapsePropertyIdentity)
    return 0;
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(a3, "animatedTransitionResults", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v9, "associatedInterfaceElementPropertyIdentity");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (BSEqualObjects())
        {
          v11 = objc_msgSend(v9, "isTransitionEndTargeted");

          if (v11)
          {
            pendingCollapsePropertyIdentity = self->_pendingCollapsePropertyIdentity;
            self->_pendingCollapsePropertyIdentity = 0;

            v13 = 1;
            goto LABEL_15;
          }
        }
        else
        {

        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v6);
  }
  v13 = 0;
LABEL_15:

  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingCollapsePropertyIdentity, 0);
  objc_storeStrong((id *)&self->_identifierOfActiveTimer, 0);
}

void __59__SBSAEjectStretchBehaviorProvider_preferencesFromContext___block_invoke_cold_1(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_2_11(a1);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_6(&dword_1D0540000, v1, v2, "[%{public}lu] [Eject] Complete", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_2_2();
}

void __59__SBSAEjectStretchBehaviorProvider_preferencesFromContext___block_invoke_cold_2(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_2_11(a1);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_6(&dword_1D0540000, v1, v2, "[%{public}lu] [Eject] Moving to Contracting phase", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_2_2();
}

- (void)_isTimerExpired:(void *)a1 .cold.1(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(a1, "queryIteration");
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_6(&dword_1D0540000, v1, v2, "[%{public}lu] [Eject] Timer Expired", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_2_2();
}

- (void)_startTimerIfNecessary:(void *)a1 context:.cold.1(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(a1, "queryIteration");
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_6(&dword_1D0540000, v1, v2, "[%{public}lu] [Eject] Stretching, starting timer", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_2_2();
}

@end
