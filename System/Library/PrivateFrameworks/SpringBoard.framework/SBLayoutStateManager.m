@implementation SBLayoutStateManager

void __67__SBLayoutStateManager_layoutStateForApplicationTransitionContext___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  id v11;

  objc_msgSend(*(id *)(a1 + 32), "previousEntityForLayoutRole:", a2);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "elementWithRole:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4
    && (objc_msgSend(v10, "uniqueIdentifier"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "uniqueIdentifier"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v5, "isEqualToString:", v6),
        v6,
        v5,
        (v7 & 1) == 0))
  {
    objc_msgSend(v4, "workspaceEntity");
    v9 = objc_claimAutoreleasedReturnValue();

    v8 = v9;
    if (v9)
      goto LABEL_9;
  }
  else
  {
    v8 = (uint64_t)v10;
    if (v10)
      goto LABEL_9;
  }
  if (a2 == 1)
  {
    +[SBWorkspaceEntity entity](SBHomeScreenEntity, "entity");
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
LABEL_9:
  v11 = (id)v8;
  objc_msgSend(*(id *)(a1 + 32), "setPreviousEntity:forLayoutRole:", v8, a2);

}

void __67__SBLayoutStateManager_layoutStateForApplicationTransitionContext___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  objc_msgSend(v3, "entityForLayoutRole:", a2);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_setRequestedWorkspaceEntity:forLayoutRole:", v4, a2);

}

- (id)layoutStateForApplicationTransitionContext:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;

  v4 = a3;
  objc_msgSend(v4, "previousLayoutState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __67__SBLayoutStateManager_layoutStateForApplicationTransitionContext___block_invoke;
  v15[3] = &unk_1E8EABFB0;
  v7 = v4;
  v16 = v7;
  v8 = v5;
  v17 = v8;
  SBLayoutRoleEnumerateValidRoles(v15);
  if ((objc_msgSend(v7, "_alreadyPopulatedRequestedWorkspaceEntities") & 1) == 0)
  {
    objc_msgSend(v7, "activatingEntity");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_setRequestedActivatingWorkspaceEntity:", v9);

    v13[0] = v6;
    v13[1] = 3221225472;
    v13[2] = __67__SBLayoutStateManager_layoutStateForApplicationTransitionContext___block_invoke_2;
    v13[3] = &unk_1E8EA2880;
    v10 = v7;
    v14 = v10;
    SBLayoutRoleEnumerateValidRoles(v13);
    objc_msgSend(v10, "_setAlreadyPopulatedRequestedWorkspaceEntities:", 1);

  }
  -[SBLayoutStateManager _layoutStateForApplicationTransitionContext:](self, "_layoutStateForApplicationTransitionContext:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (Class)_layoutStateClass
{
  return (Class)objc_opt_class();
}

- (id)_layoutStateForApplicationTransitionContext:(id)a3
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  uint64_t v27;
  void *v28;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _QWORD v44[4];
  id v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "previousLayoutState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isBackground") & 1) != 0)
  {
    v7 = v6;
    goto LABEL_37;
  }
  objc_msgSend(v5, "activatingEntity");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "entityForLayoutRole:", 1);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "previousEntityForLayoutRole:", 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v6, "interfaceOrientation");
  if (!v9)
  {
    v9 = v8;
    if (!v9)
    {
      +[SBWorkspaceEntity entity](SBPreviousWorkspaceEntity, "entity");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      if (!v9)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBLayoutStateManager.m"), 95, CFSTR("Primary workspace entity may not be nil at this point!"));

      }
    }
  }
  v44[0] = MEMORY[0x1E0C809B0];
  v44[1] = 3221225472;
  v44[2] = __68__SBLayoutStateManager__layoutStateForApplicationTransitionContext___block_invoke;
  v44[3] = &unk_1E8EB1C60;
  v12 = v10;
  v45 = v12;
  v13 = MEMORY[0x1D17E5550](v44);
  v39 = v12;
  if (objc_msgSend(v9, "isPreviousWorkspaceEntity"))
  {
    (*(void (**)(uint64_t, id, id))(v13 + 16))(v13, v9, v12);
    v14 = objc_claimAutoreleasedReturnValue();

    v9 = (id)v14;
  }
  if (objc_msgSend(v9, "isEmptyWorkspaceEntity"))
  {

LABEL_12:
    +[SBWorkspaceEntity entity](SBHomeScreenEntity, "entity");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }
  if (!v9)
    goto LABEL_12;
