@implementation WFResourceManager

- (WFResourceManager)initWithDefinitions:(id)a3
{
  id v4;
  WFResourceManager *v5;
  WFResourceManager *v6;
  void *v7;
  uint64_t v8;
  NSMutableArray *resourceNodes;
  uint64_t v10;
  NSMapTable *targetSelectorTable;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)WFResourceManager;
  v5 = -[WFResourceManager init](&v13, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_stateLock._os_unfair_lock_opaque = 0;
    v5->_targetSelectorLock._os_unfair_lock_opaque = 0;
    +[WFResourceNode nodesWithDefinitions:](WFResourceNode, "nodesWithDefinitions:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "mutableCopy");
    resourceNodes = v6->_resourceNodes;
    v6->_resourceNodes = (NSMutableArray *)v8;

    objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
    v10 = objc_claimAutoreleasedReturnValue();
    targetSelectorTable = v6->_targetSelectorTable;
    v6->_targetSelectorTable = (NSMapTable *)v10;

    -[NSMutableArray makeObjectsPerformSelector:withObject:](v6->_resourceNodes, "makeObjectsPerformSelector:withObject:", sel_setDelegate_, v6);
  }

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetSelectorTable, 0);
  objc_storeStrong((id *)&self->_unavailableResourceErrors, 0);
  objc_storeStrong((id *)&self->_unavailableResources, 0);
  objc_storeStrong((id *)&self->_resourceNodes, 0);
}

- (id)resourceObjectsOfClass:(Class)a3
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFResourceManager resourceObjectsOfClasses:](self, "resourceObjectsOfClasses:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)resourceObjectsOfClasses:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  if (objc_msgSend(v4, "anyObject"))
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    -[WFResourceManager resourceNodes](self, "resourceNodes", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v13;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v13 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v10++), "addResourceObjectsOfClassesOrProtocols:toSet:", v4, v5);
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v8);
    }

  }
  return v5;
}

- (NSArray)resourceNodes
{
  os_unfair_lock_s *p_stateLock;
  void *v4;

  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  v4 = (void *)-[NSMutableArray copy](self->_resourceNodes, "copy");
  os_unfair_lock_unlock(p_stateLock);
  return (NSArray *)v4;
}

- (void)refreshAvailabilityOfRequiredResourcesOfClasses:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  int v12;
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
  -[WFResourceManager resourceNodes](self, "resourceNodes", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v10, "resource");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = WFResourceClassIsInArray(v11, v4);

        if (v12)
          objc_msgSend(v10, "refreshAvailability");
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

}

- (BOOL)currentlyRequiresResourceOfClass:(Class)a3
{
  void *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v6[0] = a3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[WFResourceManager currentlyRequiresResourceOfClasses:](self, "currentlyRequiresResourceOfClasses:", v4);

  return (char)self;
}

- (BOOL)currentlyRequiresResourceOfClasses:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  char v12;
  BOOL v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[WFResourceManager resourceNodes](self, "resourceNodes", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v10, "resource");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = WFResourceClassIsInArray(v11, v4);

        if ((v12 & 1) != 0)
        {
          v13 = -[WFResourceManager nodeIsRelevant:](self, "nodeIsRelevant:", v10);
          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v7)
        continue;
      break;
    }
  }
  v13 = 0;
LABEL_11:

  return v13;
}

- (NSSet)accessResources
{
  return (NSSet *)-[WFResourceManager resourceObjectsOfClass:](self, "resourceObjectsOfClass:", objc_opt_class());
}

