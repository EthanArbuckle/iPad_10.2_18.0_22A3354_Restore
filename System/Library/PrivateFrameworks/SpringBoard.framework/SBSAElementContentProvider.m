@implementation SBSAElementContentProvider

void __53__SBSAElementContentProvider_preferencesFromContext___block_invoke(uint64_t a1, void *a2)
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
  uint64_t v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
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
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", v9, v10, CFSTR("SBSAElementContentProvider.m"), 118, CFSTR("Unexpected class – expected '%@', got '%@'"), v11, v13);

LABEL_9:
    v7 = 0;
  }
  v25 = v3;

  objc_msgSend(v7, "setElementDescriptions:", *(_QWORD *)(a1 + 40));
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v14 = *(id *)(a1 + 48);
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v27 != v17)
          objc_enumerationMutation(v14);
        v19 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i);
        objc_msgSend(*(id *)(a1 + 48), "objectForKey:", v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_opt_class();
        v22 = v20;
        if (v21)
        {
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v23 = v22;
          else
            v23 = 0;
        }
        else
        {
          v23 = 0;
        }
        v24 = v23;

        if (v24)
          objc_msgSend(v7, "associateAnimatedTransitionDescriptionOfProperty:withProperty:withMilestones:", v24, v19, 0);
        else
          objc_msgSend(v7, "setAnimatedTransitionDescription:forProperty:withMilestones:", v22, v19, 0);

      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v16);
  }

}

- (id)preferencesFromContext:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  int v21;
  id v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  BOOL v26;
  uint64_t v27;
  uint64_t j;
  uint64_t v29;
  SBSAElementLayoutTransition *staticLayoutTransition;
  void *v31;
  void *v32;
  double v33;
  id v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  id v41;
  void *v42;
  id v43;
  id v44;
  void *v46;
  Class v47;
  objc_class *v48;
  void *v49;
  void *v50;
  Class v51;
  objc_class *v52;
  void *v53;
  void *v54;
  void *v56;
  id v57;
  id v58;
  _QWORD v59[5];
  id v60;
  SEL v61;
  objc_super v62;
  _QWORD v63[5];
  id v64;
  id v65;
  SEL v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  _BYTE v75[128];
  _BYTE v76[128];
  uint64_t v77;

  v77 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    objc_opt_self();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
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

    if (!v8)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = NSClassFromString(CFSTR("SBSAContext"));
      v48 = (objc_class *)objc_opt_class();
      NSStringFromClass(v48);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSAElementContentProvider.m"), 96, CFSTR("Unexpected class – expected '%@', got '%@'"), v47, v49);

    }
  }
  else
  {
    v8 = 0;
  }
  v58 = v8;

  objc_msgSend(v8, "preferences");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = v4;
  if (v9)
  {
    objc_opt_self();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v9;
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

    if (!v13)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = NSClassFromString(CFSTR("SBSAPreferences"));
      v52 = (objc_class *)objc_opt_class();
      NSStringFromClass(v52);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSAElementContentProvider.m"), 97, CFSTR("Unexpected class – expected '%@', got '%@'"), v51, v53, v54);

    }
  }
  else
  {
    v13 = 0;
  }

  v56 = v13;
  if (self->_pendingSensorObscuringShadowProperty)
  {
    -[SBSAElementContentProvider _sensorObscuringShadowApexMilestone](self, "_sensorObscuringShadowApexMilestone");
    v71 = 0u;
    v72 = 0u;
    v73 = 0u;
    v74 = 0u;
    objc_msgSend(v8, "animatedTransitionResults");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v71, v76, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v72;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v72 != v17)
            objc_enumerationMutation(v14);
          v19 = *(void **)(*((_QWORD *)&v71 + 1) + 8 * i);
          objc_msgSend(v19, "associatedInterfaceElementPropertyIdentity");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          if (BSEqualObjects())
          {
            objc_msgSend(v19, "targetedMilestone");
            v21 = BSFloatApproximatelyEqualToFloat();

            if (v21)
              self->_sensorObscuringShadowDisappearingIfTransitioning = 1;
          }
          else
          {

          }
        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v71, v76, 16);
      }
      while (v16);
    }

    v13 = v56;
  }
  v22 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v57 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v67 = 0u;
  v68 = 0u;
  v69 = 0u;
  v70 = 0u;
  objc_msgSend(v13, "elementDescriptions");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v67, v75, 16);
  if (!v24)
  {
    v26 = 0;
    goto LABEL_48;
  }
  v25 = v24;
  v26 = 0;
  v27 = *(_QWORD *)v68;
  do
  {
    for (j = 0; j != v25; ++j)
    {
      if (*(_QWORD *)v68 != v27)
        objc_enumerationMutation(v23);
      v29 = *(_QWORD *)(*((_QWORD *)&v67 + 1) + 8 * j);
      staticLayoutTransition = self->_staticLayoutTransition;
      if (staticLayoutTransition)
      {
        -[SBSAElementContentProvider _updatedElementDescriptionFromDescription:layoutTransition:transitionDescriptions:context:](self, "_updatedElementDescriptionFromDescription:layoutTransition:transitionDescriptions:context:", *(_QWORD *)(*((_QWORD *)&v67 + 1) + 8 * j), staticLayoutTransition, v22, v8);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v31)
          goto LABEL_44;
      }
      else
      {
        objc_msgSend(v56, "elementLayoutTransition");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        -[SBSAElementContentProvider _updatedElementDescriptionFromDescription:layoutTransition:transitionDescriptions:context:](self, "_updatedElementDescriptionFromDescription:layoutTransition:transitionDescriptions:context:", v29, v32, v22, v58);
        v31 = (void *)objc_claimAutoreleasedReturnValue();

        v8 = v58;
        if (!v31)
          goto LABEL_44;
      }
      objc_msgSend(v57, "addObject:", v31);
      if (v26)
      {
        v26 = 1;
      }
      else
      {
        objc_msgSend(v31, "sensorObscuringShadowProgress");
        v26 = v33 > 0.0;
      }
LABEL_44:

    }
    v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v67, v75, 16);
  }
  while (v25);
