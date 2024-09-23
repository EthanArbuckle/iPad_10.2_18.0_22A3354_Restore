@implementation SBSARootPreferencesProvider

void __54__SBSARootPreferencesProvider_preferencesFromContext___block_invoke(_QWORD *a1, void *a2)
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
  SBSAElementLayoutTransition *v14;
  id v15;

  v3 = a2;
  v15 = v3;
  if (v3)
  {
    objc_opt_self();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v15;
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

    v3 = v15;
    if (v7)
      goto LABEL_10;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = a1[6];
    v10 = a1[4];
    v11 = NSClassFromString(CFSTR("SBSAPreferencesMutator"));
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", v9, v10, CFSTR("SBSARootPreferencesProvider.m"), 87, CFSTR("Unexpected class – expected '%@', got '%@'"), v11, v13);

    v3 = v15;
  }
  v7 = 0;
LABEL_10:

  v14 = -[SBSAElementLayoutTransition initWithInitialElementContexts:targetElementContext:]([SBSAElementLayoutTransition alloc], "initWithInitialElementContexts:targetElementContext:", *(_QWORD *)(a1[4] + 40), a1[5]);
  objc_msgSend(v7, "setElementLayoutTransition:", v14);
  if (-[SBSAElementLayoutTransition isLayoutChange](v14, "isLayoutChange"))
    objc_storeStrong((id *)(a1[4] + 48), v14);
  objc_msgSend(v7, "setLastChangingElementLayoutTransition:", *(_QWORD *)(a1[4] + 48));

}

- (id)preferencesFromContext:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  SBSARootPreferencesProvider *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  SBSARootPreferencesProvider *v22;
  uint64_t v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  NSArray *v28;
  void *v29;
  void *v30;
  NSArray *previouslyVisibleElements;
  NSArray *v32;
  void *v33;
  void *v34;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  const char *v40;
  objc_super v41;
  _QWORD v42[5];
  NSArray *v43;
  SEL v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  _QWORD v50[13];

  v50[11] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = v5;
  if (!self->_configuredInitialStack)
  {
    v39 = v5;
    v40 = a2;
    objc_opt_self();
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v50[0] = v38;
    objc_opt_self();
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v50[1] = v37;
    objc_opt_self();
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v50[2] = v36;
    objc_opt_self();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v50[3] = v7;
    objc_opt_self();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v50[4] = v8;
    objc_opt_self();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v50[5] = v9;
    objc_opt_self();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v50[6] = v10;
    objc_opt_self();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v50[7] = v11;
    objc_opt_self();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v50[8] = v12;
    objc_opt_self();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v50[9] = v13;
    objc_opt_self();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v50[10] = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v50, 11);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = self;
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    v17 = v15;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v46;
      do
      {
        v21 = 0;
        v22 = v16;
        do
        {
          if (*(_QWORD *)v46 != v20)
            objc_enumerationMutation(v17);
          v16 = (SBSARootPreferencesProvider *)objc_msgSend(objc_alloc(*(Class *)(*((_QWORD *)&v45 + 1) + 8 * v21)), "initWithParentProvider:", v22);

          ++v21;
          v22 = v16;
        }
        while (v19 != v21);
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
      }
      while (v19);
    }

    self->_configuredInitialStack = 1;
    v6 = v39;
    a2 = v40;
  }
  v23 = objc_opt_class();
  v24 = v6;
  if (v23)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v25 = v24;
    else
      v25 = 0;
  }
  else
  {
    v25 = 0;
  }
  v26 = v25;

  if (v26)
  {
    objc_msgSend(v26, "elementContexts");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v42[0] = MEMORY[0x1E0C809B0];
    v42[1] = 3221225472;
    v42[2] = __54__SBSARootPreferencesProvider_preferencesFromContext___block_invoke;
    v42[3] = &unk_1E8EA4230;
    v44 = a2;
    v42[4] = self;
    v28 = v27;
    v43 = v28;
    +[SBSAPreferences instanceWithBlock:](SBSAPreferences, "instanceWithBlock:", v42);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = (void *)objc_msgSend(v26, "copyByUpdatingPreferences:", v29);

    previouslyVisibleElements = self->_previouslyVisibleElements;
    self->_previouslyVisibleElements = v28;
    v32 = v28;

    -[SBSARootPreferencesProvider _updateDynamicsSessionProviders:](self, "_updateDynamicsSessionProviders:", v32);
    objc_msgSend(v30, "requests");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBSARootPreferencesProvider _handleRequests:](self, "_handleRequests:", v33);

  }
  else
  {
    v30 = 0;
  }
  v41.receiver = self;
  v41.super_class = (Class)SBSARootPreferencesProvider;
  -[SBSABasePreferencesProvider preferencesFromContext:](&v41, sel_preferencesFromContext_, v30);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "finalizePreferencesForApplication:", v30);

  return v34;
}

