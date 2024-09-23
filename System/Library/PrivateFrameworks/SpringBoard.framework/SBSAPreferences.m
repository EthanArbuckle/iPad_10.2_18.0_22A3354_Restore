@implementation SBSAPreferences

- (void)finalizePreferencesForApplication:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  BOOL v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  self->_finalizedForApplication = 1;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  -[NSMutableDictionary allKeys](self->_interfaceElementPropertiesToBehaviorSettings, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v30 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i);
        -[SBSAPreferences _effectiveTransitionDescriptionForPropertyForProperty:addingMilestonesAndCreatingUniqueDescriptionIfIndirect:](self, "_effectiveTransitionDescriptionForPropertyForProperty:addingMilestonesAndCreatingUniqueDescriptionIfIndirect:", v10, 1);
        v11 = objc_claimAutoreleasedReturnValue();
        v12 = (void *)v11;
        if (v10)
          v13 = v11 == 0;
        else
          v13 = 1;
        if (!v13)
          -[NSMutableDictionary setObject:forKey:](self->_interfaceElementPropertiesToBehaviorSettings, "setObject:forKey:", v11, v10);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    }
    while (v7);
  }

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  -[SBSAPreferences containerViewDescriptions](self, "containerViewDescriptions", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v26;
    do
    {
      for (j = 0; j != v17; ++j)
      {
        if (*(_QWORD *)v26 != v18)
          objc_enumerationMutation(v15);
        v20 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * j);
        objc_msgSend(v4, "displayScale");
        v21 = (void *)objc_msgSend(v20, "copyByPixelAligningGeometryWithScale:");
        objc_msgSend(v14, "addObject:", v21);

      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
    }
    while (v17);
  }

  v22 = (void *)objc_msgSend(v14, "copy");
  -[SBSAPreferences _setContainerViewDescriptions:](self, "_setContainerViewDescriptions:", v22);

  -[SBSAPreferences containerParentViewDescription](self, "containerParentViewDescription");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "displayScale");
  v24 = (void *)objc_msgSend(v23, "copyByPixelAligningGeometryWithScale:");

  -[SBSAPreferences _setContainerParentViewDescription:](self, "_setContainerParentViewDescription:", v24);
}

- (BOOL)_doesUnanimatedTransitionDescriptionExistForProperty:(id)a3
{
  void *v3;
  void *v4;
  char v5;

  -[SBSAPreferences _effectiveTransitionDescriptionForPropertyForProperty:addingMilestonesAndCreatingUniqueDescriptionIfIndirect:](self, "_effectiveTransitionDescriptionForPropertyForProperty:addingMilestonesAndCreatingUniqueDescriptionIfIndirect:", a3, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "behaviorSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isUnanimated");

  return v5;
}

