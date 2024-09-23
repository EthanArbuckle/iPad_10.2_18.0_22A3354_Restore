@implementation SBWorkspaceApplicationSceneTransitionContext

- (void)setPreviousEntity:(id)a3 forLayoutRole:(int64_t)a4
{
  void *v7;
  id v8;
  void *v9;
  id v10;

  v10 = a3;
  SBLayoutRoleIdentifierForRole(a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBWorkspaceTransitionContext setPreviousEntity:forKey:](self, "setPreviousEntity:forKey:", v10, v7);
  -[SBWorkspaceTransitionContext previousEntityForKey:](self, "previousEntityForKey:", v7);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    if (v8 == v10)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBWorkspaceApplicationSceneTransitionContext.m"), 233, CFSTR("this entity is supposed to be a copy"));

    }
    objc_msgSend(v8, "setLayoutRole:", a4);
    if (objc_msgSend(v8, "isApplicationSceneEntity"))
      objc_msgSend(v8, "clearProcessSettings");
  }

}

- (id)previousEntityForLayoutRole:(int64_t)a3
{
  void *v4;
  void *v5;

  SBLayoutRoleIdentifierForRole(a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBWorkspaceTransitionContext previousEntityForKey:](self, "previousEntityForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)entityForLayoutRole:(int64_t)a3
{
  void *v4;
  void *v5;

  SBLayoutRoleIdentifierForRole(a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBWorkspaceTransitionContext entityForKey:](self, "entityForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)_setRequestedWorkspaceEntity:(id)a3 forLayoutRole:(int64_t)a4
{
  NSMutableDictionary *requestedWorkspaceEntityForLayoutRoleMutableDictionary;
  id v6;
  id v7;

  requestedWorkspaceEntityForLayoutRoleMutableDictionary = self->_requestedWorkspaceEntityForLayoutRoleMutableDictionary;
  v6 = a3;
  SBLayoutRoleIdentifierForRole(a4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](requestedWorkspaceEntityForLayoutRoleMutableDictionary, "setObject:forKeyedSubscript:", v6, v7);

}

uint64_t __72__SBWorkspaceApplicationSceneTransitionContext_applicationSceneEntities__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isApplicationSceneEntity");
}

- (id)previousApplicationSceneEntityForLayoutRole:(int64_t)a3
{
  void *v3;
  id v4;

  -[SBWorkspaceApplicationSceneTransitionContext previousEntityForLayoutRole:](self, "previousEntityForLayoutRole:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isApplicationSceneEntity"))
    v4 = v3;
  else
    v4 = 0;

  return v4;
}

- (NSSet)previousApplicationSceneEntities
{
  void *v2;
  void *v3;

  -[SBWorkspaceTransitionContext previousEntities](self, "previousEntities");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectsPassingTest:", &__block_literal_global_32_0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v3;
}

uint64_t __77__SBWorkspaceApplicationSceneTransitionContext__setRequestedFrontmostEntity___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

uint64_t __80__SBWorkspaceApplicationSceneTransitionContext_previousApplicationSceneEntities__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isApplicationSceneEntity");
}

- (SBWorkspaceApplicationSceneTransitionContext)init
{
  SBWorkspaceApplicationSceneTransitionContext *v2;
  SBWorkspaceApplicationSceneTransitionContext *v3;
  NSMutableDictionary *v4;
  NSMutableDictionary *requestedWorkspaceEntityForLayoutRoleMutableDictionary;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBWorkspaceApplicationSceneTransitionContext;
  v2 = -[SBWorkspaceTransitionContext init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_fencesAnimations = 0;
    v2->_inLiveResize = 0;
    v2->_alwaysRunsWatchdog = 0;
    v2->_waitsForSceneUpdates = 1;
    v2->_sceneless = 0;
    v2->_requestedSpaceConfiguration = 0;
    v2->_requestedFloatingConfiguration = 0;
    v2->_requestedCenterConfiguration = 0;
    v2->_requestedUnlockedEnvironmentMode = 0;
    v2->_requestedFloatingSwitcherVisible = 0x7FFFFFFFFFFFFFFFLL;
    v2->_requestedCenterEntityModal = 0x7FFFFFFFFFFFFFFFLL;
    v2->_transitioningToLessRecentSpace = 0x7FFFFFFFFFFFFFFFLL;
    v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    requestedWorkspaceEntityForLayoutRoleMutableDictionary = v3->_requestedWorkspaceEntityForLayoutRoleMutableDictionary;
    v3->_requestedWorkspaceEntityForLayoutRoleMutableDictionary = v4;

  }
  return v3;
}

- (void)dealloc
{
  void *v4;
  void *v5;
  objc_super v6;

  -[SBConsumableTokenWrapper consumeToken](self->_preludeAnimationTokenWrapper, "consumeToken");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cancel");
  if (self->_resultBlock)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBWorkspaceApplicationSceneTransitionContext.m"), 88, CFSTR("request deallocated without executing result block"));

  }
  v6.receiver = self;
  v6.super_class = (Class)SBWorkspaceApplicationSceneTransitionContext;
  -[SBWorkspaceApplicationSceneTransitionContext dealloc](&v6, sel_dealloc);
}

- (SBWorkspaceEntity)activatingEntity
{
  return (SBWorkspaceEntity *)-[SBWorkspaceTransitionContext entityForKey:](self, "entityForKey:", CFSTR("activating"));
}

- (BOOL)prefersCrossfadeTransition
{
  return self->_prefersCrossfadeTransition;
}

- (BOOL)prefersCenterZoomTransition
{
  return self->_prefersCenterZoomTransition;
}

- (int64_t)isTransitioningToLessRecentSpace
{
  return self->_transitioningToLessRecentSpace;
}