LABEL_48:

  v63[0] = MEMORY[0x1E0C809B0];
  v63[1] = 3221225472;
  v63[2] = __53__SBSAElementContentProvider_preferencesFromContext___block_invoke;
  v63[3] = &unk_1E8EA3798;
  v66 = a2;
  v63[4] = self;
  v34 = v57;
  v64 = v34;
  v35 = v22;
  v65 = v35;
  v36 = (void *)MEMORY[0x1D17E5550](v63);
  if (v56)
  {
    v37 = (void *)objc_msgSend(v56, "copyWithBlock:", v36);

  }
  else
  {
    +[SBSAPreferences instanceWithBlock:](SBSAPreferences, "instanceWithBlock:", v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v38 = (void *)objc_msgSend(v8, "copyByUpdatingPreferences:", v37);

  v62.receiver = self;
  v62.super_class = (Class)SBSAElementContentProvider;
  -[SBSABasePreferencesProvider preferencesFromContext:](&v62, sel_preferencesFromContext_, v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = objc_opt_class();
  v41 = v39;
  if (v40)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v42 = v41;
    else
      v42 = 0;
  }
  else
  {
    v42 = 0;
  }
  v43 = v42;

  if (v26)
  {
    v59[0] = MEMORY[0x1E0C809B0];
    v59[1] = 3221225472;
    v59[2] = __53__SBSAElementContentProvider_preferencesFromContext___block_invoke_2;
    v59[3] = &unk_1E8EA4230;
    v60 = v43;
    v61 = a2;
    v59[4] = self;
    v43 = (id)objc_msgSend(v43, "copyWithBlock:", v59);

  }
  v44 = v43;

  return v44;
}

- (double)_sensorObscuringShadowApexMilestone
{
  void *v2;
  double v3;
  double v4;

  objc_msgSend((id)objc_opt_class(), "settings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sensorObscuringShadowApexProgress");
  v4 = v3;

  return v4;
}

- (id)_initWithParentProvider:(id)a3 transitionDirection:(int64_t)a4 staticLayoutTransition:(id)a5
{
  id v8;
  SBSAElementContentProvider *v9;
  SBSAElementContentProvider *v10;
  uint64_t v11;
  SBSAElementLayoutTransition *staticLayoutTransition;
  objc_super v14;

  v8 = a5;
  v14.receiver = self;
  v14.super_class = (Class)SBSAElementContentProvider;
  v9 = -[SBSABasePreferencesProvider initWithParentProvider:](&v14, sel_initWithParentProvider_, a3);
  v10 = v9;
  if (v9)
  {
    v9->_transitionDirection = a4;
    v11 = objc_msgSend(v8, "copy");
    staticLayoutTransition = v10->_staticLayoutTransition;
    v10->_staticLayoutTransition = (SBSAElementLayoutTransition *)v11;

  }
  return v10;
}

+ (id)disappearanceTransitionElementContentProviderWithParentProvider:(id)a3 staticLayoutTransition:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "_initWithParentProvider:transitionDirection:staticLayoutTransition:", v6, -1, v5);

  return v7;
}

