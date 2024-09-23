@implementation RBAssertionResolutionContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemState, 0);
  objc_storeStrong((id *)&self->_savedEndowments, 0);
  objc_storeStrong((id *)&self->_entitlementManager, 0);
  objc_storeStrong((id *)&self->_bundlePropertiesManager, 0);
  objc_storeStrong((id *)&self->_domainAttributeManager, 0);
  objc_storeStrong((id *)&self->_stateMap, 0);
  objc_storeStrong((id *)&self->_processIndex, 0);
  objc_storeStrong((id *)&self->_assertionCollection, 0);
  objc_storeStrong((id *)&self->_changeSet, 0);
  objc_storeStrong((id *)&self->_attributeContext, 0);
  objc_storeStrong((id *)&self->_originatorInheritances, 0);
  objc_storeStrong((id *)&self->_resolvedState, 0);
  objc_storeStrong((id *)&self->_targetsPendingResolution, 0);
  objc_storeStrong((id *)&self->_gainedStartTimeDefining, 0);
  objc_storeStrong((id *)&self->_lostStartTimeDefining, 0);
  objc_storeStrong((id *)&self->_touchedAssertions, 0);
  objc_storeStrong((id *)&self->_assertions, 0);
}

- (void)_resolveProcessStateForTarget:(id)a3 ofType:(unint64_t)a4 viaAssertion:(id)a5
{
  id v9;
  id v10;
  NSMutableSet *targetsPendingResolution;
  NSMutableSet *v12;
  NSMutableSet *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  RBMutableProcessState *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  RBAttributeContext *attributeContext;
  void *v27;
  RBAttributeContext *v28;
  NSMapTable *savedEndowments;
  void *v30;
  void *v31;
  RBMutableProcessState *v32;
  id v33;
  RBProcessMap *originatorInheritances;
  void *v35;
  id v36;
  void *v37;
  SEL v38;
  void *v39;
  void *v40;
  id v41;
  id v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a5;
  if ((objc_msgSend(v9, "isSystem") & 1) != 0)
    goto LABEL_27;
  targetsPendingResolution = self->_targetsPendingResolution;
  if (a4 == 3)
  {
    if (!targetsPendingResolution)
    {
      v12 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
      v13 = self->_targetsPendingResolution;
      self->_targetsPendingResolution = v12;

      targetsPendingResolution = self->_targetsPendingResolution;
    }
    -[NSMutableSet addObject:](targetsPendingResolution, "addObject:", v9);
    goto LABEL_27;
  }
  -[NSMutableSet removeObject:](targetsPendingResolution, "removeObject:", v9);
  objc_msgSend(v9, "identity");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[RBAssertionResolutionContext _latestStateForIdentity:](self, "_latestStateForIdentity:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (a4 == 1)
  {
    v17 = objc_msgSend(v15, "mutableCopy");
    if (v17)
    {
      v18 = (RBMutableProcessState *)v17;
      objc_msgSend(v10, "processState");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[RBMutableProcessState unionState:](v18, "unionState:", v19);

      if (!v16)
        goto LABEL_22;
LABEL_21:
      if (-[RBProcessState isEqualToProcessStateIgnoringIdentity:](v18, "isEqualToProcessStateIgnoringIdentity:", v16))
        goto LABEL_23;
      goto LABEL_22;
    }
  }
  v38 = a2;
  v39 = v16;
  v41 = v10;
  v42 = v9;
  v18 = -[RBProcessState initWithIdentity:]([RBMutableProcessState alloc], "initWithIdentity:", v14);
  v40 = v14;
  -[RBAssertionCollection assertionsForTargetIdentity:](self->_assertionCollection, "assertionsForTargetIdentity:", v14);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v44;
    do
    {
      for (i = 0; i != v22; ++i)
      {
        if (*(_QWORD *)v44 != v23)
          objc_enumerationMutation(v20);
        v25 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
        if (objc_msgSend(v25, "isActive"))
        {
          -[RBAttributeContext setAssertion:](self->_attributeContext, "setAssertion:", v25);
          attributeContext = self->_attributeContext;
          -[RBAssertionResolutionContext _originatorInheritancesForAssertion:](self, "_originatorInheritancesForAssertion:", v25);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          -[RBAttributeContext setAvailableInheritances:](attributeContext, "setAvailableInheritances:", v27);

          v28 = self->_attributeContext;
          savedEndowments = self->_savedEndowments;
          objc_msgSend(v25, "originator");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMapTable objectForKey:](savedEndowments, "objectForKey:", v30);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          -[RBAttributeContext setSavedEndowments:](v28, "setSavedEndowments:", v31);

          -[RBAttributeContext setSystemState:](self->_attributeContext, "setSystemState:", self->_systemState);
          objc_msgSend(v25, "applyToProcessState:withAttributeContext:", v18, self->_attributeContext);
        }
      }
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
    }
    while (v22);
  }

  v10 = v41;
  v9 = v42;
  v16 = v39;
  v14 = v40;
  if (!v18)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "handleFailureInMethod:object:file:lineNumber:description:", v38, self, CFSTR("RBAssertionStateResolver.m"), 537, CFSTR("cannot get this far without state"));

    if (!v39)
      goto LABEL_22;
    goto LABEL_21;
  }
  if (v39)
    goto LABEL_21;