- (SBLayoutState)layoutState
{
  SBLayoutState *layoutState;
  void *v4;
  SBLayoutState *v5;
  SBLayoutState *v6;

  layoutState = self->_layoutState;
  if (!layoutState)
  {
    -[SBWorkspaceApplicationSceneTransitionContext delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "layoutStateForApplicationTransitionContext:", self);
    v5 = (SBLayoutState *)objc_claimAutoreleasedReturnValue();
    v6 = self->_layoutState;
    self->_layoutState = v5;

    layoutState = self->_layoutState;
  }
  return layoutState;
}

- (SBLayoutState)previousLayoutState
{
  SBLayoutState *previousLayoutState;
  void *v4;
  SBLayoutState *v5;
  SBLayoutState *v6;

  previousLayoutState = self->_previousLayoutState;
  if (!previousLayoutState)
  {
    -[SBWorkspaceApplicationSceneTransitionContext delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "previousLayoutStateForApplicationTransitionContext:", self);
    v5 = (SBLayoutState *)objc_claimAutoreleasedReturnValue();
    v6 = self->_previousLayoutState;
    self->_previousLayoutState = v5;

    previousLayoutState = self->_previousLayoutState;
  }
  return previousLayoutState;
}

- (SBWorkspaceApplicationSceneTransitionContextDelegate)delegate
{
  id WeakRetained;
  void *v4;
  id v5;
  void *v6;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = WeakRetained;
  }
  else
  {
    -[SBWorkspaceTransitionContext request](self, "request");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return (SBWorkspaceApplicationSceneTransitionContextDelegate *)v6;
}

- (void)setEntity:(id)a3 forLayoutRole:(int64_t)a4
{
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  id v10;

  v10 = a3;
  SBLayoutRoleIdentifierForRole(a4);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v10;
  v8 = (void *)v6;
  if (v10)
  {
    objc_msgSend(v10, "setLayoutRole:", a4);
    -[SBWorkspaceApplicationSceneTransitionContext activatingEntity](self, "activatingEntity");
    v9 = (id)objc_claimAutoreleasedReturnValue();

    v7 = v10;
    if (v9 == v10)
    {
      -[SBWorkspaceApplicationSceneTransitionContext setActivatingEntity:](self, "setActivatingEntity:", 0);
      v7 = v10;
    }
  }
  -[SBWorkspaceTransitionContext setEntity:forKey:](self, "setEntity:forKey:", v7, v8);

}

- (int64_t)requestedUnlockedEnvironmentMode
{
  return self->_requestedUnlockedEnvironmentMode;
}

- (void)setActivatingEntity:(id)a3
{
  -[SBWorkspaceTransitionContext setEntity:forKey:](self, "setEntity:forKey:", a3, CFSTR("activating"));
}

- (BOOL)waitsForSceneUpdates
{
  return self->_waitsForSceneUpdates;
}

- (NSString)requestedAppExposeBundleID
{
  return self->_requestedAppExposeBundleID;
}

- (NSDictionary)requestedEntityIdentifierToLayoutAttributes
{
  return (NSDictionary *)(id)-[NSMutableDictionary copy](self->_requestedEntityIdentifierToLayoutAttributes, "copy");
}

- (int64_t)requestedPeekConfiguration
{
  return self->_requestedPeekConfiguration;
}

- (int64_t)requestedFloatingSwitcherVisible
{
  return self->_requestedFloatingSwitcherVisible;
}

- (int64_t)requestedFloatingConfiguration
{
  return self->_requestedFloatingConfiguration;
}

- (int64_t)requestedCenterEntityModal
{
  return self->_requestedCenterEntityModal;
}

- (int64_t)requestedCenterConfiguration
{
  return self->_requestedCenterConfiguration;
}

- (int64_t)preferredInterfaceOrientation
{
  return self->_preferredInterfaceOrientation;
}

- (BOOL)retainsSiri
{
  return self->_retainsSiri;
}

- (NSArray)entitiesWithRemovalContexts
{
  void *v2;
  void *v3;

  -[NSMapTable keyEnumerator](self->_entityToRemovalContext, "keyEnumerator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (BOOL)disablesAutoPIP
{
  return self->_disablesAutoPIP;
}

- (void)setWaitsForSceneUpdates:(BOOL)a3
{
  self->_waitsForSceneUpdates = a3;
}

- (void)setPrefersCrossfadeTransition:(BOOL)a3
{
  self->_prefersCrossfadeTransition = a3;
}

- (void)setPrefersCenterZoomTransition:(BOOL)a3
{
  self->_prefersCenterZoomTransition = a3;
}

- (void)setRetainsSiri:(BOOL)a3
{
  self->_retainsSiri = a3;
}

- (void)setTransitioningToLessRecentSpace:(int64_t)a3
{
  self->_transitioningToLessRecentSpace = a3;
}

- (void)setRequestedUnlockedEnvironmentMode:(int64_t)a3
{
  if (self->_requestedUnlockedEnvironmentMode != a3)
    self->_requestedUnlockedEnvironmentMode = a3;
}

- (void)setRequestedPeekConfiguration:(int64_t)a3
{
  self->_requestedPeekConfiguration = a3;
}

- (void)setRequestedFloatingSwitcherVisible:(int64_t)a3
{
  if (self->_requestedFloatingSwitcherVisible != a3)
    self->_requestedFloatingSwitcherVisible = a3;
}

- (void)setRequestedFloatingConfiguration:(int64_t)a3
{
  if (self->_requestedFloatingConfiguration != a3)
    self->_requestedFloatingConfiguration = a3;
}

- (void)setRequestedCenterEntityModal:(int64_t)a3
{
  self->_requestedCenterEntityModal = a3;
}

- (void)setRequestedCenterConfiguration:(int64_t)a3
{
  if (self->_requestedCenterConfiguration != a3)
    self->_requestedCenterConfiguration = a3;
}

- (void)setRequestedAppExposeBundleID:(id)a3
{
  NSString *v4;
  NSString *requestedAppExposeBundleID;

  if (self->_requestedAppExposeBundleID != a3)
  {
    v4 = (NSString *)objc_msgSend(a3, "copy");
    requestedAppExposeBundleID = self->_requestedAppExposeBundleID;
    self->_requestedAppExposeBundleID = v4;

  }
}

- (void)setPreferredInterfaceOrientation:(int64_t)a3
{
  self->_preferredInterfaceOrientation = a3;
}

- (void)setDisablesAutoPIP:(BOOL)a3
{
  self->_disablesAutoPIP = a3;
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)finalize
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  SBLayoutState *previousLayoutState;
  SBLayoutState *layoutState;
  id v14;
  id v15;
  void *v16;
  objc_super v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  -[SBWorkspaceApplicationSceneTransitionContext delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBWorkspaceApplicationSceneTransitionContext.m"), 576, CFSTR("we have no delegate"));

  }
  if (!-[SBWorkspaceTransitionContext isFinalized](self, "isFinalized"))
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    -[SBWorkspaceApplicationSceneTransitionContext applicationSceneEntities](self, "applicationSceneEntities");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v19;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v19 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v9++), "translateActivationSettingsToActions");
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v7);
    }

    -[SBWorkspaceApplicationSceneTransitionContext activatingEntity](self, "activatingEntity");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "applicationSceneEntity");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
      -[SBWorkspaceApplicationSceneTransitionContext _setRequestedFrontmostEntity:](self, "_setRequestedFrontmostEntity:", v11);
    previousLayoutState = self->_previousLayoutState;
    self->_previousLayoutState = 0;

    layoutState = self->_layoutState;
    self->_layoutState = 0;

    v14 = -[SBWorkspaceApplicationSceneTransitionContext previousLayoutState](self, "previousLayoutState");
    v15 = -[SBWorkspaceApplicationSceneTransitionContext layoutState](self, "layoutState");

  }
  v17.receiver = self;
  v17.super_class = (Class)SBWorkspaceApplicationSceneTransitionContext;
  -[SBWorkspaceTransitionContext finalize](&v17, sel_finalize);
}

