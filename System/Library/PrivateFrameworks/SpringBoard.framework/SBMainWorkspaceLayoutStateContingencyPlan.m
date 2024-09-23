@implementation SBMainWorkspaceLayoutStateContingencyPlan

- (id)transitionContextForLayoutContext:(id)a3 failedEntities:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  char v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  char v34;
  void *v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  void *v42;
  uint64_t v43;
  id v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  int v49;
  SBWorkspaceEntityRemovalContext *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  uint64_t v57;
  void *v58;
  void *v60;
  int v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  id v67;
  void *v68;
  uint64_t v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  _QWORD v74[4];
  id v75;
  id v76;
  id v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  _BYTE v82[128];
  _BYTE v83[128];
  uint64_t v84;

  v84 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "layoutState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v78 = 0u;
  v79 = 0u;
  v80 = 0u;
  v81 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v78, v83, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v79;
LABEL_3:
    v12 = 0;
    while (1)
    {
      if (*(_QWORD *)v79 != v11)
        objc_enumerationMutation(v8);
      objc_msgSend(*(id *)(*((_QWORD *)&v78 + 1) + 8 * v12), "uniqueIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "elementWithIdentifier:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
        break;
      if (v10 == ++v12)
      {
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v78, v83, 16);
        if (v10)
          goto LABEL_3;
        goto LABEL_9;
      }
    }

    +[SBWorkspaceTransitionContext context](SBWorkspaceApplicationSceneTransitionContext, "context");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setAnimationDisabled:", 1);
    objc_msgSend(v5, "displayIdentity");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v16, "sb_displayWindowingMode") != 1)
    {
      +[SBWorkspaceEntity entity](SBHomeScreenEntity, "entity");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setEntity:forLayoutRole:", v26, 1);
LABEL_48:

      goto LABEL_49;
    }
    v68 = v8;
    objc_msgSend((id)SBApp, "windowSceneManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "windowSceneForDisplayIdentity:", v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v18, "switcherController");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = v7;
    v67 = v5;
    v64 = v18;
    v65 = v16;
    v63 = v19;
    if (objc_msgSend(v7, "unlockedEnvironmentMode") == 2)
    {
      objc_msgSend(v15, "setRequestedUnlockedEnvironmentMode:", 2);
      v20 = v68;
      if ((objc_msgSend(v19, "isChamoisWindowingUIEnabled") & 1) == 0)
      {
        objc_msgSend(v7, "elementWithRole:");
        v21 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "elementWithRole:");
        v22 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v68, "bs_map:", &__block_literal_global_8_5);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "uniqueIdentifier");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v23, "containsObject:", v24);

        if ((v25 & 1) != 0)
          +[SBWorkspaceEntity entity](SBEmptyWorkspaceEntity, "entity");
        else
          objc_msgSend(v21, "workspaceEntity");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setEntity:forLayoutRole:", v32, 1);

        if (v22
          && (objc_msgSend(v22, "uniqueIdentifier"),
              v33 = (void *)objc_claimAutoreleasedReturnValue(),
              v34 = objc_msgSend(v23, "containsObject:", v33),
              v33,
              (v34 & 1) == 0))
        {
          objc_msgSend(v22, "workspaceEntity");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "uniqueIdentifier");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          v61 = objc_msgSend(v23, "containsObject:", v60);

          if (v61)
          {
            objc_msgSend(v15, "setEntity:forLayoutRole:", v35, 1);
            +[SBWorkspaceEntity entity](SBEmptyWorkspaceEntity, "entity");
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "setEntity:forLayoutRole:", v62, 2);

            goto LABEL_29;
          }
        }
        else
        {
          +[SBWorkspaceEntity entity](SBEmptyWorkspaceEntity, "entity");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v15, "setEntity:forLayoutRole:", v35, 2);
LABEL_29:

        v20 = v68;
        goto LABEL_30;
      }
    }
    else
    {
      v20 = v68;
      if (!objc_msgSend(v19, "isChamoisWindowingUIEnabled"))
      {
        +[SBWorkspaceEntity entity](SBHomeScreenEntity, "entity");
        v21 = (id)objc_claimAutoreleasedReturnValue();
        +[SBSetupManager sharedInstance](SBSetupManager, "sharedInstance");
        v22 = (id)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v22, "isInSetupMode") && objc_msgSend(v22, "updateInSetupMode"))
        {
          objc_msgSend(v68, "objectsPassingTest:", &__block_literal_global_6_9);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "anyObject");
          v30 = (void *)objc_claimAutoreleasedReturnValue();

          if (v30)
          {
            v31 = v30;

            v21 = v31;
          }

          v20 = v68;
        }
        objc_msgSend(v15, "setEntity:forLayoutRole:", v21, 1);
        +[SBWorkspaceEntity entity](SBEmptyWorkspaceEntity, "entity");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setEntity:forLayoutRole:", v23, 2);
        goto LABEL_30;
      }
    }
    objc_msgSend(v20, "bs_compactMap:", &__block_literal_global_358);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v74[0] = MEMORY[0x1E0C809B0];
    v74[1] = 3221225472;
    v74[2] = __94__SBMainWorkspaceLayoutStateContingencyPlan_transitionContextForLayoutContext_failedEntities___block_invoke_2;
    v74[3] = &unk_1E8EAC028;
    v75 = v7;
    v76 = v27;
    v77 = v28;
    v22 = v28;
    v20 = v68;
    v21 = v27;
    SBLayoutRoleEnumerateValidRoles(v74);
    objc_msgSend(v15, "setEntities:withPolicy:centerEntity:floatingEntity:", v22, 0, 0, 0);

    v23 = v75;