LABEL_22:
  v32 = (RBMutableProcessState *)-[RBMutableProcessState copy](v18, "copy");

  v33 = -[RBProcessMap setValue:forIdentity:](self->_resolvedState, "setValue:forIdentity:", v32, v14);
  originatorInheritances = self->_originatorInheritances;
  -[RBProcessState inheritances](v32, "inheritances");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = -[RBProcessMap setValue:forIdentity:](originatorInheritances, "setValue:forIdentity:", v35, v14);

  -[RBAssertionResolutionContext _suspendOrResumeAssertionsForTarget:oldState:newState:](self, "_suspendOrResumeAssertionsForTarget:oldState:newState:", v14, v16, v32);
  v18 = v32;
LABEL_23:
  if (-[RBProcessState preventSuspend](v18, "preventSuspend")
    && -[RBProcessState targetedBySuspendableAssertion](v18, "targetedBySuspendableAssertion"))
  {
    -[RBAssertionResolutionContext _checkForSuspendableAssertionCycle:newState:](self, "_checkForSuspendableAssertionCycle:newState:", v14, v18);
  }

LABEL_27:
}

- (void)_updateStatesForAssertion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  RBAttributeContext *attributeContext;
  void *v15;
  RBAttributeContext *v16;
  NSMapTable *savedEndowments;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[RBAssertionResolutionContext _assertionGraphFromAssertion:](self, "_assertionGraphFromAssertion:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x24BDBCEE0];
  v28 = v4;
  objc_msgSend(v4, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "orderedSetWithObject:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "count"))
  {
    v29 = v5;
    do
    {
      v10 = (void *)MEMORY[0x22074BD78]();
      objc_msgSend(v8, "firstObject");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "removeObjectAtIndex:", 0);
      objc_msgSend(v9, "addObject:", v11);
      -[RBAssertionCollection assertionWithIdentifier:](self->_assertionCollection, "assertionWithIdentifier:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "originator");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        -[NSMutableSet addObject:](self->_touchedAssertions, "addObject:", v12);
        -[RBAttributeContext setAssertion:](self->_attributeContext, "setAssertion:", v12);
        attributeContext = self->_attributeContext;
        v31 = v13;
        -[RBAssertionResolutionContext _inheritancesForOriginator:](self, "_inheritancesForOriginator:", v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[RBAttributeContext setAvailableInheritances:](attributeContext, "setAvailableInheritances:", v15);

        v16 = self->_attributeContext;
        savedEndowments = self->_savedEndowments;
        objc_msgSend(v12, "originator");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMapTable objectForKey:](savedEndowments, "objectForKey:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[RBAttributeContext setSavedEndowments:](v16, "setSavedEndowments:", v19);

        -[RBAttributeContext setSystemState:](self->_attributeContext, "setSystemState:", self->_systemState);
        if (objc_msgSend(v12, "resolveStateWithContext:", self->_attributeContext))
        {
          if (-[RBAssertionCollection hasResolvedAssertion:](self->_assertionCollection, "hasResolvedAssertion:", v12))
          {
            if (objc_msgSend(v12, "invalidationReason"))
              v20 = 3;
            else
              v20 = 2;
          }
          else
          {
            v20 = 1;
          }
          objc_msgSend(v12, "target");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          -[RBAssertionResolutionContext _resolveProcessStateForTarget:ofType:viaAssertion:](self, "_resolveProcessStateForTarget:ofType:viaAssertion:", v27, v20, v12);

          objc_msgSend(v5, "objectForKeyedSubscript:", v11);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "unionSet:", v21);
        }
        else
        {
          v34 = 0u;
          v35 = 0u;
          v32 = 0u;
          v33 = 0u;
          objc_msgSend(v5, "objectForKeyedSubscript:", v11);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
          if (v22)
          {
            v23 = v22;
            v30 = v10;
            v24 = *(_QWORD *)v33;
            do
            {
              for (i = 0; i != v23; ++i)
              {
                if (*(_QWORD *)v33 != v24)
                  objc_enumerationMutation(v21);
                v26 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * i);
                if ((objc_msgSend(v9, "containsObject:", v26) & 1) == 0)
                  objc_msgSend(v8, "addObject:", v26);
              }
              v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
            }
            while (v23);
            v5 = v29;
            v10 = v30;
          }
        }

        -[RBAssertionCollection noteResolvedAssertion:](self->_assertionCollection, "noteResolvedAssertion:", v12);
        v13 = v31;
      }

      objc_autoreleasePoolPop(v10);
    }
    while (objc_msgSend(v8, "count"));
  }

}