- (void)setRequestedEntityIdentifierToLayoutAttributes:(id)a3
{
  NSMutableDictionary *v5;
  NSMutableDictionary *v6;
  NSMutableDictionary *v7;
  NSMutableDictionary *requestedEntityIdentifierToLayoutAttributes;
  void *v9;
  objc_class *v10;
  void *v11;
  NSMutableDictionary *v12;

  v12 = (NSMutableDictionary *)a3;
  if (-[SBWorkspaceTransitionContext isFinalized](self, "isFinalized"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBWorkspaceApplicationSceneTransitionContext.m"), 254, CFSTR("%@ already finalized!"), v11);

  }
  v5 = v12;
  if (self->_requestedEntityIdentifierToLayoutAttributes != v12)
  {
    v6 = v12;
    if (!v12)
      v6 = (NSMutableDictionary *)MEMORY[0x1E0C9AA70];
    v7 = (NSMutableDictionary *)-[NSMutableDictionary mutableCopy](v6, "mutableCopy");
    requestedEntityIdentifierToLayoutAttributes = self->_requestedEntityIdentifierToLayoutAttributes;
    self->_requestedEntityIdentifierToLayoutAttributes = v7;

    v5 = v12;
  }

}

- (void)_setRequestedFrontmostEntity:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  id v17;
  SBDisplayItemLayoutAttributes *v18;
  void *v19;
  uint64_t v20;
  id v21;
  void *v22;
  id v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  void *v46;
  void *v47;
  id v48;
  _BYTE v49[56];
  _OWORD v50[3];
  uint64_t v51;
  _QWORD v52[4];
  id v53;
  _QWORD v54[4];
  id v55;
  _QWORD v56[4];
  id v57;
  _QWORD v58[4];
  id v59;

  v4 = a3;
  objc_msgSend(v4, "applicationSceneEntity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    +[SBLayoutElement elementWithDescriptor:](SBLayoutElement, "elementWithDescriptor:", v4);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "uniqueIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = MEMORY[0x1E0C809B0];
    v58[0] = MEMORY[0x1E0C809B0];
    v58[1] = 3221225472;
    v58[2] = __77__SBWorkspaceApplicationSceneTransitionContext__setRequestedFrontmostEntity___block_invoke;
    v58[3] = &unk_1E8E9DF50;
    v48 = v6;
    v59 = v48;
    v8 = (void *)MEMORY[0x1D17E5550](v58);
    +[SBMainSwitcherControllerCoordinator sharedInstance](SBMainSwitcherControllerCoordinator, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_recentAppLayoutsController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v56[0] = v7;
    v56[1] = 3221225472;
    v56[2] = __77__SBWorkspaceApplicationSceneTransitionContext__setRequestedFrontmostEntity___block_invoke_2;
    v56[3] = &unk_1E8EAED58;
    v11 = v8;
    v57 = v11;
    objc_msgSend(v10, "mostRecentAppLayoutIncludingHiddenAppLayouts:passingTest:", 1, v56);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBWorkspaceApplicationSceneTransitionContext previousLayoutState](self, "previousLayoutState");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_opt_class();
    v15 = v13;
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
    v17 = v16;

    objc_msgSend(v17, "elementIdentifiersToLayoutAttributes");
    v47 = (void *)objc_claimAutoreleasedReturnValue();

    -[SBWorkspaceApplicationSceneTransitionContext requestedLayoutAttributesForEntity:](self, "requestedLayoutAttributesForEntity:", v4);
    v18 = (SBDisplayItemLayoutAttributes *)objc_claimAutoreleasedReturnValue();
    if (v18)
      goto LABEL_24;
    objc_msgSend(v47, "objectForKey:", v48);
    v18 = (SBDisplayItemLayoutAttributes *)objc_claimAutoreleasedReturnValue();
    if (!v18 && v12)
    {
      -[SBWorkspaceApplicationSceneTransitionContext previousLayoutState](self, "previousLayoutState");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_opt_class();
      v21 = v19;
      if (v20)
      {
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v22 = v21;
        else
          v22 = 0;
      }
      else
      {
        v22 = 0;
      }
      v23 = v22;

      if (v23 && (v24 = objc_msgSend(v23, "displayOrdinal"), objc_msgSend(v12, "preferredDisplayOrdinal") != v24))
      {
        objc_msgSend(v12, "allItems");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "bs_firstObjectPassingTest:", v11);
        v26 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(v10, "bestLastDisplayItemLayoutAttributesMapForAppLayout:displayOrdinal:", v12, v24);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = (void *)v26;
        objc_msgSend(v27, "objectForKey:", v26);
        v18 = (SBDisplayItemLayoutAttributes *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v18 = 0;
      }

    }
    if (!v18 && v12)
    {
      objc_msgSend(v12, "allItems");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "bs_firstObjectPassingTest:", v11);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "layoutAttributesForItem:", v30);
      v18 = (SBDisplayItemLayoutAttributes *)objc_claimAutoreleasedReturnValue();

    }
    if (v18)
    {
LABEL_24:
      if (v12)
      {
LABEL_25:
        v31 = v46;
LABEL_40:
        -[SBDisplayItemLayoutAttributes attributesByModifyingLastInteractionTime:](v18, "attributesByModifyingLastInteractionTime:", objc_msgSend(v10, "_nextInteractionTime"));
        v43 = (void *)objc_claimAutoreleasedReturnValue();

        -[SBWorkspaceApplicationSceneTransitionContext setRequestedLayoutAttributes:forEntity:](self, "setRequestedLayoutAttributes:forEntity:", v43, v4);
        goto LABEL_41;
      }
    }
    else
    {
      v18 = objc_alloc_init(SBDisplayItemLayoutAttributes);
      if (v12)
        goto LABEL_25;
    }
    objc_msgSend(v5, "application");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "bundleIdentifier");
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    if (v33)
    {
      v45 = v11;
      v34 = MEMORY[0x1E0C809B0];
      v54[0] = MEMORY[0x1E0C809B0];
      v54[1] = 3221225472;
      v54[2] = __77__SBWorkspaceApplicationSceneTransitionContext__setRequestedFrontmostEntity___block_invoke_3;
      v54[3] = &unk_1E8E9DF78;
      v35 = v33;
      v55 = v35;
      objc_msgSend(v10, "mostRecentAppLayoutIncludingHiddenAppLayouts:passingTest:", 1, v54);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      if (v36)
      {
        v52[0] = v34;
        v52[1] = 3221225472;
        v52[2] = __77__SBWorkspaceApplicationSceneTransitionContext__setRequestedFrontmostEntity___block_invoke_4;
        v52[3] = &unk_1E8E9DF50;
        v53 = v35;
        objc_msgSend(v36, "latestItemPassingTest:", v52);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        if (v37)
        {
          objc_msgSend(v36, "layoutAttributesForItem:", v37);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = v38;
          if (v38)
          {
            objc_msgSend(v38, "attributedSize");
          }
          else
          {
            v51 = 0;
            memset(v50, 0, sizeof(v50));
          }
          -[SBDisplayItemLayoutAttributes attributesByModifyingAttributedSize:](v18, "attributesByModifyingAttributedSize:", v50, v36);
          v40 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v40, "attributesByModifyingSizingPolicy:", objc_msgSend(v39, "sizingPolicy"));
          v18 = (SBDisplayItemLayoutAttributes *)objc_claimAutoreleasedReturnValue();

          v36 = v44;
        }

      }
      v31 = v46;
      if (objc_msgSend(v4, "layoutRole") == 4)
      {
        -[SBDisplayItemLayoutAttributes attributesByModifyingAttributedSize:](v18, "attributesByModifyingAttributedSize:", v49, SBDisplayItemAttributedSizeUnspecified((uint64_t)v49).n128_f64[0]);
        v41 = v36;
        v42 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v42, "attributesByModifyingSizingPolicy:", 0);
        v18 = (SBDisplayItemLayoutAttributes *)objc_claimAutoreleasedReturnValue();

        v36 = v41;
      }
      v11 = v45;

    }
    else
    {
      v31 = v46;
    }

    goto LABEL_40;
  }