- (id)_effectiveTransitionDescriptionForPropertyForProperty:(id)a3 addingMilestonesAndCreatingUniqueDescriptionIfIndirect:(BOOL)a4
{
  _BOOL4 v4;
  id v7;
  void *v8;
  char v9;
  id v10;
  void *v11;
  char v12;
  id v13;
  uint64_t v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD v21[5];
  id v22;
  SEL v23;
  _QWORD v24[5];
  id v25;
  SEL v26;

  v4 = a4;
  v7 = a3;
  if (v7)
  {
    -[NSMutableDictionary objectForKey:](self->_interfaceElementPropertiesToBehaviorSettings, "objectForKey:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v9 = objc_opt_respondsToSelector();
      v10 = 0;
      if ((v9 & 1) != 0)
      {
        do
        {
          v11 = v10;
          v10 = v8;

          -[NSMutableDictionary objectForKey:](self->_interfaceElementPropertiesToBehaviorSettings, "objectForKey:", v10);
          v8 = (void *)objc_claimAutoreleasedReturnValue();

        }
        while ((objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector() & 1) != 0);
      }
      v12 = v9 ^ 1;
    }
    else
    {
      v10 = 0;
      v12 = 1;
    }
    v14 = objc_opt_class();
    v15 = v8;
    if (v14)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v16 = v15;
      else
        v16 = 0;
    }
    else
    {
      v16 = 0;
    }
    v13 = v16;

    if (v4)
    {
      v17 = MEMORY[0x1E0C809B0];
      if (!(v12 & 1 | (v13 == 0)))
      {
        v24[0] = MEMORY[0x1E0C809B0];
        v24[1] = 3221225472;
        v24[2] = __128__SBSAPreferences__effectiveTransitionDescriptionForPropertyForProperty_addingMilestonesAndCreatingUniqueDescriptionIfIndirect___block_invoke;
        v24[3] = &unk_1E8EA4230;
        v26 = a2;
        v24[4] = self;
        v25 = v10;
        v18 = objc_msgSend(v13, "copyWithBlock:", v24);

        v13 = (id)v18;
      }
      if (v13)
      {
        v21[0] = v17;
        v21[1] = 3221225472;
        v21[2] = __128__SBSAPreferences__effectiveTransitionDescriptionForPropertyForProperty_addingMilestonesAndCreatingUniqueDescriptionIfIndirect___block_invoke_2;
        v21[3] = &unk_1E8EA4230;
        v23 = a2;
        v21[4] = self;
        v22 = v7;
        v19 = objc_msgSend(v13, "copyWithBlock:", v21);

        v13 = (id)v19;
      }
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

void __128__SBSAPreferences__effectiveTransitionDescriptionForPropertyForProperty_addingMilestonesAndCreatingUniqueDescriptionIfIndirect___block_invoke_2(_QWORD *a1, void *a2)
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
    v8 = a1[6];
    v9 = a1[4];
    v10 = NSClassFromString(CFSTR("SBSAAnimatedTransitionDescriptionMutator"));
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", v8, v9, CFSTR("SBSAPreferences.m"), 259, CFSTR("Unexpected class – expected '%@', got '%@'"), v10, v12);

LABEL_9:
    v6 = 0;
  }

  objc_msgSend(*(id *)(a1[4] + 96), "objectForKey:", a1[5]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setMilestones:", v13);

}

- (id)copyWithZone:(_NSZone *)a3
{
  char *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;

  v4 = (char *)objc_alloc_init((Class)objc_opt_class());
  v5 = -[NSArray copy](self->_gestureDescriptions, "copy");
  v6 = (void *)*((_QWORD *)v4 + 8);
  *((_QWORD *)v4 + 8) = v5;

  v7 = -[NSArray copy](self->_timerDescriptions, "copy");
  v8 = (void *)*((_QWORD *)v4 + 9);
  *((_QWORD *)v4 + 9) = v7;

  v9 = -[NSArray copy](self->_actions, "copy");
  v10 = (void *)*((_QWORD *)v4 + 10);
  *((_QWORD *)v4 + 10) = v9;

  v11 = -[SBSAViewDescription copy](self->_containerParentViewDescription, "copy");
  v12 = (void *)*((_QWORD *)v4 + 3);
  *((_QWORD *)v4 + 3) = v11;

  v13 = -[NSArray copy](self->_containerViewDescriptions, "copy");
  v14 = (void *)*((_QWORD *)v4 + 2);
  *((_QWORD *)v4 + 2) = v13;

  v15 = -[NSArray copy](self->_elementDescriptions, "copy");
  v16 = (void *)*((_QWORD *)v4 + 4);
  *((_QWORD *)v4 + 4) = v15;

  v17 = -[SBSAElementLayoutTransition copy](self->_elementLayoutTransition, "copy");
  v18 = (void *)*((_QWORD *)v4 + 5);
  *((_QWORD *)v4 + 5) = v17;

  v19 = -[SBSAElementLayoutTransition copy](self->_lastChangingElementLayoutTransition, "copy");
  v20 = (void *)*((_QWORD *)v4 + 6);
  *((_QWORD *)v4 + 6) = v19;

  v21 = -[SBSABackgroundBlurDescription copy](self->_backgroundBlurDescription, "copy");
  v22 = (void *)*((_QWORD *)v4 + 7);
  *((_QWORD *)v4 + 7) = v21;

  v23 = *(_OWORD *)&self->_curtainRenderingConfiguration.renderingStyle;
  *((_QWORD *)v4 + 15) = *(_QWORD *)&self->_curtainRenderingConfiguration.alwaysRenderInSnapshots;
  *(_OWORD *)(v4 + 104) = v23;
  v24 = *(_OWORD *)&self->_highLevelCurtainRenderingConfiguration.renderingStyle;
  *((_QWORD *)v4 + 18) = *(_QWORD *)&self->_highLevelCurtainRenderingConfiguration.alwaysRenderInSnapshots;
  *((_OWORD *)v4 + 8) = v24;
  v4[9] = self->_blobEnabled;
  v4[10] = self->_collisionImminent;
  v25 = -[NSMutableDictionary mutableCopy](self->_interfaceElementPropertiesToBehaviorSettings, "mutableCopy");
  v26 = (void *)*((_QWORD *)v4 + 11);
  *((_QWORD *)v4 + 11) = v25;

  v27 = -[NSMutableDictionary mutableCopy](self->_interfaceElementPropertiesToMilestones, "mutableCopy");
  v28 = (void *)*((_QWORD *)v4 + 12);
  *((_QWORD *)v4 + 12) = v27;

  return v4;
}

- (id)effectiveMilestoneProvidingAnimatedTransitionDescriptionForProperty:(id)a3
{
  id v5;
  void *v6;
  void *v8;

  v5 = a3;
  if (!self->_finalizedForApplication)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSAPreferences.m"), 224, CFSTR("Preferences must be finalized before being applied; this method should only be used when applying preferences by the host"));

  }
  -[SBSAPreferences _effectiveTransitionDescriptionForPropertyForProperty:addingMilestonesAndCreatingUniqueDescriptionIfIndirect:](self, "_effectiveTransitionDescriptionForPropertyForProperty:addingMilestonesAndCreatingUniqueDescriptionIfIndirect:", v5, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSArray)propertiesWithAnimatedTransitionDescriptions
{
  return (NSArray *)-[NSMutableDictionary allKeys](self->_interfaceElementPropertiesToBehaviorSettings, "allKeys");
}

void __128__SBSAPreferences__effectiveTransitionDescriptionForPropertyForProperty_addingMilestonesAndCreatingUniqueDescriptionIfIndirect___block_invoke(uint64_t a1, void *a2)
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
  id v18;

  v18 = a2;
  if (!v18)
    goto LABEL_9;
  objc_opt_self();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v18;
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
    v10 = NSClassFromString(CFSTR("SBSAAnimatedTransitionDescriptionMutator"));
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", v8, v9, CFSTR("SBSAPreferences.m"), 252, CFSTR("Unexpected class – expected '%@', got '%@'"), v10, v12);

LABEL_9:
    v6 = 0;
  }

  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAnimatedTransitionIdentifier:", v13);

  v14 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(*(id *)(a1 + 40), "associatedInterfaceElementIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "interfaceElementProperty");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringWithFormat:", CFSTR("Associated with: %@-(%@)"), v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setResponsibleProviderDebugString:", v17);

}

