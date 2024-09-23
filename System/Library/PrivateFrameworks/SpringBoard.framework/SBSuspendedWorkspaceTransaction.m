@implementation SBSuspendedWorkspaceTransaction

- (void)transaction:(id)a3 willLaunchProcess:(id)a4
{
  id v6;
  NSError *anyLaunchError;
  NSError *v8;
  void *v9;
  NSError *v10;
  NSError *v11;
  id v12;

  v12 = a3;
  v6 = a4;
  if (-[NSMutableSet containsObject:](self->_outstandingProcessLaunchTransactions, "containsObject:", v12))
  {
    -[NSMutableSet removeObject:](self->_outstandingProcessLaunchTransactions, "removeObject:", v12);
    if ((objc_msgSend(v6, "isRunning") & 1) == 0)
    {
      anyLaunchError = self->_anyLaunchError;
      if (anyLaunchError)
      {
        v8 = anyLaunchError;
        v9 = self->_anyLaunchError;
        self->_anyLaunchError = v8;
      }
      else
      {
        objc_msgSend(v6, "exitContext");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "createError");
        v10 = (NSError *)objc_claimAutoreleasedReturnValue();
        v11 = self->_anyLaunchError;
        self->_anyLaunchError = v10;

      }
    }
    if (!-[NSMutableSet count](self->_outstandingProcessLaunchTransactions, "count"))
      -[SBSuspendedWorkspaceTransaction _sendActivationResultWithError:](self, "_sendActivationResultWithError:", self->_anyLaunchError);
  }

}

- (void)_didComplete
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBSuspendedWorkspaceTransaction;
  -[SBMainWorkspaceTransaction _didComplete](&v4, sel__didComplete);
  SBWTErrorCreateForTransaction(self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBSuspendedWorkspaceTransaction _sendActivationResultWithError:](self, "_sendActivationResultWithError:", v3);

}

