@implementation SBSADefaultContainerLayoutProvider

uint64_t __85__SBSADefaultContainerLayoutProvider__indexOfContainerViewDescriptionWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "interfaceElementIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = BSEqualObjects();

  return v3;
}

uint64_t __61__SBSADefaultContainerLayoutProvider_preferencesFromContext___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "interfaceElementIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = BSEqualObjects();

  return v3;
}

void __61__SBSADefaultContainerLayoutProvider_preferencesFromContext___block_invoke_4(uint64_t a1, void *a2)
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
  uint64_t v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  id v22;

  v3 = a2;
  v22 = v3;
  if (v3)
  {
    objc_opt_self();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v22;
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

    v3 = v22;
    if (v7)
      goto LABEL_10;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(a1 + 56);
    v10 = *(_QWORD *)(a1 + 32);
    v11 = NSClassFromString(CFSTR("SBSAContainerViewDescriptionMutator"));
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", v9, v10, CFSTR("SBSADefaultContainerLayoutProvider.m"), 133, CFSTR("Unexpected class – expected '%@', got '%@'"), v11, v13);

    v3 = v22;
  }
  v7 = 0;
LABEL_10:

  v14 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "elementContexts");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  SBSAElementContextAssociatedWithContainerViewDescription(v14, v15, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = 0;
  if (objc_msgSend(v16, "layoutMode") == 3)
    v17 = objc_msgSend(v16, "systemApertureCustomLayout");
  objc_msgSend(*(id *)(a1 + 40), "bounds");
  objc_msgSend(v7, "setCornerRadius:", SBSACornerRadiusForContainerBounds(v17, *(void **)(a1 + 48), v18, v19, v20, v21));

}

void __101__SBSADefaultContainerLayoutProvider__updateContainerViewDescription_transitionDescriptions_context___block_invoke_2(uint64_t a1, void *a2)
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
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  SBSAInterfaceElementPropertyIdentity *v27;
  void *v28;
  _QWORD v29[3];

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
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", v9, v10, CFSTR("SBSADefaultContainerLayoutProvider.m"), 196, CFSTR("Unexpected class – expected '%@', got '%@'"), v11, v13);

LABEL_9:
    v7 = 0;
  }

  if (*(_BYTE *)(a1 + 96))
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  else
    objc_msgSend(v7, "interfaceElementIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setInterfaceElementIdentifier:", v14);
  UIRectGetCenter();
  objc_msgSend(v7, "setCenter:");
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  BSRectWithSize();
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v22 = v21;
  objc_msgSend(v7, "setBounds:");
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  v23 = 0.0;
  if (!*(_BYTE *)(a1 + 96))
    v23 = 1.0;
  objc_msgSend(v7, "setAlpha:", v23);
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  objc_msgSend(v7, "setScale:", 1.0, 1.0);
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  objc_msgSend(v7, "setCornerRadius:", 0.0);
  objc_msgSend(v7, "setContentScale:", 1.0, 1.0);
  v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DA9E08]), "initWithDefaultValues");
  objc_msgSend(v24, "setDefaultCriticallyDampedValues");
  v25 = (void *)objc_msgSend((id)objc_opt_class(), "newAnimatedTransitionDescriptionWithBehaviorSettings:", v24);
  v26 = *(void **)(a1 + 40);
  v27 = -[SBSAInterfaceElementPropertyIdentity initWithAssociatedInterfaceElementIdentifier:andProperty:]([SBSAInterfaceElementPropertyIdentity alloc], "initWithAssociatedInterfaceElementIdentifier:andProperty:", v14, CFSTR("contentScale"));
  objc_msgSend(v26, "setObject:forKey:", v25, v27);

  objc_msgSend(v7, "setContentBounds:", v16, v18, v20, v22);
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  UIRectGetCenter();
  objc_msgSend(v7, "setContentCenter:");
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  objc_msgSend(v7, "setKeyLineMode:", 0);
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 0.5, 1.0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setKeyLineTintColor:", v28);

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  objc_msgSend(v7, "setShadowStyle:", 0);
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  SBSystemApertureContainerRenderingConfigurationMake(0, 2, 0, v29);
  objc_msgSend(v7, "setRenderingConfiguration:", v29);
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void __61__SBSADefaultContainerLayoutProvider_preferencesFromContext___block_invoke_2(uint64_t a1, void *a2)
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
  SBSAInterfaceElementPropertyIdentity *v13;
  void *v14;
  SBSAInterfaceElementPropertyIdentity *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  SBSAInterfaceElementPropertyIdentity *v22;
  void *v23;
  SBSAInterfaceElementPropertyIdentity *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;

  v29 = a2;
  if (!v29)
    goto LABEL_9;
  objc_opt_self();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v29;
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
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", v8, v9, CFSTR("SBSADefaultContainerLayoutProvider.m"), 104, CFSTR("Unexpected class – expected '%@', got '%@'"), v10, v12);

