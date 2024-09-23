@implementation SBSAPopTransitionProvider

- (id)preferencesFromContext:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  unint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v24;
  _QWORD v26[5];
  id v27;
  SEL v28;
  objc_super v29;

  v4 = a3;
  v5 = objc_opt_class();
  v6 = v4;
  if (v5)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;
  }
  else
  {
    v7 = 0;
  }
  v8 = v7;

  objc_msgSend(v8, "elementContexts");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v29.receiver = self;
  v29.super_class = (Class)SBSAPopTransitionProvider;
  -[SBSABasePreferencesProvider preferencesFromContext:](&v29, sel_preferencesFromContext_, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_opt_class();
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
  v24 = v6;
  v14 = v13;

  objc_msgSend(v14, "containerViewDescriptions");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v15, "mutableCopy");

  if (objc_msgSend(v9, "count"))
  {
    v17 = 0;
    v18 = MEMORY[0x1E0C809B0];
    do
    {
      if (objc_msgSend(v16, "count") <= v17)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSAPopTransitionProvider.m"), 25, CFSTR("No container view description at index '%lu': %@"), v17, v16);

      }
      objc_msgSend(v16, "objectAtIndexedSubscript:", v17);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v26[0] = v18;
      v26[1] = 3221225472;
      v26[2] = __52__SBSAPopTransitionProvider_preferencesFromContext___block_invoke;
      v26[3] = &unk_1E8EA4230;
      v27 = v19;
      v28 = a2;
      v26[4] = self;
      v20 = v19;
      v21 = (void *)objc_msgSend(v14, "copyWithBlock:", v26);

      ++v17;
      v14 = v21;
    }
    while (v17 < objc_msgSend(v9, "count"));
  }
  else
  {
    v21 = v14;
  }

  return v21;
}

void __52__SBSAPopTransitionProvider_preferencesFromContext___block_invoke(uint64_t a1, void *a2)
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
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  SBSAInterfaceElementPropertyIdentity *v19;
  void *v20;
  SBSAInterfaceElementPropertyIdentity *v21;
  id v22;
  SBSAInterfaceElementPropertyIdentity *v23;
  void *v24;
  SBSAInterfaceElementPropertyIdentity *v25;
  id v26;
  id v27;

  v27 = a2;
  if (!v27)
    goto LABEL_9;
  objc_opt_self();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v27;
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
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", v8, v9, CFSTR("SBSAPopTransitionProvider.m"), 28, CFSTR("Unexpected class – expected '%@', got '%@'"), v10, v12);

LABEL_9:
    v6 = 0;
  }

  objc_msgSend((id)objc_opt_class(), "settings");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "popToCustomInterfaceElementTransitionSettings");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "centerBehaviorSettings");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "settings");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "popToCustomInterfaceElementTransitionSettings");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "boundsBehaviorSettings");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = [SBSAInterfaceElementPropertyIdentity alloc];
  objc_msgSend(*(id *)(a1 + 40), "interfaceElementIdentifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = -[SBSAInterfaceElementPropertyIdentity initWithAssociatedInterfaceElementIdentifier:andProperty:](v19, "initWithAssociatedInterfaceElementIdentifier:andProperty:", v20, CFSTR("bounds"));

  v22 = +[SBSABasePreferencesProvider newAnimatedTransitionDescriptionWithBehaviorSettings:](SBSABasePreferencesProvider, "newAnimatedTransitionDescriptionWithBehaviorSettings:", v15);
  objc_msgSend(v6, "setAnimatedTransitionDescription:forProperty:withMilestones:", v22, v21, 0);

  v23 = [SBSAInterfaceElementPropertyIdentity alloc];
  objc_msgSend(*(id *)(a1 + 40), "interfaceElementIdentifier");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = -[SBSAInterfaceElementPropertyIdentity initWithAssociatedInterfaceElementIdentifier:andProperty:](v23, "initWithAssociatedInterfaceElementIdentifier:andProperty:", v24, CFSTR("center"));

  v26 = +[SBSABasePreferencesProvider newAnimatedTransitionDescriptionWithBehaviorSettings:](SBSABasePreferencesProvider, "newAnimatedTransitionDescriptionWithBehaviorSettings:", v18);
  objc_msgSend(v6, "setAnimatedTransitionDescription:forProperty:withMilestones:", v26, v25, 0);

}

@end
