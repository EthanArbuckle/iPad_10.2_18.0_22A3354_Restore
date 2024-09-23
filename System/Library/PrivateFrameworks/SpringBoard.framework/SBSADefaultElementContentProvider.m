@implementation SBSADefaultElementContentProvider

void __60__SBSADefaultElementContentProvider_preferencesFromContext___block_invoke_3(uint64_t a1, void *a2)
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
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
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
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", v9, v10, CFSTR("SBSADefaultElementContentProvider.m"), 91, CFSTR("Unexpected class – expected '%@', got '%@'"), v11, v13);

LABEL_9:
    v7 = 0;
  }
  v26 = v3;

  objc_msgSend(*(id *)(a1 + 40), "allValues");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setElementDescriptions:", v14);

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v15 = *(id *)(a1 + 48);
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v28 != v18)
          objc_enumerationMutation(v15);
        v20 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i);
        objc_msgSend(*(id *)(a1 + 48), "objectForKey:", v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_opt_class();
        v23 = v21;
        if (v22)
        {
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v24 = v23;
          else
            v24 = 0;
        }
        else
        {
          v24 = 0;
        }
        v25 = v24;

        if (v25)
          objc_msgSend(v7, "associateAnimatedTransitionDescriptionOfProperty:withProperty:withMilestones:", v25, v20, 0);
        else
          objc_msgSend(v7, "setAnimatedTransitionDescription:forProperty:withMilestones:", v23, v20, 0);

      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v17);
  }

}

- (id)preferencesFromContext:(id)a3
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  Class v17;
  objc_class *v18;
  void *v19;
  id v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  int v30;
  int v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  int v35;
  uint64_t v36;
  uint64_t j;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  id v44;
  void *v45;
  void *v46;
  id v47;
  void *v48;
  id v49;
  NSMutableDictionary *v50;
  NSMutableDictionary *v51;
  id v52;
  void *v53;
  void *v54;
  SBSAPreferencesDidChangeAction *v55;
  void *v56;
  SBSAPreferencesDidChangeAction *v57;
  void *v58;
  uint64_t v59;
  void *v60;
  void *v61;
  void *v63;
  Class v64;
  objc_class *v65;
  void *v66;
  Class v67;
  SEL v68;
  void *v69;
  void *v70;
  uint64_t v71;
  int v72;
  void *v73;
  void *v74;
  void *v75;
  SBSADefaultElementContentProvider *v76;
  id v77;
  objc_super v78;
  _QWORD v79[5];
  NSMutableDictionary *v80;
  id v81;
  SEL v82;
  _QWORD v83[4];
  id v84;
  _QWORD v85[4];
  id v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  SBSAPreferencesDidChangeAction *v95;
  _BYTE v96[128];
  _BYTE v97[128];
  uint64_t v98;

  v98 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
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
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      v64 = NSClassFromString(CFSTR("SBSAContext"));
      v65 = (objc_class *)objc_opt_class();
      NSStringFromClass(v65);
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSADefaultElementContentProvider.m"), 49, CFSTR("Unexpected class – expected '%@', got '%@'"), v64, v66);

    }
  }
  else
  {
    v9 = 0;
  }
  v69 = v5;

  v10 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v75 = v9;
  objc_msgSend(v9, "preferences");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v76 = self;
  if (!v11)
    goto LABEL_18;
  objc_opt_self();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v11;
  if (v12)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v14 = v13;
    else
      v14 = 0;
  }
  else
  {
    v14 = 0;
  }
  v15 = v14;

  v70 = v15;
  if (!v15)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = NSClassFromString(CFSTR("SBSAPreferences"));
    v18 = (objc_class *)objc_opt_class();
    NSStringFromClass(v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v67 = v17;
    self = v76;
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, v76, CFSTR("SBSADefaultElementContentProvider.m"), 51, CFSTR("Unexpected class – expected '%@', got '%@'"), v67, v19);