LABEL_9:
    v6 = 0;
  }

  v13 = [SBSAInterfaceElementPropertyIdentity alloc];
  objc_msgSend(*(id *)(a1 + 40), "interfaceElementIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[SBSAInterfaceElementPropertyIdentity initWithAssociatedInterfaceElementIdentifier:andProperty:](v13, "initWithAssociatedInterfaceElementIdentifier:andProperty:", v14, CFSTR("blurFrame"));

  v16 = *(void **)(a1 + 32);
  -[SBSAInterfaceElementPropertyIdentity interfaceElementProperty](v15, "interfaceElementProperty");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "behaviorSettingsForProperty:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "description");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBSAAnimatedTransitionDescription animatedTransitionDescriptionWithAnimatedTransitionIdentifier:behaviorSettings:milestones:responsibleProvider:](SBSAAnimatedTransitionDescription, "animatedTransitionDescriptionWithAnimatedTransitionIdentifier:behaviorSettings:milestones:responsibleProvider:", v19, v18, 0, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setAnimatedTransitionDescription:forProperty:withMilestones:", v21, v15, 0);
  v22 = [SBSAInterfaceElementPropertyIdentity alloc];
  objc_msgSend(*(id *)(a1 + 40), "interfaceElementIdentifier");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = -[SBSAInterfaceElementPropertyIdentity initWithAssociatedInterfaceElementIdentifier:andProperty:](v22, "initWithAssociatedInterfaceElementIdentifier:andProperty:", v23, CFSTR("blurHidden"));

  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DA9E08], "unanimatedBehaviorSettings");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "description");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBSAAnimatedTransitionDescription animatedTransitionDescriptionWithAnimatedTransitionIdentifier:behaviorSettings:milestones:responsibleProvider:](SBSAAnimatedTransitionDescription, "animatedTransitionDescriptionWithAnimatedTransitionIdentifier:behaviorSettings:milestones:responsibleProvider:", v25, v26, 0, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setAnimatedTransitionDescription:forProperty:withMilestones:", v28, v24, 0);
}

void __101__SBSADefaultContainerLayoutProvider__updateContainerViewDescription_transitionDescriptions_context___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  SBSAInterfaceElementPropertyIdentity *v11;
  id v12;

  v12 = a2;
  v5 = a3;
  if (v12 && v5)
  {
    if (*(_BYTE *)(a1 + 48))
      objc_msgSend(MEMORY[0x1E0DA9E08], "unanimatedBehaviorSettings");
    else
      objc_msgSend(*(id *)(a1 + 32), "behaviorSettingsForProperty:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "description");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[SBSAAnimatedTransitionDescription animatedTransitionDescriptionWithAnimatedTransitionIdentifier:behaviorSettings:milestones:responsibleProvider:](SBSAAnimatedTransitionDescription, "animatedTransitionDescriptionWithAnimatedTransitionIdentifier:behaviorSettings:milestones:responsibleProvider:", v7, v6, 0, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = *(void **)(a1 + 40);
    v11 = -[SBSAInterfaceElementPropertyIdentity initWithAssociatedInterfaceElementIdentifier:andProperty:]([SBSAInterfaceElementPropertyIdentity alloc], "initWithAssociatedInterfaceElementIdentifier:andProperty:", v12, v5);
    objc_msgSend(v10, "setObject:forKey:", v9, v11);

  }
}