- (void)_setContainerParentViewDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interfaceElementPropertiesToMilestones, 0);
  objc_storeStrong((id *)&self->_interfaceElementPropertiesToBehaviorSettings, 0);
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong((id *)&self->_timerDescriptions, 0);
  objc_storeStrong((id *)&self->_gestureDescriptions, 0);
  objc_storeStrong((id *)&self->_backgroundBlurDescription, 0);
  objc_storeStrong((id *)&self->_lastChangingElementLayoutTransition, 0);
  objc_storeStrong((id *)&self->_elementLayoutTransition, 0);
  objc_storeStrong((id *)&self->_elementDescriptions, 0);
  objc_storeStrong((id *)&self->_containerParentViewDescription, 0);
  objc_storeStrong((id *)&self->_containerViewDescriptions, 0);
}

- (NSMutableDictionary)_interfaceElementPropertiesToBehaviorSettings
{
  return self->_interfaceElementPropertiesToBehaviorSettings;
}

- (void)_setInterfaceElementPropertiesToBehaviorSettings:(id)a3
{
  objc_storeStrong((id *)&self->_interfaceElementPropertiesToBehaviorSettings, a3);
}

+ (id)instanceWithBlock:(id)a3
{
  id v3;
  id v4;
  void *v5;

  v3 = a3;
  v4 = objc_alloc_init((Class)objc_opt_class());
  v5 = (void *)objc_msgSend(v4, "copyWithBlock:", v3);

  return v5;
}

- (id)copyWithBlock:(id)a3
{
  void (**v5)(id, void *);
  void *v6;
  void *v7;
  void *v9;

  v5 = (void (**)(id, void *))a3;
  if (self->_finalizedForApplication)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSAPreferences.m"), 325, CFSTR("Attempting to copy/mutate finalized preferences."));

  }
  v6 = (void *)-[SBSAPreferences copy](self, "copy");
  if (v5)
  {
    v7 = (void *)objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "mutatorClass")), "initWithPreferences:", v6);
    v5[2](v5, v7);

  }
  return v6;
}

+ (Class)mutatorClass
{
  return (Class)objc_opt_class();
}

void __68__SBSAPreferences_Private__copyByUpdatingContainerViewDescriptions___block_invoke(_QWORD *a1, void *a2)
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
    v10 = NSClassFromString(CFSTR("SBSAPreferencesMutator"));
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", v8, v9, CFSTR("SBSAPreferences.m"), 295, CFSTR("Unexpected class – expected '%@', got '%@'"), v10, v12);

LABEL_9:
    v6 = 0;
  }

  objc_msgSend(v6, "setContainerViewDescriptions:", a1[5]);
}

- (void)_setContainerViewDescriptions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

void __68__SBSAPreferences_Private__copyByUpdatingBackgroundBlurDescription___block_invoke(_QWORD *a1, void *a2)
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
    v10 = NSClassFromString(CFSTR("SBSAPreferencesMutator"));
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", v8, v9, CFSTR("SBSAPreferences.m"), 309, CFSTR("Unexpected class – expected '%@', got '%@'"), v10, v12);

LABEL_9:
    v6 = 0;
  }

  objc_msgSend(v6, "setBackgroundBlurDescription:", a1[5]);
}

- (void)_setBackgroundBlurDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void)_setElementDescriptions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (id)effectiveAnimatedTransitionDescriptionForProperty:(id)a3
{
  return -[SBSAPreferences _effectiveTransitionDescriptionForPropertyForProperty:addingMilestonesAndCreatingUniqueDescriptionIfIndirect:](self, "_effectiveTransitionDescriptionForPropertyForProperty:addingMilestonesAndCreatingUniqueDescriptionIfIndirect:", a3, 0);
}

- (id)copyByUpdatingBackgroundBlurDescription:(id)a3
{
  id v5;
  id v6;
  id v7;
  _QWORD v9[5];
  id v10;
  SEL v11;

  v5 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __68__SBSAPreferences_Private__copyByUpdatingBackgroundBlurDescription___block_invoke;
  v9[3] = &unk_1E8EA4230;
  v10 = v5;
  v11 = a2;
  v9[4] = self;
  v6 = v5;
  v7 = -[SBSAPreferences copyWithBlock:](self, "copyWithBlock:", v9);

  return v7;
}

