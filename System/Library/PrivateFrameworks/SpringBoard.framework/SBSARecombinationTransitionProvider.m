@implementation SBSARecombinationTransitionProvider

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
  id v16;
  void *v17;
  id v18;
  void *v19;
  Class v20;
  objc_class *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  id v27;
  void *v28;
  id v29;
  objc_super v31;
  _QWORD v32[6];

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
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSARecombinationTransitionProvider.m"), 21, CFSTR("Unexpected class – expected '%@', got '%@'"), v11, v13);

LABEL_9:
    v9 = 0;
  }

  objc_msgSend(v9, "preferences");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v14)
  {
LABEL_18:
    v18 = 0;
    goto LABEL_19;
  }
  objc_opt_self();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
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

  if (!v18)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = NSClassFromString(CFSTR("SBSAPreferences"));
    v21 = (objc_class *)objc_opt_class();
    NSStringFromClass(v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSARecombinationTransitionProvider.m"), 22, CFSTR("Unexpected class – expected '%@', got '%@'"), v20, v22);

    goto LABEL_18;
  }
LABEL_19:

  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __62__SBSARecombinationTransitionProvider_preferencesFromContext___block_invoke;
  v32[3] = &unk_1E8E9E9D0;
  v32[4] = self;
  v32[5] = a2;
  v23 = (void *)objc_msgSend(v18, "copyWithBlock:", v32);

  v24 = (void *)objc_msgSend(v9, "copyByUpdatingPreferences:", v23);
  v31.receiver = self;
  v31.super_class = (Class)SBSARecombinationTransitionProvider;
  -[SBSABasePreferencesProvider preferencesFromContext:](&v31, sel_preferencesFromContext_, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_opt_class();
  v27 = v25;
  if (v26)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v28 = v27;
    else
      v28 = 0;
  }
  else
  {
    v28 = 0;
  }
  v29 = v28;

  return v29;
}

void __62__SBSARecombinationTransitionProvider_preferencesFromContext___block_invoke(uint64_t a1, void *a2)
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
  unint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  SBSAInterfaceElementPropertyIdentity *v23;
  void *v24;
  SBSAInterfaceElementPropertyIdentity *v25;
  SBSAInterfaceElementPropertyIdentity *v26;
  void *v27;
  SBSAInterfaceElementPropertyIdentity *v28;
  id v29;

  v2 = a2;
  v29 = v2;
  if (!v2)
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

  v2 = v29;
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
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", v8, v9, CFSTR("SBSARecombinationTransitionProvider.m"), 24, CFSTR("Unexpected class – expected '%@', got '%@'"), v10, v12);

    v2 = v29;
LABEL_9:
    v6 = 0;
  }

  objc_msgSend(v6, "setBlobEnabled:", 1);
  objc_msgSend(v6, "containerViewDescriptions");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "count"))
  {
    v14 = 0;
    do
    {
      if (v14)
      {
        objc_msgSend(v13, "objectAtIndex:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)objc_opt_class(), "settings");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "inertInterfaceElementTransitionSettings");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "boundsBehaviorSettings");
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend((id)objc_opt_class(), "settings");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "recombinationSecondaryBoundsYSettings");
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        v21 = (void *)objc_msgSend((id)objc_opt_class(), "newAnimatedTransitionDescriptionWithBehaviorSettings:", v18);
        v22 = (void *)objc_msgSend(v21, "copyBySettingAuxillaryBehaviorSettings:forKeyPath:", v20, CFSTR("size.height"));

        v23 = [SBSAInterfaceElementPropertyIdentity alloc];
        objc_msgSend(v15, "interfaceElementIdentifier");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = -[SBSAInterfaceElementPropertyIdentity initWithAssociatedInterfaceElementIdentifier:andProperty:](v23, "initWithAssociatedInterfaceElementIdentifier:andProperty:", v24, CFSTR("bounds"));

        objc_msgSend(v6, "setAnimatedTransitionDescription:forProperty:withMilestones:", v22, v25, 0);
        v26 = [SBSAInterfaceElementPropertyIdentity alloc];
        objc_msgSend(v15, "interfaceElementIdentifier");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = -[SBSAInterfaceElementPropertyIdentity initWithAssociatedInterfaceElementIdentifier:andProperty:](v26, "initWithAssociatedInterfaceElementIdentifier:andProperty:", v27, CFSTR("contentBounds"));

        objc_msgSend(v6, "associateAnimatedTransitionDescriptionOfProperty:withProperty:withMilestones:", v25, v28, 0);
      }
      ++v14;
    }
    while (v14 < objc_msgSend(v13, "count"));
  }

}

@end