- (void)_childTransactionDidComplete:(id)a3
{
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t i;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  dispatch_time_t v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  NSError **p_anyLaunchError;
  NSError *anyLaunchError;
  void *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  id v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  id v66;
  id v67;
  SBSuspendedWorkspaceTransaction *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  unsigned int v73;
  void *v74;
  uint64_t v75;
  void *v76;
  void *v77;
  void *v78;
  objc_super v79;
  _QWORD block[4];
  id v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  _QWORD v86[6];
  _BYTE v87[128];
  uint64_t v88;

  v88 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = objc_opt_class();
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

  if (!v9
    || !-[NSMutableSet containsObject:](self->_incompleteProcessLaunchTransactions, "containsObject:", v9))
  {
    goto LABEL_50;
  }
  -[NSMutableSet removeObject:](self->_incompleteProcessLaunchTransactions, "removeObject:", v9);
  objc_msgSend(v9, "process");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "pid");
  if (v11 >= 1)
  {
    v73 = v11;
    -[NSMapTable objectForKey:](self->_launchTransactionToSceneEntityMap, "objectForKey:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "sceneHandle");
    v75 = objc_claimAutoreleasedReturnValue();
    -[SBSuspendedWorkspaceTransaction _latestSceneHandleForSceneHandle:](self, "_latestSceneHandleForSceneHandle:");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v13)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSuspendedWorkspaceTransaction.m"), 94, CFSTR("should have stored or computed a scene handle"));

    }
    -[SBWorkspaceTransaction transitionRequest](self, "transitionRequest");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "applicationContext");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "_createApplicationSceneTransitionContextFromContext:entity:", v14, v12);
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "animationFence");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSuspendedWorkspaceTransaction.m"), 105, CFSTR("suspended launches cannot contain animation fences"));

    }
    v74 = v13;
    v76 = v14;
    if (objc_msgSend(v14, "isSceneless"))
    {
      v66 = v9;
      if (-[SBSuspendedWorkspaceTransaction isAuditHistoryEnabled](self, "isAuditHistoryEnabled"))
        -[SBSuspendedWorkspaceTransaction _addAuditHistoryItem:](self, "_addAuditHistoryItem:", CFSTR("launched scene-less"));
      v71 = v12;
      v68 = self;
      v69 = v10;
      v67 = v7;
      objc_msgSend(v78, "actions");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (void *)objc_msgSend(v16, "mutableCopy");
      v82 = 0u;
      v83 = 0u;
      v84 = 0u;
      v85 = 0u;
      v18 = v16;
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v82, v87, 16);
      if (v19)
      {
        v20 = v19;
        v21 = *(_QWORD *)v83;
        v22 = 0x1E0CEA000uLL;
        do
        {
          for (i = 0; i != v20; ++i)
          {
            if (*(_QWORD *)v83 != v21)
              objc_enumerationMutation(v18);
            v24 = *(void **)(*((_QWORD *)&v82 + 1) + 8 * i);
            if (objc_msgSend(v24, "UIActionType") == 1 && (objc_opt_respondsToSelector() & 1) != 0)
            {
              v25 = objc_alloc(*(Class *)(v22 + 2016));
              objc_msgSend(v24, "url");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v24, "workspaceOriginatingProcess");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              if (v27)
              {
                v28 = (void *)objc_msgSend(v25, "initWithURL:workspaceOriginatingProcess:", v26, v27);
              }
              else
              {
                objc_msgSend(v78, "originatingProcess");
                v29 = v18;
                v30 = v17;
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                v28 = (void *)objc_msgSend(v25, "initWithURL:workspaceOriginatingProcess:", v26, v31);

                v17 = v30;
                v18 = v29;
                v22 = 0x1E0CEA000;
              }

              objc_msgSend(v17, "removeObject:", v24);
              objc_msgSend(v17, "addObject:", v28);

            }
          }
          v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v82, v87, 16);
        }
        while (v20);
      }

      objc_msgSend(MEMORY[0x1E0D87DF8], "targetWithPid:", v73);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D87C80], "attributeWithCompletionPolicy:", 1);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v86[0] = v33;
      objc_msgSend(MEMORY[0x1E0D87CB0], "grantWithUserInteractivity");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v86[1] = v34;
      objc_msgSend(MEMORY[0x1E0D87D08], "grantWithForegroundPriority");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v86[2] = v35;
      objc_msgSend(MEMORY[0x1E0D87DD8], "grantWithResistance:", 40);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v86[3] = v36;
      objc_msgSend(MEMORY[0x1E0D87CC8], "grant");
      v37 = v17;
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v86[4] = v38;
      objc_msgSend(MEMORY[0x1E0D87DE8], "withReason:", 9);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v86[5] = v39;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v86, 6);
      v40 = (void *)objc_claimAutoreleasedReturnValue();

      v41 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D87C98]), "initWithExplanation:target:attributes:", CFSTR("SBHandleScenelessWorkspaceAction"), v32, v40);
      objc_msgSend(v41, "acquireWithError:", 0);
      v42 = dispatch_time(0, 2000000000);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __64__SBSuspendedWorkspaceTransaction__childTransactionDidComplete___block_invoke;
      block[3] = &unk_1E8E9DED8;
      v81 = v41;
      v43 = v41;
      dispatch_after(v42, MEMORY[0x1E0C80D38], block);
      objc_msgSend(v69, "workspace");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "sendActions:", v37);

      objc_msgSend(v71, "application");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "_dataStore");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v71, "uniqueIdentifier");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "removeSceneStoreForIdentifier:", v47);

      v10 = v69;
      v12 = v71;

      v7 = v67;
      self = v68;
      v9 = v66;
    }
    else
    {
      objc_msgSend(v13, "sceneIdentifier");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "sceneIfExists");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      if (v51)
      {
        if (-[SBSuspendedWorkspaceTransaction isAuditHistoryEnabled](self, "isAuditHistoryEnabled"))
          -[SBSuspendedWorkspaceTransaction _addAuditHistoryItem:](self, "_addAuditHistoryItem:", CFSTR("sent transition to scene %@"), v50);
        objc_msgSend(v51, "settings");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "updateSettings:withTransitionContext:", v52, v78);
      }
      else
      {
        objc_msgSend(v77, "applicationContext");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        v72 = v12;
        objc_msgSend(v13, "_createParametersFromTransitionContext:entity:", v55, v12);
        v52 = (void *)objc_claimAutoreleasedReturnValue();

        if (-[SBSuspendedWorkspaceTransaction isAuditHistoryEnabled](self, "isAuditHistoryEnabled"))
          -[SBSuspendedWorkspaceTransaction _addAuditHistoryItem:](self, "_addAuditHistoryItem:", CFSTR("created scene %@"), v50, v78);
        objc_msgSend(MEMORY[0x1E0D22968], "sharedInstance");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "workspace");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        v58 = (id)objc_msgSend(v56, "createSceneWithIdentifier:parameters:clientProvider:transitionContext:", v50, v52, v57, v78);

        objc_msgSend(v76, "applicationSceneEntityForLayoutRole:", 4);
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        v60 = v59;
        if (v59)
        {
          v70 = v10;
          objc_msgSend(v59, "activationSettings");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v61, "_settingsAreValidToMoveContentToNewScene"))
          {
            objc_msgSend(v60, "sceneHandle");
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            -[SBSuspendedWorkspaceTransaction _latestSceneHandleForSceneHandle:](self, "_latestSceneHandleForSceneHandle:", v62);
            v63 = (void *)objc_claimAutoreleasedReturnValue();

            -[SBSuspendedWorkspaceTransaction _addSceneHandleToAppRecency:](self, "_addSceneHandleToAppRecency:", v63);
          }

          v10 = v70;
        }

        v12 = v72;
      }

    }
    v54 = (void *)v75;
    goto LABEL_46;
  }
  p_anyLaunchError = &self->_anyLaunchError;
  anyLaunchError = self->_anyLaunchError;
  if (!anyLaunchError)
  {
    objc_msgSend(v10, "exitContext");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "createError");
    v53 = objc_claimAutoreleasedReturnValue();
    v54 = *p_anyLaunchError;
    *p_anyLaunchError = (NSError *)v53;