LABEL_41:

}

- (void)setRequestedLayoutAttributes:(id)a3 forEntity:(id)a4
{
  id v7;
  NSMutableDictionary *requestedEntityIdentifierToLayoutAttributes;
  NSMutableDictionary *v9;
  NSMutableDictionary *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_class *v15;
  void *v16;
  id v17;

  v17 = a3;
  v7 = a4;
  if (v17)
  {
    if (v7)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBWorkspaceApplicationSceneTransitionContext.m"), 266, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("layoutAttributes"));

    if (v7)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBWorkspaceApplicationSceneTransitionContext.m"), 267, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("entity"));

LABEL_3:
  if (-[SBWorkspaceTransitionContext isFinalized](self, "isFinalized"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (objc_class *)objc_opt_class();
    NSStringFromClass(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBWorkspaceApplicationSceneTransitionContext.m"), 268, CFSTR("%@ already finalized!"), v16);

  }
  requestedEntityIdentifierToLayoutAttributes = self->_requestedEntityIdentifierToLayoutAttributes;
  if (!requestedEntityIdentifierToLayoutAttributes)
  {
    v9 = (NSMutableDictionary *)objc_opt_new();
    v10 = self->_requestedEntityIdentifierToLayoutAttributes;
    self->_requestedEntityIdentifierToLayoutAttributes = v9;

    requestedEntityIdentifierToLayoutAttributes = self->_requestedEntityIdentifierToLayoutAttributes;
  }
  objc_msgSend(v7, "uniqueIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](requestedEntityIdentifierToLayoutAttributes, "setObject:forKey:", v17, v11);

}

- (id)requestedLayoutAttributesForEntity:(id)a3
{
  NSMutableDictionary *requestedEntityIdentifierToLayoutAttributes;
  void *v4;
  void *v5;

  requestedEntityIdentifierToLayoutAttributes = self->_requestedEntityIdentifierToLayoutAttributes;
  objc_msgSend(a3, "uniqueIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](requestedEntityIdentifierToLayoutAttributes, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (CGRect)frameForApplicationSceneEntity:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGRect result;

  v4 = a3;
  -[SBWorkspaceApplicationSceneTransitionContext delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "applicationTransitionContext:frameForApplicationSceneEntity:", self, v4);
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  v14 = v7;
  v15 = v9;
  v16 = v11;
  v17 = v13;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (NSSet)applicationSceneEntities
{
  void *v2;
  void *v3;

  -[SBWorkspaceTransitionContext entities](self, "entities");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectsPassingTest:", &__block_literal_global_163);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)SBWorkspaceApplicationSceneTransitionContext;
  -[SBWorkspaceTransitionContext succinctDescriptionBuilder](&v24, sel_succinctDescriptionBuilder);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendBool:withName:", self->_background, CFSTR("background"));
  v5 = (id)objc_msgSend(v3, "appendBool:withName:ifEqualTo:", self->_fencesAnimations, CFSTR("fenceAnimations"), 1);
  v6 = (id)objc_msgSend(v3, "appendBool:withName:ifEqualTo:", self->_inLiveResize, CFSTR("isInLiveResize"), 1);
  v7 = (id)objc_msgSend(v3, "appendBool:withName:ifEqualTo:", self->_alwaysRunsWatchdog, CFSTR("alwaysWatchdog"), 1);
  v8 = (id)objc_msgSend(v3, "appendBool:withName:", self->_waitsForSceneUpdates, CFSTR("waitForScenes"));
  -[SBWorkspaceApplicationSceneTransitionContext displayIdentity](self, "displayIdentity");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v3, "appendObject:withName:", v9, CFSTR("display"));

  if (-[SBWorkspaceApplicationSceneTransitionContext interfaceOrientation](self, "interfaceOrientation"))
  {
    objc_msgSend(MEMORY[0x1E0CEA2F8], "stringForInterfaceOrientation:", -[SBWorkspaceApplicationSceneTransitionContext interfaceOrientation](self, "interfaceOrientation"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (id)objc_msgSend(v3, "appendObject:withName:", v11, CFSTR("interfaceOrientation"));

  }
  if (-[SBWorkspaceApplicationSceneTransitionContext requestedUnlockedEnvironmentMode](self, "requestedUnlockedEnvironmentMode"))
  {
    SBStringForUnlockedEnvironmentMode(-[SBWorkspaceApplicationSceneTransitionContext requestedUnlockedEnvironmentMode](self, "requestedUnlockedEnvironmentMode"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (id)objc_msgSend(v3, "appendObject:withName:", v13, CFSTR("unlockedEnvironmentMode"));

  }
  -[SBWorkspaceApplicationSceneTransitionContext requestedAppExposeBundleID](self, "requestedAppExposeBundleID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    -[SBWorkspaceApplicationSceneTransitionContext requestedAppExposeBundleID](self, "requestedAppExposeBundleID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (id)objc_msgSend(v3, "appendObject:withName:", v16, CFSTR("appExposeBundleID"));

  }
  v18 = (id)objc_msgSend(v3, "appendObject:withName:", self->_layoutState, CFSTR("layoutState"));
  v19 = (id)objc_msgSend(v3, "appendObject:withName:", self->_previousLayoutState, CFSTR("previousLayoutState"));
  -[SBWorkspaceApplicationSceneTransitionContext delegate](self, "delegate");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    objc_msgSend(MEMORY[0x1E0D01748], "descriptionForObject:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (id)objc_msgSend(v3, "appendObject:withName:", v21, CFSTR("delegate"));

  }
  return v3;
}

- (id)compactDescriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SBWorkspaceApplicationSceneTransitionContext;
  -[SBWorkspaceTransitionContext compactDescriptionBuilderWithMultilinePrefix:](&v9, sel_compactDescriptionBuilderWithMultilinePrefix_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "appendBool:withName:", self->_background, CFSTR("background"));
  if (-[SBWorkspaceApplicationSceneTransitionContext interfaceOrientation](self, "interfaceOrientation"))
  {
    objc_msgSend(MEMORY[0x1E0CEA2F8], "stringForInterfaceOrientation:", -[SBWorkspaceApplicationSceneTransitionContext interfaceOrientation](self, "interfaceOrientation"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (id)objc_msgSend(v4, "appendObject:withName:", v6, CFSTR("interfaceOrientation"));

  }
  return v4;
}

- (int64_t)interfaceOrientation
{
  return self->_interfaceOrientation;
}

- (FBSDisplayIdentity)displayIdentity
{
  void *v4;
  void *v5;
  void *v7;

  -[SBWorkspaceTransitionContext request](self, "request");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBWorkspaceApplicationSceneTransitionContext.m"), 105, CFSTR("no valid transitionRequest to query for display -> %@"), self);

  }
  objc_msgSend(v4, "displayIdentity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (FBSDisplayIdentity *)v5;
}

- (BOOL)isBackground
{
  return self->_background;
}

- (void)setResultBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (SBWorkspaceEntity)resolvedActivatingWorkspaceEntity
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  -[SBWorkspaceApplicationSceneTransitionContext activatingEntity](self, "activatingEntity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[SBWorkspaceApplicationSceneTransitionContext entityForLayoutRole:](self, "entityForLayoutRole:", 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      v8 = v6;
    }
    else
    {
      -[SBWorkspaceApplicationSceneTransitionContext entityForLayoutRole:](self, "entityForLayoutRole:", 2);
      v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    v5 = v8;

  }
  return (SBWorkspaceEntity *)v5;
}

- (id)applicationSceneEntityForBundleID:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[SBWorkspaceApplicationSceneTransitionContext applicationSceneEntities](self, "applicationSceneEntities", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "application");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "bundleIdentifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqualToString:", v4);

        if (v12)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)removalContextForEntity:(id)a3
{
  return -[NSMapTable objectForKey:](self->_entityToRemovalContext, "objectForKey:", a3);
}

- (void)_setRequestedActivatingWorkspaceEntity:(id)a3
{
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_requestedWorkspaceEntityForLayoutRoleMutableDictionary, "setObject:forKeyedSubscript:", a3, CFSTR("activating"));
}

- (void)_setAlreadyPopulatedRequestedWorkspaceEntities:(BOOL)a3
{
  self->__alreadyPopulatedRequestedWorkspaceEntities = a3;
}

- (BOOL)_alreadyPopulatedRequestedWorkspaceEntities
{
  return self->__alreadyPopulatedRequestedWorkspaceEntities;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entitiesWithRemovalContexts, 0);
  objc_storeStrong((id *)&self->_requestedAppExposeBundleID, 0);
  objc_storeStrong((id *)&self->_deactivatingEntity, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_animationFence, 0);
  objc_storeStrong((id *)&self->_preludeAnimationTokenWrapper, 0);
  objc_storeStrong((id *)&self->_entityToRemovalContext, 0);
  objc_storeStrong((id *)&self->_requestedEntityIdentifierToLayoutAttributes, 0);
  objc_storeStrong((id *)&self->_requestedWorkspaceEntityForLayoutRoleMutableDictionary, 0);
  objc_storeStrong((id *)&self->_previousLayoutState, 0);
  objc_storeStrong((id *)&self->_layoutState, 0);
  objc_storeStrong(&self->_resultBlock, 0);
}

- (SBWorkspaceEntity)requestedActivatingWorkspaceEntity
{
  return (SBWorkspaceEntity *)-[NSMutableDictionary objectForKeyedSubscript:](self->_requestedWorkspaceEntityForLayoutRoleMutableDictionary, "objectForKeyedSubscript:", CFSTR("activating"));
}

- (double)watchdogScaleFactor
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  double result;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[SBWorkspaceApplicationSceneTransitionContext applicationSceneEntities](self, "applicationSceneEntities", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (!v4)
  {

    goto LABEL_11;
  }
  v5 = v4;
  v6 = 0;
  v7 = *(_QWORD *)v18;
  do
  {
    for (i = 0; i != v5; ++i)
    {
      if (*(_QWORD *)v18 != v7)
        objc_enumerationMutation(v3);
      objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * i), "application");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "processState");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "isRunning");

      v6 += v11 ^ 1u;
    }
    v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  }
  while (v5);

  if (v6 <= 1)
  {
LABEL_11:
    -[SBWorkspaceTransitionContext request](self, "request");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "workspace");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "pipCoordinator");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "isAnyPictureInPictureWindowVisible");

    result = 1.0;
    if (!v15)
      return result;
  }
  return 2.0;
}

