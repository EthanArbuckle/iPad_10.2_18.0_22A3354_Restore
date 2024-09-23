@implementation PXActionMenuController

- (PXActionMenuController)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXActionMenuController.m"), 34, CFSTR("%s is not available as initializer"), "-[PXActionMenuController init]");

  abort();
}

- (PXActionMenuController)initWithActionManagers:(id)a3
{
  id v5;
  PXActionMenuController *v6;
  PXActionMenuController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXActionMenuController;
  v6 = -[PXActionMenuController init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_actionManagers, a3);
    -[PXActionMenuController invalidateActions](v7, "invalidateActions");
  }

  return v7;
}

- (void)setDefaultActivityTypeOrder:(id)a3
{
  NSOrderedSet *v4;
  NSOrderedSet *defaultActivityTypeOrder;

  if (self->_defaultActivityTypeOrder != a3)
  {
    v4 = (NSOrderedSet *)objc_msgSend(a3, "copy");
    defaultActivityTypeOrder = self->_defaultActivityTypeOrder;
    self->_defaultActivityTypeOrder = v4;

    -[PXActionMenuController invalidateActions](self, "invalidateActions");
  }
}

- (void)setDisabledActionTypes:(id)a3
{
  NSSet *v4;
  NSSet *disabledActionTypes;

  if (self->_disabledActionTypes != a3)
  {
    v4 = (NSSet *)objc_msgSend(a3, "copy");
    disabledActionTypes = self->_disabledActionTypes;
    self->_disabledActionTypes = v4;

    -[PXActionMenuController invalidateActions](self, "invalidateActions");
  }
}

- (void)setExcludedActionTypes:(id)a3
{
  NSSet *v4;
  NSSet *excludedActionTypes;

  if (self->_excludedActionTypes != a3)
  {
    v4 = (NSSet *)objc_msgSend(a3, "copy");
    excludedActionTypes = self->_excludedActionTypes;
    self->_excludedActionTypes = v4;

    -[PXActionMenuController invalidateActions](self, "invalidateActions");
  }
}

- (NSArray)activityActions
{
  -[PXActionMenuController _updateActionsIfNeeded](self, "_updateActionsIfNeeded");
  return self->_activityActions;
}

- (NSArray)actions
{
  -[PXActionMenuController _updateActionsIfNeeded](self, "_updateActionsIfNeeded");
  return self->_actions;
}

- (NSArray)availableActionTypes
{
  void *v4;
  objc_class *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXActionMenuController.m"), 86, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXActionMenuController availableActionTypes]", v6);

  abort();
}

- (NSArray)availableInternalActionTypes
{
  return (NSArray *)MEMORY[0x1E0C9AA60];
}

- (NSArray)availableHeaderActionTypes
{
  return (NSArray *)MEMORY[0x1E0C9AA60];
}

- (BOOL)shouldAllowPerformanceOfActionType:(id)a3
{
  id v5;
  void *v6;
  objc_class *v7;
  void *v8;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXActionMenuController.m"), 98, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXActionMenuController shouldAllowPerformanceOfActionType:]", v8);

  abort();
}

- (BOOL)enableSectionedMenus
{
  return 0;
}

- (int64_t)numberOfSections
{
  void *v4;
  objc_class *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXActionMenuController.m"), 106, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXActionMenuController numberOfSections]", v6);

  abort();
}

- (id)availableActionTypesInSection:(int64_t)a3
{
  void *v5;
  objc_class *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXActionMenuController.m"), 110, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXActionMenuController availableActionTypesInSection:]", v7);

  abort();
}

- (id)titleForSection:(int64_t)a3
{
  void *v5;
  objc_class *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXActionMenuController.m"), 114, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXActionMenuController titleForSection:]", v7);

  abort();
}

- (id)iconForSection:(int64_t)a3
{
  void *v5;
  objc_class *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXActionMenuController.m"), 118, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXActionMenuController iconForSection:]", v7);

  abort();
}

- (BOOL)sectionDisplaysInline:(int64_t)a3
{
  void *v5;
  objc_class *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXActionMenuController.m"), 122, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXActionMenuController sectionDisplaysInline:]", v7);

  abort();
}

