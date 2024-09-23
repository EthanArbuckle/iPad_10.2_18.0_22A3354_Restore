@implementation SBSAShadowPreferencesProvider

void __56__SBSAShadowPreferencesProvider_preferencesFromContext___block_invoke_2(uint64_t a1, void *a2)
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
  id v16;

  v3 = a2;
  v16 = v3;
  if (!v3)
    goto LABEL_9;
  objc_opt_self();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v16;
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

  v3 = v16;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(a1 + 64);
    v10 = *(_QWORD *)(a1 + 32);
    v11 = NSClassFromString(CFSTR("SBSAContainerViewDescriptionMutator"));
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", v9, v10, CFSTR("SBSAShadowPreferencesProvider.m"), 33, CFSTR("Unexpected class – expected '%@', got '%@'"), v11, v13);

    v3 = v16;
LABEL_9:
    v7 = 0;
  }

  SBSAElementContextAssociatedWithContainerViewDescription(*(void **)(a1 + 40), *(void **)(a1 + 48), 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(*(id *)(a1 + 56), "isHeavyShadowRequiredForTransition") & 1) != 0)
    v15 = 1;
  else
    v15 = objc_msgSend(*(id *)(a1 + 32), "_stretchProviderPresentInStack");
  objc_msgSend(v7, "setShadowStyle:", objc_msgSend(*(id *)(a1 + 32), "_shadowStyleForContainerDescription:elementContext:useHeavyShadowForTransition:isFirstContainer:", *(_QWORD *)(a1 + 40), v14, v15, *(_QWORD *)(a1 + 72) == 0));

}

- (BOOL)_stretchProviderPresentInStack
{
  SBSAShadowPreferencesProvider *v2;
  void *v3;
  char isKindOfClass;
  uint64_t v5;

  v2 = self;
  if (v2)
  {
    v3 = v2;
    do
    {
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
      if ((isKindOfClass & 1) != 0)
        break;
      objc_msgSend(v3, "parentProvider");
      v5 = objc_claimAutoreleasedReturnValue();

      v3 = (void *)v5;
    }
    while (v5);

  }
  else
  {
    isKindOfClass = 0;
  }
  return isKindOfClass & 1;
}

- (int64_t)_shadowStyleForContainerDescription:(id)a3 elementContext:(id)a4 useHeavyShadowForTransition:(BOOL)a5 isFirstContainer:(BOOL)a6
{
  _BOOL4 v7;
  id v9;
  id v10;
  void *v11;
  int v12;
  int64_t v13;
  uint64_t v14;
  double v15;
  uint64_t v18;

  v7 = a5;
  v9 = a3;
  v10 = a4;
  objc_msgSend((id)objc_opt_class(), "settings");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "elementShadowEnabled");

  if (!v12)
    goto LABEL_14;
  if (v7 && a6)
  {
    v13 = 7;
    goto LABEL_15;
  }
  if (!v10)
    goto LABEL_14;
  v14 = objc_msgSend(v10, "layoutMode");
  objc_msgSend(v9, "bounds");
  if ((unint64_t)(v14 - 1) < 2)
  {
    if ((objc_msgSend(v10, "systemApertureLayoutCustomizingOptions") & 1) != 0)
      v13 = 2;
    else
      v13 = 1;
    goto LABEL_15;
  }
  if (v14 != 3)
  {
LABEL_14:
    v13 = 0;
    goto LABEL_15;
  }
  if (v15 <= 37.0)
  {
    v13 = 1;
  }
  else if (v15 >= 74.0)
  {
    if (v15 >= 92.0 || v15 < 74.0)
      v13 = 4;
    else
      v13 = 3;
  }
  else
  {
    v13 = 2;
  }
  v18 = objc_msgSend(v10, "systemApertureCustomLayout");
  if ((unint64_t)(v18 - 1) >= 2)
  {
    if (v18 == 3)
      v13 = 6;
  }
  else
  {
    v13 = 5;
  }
LABEL_15:

  return v13;
}