- (id)currentlyRequiredResourcesOfClass:(Class)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[5];

  v4 = (void *)MEMORY[0x1E0C99E40];
  -[WFResourceManager relevantNodes](self, "relevantNodes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __55__WFResourceManager_currentlyRequiredResourcesOfClass___block_invoke;
  v9[3] = &__block_descriptor_40_e39___WFResource_24__0__WFResourceNode_8Q16lu32l8;
  v9[4] = a3;
  objc_msgSend(v5, "if_compactMap:", v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "orderedSetWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)makeAccessResourcesAvailableWithUserInterface:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;

  v6 = a3;
  v7 = a4;
  -[WFResourceManager relevantNodes](self, "relevantNodes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "if_compactMap:", &__block_literal_global_60060);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v9, "count"))
  {
    v10 = (void *)objc_opt_new();
    v11 = MEMORY[0x1E0C809B0];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __85__WFResourceManager_makeAccessResourcesAvailableWithUserInterface_completionHandler___block_invoke_2;
    v16[3] = &unk_1E7AF8570;
    v17 = v6;
    v18 = v10;
    v13[0] = v11;
    v13[1] = 3221225472;
    v13[2] = __85__WFResourceManager_makeAccessResourcesAvailableWithUserInterface_completionHandler___block_invoke_4;
    v13[3] = &unk_1E7AF8598;
    v14 = v18;
    v15 = v7;
    v12 = v18;
    objc_msgSend(v9, "if_enumerateAsynchronouslyInSequence:completionHandler:", v16, v13);

  }
  else
  {
    v12 = (id)objc_opt_new();
    (*((void (**)(id, id))v7 + 2))(v7, v12);
  }

}

- (id)resourceObjectsConformingToProtocol:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[WFResourceManager resourceNodes](self, "resourceNodes", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v10);
        objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v4);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addResourceObjectsOfClassesOrProtocols:toSet:", v12, v5);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  return v5;
}

- (id)relevantNodes
{
  void *v3;
  void *v4;
  _QWORD v6[5];

  -[WFResourceManager resourceNodes](self, "resourceNodes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __34__WFResourceManager_relevantNodes__block_invoke;
  v6[3] = &unk_1E7AF85C0;
  v6[4] = self;
  objc_msgSend(v3, "if_objectsPassingTest:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)nodeIsRelevant:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  BOOL v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  objc_msgSend(a3, "subnodes", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        if (!-[WFResourceManager nodeIsAvailable:error:](self, "nodeIsAvailable:error:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i), 0))
        {
          v9 = 0;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        continue;
      break;
    }
  }
  v9 = 1;
LABEL_11:

  return v9;
}

- (BOOL)nodeIsAvailable:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  char v8;
  void *v10;
  void *v11;
  void *v12;

  v6 = a3;
  if (-[WFResourceManager nodeIsRelevant:](self, "nodeIsRelevant:", v6)
    && (objc_msgSend(v6, "resource"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "isAvailable"),
        v7,
        (v8 & 1) == 0))
  {
    if (a4)
    {
      objc_msgSend(v6, "resource");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "availabilityError");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        objc_msgSend(v6, "resource");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "availabilityError");
        *a4 = (id)objc_claimAutoreleasedReturnValue();

      }
      LOBYTE(a4) = 0;
    }
  }
  else
  {
    LOBYTE(a4) = 1;
  }

  return (char)a4;
}