- (void)updateActions
{
  NSObject *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  PLUIActionsGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v4 = 136315138;
    v5 = "-[PXActionMenuController updateActions]";
    _os_log_debug_impl(&dword_1A6789000, v3, OS_LOG_TYPE_DEBUG, "=== %s ===", (uint8_t *)&v4, 0xCu);
  }

  if (-[PXActionMenuController enableSectionedMenus](self, "enableSectionedMenus"))
    -[PXActionMenuController _updateSectionedActions](self, "_updateSectionedActions");
  else
    -[PXActionMenuController _updateActionsUsingActivityTypeOrder](self, "_updateActionsUsingActivityTypeOrder");
}

- (id)_actionableActionManagerForActionType:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[PXActionMenuController actionManagers](self, "actionManagers", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v9, "canPerformActionType:", v4))
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)_updateActionsIfNeeded
{
  if (self->_actionsNeedsUpdate)
  {
    self->_actionsNeedsUpdate = 0;
    -[PXActionMenuController updateActions](self, "updateActions");
  }
}

- (void)_updateActionsUsingActivityTypeOrder
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void (**v16)(void *, _QWORD);
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  id v22;
  uint64_t v23;
  PXActionMenuController *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t k;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t m;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t n;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  NSArray *activityActions;
  uint64_t v60;
  NSArray *actions;
  id v62;
  void *v63;
  id v64;
  id v65;
  id v66;
  id v67;
  void *v68;
  id v69;
  void *v70;
  id v71;
  void *v72;
  id v73;
  void *v74;
  id v75;
  void *v76;
  void *v77;
  void (**v79)(void *, void *);
  PXActionMenuController *v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  _QWORD v101[4];
  id v102;
  PXActionMenuController *v103;
  id v104;
  id v105;
  id v106;
  id v107;
  id v108;
  id v109;
  id v110;
  id v111;
  id v112;
  id v113;
  id v114;
  _QWORD aBlock[5];
  id v116;
  SEL v117;
  void *v118;
  _BYTE v119[128];
  _BYTE v120[128];
  _BYTE v121[128];
  _BYTE v122[128];
  _BYTE v123[128];
  uint64_t v124;

  v124 = *MEMORY[0x1E0C80C00];
  -[PXActionMenuController availableActionTypes](self, "availableActionTypes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXActionMenuController availableInternalActionTypes](self, "availableInternalActionTypes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXActionMenuController availableHeaderActionTypes](self, "availableHeaderActionTypes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXActionMenuController availableDestructiveActionTypes](self, "availableDestructiveActionTypes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXActionMenuController disabledActionTypes](self, "disabledActionTypes");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[PXActionMenuController actionsAreExcludedWhenCustomized](self, "actionsAreExcludedWhenCustomized"))
  {
    v72 = 0;
  }
  else
  {
    -[PXActionMenuController excludedActionTypes](self, "excludedActionTypes");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v76 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v3, "count"));
  v68 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v4, "count"));
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v5, "count"));
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v6, "count"));
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v3, "count"));
  objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __62__PXActionMenuController__updateActionsUsingActivityTypeOrder__block_invoke;
  aBlock[3] = &unk_1E512A2A8;
  aBlock[4] = self;
  v12 = v10;
  v116 = v12;
  v117 = a2;
  v79 = (void (**)(void *, void *))_Block_copy(aBlock);
  v101[0] = v11;
  v101[1] = 3221225472;
  v101[2] = __62__PXActionMenuController__updateActionsUsingActivityTypeOrder__block_invoke_3;
  v101[3] = &unk_1E512A2D0;
  v66 = v72;
  v102 = v66;
  v103 = self;
  v80 = self;
  v65 = v74;
  v104 = v65;
  v67 = v70;
  v105 = v67;
  v64 = v12;
  v106 = v64;
  v71 = v7;
  v107 = v71;
  v13 = v9;
  v108 = v13;
  v14 = v4;
  v109 = v14;
  v69 = v68;
  v110 = v69;
  v15 = v5;
  v111 = v15;
  v62 = v6;
  v112 = v62;
  v73 = v8;
  v113 = v73;
  v75 = v76;
  v114 = v75;
  v16 = (void (**)(void *, _QWORD))_Block_copy(v101);
  v97 = 0u;
  v98 = 0u;
  v99 = 0u;
  v100 = 0u;
  v17 = v3;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v97, v123, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v98;
    do
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v98 != v20)
          objc_enumerationMutation(v17);
        v16[2](v16, *(_QWORD *)(*((_QWORD *)&v97 + 1) + 8 * i));
      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v97, v123, 16, v62, v64, v65, v66);
    }
    while (v19);
  }
  v77 = v17;

  v95 = 0u;
  v96 = 0u;
  v93 = 0u;
  v94 = 0u;
  v22 = v14;
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v93, v122, 16);
  v24 = v80;
  v25 = v67;
  if (v23)
  {
    v26 = v23;
    v27 = *(_QWORD *)v94;
    do
    {
      for (j = 0; j != v26; ++j)
      {
        if (*(_QWORD *)v94 != v27)
          objc_enumerationMutation(v22);
        v16[2](v16, *(_QWORD *)(*((_QWORD *)&v93 + 1) + 8 * j));
      }
      v26 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v93, v122, 16);
    }
    while (v26);
  }

  v91 = 0u;
  v92 = 0u;
  v89 = 0u;
  v90 = 0u;
  v29 = v15;
  v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v89, v121, 16);
  if (v30)
  {
    v31 = v30;
    v32 = *(_QWORD *)v90;
    do
    {
      for (k = 0; k != v31; ++k)
      {
        if (*(_QWORD *)v90 != v32)
          objc_enumerationMutation(v29);
        v16[2](v16, *(_QWORD *)(*((_QWORD *)&v89 + 1) + 8 * k));
      }
      v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v89, v121, 16);
    }
    while (v31);
  }

  v87 = 0u;
  v88 = 0u;
  v85 = 0u;
  v86 = 0u;
  v34 = v62;
  v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v85, v120, 16);
  if (v35)
  {
    v36 = v35;
    v37 = *(_QWORD *)v86;
    do
    {
      for (m = 0; m != v36; ++m)
      {
        if (*(_QWORD *)v86 != v37)
          objc_enumerationMutation(v34);
        v16[2](v16, *(_QWORD *)(*((_QWORD *)&v85 + 1) + 8 * m));
      }
      v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v85, v120, 16);
    }
    while (v36);
  }

  v39 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v77, "count"));
  -[PXActionMenuController defaultActivityTypeOrder](v80, "defaultActivityTypeOrder");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = objc_msgSend(v40, "count");

  if (v41)
  {
    v83 = 0u;
    v84 = 0u;
    v81 = 0u;
    v82 = 0u;
    -[PXActionMenuController defaultActivityTypeOrder](v80, "defaultActivityTypeOrder", v22);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v81, v119, 16);
    if (v43)
    {
      v44 = v43;
      v45 = *(_QWORD *)v82;
      do
      {
        for (n = 0; n != v44; ++n)
        {
          if (*(_QWORD *)v82 != v45)
            objc_enumerationMutation(v42);
          objc_msgSend(v13, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v81 + 1) + 8 * n));
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          if (v47)
            objc_msgSend(v39, "addObject:", v47);

        }
        v44 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v81, v119, 16);
      }
      while (v44);
      v24 = v80;
      v25 = v67;
    }
  }
  else
  {
    objc_msgSend(v13, "allValues", v22);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "addObjectsFromArray:", v42);
  }

  objc_msgSend(v39, "addObjectsFromArray:", v75);
  v79[2](v79, v39);
  v48 = v71;
  if (objc_msgSend(v71, "count"))
  {
    objc_msgSend(MEMORY[0x1E0DC39D0], "menuWithTitle:image:identifier:options:children:", &stru_1E5149688, 0, 0, 1, v71);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "insertObject:atIndex:", v49, 0);

  }
  if (objc_msgSend(v73, "count"))
  {
    objc_msgSend(MEMORY[0x1E0DC39D0], "menuWithTitle:image:identifier:options:children:", &stru_1E5149688, 0, 0, 1, v73);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "addObject:", v50);

  }
  v51 = v69;
  if (objc_msgSend(v69, "count"))
  {
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("apple.logo"));
    v52 = v25;
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC39D0], "menuWithTitle:image:identifier:options:children:", CFSTR("Internal"));
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = (void *)MEMORY[0x1E0DC39D0];
    v118 = v54;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v118, 1);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "menuWithTitle:image:identifier:options:children:", &stru_1E5149688, 0, 0, 1, v56);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "addObject:", v57);

    v48 = v71;
    v51 = v69;

    v25 = v52;
    v24 = v80;
  }
  v58 = objc_msgSend(v25, "copy");
  activityActions = v24->_activityActions;
  v24->_activityActions = (NSArray *)v58;

  v60 = objc_msgSend(v39, "copy");
  actions = v24->_actions;
  v24->_actions = (NSArray *)v60;

}