LABEL_30:

    v72 = 0u;
    v73 = 0u;
    v70 = 0u;
    v71 = 0u;
    v36 = v20;
    v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v70, v82, 16);
    if (v37)
    {
      v38 = v37;
      v39 = *(_QWORD *)v71;
      do
      {
        v40 = 0;
        v69 = v38;
        do
        {
          if (*(_QWORD *)v71 != v39)
            objc_enumerationMutation(v36);
          v41 = *(void **)(*((_QWORD *)&v70 + 1) + 8 * v40);
          if (objc_msgSend(v41, "isApplicationSceneEntity"))
          {
            objc_msgSend(v41, "application");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            if ((unint64_t)objc_msgSend(v42, "failedLaunchCount") > 1)
              goto LABEL_38;
            objc_msgSend((id)SBApp, "privacyPreflightController");
            v43 = v39;
            v44 = v36;
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v42, "info");
            v46 = v15;
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v47, "applicationIdentity");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            v49 = objc_msgSend(v45, "requiresPreflightForApplication:", v48);

            v15 = v46;
            v36 = v44;
            v39 = v43;
            v38 = v69;
            if (v49)
            {
LABEL_38:
              v50 = -[SBWorkspaceEntityRemovalContext initWithAnimationStyle:removalActionType:]([SBWorkspaceEntityRemovalContext alloc], "initWithAnimationStyle:removalActionType:", 0, 1);
              objc_msgSend(v15, "setRemovalContext:forEntity:", v50, v41);

            }
          }
          ++v40;
        }
        while (v38 != v40);
        v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v70, v82, 16);
      }
      while (v38);
    }

    v7 = v66;
    v26 = v64;
    if (objc_msgSend(v36, "count") == 1)
    {
      +[SBSceneManagerCoordinator mainDisplaySceneManager](SBSceneManagerCoordinator, "mainDisplaySceneManager");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "currentLayoutState");
      v52 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v36, "anyObject");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "uniqueIdentifier");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "elementWithIdentifier:", v54);
      v55 = v15;
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v57 = objc_msgSend(v56, "layoutRole");

      v15 = v55;
      if (v57 == 3)
      {
        objc_msgSend(v55, "setEntity:forLayoutRole:", 0, 1);
        objc_msgSend(v55, "setEntity:forLayoutRole:", 0, 2);
        +[SBWorkspaceEntity entity](SBEmptyWorkspaceEntity, "entity");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "setEntity:forLayoutRole:", v58, 3);

        if (objc_msgSend(v66, "isFloatingSwitcherVisible"))
          objc_msgSend(v55, "setRequestedFloatingSwitcherVisible:", 1);
      }

    }
    v5 = v67;
    v8 = v68;
    v16 = v65;
    goto LABEL_48;
  }
LABEL_9:
  v15 = 0;
  v16 = v8;
LABEL_49:

  return v15;
}

uint64_t __94__SBMainWorkspaceLayoutStateContingencyPlan_transitionContextForLayoutContext_failedEntities___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "uniqueIdentifier");
}

void __94__SBMainWorkspaceLayoutStateContingencyPlan_transitionContextForLayoutContext_failedEntities___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  if (SBLayoutRoleIsValidForSplitView(a2))
  {
    objc_msgSend(*(id *)(a1 + 32), "elementWithRole:", a2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = *(void **)(a1 + 40);
      v9 = v4;
      objc_msgSend(v4, "uniqueIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v5) = objc_msgSend(v5, "containsObject:", v6);

      v4 = v9;
      if ((v5 & 1) == 0)
      {
        v7 = *(void **)(a1 + 48);
        objc_msgSend(v9, "workspaceEntity");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v8);

        v4 = v9;
      }
    }

  }
}

uint64_t __94__SBMainWorkspaceLayoutStateContingencyPlan_transitionContextForLayoutContext_failedEntities___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "applicationSceneEntity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "application");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.purplebuddy"));

  return v5;
}

uint64_t __94__SBMainWorkspaceLayoutStateContingencyPlan_transitionContextForLayoutContext_failedEntities___block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "uniqueIdentifier");
}

- (id)transitionContextToUndoTransitionContext:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t);
  void *v14;
  id v15;
  id v16;

  v3 = a3;
  +[SBWorkspaceTransitionContext context](SBWorkspaceApplicationSceneTransitionContext, "context");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAnimationDisabled:", 1);
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __86__SBMainWorkspaceLayoutStateContingencyPlan_transitionContextToUndoTransitionContext___block_invoke;
  v14 = &unk_1E8EABFB0;
  v15 = v3;
  v5 = v4;
  v16 = v5;
  v6 = v3;
  SBLayoutRoleEnumerateValidRoles(&v11);
  objc_msgSend(v6, "previousLayoutState", v11, v12, v13, v14);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setInterfaceOrientation:", objc_msgSend(v7, "interfaceOrientation"));

  v8 = v16;
  v9 = v5;

  return v9;
}

void __86__SBMainWorkspaceLayoutStateContingencyPlan_transitionContextToUndoTransitionContext___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  BOOL v5;
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "previousEntityForLayoutRole:", a2);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "entityForLayoutRole:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    if (objc_msgSend(v8, "isHomeScreenEntity"))
      v5 = v4 == 0;
    else
      v5 = 1;
    if (v5)
      goto LABEL_10;
  }
  else if (!v4)
  {
    goto LABEL_10;
  }
  if ((objc_msgSend(v4, "isHomeScreenEntity") & 1) == 0)
  {
    v6 = *(void **)(a1 + 40);
    +[SBWorkspaceEntity entity](SBEmptyWorkspaceEntity, "entity");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setEntity:forLayoutRole:", v7, a2);

    goto LABEL_12;
  }
LABEL_10:
  objc_msgSend(*(id *)(a1 + 40), "setEntity:forLayoutRole:", v8, a2);
LABEL_12:

}

@end