LABEL_13:
  if (objc_msgSend(v9, "isPreviousWorkspaceEntity"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBLayoutStateManager.m"), 139, CFSTR("Primary workspace entity may not be previous entity at this point!"));

  }
  if (objc_msgSend(v9, "isEmptyWorkspaceEntity"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBLayoutStateManager.m"), 141, CFSTR("Primary workspace entity may not be empty entity at this point!"));

  }
  objc_msgSend(v5, "setActivatingEntity:", 0);
  objc_msgSend(v5, "setEntity:forLayoutRole:", v9, 1);
  objc_msgSend(v5, "setEntity:forLayoutRole:", 0, 2);
  objc_msgSend(v5, "setEntity:forLayoutRole:", 0, 3);
  objc_msgSend(v5, "setEntity:forLayoutRole:", 0, 4);
  v15 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v16 = v15;
  if (v9)
  {
    __68__SBLayoutStateManager__layoutStateForApplicationTransitionContext___block_invoke_2((uint64_t)v15, v9);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
      objc_msgSend(v16, "addObject:", v17);

  }
  v38 = (void *)v13;
  if (objc_msgSend(v16, "count"))
    v18 = v16;
  else
    v18 = 0;
  v19 = v18;
  v20 = objc_msgSend(v5, "interfaceOrientation");
  if (v20)
    v11 = v20;
  if (objc_msgSend(v19, "count"))
  {
    v34 = v16;
    v35 = v8;
    v36 = v6;
    v37 = v5;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v33 = v19;
    v22 = v19;
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v41;
      do
      {
        for (i = 0; i != v24; ++i)
        {
          if (*(_QWORD *)v41 != v25)
            objc_enumerationMutation(v22);
          v27 = *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * i);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v11, v33);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "setObject:forKey:", v28, v27);

        }
        v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
      }
      while (v24);
    }

    v6 = v36;
    v5 = v37;
    v8 = v35;
    v19 = v33;
    v16 = v34;
  }
  else
  {
    v21 = 0;
  }
  v7 = (id)objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "_layoutStateClass")), "_initWithLayoutElements:interfaceOrientation:interfaceOrientationByLayoutElement:", v19, v11, v21);

LABEL_37:
  return v7;
}

id __68__SBLayoutStateManager__layoutStateForApplicationTransitionContext___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v5 = a2;
  v6 = a3;
  if (!objc_msgSend(v5, "isPreviousWorkspaceEntity"))
    goto LABEL_7;
  v7 = objc_msgSend(v5, "previousLayoutRole");
  v8 = v6;
  if (v7)
  {
    if (v7 != 1)
    {
LABEL_7:
      +[SBWorkspaceEntity entity](SBEmptyWorkspaceEntity, "entity");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
    v8 = *(void **)(a1 + 32);
  }
  v9 = (void *)objc_msgSend(v8, "copy");
  if (!v9)
    goto LABEL_7;
  v10 = v9;
  objc_msgSend(v9, "clearActivationSettings");
  objc_msgSend(v5, "activationSettings");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "applyActivationSettings:", v11);

  objc_msgSend(v10, "clearDeactivationSettings");
  objc_msgSend(v5, "deactivationSettings");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "applyDeactivationSettings:", v12);

LABEL_8:
  return v10;
}

id __68__SBLayoutStateManager__layoutStateForApplicationTransitionContext___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  if ((objc_msgSend(v2, "isHomeScreenEntity") & 1) != 0)
  {
    v3 = 0;
  }
  else
  {
    +[SBLayoutElement elementWithDescriptor:](SBLayoutElement, "elementWithDescriptor:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v3;
}

@end