- (void)_setLastChangingElementLayoutTransition:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void)_setHighLevelCurtainRenderingConfiguration:(SBSystemApertureContainerRenderingConfiguration *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->renderingStyle;
  *(_QWORD *)&self->_highLevelCurtainRenderingConfiguration.alwaysRenderInSnapshots = *(_QWORD *)&a3->alwaysRenderInSnapshots;
  *(_OWORD *)&self->_highLevelCurtainRenderingConfiguration.renderingStyle = v3;
}

- (void)_setElementLayoutTransition:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void)_setCurtainRenderingConfiguration:(SBSystemApertureContainerRenderingConfiguration *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->renderingStyle;
  *(_QWORD *)&self->_curtainRenderingConfiguration.alwaysRenderInSnapshots = *(_QWORD *)&a3->alwaysRenderInSnapshots;
  *(_OWORD *)&self->_curtainRenderingConfiguration.renderingStyle = v3;
}

- (NSArray)actions
{
  return self->_actions;
}

- (SBSAViewDescription)containerParentViewDescription
{
  return self->_containerParentViewDescription;
}

- (NSArray)elementDescriptions
{
  return self->_elementDescriptions;
}

- (NSArray)timerDescriptions
{
  return self->_timerDescriptions;
}

- (SBSystemApertureContainerRenderingConfiguration)highLevelCurtainRenderingConfiguration
{
  *retstr = *(SBSystemApertureContainerRenderingConfiguration *)((char *)self + 128);
  return self;
}

- (NSArray)gestureDescriptions
{
  return self->_gestureDescriptions;
}

- (SBSystemApertureContainerRenderingConfiguration)curtainRenderingConfiguration
{
  *retstr = *(SBSystemApertureContainerRenderingConfiguration *)((char *)self + 104);
  return self;
}

- (SBSABackgroundBlurDescription)backgroundBlurDescription
{
  return self->_backgroundBlurDescription;
}

- (SBSAElementLayoutTransition)elementLayoutTransition
{
  return self->_elementLayoutTransition;
}

- (NSArray)containerViewDescriptions
{
  return self->_containerViewDescriptions;
}

- (id)copyByUpdatingContainerViewDescriptions:(id)a3
{
  id v5;
  id v6;
  id v7;
  _QWORD v9[5];
  id v10;
  SEL v11;

  v5 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __68__SBSAPreferences_Private__copyByUpdatingContainerViewDescriptions___block_invoke;
  v9[3] = &unk_1E8EA4230;
  v10 = v5;
  v11 = a2;
  v9[4] = self;
  v6 = v5;
  v7 = -[SBSAPreferences copyWithBlock:](self, "copyWithBlock:", v9);

  return v7;
}

- (SBSAElementLayoutTransition)lastChangingElementLayoutTransition
{
  return self->_lastChangingElementLayoutTransition;
}

- (BOOL)isBlobEnabled
{
  return self->_blobEnabled;
}