LABEL_46:

    goto LABEL_47;
  }
  objc_storeStrong((id *)&self->_anyLaunchError, anyLaunchError);
LABEL_47:
  if (!-[NSMutableSet count](self->_incompleteProcessLaunchTransactions, "count"))
  {
    -[SBSuspendedWorkspaceTransaction _sendActivationResultWithError:](self, "_sendActivationResultWithError:", self->_anyLaunchError);
    -[SBSuspendedWorkspaceTransaction removeMilestone:](self, "removeMilestone:", CFSTR("waitForLaunches"));
  }

LABEL_50:
  v79.receiver = self;
  v79.super_class = (Class)SBSuspendedWorkspaceTransaction;
  -[SBSuspendedWorkspaceTransaction _childTransactionDidComplete:](&v79, sel__childTransactionDidComplete_, v7);

}

- (void)_sendActivationResultWithError:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[SBWorkspaceTransaction transitionRequest](self, "transitionRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "applicationContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "needsToSendActivationResult"))
  {
    objc_msgSend(v5, "sendActivationResultError:", v7);
    if (-[SBSuspendedWorkspaceTransaction isAuditHistoryEnabled](self, "isAuditHistoryEnabled"))
    {
      objc_msgSend(v7, "localizedFailureReason");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBSuspendedWorkspaceTransaction _addAuditHistoryItem:](self, "_addAuditHistoryItem:", CFSTR("Sent activation result; error = %@"),
        v6);

    }
  }

}