- (id)behaviorSettingsForProperty:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  if ((BSEqualStrings() & 1) != 0 || BSEqualStrings())
  {
    objc_msgSend((id)objc_opt_class(), "settings");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "keyLineStyleTransition");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
LABEL_8:
      v8.receiver = self;
      v8.super_class = (Class)SBSADefaultContainerLayoutProvider;
      -[SBSABasePreferencesProvider behaviorSettingsForProperty:](&v8, sel_behaviorSettingsForProperty_, v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    if ((BSEqualStrings() & 1) == 0 && !BSEqualStrings())
      goto LABEL_8;
    objc_msgSend(MEMORY[0x1E0DA9E08], "unanimatedBehaviorSettings");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
      goto LABEL_8;
  }

  return v6;
}

- (id)defaultTransitionSettings
{
  void *v2;
  void *v3;

  objc_msgSend((id)objc_opt_class(), "settings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "inertInterfaceElementTransitionSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __61__SBSADefaultContainerLayoutProvider_preferencesFromContext___block_invoke(_QWORD *a1, void *a2)
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
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
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
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", v9, v10, CFSTR("SBSADefaultContainerLayoutProvider.m"), 89, CFSTR("Unexpected class – expected '%@', got '%@'"), v11, v13);

LABEL_9:
    v7 = 0;
  }

  objc_msgSend(v7, "setContainerViewDescriptions:", *(_QWORD *)(a1[4] + 32));
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v14 = *(id *)(*(_QWORD *)(a1[5] + 8) + 40);
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v22 != v17)
          objc_enumerationMutation(v14);
        v19 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(*(id *)(*(_QWORD *)(a1[5] + 8) + 40), "objectForKey:", v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setAnimatedTransitionDescription:forProperty:withMilestones:", v20, v19, 0);

      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v16);
  }

}

