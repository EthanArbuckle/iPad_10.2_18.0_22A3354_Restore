@implementation TRAArbitrationPreferencesResolutionStage

- (int64_t)preferencesType
{
  return self->_preferencesType;
}

- (NSArray)participantsRoles
{
  return &self->_participantsRoles->super;
}

- (void)updateResolutionWithContext:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  NSMutableArray *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  _BOOL8 v19;
  void *v20;
  TRAPreferencesTree *v21;
  TRAPreferencesTree *stagePreferencesTree;
  NSMutableArray *v23;
  uint64_t v24;
  __int128 v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  void *v30;
  void *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint8_t buf[4];
  void *v46;
  __int16 v47;
  void *v48;
  _BYTE v49[128];
  _BYTE v50[128];
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v5 = self->_resolutionPolicySpecifiers;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v41, v51, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v42;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v42 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
        objc_msgSend(v4, "acquiredParticipants");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "updateStageParticipantsResolutionPolicies:context:", v11, v4);

      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v41, v51, 16);
    }
    while (v7);
  }

  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v12 = self->_nodesSpecsSpecifiers;
  v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v37, v50, 16);
  if (!v13)
  {
    v15 = v12;
    goto LABEL_18;
  }
  v14 = v13;
  v15 = 0;
  v16 = *(_QWORD *)v38;
  do
  {
    v17 = 0;
    v18 = v15;
    do
    {
      if (*(_QWORD *)v38 != v16)
        objc_enumerationMutation(v12);
      objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * v17), "updateStageTreeNodesSpecifications:stageParticipantsRoles:context:", v18, self->_participantsRoles, v4);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      ++v17;
      v18 = v15;
    }
    while (v14 != v17);
    v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v37, v50, 16);
  }
  while (v14);

  if (v15)
  {
    v19 = -[TRAArbitrationPreferencesResolutionStage preferencesType](self, "preferencesType") == 1;
    TRAStringFromTraitsPreferencesType(-[TRAArbitrationPreferencesResolutionStage preferencesType](self, "preferencesType"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    +[TRAPreferencesTree treeWithNodesSpecifications:traversalType:debugName:](TRAPreferencesTree, "treeWithNodesSpecifications:traversalType:debugName:", v15, v19, v20);
    v21 = (TRAPreferencesTree *)objc_claimAutoreleasedReturnValue();
    stagePreferencesTree = self->_stagePreferencesTree;
    self->_stagePreferencesTree = v21;

LABEL_18:
  }
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v23 = self->_stageResolvers;
  v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v33, v49, 16);
  if (v24)
  {
    v26 = v24;
    v27 = *(_QWORD *)v34;
    *(_QWORD *)&v25 = 138543618;
    v32 = v25;
    do
    {
      v28 = 0;
      do
      {
        if (*(_QWORD *)v34 != v27)
          objc_enumerationMutation(v23);
        objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * v28), "resolveStagePreferencesWithContext:preferencesTree:", v4, self->_stagePreferencesTree, v32, (_QWORD)v33);
        TRALogCommon();
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
        {
          TRAStringFromTraitsPreferencesType(self->_preferencesType);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          -[TRAPreferencesTree recursiveDescription](self->_stagePreferencesTree, "recursiveDescription");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = v32;
          v46 = v30;
          v47 = 2114;
          v48 = v31;
          _os_log_debug_impl(&dword_249196000, v29, OS_LOG_TYPE_DEBUG, "Current stage tree %{public}@: %{public}@", buf, 0x16u);

        }
        ++v28;
      }
      while (v26 != v28);
      v26 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v33, v49, 16);
    }
    while (v26);
  }

}