- (BOOL)alwaysRunsWatchdog
{
  return self->_alwaysRunsWatchdog;
}

- (BOOL)fencesAnimations
{
  return self->_fencesAnimations;
}

- (BKSAnimationFenceHandle)animationFence
{
  return self->_animationFence;
}

- (BOOL)needsToSendActivationResult
{
  return !self->_sentActivationResult && self->_resultBlock != 0;
}

- (int64_t)interfaceOrientationOrPreferredOrientation
{
  int64_t result;

  result = -[SBWorkspaceApplicationSceneTransitionContext interfaceOrientation](self, "interfaceOrientation");
  if (!result)
    return -[SBWorkspaceApplicationSceneTransitionContext preferredInterfaceOrientation](self, "preferredInterfaceOrientation");
  return result;
}

- (BOOL)preventSwitcherRecencyModelUpdates
{
  return self->_preventSwitcherRecencyModelUpdates;
}

- (void)setPrefersTouchCancellationDisabled:(BOOL)a3
{
  self->_prefersTouchCancellationDisabled = a3;
}

- (void)setInterfaceOrientation:(int64_t)a3
{
  self->_interfaceOrientation = a3;
}

- (void)setFencesAnimations:(BOOL)a3
{
  self->_fencesAnimations = a3;
}

- (void)setAnimationFence:(id)a3
{
  objc_storeStrong((id *)&self->_animationFence, a3);
}