- (void)evaluateAvailabilityOfNodesWithChangedNode:(id)a3
{
  id v4;
  uint64_t v5;
  _BOOL4 resourcesAvailable;
  _BOOL4 resourcesRequiredForDisplayAvailable;
  BOOL v8;
  BOOL v9;
  void *v10;
  uint64_t v11;
  char v12;
  char v13;
  NSMutableArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  char v21;
  void *v22;
  void *v23;
  char v24;
  void *v25;
  uint64_t v26;
  NSMutableOrderedSet *unavailableResources;
  NSOrderedSet *unavailableResourceErrors;
  int v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  os_unfair_lock_assert_owner(&self->_stateLock);
  if (v4)
  {
    v5 = -[NSMutableOrderedSet mutableCopy](self->_unavailableResources, "mutableCopy");
    resourcesAvailable = self->_resourcesAvailable;
    resourcesRequiredForDisplayAvailable = self->_resourcesRequiredForDisplayAvailable;
    if (-[WFResourceManager nodeIsAvailable:error:](self, "nodeIsAvailable:error:", v4, 0))
    {
      v8 = resourcesRequiredForDisplayAvailable;
      v9 = resourcesAvailable;
      objc_msgSend(v4, "resource");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v5, "removeObject:", v10);

      v11 = objc_msgSend((id)v5, "count");
      if (v11)
        v12 = v8;
      else
        v12 = 1;
      if (v11)
        v13 = v9;
      else
        v13 = 1;
    }
    else
    {
      objc_msgSend(v4, "resource");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend((id)objc_opt_class(), "mustBeAvailableForDisplay");

      if (resourcesRequiredForDisplayAvailable)
        v12 = v24 ^ 1;
      else
        v12 = 0;
      objc_msgSend(v4, "resource");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v5, "addObject:", v25);

      v13 = 0;
    }
  }
  else
  {
    v5 = objc_opt_new();
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v14 = self->_resourceNodes;
    v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v31;
      v12 = 1;
      v13 = 1;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v31 != v17)
            objc_enumerationMutation(v14);
          v19 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
          if (!-[WFResourceManager nodeIsAvailable:error:](self, "nodeIsAvailable:error:", v19, 0))
          {
            objc_msgSend(v19, "resource");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = objc_msgSend((id)objc_opt_class(), "mustBeAvailableForDisplay");

            v12 &= v21 ^ 1;
            objc_msgSend(v19, "resource");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend((id)v5, "addObject:", v22);

            v13 = 0;
          }
        }
        v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      }
      while (v16);
    }
    else
    {
      v12 = 1;
      v13 = 1;
    }

    self->_didEvaluateAvailabilityOfNodes = 1;
    v4 = 0;
  }
  objc_msgSend((id)v5, "if_compactMap:", &__block_literal_global_120_60056);
  v26 = objc_claimAutoreleasedReturnValue();
  unavailableResources = self->_unavailableResources;
  if (v5 | (unint64_t)unavailableResources
    && (-[NSMutableOrderedSet isEqualToOrderedSet:](unavailableResources, "isEqualToOrderedSet:", v5) & 1) == 0)
  {
    -[WFResourceManager setUnavailableResources:](self, "setUnavailableResources:", v5);
  }
  unavailableResourceErrors = self->_unavailableResourceErrors;
  if ((unint64_t)unavailableResourceErrors | v26
    && !-[NSOrderedSet isEqualToOrderedSet:](unavailableResourceErrors, "isEqualToOrderedSet:", v26))
  {
    -[WFResourceManager setUnavailableResourceErrors:](self, "setUnavailableResourceErrors:", v26);
    v29 = 1;
  }
  else
  {
    v29 = 0;
  }
  if (self->_resourcesAvailable != (v13 & 1))
  {
    -[WFResourceManager setResourcesAvailable:](self, "setResourcesAvailable:");
    v29 = 1;
  }
  if (self->_resourcesRequiredForDisplayAvailable != (v12 & 1))
    -[WFResourceManager setResourcesRequiredForDisplayAvailable:](self, "setResourcesRequiredForDisplayAvailable:");
  if (v29)
    -[WFResourceManager notifyTargets](self, "notifyTargets");

}

- (void)evaluateAvailabilityOfNodesIfNeeded
{
  if (!self->_didEvaluateAvailabilityOfNodes)
    -[WFResourceManager evaluateAvailabilityOfNodesWithChangedNode:](self, "evaluateAvailabilityOfNodesWithChangedNode:", 0);
}

- (BOOL)resourcesAvailable
{
  WFResourceManager *v2;
  os_unfair_lock_s *p_stateLock;

  v2 = self;
  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  -[WFResourceManager evaluateAvailabilityOfNodesIfNeeded](v2, "evaluateAvailabilityOfNodesIfNeeded");
  LOBYTE(v2) = v2->_resourcesAvailable;
  os_unfair_lock_unlock(p_stateLock);
  return (char)v2;
}

- (BOOL)resourcesRequiredForDisplayAvailable
{
  WFResourceManager *v2;
  os_unfair_lock_s *p_stateLock;

  v2 = self;
  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  -[WFResourceManager evaluateAvailabilityOfNodesIfNeeded](v2, "evaluateAvailabilityOfNodesIfNeeded");
  LOBYTE(v2) = v2->_resourcesRequiredForDisplayAvailable;
  os_unfair_lock_unlock(p_stateLock);
  return (char)v2;
}

- (NSMutableOrderedSet)unavailableResources
{
  os_unfair_lock_s *p_stateLock;
  NSMutableOrderedSet *v4;

  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  -[WFResourceManager evaluateAvailabilityOfNodesIfNeeded](self, "evaluateAvailabilityOfNodesIfNeeded");
  v4 = self->_unavailableResources;
  os_unfair_lock_unlock(p_stateLock);
  return v4;
}

- (NSOrderedSet)unavailableResourceErrors
{
  os_unfair_lock_s *p_stateLock;
  NSOrderedSet *v4;

  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  -[WFResourceManager evaluateAvailabilityOfNodesIfNeeded](self, "evaluateAvailabilityOfNodesIfNeeded");
  v4 = self->_unavailableResourceErrors;
  os_unfair_lock_unlock(p_stateLock);
  return v4;
}

