@implementation SBSAContainerDynamicsBumpAnimationProvider

- (id)preferencesFromContext:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  unint64_t v16;
  uint64_t v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  char v23;
  NSArray *elementIdentitiesWithBumpApplied;
  void *v25;
  uint64_t v26;
  NSArray *v27;
  NSArray *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  id v33;
  void *v34;
  id v35;
  id v37;
  void *v38;
  void *v39;
  objc_super v41;
  _QWORD v42[5];
  id v43;
  SEL v44;
  char v45;
  _QWORD v46[5];
  id v47;
  id v48;
  SEL v49;

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

  objc_msgSend(v8, "preferences");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_opt_class();
  v11 = v9;
  v37 = v6;
  if (v10)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v12 = v11;
    else
      v12 = 0;
  }
  else
  {
    v12 = 0;
  }
  v13 = v12;

  objc_msgSend(v13, "containerViewDescriptions");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v14, "mutableCopy");

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v15, "count"))
  {
    v16 = 0;
    v17 = MEMORY[0x1E0C809B0];
    do
    {
      objc_msgSend(v15, "objectAtIndexedSubscript:", v16, v37);
      v18 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "elementContexts");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      SBSAElementContextAssociatedWithContainerViewDescription(v18, v19, 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      v21 = v20;
      if (objc_msgSend(v20, "activeDynamicAnimation") == 1)
      {
        objc_msgSend(v18, "associatedSystemApertureElementIdentity");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "addObject:", v22);

        v46[0] = v17;
        v46[1] = 3221225472;
        v46[2] = __69__SBSAContainerDynamicsBumpAnimationProvider_preferencesFromContext___block_invoke;
        v46[3] = &unk_1E8EA3798;
        v49 = a2;
        v46[4] = self;
        v47 = v18;
        v48 = v8;
        v18 = (id)objc_msgSend(v18, "copyWithBlock:", v46);
        objc_msgSend(v15, "replaceObjectAtIndex:withObject:", v16, v18);

        v23 = 0;
      }
      else
      {
        elementIdentitiesWithBumpApplied = self->_elementIdentitiesWithBumpApplied;
        objc_msgSend(v18, "associatedSystemApertureElementIdentity");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(elementIdentitiesWithBumpApplied) = -[NSArray containsObject:](elementIdentitiesWithBumpApplied, "containsObject:", v25);

        if (!(_DWORD)elementIdentitiesWithBumpApplied)
        {
          v17 = MEMORY[0x1E0C809B0];
          goto LABEL_19;
        }
        v23 = 1;
        v17 = MEMORY[0x1E0C809B0];
      }
      v42[0] = v17;
      v42[1] = 3221225472;
      v42[2] = __69__SBSAContainerDynamicsBumpAnimationProvider_preferencesFromContext___block_invoke_2;
      v42[3] = &unk_1E8EAFB30;
      v44 = a2;
      v42[4] = self;
      v45 = v23;
      v18 = v18;
      v43 = v18;
      v26 = objc_msgSend(v13, "copyWithBlock:", v42);

      v13 = (id)v26;
LABEL_19:

      ++v16;
    }
    while (v16 < objc_msgSend(v15, "count"));
  }
  v27 = (NSArray *)objc_msgSend(v39, "copy", v37);
  v28 = self->_elementIdentitiesWithBumpApplied;
  self->_elementIdentitiesWithBumpApplied = v27;

  v29 = (void *)objc_msgSend(v13, "copyByUpdatingContainerViewDescriptions:", v15);
  v30 = (void *)objc_msgSend(v8, "copyByUpdatingPreferences:", v29);

  v41.receiver = self;
  v41.super_class = (Class)SBSAContainerDynamicsBumpAnimationProvider;
  -[SBSABasePreferencesProvider preferencesFromContext:](&v41, sel_preferencesFromContext_, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_opt_class();
  v33 = v31;
  if (v32)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v34 = v33;
    else
      v34 = 0;
  }
  else
  {
    v34 = 0;
  }
  v35 = v34;

  if (!objc_msgSend(v39, "count"))
    -[SBSABasePreferencesProvider removeFromParentProvider](self, "removeFromParentProvider");

  return v35;
}

void __69__SBSAContainerDynamicsBumpAnimationProvider_preferencesFromContext___block_invoke(uint64_t a1, void *a2)
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
  double v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  CGFloat v28;
  void *v29;
  CGFloat v30;
  double v31;
  double v32;

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
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", v9, v10, CFSTR("SBSAContainerDynamicsBumpAnimationProvider.m"), 49, CFSTR("Unexpected class – expected '%@', got '%@'"), v11, v13);