- (id)preferencesFromContext:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  Class v16;
  objc_class *v17;
  void *v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t i;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  SBSABackgroundBlurDescription *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t j;
  void *v44;
  id v45;
  void *v46;
  unint64_t k;
  void *v48;
  double v49;
  id v50;
  void *v51;
  id v52;
  uint64_t v53;
  void *v54;
  SBSAPreferencesDidChangeAction *v55;
  void *v56;
  SBSAPreferencesDidChangeAction *v57;
  void *v58;
  uint64_t v59;
  void *v61;
  Class v62;
  objc_class *v63;
  void *v64;
  id v65;
  void *v66;
  void *v67;
  void *v68;
  id v69;
  void *v70;
  void *v71;
  id v73;
  _QWORD v75[5];
  id v76;
  SEL v77;
  _QWORD v78[5];
  id v79;
  id v80;
  SEL v81;
  _QWORD v82[4];
  id v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  objc_super v88;
  _QWORD v89[5];
  id v90;
  SEL v91;
  _QWORD v92[7];
  id v93;
  uint64_t v94;
  uint64_t *v95;
  uint64_t v96;
  uint64_t (*v97)(uint64_t, uint64_t);
  void (*v98)(uint64_t);
  id v99;
  SBSAPreferencesDidChangeAction *v100;
  _BYTE v101[128];
  uint64_t v102;

  v102 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = v3;
  if (v3)
  {
    v5 = v3;
    objc_opt_self();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v4;
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
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      v62 = NSClassFromString(CFSTR("SBSAContext"));
      v63 = (objc_class *)objc_opt_class();
      NSStringFromClass(v63);
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSADefaultContainerLayoutProvider.m"), 66, CFSTR("Unexpected class – expected '%@', got '%@'"), v62, v64);

      v9 = 0;
      v4 = v5;
    }
  }
  else
  {
    v9 = 0;
  }
  v66 = v4;

  v69 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  objc_msgSend(v9, "preferences");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
    goto LABEL_18;
  objc_opt_self();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v10;
  if (v11)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v13 = v12;
    else
      v13 = 0;
  }
  else
  {
    v13 = 0;
  }
  v14 = v13;

  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = NSClassFromString(CFSTR("SBSAPreferences"));
    v17 = (objc_class *)objc_opt_class();
    NSStringFromClass(v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSADefaultContainerLayoutProvider.m"), 68, CFSTR("Unexpected class – expected '%@', got '%@'"), v16, v18);

LABEL_18:
    v14 = 0;
  }

  objc_msgSend(v9, "elementContexts");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "containerViewDescriptions");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v9, "minimumNumberOfContainers");
  v20 = objc_msgSend(v68, "count");
  if (v19 <= v20)
    v19 = v20;
  v21 = objc_msgSend(v9, "maximumNumberOfElements");
  if (v19 >= v21)
    v22 = v21;
  else
    v22 = v19;
  v23 = -[NSMutableArray count](self->_orderedContainerDescriptions, "count");
  v94 = 0;
  v95 = &v94;
  v96 = 0x3032000000;
  v97 = __Block_byref_object_copy__112;
  v98 = __Block_byref_object_dispose__112;
  v99 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (v23 > v22)
    v22 = v23;
  if (v22)
  {
    for (i = 0; i != v22; ++i)
    {
      if (objc_msgSend(v71, "count") > i
        && (objc_msgSend(v71, "objectAtIndexedSubscript:", i), (v25 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
      {
        -[SBSADefaultContainerLayoutProvider _updateContainerViewDescription:transitionDescriptions:context:](self, "_updateContainerViewDescription:transitionDescriptions:context:", v25, v95[5], v9);
        v26 = 0;
      }
      else
      {
        v27 = v95[5];
        v93 = 0;
        -[SBSADefaultContainerLayoutProvider _updateContainerDescriptionAtIndex:transitionDescriptions:context:updateReason:](self, "_updateContainerDescriptionAtIndex:transitionDescriptions:context:updateReason:", i, v27, v9, &v93);
        v26 = v93;
        if (v26)
          objc_msgSend(v69, "addObject:", v26);
        v25 = 0;
      }

    }
  }
  v28 = MEMORY[0x1E0C809B0];
  v92[0] = MEMORY[0x1E0C809B0];
  v92[1] = 3221225472;
  v92[2] = __61__SBSADefaultContainerLayoutProvider_preferencesFromContext___block_invoke;
  v92[3] = &unk_1E8EA95B0;
  v92[4] = self;
  v92[5] = &v94;
  v92[6] = a2;
  v67 = (void *)MEMORY[0x1D17E5550](v92);
  if (v14)
  {
    v29 = (void *)objc_msgSend(v14, "copyWithBlock:", v67);

  }
  else
  {
    +[SBSAPreferences instanceWithBlock:](SBSAPreferences, "instanceWithBlock:", v67);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v30 = objc_alloc_init(SBSABackgroundBlurDescription);
  objc_msgSend((id)objc_opt_class(), "frameForVariableBlurUnderContainerViewWithFrame:offscreen:context:", 1, v9, *MEMORY[0x1E0C9D628], *(double *)(MEMORY[0x1E0C9D628] + 8), *(double *)(MEMORY[0x1E0C9D628] + 16), *(double *)(MEMORY[0x1E0C9D628] + 24));
  v31 = -[SBSABackgroundBlurDescription copyBySettingBlurFrame:](v30, "copyBySettingBlurFrame:");

  v32 = (void *)objc_msgSend(v31, "copyBySettingBlurHidden:", 1);
  v33 = (void *)objc_msgSend(v29, "copyByUpdatingBackgroundBlurDescription:", v32);

  v89[0] = v28;
  v89[1] = 3221225472;
  v89[2] = __61__SBSADefaultContainerLayoutProvider_preferencesFromContext___block_invoke_2;
  v89[3] = &unk_1E8EA4230;
  v91 = a2;
  v89[4] = self;
  v65 = v32;
  v90 = v65;
  v34 = (void *)objc_msgSend(v33, "copyWithBlock:", v89);

  v70 = (void *)objc_msgSend(v9, "copyByUpdatingPreferences:", v34);
  v88.receiver = self;
  v88.super_class = (Class)SBSADefaultContainerLayoutProvider;
  -[SBSABasePreferencesProvider preferencesFromContext:](&v88, sel_preferencesFromContext_, v70);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_opt_class();
  v37 = v35;
  if (v36)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v38 = v37;
    else
      v38 = 0;
  }
  else
  {
    v38 = 0;
  }
  v73 = v38;

  objc_msgSend(v73, "containerViewDescriptions");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v86 = 0u;
  v87 = 0u;
  v84 = 0u;
  v85 = 0u;
  v40 = (void *)-[NSMutableArray copy](self->_orderedContainerDescriptions, "copy");
  v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v84, v101, 16);
  if (v41)
  {
    v42 = *(_QWORD *)v85;
    do
    {
      for (j = 0; j != v41; ++j)
      {
        if (*(_QWORD *)v85 != v42)
          objc_enumerationMutation(v40);
        objc_msgSend(*(id *)(*((_QWORD *)&v84 + 1) + 8 * j), "interfaceElementIdentifier");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v82[0] = v28;
        v82[1] = 3221225472;
        v82[2] = __61__SBSADefaultContainerLayoutProvider_preferencesFromContext___block_invoke_3;
        v82[3] = &unk_1E8EA41E0;
        v45 = v44;
        v83 = v45;
        if (objc_msgSend(v39, "indexOfObjectPassingTest:", v82) == 0x7FFFFFFFFFFFFFFFLL)
          -[SBSADefaultContainerLayoutProvider _pruneContainerDescriptionWithIdentifier:](self, "_pruneContainerDescriptionWithIdentifier:", v45);

      }
      v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v84, v101, 16);
    }
    while (v41);
  }

  v46 = (void *)objc_msgSend(v39, "mutableCopy");
  for (k = 0; k < objc_msgSend(v39, "count"); ++k)
  {
    objc_msgSend(v39, "objectAtIndex:", k);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "cornerRadius");
    if (v49 == 0.0)
    {
      v78[0] = v28;
      v78[1] = 3221225472;
      v78[2] = __61__SBSADefaultContainerLayoutProvider_preferencesFromContext___block_invoke_4;
      v78[3] = &unk_1E8EA3798;
      v81 = a2;
      v78[4] = self;
      v50 = v48;
      v79 = v50;
      v80 = v70;
      v51 = (void *)objc_msgSend(v50, "copyWithBlock:", v78);
      objc_msgSend(v46, "replaceObjectAtIndex:withObject:", k, v51);
      v75[0] = v28;
      v75[1] = 3221225472;
      v75[2] = __61__SBSADefaultContainerLayoutProvider_preferencesFromContext___block_invoke_5;
      v75[3] = &unk_1E8EA4230;
      v77 = a2;
      v75[4] = self;
      v52 = v51;
      v76 = v52;
      v53 = objc_msgSend(v73, "copyWithBlock:", v75);

      v73 = (id)v53;
    }

  }
  v54 = (void *)objc_msgSend(v73, "copyByUpdatingContainerViewDescriptions:", v46);

  if (objc_msgSend(v69, "count"))
  {
    v55 = [SBSAPreferencesDidChangeAction alloc];
    objc_msgSend(v69, "allObjects");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = -[SBSAPreferencesDidChangeAction initWithReasons:](v55, "initWithReasons:", v56);
    v100 = v57;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v100, 1);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = objc_msgSend(v54, "copyByAddingActions:", v58);

    v54 = (void *)v59;
  }

  _Block_object_dispose(&v94, 8);
  return v54;
}