- (id)_inheritancesForOriginator:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;
  void *v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "identity");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[RBProcessMap containsIdentity:](self->_originatorInheritances, "containsIdentity:", v6))
    {
      -[RBProcessMap valueForIdentity:](self->_originatorInheritances, "valueForIdentity:", v6);
      v7 = (id)objc_claimAutoreleasedReturnValue();
LABEL_26:

      goto LABEL_27;
    }
    if (-[RBProcessMap containsIdentity:](self->_resolvedState, "containsIdentity:", v6))
    {
      -[RBProcessMap valueForIdentity:](self->_resolvedState, "valueForIdentity:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "inheritances");
      v7 = (id)objc_claimAutoreleasedReturnValue();

      v9 = -[RBProcessMap setValue:forIdentity:](self->_originatorInheritances, "setValue:forIdentity:", v7, v6);
      goto LABEL_26;
    }
    -[RBProcessMap valueForIdentity:](self->_stateMap, "valueForIdentity:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "inheritances");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v27 = 0u;
      v28 = 0u;
      v25 = 0u;
      v26 = 0u;
      v7 = v11;
      v12 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      if (v12)
      {
        v13 = v12;
        v23 = v10;
        v24 = v6;
        v14 = 0;
        v15 = *(_QWORD *)v26;
        do
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v26 != v15)
              objc_enumerationMutation(v7);
            v17 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
            objc_msgSend(v17, "originatingIdentifier", v23);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            -[RBAssertionCollection assertionWithIdentifier:](self->_assertionCollection, "assertionWithIdentifier:", v18);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v19, "isActive") & 1) == 0)
            {
              if (!v14)
                v14 = (void *)objc_msgSend(v7, "mutableCopy");
              objc_msgSend(v14, "removeInheritance:", v17);
            }

          }
          v13 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
        }
        while (v13);

        v10 = v23;
        if (!v14)
        {
          v6 = v24;
          goto LABEL_25;
        }
        v20 = objc_msgSend(v14, "copy");

        v7 = (id)v20;
        v6 = v24;
      }
      else
      {
        v14 = v7;
      }

    }
    else
    {
      v7 = 0;
    }
LABEL_25:
    v21 = -[RBProcessMap setValue:forIdentity:](self->_originatorInheritances, "setValue:forIdentity:", v7, v6);

    goto LABEL_26;
  }
  v7 = 0;
LABEL_27:

  return v7;
}