- (void)_updateDynamicsSessionProviders:(id)a3
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  char v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  SBSAContainerDynamicsBumpAnimationProvider *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  SBSAContainerDynamicsInflateAnimationProvider *v24;
  void *v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = 0;
    v10 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v28 != v10)
          objc_enumerationMutation(v5);
        v12 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        if (objc_msgSend(v12, "activeDynamicAnimation") == 1)
          v9 = 1;
        else
          v8 |= objc_msgSend(v12, "activeDynamicAnimation") == 2;
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v7);
    if ((v9 & 1) != 0)
    {
      objc_opt_self();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBSABasePreferencesProvider firstChildPreferenceProviderOfClass:](self, "firstChildPreferenceProviderOfClass:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v14)
      {
        objc_opt_self();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[SBSABasePreferencesProvider firstChildPreferenceProviderOfClass:](self, "firstChildPreferenceProviderOfClass:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "parentProvider");
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v17)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSARootPreferencesProvider.m"), 190, CFSTR("Couldn't find parent of pruning provider while attempting to add dynamics provider."));

        }
        v18 = objc_alloc_init(SBSAContainerDynamicsBumpAnimationProvider);
        objc_msgSend(v17, "setChildProvider:", v18);

      }
    }
    if ((v8 & 1) != 0)
    {
      objc_opt_self();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBSABasePreferencesProvider firstChildPreferenceProviderOfClass:](self, "firstChildPreferenceProviderOfClass:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v20)
      {
        objc_opt_self();
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[SBSABasePreferencesProvider firstChildPreferenceProviderOfClass:](self, "firstChildPreferenceProviderOfClass:", v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "parentProvider");
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v23)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSARootPreferencesProvider.m"), 195, CFSTR("Couldn't find parent of pruning provider while attempting to add dynamics provider."));

        }
        v24 = objc_alloc_init(SBSAContainerDynamicsInflateAnimationProvider);
        objc_msgSend(v23, "setChildProvider:", v24);

      }
    }
  }

}

- (void)_handleRequests:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  BOOL v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  BOOL v19;
  uint64_t v20;
  id v21;
  id v22;
  id v23;
  BOOL v24;
  uint64_t v25;
  id v26;
  void *v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v30;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v30 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v8);
        v10 = objc_opt_class();
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

        v14 = -[SBSARootPreferencesProvider _handleShakeRequest:](self, "_handleShakeRequest:", v13);
        if (!v14)
        {
          v15 = objc_opt_class();
          v16 = v11;
          if (v15)
            v17 = (objc_opt_isKindOfClass() & 1) != 0 ? v16 : 0;
          else
            v17 = 0;
          v18 = v17;

          v19 = -[SBSARootPreferencesProvider _handleBounceRequest:](self, "_handleBounceRequest:", v18);
          if (!v19)
          {
            v20 = objc_opt_class();
            v21 = v16;
            if (v20)
              v22 = (objc_opt_isKindOfClass() & 1) != 0 ? v21 : 0;
            else
              v22 = 0;
            v23 = v22;

            v24 = -[SBSARootPreferencesProvider _handleEjectRequest:](self, "_handleEjectRequest:", v23);
            if (!v24)
            {
              v25 = objc_opt_class();
              v26 = v21;
              if (v25)
              {
                if ((objc_opt_isKindOfClass() & 1) != 0)
                  v27 = v26;
                else
                  v27 = 0;
              }
              else
              {
                v27 = 0;
              }
              v28 = v27;

              -[SBSARootPreferencesProvider _handlePulseRequest:](self, "_handlePulseRequest:", v28);
            }
          }
        }
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    }
    while (v6);
  }

}