- (void)_begin
{
  NSMapTable *v3;
  NSMapTable *launchTransactionToSceneEntityMap;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  NSMutableSet *v21;
  NSMutableSet *outstandingProcessLaunchTransactions;
  NSMutableSet *v23;
  NSMutableSet *incompleteProcessLaunchTransactions;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  void *v30;
  void *v32;
  id obj;
  uint64_t v34;
  void *v35;
  objc_super v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _QWORD v41[4];
  id v42;
  id v43;
  void *v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
  v3 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
  launchTransactionToSceneEntityMap = self->_launchTransactionToSceneEntityMap;
  self->_launchTransactionToSceneEntityMap = v3;

  -[SBWorkspaceTransaction transitionRequest](self, "transitionRequest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "applicationContext");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v32 = v5;
  objc_msgSend(v5, "applicationContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applicationSceneEntities");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v7;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
  if (v8)
  {
    v9 = v8;
    v34 = *(_QWORD *)v46;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v46 != v34)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
        objc_msgSend(v11, "sceneHandle");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v12)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSuspendedWorkspaceTransaction.m"), 58, CFSTR("must have a scene handle"));

        }
        v13 = objc_alloc(MEMORY[0x1E0D228D8]);
        objc_msgSend(v12, "application");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "info");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "processIdentity");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v41[0] = MEMORY[0x1E0C809B0];
        v41[1] = 3221225472;
        v41[2] = __41__SBSuspendedWorkspaceTransaction__begin__block_invoke;
        v41[3] = &unk_1E8EAF5A0;
        v42 = v12;
        v43 = v35;
        v44 = v11;
        v17 = v12;
        v18 = (void *)objc_msgSend(v13, "initWithProcessIdentity:executionContextProvider:", v16, v41);

        -[NSMapTable setObject:forKey:](self->_launchTransactionToSceneEntityMap, "setObject:forKey:", v11, v18);
      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
    }
    while (v9);
  }

  if (-[NSMapTable count](self->_launchTransactionToSceneEntityMap, "count"))
  {
    -[SBSuspendedWorkspaceTransaction addMilestone:](self, "addMilestone:", CFSTR("waitForLaunches"));
    NSAllMapTableKeys(self->_launchTransactionToSceneEntityMap);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", v20);
    v21 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
    outstandingProcessLaunchTransactions = self->_outstandingProcessLaunchTransactions;
    self->_outstandingProcessLaunchTransactions = v21;

    objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", v20);
    v23 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
    incompleteProcessLaunchTransactions = self->_incompleteProcessLaunchTransactions;
    self->_incompleteProcessLaunchTransactions = v23;

    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v25 = v20;
    v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v37, v49, 16);
    if (v26)
    {
      v27 = v26;
      v28 = *(_QWORD *)v38;
      do
      {
        for (j = 0; j != v27; ++j)
        {
          if (*(_QWORD *)v38 != v28)
            objc_enumerationMutation(v25);
          v30 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * j);
          objc_msgSend(v30, "addObserver:", self);
          -[SBSuspendedWorkspaceTransaction addChildTransaction:](self, "addChildTransaction:", v30);
        }
        v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v37, v49, 16);
      }
      while (v27);
    }

  }
  v36.receiver = self;
  v36.super_class = (Class)SBSuspendedWorkspaceTransaction;
  -[SBSuspendedWorkspaceTransaction _begin](&v36, sel__begin);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_anyLaunchError, 0);
  objc_storeStrong((id *)&self->_incompleteProcessLaunchTransactions, 0);
  objc_storeStrong((id *)&self->_outstandingProcessLaunchTransactions, 0);
  objc_storeStrong((id *)&self->_launchTransactionToSceneEntityMap, 0);
}

uint64_t __41__SBSuspendedWorkspaceTransaction__begin__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_createProcessExecutionContextFromContext:entity:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __64__SBSuspendedWorkspaceTransaction__childTransactionDidComplete___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