- (id)_assertionGraphFromAssertion:(id)a3
{
  void *v4;
  id v5;
  void *v6;

  v4 = (void *)MEMORY[0x24BDBCED8];
  v5 = a3;
  objc_msgSend(v4, "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[RBAssertionResolutionContext _assertionGraphFromAssertion:graph:](self, "_assertionGraphFromAssertion:graph:", v5, v6);

  return v6;
}

- (void)_assertionGraphFromAssertion:(id)a3 graph:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  RBProcessIndex *processIndex;
  void *v13;
  void *v14;
  RBAssertionResolutionContext *v15;
  RBAssertionCollection *assertionCollection;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:");
    if (objc_msgSend(v6, "hasHereditaryGrant"))
    {
      objc_msgSend(v6, "target");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "process");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11
        || (processIndex = self->_processIndex,
            objc_msgSend(v10, "identity"),
            v13 = (void *)objc_claimAutoreleasedReturnValue(),
            -[RBProcessIndex processForIdentity:](processIndex, "processForIdentity:", v13),
            v11 = (void *)objc_claimAutoreleasedReturnValue(),
            v13,
            v11))
      {
        v30 = v8;
        v31 = v6;
        v29 = v10;
        objc_msgSend(v10, "environment");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = self;
        assertionCollection = self->_assertionCollection;
        v28 = v11;
        objc_msgSend(v11, "identifier");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[RBAssertionCollection assertionsForOriginator:](assertionCollection, "assertionsForOriginator:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        v35 = 0u;
        v36 = 0u;
        v33 = 0u;
        v34 = 0u;
        v19 = v18;
        v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
        if (v20)
        {
          v21 = v20;
          v22 = *(_QWORD *)v34;
          do
          {
            for (i = 0; i != v21; ++i)
            {
              if (*(_QWORD *)v34 != v22)
                objc_enumerationMutation(v19);
              v24 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
              objc_msgSend(v24, "sourceEnvironments");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              v26 = objc_msgSend(v25, "containsObject:", v14);

              if (v26)
              {
                objc_msgSend(v24, "identifier");
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v32, "addObject:", v27);

                -[RBAssertionResolutionContext _assertionGraphFromAssertion:graph:](v15, "_assertionGraphFromAssertion:graph:", v24, v7);
              }
            }
            v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
          }
          while (v21);
        }

        v8 = v30;
        v6 = v31;
        v10 = v29;
      }

    }
  }

}

- (void)resolve
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    v2 = (void *)MEMORY[0x22074BD78]();
    objc_msgSend(*(id *)(a1 + 64), "setDomainAttributeManager:", *(_QWORD *)(a1 + 104));
    objc_msgSend(*(id *)(a1 + 64), "setBundlePropertiesManager:", *(_QWORD *)(a1 + 112));
    objc_msgSend(*(id *)(a1 + 64), "setEntitlementManager:", *(_QWORD *)(a1 + 120));
    objc_msgSend(*(id *)(a1 + 64), "setSystemState:", *(_QWORD *)(a1 + 136));
    while (objc_msgSend(*(id *)(a1 + 8), "count"))
    {
      while (objc_msgSend(*(id *)(a1 + 8), "count"))
      {
        objc_msgSend(*(id *)(a1 + 8), "anyObject");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 8), "removeObject:", v3);
        objc_msgSend((id)a1, "_updateStatesForAssertion:", v3);

      }
      objc_msgSend(*(id *)(a1 + 40), "allObjects");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "removeAllObjects");
      v12 = 0u;
      v13 = 0u;
      v10 = 0u;
      v11 = 0u;
      v5 = v4;
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v6)
      {
        v7 = v6;
        v8 = *(_QWORD *)v11;
        do
        {
          v9 = 0;
          do
          {
            if (*(_QWORD *)v11 != v8)
              objc_enumerationMutation(v5);
            objc_msgSend((id)a1, "_resolveProcessStateForTarget:ofType:viaAssertion:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++), 0, 0);
          }
          while (v7 != v9);
          v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
        }
        while (v7);
      }

    }
    objc_msgSend((id)a1, "_finalizeStateChangeSet");
    objc_msgSend((id)a1, "_resolveSystemState");
    objc_autoreleasePoolPop(v2);
  }
}