LABEL_18:
    v70 = 0;
  }
  v68 = a2;

  v77 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v20 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v91 = 0u;
  v92 = 0u;
  v93 = 0u;
  v94 = 0u;
  objc_msgSend(v75, "elementContexts");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v91, v97, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v92;
    do
    {
      for (i = 0; i != v23; ++i)
      {
        if (*(_QWORD *)v92 != v24)
          objc_enumerationMutation(v21);
        -[SBSADefaultElementContentProvider _updatedElementDescriptionAssociatedWithElementContext:transitionDescriptions:context:updateReasons:](self, "_updatedElementDescriptionAssociatedWithElementContext:transitionDescriptions:context:updateReasons:", *(_QWORD *)(*((_QWORD *)&v91 + 1) + 8 * i), v77, v75, v10);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = v26;
        if (v26)
        {
          objc_msgSend(v26, "interfaceElementIdentifier");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "addObject:", v28);

        }
      }
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v91, v97, 16);
    }
    while (v23);
  }
  v74 = v10;

  v29 = objc_msgSend(v75, "isAnimatedTransitionInProgress");
  if (self->_wasAnimating)
    v30 = v29 ^ 1;
  else
    v30 = 0;
  self->_wasAnimating = v29;
  v31 = objc_msgSend(v75, "containsAnyOfSignals:", 3);
  v87 = 0u;
  v88 = 0u;
  v89 = 0u;
  v90 = 0u;
  -[NSMutableDictionary allValues](self->_identifiersToElementDescriptions, "allValues");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v87, v96, 16);
  v73 = v20;
  if (v33)
  {
    v34 = v33;
    v35 = v31 | v30;
    v36 = *(_QWORD *)v88;
    v72 = v35;
    v71 = *(_QWORD *)v88;
    do
    {
      for (j = 0; j != v34; ++j)
      {
        if (*(_QWORD *)v88 != v36)
          objc_enumerationMutation(v32);
        v38 = *(void **)(*((_QWORD *)&v87 + 1) + 8 * j);
        objc_msgSend(v38, "interfaceElementIdentifier");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v20, "containsObject:", v39) & 1) == 0)
        {
          if (v35)
          {
            -[SBSADefaultElementContentProvider _pruneElementDescriptionWithIdentifier:](self, "_pruneElementDescriptionWithIdentifier:", v39);
          }
          else
          {
            objc_msgSend(v38, "associatedSystemApertureElementIdentity");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v75, "elementContexts");
            v41 = v32;
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            v43 = MEMORY[0x1E0C809B0];
            v85[0] = MEMORY[0x1E0C809B0];
            v85[1] = 3221225472;
            v85[2] = __60__SBSADefaultElementContentProvider_preferencesFromContext___block_invoke;
            v85[3] = &unk_1E8EA3748;
            v44 = v40;
            v86 = v44;
            objc_msgSend(v42, "bs_firstObjectPassingTest:", v85);
            v45 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v75, "elementSnapshotContexts");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            v83[0] = v43;
            v83[1] = 3221225472;
            v83[2] = __60__SBSADefaultElementContentProvider_preferencesFromContext___block_invoke_2;
            v83[3] = &unk_1E8EA3770;
            v84 = v44;
            v47 = v44;
            objc_msgSend(v46, "bs_firstObjectPassingTest:", v83);
            v48 = (void *)objc_claimAutoreleasedReturnValue();

            v32 = v41;
            v20 = v73;
            v49 = -[SBSADefaultElementContentProvider _updatedElementDescriptionFromDescription:associatedElementContext:associatedSnapshotContext:transitionDescriptions:context:updateReasons:](v76, "_updatedElementDescriptionFromDescription:associatedElementContext:associatedSnapshotContext:transitionDescriptions:context:updateReasons:", v38, v45, v48, v77, v75, v74);

            v36 = v71;
            v35 = v72;

            self = v76;
          }
        }

      }
      v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v87, v96, 16);
    }
    while (v34);
  }

  v50 = self->_identifiersToElementDescriptions;
  v79[0] = MEMORY[0x1E0C809B0];
  v79[1] = 3221225472;
  v79[2] = __60__SBSADefaultElementContentProvider_preferencesFromContext___block_invoke_3;
  v79[3] = &unk_1E8EA3798;
  v82 = v68;
  v79[4] = self;
  v51 = v50;
  v80 = v51;
  v52 = v77;
  v81 = v52;
  v53 = (void *)MEMORY[0x1D17E5550](v79);
  if (v70)
  {
    v54 = (void *)objc_msgSend(v70, "copyWithBlock:", v53);

  }
  else
  {
    +[SBSAPreferences instanceWithBlock:](SBSAPreferences, "instanceWithBlock:", v53);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (objc_msgSend(v74, "count"))
  {
    v55 = [SBSAPreferencesDidChangeAction alloc];
    objc_msgSend(v74, "allObjects");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = -[SBSAPreferencesDidChangeAction initWithReasons:](v55, "initWithReasons:", v56);
    v95 = v57;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v95, 1);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = objc_msgSend(v54, "copyByAddingActions:", v58);

    v54 = (void *)v59;
    self = v76;
  }
  v60 = (void *)objc_msgSend(v75, "copyByUpdatingPreferences:", v54);

  v78.receiver = self;
  v78.super_class = (Class)SBSADefaultElementContentProvider;
  -[SBSABasePreferencesProvider preferencesFromContext:](&v78, sel_preferencesFromContext_, v60);
  v61 = (void *)objc_claimAutoreleasedReturnValue();

  return v61;
}