LABEL_9:
    v7 = 0;
  }

  v31 = 0.0;
  v32 = 0.0;
  objc_msgSend(*(id *)(a1 + 40), "bounds");
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;
  objc_msgSend(*(id *)(a1 + 40), "center");
  v23 = v22;
  v25 = v24;
  objc_msgSend((id)objc_opt_class(), "settings");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "bumpAnimationXScale");
  v28 = v27;
  objc_msgSend((id)objc_opt_class(), "settings");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "bumpAnimationYScale");
  SBSAScaledAndClippedFrameByScalingDimensions(&v31, *(void **)(a1 + 48), v15, v17, v19, v21, v23, v25, v28, v30);

  BSRectWithSize();
  objc_msgSend(v7, "setBounds:");
  UIRectGetCenter();
  objc_msgSend(v7, "setCenter:");
  objc_msgSend(v7, "setContentScale:", v31, v32);
  objc_msgSend(*(id *)(a1 + 40), "bounds");
  objc_msgSend(v7, "setContentBounds:");
  UIRectGetCenter();
  objc_msgSend(v7, "setContentCenter:");

}

void __69__SBSAContainerDynamicsBumpAnimationProvider_preferencesFromContext___block_invoke_2(uint64_t a1, void *a2)
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
  int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  SBSAInterfaceElementPropertyIdentity *v19;
  void *v20;
  SBSAInterfaceElementPropertyIdentity *v21;
  SBSAInterfaceElementPropertyIdentity *v22;
  void *v23;
  SBSAInterfaceElementPropertyIdentity *v24;
  SBSAInterfaceElementPropertyIdentity *v25;
  void *v26;
  SBSAInterfaceElementPropertyIdentity *v27;
  SBSAInterfaceElementPropertyIdentity *v28;
  void *v29;
  SBSAInterfaceElementPropertyIdentity *v30;
  SBSAInterfaceElementPropertyIdentity *v31;
  void *v32;
  SBSAInterfaceElementPropertyIdentity *v33;
  id v34;

  v3 = a2;
  v34 = v3;
  if (!v3)
    goto LABEL_9;
  objc_opt_self();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v34;
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

  v3 = v34;
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
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", v9, v10, CFSTR("SBSAContainerDynamicsBumpAnimationProvider.m"), 64, CFSTR("Unexpected class – expected '%@', got '%@'"), v11, v13);

    v3 = v34;
LABEL_9:
    v7 = 0;
  }

  v14 = *(unsigned __int8 *)(a1 + 56);
  objc_msgSend((id)objc_opt_class(), "settings");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v14)
    objc_msgSend(v15, "bumpAnimationScaleDownSettings");
  else
    objc_msgSend(v15, "bumpAnimationScaleUpSettings");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = (void *)objc_msgSend((id)objc_opt_class(), "newAnimatedTransitionDescriptionWithBehaviorSettings:", v17);
  v19 = [SBSAInterfaceElementPropertyIdentity alloc];
  objc_msgSend(*(id *)(a1 + 40), "interfaceElementIdentifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = -[SBSAInterfaceElementPropertyIdentity initWithAssociatedInterfaceElementIdentifier:andProperty:](v19, "initWithAssociatedInterfaceElementIdentifier:andProperty:", v20, CFSTR("bounds"));

  objc_msgSend(v7, "setAnimatedTransitionDescription:forProperty:withMilestones:", v18, v21, 0);
  v22 = [SBSAInterfaceElementPropertyIdentity alloc];
  objc_msgSend(*(id *)(a1 + 40), "interfaceElementIdentifier");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = -[SBSAInterfaceElementPropertyIdentity initWithAssociatedInterfaceElementIdentifier:andProperty:](v22, "initWithAssociatedInterfaceElementIdentifier:andProperty:", v23, CFSTR("center"));
  objc_msgSend(v7, "associateAnimatedTransitionDescriptionOfProperty:withProperty:withMilestones:", v21, v24, 0);

  v25 = [SBSAInterfaceElementPropertyIdentity alloc];
  objc_msgSend(*(id *)(a1 + 40), "interfaceElementIdentifier");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = -[SBSAInterfaceElementPropertyIdentity initWithAssociatedInterfaceElementIdentifier:andProperty:](v25, "initWithAssociatedInterfaceElementIdentifier:andProperty:", v26, CFSTR("contentScale"));
  objc_msgSend(v7, "associateAnimatedTransitionDescriptionOfProperty:withProperty:withMilestones:", v21, v27, 0);

  v28 = [SBSAInterfaceElementPropertyIdentity alloc];
  objc_msgSend(*(id *)(a1 + 40), "interfaceElementIdentifier");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = -[SBSAInterfaceElementPropertyIdentity initWithAssociatedInterfaceElementIdentifier:andProperty:](v28, "initWithAssociatedInterfaceElementIdentifier:andProperty:", v29, CFSTR("contentBounds"));
  objc_msgSend(v7, "associateAnimatedTransitionDescriptionOfProperty:withProperty:withMilestones:", v21, v30, 0);

  v31 = [SBSAInterfaceElementPropertyIdentity alloc];
  objc_msgSend(*(id *)(a1 + 40), "interfaceElementIdentifier");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = -[SBSAInterfaceElementPropertyIdentity initWithAssociatedInterfaceElementIdentifier:andProperty:](v31, "initWithAssociatedInterfaceElementIdentifier:andProperty:", v32, CFSTR("contentCenter"));
  objc_msgSend(v7, "associateAnimatedTransitionDescriptionOfProperty:withProperty:withMilestones:", v21, v33, 0);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_elementIdentitiesWithBumpApplied, 0);
}

@end