- (void)_resolveSystemState
{
  RBMutableSystemState *v3;
  RBAssertionCollection *assertionCollection;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  RBAttributeContext *attributeContext;
  void *v14;
  RBAttributeContext *v15;
  NSMapTable *savedEndowments;
  void *v17;
  void *v18;
  RBSystemState *v19;
  RBSystemState *systemState;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(RBMutableSystemState);
  assertionCollection = self->_assertionCollection;
  +[RBConcreteTarget systemTarget](RBConcreteTarget, "systemTarget");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[RBAssertionCollection assertionsForTarget:](assertionCollection, "assertionsForTarget:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v22 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        if (objc_msgSend(v12, "isActive", (_QWORD)v21))
        {
          -[RBAttributeContext setAssertion:](self->_attributeContext, "setAssertion:", v12);
          attributeContext = self->_attributeContext;
          -[RBAssertionResolutionContext _originatorInheritancesForAssertion:](self, "_originatorInheritancesForAssertion:", v12);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[RBAttributeContext setAvailableInheritances:](attributeContext, "setAvailableInheritances:", v14);

          v15 = self->_attributeContext;
          savedEndowments = self->_savedEndowments;
          objc_msgSend(v12, "originator");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMapTable objectForKey:](savedEndowments, "objectForKey:", v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          -[RBAttributeContext setSavedEndowments:](v15, "setSavedEndowments:", v18);

          -[RBAttributeContext setSystemState:](self->_attributeContext, "setSystemState:", self->_systemState);
          objc_msgSend(v12, "applyToSystemState:withAttributeContext:", v3, self->_attributeContext);
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v9);
  }

  v19 = (RBSystemState *)-[RBMutableSystemState copy](v3, "copy");
  systemState = self->_systemState;
  self->_systemState = v19;

}

- (id)_latestStateForIdentity:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  v4 = a3;
  if (v4)
  {
    -[RBProcessMap valueForIdentity:](self->_resolvedState, "valueForIdentity:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      v7 = v5;
    }
    else
    {
      -[RBProcessMap valueForIdentity:](self->_stateMap, "valueForIdentity:", v4);
      v7 = (id)objc_claimAutoreleasedReturnValue();
    }
    v8 = v7;

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)_originatorInheritancesForAssertion:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "originator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[RBAssertionResolutionContext _inheritancesForOriginator:](self, "_inheritancesForOriginator:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)_finalizeStateChangeSet
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  RBProcessStateChange *v9;
  void *v10;
  void *v11;
  RBProcessStateChange *v12;
  RBProcessStateChangeSet *v13;
  RBProcessStateChangeSet *changeSet;
  id obj;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[RBProcessMap allIdentities](self->_resolvedState, "allIdentities");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v17;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v17 != v6)
          objc_enumerationMutation(obj);
        v8 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v7);
        v9 = [RBProcessStateChange alloc];
        -[RBProcessMap valueForIdentity:](self->_stateMap, "valueForIdentity:", v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[RBProcessMap valueForIdentity:](self->_resolvedState, "valueForIdentity:", v8);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = -[RBProcessStateChange initWithIdentity:originalState:updatedState:](v9, "initWithIdentity:originalState:updatedState:", v8, v10, v11);

        objc_msgSend(v3, "addObject:", v12);
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v5);
  }

  v13 = -[RBProcessStateChangeSet initWithChanges:]([RBProcessStateChangeSet alloc], "initWithChanges:", v3);
  changeSet = self->_changeSet;
  self->_changeSet = v13;

}

- (RBSystemState)systemState
{
  return self->_systemState;
}

- (RBProcessStateChangeSet)changeSet
{
  return self->_changeSet;
}

- (NSSet)touchedAssertions
{
  return &self->_touchedAssertions->super;
}

- (NSSet)lostStartTimeDefining
{
  return &self->_lostStartTimeDefining->super;
}

- (NSSet)gainedStartTimeDefining
{
  return &self->_gainedStartTimeDefining->super;
}

- (void)setSystemState:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 136), a2);
}

- (void)setStateMap:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 96), a2);
}

- (void)setSavedEndowments:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 128), a2);
}

- (void)setProcessIndex:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 88), a2);
}

- (void)setEntitlementManager:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 120), a2);
}

- (void)setDomainAttributeManager:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 104), a2);
}

- (void)setBundlePropertiesManager:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 112), a2);
}

- (void)setAssertionCollection:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 80), a2);
}