- (SBSARootPreferencesProvider)initWithParentProvider:(id)a3
{
  void *v6;
  objc_super v7;

  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSARootPreferencesProvider.m"), 51, CFSTR("This is a root provider class"));

  }
  v7.receiver = self;
  v7.super_class = (Class)SBSARootPreferencesProvider;
  return -[SBSABasePreferencesProvider initWithParentProvider:](&v7, sel_initWithParentProvider_, 0);
}

- (void)removeFromParentProvider
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSARootPreferencesProvider.m"), 58, CFSTR("This is a root provider class"));

}

- (BOOL)_handleShakeRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  SBSAShakeBehaviorProvider *v7;
  void *v8;
  SBSAShakeBehaviorProvider *v9;

  v4 = a3;
  if (v4)
  {
    objc_opt_self();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBSABasePreferencesProvider firstChildPreferenceProviderOfClass:](self, "firstChildPreferenceProviderOfClass:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      v7 = [SBSAShakeBehaviorProvider alloc];
      objc_msgSend(v4, "participantIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[SBSASequencedBehaviorProvider initWithParticipantIdentifier:](v7, "initWithParticipantIdentifier:", v8);

      -[SBSABasePreferencesProvider setChildProvider:](self, "setChildProvider:", v9);
    }
  }

  return v4 != 0;
}

- (BOOL)_handleBounceRequest:(id)a3
{
  id v6;
  SBSAAcceptanceBounceBehaviorProvider *v7;
  uint64_t v8;
  void *v9;
  SBSAAcceptanceBounceBehaviorProvider *v10;
  void *v11;
  void *v12;
  void *v14;

  if (a3)
  {
    v6 = a3;
    v7 = [SBSAAcceptanceBounceBehaviorProvider alloc];
    v8 = objc_msgSend(v6, "style");
    objc_msgSend(v6, "triggeredBlock");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = -[SBSAAcceptanceBounceBehaviorProvider initWithParticipantIdentifier:style:triggeredBlock:](v7, "initWithParticipantIdentifier:style:triggeredBlock:", 0, v8, v9);
    objc_opt_self();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBSABasePreferencesProvider firstChildPreferenceProviderOfClass:](self, "firstChildPreferenceProviderOfClass:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSARootPreferencesProvider.m"), 125, CFSTR("Couldn't find default container layout provider"));

    }
    objc_msgSend(v12, "setChildProvider:", v10);

  }
  return a3 != 0;
}

- (BOOL)_handleEjectRequest:(id)a3
{
  SBSAEjectStretchBehaviorProvider *v6;
  void *v7;
  void *v8;
  void *v10;

  if (a3)
  {
    v6 = objc_alloc_init(SBSAEjectStretchBehaviorProvider);
    objc_opt_self();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBSABasePreferencesProvider firstChildPreferenceProviderOfClass:](self, "firstChildPreferenceProviderOfClass:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSARootPreferencesProvider.m"), 137, CFSTR("Couldn't find default container layout provider"));

    }
    objc_msgSend(v8, "setChildProvider:", v6);

  }
  return a3 != 0;
}

- (BOOL)_handlePulseRequest:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  SBSAContainerDynamicsPulseAnimationProvider *v8;
  void *v9;
  SBSAContainerDynamicsPulseAnimationProvider *v10;
  void *v11;
  void *v12;
  void *v14;

  v5 = a3;
  if (v5)
  {
    objc_opt_self();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBSABasePreferencesProvider firstChildPreferenceProviderOfClass:](self, "firstChildPreferenceProviderOfClass:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(v7, "didRequestAdditionalPulse:", v5);
    }
    else
    {
      v8 = [SBSAContainerDynamicsPulseAnimationProvider alloc];
      objc_msgSend(v5, "participantIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[SBSAContainerDynamicsPulseAnimationProvider initWithElementIdentity:pulseStyle:](v8, "initWithElementIdentity:pulseStyle:", v9, objc_msgSend(v5, "pulseStyle"));

      objc_opt_self();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBSABasePreferencesProvider firstChildPreferenceProviderOfClass:](self, "firstChildPreferenceProviderOfClass:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v12)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSARootPreferencesProvider.m"), 153, CFSTR("Couldn't find default container layout provider"));

      }
      objc_msgSend(v12, "setChildProvider:", v10);

    }
  }

  return v5 != 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastChangingElementLayoutTransition, 0);
  objc_storeStrong((id *)&self->_previouslyVisibleElements, 0);
}

@end