void __61__SBSADefaultContainerLayoutProvider_preferencesFromContext___block_invoke_5(uint64_t a1, void *a2)
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
  SBSAInterfaceElementPropertyIdentity *v13;
  void *v14;
  SBSAInterfaceElementPropertyIdentity *v15;
  SBSAInterfaceElementPropertyIdentity *v16;
  void *v17;
  SBSAInterfaceElementPropertyIdentity *v18;
  id v19;

  v19 = a2;
  if (!v19)
    goto LABEL_9;
  objc_opt_self();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v19;
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
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", v8, v9, CFSTR("SBSADefaultContainerLayoutProvider.m"), 140, CFSTR("Unexpected class – expected '%@', got '%@'"), v10, v12);

LABEL_9:
    v6 = 0;
  }

  v13 = [SBSAInterfaceElementPropertyIdentity alloc];
  objc_msgSend(*(id *)(a1 + 40), "interfaceElementIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[SBSAInterfaceElementPropertyIdentity initWithAssociatedInterfaceElementIdentifier:andProperty:](v13, "initWithAssociatedInterfaceElementIdentifier:andProperty:", v14, CFSTR("bounds"));

  v16 = [SBSAInterfaceElementPropertyIdentity alloc];
  objc_msgSend(*(id *)(a1 + 40), "interfaceElementIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[SBSAInterfaceElementPropertyIdentity initWithAssociatedInterfaceElementIdentifier:andProperty:](v16, "initWithAssociatedInterfaceElementIdentifier:andProperty:", v17, CFSTR("cornerRadius"));

  objc_msgSend(v6, "associateAnimatedTransitionDescriptionOfProperty:withProperty:withMilestones:", v15, v18, 0);
}

- (void)_updateContainerViewDescription:(id)a3 transitionDescriptions:(id)a4 context:(id)a5
{
  id v9;
  id v10;
  id v11;
  SBSADefaultContainerLayoutProvider *v12;
  uint64_t v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(uint64_t, void *);
  void *v27;
  SBSADefaultContainerLayoutProvider *v28;
  id v29;
  id v30;
  SEL v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  BOOL v36;
  _QWORD v37[5];
  id v38;
  BOOL v39;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = self;
  objc_sync_enter(v12);
  v13 = MEMORY[0x1E0C809B0];
  v37[0] = MEMORY[0x1E0C809B0];
  v37[1] = 3221225472;
  v37[2] = __101__SBSADefaultContainerLayoutProvider__updateContainerViewDescription_transitionDescriptions_context___block_invoke;
  v37[3] = &unk_1E8EBE210;
  v39 = v9 == 0;
  v37[4] = v12;
  v14 = v10;
  v38 = v14;
  v15 = (void *)MEMORY[0x1D17E5550](v37);
  objc_msgSend(v11, "inertContainerFrame");
  v24 = v13;
  v25 = 3221225472;
  v26 = __101__SBSADefaultContainerLayoutProvider__updateContainerViewDescription_transitionDescriptions_context___block_invoke_2;
  v27 = &unk_1E8EBE238;
  v31 = a2;
  v28 = v12;
  v36 = v9 == 0;
  v32 = v16;
  v33 = v17;
  v34 = v18;
  v35 = v19;
  v20 = v15;
  v30 = v20;
  v21 = v14;
  v29 = v21;
  v22 = (void *)MEMORY[0x1D17E5550](&v24);
  if (v9)
  {
    v23 = (void *)objc_msgSend(v9, "copyWithBlock:", v22, v24, v25, v26, v27, v28);

  }
  else
  {
    +[SBSAViewDescription instanceWithBlock:](SBSAContainerViewDescription, "instanceWithBlock:", v22, v24, v25, v26, v27, v28);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[SBSADefaultContainerLayoutProvider _updateContainerViewDescriptionInCollection:](v12, "_updateContainerViewDescriptionInCollection:", v23);

  objc_sync_exit(v12);
}

- (void)_updateContainerViewDescriptionInCollection:(id)a3
{
  SBSADefaultContainerLayoutProvider *v4;
  NSMutableArray *v5;
  NSMutableArray *orderedContainerDescriptions;
  void *v7;
  uint64_t v8;
  NSMutableArray *v9;
  id v10;

  v10 = a3;
  if (v10)
  {
    v4 = self;
    objc_sync_enter(v4);
    if (!v4->_orderedContainerDescriptions)
    {
      v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      orderedContainerDescriptions = v4->_orderedContainerDescriptions;
      v4->_orderedContainerDescriptions = v5;

    }
    objc_msgSend(v10, "interfaceElementIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[SBSADefaultContainerLayoutProvider _indexOfContainerViewDescriptionWithIdentifier:](v4, "_indexOfContainerViewDescriptionWithIdentifier:", v7);

    v9 = v4->_orderedContainerDescriptions;
    if (v8 == 0x7FFFFFFFFFFFFFFFLL)
      -[NSMutableArray addObject:](v9, "addObject:", v10);
    else
      -[NSMutableArray replaceObjectAtIndex:withObject:](v9, "replaceObjectAtIndex:withObject:", v8, v10);
    objc_sync_exit(v4);

  }
}

- (unint64_t)_indexOfContainerViewDescriptionWithIdentifier:(id)a3
{
  id v4;
  SBSADefaultContainerLayoutProvider *v5;
  NSMutableArray *orderedContainerDescriptions;
  unint64_t v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  if (v4)
  {
    v5 = self;
    objc_sync_enter(v5);
    orderedContainerDescriptions = v5->_orderedContainerDescriptions;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __85__SBSADefaultContainerLayoutProvider__indexOfContainerViewDescriptionWithIdentifier___block_invoke;
    v9[3] = &unk_1E8EA41E0;
    v10 = v4;
    v7 = -[NSMutableArray indexOfObjectPassingTest:](orderedContainerDescriptions, "indexOfObjectPassingTest:", v9);

    objc_sync_exit(v5);
  }
  else
  {
    v7 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v7;
}

- (void)_updateContainerDescriptionAtIndex:(unint64_t)a3 transitionDescriptions:(id)a4 context:(id)a5 updateReason:(id *)a6
{
  id v11;
  SBSADefaultContainerLayoutProvider *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a4;
  v11 = a5;
  v12 = self;
  objc_sync_enter(v12);
  if (-[NSMutableArray count](v12->_orderedContainerDescriptions, "count") <= a3
    || (-[NSMutableArray objectAtIndexedSubscript:](v12->_orderedContainerDescriptions, "objectAtIndexedSubscript:", a3),
        (v13 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    if (-[NSMutableArray count](v12->_orderedContainerDescriptions, "count") != a3)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, v12, CFSTR("SBSADefaultContainerLayoutProvider.m"), 237, CFSTR("Requested index '%lu' isn't the next available index: %@"), a3, v12->_orderedContainerDescriptions);

    }
    v13 = 0;
    if (a6)
      *a6 = CFSTR("inertLayoutProvider.newContainer");
  }
  -[SBSADefaultContainerLayoutProvider _updateContainerViewDescription:transitionDescriptions:context:](v12, "_updateContainerViewDescription:transitionDescriptions:context:", v13, v15, v11);

  objc_sync_exit(v12);
}

- (void)_pruneContainerDescriptionWithIdentifier:(id)a3
{
  id v4;
  SBSADefaultContainerLayoutProvider *v5;
  uint64_t v6;
  id v7;

  v4 = a3;
  if (v4)
  {
    v7 = v4;
    v5 = self;
    objc_sync_enter(v5);
    v6 = -[SBSADefaultContainerLayoutProvider _indexOfContainerViewDescriptionWithIdentifier:](v5, "_indexOfContainerViewDescriptionWithIdentifier:", v7);
    if (v6 != 0x7FFFFFFFFFFFFFFFLL)
      -[NSMutableArray removeObjectAtIndex:](v5->_orderedContainerDescriptions, "removeObjectAtIndex:", v6);
    objc_sync_exit(v5);

    v4 = v7;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_orderedContainerDescriptions, 0);
}

@end