- (BOOL)isCollisionImminent
{
  return self->_collisionImminent;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  SBSAViewDescription *containerParentViewDescription;
  id v13;
  SBSAElementLayoutTransition *elementLayoutTransition;
  id v15;
  SBSAElementLayoutTransition *lastChangingElementLayoutTransition;
  id v17;
  void *v18;
  SBSABackgroundBlurDescription *backgroundBlurDescription;
  id v20;
  void *v21;
  _BOOL8 blobEnabled;
  id v23;
  void *v24;
  _BOOL8 collisionImminent;
  id v26;
  void *v27;
  NSMutableDictionary *interfaceElementPropertiesToBehaviorSettings;
  id v29;
  void *v30;
  NSMutableDictionary *interfaceElementPropertiesToMilestones;
  id v32;
  void *v33;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  _QWORD v45[4];
  id v46;
  _QWORD v47[4];
  id v48;
  _QWORD v49[4];
  id v50;
  _QWORD v51[4];
  id v52;
  _QWORD v53[4];
  id v54;
  _QWORD v55[4];
  id v56;
  _QWORD v57[4];
  id v58;
  _QWORD v59[4];
  id v60;
  _QWORD v61[4];
  id v62;
  SBSAPreferences *v63;
  _QWORD v64[4];
  id v65;
  SBSAPreferences *v66;
  _QWORD v67[4];
  id v68;
  SBSAPreferences *v69;
  _QWORD v70[4];
  id v71;
  SBSAPreferences *v72;
  _QWORD v73[4];
  id v74;
  SBSAPreferences *v75;
  _QWORD v76[4];
  id v77;
  SBSAPreferences *v78;
  _QWORD v79[4];
  id v80;
  SBSAPreferences *v81;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D01768], "builderWithObject:ofExpectedClass:", v4, objc_opt_class());
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v79[0] = MEMORY[0x1E0C809B0];
  v79[1] = 3221225472;
  v79[2] = __27__SBSAPreferences_isEqual___block_invoke;
  v79[3] = &unk_1E8E9EA50;
  v80 = v4;
  v81 = self;
  v76[0] = v5;
  v76[1] = 3221225472;
  v76[2] = __27__SBSAPreferences_isEqual___block_invoke_2;
  v76[3] = &unk_1E8E9EA50;
  v6 = v80;
  v77 = v6;
  v78 = self;
  v43 = (void *)MEMORY[0x1D17E5550](v76);
  v73[0] = v5;
  v73[1] = 3221225472;
  v73[2] = __27__SBSAPreferences_isEqual___block_invoke_3;
  v73[3] = &unk_1E8E9EA50;
  v7 = v6;
  v74 = v7;
  v75 = self;
  v42 = (void *)MEMORY[0x1D17E5550](v73);
  v70[0] = v5;
  v70[1] = 3221225472;
  v70[2] = __27__SBSAPreferences_isEqual___block_invoke_4;
  v70[3] = &unk_1E8E9EA50;
  v8 = v7;
  v71 = v8;
  v72 = self;
  v41 = (void *)MEMORY[0x1D17E5550](v70);
  v67[0] = v5;
  v67[1] = 3221225472;
  v67[2] = __27__SBSAPreferences_isEqual___block_invoke_5;
  v67[3] = &unk_1E8E9EA50;
  v9 = v8;
  v68 = v9;
  v69 = self;
  v40 = (void *)MEMORY[0x1D17E5550](v67);
  v64[0] = v5;
  v64[1] = 3221225472;
  v64[2] = __27__SBSAPreferences_isEqual___block_invoke_6;
  v64[3] = &unk_1E8E9EA50;
  v10 = v9;
  v65 = v10;
  v66 = self;
  v39 = (void *)MEMORY[0x1D17E5550](v64);
  v61[0] = v5;
  v61[1] = 3221225472;
  v61[2] = __27__SBSAPreferences_isEqual___block_invoke_7;
  v61[3] = &unk_1E8E9EA50;
  v11 = v10;
  v62 = v11;
  v63 = self;
  v38 = (void *)MEMORY[0x1D17E5550](v61);
  objc_msgSend(v44, "appendEqualsBlocks:", v79, v43, v42, v41, v40, v39, v38, 0);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  containerParentViewDescription = self->_containerParentViewDescription;
  v59[0] = v5;
  v59[1] = 3221225472;
  v59[2] = __27__SBSAPreferences_isEqual___block_invoke_8;
  v59[3] = &unk_1E8EA4320;
  v13 = v11;
  v60 = v13;
  objc_msgSend(v37, "appendObject:counterpart:", containerParentViewDescription, v59);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  elementLayoutTransition = self->_elementLayoutTransition;
  v57[0] = v5;
  v57[1] = 3221225472;
  v57[2] = __27__SBSAPreferences_isEqual___block_invoke_9;
  v57[3] = &unk_1E8EA4320;
  v15 = v13;
  v58 = v15;
  objc_msgSend(v36, "appendObject:counterpart:", elementLayoutTransition, v57);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  lastChangingElementLayoutTransition = self->_lastChangingElementLayoutTransition;
  v55[0] = v5;
  v55[1] = 3221225472;
  v55[2] = __27__SBSAPreferences_isEqual___block_invoke_10;
  v55[3] = &unk_1E8EA4320;
  v17 = v15;
  v56 = v17;
  objc_msgSend(v35, "appendObject:counterpart:", lastChangingElementLayoutTransition, v55);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  backgroundBlurDescription = self->_backgroundBlurDescription;
  v53[0] = v5;
  v53[1] = 3221225472;
  v53[2] = __27__SBSAPreferences_isEqual___block_invoke_11;
  v53[3] = &unk_1E8EA4320;
  v20 = v17;
  v54 = v20;
  objc_msgSend(v18, "appendObject:counterpart:", backgroundBlurDescription, v53);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  blobEnabled = self->_blobEnabled;
  v51[0] = v5;
  v51[1] = 3221225472;
  v51[2] = __27__SBSAPreferences_isEqual___block_invoke_12;
  v51[3] = &unk_1E8EA3E78;
  v23 = v20;
  v52 = v23;
  objc_msgSend(v21, "appendBool:counterpart:", blobEnabled, v51);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  collisionImminent = self->_collisionImminent;
  v49[0] = v5;
  v49[1] = 3221225472;
  v49[2] = __27__SBSAPreferences_isEqual___block_invoke_13;
  v49[3] = &unk_1E8EA3E78;
  v26 = v23;
  v50 = v26;
  objc_msgSend(v24, "appendBool:counterpart:", collisionImminent, v49);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  interfaceElementPropertiesToBehaviorSettings = self->_interfaceElementPropertiesToBehaviorSettings;
  v47[0] = v5;
  v47[1] = 3221225472;
  v47[2] = __27__SBSAPreferences_isEqual___block_invoke_14;
  v47[3] = &unk_1E8EA4320;
  v29 = v26;
  v48 = v29;
  objc_msgSend(v27, "appendObject:counterpart:", interfaceElementPropertiesToBehaviorSettings, v47);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  interfaceElementPropertiesToMilestones = self->_interfaceElementPropertiesToMilestones;
  v45[0] = v5;
  v45[1] = 3221225472;
  v45[2] = __27__SBSAPreferences_isEqual___block_invoke_15;
  v45[3] = &unk_1E8EA4320;
  v46 = v29;
  v32 = v29;
  objc_msgSend(v30, "appendObject:counterpart:", interfaceElementPropertiesToMilestones, v45);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v29) = objc_msgSend(v33, "isEqual");

  return (char)v29;
}