- (void)_updateSectionedActions
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unint64_t v16;
  void *v17;
  NSArray *activityActions;
  NSArray *v19;
  NSArray *actions;
  uint64_t v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v3 = -[PXActionMenuController numberOfSections](self, "numberOfSections");
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 >= 1)
  {
    v5 = 0;
    v6 = 0x1E0DC3000uLL;
    v21 = v3;
    do
    {
      -[PXActionMenuController _menuElementsForSection:](self, "_menuElementsForSection:", v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "count"))
      {
        -[PXActionMenuController titleForSection:](self, "titleForSection:", v5);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[PXActionMenuController iconForSection:](self, "iconForSection:", v5);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = -[PXActionMenuController sectionDisplaysInline:](self, "sectionDisplaysInline:", v5);
        v11 = *(void **)(v6 + 2512);
        if (v10)
        {
          objc_msgSend(v11, "menuWithTitle:image:identifier:options:children:", v8, v9, 0, 1, v7);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_msgSend(v11, "menuWithTitle:image:identifier:options:children:", v8, v9, 0, 0, v7);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = *(void **)(v6 + 2512);
          v22[0] = v13;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 1);
          v15 = v4;
          v16 = v6;
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "menuWithTitle:image:identifier:options:children:", &stru_1E5149688, 0, 0, 1, v17);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          v6 = v16;
          v4 = v15;
          v3 = v21;

        }
        objc_msgSend(v4, "addObject:", v12);

      }
      ++v5;
    }
    while (v3 != v5);
  }
  activityActions = self->_activityActions;
  self->_activityActions = (NSArray *)MEMORY[0x1E0C9AA60];

  v19 = (NSArray *)objc_msgSend(v4, "copy");
  actions = self->_actions;
  self->_actions = v19;

}