+ (id)appearanceTransitionElementContentProviderWithParentProvider:(id)a3 staticLayoutTransition:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "_initWithParentProvider:transitionDirection:staticLayoutTransition:", v6, 1, v5);

  return v7;
}

- (SBSAElementContentProvider)initWithParentProvider:(id)a3
{
  return (SBSAElementContentProvider *)-[SBSAElementContentProvider _initWithParentProvider:transitionDirection:staticLayoutTransition:](self, "_initWithParentProvider:transitionDirection:staticLayoutTransition:", a3, 0, 0);
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

- (id)description
{
  void *v3;
  uint64_t v4;
  unint64_t v5;
  const __CFString *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  v5 = self->_transitionDirection + 1;
  if (v5 > 2)
    v6 = CFSTR("[invalid]");
  else
    v6 = off_1E8EA96B0[v5];
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; transitionDirection: %@; staticLayoutTransition: %@>"),
               v4,
               self,
               v6,
               self->_staticLayoutTransition);
}

void __53__SBSAElementContentProvider_preferencesFromContext___block_invoke_2(uint64_t a1, void *a2)
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
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;

  v24 = a2;
  if (!v24)
    goto LABEL_9;
  objc_opt_self();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v24;
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
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", v8, v9, CFSTR("SBSAElementContentProvider.m"), 135, CFSTR("Unexpected class – expected '%@', got '%@'"), v10, v12);

LABEL_9:
    v6 = 0;
  }

  v13 = [SBSAInterfaceElementPropertyIdentity alloc];
  objc_msgSend(*(id *)(a1 + 40), "containerViewDescriptions");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "firstObject");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "interfaceElementIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[SBSAInterfaceElementPropertyIdentity initWithAssociatedInterfaceElementIdentifier:andProperty:](v13, "initWithAssociatedInterfaceElementIdentifier:andProperty:", v16, CFSTR("bounds"));
  v18 = *(_QWORD *)(a1 + 32);
  v19 = *(void **)(v18 + 40);
  *(_QWORD *)(v18 + 40) = v17;

  v20 = (void *)MEMORY[0x1E0C99E60];
  v21 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 32), "_sensorObscuringShadowApexMilestone");
  objc_msgSend(v21, "numberWithDouble:");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setWithObject:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addMilestones:forPropertyIdentity:", v23, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40));

}

- (id)_updatedElementDescriptionFromDescription:(id)a3 layoutTransition:(id)a4 transitionDescriptions:(id)a5 context:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  id v26;
  void *v28;
  _QWORD v29[5];
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  SEL v37;
  _QWORD v38[5];
  id v39;
  _QWORD v40[4];
  id v41;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = v14;
  if (v11)
  {
    objc_msgSend(v14, "preferences");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "associatedSystemApertureElementIdentity");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "elementContexts");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v12;
    v19 = MEMORY[0x1E0C809B0];
    v40[0] = MEMORY[0x1E0C809B0];
    v40[1] = 3221225472;
    v40[2] = __120__SBSAElementContentProvider__updatedElementDescriptionFromDescription_layoutTransition_transitionDescriptions_context___block_invoke;
    v40[3] = &unk_1E8EA3748;
    v20 = v16;
    v41 = v20;
    objc_msgSend(v17, "bs_firstObjectPassingTest:", v40);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v38[0] = v19;
    v38[1] = 3221225472;
    v38[2] = __120__SBSAElementContentProvider__updatedElementDescriptionFromDescription_layoutTransition_transitionDescriptions_context___block_invoke_2;
    v38[3] = &unk_1E8EA37C0;
    v38[4] = self;
    v39 = v13;
    v22 = (void *)MEMORY[0x1D17E5550](v38);
    v29[0] = v19;
    v12 = v18;
    v29[1] = 3221225472;
    v29[2] = __120__SBSAElementContentProvider__updatedElementDescriptionFromDescription_layoutTransition_transitionDescriptions_context___block_invoke_3;
    v29[3] = &unk_1E8EA9690;
    v37 = a2;
    v29[4] = self;
    v30 = v18;
    v31 = v20;
    v32 = v28;
    v33 = v11;
    v34 = v15;
    v35 = v21;
    v36 = v22;
    v23 = v22;
    v24 = v21;
    v25 = v28;
    v26 = v20;
    v11 = (id)objc_msgSend(v11, "copyWithBlock:", v29);

  }
  return v11;
}