- (void)_addStageComponent:(id)a3 toArray:(id)a4 update:(BOOL)a5 animate:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL4 v7;
  id v11;
  void *v12;
  uint64_t v13;
  void *WeakRetained;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  v6 = a6;
  v7 = a5;
  v21 = a3;
  v11 = a4;
  v12 = v21;
  if (!v21)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRAArbitration.m"), 283, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("component"));

    v12 = 0;
  }
  v13 = objc_msgSend(v12, "preferencesType");
  if (v13 != -[TRAArbitrationPreferencesResolutionStage preferencesType](self, "preferencesType"))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    TRAStringFromTraitsPreferencesType(objc_msgSend(v21, "preferencesType"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    TRAStringFromTraitsPreferencesType(-[TRAArbitrationPreferencesResolutionStage preferencesType](self, "preferencesType"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRAArbitration.m"), 284, CFSTR("Preferences stage component[%@] preferences type[%@], doesn't match stage[%@] preferences type[%@]"), v21, v19, self, v20);

  }
  if ((objc_msgSend(v11, "containsObject:", v21) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    WeakRetained = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRAArbitration.m"), 296, CFSTR("[%@] already added to the stage[%@]"), v21, self);
    v15 = v11;
LABEL_9:

    goto LABEL_10;
  }
  objc_msgSend(v11, "addObject:", v21);
  objc_msgSend(v11, "sortedArrayUsingComparator:", &__block_literal_global_146);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v16, "mutableCopy");

  if (v7)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_arbiter);
    objc_msgSend(WeakRetained, "_preferencesResolutionStageDidUpdateComponents:animate:", self, v6);
    goto LABEL_9;
  }
LABEL_10:

}

- (void)_removeComponent:(id)a3 fromArray:(id)a4 update:(BOOL)a5 animate:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL4 v7;
  id v11;
  id v12;
  id v13;
  void *WeakRetained;
  void *v15;
  id v16;

  v6 = a6;
  v7 = a5;
  v16 = a3;
  v11 = a4;
  v12 = v16;
  v13 = v11;
  if (!v16)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRAArbitration.m"), 301, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("component"));

    v12 = 0;
  }
  if (!objc_msgSend(v13, "containsObject:", v12))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    WeakRetained = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRAArbitration.m"), 308, CFSTR("[%@] already removed from the stage[%@]"), v16, self);
    goto LABEL_7;
  }
  objc_msgSend(v13, "removeObject:", v16);
  if (v7)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_arbiter);
    objc_msgSend(WeakRetained, "_preferencesResolutionStageDidUpdateComponents:animate:", self, v6);
LABEL_7:

  }
}

- (void)addResolutionPolicySpecifier:(id)a3 update:(BOOL)a4
{
  -[TRAArbitrationPreferencesResolutionStage _addStageComponent:toArray:update:animate:](self, "_addStageComponent:toArray:update:animate:", a3, self->_resolutionPolicySpecifiers, a4, 1);
}

- (void)removeResolutionPolicySpecifier:(id)a3 update:(BOOL)a4
{
  -[TRAArbitrationPreferencesResolutionStage _removeComponent:fromArray:update:animate:](self, "_removeComponent:fromArray:update:animate:", a3, self->_resolutionPolicySpecifiers, a4, 1);
}

uint64_t __86__TRAArbitrationPreferencesResolutionStage__addStageComponent_toArray_update_animate___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "componentOrder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "componentOrder");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[TRAArbitrationPreferencesResolutionStage succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  TRAStringFromTraitsPreferencesType(self->_preferencesType);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v4, CFSTR("preferencesType"));

  return v3;
}

- (void)removeResolutionPolicySpecifier:(id)a3
{
  -[TRAArbitrationPreferencesResolutionStage _removeComponent:fromArray:update:animate:](self, "_removeComponent:fromArray:update:animate:", a3, self->_resolutionPolicySpecifiers, 1, 1);
}

- (void)addResolutionPolicySpecifier:(id)a3
{
  -[TRAArbitrationPreferencesResolutionStage _addStageComponent:toArray:update:animate:](self, "_addStageComponent:toArray:update:animate:", a3, self->_resolutionPolicySpecifiers, 1, 1);
}

- (void)addResolutionPolicySpecifier:(id)a3 animate:(BOOL)a4
{
  -[TRAArbitrationPreferencesResolutionStage _addStageComponent:toArray:update:animate:](self, "_addStageComponent:toArray:update:animate:", a3, self->_resolutionPolicySpecifiers, 1, a4);
}