- (id)defaultTransitionSettings
{
  void *v2;
  void *v3;

  objc_msgSend((id)objc_opt_class(), "settings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "elementContentTransitionSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __60__SBSADefaultElementContentProvider_preferencesFromContext___block_invoke()
{
  return SAElementIdentityEqualToIdentity();
}

uint64_t __60__SBSADefaultElementContentProvider_preferencesFromContext___block_invoke_2()
{
  return SAElementIdentityEqualToIdentity();
}

- (id)_updatedElementDescriptionFromDescription:(id)a3 associatedElementContext:(id)a4 associatedSnapshotContext:(id)a5 transitionDescriptions:(id)a6 context:(id)a7 updateReasons:(id)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  SBSADefaultElementContentProvider *v21;
  uint64_t v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  void *v29;
  void *v30;
  NSMutableDictionary *identifiersToElementDescriptions;
  NSMutableDictionary *v32;
  NSMutableDictionary *v33;
  void *v34;
  id v36;
  _QWORD v37[5];
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  SEL v43;
  BOOL v44;
  _QWORD v45[5];
  id v46;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v21 = self;
  objc_sync_enter(v21);
  v22 = MEMORY[0x1E0C809B0];
  v45[0] = MEMORY[0x1E0C809B0];
  v45[1] = 3221225472;
  v45[2] = __175__SBSADefaultElementContentProvider__updatedElementDescriptionFromDescription_associatedElementContext_associatedSnapshotContext_transitionDescriptions_context_updateReasons___block_invoke;
  v45[3] = &unk_1E8EA37C0;
  v45[4] = v21;
  v36 = v18;
  v46 = v36;
  v23 = (void *)MEMORY[0x1D17E5550](v45);
  if (!v15)
    objc_msgSend(v20, "addObject:", CFSTR("defaultElementContentProvider.updateReason.newElementDescription"));
  v37[0] = v22;
  v37[1] = 3221225472;
  v37[2] = __175__SBSADefaultElementContentProvider__updatedElementDescriptionFromDescription_associatedElementContext_associatedSnapshotContext_transitionDescriptions_context_updateReasons___block_invoke_2;
  v37[3] = &unk_1E8EA37E8;
  v43 = a2;
  v37[4] = v21;
  v44 = v15 == 0;
  v24 = v16;
  v38 = v24;
  v25 = v23;
  v42 = v25;
  v26 = v17;
  v39 = v26;
  v27 = v19;
  v40 = v27;
  v28 = v20;
  v41 = v28;
  v29 = (void *)MEMORY[0x1D17E5550](v37);
  if (v15)
  {
    v30 = (void *)objc_msgSend(v15, "copyWithBlock:", v29);

  }
  else
  {
    +[SBSAElementDescription instanceWithBlock:](SBSAElementDescription, "instanceWithBlock:", v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
  }
  identifiersToElementDescriptions = v21->_identifiersToElementDescriptions;
  if (!identifiersToElementDescriptions)
  {
    v32 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v33 = v21->_identifiersToElementDescriptions;
    v21->_identifiersToElementDescriptions = v32;

    identifiersToElementDescriptions = v21->_identifiersToElementDescriptions;
  }
  objc_msgSend(v30, "interfaceElementIdentifier");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](identifiersToElementDescriptions, "setObject:forKey:", v30, v34);

  objc_sync_exit(v21);
  return v30;
}

void __175__SBSADefaultElementContentProvider__updatedElementDescriptionFromDescription_associatedElementContext_associatedSnapshotContext_transitionDescriptions_context_updateReasons___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  void *v7;
  id v8;
  id v9;
  void *v10;
  SBSAInterfaceElementPropertyIdentity *v11;
  id v12;

  if (a2)
  {
    if (a3)
    {
      v7 = *(void **)(a1 + 32);
      v8 = a3;
      v9 = a2;
      v12 = (id)objc_msgSend(v7, "newAnimatedTransitionDescriptionForProperty:animated:", v8, a4);
      v10 = *(void **)(a1 + 40);
      v11 = -[SBSAInterfaceElementPropertyIdentity initWithAssociatedInterfaceElementIdentifier:andProperty:]([SBSAInterfaceElementPropertyIdentity alloc], "initWithAssociatedInterfaceElementIdentifier:andProperty:", v9, v8);

      objc_msgSend(v10, "setObject:forKey:", v12, v11);
    }
  }
}