- (void)resourceNodeAvailabilityChanged:(id)a3
{
  os_unfair_lock_s *p_stateLock;
  id v5;

  p_stateLock = &self->_stateLock;
  v5 = a3;
  os_unfair_lock_lock(p_stateLock);
  -[WFResourceManager evaluateAvailabilityOfNodesIfNeeded](self, "evaluateAvailabilityOfNodesIfNeeded");
  -[WFResourceManager evaluateAvailabilityOfNodesWithChangedNode:](self, "evaluateAvailabilityOfNodesWithChangedNode:", v5);

  os_unfair_lock_unlock(p_stateLock);
}

- (void)notifyTargets
{
  os_unfair_lock_s *p_targetSelectorLock;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  WFResourceManager *v9;

  p_targetSelectorLock = &self->_targetSelectorLock;
  os_unfair_lock_lock(&self->_targetSelectorLock);
  -[WFResourceManager targetSelectorTable](self, "targetSelectorTable");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  os_unfair_lock_unlock(p_targetSelectorLock);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __34__WFResourceManager_notifyTargets__block_invoke;
  v7[3] = &unk_1E7AF92C0;
  v8 = v5;
  v9 = self;
  v6 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v7);

}

- (id)selectorSetForTarget:(id)a3
{
  os_unfair_lock_s *p_targetSelectorLock;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;

  p_targetSelectorLock = &self->_targetSelectorLock;
  v5 = a3;
  os_unfair_lock_assert_owner(p_targetSelectorLock);
  -[WFResourceManager targetSelectorTable](self, "targetSelectorTable");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    v8 = v7;
  else
    v8 = (id)objc_opt_new();
  v9 = v8;

  return v9;
}

- (void)addTarget:(id)a3 selector:(SEL)a4
{
  void *v6;
  os_unfair_lock_s *p_targetSelectorLock;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  NSStringFromSelector(a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  p_targetSelectorLock = &self->_targetSelectorLock;
  os_unfair_lock_lock(&self->_targetSelectorLock);
  -[WFResourceManager selectorSetForTarget:](self, "selectorSetForTarget:", v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "containsObject:", v6) & 1) == 0)
  {
    -[WFResourceManager targetSelectorTable](self, "targetSelectorTable");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setByAddingObject:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", v10, v11);

  }
  os_unfair_lock_unlock(p_targetSelectorLock);

}

- (void)removeTarget:(id)a3 selector:(SEL)a4
{
  void *v6;
  os_unfair_lock_s *p_targetSelectorLock;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;

  v13 = a3;
  NSStringFromSelector(a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  p_targetSelectorLock = &self->_targetSelectorLock;
  os_unfair_lock_lock(&self->_targetSelectorLock);
  -[WFResourceManager targetSelectorTable](self, "targetSelectorTable");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __43__WFResourceManager_removeTarget_selector___block_invoke;
  v14[3] = &unk_1E7AF8628;
  v15 = v6;
  v10 = v6;
  objc_msgSend(v9, "objectsPassingTest:", v14);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v11, "count"))
  {
    -[WFResourceManager targetSelectorTable](self, "targetSelectorTable");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKey:", v11, v13);
LABEL_5:

    goto LABEL_6;
  }
  if (v11)
  {
    -[WFResourceManager targetSelectorTable](self, "targetSelectorTable");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "removeObjectForKey:", v13);
    goto LABEL_5;
  }
LABEL_6:
  os_unfair_lock_unlock(p_targetSelectorLock);

}

- (void)addResource:(id)a3
{
  id v4;
  WFResourceNode *v5;
  void *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[WFResourceNode initWithResource:]([WFResourceNode alloc], "initWithResource:", v4);

  v7[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFResourceManager addResourceNodes:](self, "addResourceNodes:", v6);

}

- (void)addResourceNodes:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  os_unfair_lock_lock(&self->_stateLock);
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        objc_msgSend(v10, "setDelegate:", self, (_QWORD)v11);
        -[NSMutableArray addObject:](self->_resourceNodes, "addObject:", v10);
        -[WFResourceManager evaluateAvailabilityOfNodesWithChangedNode:](self, "evaluateAvailabilityOfNodesWithChangedNode:", v10);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

  os_unfair_lock_unlock(&self->_stateLock);
}