- (_QWORD)initWithAssertions:(_QWORD *)a1
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  RBProcessMap *v12;
  void *v13;
  RBProcessMap *v14;
  void *v15;
  RBAttributeContext *v16;
  void *v17;
  objc_super v19;

  v3 = a2;
  if (a1)
  {
    v19.receiver = a1;
    v19.super_class = (Class)RBAssertionResolutionContext;
    a1 = objc_msgSendSuper2(&v19, sel_init);
    if (a1)
    {
      v4 = objc_msgSend(v3, "mutableCopy");
      v5 = (void *)a1[1];
      a1[1] = v4;

      v6 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
      v7 = (void *)a1[2];
      a1[2] = v6;

      v8 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
      v9 = (void *)a1[3];
      a1[3] = v8;

      v10 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
      v11 = (void *)a1[4];
      a1[4] = v10;

      v12 = objc_alloc_init(RBProcessMap);
      v13 = (void *)a1[6];
      a1[6] = v12;

      v14 = objc_alloc_init(RBProcessMap);
      v15 = (void *)a1[7];
      a1[7] = v14;

      v16 = objc_alloc_init(RBAttributeContext);
      v17 = (void *)a1[8];
      a1[8] = v16;

    }
  }

  return a1;
}

- (void)_suspendOrResumeAssertionsForTarget:(id)a3 oldState:(id)a4 newState:(id)a5
{
  id v8;
  id v9;
  int v10;
  int v11;
  char v12;
  void *v13;
  RBAssertionCollection *assertionCollection;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  v10 = objc_msgSend(a4, "preventSuspend");
  v11 = objc_msgSend(v9, "preventSuspend");
  if (v10 != v11)
  {
    v12 = v11;
    -[RBProcessIndex processForIdentity:](self->_processIndex, "processForIdentity:", v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "isLifecycleManaged"))
    {
      if ((v12 & 1) != 0)
      {
        if ((v10 & 1) == 0)
        {
          v26 = 0u;
          v27 = 0u;
          v24 = 0u;
          v25 = 0u;
          assertionCollection = self->_assertionCollection;
          objc_msgSend(v13, "identifier", 0);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[RBAssertionCollection assertionsForOriginator:](assertionCollection, "assertionsForOriginator:", v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
          if (v17)
          {
            v18 = v17;
            v19 = *(_QWORD *)v25;
            do
            {
              for (i = 0; i != v18; ++i)
              {
                if (*(_QWORD *)v25 != v19)
                  objc_enumerationMutation(v16);
                v21 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
                if (objc_msgSend(v21, "suspendsOnOriginatorSuspension"))
                {
                  if (objc_msgSend(v21, "isSuspended"))
                  {
                    if (objc_msgSend(v21, "isValid"))
                    {
                      objc_msgSend(v21, "resume");
                      -[NSMutableSet addObject:](self->_assertions, "addObject:", v21);
                      if (objc_msgSend(v21, "definesRelativeStartTime"))
                      {
                        objc_msgSend(v21, "target");
                        v22 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v22, "identity");
                        v23 = (void *)objc_claimAutoreleasedReturnValue();

                        if (v23)
                          -[NSMutableSet addObject:](self->_gainedStartTimeDefining, "addObject:", v23);

                      }
                    }
                  }
                }
              }
              v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
            }
            while (v18);
          }

        }
      }
      else
      {
        -[RBAssertionResolutionContext _suspendAssertionsForTarget:](self, "_suspendAssertionsForTarget:", v13);
      }
    }

  }
}