uint64_t __120__SBSAElementContentProvider__updatedElementDescriptionFromDescription_layoutTransition_transitionDescriptions_context___block_invoke()
{
  return SAElementIdentityEqualToIdentity();
}

void __120__SBSAElementContentProvider__updatedElementDescriptionFromDescription_layoutTransition_transitionDescriptions_context___block_invoke_2(uint64_t a1, void *a2, void *a3, uint64_t a4)
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

void __120__SBSAElementContentProvider__updatedElementDescriptionFromDescription_layoutTransition_transitionDescriptions_context___block_invoke_3(uint64_t a1, void *a2)
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
  int v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  int v20;
  void *v21;
  int v22;
  unsigned int v23;
  unsigned int v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  double v33;
  int v34;
  int v35;
  double v36;
  _BOOL4 v37;
  int v38;
  int v39;
  double v40;
  double v41;
  double v42;
  _BOOL4 v43;
  double v44;
  double v45;
  int v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  void *v52;
  void *v53;
  id v54;
  _QWORD v55[4];
  id v56;

  v3 = a2;
  v54 = v3;
  if (v3)
  {
    objc_opt_self();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v54;
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

    v3 = v54;
    if (v7)
      goto LABEL_10;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(a1 + 96);
    v10 = *(_QWORD *)(a1 + 32);
    v11 = NSClassFromString(CFSTR("SBSAElementDescriptionMutator"));
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", v9, v10, CFSTR("SBSAElementContentProvider.m"), 178, CFSTR("Unexpected class – expected '%@', got '%@'"), v11, v13);

    v3 = v54;
  }
  v7 = 0;