- (void)removeResourceNodes:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  os_unfair_lock_lock(&self->_stateLock);
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i);
        -[NSMutableArray removeObject:](self->_resourceNodes, "removeObject:", v10, (_QWORD)v11);
        -[WFResourceManager evaluateAvailabilityOfNodesWithChangedNode:](self, "evaluateAvailabilityOfNodesWithChangedNode:", v10);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

  os_unfair_lock_unlock(&self->_stateLock);
}

- (void)setResourcesAvailable:(BOOL)a3
{
  self->_resourcesAvailable = a3;
}

- (void)setResourcesRequiredForDisplayAvailable:(BOOL)a3
{
  self->_resourcesRequiredForDisplayAvailable = a3;
}

- (void)setUnavailableResources:(id)a3
{
  objc_storeStrong((id *)&self->_unavailableResources, a3);
}

- (void)setUnavailableResourceErrors:(id)a3
{
  objc_storeStrong((id *)&self->_unavailableResourceErrors, a3);
}

- (void)setResourceNodes:(id)a3
{
  objc_storeStrong((id *)&self->_resourceNodes, a3);
}

- (NSMapTable)targetSelectorTable
{
  return self->_targetSelectorTable;
}

- (void)setTargetSelectorTable:(id)a3
{
  objc_storeStrong((id *)&self->_targetSelectorTable, a3);
}

- (BOOL)didEvaluateAvailabilityOfNodes
{
  return self->_didEvaluateAvailabilityOfNodes;
}

- (os_unfair_lock_s)stateLock
{
  return self->_stateLock;
}

- (os_unfair_lock_s)targetSelectorLock
{
  return self->_targetSelectorLock;
}

uint64_t __43__WFResourceManager_removeTarget_selector___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", a2) ^ 1;
}

void __34__WFResourceManager_notifyTargets__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "keyEnumerator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v18;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v18 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v6);
        v13 = 0u;
        v14 = 0u;
        v15 = 0u;
        v16 = 0u;
        objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v7, 0);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v21, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v14;
          do
          {
            v12 = 0;
            do
            {
              if (*(_QWORD *)v14 != v11)
                objc_enumerationMutation(v8);
              objc_msgSend(v7, "performSelector:withObject:", NSSelectorFromString(*(NSString **)(*((_QWORD *)&v13 + 1) + 8 * v12++)), *(_QWORD *)(a1 + 40));
            }
            while (v10 != v12);
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v21, 16);
          }
          while (v10);
        }

        ++v6;
      }
      while (v6 != v4);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    }
    while (v4);
  }

}

uint64_t __64__WFResourceManager_evaluateAvailabilityOfNodesWithChangedNode___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "availabilityError");
}

uint64_t __34__WFResourceManager_relevantNodes__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "nodeIsRelevant:", a2);
}

void __85__WFResourceManager_makeAccessResourcesAvailableWithUserInterface_completionHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v6 = a4;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __85__WFResourceManager_makeAccessResourcesAvailableWithUserInterface_completionHandler___block_invoke_3;
  v9[3] = &unk_1E7AF8548;
  v7 = *(_QWORD *)(a1 + 32);
  v10 = *(id *)(a1 + 40);
  v11 = v6;
  v8 = v6;
  objc_msgSend(a2, "makeAvailableWithUserInterface:completionHandler:", v7, v9);

}

void __85__WFResourceManager_makeAccessResourcesAvailableWithUserInterface_completionHandler___block_invoke_4(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  v2 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", *(_QWORD *)(a1 + 32));
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

uint64_t __85__WFResourceManager_makeAccessResourcesAvailableWithUserInterface_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
    objc_msgSend(*(id *)(a1 + 32), "addObject:");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

id __85__WFResourceManager_makeAccessResourcesAvailableWithUserInterface_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  char isKindOfClass;
  void *v5;
  uint64_t v6;
  int v7;
  int v8;
  void *v9;
  id v10;

  v2 = a2;
  objc_msgSend(v2, "resource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v2, "resource");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "status");
    v7 = objc_msgSend((id)objc_opt_class(), "alwaysMakeAvailable");
    if (v6 == 1)
      v8 = 1;
    else
      v8 = v7;
    if (v8)
      v9 = v5;
    else
      v9 = 0;
    v10 = v9;

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

id __55__WFResourceManager_currentlyRequiredResourcesOfClass___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;

  v2 = a2;
  objc_msgSend(v2, "resource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v2, "resource");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

@end