- (void)_checkForSuspendableAssertionCycle:(id)a3 newState:(id)a4
{
  id v5;
  void *v6;
  RBAssertionCollection *assertionCollection;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  uint64_t i;
  unint64_t v15;
  NSObject *v16;
  NSObject *v17;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  RBAssertionCollection *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  void *v30;
  void *v31;
  int v32;
  void *v33;
  char v34;
  void *v35;
  char v36;
  NSObject *v37;
  void *v38;
  NSObject *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t k;
  const char *v44;
  NSObject *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  id v52;
  void *v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  uint8_t v70[128];
  uint8_t buf[4];
  id v72;
  __int16 v73;
  void *v74;
  _BYTE v75[128];
  _BYTE v76[128];
  _BYTE v77[128];
  uint64_t v78;

  v78 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  -[RBProcessIndex processForIdentity:](self->_processIndex, "processForIdentity:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "isLifecycleManaged") & 1) == 0)
  {
    rbs_assertion_log();
    v16 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      goto LABEL_57;
    *(_DWORD *)buf = 138543362;
    v72 = v5;
    v44 = "_checkForSuspendableAssertionCycle for %{public}@ bailing out since it's not managed";
LABEL_50:
    _os_log_impl(&dword_21A8B4000, v16, OS_LOG_TYPE_INFO, v44, buf, 0xCu);
    goto LABEL_57;
  }
  v68 = 0u;
  v69 = 0u;
  v66 = 0u;
  v67 = 0u;
  assertionCollection = self->_assertionCollection;
  objc_msgSend(v6, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[RBAssertionCollection assertionsForOriginator:](assertionCollection, "assertionsForOriginator:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v66, v77, 16);
  if (!v10)
  {

LABEL_48:
    rbs_assertion_log();
    v16 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      goto LABEL_57;
    *(_DWORD *)buf = 138543362;
    v72 = v5;
    v44 = "_checkForSuspendableAssertionCycle for %{public}@ bailing out since it's not holding a suspendable assertion";
    goto LABEL_50;
  }
  v11 = v10;
  v12 = 0;
  v13 = *(_QWORD *)v67;
  do
  {
    for (i = 0; i != v11; ++i)
    {
      if (*(_QWORD *)v67 != v13)
        objc_enumerationMutation(v9);
      v12 |= objc_msgSend(*(id *)(*((_QWORD *)&v66 + 1) + 8 * i), "suspendsOnOriginatorSuspension");
    }
    v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v66, v77, 16);
  }
  while (v11);

  if ((v12 & 1) == 0)
    goto LABEL_48;
  v52 = v5;
  v15 = 0x24BDBC000uLL;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v16 = objc_claimAutoreleasedReturnValue();
  -[NSObject addObject:](v16, "addObject:", v6);
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  while (-[NSObject count](v16, "count"))
  {
    v17 = v16;
    v18 = -[NSObject copy](v16, "copy");
    objc_msgSend(v53, "addObjectsFromArray:", v16);
    objc_msgSend(*(id *)(v15 + 3768), "array");
    v16 = objc_claimAutoreleasedReturnValue();

    v64 = 0u;
    v65 = 0u;
    v62 = 0u;
    v63 = 0u;
    v19 = v18;
    v49 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v62, v76, 16);
    if (!v49)
      goto LABEL_34;
    v20 = *(_QWORD *)v63;
    v51 = v6;
    v47 = *(_QWORD *)v63;
    do
    {
      v21 = 0;
      do
      {
        if (*(_QWORD *)v63 != v20)
          objc_enumerationMutation(v19);
        v50 = v21;
        v22 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * v21);
        v58 = 0u;
        v59 = 0u;
        v60 = 0u;
        v61 = 0u;
        v23 = self->_assertionCollection;
        v48 = v22;
        objc_msgSend(v22, "identity", v47);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[RBAssertionCollection assertionsForTargetIdentity:](v23, "assertionsForTargetIdentity:", v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v58, v75, 16);
        if (!v26)
          goto LABEL_32;
        v27 = v26;
        v28 = *(_QWORD *)v59;
        while (2)
        {
          for (j = 0; j != v27; ++j)
          {
            if (*(_QWORD *)v59 != v28)
              objc_enumerationMutation(v25);
            v30 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * j);
            objc_msgSend(v30, "intransientState");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            if (!objc_msgSend(v31, "preventsSuspension"))
              goto LABEL_29;
            v32 = objc_msgSend(v30, "isActive");

            if (v32)
            {
              objc_msgSend(v30, "originator");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              v34 = objc_msgSend(v33, "isLifecycleManaged");

              if ((v34 & 1) == 0)
              {
                rbs_assertion_log();
                v45 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
                {
                  objc_msgSend(v30, "originator");
                  v46 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543618;
                  v72 = v46;
                  v73 = 2114;
                  v74 = v48;
                  _os_log_impl(&dword_21A8B4000, v45, OS_LOG_TYPE_INFO, "_checkForSuspendableAssertionCycle bailing out for not-manged-process (originator: %{public}@ target: %{public}@)", buf, 0x16u);

                }
                goto LABEL_55;
              }
              if ((objc_msgSend(v30, "suspendsOnOriginatorSuspension") & 1) == 0)
              {
                rbs_assertion_log();
                v45 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138543362;
                  v72 = v30;
                  _os_log_impl(&dword_21A8B4000, v45, OS_LOG_TYPE_INFO, "_checkForSuspendableAssertionCycle bailing out for not-suspendable assertion %{public}@", buf, 0xCu);
                }
LABEL_55:
                v6 = v51;
                v5 = v52;

                goto LABEL_56;
              }
              objc_msgSend(v30, "originator");
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              v36 = objc_msgSend(v53, "containsObject:", v35);

              if ((v36 & 1) == 0)
              {
                rbs_assertion_log();
                v37 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
                {
                  objc_msgSend(v30, "originator");
                  v38 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543362;
                  v72 = v38;
                  _os_log_impl(&dword_21A8B4000, v37, OS_LOG_TYPE_DEFAULT, "found a new process to check %{public}@", buf, 0xCu);

                }
                objc_msgSend(v30, "originator");
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                -[NSObject addObject:](v16, "addObject:", v31);
LABEL_29:

                continue;
              }
            }
          }
          v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v58, v75, 16);
          if (v27)
            continue;
          break;
        }
LABEL_32:

        v21 = v50 + 1;
        v6 = v51;
        v15 = 0x24BDBC000;
        v20 = v47;
      }
      while (v50 + 1 != v49);
      v49 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v62, v76, 16);
    }
    while (v49);