LABEL_10:

  objc_msgSend(*(id *)(a1 + 40), "initialElementContexts");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v55[0] = MEMORY[0x1E0C809B0];
  v55[1] = 3221225472;
  v55[2] = __120__SBSAElementContentProvider__updatedElementDescriptionFromDescription_layoutTransition_transitionDescriptions_context___block_invoke_4;
  v55[3] = &unk_1E8EA3748;
  v56 = *(id *)(a1 + 48);
  objc_msgSend(v14, "bs_firstObjectPassingTest:", v55);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(*(id *)(a1 + 56), "isCollisionImminent");
  objc_msgSend(*(id *)(a1 + 64), "associatedSystemApertureElementIdentity");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 72), "containerViewDescriptions");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  SBSAObjectInCollectionAssociatedWithElementIdentity(v16, v17, 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "bounds");
  objc_msgSend(v18, "center");
  SBUnintegralizedRectCenteredAboutPoint();
  objc_msgSend(*(id *)(a1 + 72), "inertContainerFrame");
  v19 = SBSARectApproximatelyEqualToRect();
  if (*(_QWORD *)(a1 + 80))
    v20 = v19;
  else
    v20 = 1;
  objc_msgSend(*(id *)(a1 + 56), "lastChangingElementLayoutTransition", 0x3F847AE147AE147BLL);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "elementWithIdentityWasOrIsSensorAttached:", *(_QWORD *)(a1 + 48));

  if (v14)
    v23 = 2;
  else
    v23 = 1;
  if (v14)
    v24 = 3;
  else
    v24 = 0;
  if (v20)
    v25 = v24;
  else
    v25 = v23;
  v26 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48);
  if (!v26)
    goto LABEL_30;
  if (v26 == -1)
    v27 = v15;
  else
    v27 = 0;
  v28 = 1;
  if ((v25 - 1) >= 2)
    v28 = -1;
  if ((v27 & 1) != 0 || v26 == v28)
  {
LABEL_30:
    v29 = *(void **)(a1 + 80);
    if (v29)
      v30 = objc_msgSend(v29, "layoutMode");
    else
      v30 = 0;
    if (v53)
      v31 = objc_msgSend(v53, "layoutMode");
    else
      v31 = 0;
    v52 = v14;
    objc_msgSend(v7, "interfaceElementIdentifier");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAppearState:", v25);
    v33 = 0.0;
    if (v22 && (!v30 || v31 != v30) && !*(_BYTE *)(*(_QWORD *)(a1 + 32) + 32))
      v33 = 1.0;
    objc_msgSend(v7, "setSensorObscuringShadowProgress:", v33);
    (*(void (**)(void))(*(_QWORD *)(a1 + 88) + 16))();
    if (v30 == 3)
      v34 = v15;
    else
      v34 = 1;
    if (v30 < 3)
      v35 = 1;
    else
      v35 = v15;
    if (v35)
      v36 = 1.0;
    else
      v36 = 0.0;
    v37 = v30 == 2;
    if (v30 < 2)
      v38 = 1;
    else
      v38 = v15;
    v39 = v37 & ~v15;
    if (v39)
      v40 = 0.0;
    else
      v40 = 1.0;
    if ((v37 & ~v15) != 0)
      v41 = 1.0;
    else
      v41 = 0.0;
    if ((v37 & ~v15) != 0)
      v42 = 0.0;
    else
      v42 = v36;
    objc_msgSend(v7, "setLeadingViewBlurProgress:", v40, v36);
    (*(void (**)(void))(*(_QWORD *)(a1 + 88) + 16))();
    objc_msgSend(v7, "setLeadingViewAlpha:", v41);
    (*(void (**)(void))(*(_QWORD *)(a1 + 88) + 16))();
    objc_msgSend(v7, "setLeadingViewSquishProgress:", v42);
    (*(void (**)(void))(*(_QWORD *)(a1 + 88) + 16))();
    v43 = (objc_msgSend(*(id *)(a1 + 80), "systemApertureLayoutCustomizingOptions") & 2) == 0;
    if ((v39 & v43) != 0)
      v44 = 0.0;
    else
      v44 = 1.0;
    if ((v39 & v43) != 0)
      v45 = 1.0;
    else
      v45 = 0.0;
    objc_msgSend(v7, "setTrailingViewBlurProgress:", v44);
    (*(void (**)(void))(*(_QWORD *)(a1 + 88) + 16))();
    objc_msgSend(v7, "setTrailingViewAlpha:", v45);
    (*(void (**)(void))(*(_QWORD *)(a1 + 88) + 16))();
    objc_msgSend(v7, "setTrailingViewSquishProgress:", v42);
    (*(void (**)(void))(*(_QWORD *)(a1 + 88) + 16))();
    if (v30 == 1)
      v46 = v15;
    else
      v46 = 1;
    if (v46)
      v47 = 1.0;
    else
      v47 = 0.0;
    if (v46)
      v48 = 0.0;
    else
      v48 = 1.0;
    objc_msgSend(v7, "setMinimalViewBlurProgress:", v47);
    (*(void (**)(void))(*(_QWORD *)(a1 + 88) + 16))();
    objc_msgSend(v7, "setMinimalViewAlpha:", v48);
    (*(void (**)(void))(*(_QWORD *)(a1 + 88) + 16))();
    if ((v46 & v22 & v38) != 0)
      v49 = 1.0;
    else
      v49 = 0.0;
    objc_msgSend(v7, "setMinimalViewSquishProgress:", v49);
    (*(void (**)(void))(*(_QWORD *)(a1 + 88) + 16))();
    v14 = v52;
    if (v34)
      v50 = 1.0;
    else
      v50 = 0.0;
    if (v34)
      v51 = 0.0;
    else
      v51 = 1.0;
    objc_msgSend(v7, "setCustomContentBlurProgress:", v50);
    (*(void (**)(void))(*(_QWORD *)(a1 + 88) + 16))();
    objc_msgSend(v7, "setCustomContentAlpha:", v51);
    (*(void (**)(void))(*(_QWORD *)(a1 + 88) + 16))();

  }
}

uint64_t __120__SBSAElementContentProvider__updatedElementDescriptionFromDescription_layoutTransition_transitionDescriptions_context___block_invoke_4()
{
  return SAElementIdentityEqualToIdentity();
}

- (int64_t)transitionDirection
{
  return self->_transitionDirection;
}

- (SBSAElementLayoutTransition)staticLayoutTransition
{
  return self->_staticLayoutTransition;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_staticLayoutTransition, 0);
  objc_storeStrong((id *)&self->_pendingSensorObscuringShadowProperty, 0);
}

@end