- (id)_menuElementsForSection:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  -[PXActionMenuController availableActionTypesInSection:](self, "availableActionTypesInSection:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXActionMenuController disabledActionTypes](self, "disabledActionTypes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXActionMenuController excludedActionTypes](self, "excludedActionTypes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v8 = v4;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v19 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
        if ((objc_msgSend(v6, "containsObject:", v13, (_QWORD)v18) & 1) == 0
          && (objc_msgSend(v5, "containsObject:", v13) & 1) == 0
          && -[PXActionMenuController shouldAllowPerformanceOfActionType:](self, "shouldAllowPerformanceOfActionType:", v13))
        {
          -[PXActionMenuController _actionableActionManagerForActionType:](self, "_actionableActionManagerForActionType:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = v14;
          if (v14)
          {
            objc_msgSend(v14, "standardActionForActionType:", v13);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "addObject:", v16);

          }
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v10);
  }

  return v7;
}

- (void)invalidateActions
{
  self->_actionsNeedsUpdate = 1;
}

- (NSOrderedSet)defaultActivityTypeOrder
{
  return self->_defaultActivityTypeOrder;
}

- (NSSet)disabledActionTypes
{
  return self->_disabledActionTypes;
}

- (NSSet)excludedActionTypes
{
  return self->_excludedActionTypes;
}

- (UIAlertController)alertController
{
  return self->_alertController;
}