LABEL_34:

  }
  rbs_assertion_log();
  v39 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v72 = v53;
    _os_log_impl(&dword_21A8B4000, v39, OS_LOG_TYPE_DEFAULT, "Detected apparent loop in suspendable assertions with: %{public}@", buf, 0xCu);
  }

  v56 = 0u;
  v57 = 0u;
  v54 = 0u;
  v55 = 0u;
  v19 = v53;
  v40 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v54, v70, 16);
  if (v40)
  {
    v41 = v40;
    v42 = *(_QWORD *)v55;
    do
    {
      for (k = 0; k != v41; ++k)
      {
        if (*(_QWORD *)v55 != v42)
          objc_enumerationMutation(v19);
        -[RBAssertionResolutionContext _suspendAssertionsForTarget:](self, "_suspendAssertionsForTarget:", *(_QWORD *)(*((_QWORD *)&v54 + 1) + 8 * k));
      }
      v41 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v54, v70, 16);
    }
    while (v41);
  }
  v5 = v52;
LABEL_56:

LABEL_57:
}

- (void)_suspendAssertionsForTarget:(id)a3
{
  RBAssertionCollection *assertionCollection;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  assertionCollection = self->_assertionCollection;
  objc_msgSend(a3, "identifier", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[RBAssertionCollection assertionsForOriginator:](assertionCollection, "assertionsForOriginator:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v11, "suspendsOnOriginatorSuspension"))
        {
          if ((objc_msgSend(v11, "isSuspended") & 1) == 0)
          {
            objc_msgSend(v11, "suspend");
            -[NSMutableSet addObject:](self->_assertions, "addObject:", v11);
            if (objc_msgSend(v11, "definesRelativeStartTime"))
            {
              objc_msgSend(v11, "target");
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "identity");
              v13 = (void *)objc_claimAutoreleasedReturnValue();

              if (v13)
                -[NSMutableSet addObject:](self->_lostStartTimeDefining, "addObject:", v13);

            }
          }
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

}

- (RBAttributeContext)_createContextForAssertion:(_QWORD *)a1
{
  id v3;
  RBAttributeContext *v4;
  void *v5;

  if (a1)
  {
    v3 = a2;
    v4 = objc_alloc_init(RBAttributeContext);
    -[RBAttributeContext setDomainAttributeManager:](v4, "setDomainAttributeManager:", a1[13]);
    -[RBAttributeContext setBundlePropertiesManager:](v4, "setBundlePropertiesManager:", a1[14]);
    -[RBAttributeContext setEntitlementManager:](v4, "setEntitlementManager:", a1[15]);
    -[RBAttributeContext setAssertion:](v4, "setAssertion:", v3);
    objc_msgSend(a1, "_originatorInheritancesForAssertion:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    -[RBAttributeContext setAvailableInheritances:](v4, "setAvailableInheritances:", v5);
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

@end