- (BOOL)isSceneless
{
  return self->_sceneless;
}

- (void)sendActivationResultError:(id)a3
{
  id v4;
  void (**resultBlock)(void);
  id v6;
  id v7;

  v4 = a3;
  if (!self->_sentActivationResult)
  {
    self->_sentActivationResult = 1;
    resultBlock = (void (**)(void))self->_resultBlock;
    if (resultBlock)
    {
      v7 = v4;
      resultBlock[2]();
      v6 = self->_resultBlock;
      self->_resultBlock = 0;

      v4 = v7;
    }
  }

}

- (void)setBackground:(BOOL)a3
{
  self->_background = a3;
}

- (BOOL)isInLiveResize
{
  return self->_inLiveResize;
}

- (id)applicationSceneEntityForLayoutRole:(int64_t)a3
{
  void *v3;
  id v4;

  -[SBWorkspaceApplicationSceneTransitionContext entityForLayoutRole:](self, "entityForLayoutRole:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isApplicationSceneEntity"))
    v4 = v3;
  else
    v4 = 0;

  return v4;
}

uint64_t __77__SBWorkspaceApplicationSceneTransitionContext__setRequestedFrontmostEntity___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "allItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "bs_containsObjectPassingTest:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (int64_t)requestedWindowPickerRole
{
  return self->_requestedWindowPickerRole;
}