- (NSArray)availableDestructiveActionTypes
{
  return self->_availableDestructiveActionTypes;
}

- (NSArray)actionManagers
{
  return self->_actionManagers;
}

- (BOOL)actionsAreExcludedWhenCustomized
{
  return self->_actionsAreExcludedWhenCustomized;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionManagers, 0);
  objc_storeStrong((id *)&self->_availableDestructiveActionTypes, 0);
  objc_storeStrong((id *)&self->_alertController, 0);
  objc_storeStrong((id *)&self->_excludedActionTypes, 0);
  objc_storeStrong((id *)&self->_disabledActionTypes, 0);
  objc_storeStrong((id *)&self->_defaultActivityTypeOrder, 0);
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong((id *)&self->_activityActions, 0);
}

void __62__PXActionMenuController__updateActionsUsingActivityTypeOrder__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;
  uint64_t v11;

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __62__PXActionMenuController__updateActionsUsingActivityTypeOrder__block_invoke_2;
  v8[3] = &unk_1E512A280;
  v4 = *(void **)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 48);
  v7 = *(_QWORD *)(a1 + 32);
  v9 = v5;
  v10 = v7;
  v11 = v6;
  objc_msgSend(v4, "customizeActions:withActionTypes:", a2, v8);

}

void __62__PXActionMenuController__updateActionsUsingActivityTypeOrder__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  __CFString *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  int v12;
  id v13;
  __int16 v14;
  __CFString *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:", v3) & 1) == 0
    && objc_msgSend(*(id *)(a1 + 40), "shouldAllowPerformanceOfActionType:", v3))
  {
    objc_msgSend(*(id *)(a1 + 40), "_actionableActionManagerForActionType:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4 || (objc_msgSend(*(id *)(a1 + 48), "containsObject:", v3) & 1) != 0)
      goto LABEL_22;
    objc_msgSend(v4, "activityForActionType:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "activityType");
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (v5)
      objc_msgSend(*(id *)(a1 + 56), "addObject:", v5);
    objc_msgSend(v4, "standardActionForActionType:", v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
LABEL_21:

LABEL_22:
      goto LABEL_23;
    }
    objc_msgSend(*(id *)(a1 + 64), "setObject:forKey:", v3, v7);
    PLUIActionsGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      v12 = 138412802;
      v13 = v3;
      v14 = 2112;
      v15 = v6;
      v16 = 2112;
      v17 = v7;
      _os_log_debug_impl(&dword_1A6789000, v8, OS_LOG_TYPE_DEBUG, "actionType:%@ activityType:%@ action:%@", (uint8_t *)&v12, 0x20u);
    }

    if (v6 != CFSTR("PXActivityTypeSetAllLibrariesFilter")
      && v6 != CFSTR("PXActivityTypeSetPersonalLibraryFilter")
      && v6 != CFSTR("PXActivityTypeSetSharedLibraryFilter"))
    {
      if (v6)
      {
        objc_msgSend(*(id *)(a1 + 40), "defaultActivityTypeOrder");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "containsObject:", v6);

        if (v10)
        {
          objc_msgSend(*(id *)(a1 + 80), "setObject:forKeyedSubscript:", v7, v6);
          goto LABEL_21;
        }
      }
      if (objc_msgSend(*(id *)(a1 + 88), "containsObject:", v3))
      {
        v11 = *(void **)(a1 + 96);
LABEL_20:
        objc_msgSend(v11, "addObject:", v7);
        goto LABEL_21;
      }
      if (!objc_msgSend(*(id *)(a1 + 104), "containsObject:", v3))
      {
        if (objc_msgSend(*(id *)(a1 + 112), "containsObject:", v3))
          v11 = *(void **)(a1 + 120);
        else
          v11 = *(void **)(a1 + 128);
        goto LABEL_20;
      }
    }
    v11 = *(void **)(a1 + 72);
    goto LABEL_20;
  }
LABEL_23:

}

id __62__PXActionMenuController__updateActionsUsingActivityTypeOrder__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v6;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40), CFSTR("PXActionMenuController.m"), 180, CFSTR("couldn't determine action type for %@"), v3);

  }
  return v4;
}

@end