uint64_t __27__SBSAPreferences_isEqual___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;

  objc_msgSend(*(id *)(a1 + 32), "gestureDescriptions");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = BSEqualArrays();

  return v2;
}

uint64_t __27__SBSAPreferences_isEqual___block_invoke_2(uint64_t a1)
{
  void *v1;
  uint64_t v2;

  objc_msgSend(*(id *)(a1 + 32), "timerDescriptions");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = BSEqualArrays();

  return v2;
}

uint64_t __27__SBSAPreferences_isEqual___block_invoke_3(uint64_t a1)
{
  void *v1;
  uint64_t v2;

  objc_msgSend(*(id *)(a1 + 32), "actions");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = BSEqualArrays();

  return v2;
}

uint64_t __27__SBSAPreferences_isEqual___block_invoke_4(uint64_t a1)
{
  void *v1;
  uint64_t v2;

  objc_msgSend(*(id *)(a1 + 32), "containerViewDescriptions");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = BSEqualArrays();

  return v2;
}

uint64_t __27__SBSAPreferences_isEqual___block_invoke_5(uint64_t a1)
{
  void *v1;
  uint64_t v2;

  objc_msgSend(*(id *)(a1 + 32), "elementDescriptions");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = BSEqualArrays();

  return v2;
}

BOOL __27__SBSAPreferences_isEqual___block_invoke_6(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  __int128 v5;
  uint64_t v6;
  _QWORD v7[3];

  v2 = *(void **)(a1 + 32);
  if (v2)
    objc_msgSend(v2, "curtainRenderingConfiguration");
  else
    memset(v7, 0, sizeof(v7));
  v3 = *(_QWORD *)(a1 + 40);
  v5 = *(_OWORD *)(v3 + 104);
  v6 = *(_QWORD *)(v3 + 120);
  return SBSystemApertureContainerRenderingConfigurationEqualToConfiguration((uint64_t)v7, (uint64_t)&v5);
}

BOOL __27__SBSAPreferences_isEqual___block_invoke_7(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  __int128 v5;
  uint64_t v6;
  _QWORD v7[3];

  v2 = *(void **)(a1 + 32);
  if (v2)
    objc_msgSend(v2, "highLevelCurtainRenderingConfiguration");
  else
    memset(v7, 0, sizeof(v7));
  v3 = *(_QWORD *)(a1 + 40);
  v5 = *(_OWORD *)(v3 + 128);
  v6 = *(_QWORD *)(v3 + 144);
  return SBSystemApertureContainerRenderingConfigurationEqualToConfiguration((uint64_t)v7, (uint64_t)&v5);
}

uint64_t __27__SBSAPreferences_isEqual___block_invoke_8(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "containerParentViewDescription");
}

uint64_t __27__SBSAPreferences_isEqual___block_invoke_9(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "elementLayoutTransition");
}

uint64_t __27__SBSAPreferences_isEqual___block_invoke_10(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "lastChangingElementLayoutTransition");
}

uint64_t __27__SBSAPreferences_isEqual___block_invoke_11(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "backgroundBlurDescription");
}

uint64_t __27__SBSAPreferences_isEqual___block_invoke_12(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "isBlobEnabled");
}

uint64_t __27__SBSAPreferences_isEqual___block_invoke_13(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "isCollisionImminent");
}

id __27__SBSAPreferences_isEqual___block_invoke_14(uint64_t a1)
{
  return *(id *)(*(_QWORD *)(a1 + 32) + 88);
}

id __27__SBSAPreferences_isEqual___block_invoke_15(uint64_t a1)
{
  return *(id *)(*(_QWORD *)(a1 + 32) + 96);
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  objc_msgSend(MEMORY[0x1E0D01788], "builder");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "appendObject:", self->_gestureDescriptions);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "appendObject:", self->_timerDescriptions);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "appendObject:", self->_actions);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "appendObject:", self->_containerParentViewDescription);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "appendObject:", self->_containerViewDescriptions);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "appendObject:", self->_elementDescriptions);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "appendObject:", self->_elementLayoutTransition);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "appendObject:", self->_lastChangingElementLayoutTransition);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendObject:", self->_backgroundBlurDescription);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendInteger:", self->_curtainRenderingConfiguration.renderingStyle);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendInteger:", self->_curtainRenderingConfiguration.cloningStyle);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendInteger:", self->_highLevelCurtainRenderingConfiguration.renderingStyle);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendInteger:", self->_highLevelCurtainRenderingConfiguration.cloningStyle);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "appendBool:", self->_blobEnabled);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "appendBool:", self->_collisionImminent);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "appendObject:", self->_interfaceElementPropertiesToBehaviorSettings);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "appendObject:", self->_interfaceElementPropertiesToMilestones);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v12, "hash");

  return v14;
}