- (id)_latestSceneHandleForSceneHandle:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  _QWORD v17[4];
  id v18;
  id v19;
  SBSuspendedWorkspaceTransaction *v20;
  id v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v4 = a3;
  -[SBWorkspaceTransaction windowScene](self, "windowScene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sceneManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0D231F0];
  objc_msgSend(v4, "sceneIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identityForIdentifier:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__56;
  v27 = __Block_byref_object_dispose__56;
  v28 = 0;
  +[SBSceneManagerCoordinator sharedInstance](SBSceneManagerCoordinator, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __68__SBSuspendedWorkspaceTransaction__latestSceneHandleForSceneHandle___block_invoke;
  v17[3] = &unk_1E8EAF5C8;
  v11 = v6;
  v18 = v11;
  v12 = v9;
  v19 = v12;
  v20 = self;
  v13 = v4;
  v21 = v13;
  v22 = &v23;
  objc_msgSend(v10, "enumerateSceneManagersWithBlock:", v17);

  v14 = (void *)v24[5];
  if (!v14)
    v14 = v13;
  v15 = v14;

  _Block_object_dispose(&v23, 8);
  return v15;
}

void __68__SBSuspendedWorkspaceTransaction__latestSceneHandleForSceneHandle___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  id v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if ((objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32)) & 1) == 0)
  {
    objc_msgSend(v3, "existingSceneHandleForSceneIdentity:", *(_QWORD *)(a1 + 40));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_opt_class();
    v6 = v4;
    if (v5)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v5 = v6;
      else
        v5 = 0;
    }
    v7 = v5;

    if (v7)
    {
      SBLogTransaction();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v9 = *(_QWORD *)(a1 + 48);
        objc_msgSend(*(id *)(a1 + 56), "succinctDescription");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "succinctDescription");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218754;
        v13 = v9;
        v14 = 2114;
        v15 = v10;
        v16 = 2112;
        v17 = v3;
        v18 = 2114;
        v19 = v11;
        _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_DEFAULT, "<SBSuspendedWorkspaceTransaction:%p> - scene handle %{public}@ has migrated to a different scene manager: %@ - using new scene handle %{public}@", buf, 0x2Au);

      }
      if (objc_msgSend(*(id *)(a1 + 48), "isAuditHistoryEnabled"))
        objc_msgSend(*(id *)(a1 + 48), "_addAuditHistoryItem:", CFSTR("scene handle %@ has migrated to a different scene manager: %@"), *(_QWORD *)(a1 + 56), v3);
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), v5);
    }

  }
}

- (void)_addSceneHandleToAppRecency:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;

  v3 = a3;
  objc_msgSend(v3, "scene");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "parameters");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  objc_msgSend(v6, "updateSettingsWithBlock:", &__block_literal_global_169);
  objc_msgSend(v6, "settings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __63__SBSuspendedWorkspaceTransaction__addSceneHandleToAppRecency___block_invoke_2;
  v21[3] = &unk_1E8E9E980;
  v22 = v4;
  v9 = v4;
  objc_msgSend(v9, "updateSettings:withTransitionContext:completion:", v7, 0, v21);

  objc_msgSend(v3, "application");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bundleIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "sceneIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBDisplayItem applicationDisplayItemWithBundleIdentifier:sceneIdentifier:](SBDisplayItem, "applicationDisplayItemWithBundleIdentifier:sceneIdentifier:", v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)SBApp, "windowSceneManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "displayIdentity");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "windowSceneForDisplayIdentity:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "switcherController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v8;
  v19[1] = 3221225472;
  v19[2] = __63__SBSuspendedWorkspaceTransaction__addSceneHandleToAppRecency___block_invoke_4;
  v19[3] = &unk_1E8EA46E8;
  v20 = v12;
  v18 = v12;
  objc_msgSend(v17, "addCenterRoleAppLayoutForDisplayItem:completion:", v13, v19);

}

uint64_t __63__SBSuspendedWorkspaceTransaction__addSceneHandleToAppRecency___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setForeground:", 1);
}

uint64_t __63__SBSuspendedWorkspaceTransaction__addSceneHandleToAppRecency___block_invoke_2(uint64_t result, int a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "updateSettingsWithBlock:", &__block_literal_global_47_0);
  return result;
}

uint64_t __63__SBSuspendedWorkspaceTransaction__addSceneHandleToAppRecency___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setForeground:", 0);
}

void __63__SBSuspendedWorkspaceTransaction__addSceneHandleToAppRecency___block_invoke_4(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  SBLogAppSwitcher();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = 138543362;
    v5 = v3;
    _os_log_impl(&dword_1D0540000, v2, OS_LOG_TYPE_DEFAULT, "Finished adding new scene identifier: %{public}@ to recent apps.", (uint8_t *)&v4, 0xCu);
  }

}

@end
