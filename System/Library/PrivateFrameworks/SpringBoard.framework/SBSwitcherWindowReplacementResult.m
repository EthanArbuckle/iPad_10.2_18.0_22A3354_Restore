@implementation SBSwitcherWindowReplacementResult

+ (id)defaultWindowReplacementResult
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithPrimaryElement:sideElement:activatingEntity:requestedUnlockedEnvironmentMode:", 0, 0, 0, 0);
}

+ (id)windowReplacementResultByRemovingLayoutElements:(id)a3 fromLayoutState:(id)a4 withPrecedingLayoutState:(id)a5 recentAppLayouts:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  id v15;
  uint64_t (**v16)(_QWORD, _QWORD);
  void *v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  int v35;
  int v36;
  int v37;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  int v44;
  int v45;
  int v46;
  uint64_t v47;
  void *v48;
  void *v49;
  int v50;
  id v51;
  void *v52;
  int v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  int v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  id v66;
  void *v67;
  _QWORD v68[4];
  id v69;
  _QWORD v70[4];
  id v71;
  _QWORD v72[4];
  id v73;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = MEMORY[0x1E0C809B0];
  v72[0] = MEMORY[0x1E0C809B0];
  v72[1] = 3221225472;
  v72[2] = __143__SBSwitcherWindowReplacementResult_windowReplacementResultByRemovingLayoutElements_fromLayoutState_withPrecedingLayoutState_recentAppLayouts___block_invoke;
  v72[3] = &unk_1E8EA2148;
  v15 = v13;
  v73 = v15;
  v16 = (uint64_t (**)(_QWORD, _QWORD))MEMORY[0x1D17E5550](v72);
  if (objc_msgSend(v10, "count") == 1)
  {
    v66 = a1;
    objc_msgSend(v10, "firstObject");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "elements");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v70[0] = v14;
    v70[1] = 3221225472;
    v70[2] = __143__SBSwitcherWindowReplacementResult_windowReplacementResultByRemovingLayoutElements_fromLayoutState_withPrecedingLayoutState_recentAppLayouts___block_invoke_2;
    v70[3] = &unk_1E8EA2148;
    v19 = v17;
    v71 = v19;
    objc_msgSend(v18, "bs_filter:", v70);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v68[0] = v14;
    v68[1] = 3221225472;
    v68[2] = __143__SBSwitcherWindowReplacementResult_windowReplacementResultByRemovingLayoutElements_fromLayoutState_withPrecedingLayoutState_recentAppLayouts___block_invoke_3;
    v68[3] = &unk_1E8EBC180;
    v21 = v11;
    v69 = v21;
    v67 = v19;
    v65 = v20;
    if (objc_msgSend(v10, "bs_containsObjectPassingTest:", v68))
    {
      objc_msgSend(v21, "elementWithRole:", 1);
      v22 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "elementWithRole:", 2);
      v23 = (id)objc_claimAutoreleasedReturnValue();
      v24 = 0;
      v25 = 0;
LABEL_39:

      a1 = v66;
      goto LABEL_40;
    }
    if (!objc_msgSend(v20, "count"))
    {
      if (objc_msgSend(v12, "unlockedEnvironmentMode") == 3)
      {
        objc_msgSend(v12, "elementWithRole:", 1);
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "elementWithRole:", 2);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v64, "uniqueIdentifier");
        v40 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "uniqueIdentifier");
        v41 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "uniqueIdentifier");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v62 = (void *)v40;
        v60 = objc_msgSend(v42, "isEqualToString:", v40);

        objc_msgSend(v19, "uniqueIdentifier");
        v43 = objc_claimAutoreleasedReturnValue();
        v57 = (void *)v41;
        LODWORD(v40) = objc_msgSend((id)v43, "isEqualToString:", v41);

        LODWORD(v43) = ((uint64_t (**)(_QWORD, void *))v16)[2](v16, v64);
        v44 = ((uint64_t (**)(_QWORD, void *))v16)[2](v16, v39);
        v45 = v43 & ~v60;
        v46 = v44 & ~(_DWORD)v40;
        if (v45 == 1 && v46)
        {
          v22 = v64;
          v23 = v39;
          v24 = 0;
          v25 = 0;
        }
        else if (v45)
        {
          v22 = v64;
          v24 = 0;
          v25 = 0;
          v23 = 0;
        }
        else if (v46)
        {
          v22 = v39;
          v24 = 0;
          v25 = 0;
          v23 = 0;
        }
        else
        {
          +[SBWorkspaceEntity entity](SBHomeScreenEntity, "entity");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = 0;
          v22 = 0;
          v24 = 1;
        }

      }
      else
      {
        +[SBWorkspaceEntity entity](SBHomeScreenEntity, "entity");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = 0;
        v22 = 0;
        v24 = 1;
      }
      goto LABEL_39;
    }
    if (objc_msgSend(v20, "count") != 1)
    {
      v24 = 0;
      v25 = 0;
      v23 = 0;
      v22 = 0;
      goto LABEL_39;
    }
    v63 = v12;
    objc_msgSend(v19, "uniqueIdentifier");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "elementWithIdentifier:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v27)
    {
      v23 = 0;
      v22 = 0;
LABEL_36:

      v24 = 0;
      v25 = 0;
      v12 = v63;
      goto LABEL_39;
    }
    objc_msgSend(v21, "elementWithRole:", 1);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "elementWithRole:", 2);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "elementWithRole:", 1);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "elementWithRole:", 2);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v27, "layoutRole");
    v61 = v28;
    if (v30 == 1)
    {
      v55 = v27;
      objc_msgSend(v28, "uniqueIdentifier");
      v31 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "uniqueIdentifier");
      v32 = v29;
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = (void *)v31;
      v35 = objc_msgSend(v33, "isEqualToString:", v31);

      v36 = ((uint64_t (**)(_QWORD, void *))v16)[2](v16, v28);
      v22 = v58;
      v56 = v32;
      v37 = objc_msgSend(v58, "isEqual:", v32);
      v23 = 0;
      if (!v37 || v35)
      {
        v38 = v58;
      }
      else
      {
        v38 = v58;
        if (v36)
        {
          v22 = v28;
          v23 = v58;
        }
      }
      v51 = v38;
    }
    else
    {
      if (v30 != 2)
      {
        if (v30 == 4)
        {
          v22 = v59;
          v38 = v58;
          v23 = v58;
        }
        else
        {
          v23 = 0;
          v22 = 0;
          v38 = v58;
        }
        goto LABEL_35;
      }
      v55 = v27;
      objc_msgSend(v29, "uniqueIdentifier");
      v47 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "uniqueIdentifier");
      v48 = v29;
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = (void *)v47;
      v54 = objc_msgSend(v49, "isEqualToString:", v47);

      v56 = v48;
      v50 = ((uint64_t (**)(_QWORD, void *))v16)[2](v16, v48);
      LODWORD(v47) = objc_msgSend(v59, "isEqual:", v61);
      v22 = v59;
      v23 = 0;
      if (!(_DWORD)v47 || v54)
      {
        v38 = v58;
      }
      else
      {
        v38 = v58;
        if (v50)
          v23 = v48;
      }
    }

    v27 = v55;
    v29 = v56;