- (NSString)description
{
  void *v2;
  void *v3;

  -[SBSAPreferences dictionaryDescription](self, "dictionaryDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  SBSAStringFromDictionaryDescription(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (BSOrderedDictionary)dictionaryDescription
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  SBSAViewDescription *containerParentViewDescription;
  void *v13;
  SBSAElementLayoutTransition *elementLayoutTransition;
  void *v15;
  SBSAElementLayoutTransition *lastChangingElementLayoutTransition;
  void *v17;
  SBSABackgroundBlurDescription *backgroundBlurDescription;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  __int128 v25;
  uint64_t v26;

  v3 = objc_alloc(MEMORY[0x1E0D017C8]);
  objc_msgSend(MEMORY[0x1E0D017F0], "sortByInsertionOrder");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithKeyOrderingStrategy:", v4);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%p"), self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v6, v8);

  if (-[NSArray count](self->_gestureDescriptions, "count"))
  {
    -[NSArray description](self->_gestureDescriptions, "description");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v9, CFSTR("gestureDescriptions"));

  }
  if (-[NSArray count](self->_timerDescriptions, "count"))
  {
    -[NSArray description](self->_timerDescriptions, "description");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v10, CFSTR("timerDescriptions"));

  }
  if (-[NSArray count](self->_actions, "count"))
  {
    -[NSArray description](self->_actions, "description");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v11, CFSTR("actions"));

  }
  containerParentViewDescription = self->_containerParentViewDescription;
  if (containerParentViewDescription)
  {
    -[SBSAViewDescription description](containerParentViewDescription, "description");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v13, CFSTR("containerParentViewDescription"));

  }
  if (-[NSArray count](self->_containerViewDescriptions, "count"))
    objc_msgSend(v5, "setObject:forKey:", self->_containerViewDescriptions, CFSTR("containerViewDescriptions"));
  if (-[NSArray count](self->_elementDescriptions, "count"))
    objc_msgSend(v5, "setObject:forKey:", self->_elementDescriptions, CFSTR("elementDescriptions"));
  elementLayoutTransition = self->_elementLayoutTransition;
  if (elementLayoutTransition)
  {
    -[SBSAElementLayoutTransition description](elementLayoutTransition, "description");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v15, CFSTR("elementLayoutTransition"));

  }
  lastChangingElementLayoutTransition = self->_lastChangingElementLayoutTransition;
  if (lastChangingElementLayoutTransition)
  {
    -[SBSAElementLayoutTransition description](lastChangingElementLayoutTransition, "description");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v17, CFSTR("lastChangingElementLayoutTransition"));

  }
  backgroundBlurDescription = self->_backgroundBlurDescription;
  if (backgroundBlurDescription)
  {
    -[SBSABackgroundBlurDescription description](backgroundBlurDescription, "description");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v19, CFSTR("backgroundBlurDescription"));

  }
  v25 = *(_OWORD *)&self->_curtainRenderingConfiguration.renderingStyle;
  v26 = *(_QWORD *)&self->_curtainRenderingConfiguration.alwaysRenderInSnapshots;
  SBStringFromSystemApertureContainerRenderingConfiguration(&v25);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v20, CFSTR("curtainRenderingConfiguration"));

  v25 = *(_OWORD *)&self->_highLevelCurtainRenderingConfiguration.renderingStyle;
  v26 = *(_QWORD *)&self->_highLevelCurtainRenderingConfiguration.alwaysRenderInSnapshots;
  SBStringFromSystemApertureContainerRenderingConfiguration(&v25);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v21, CFSTR("highLevelCurtainRenderingConfiguration"));

  NSStringFromBOOL();
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v22, CFSTR("blobEnabled"));

  NSStringFromBOOL();
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v23, CFSTR("collisionImminent"));

  if (-[NSMutableDictionary count](self->_interfaceElementPropertiesToBehaviorSettings, "count"))
    objc_msgSend(v5, "setObject:forKey:", self->_interfaceElementPropertiesToBehaviorSettings, CFSTR("interfaceElementPropertiesToBehaviorSettings"));
  if (-[NSMutableDictionary count](self->_interfaceElementPropertiesToMilestones, "count"))
    objc_msgSend(v5, "setObject:forKey:", self->_interfaceElementPropertiesToMilestones, CFSTR("interfaceElementPropertiesToMilestones"));
  return (BSOrderedDictionary *)v5;
}

- (void)_setBlobEnabled:(BOOL)a3
{
  self->_blobEnabled = a3;
}

- (void)_setCollisionImminent:(BOOL)a3
{
  self->_collisionImminent = a3;
}

- (void)_setGestureDescriptions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void)_setTimerDescriptions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void)_setActions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSMutableDictionary)_interfaceElementPropertiesToMilestones
{
  return self->_interfaceElementPropertiesToMilestones;
}

- (void)_setInterfaceElementPropertiesToMilestones:(id)a3
{
  objc_storeStrong((id *)&self->_interfaceElementPropertiesToMilestones, a3);
}

- (id)copyByAddingActions:(id)a3
{
  id v5;
  SBSAPreferences *v6;
  _QWORD v8[5];
  id v9;
  SEL v10;

  v5 = a3;
  if (objc_msgSend(v5, "count"))
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __48__SBSAPreferences_Private__copyByAddingActions___block_invoke;
    v8[3] = &unk_1E8EA4230;
    v10 = a2;
    v8[4] = self;
    v9 = v5;
    v6 = -[SBSAPreferences copyWithBlock:](self, "copyWithBlock:", v8);

  }
  else
  {
    v6 = self;
  }

  return v6;
}