- (TRAArbitrationPreferencesResolutionStage)initWithParticipantsRoles:(id)a3 preferencesType:(int64_t)a4 arbiter:(id)a5
{
  id v9;
  id v10;
  void *v11;
  TRAArbitrationPreferencesResolutionStage *v12;
  TRAArbitrationPreferencesResolutionStage *v13;
  uint64_t v14;
  NSMutableArray *participantsRoles;
  uint64_t v16;
  NSMutableArray *resolutionPolicySpecifiers;
  uint64_t v18;
  NSMutableArray *nodesSpecsSpecifiers;
  uint64_t v20;
  NSMutableArray *stageResolvers;
  uint64_t v22;
  BSInvalidatable *stateDumpHandle;
  void *v25;
  void *v26;
  objc_super v27;

  v9 = a3;
  v10 = a5;
  v11 = v10;
  if (v9)
  {
    if (v10)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRAArbitration.m"), 189, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("participantsRoles"));

    if (v11)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRAArbitration.m"), 190, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("arbiter"));

LABEL_3:
  v27.receiver = self;
  v27.super_class = (Class)TRAArbitrationPreferencesResolutionStage;
  v12 = -[TRAArbitrationPreferencesResolutionStage init](&v27, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeWeak((id *)&v12->_arbiter, v11);
    v13->_preferencesType = a4;
    v14 = objc_msgSend(v9, "copy");
    participantsRoles = v13->_participantsRoles;
    v13->_participantsRoles = (NSMutableArray *)v14;

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v16 = objc_claimAutoreleasedReturnValue();
    resolutionPolicySpecifiers = v13->_resolutionPolicySpecifiers;
    v13->_resolutionPolicySpecifiers = (NSMutableArray *)v16;

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v18 = objc_claimAutoreleasedReturnValue();
    nodesSpecsSpecifiers = v13->_nodesSpecsSpecifiers;
    v13->_nodesSpecsSpecifiers = (NSMutableArray *)v18;

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v20 = objc_claimAutoreleasedReturnValue();
    stageResolvers = v13->_stageResolvers;
    v13->_stageResolvers = (NSMutableArray *)v20;

    -[TRAArbitrationPreferencesResolutionStage _setupStateDump](v13, "_setupStateDump");
    v22 = objc_claimAutoreleasedReturnValue();
    stateDumpHandle = v13->_stateDumpHandle;
    v13->_stateDumpHandle = (BSInvalidatable *)v22;

  }
  return v13;
}

- (void)dealloc
{
  objc_super v3;

  -[BSInvalidatable invalidate](self->_stateDumpHandle, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)TRAArbitrationPreferencesResolutionStage;
  -[TRAArbitrationPreferencesResolutionStage dealloc](&v3, sel_dealloc);
}

- (void)addNodesSpecificationsSpecifier:(id)a3
{
  -[TRAArbitrationPreferencesResolutionStage _addStageComponent:toArray:update:animate:](self, "_addStageComponent:toArray:update:animate:", a3, self->_nodesSpecsSpecifiers, 1, 1);
}

- (void)addStageResolver:(id)a3
{
  -[TRAArbitrationPreferencesResolutionStage _addStageComponent:toArray:update:animate:](self, "_addStageComponent:toArray:update:animate:", a3, self->_stageResolvers, 1, 1);
}

- (void)removeResolutionPolicySpecifier:(id)a3 animate:(BOOL)a4
{
  -[TRAArbitrationPreferencesResolutionStage _removeComponent:fromArray:update:animate:](self, "_removeComponent:fromArray:update:animate:", a3, self->_resolutionPolicySpecifiers, 1, a4);
}

- (void)removeNodesSpecificationsSpecifier:(id)a3
{
  -[TRAArbitrationPreferencesResolutionStage _removeComponent:fromArray:update:animate:](self, "_removeComponent:fromArray:update:animate:", a3, self->_nodesSpecsSpecifiers, 1, 1);
}

- (void)removeStageResolver:(id)a3
{
  -[TRAArbitrationPreferencesResolutionStage _removeComponent:fromArray:update:animate:](self, "_removeComponent:fromArray:update:animate:", a3, self->_stageResolvers, 1, 1);
}

- (NSString)debugDescription
{
  return (NSString *)-[TRAArbitrationPreferencesResolutionStage descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[TRAArbitrationPreferencesResolutionStage descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  _QWORD v12[4];
  id v13;
  TRAArbitrationPreferencesResolutionStage *v14;

  -[TRAArbitrationPreferencesResolutionStage succinctDescriptionBuilder](self, "succinctDescriptionBuilder", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), -[NSMutableArray count](self->_resolutionPolicySpecifiers, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendString:withName:", v5, CFSTR("resolutionPolicySpecifiers count"));

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), -[NSMutableArray count](self->_nodesSpecsSpecifiers, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendString:withName:", v6, CFSTR("nodesSpecificationSpecifiers count"));

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), -[NSMutableArray count](self->_stageResolvers, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendString:withName:", v7, CFSTR("stageResolvers count"));

  v8 = (id)objc_msgSend(v4, "appendUnsignedInteger:withName:", -[NSMutableArray count](self->_participantsRoles, "count"), CFSTR("participantsRoles count"));
  if (self->_stagePreferencesTree)
  {
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __82__TRAArbitrationPreferencesResolutionStage_descriptionBuilderWithMultilinePrefix___block_invoke;
    v12[3] = &unk_251A06D68;
    v13 = v4;
    v14 = self;
    objc_msgSend(v13, "appendBodySectionWithName:multilinePrefix:block:", CFSTR("Preference Tree"), 0, v12);
    v9 = v13;
  }
  else
  {
    objc_msgSend(0, "recursiveDescription");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendString:withName:", v9, CFSTR("Preference Tree"));
  }

  objc_msgSend(v4, "appendArraySection:withName:skipIfEmpty:", self->_resolutionPolicySpecifiers, CFSTR("Resolution Policy Specifiers"), 0);
  objc_msgSend(v4, "appendArraySection:withName:skipIfEmpty:", self->_stageResolvers, CFSTR("Resolvers"), 0);
  v10 = (id)objc_msgSend(v4, "appendUnsignedInteger:withName:", -[NSMutableArray count](self->_participantsRoles, "count"), CFSTR("Managed Roles"));
  return v4;
}

void __82__TRAArbitrationPreferencesResolutionStage_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 40), "recursiveDescription");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "appendString:withName:", v2, 0);

}