- (int64_t)requestedSpaceConfiguration
{
  return self->_requestedSpaceConfiguration;
}

uint64_t __77__SBWorkspaceApplicationSceneTransitionContext__setRequestedFrontmostEntity___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;

  v3 = a2;
  if (objc_msgSend(v3, "type"))
    v4 = 0;
  else
    v4 = objc_msgSend(v3, "containsItemWithBundleIdentifier:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (void)setEntities:(id)a3 withPolicy:(int64_t)a4 centerEntity:(id)a5 floatingEntity:(id)a6
{
  -[SBWorkspaceApplicationSceneTransitionContext setEntities:startingAtLayoutRole:withPolicy:centerEntity:floatingEntity:](self, "setEntities:startingAtLayoutRole:withPolicy:centerEntity:floatingEntity:", a3, 1, a4, a5, a6);
}

- (void)setEntities:(id)a3 startingAtLayoutRole:(int64_t)a4 withPolicy:(int64_t)a5 centerEntity:(id)a6 floatingEntity:(id)a7
{
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  _QWORD v21[5];
  id v22;
  _QWORD *v23;
  _QWORD *v24;
  int64_t v25;
  int64_t v26;
  _QWORD v27[4];
  _QWORD v28[4];

  v13 = a3;
  v14 = a6;
  v15 = a7;
  if (SBLayoutRoleIsValidForSplitView(a4))
  {
    if (v14)
    {
LABEL_3:
      -[SBWorkspaceApplicationSceneTransitionContext setEntity:forLayoutRole:](self, "setEntity:forLayoutRole:", v14, 4);
      objc_msgSend(v13, "sb_arrayByRemovingObject:", v14);
      v16 = v13;
      v13 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    SBLayoutRoleIdentifierForRole(a4);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBWorkspaceApplicationSceneTransitionContext.m"), 153, CFSTR("startLayoutRole %@ isn't valid for Split View"), v18);

    if (v14)
      goto LABEL_3;
  }
  +[SBWorkspaceEntity entity](SBEmptyWorkspaceEntity, "entity");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBWorkspaceApplicationSceneTransitionContext setEntity:forLayoutRole:](self, "setEntity:forLayoutRole:", v16, 4);
LABEL_6:

  if (v15)
  {
    -[SBWorkspaceApplicationSceneTransitionContext setEntity:forLayoutRole:](self, "setEntity:forLayoutRole:", v15, 3);
    objc_msgSend(v13, "sb_arrayByRemovingObject:", v15);
    v19 = v13;
    v13 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[SBWorkspaceEntity entity](SBEmptyWorkspaceEntity, "entity");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBWorkspaceApplicationSceneTransitionContext setEntity:forLayoutRole:](self, "setEntity:forLayoutRole:", v19, 3);
  }

  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x2020000000;
  v28[3] = 0;
  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x2020000000;
  v27[3] = a4;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __120__SBWorkspaceApplicationSceneTransitionContext_setEntities_startingAtLayoutRole_withPolicy_centerEntity_floatingEntity___block_invoke;
  v21[3] = &unk_1E8EAED30;
  v25 = a5;
  v26 = a4;
  v21[4] = self;
  v23 = v28;
  v20 = v13;
  v22 = v20;
  v24 = v27;
  SBLayoutRoleEnumerateValidRoles(v21);

  _Block_object_dispose(v27, 8);
  _Block_object_dispose(v28, 8);

}

void __120__SBWorkspaceApplicationSceneTransitionContext_setEntities_startingAtLayoutRole_withPolicy_centerEntity_floatingEntity___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  __objc2_class *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;

  if (SBLayoutRoleIsValidForSplitView(a2))
  {
    if (*(_QWORD *)(a1 + 64) == 1 && *(_QWORD *)(a1 + 72) > a2)
    {
      v4 = *(void **)(a1 + 32);
      v5 = SBPreviousWorkspaceEntity;
LABEL_15:
      -[__objc2_class entity](v5, "entity");
      v15 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setEntity:forLayoutRole:", v15, a2);
LABEL_16:

      return;
    }
    v6 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
    if (v6 < objc_msgSend(*(id *)(a1 + 40), "count"))
    {
      objc_msgSend(*(id *)(a1 + 40), "objectAtIndex:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));
      v15 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "entityForLayoutRole:", a2);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v7 || !*(_QWORD *)(a1 + 64))
      {
        objc_msgSend(*(id *)(a1 + 32), "entityForLayoutRole:", objc_msgSend(v15, "layoutRole"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v15, "isEqual:", v8);

        if (v9)
          objc_msgSend(*(id *)(a1 + 32), "setEntity:forLayoutRole:", 0, objc_msgSend(v15, "layoutRole"));
        objc_msgSend(v7, "setLayoutRole:", 0);
        objc_msgSend(*(id *)(a1 + 32), "setEntity:forLayoutRole:", v15, a2);
        ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
      }

      goto LABEL_16;
    }
    v10 = *(_QWORD *)(a1 + 64);
    if (v10 != 1)
    {
      if (v10)
        return;
      v4 = *(void **)(a1 + 32);
      v5 = SBEmptyWorkspaceEntity;
      goto LABEL_15;
    }
    v11 = *(void **)(a1 + 32);
    +[SBPreviousWorkspaceEntity entityWithPreviousLayoutRole:](SBPreviousWorkspaceEntity, "entityWithPreviousLayoutRole:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setEntity:forLayoutRole:", v12, a2);

    do
    {
      v13 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v14 = *(_QWORD *)(v13 + 24) + 1;
      *(_QWORD *)(v13 + 24) = v14;
    }
    while (!SBLayoutRoleIsValidForSplitView(v14)
         && SBLayoutRoleIsValid(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24)));
  }
}