void __48__SBSAPreferences_Private__copyByAddingActions___block_invoke(uint64_t a1, void *a2)
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
  id v17;

  v3 = a2;
  v17 = v3;
  if (!v3)
    goto LABEL_9;
  objc_opt_self();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v17;
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

  v3 = v17;
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
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", v9, v10, CFSTR("SBSAPreferences.m"), 276, CFSTR("Unexpected class – expected '%@', got '%@'"), v11, v13);

    v3 = v17;
LABEL_9:
    v7 = 0;
  }

  objc_msgSend(v7, "actions");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    objc_msgSend(*(id *)(a1 + 40), "bs_differenceWithArray:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "arrayByAddingObjectsFromArray:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setActions:", v16);

  }
  else
  {
    objc_msgSend(v7, "setActions:", *(_QWORD *)(a1 + 40));
  }

}

- (id)copyWithCancellationOfGestureOfClass:(Class)a3 context:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  SBSAPreferences *v14;
  _QWORD v16[5];
  id v17;
  SEL v18;

  v7 = a4;
  -[NSArray bs_firstObjectOfClass:](self->_gestureDescriptions, "bs_firstObjectOfClass:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    goto LABEL_6;
  objc_msgSend(v7, "gestureDescriptions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bs_firstObjectOfClass:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  v12 = v10 ? v10 : objc_alloc_init(a3);
  v8 = v12;

  if (v8)
  {
LABEL_6:
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __73__SBSAPreferences_Private__copyWithCancellationOfGestureOfClass_context___block_invoke;
    v16[3] = &unk_1E8EA4230;
    v17 = v8;
    v18 = a2;
    v16[4] = self;
    v13 = v8;
    v14 = -[SBSAPreferences copyWithBlock:](self, "copyWithBlock:", v16);

  }
  else
  {
    v14 = self;
  }

  return v14;
}

void __73__SBSAPreferences_Private__copyWithCancellationOfGestureOfClass_context___block_invoke(_QWORD *a1, void *a2)
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
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  _QWORD v23[6];

  v3 = a2;
  v22 = v3;
  if (!v3)
    goto LABEL_9;
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
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", v9, v10, CFSTR("SBSAPreferences.m"), 285, CFSTR("Unexpected class – expected '%@', got '%@'"), v11, v13);

    v3 = v22;
LABEL_9:
    v7 = 0;
  }

  objc_msgSend(v7, "gestureDescriptions");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
    v16 = v14;
  else
    v16 = objc_alloc_init(MEMORY[0x1E0C99D20]);
  v17 = v16;

  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __73__SBSAPreferences_Private__copyWithCancellationOfGestureOfClass_context___block_invoke_2;
  v23[3] = &unk_1E8E9E9D0;
  v18 = (void *)a1[5];
  v19 = a1[6];
  v23[4] = a1[4];
  v23[5] = v19;
  v20 = (void *)objc_msgSend(v18, "copyWithBlock:", v23);
  objc_msgSend(v17, "sbsa_arrayByAddingOrReplacingObjectMatchingClass:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setGestureDescriptions:", v21);

}

void __73__SBSAPreferences_Private__copyWithCancellationOfGestureOfClass_context___block_invoke_2(uint64_t a1, void *a2)
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
    v11 = NSClassFromString(CFSTR("SBSAGestureDescriptionMutator"));
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", v9, v8, CFSTR("SBSAPreferences.m"), 288, CFSTR("Unexpected class – expected '%@', got '%@'"), v11, v13);

LABEL_9:
    v6 = 0;
  }

  objc_msgSend(v6, "setGestureRecognizerState:", 4);
}

- (id)copyByUpdatingElementDescriptions:(id)a3
{
  id v5;
  id v6;
  id v7;
  _QWORD v9[5];
  id v10;
  SEL v11;

  v5 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __62__SBSAPreferences_Private__copyByUpdatingElementDescriptions___block_invoke;
  v9[3] = &unk_1E8EA4230;
  v10 = v5;
  v11 = a2;
  v9[4] = self;
  v6 = v5;
  v7 = -[SBSAPreferences copyWithBlock:](self, "copyWithBlock:", v9);

  return v7;
}

void __62__SBSAPreferences_Private__copyByUpdatingElementDescriptions___block_invoke(_QWORD *a1, void *a2)
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
    v10 = NSClassFromString(CFSTR("SBSAPreferencesMutator"));
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", v8, v9, CFSTR("SBSAPreferences.m"), 302, CFSTR("Unexpected class – expected '%@', got '%@'"), v10, v12);

LABEL_9:
    v6 = 0;
  }

  objc_msgSend(v6, "setElementDescriptions:", a1[5]);
}

- (id)animatedTransitionDescriptionForProperty:(id)a3
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  id v7;

  if (a3)
  {
    -[NSMutableDictionary objectForKey:](self->_interfaceElementPropertiesToBehaviorSettings, "objectForKey:");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_opt_class();
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

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

@end