LABEL_35:

    goto LABEL_36;
  }
  v24 = 0;
  v25 = 0;
  v23 = 0;
  v22 = 0;
LABEL_40:
  v52 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithPrimaryElement:sideElement:activatingEntity:requestedUnlockedEnvironmentMode:", v22, v23, v25, v24);

  return v52;
}

uint64_t __143__SBSwitcherWindowReplacementResult_windowReplacementResultByRemovingLayoutElements_fromLayoutState_withPrecedingLayoutState_recentAppLayouts___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  objc_msgSend(a2, "workspaceEntity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isApplicationSceneEntity"))
  {
    objc_msgSend(v3, "displayItemRepresentation");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(void **)(a1 + 32);
    objc_msgSend(v4, "bundleIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "recentDisplayItemsForBundleIdentifier:includingHiddenAppLayouts:", v6, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "containsObject:", v4);

  }
  else
  {
    v8 = 1;
  }

  return v8;
}

uint64_t __143__SBSwitcherWindowReplacementResult_windowReplacementResultByRemovingLayoutElements_fromLayoutState_withPrecedingLayoutState_recentAppLayouts___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;

  v3 = a2;
  if (SBLayoutRoleIsValidForSplitView(objc_msgSend(v3, "layoutRole")))
    v4 = objc_msgSend(v3, "representsSameLayoutElementAsDescriptor:", *(_QWORD *)(a1 + 32)) ^ 1;
  else
    v4 = 0;

  return v4;
}

uint64_t __143__SBSwitcherWindowReplacementResult_windowReplacementResultByRemovingLayoutElements_fromLayoutState_withPrecedingLayoutState_recentAppLayouts___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(a2, "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "elementWithRole:", 4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = BSEqualStrings();

  return v6;
}

- (SBSwitcherWindowReplacementResult)initWithPrimaryElement:(id)a3 sideElement:(id)a4 activatingEntity:(id)a5 requestedUnlockedEnvironmentMode:(int64_t)a6
{
  id v11;
  id v12;
  id v13;
  SBSwitcherWindowReplacementResult *v14;
  SBSwitcherWindowReplacementResult *v15;
  objc_super v17;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v17.receiver = self;
  v17.super_class = (Class)SBSwitcherWindowReplacementResult;
  v14 = -[SBSwitcherWindowReplacementResult init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_primaryElement, a3);
    objc_storeStrong((id *)&v15->_sideElement, a4);
    objc_storeStrong((id *)&v15->_activatingEntity, a5);
    v15->_requestedUnlockedEnvironmentMode = a6;
  }

  return v15;
}

- (SBLayoutElement)primaryElement
{
  return self->_primaryElement;
}

- (SBLayoutElement)sideElement
{
  return self->_sideElement;
}

- (SBWorkspaceEntity)activatingEntity
{
  return self->_activatingEntity;
}

- (int64_t)requestedUnlockedEnvironmentMode
{
  return self->_requestedUnlockedEnvironmentMode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activatingEntity, 0);
  objc_storeStrong((id *)&self->_sideElement, 0);
  objc_storeStrong((id *)&self->_primaryElement, 0);
}

@end