- (id)_setupStateDump
{
  id v3;
  void *v4;
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  id v10;
  id location;

  objc_initWeak(&location, self);
  v3 = MEMORY[0x24BDAC9B8];
  v4 = (void *)MEMORY[0x24BDD17C8];
  WeakRetained = objc_loadWeakRetained((id *)&self->_arbiter);
  TRAStringFromTraitsPreferencesType(self->_preferencesType);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("TraitsArbiter - %p - Arbitration Pipeline - Preferences Resolution Stages - %@"), WeakRetained, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_copyWeak(&v10, &location);
  BSLogAddStateCaptureBlockWithTitle();
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
  return v8;
}

__CFString *__59__TRAArbitrationPreferencesResolutionStage__setupStateDump__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  __CFString *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "debugDescription");
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = &stru_251A072F0;
  }

  return v3;
}

- (TRAArbiter)arbiter
{
  return (TRAArbiter *)objc_loadWeakRetained((id *)&self->_arbiter);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_arbiter);
  objc_storeStrong((id *)&self->_stateDumpHandle, 0);
  objc_storeStrong((id *)&self->_stagePreferencesTree, 0);
  objc_storeStrong((id *)&self->_participantsRoles, 0);
  objc_storeStrong((id *)&self->_stageResolvers, 0);
  objc_storeStrong((id *)&self->_nodesSpecsSpecifiers, 0);
  objc_storeStrong((id *)&self->_resolutionPolicySpecifiers, 0);
}

@end