void __56__SBSAShadowPreferencesProvider_preferencesFromContext___block_invoke(uint64_t a1, void *a2)
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
  SBSAInterfaceElementPropertyIdentity *v21;
  void *v22;
  SBSAInterfaceElementPropertyIdentity *v23;
  id v24;
  _QWORD v25[5];
  id v26;
  id v27;
  id v28;
  uint64_t v29;
  unint64_t v30;

  v3 = a2;
  v24 = v3;
  if (v3)
  {
    objc_opt_self();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v24;
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

    v3 = v24;
    if (v7)
      goto LABEL_10;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(a1 + 64);
    v10 = *(_QWORD *)(a1 + 32);
    v11 = NSClassFromString(CFSTR("SBSAPreferencesMutator"));
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", v9, v10, CFSTR("SBSAShadowPreferencesProvider.m"), 27, CFSTR("Unexpected class – expected '%@', got '%@'"), v11, v13);

    v3 = v24;
  }
  v7 = 0;
LABEL_10:

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "containerViewDescriptions");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v14, "mutableCopy");

  if (objc_msgSend(v15, "count"))
  {
    v16 = 0;
    do
    {
      objc_msgSend(v15, "objectAtIndex:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = __56__SBSAShadowPreferencesProvider_preferencesFromContext___block_invoke_2;
      v25[3] = &unk_1E8EA39D8;
      v29 = *(_QWORD *)(a1 + 64);
      v18 = *(void **)(a1 + 40);
      v25[4] = *(_QWORD *)(a1 + 32);
      v26 = v17;
      v27 = v18;
      v28 = *(id *)(a1 + 48);
      v30 = v16;
      v19 = (void *)objc_msgSend(v17, "copyWithBlock:", v25);
      objc_msgSend(v15, "replaceObjectAtIndex:withObject:", v16, v19);
      v20 = (void *)objc_msgSend(*(id *)(a1 + 32), "newAnimatedTransitionDescriptionForProperty:", CFSTR("shadowStyle"));
      v21 = [SBSAInterfaceElementPropertyIdentity alloc];
      objc_msgSend(v19, "interfaceElementIdentifier");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = -[SBSAInterfaceElementPropertyIdentity initWithAssociatedInterfaceElementIdentifier:andProperty:](v21, "initWithAssociatedInterfaceElementIdentifier:andProperty:", v22, CFSTR("shadowStyle"));
      objc_msgSend(v7, "setAnimatedTransitionDescription:forProperty:withMilestones:", v20, v23, 0);

      ++v16;
    }
    while (v16 < objc_msgSend(v15, "count"));
  }
  objc_msgSend(v7, "setContainerViewDescriptions:", v15);

}

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
  uint64_t v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  id v28;
  void *v29;
  id v30;
  void *v31;
  id v32;
  objc_super v34;
  _QWORD v35[5];
  id v36;
  id v37;
  uint64_t *v38;
  SEL v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t (*v43)(uint64_t, uint64_t);
  void (*v44)(uint64_t);
  id v45;

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
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSAShadowPreferencesProvider.m"), 22, CFSTR("Unexpected class – expected '%@', got '%@'"), v11, v13);

LABEL_9:
    v9 = 0;
  }

  v40 = 0;
  v41 = &v40;
  v42 = 0x3032000000;
  v43 = __Block_byref_object_copy__8;
  v44 = __Block_byref_object_dispose__8;
  objc_msgSend(v9, "preferences");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_opt_class();
  v16 = v14;
  if (v15)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v17 = v16;
    else
      v17 = 0;
  }
  else
  {
    v17 = 0;
  }
  v18 = v17;

  v45 = v18;
  objc_msgSend(v9, "elementContexts");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)v41[5];
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __56__SBSAShadowPreferencesProvider_preferencesFromContext___block_invoke;
  v35[3] = &unk_1E8EA3A00;
  v35[4] = self;
  v38 = &v40;
  v39 = a2;
  v21 = v19;
  v36 = v21;
  v22 = v9;
  v37 = v22;
  v23 = objc_msgSend(v20, "copyWithBlock:", v35);
  v24 = (void *)v41[5];
  v41[5] = v23;

  v25 = (void *)objc_msgSend(v22, "copyByUpdatingPreferences:", v41[5]);
  v34.receiver = self;
  v34.super_class = (Class)SBSAShadowPreferencesProvider;
  -[SBSABasePreferencesProvider preferencesFromContext:](&v34, sel_preferencesFromContext_, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_opt_class();
  v28 = v26;
  if (v27)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v29 = v28;
    else
      v29 = 0;
  }
  else
  {
    v29 = 0;
  }
  v30 = v29;

  v31 = (void *)v41[5];
  v41[5] = (uint64_t)v30;

  v32 = (id)v41[5];
  _Block_object_dispose(&v40, 8);

  return v32;
}

@end