void __175__SBSADefaultElementContentProvider__updatedElementDescriptionFromDescription_associatedElementContext_associatedSnapshotContext_transitionDescriptions_context_updateReasons___block_invoke_2(uint64_t a1, void *a2)
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
  double v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  const __CFString *v23;
  double v24;
  id v25;

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
    v9 = *(_QWORD *)(a1 + 80);
    v10 = *(_QWORD *)(a1 + 32);
    v11 = NSClassFromString(CFSTR("SBSAElementDescriptionMutator"));
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", v9, v10, CFSTR("SBSADefaultElementContentProvider.m"), 126, CFSTR("Unexpected class – expected '%@', got '%@'"), v11, v13);

    v3 = v25;
LABEL_9:
    v7 = 0;
  }

  if (*(_BYTE *)(a1 + 88))
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  else
    objc_msgSend(v7, "interfaceElementIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (*(_BYTE *)(a1 + 88))
    objc_msgSend(v7, "setInterfaceElementIdentifier:", v14);
  if (*(_QWORD *)(a1 + 40))
    objc_msgSend(v7, "setAssociatedSystemApertureElementIdentity:");
  if (*(_BYTE *)(a1 + 88))
    v15 = 0;
  else
    v15 = 3;
  objc_msgSend(v7, "setAppearState:", v15);
  v16 = 0.0;
  objc_msgSend(v7, "setSensorObscuringShadowProgress:", 0.0);
  objc_msgSend(v7, "setLeadingViewBlurProgress:", 1.0);
  (*(void (**)(_QWORD, void *, const __CFString *, BOOL))(*(_QWORD *)(a1 + 72) + 16))(*(_QWORD *)(a1 + 72), v14, CFSTR("leadingViewBlurProgress"), *(_BYTE *)(a1 + 88) == 0);
  objc_msgSend(v7, "setLeadingViewAlpha:", 0.0);
  (*(void (**)(_QWORD, void *, const __CFString *, BOOL))(*(_QWORD *)(a1 + 72) + 16))(*(_QWORD *)(a1 + 72), v14, CFSTR("leadingViewAlpha"), *(_BYTE *)(a1 + 88) == 0);
  objc_msgSend(v7, "setLeadingViewSquishProgress:", 1.0);
  (*(void (**)(_QWORD, void *, const __CFString *, BOOL))(*(_QWORD *)(a1 + 72) + 16))(*(_QWORD *)(a1 + 72), v14, CFSTR("leadingViewSquishProgress"), *(_BYTE *)(a1 + 88) == 0);
  objc_msgSend(v7, "setLeadingViewScale:", 1.0, 1.0);
  (*(void (**)(_QWORD, void *, const __CFString *, BOOL))(*(_QWORD *)(a1 + 72) + 16))(*(_QWORD *)(a1 + 72), v14, CFSTR("leadingViewScale"), *(_BYTE *)(a1 + 88) == 0);
  objc_msgSend(v7, "setTrailingViewBlurProgress:", 1.0);
  (*(void (**)(_QWORD, void *, const __CFString *, BOOL))(*(_QWORD *)(a1 + 72) + 16))(*(_QWORD *)(a1 + 72), v14, CFSTR("trailingViewBlurProgress"), *(_BYTE *)(a1 + 88) == 0);
  objc_msgSend(v7, "setTrailingViewAlpha:", 0.0);
  (*(void (**)(_QWORD, void *, const __CFString *, BOOL))(*(_QWORD *)(a1 + 72) + 16))(*(_QWORD *)(a1 + 72), v14, CFSTR("trailingViewAlpha"), *(_BYTE *)(a1 + 88) == 0);
  objc_msgSend(v7, "setTrailingViewSquishProgress:", 1.0);
  (*(void (**)(_QWORD, void *, const __CFString *, BOOL))(*(_QWORD *)(a1 + 72) + 16))(*(_QWORD *)(a1 + 72), v14, CFSTR("trailingViewSquishProgress"), *(_BYTE *)(a1 + 88) == 0);
  objc_msgSend(v7, "setTrailingViewScale:", 1.0, 1.0);
  (*(void (**)(_QWORD, void *, const __CFString *, BOOL))(*(_QWORD *)(a1 + 72) + 16))(*(_QWORD *)(a1 + 72), v14, CFSTR("trailingViewScale"), *(_BYTE *)(a1 + 88) == 0);
  objc_msgSend(v7, "setMinimalViewBlurProgress:", 1.0);
  (*(void (**)(_QWORD, void *, const __CFString *, BOOL))(*(_QWORD *)(a1 + 72) + 16))(*(_QWORD *)(a1 + 72), v14, CFSTR("minimalViewBlurProgress"), *(_BYTE *)(a1 + 88) == 0);
  objc_msgSend(v7, "setMinimalViewAlpha:", 0.0);
  (*(void (**)(_QWORD, void *, const __CFString *, BOOL))(*(_QWORD *)(a1 + 72) + 16))(*(_QWORD *)(a1 + 72), v14, CFSTR("minimalViewAlpha"), *(_BYTE *)(a1 + 88) == 0);
  objc_msgSend(v7, "setMinimalViewSquishProgress:", 1.0);
  (*(void (**)(_QWORD, void *, const __CFString *, BOOL))(*(_QWORD *)(a1 + 72) + 16))(*(_QWORD *)(a1 + 72), v14, CFSTR("minimalViewSquishProgress"), *(_BYTE *)(a1 + 88) == 0);
  objc_msgSend(v7, "setMinimalViewScale:", 1.0, 1.0);
  (*(void (**)(_QWORD, void *, const __CFString *, BOOL))(*(_QWORD *)(a1 + 72) + 16))(*(_QWORD *)(a1 + 72), v14, CFSTR("minimalViewScale"), *(_BYTE *)(a1 + 88) == 0);
  objc_msgSend(v7, "setCustomContentBlurProgress:", 1.0);
  (*(void (**)(_QWORD, void *, const __CFString *, BOOL))(*(_QWORD *)(a1 + 72) + 16))(*(_QWORD *)(a1 + 72), v14, CFSTR("customContentBlurProgress"), *(_BYTE *)(a1 + 88) == 0);
  objc_msgSend(v7, "setCustomContentAlpha:", 0.0);
  (*(void (**)(_QWORD, void *, const __CFString *, BOOL))(*(_QWORD *)(a1 + 72) + 16))(*(_QWORD *)(a1 + 72), v14, CFSTR("customContentAlpha"), *(_BYTE *)(a1 + 88) == 0);
  objc_msgSend(*(id *)(a1 + 48), "snapshotReason");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = BSEqualStrings();
  objc_msgSend(*(id *)(a1 + 56), "preferences");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "elementLayoutTransition");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "isTransitionFromCustom");

  if ((v21 & 1) != 0 || v18)
  {
    if (v18)
      v24 = 1.0;
    else
      v24 = 0.0;
    if (!v18)
      v16 = 1.0;
    objc_msgSend(v7, "setSnapshotViewBlurProgress:", v24);
    (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
    objc_msgSend(v7, "setSnapshotViewAlpha:", v16);
    (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
    v23 = CFSTR("defaultElementContentProvider.snapshotReason.transitionFromCustom");
    v22 = v7;
  }
  else
  {
    v22 = v7;
    v23 = 0;
  }
  objc_msgSend(v22, "setSnapshotReason:", v23);
  if (((v21 ^ 1 | v18) & 1) == 0)
    objc_msgSend(*(id *)(a1 + 64), "addObject:", CFSTR("defaultElementContentProvider.updateReason.snapshotRequired"));

}

- (id)_updatedElementDescriptionAssociatedWithElementContext:(id)a3 transitionDescriptions:(id)a4 context:(id)a5 updateReasons:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  SBSADefaultElementContentProvider *v14;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  uint64_t v24;
  uint64_t v25;
  uint64_t (*v26)();
  void *v27;
  id v28;
  _QWORD v29[4];
  id v30;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = self;
  objc_sync_enter(v14);
  if (v10)
  {
    -[NSMutableDictionary allValues](v14->_identifiersToElementDescriptions, "allValues");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = MEMORY[0x1E0C809B0];
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __137__SBSADefaultElementContentProvider__updatedElementDescriptionAssociatedWithElementContext_transitionDescriptions_context_updateReasons___block_invoke;
    v29[3] = &unk_1E8EA3810;
    v17 = v10;
    v30 = v17;
    objc_msgSend(v15, "bs_firstObjectPassingTest:", v29);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "elementSnapshotContexts");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v16;
    v25 = 3221225472;
    v26 = __137__SBSADefaultElementContentProvider__updatedElementDescriptionAssociatedWithElementContext_transitionDescriptions_context_updateReasons___block_invoke_2;
    v27 = &unk_1E8EA3770;
    v20 = v17;
    v28 = v20;
    objc_msgSend(v19, "bs_firstObjectPassingTest:", &v24);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    -[SBSADefaultElementContentProvider _updatedElementDescriptionFromDescription:associatedElementContext:associatedSnapshotContext:transitionDescriptions:context:updateReasons:](v14, "_updatedElementDescriptionFromDescription:associatedElementContext:associatedSnapshotContext:transitionDescriptions:context:updateReasons:", v18, v20, v21, v11, v12, v13, v24, v25, v26, v27);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v22 = 0;
  }
  objc_sync_exit(v14);

  return v22;
}

uint64_t __137__SBSADefaultElementContentProvider__updatedElementDescriptionAssociatedWithElementContext_transitionDescriptions_context_updateReasons___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "associatedSystemApertureElementIdentity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = SAElementIdentityEqualToIdentity();

  return v3;
}

uint64_t __137__SBSADefaultElementContentProvider__updatedElementDescriptionAssociatedWithElementContext_transitionDescriptions_context_updateReasons___block_invoke_2()
{
  return SAElementIdentityEqualToIdentity();
}

- (void)_pruneElementDescriptionWithIdentifier:(id)a3
{
  id v4;
  SBSADefaultElementContentProvider *v5;
  id v6;

  v4 = a3;
  if (v4)
  {
    v6 = v4;
    v5 = self;
    objc_sync_enter(v5);
    -[NSMutableDictionary removeObjectForKey:](v5->_identifiersToElementDescriptions, "removeObjectForKey:", v6);
    objc_sync_exit(v5);

    v4 = v6;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifiersToElementDescriptions, 0);
}

@end