- (void)setRequestedSpaceConfiguration:(int64_t)a3
{
  void *v6;
  objc_class *v7;
  void *v8;

  if (-[SBWorkspaceTransitionContext isFinalized](self, "isFinalized"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBWorkspaceApplicationSceneTransitionContext.m"), 242, CFSTR("%@ already finalized!"), v8);

  }
  if (self->_requestedSpaceConfiguration != a3)
    self->_requestedSpaceConfiguration = a3;
}

uint64_t __77__SBWorkspaceApplicationSceneTransitionContext__setRequestedFrontmostEntity___block_invoke_4(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (id)previousApplicationSceneEntityForBundleID:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[SBWorkspaceApplicationSceneTransitionContext previousApplicationSceneEntities](self, "previousApplicationSceneEntities", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "application");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "bundleIdentifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqualToString:", v4);

        if (v12)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)appClipPlaceholderEntities
{
  void *v2;
  void *v3;

  -[SBWorkspaceTransitionContext entities](self, "entities");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectsPassingTest:", &__block_literal_global_33_1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __74__SBWorkspaceApplicationSceneTransitionContext_appClipPlaceholderEntities__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isAppClipPlaceholderEntity");
}

- (id)previousAppClipPlaceholderEntities
{
  void *v2;
  void *v3;

  -[SBWorkspaceTransitionContext previousEntities](self, "previousEntities");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectsPassingTest:", &__block_literal_global_34);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __82__SBWorkspaceApplicationSceneTransitionContext_previousAppClipPlaceholderEntities__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isAppClipPlaceholderEntity");
}

- (id)appClipPlaceholderEntityForBundleID:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  int v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[SBWorkspaceApplicationSceneTransitionContext appClipPlaceholderEntities](self, "appClipPlaceholderEntities", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "bundleIdentifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqualToString:", v4);

        if (v11)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)previousAppClipPlaceholderEntityForBundleID:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  int v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[SBWorkspaceApplicationSceneTransitionContext previousAppClipPlaceholderEntities](self, "previousAppClipPlaceholderEntities", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "bundleIdentifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqualToString:", v4);

        if (v11)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)requestedWorkspaceEntityForLayoutRole:(int64_t)a3
{
  NSMutableDictionary *requestedWorkspaceEntityForLayoutRoleMutableDictionary;
  void *v4;
  void *v5;

  requestedWorkspaceEntityForLayoutRoleMutableDictionary = self->_requestedWorkspaceEntityForLayoutRoleMutableDictionary;
  SBLayoutRoleIdentifierForRole(a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](requestedWorkspaceEntityForLayoutRoleMutableDictionary, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (int64_t)_lockedInterfaceOrientation
{
  void *v2;
  int v3;
  void *v4;
  int64_t v5;

  -[SBWorkspaceApplicationSceneTransitionContext displayIdentity](self, "displayIdentity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isMainDisplay");

  if (!v3)
    return 0;
  +[SBOrientationLockManager sharedInstance](SBOrientationLockManager, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "userLockOrientation");

  return v5;
}

- (void)setRemovalContext:(id)a3 forEntity:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSMapTable *entityToRemovalContext;
  NSMapTable *v10;
  NSMapTable *v11;
  NSMapTable *v12;
  id v13;

  v13 = a3;
  v6 = a4;
  v7 = v13;
  v8 = v6;
  entityToRemovalContext = self->_entityToRemovalContext;
  if (v13)
  {
    if (!entityToRemovalContext)
    {
      objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
      v10 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
      v11 = self->_entityToRemovalContext;
      self->_entityToRemovalContext = v10;

      v7 = v13;
      entityToRemovalContext = self->_entityToRemovalContext;
    }
    -[NSMapTable setObject:forKey:](entityToRemovalContext, "setObject:forKey:", v7, v8);
  }
  else
  {
    -[NSMapTable removeObjectForKey:](entityToRemovalContext, "removeObjectForKey:", v8);
    if (!-[NSMapTable count](self->_entityToRemovalContext, "count"))
    {
      v12 = self->_entityToRemovalContext;
      self->_entityToRemovalContext = 0;

    }
  }

}

- (id)_displayConfiguration
{
  id WeakRetained;
  void *v5;
  void *v7;

  WeakRetained = objc_loadWeakRetained((id *)&self->super._request);
  if (!WeakRetained)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBWorkspaceApplicationSceneTransitionContext.m"), 652, CFSTR("no valid transitionRequest to query for displayConfiguration -> %@"), self);

  }
  objc_msgSend(WeakRetained, "displayConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)setInLiveResize:(BOOL)a3
{
  self->_inLiveResize = a3;
}

- (void)setAlwaysRunsWatchdog:(BOOL)a3
{
  self->_alwaysRunsWatchdog = a3;
}

- (id)resultBlock
{
  return self->_resultBlock;
}

- (SBConsumableTokenWrapper)preludeAnimationTokenWrapper
{
  return self->_preludeAnimationTokenWrapper;
}

- (void)setPreludeAnimationTokenWrapper:(id)a3
{
  objc_storeStrong((id *)&self->_preludeAnimationTokenWrapper, a3);
}

- (void)setSceneless:(BOOL)a3
{
  self->_sceneless = a3;
}

- (BOOL)prefersTouchCancellationDisabled
{
  return self->_prefersTouchCancellationDisabled;
}

- (void)setPreventSwitcherRecencyModelUpdates:(BOOL)a3
{
  self->_preventSwitcherRecencyModelUpdates = a3;
}

- (SBWorkspaceEntity)deactivatingEntity
{
  return self->_deactivatingEntity;
}

- (void)setDeactivatingEntity:(id)a3
{
  objc_storeStrong((id *)&self->_deactivatingEntity, a3);
}

- (void)setRequestedWindowPickerRole:(int64_t)a3
{
  self->_requestedWindowPickerRole = a3;
}

- (void)setEntitiesWithRemovalContexts:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 256);
}

@end
