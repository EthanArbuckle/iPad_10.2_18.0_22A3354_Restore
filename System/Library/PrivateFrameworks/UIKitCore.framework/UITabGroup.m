@implementation UITabGroup

- (UITabGroup)initWithTitle:(id)a3 image:(id)a4 identifier:(id)a5 viewControllerProvider:(id)a6
{
  return -[UITabGroup initWithTitle:image:identifier:children:viewControllerProvider:](self, "initWithTitle:image:identifier:children:viewControllerProvider:", a3, a4, a5, MEMORY[0x1E0C9AA60], a6);
}

- (UITabGroup)initWithTitle:(id)a3 image:(id)a4 identifier:(id)a5 children:(id)a6 viewControllerProvider:(id)a7
{
  id v12;
  UITabGroup *v13;
  UITabGroup *v14;
  NSArray *children;
  NSArray *v16;
  NSArray *displayOrderIdentifiers;
  NSArray *sidebarActions;
  objc_super v20;

  v12 = a6;
  v20.receiver = self;
  v20.super_class = (Class)UITabGroup;
  v13 = -[UITab initWithTitle:image:identifier:viewControllerProvider:](&v20, sel_initWithTitle_image_identifier_viewControllerProvider_, a3, a4, a5, a7);
  v14 = v13;
  if (v13)
  {
    children = v13->_children;
    v16 = (NSArray *)MEMORY[0x1E0C9AA60];
    v13->_children = (NSArray *)MEMORY[0x1E0C9AA60];

    displayOrderIdentifiers = v14->_displayOrderIdentifiers;
    v14->_displayOrderIdentifiers = v16;

    sidebarActions = v14->_sidebarActions;
    v14->_sidebarActions = v16;

    -[UITabGroup setChildren:](v14, "setChildren:", v12);
  }

  return v14;
}

- (void)setSelectedChild:(id)a3
{
  UITab *v5;
  UITab *v6;

  v5 = (UITab *)a3;
  if (self->_selectedChild != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_selectedChild, a3);
    -[UITabGroup _selectedElementDidChange](self, "_selectedElementDidChange");
    v5 = v6;
  }

}

- (void)setChildren:(id)a3
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t k;
  NSArray *v25;
  NSArray *children;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t m;
  void *v33;
  void *v34;
  void *v35;
  SEL v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  _BYTE v54[128];
  _BYTE v55[128];
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UITabGroup.m"), 61, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("children"));

  }
  objc_msgSend(v5, "differenceFromArray:withOptions:usingEquivalenceTest:", self->_children, 0, &__block_literal_global_157);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "hasChanges"))
  {
    v36 = a2;
    v7 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v49 = 0u;
    v50 = 0u;
    v51 = 0u;
    v52 = 0u;
    objc_msgSend(v6, "removals");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v49, v56, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v50;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v50 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v49 + 1) + 8 * i), "object");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v13);

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v49, v56, 16);
      }
      while (v10);
    }

    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    objc_msgSend(v6, "insertions");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v45, v55, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v46;
      do
      {
        for (j = 0; j != v16; ++j)
        {
          if (*(_QWORD *)v46 != v17)
            objc_enumerationMutation(v14);
          objc_msgSend(*(id *)(*((_QWORD *)&v45 + 1) + 8 * j), "object");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "removeObject:", v19);

        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v45, v55, 16);
      }
      while (v16);
    }

    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    v20 = v7;
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v41, v54, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v42;
      do
      {
        for (k = 0; k != v22; ++k)
        {
          if (*(_QWORD *)v42 != v23)
            objc_enumerationMutation(v20);
          objc_msgSend(*(id *)(*((_QWORD *)&v41 + 1) + 8 * k), "_setParent:", 0);
        }
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v41, v54, 16);
      }
      while (v22);
    }

    v25 = (NSArray *)objc_msgSend(v5, "copy");
    children = self->_children;
    self->_children = v25;

    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v27 = v5;
    v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v37, v53, 16);
    if (v28)
    {
      v29 = v28;
      v30 = *(_QWORD *)v38;
      v31 = 0x1E0CB3000uLL;
      do
      {
        for (m = 0; m != v29; ++m)
        {
          if (*(_QWORD *)v38 != v30)
            objc_enumerationMutation(v27);
          v33 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * m);
          if (objc_msgSend(v33, "_isUniquelySPI"))
          {
            objc_msgSend(*(id *)(v31 + 1160), "currentHandler");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", v36, self, CFSTR("UITabGroup.m"), 82, CFSTR("Cannot add _UITab objects to a UITabGroup. Please use UITab directly."));

            v31 = 0x1E0CB3000;
          }
          objc_msgSend(v33, "_setParent:", self);
        }
        v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v37, v53, 16);
      }
      while (v29);
    }

    -[UITabGroup _invalidateDisplayOrder](self, "_invalidateDisplayOrder");
    -[UITabGroup _elementsDidChange](self, "_elementsDidChange");
    -[UITabGroup _validateSelectedElement](self, "_validateSelectedElement");

  }
}

BOOL __26__UITabGroup_setChildren___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a2 == a3;
}

- (NSArray)displayOrder
{
  NSArray *displayOrder;
  NSArray *v4;
  NSArray *v5;

  displayOrder = self->_displayOrder;
  if (!displayOrder)
  {
    -[UITabGroup _orderedChildrenForDisplayOrder:](self, "_orderedChildrenForDisplayOrder:", 0);
    v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v5 = self->_displayOrder;
    self->_displayOrder = v4;

    displayOrder = self->_displayOrder;
  }
  return displayOrder;
}

- (void)setAllowsReordering:(BOOL)a3
{
  if (self->_allowsReordering != a3)
  {
    self->_allowsReordering = a3;
    -[UITab _customizabilityDidChange](self, "_customizabilityDidChange");
  }
}

- (void)setSidebarAppearance:(unint64_t)a3
{
  if (self->_sidebarAppearance != a3)
  {
    self->_sidebarAppearance = a3;
    -[UITabGroup _elementsDidChange](self, "_elementsDidChange");
  }
}

- (id)tabForIdentifier:(id)a3
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
  id v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[UITabGroup children](self, "children", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (!v6)
    goto LABEL_13;
  v7 = v6;
  v8 = *(_QWORD *)v17;
  do
  {
    for (i = 0; i != v7; ++i)
    {
      if (*(_QWORD *)v17 != v8)
        objc_enumerationMutation(v5);
      v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
      objc_msgSend(v10, "identifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "isEqualToString:", v4);

      if (v12)
      {
        v13 = v10;
      }
      else
      {
        if (!objc_msgSend(v10, "_isGroup"))
          continue;
        objc_msgSend(v10, "tabForIdentifier:", v4);
        v13 = (id)objc_claimAutoreleasedReturnValue();
      }
      v14 = v13;
      if (v13)
        goto LABEL_14;
    }
    v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  }
  while (v7);
LABEL_13:
  v14 = 0;
LABEL_14:

  return v14;
}

- (id)managingTabGroup
{
  void *v3;
  UITabGroup *v4;

  -[UITab parent](self, "parent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "managingTabGroup");
  v4 = (UITabGroup *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    -[UITabGroup managingNavigationController](self, "managingNavigationController");
    v4 = (UITabGroup *)objc_claimAutoreleasedReturnValue();

    if (v4)
      v4 = self;
  }
  return v4;
}

- (void)setManagingNavigationController:(id)a3
{
  UINavigationController *v5;
  UINavigationController **p_managingNavigationController;
  void *v7;
  UITabGroup *v8;
  void *v9;
  void *v10;
  void *v11;
  UINavigationController *v12;

  v5 = (UINavigationController *)a3;
  p_managingNavigationController = &self->_managingNavigationController;
  if (self->_managingNavigationController != v5)
  {
    v12 = v5;
    -[UITabGroup _displayedViewController](self, "_displayedViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UINavigationController _managedTabGroup](*p_managingNavigationController, "_managedTabGroup");
    v8 = (UITabGroup *)objc_claimAutoreleasedReturnValue();

    if (v8 == self)
      -[UINavigationController _setManagedTabGroup:](*p_managingNavigationController, "_setManagedTabGroup:", 0);
    objc_storeStrong((id *)&self->_managingNavigationController, a3);
    -[UITabGroup _displayedViewController](self, "_displayedViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9 != v7)
    {
      -[UITab _updateLinkedTabBarItem](self, "_updateLinkedTabBarItem");
      -[UITab tabBarController](self, "tabBarController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[UITabBarController _displayedViewControllerDidChangeForTab:previousViewController:]((uint64_t)v10, self, v7);

    }
    -[UINavigationController _managedTabGroup](v12, "_managedTabGroup");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
      -[UINavigationController _setManagedTabGroup:](v12, "_setManagedTabGroup:", 0);
    -[UINavigationController _setManagedTabGroup:](v12, "_setManagedTabGroup:", self);
    -[UITabGroup _registerManagingNavigationTraitsIfNeeded](self, "_registerManagingNavigationTraitsIfNeeded");
    -[UITabGroup _updateManagingNavigationStackUsingTransition:](self, "_updateManagingNavigationStackUsingTransition:", 0);

    v5 = v12;
  }

}

- (id)_displayedViewController
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[UITabGroup managingNavigationController](self, "managingNavigationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[UITab viewController](self, "viewController");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

- (void)_updateManagingNavigationStack
{
  -[UITabGroup _updateManagingNavigationStackUsingTransition:](self, "_updateManagingNavigationStackUsingTransition:", 0);
}

- (void)_updateManagingNavigationStackUsingTransition:(unint64_t)a3
{
  id *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  _BOOL8 v21;
  id v22;
  id v23;
  void *v24;
  int v25;
  void *v26;
  unint64_t v27;
  void *v28;
  _QWORD v29[4];
  id v30;
  id v31;
  BOOL v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  -[UITab tabBarController](self, "tabBarController");
  v5 = (id *)objc_claimAutoreleasedReturnValue();
  if (v5 && !self->_isUpdatingManagedNavigationController)
  {
    -[UITabGroup managingNavigationController](self, "managingNavigationController");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    if (v6)
    {
      v27 = a3;
      v28 = (void *)v6;
      -[UITabGroup _selectedTabHierarchy](self, "_selectedTabHierarchy");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v8, "count"));
      v33 = 0u;
      v34 = 0u;
      v35 = 0u;
      v36 = 0u;
      v10 = v8;
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v34;
        do
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v34 != v13)
              objc_enumerationMutation(v10);
            v15 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
            objc_msgSend(v15, "_displayedViewControllers");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            -[UITabBarController _displayedViewControllersForTab:proposedViewControllers:](v5, v15, v16);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            if (v17)
              objc_msgSend(v9, "addObjectsFromArray:", v17);
            objc_msgSend(v15, "_setDisplayedViewControllers:", v17);

          }
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
        }
        while (v12);
      }

      objc_msgSend(v5, "traitCollection");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "horizontalSizeClass");

      v21 = v27 == 2 && v19 == 2;
      v7 = v28;
      objc_msgSend(v28, "_setWantsTabCrossfadeTransition:", v21);
      v29[0] = MEMORY[0x1E0C809B0];
      v29[1] = 3221225472;
      v29[2] = __60__UITabGroup__updateManagingNavigationStackUsingTransition___block_invoke;
      v29[3] = &unk_1E16B4008;
      v22 = v28;
      v30 = v22;
      v31 = v9;
      v32 = v27 != 0;
      v23 = v9;
      -[UITabGroup _performWithoutUpdatingManagingNavigationController:](self, "_performWithoutUpdatingManagingNavigationController:", v29);
      objc_msgSend(v22, "_setWantsTabCrossfadeTransition:", 0);

    }
    else
    {
      -[UITabGroup selectedChild](self, "selectedChild");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "_isGroup");

      if (v25)
      {
        -[UITabGroup selectedChild](self, "selectedChild");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "_updateManagingNavigationStackUsingTransition:", a3);

      }
    }

  }
}

uint64_t __60__UITabGroup__updateManagingNavigationStackUsingTransition___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setViewControllers:animated:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));
}

- (void)_updateForManagingNavigationStackChange
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  BOOL v8;
  unint64_t v9;
  void *v10;
  void *v11;
  id v12;
  _BOOL4 v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;
  void *v21;
  BOOL v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  BOOL v32;
  void *v33;
  uint64_t v34;
  id v35;
  _QWORD v37[4];
  id v38;
  id v39;
  UITabGroup *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _QWORD v45[4];
  id v46;
  id v47;
  uint64_t *v48;
  uint64_t *v49;
  uint64_t v50;
  id *v51;
  uint64_t v52;
  uint64_t (*v53)(uint64_t, uint64_t);
  void (*v54)(uint64_t);
  id v55;
  uint64_t v56;
  uint64_t *v57;
  uint64_t v58;
  uint64_t v59;
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  if (!self->_isUpdatingManagedNavigationController)
  {
    -[UITabGroup managingNavigationController](self, "managingNavigationController");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "viewControllers");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    -[UITabGroup _selectedTabHierarchy](self, "_selectedTabHierarchy");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = 0;
    v57 = &v56;
    v58 = 0x2020000000;
    v59 = 0x7FFFFFFFFFFFFFFFLL;
    v50 = 0;
    v51 = (id *)&v50;
    v52 = 0x3032000000;
    v53 = __Block_byref_object_copy__66;
    v54 = __Block_byref_object_dispose__66;
    v55 = 0;
    v45[0] = MEMORY[0x1E0C809B0];
    v45[1] = 3221225472;
    v45[2] = __53__UITabGroup__updateForManagingNavigationStackChange__block_invoke_13;
    v45[3] = &unk_1E16C3848;
    v35 = v4;
    v46 = v35;
    v47 = &__block_literal_global_12_2;
    v48 = &v50;
    v49 = &v56;
    objc_msgSend(v3, "enumerateObjectsWithOptions:usingBlock:", 2, v45);
    if (objc_msgSend(v51[5], "_isGroup"))
    {
      v5 = v51[5];
      objc_msgSend(v5, "selectedChild");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "_displayedViewControllers");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "count") == 0;

      if (!v8)
      {

        v6 = 0;
      }
      v9 = v57[3] + 1;
      v57[3] = v9;
      while (v9 < objc_msgSend(v3, "count"))
      {
        objc_msgSend(v3, "objectAtIndex:", v57[3]);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "tab");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "_parentGroup");
        v12 = (id)objc_claimAutoreleasedReturnValue();
        v13 = v12 == v5;

        if (!v13)
        {
          v43 = 0u;
          v44 = 0u;
          v41 = 0u;
          v42 = 0u;
          objc_msgSend(v5, "children");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v41, v60, 16);
          v16 = v15;
          if (v15)
          {
            v17 = *(_QWORD *)v42;
LABEL_10:
            v18 = 0;
            while (1)
            {
              if (*(_QWORD *)v42 != v17)
                objc_enumerationMutation(v14);
              v19 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * v18);
              v15 = __53__UITabGroup__updateForManagingNavigationStackChange__block_invoke(v15, v19, v10);
              if ((v15 & 1) != 0)
                break;
              if (v16 == ++v18)
              {
                v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v41, v60, 16);
                v16 = v15;
                if (v15)
                  goto LABEL_10;
                goto LABEL_24;
              }
            }
            v20 = v19;

            if (v20)
              goto LABEL_20;
          }
          else
          {
LABEL_24:

          }
          goto LABEL_25;
        }
        v20 = v11;
LABEL_20:

        if (!objc_msgSend(v20, "_isGroup")
          || (objc_msgSend(v20, "children"),
              v21 = (void *)objc_claimAutoreleasedReturnValue(),
              v22 = objc_msgSend(v21, "count") == 0,
              v21,
              v22))
        {
          v6 = v20;
LABEL_25:

          break;
        }
        v23 = v20;

        objc_msgSend(v23, "selectedChild");
        v6 = (void *)objc_claimAutoreleasedReturnValue();

        v9 = v57[3] + 1;
        v57[3] = v9;
        v5 = v23;
      }
      if (!v6)
      {
        objc_msgSend(v5, "selectedChild");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = v31 == 0;

        if (!v32)
        {
          objc_msgSend(v5, "selectedChild");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          if (v33)
          {
            while (1)
            {
              objc_msgSend(v33, "_setDisplayedViewControllers:", 0);
              if (!objc_msgSend(v33, "_isGroup"))
                break;
              objc_msgSend(v33, "selectedChild");
              v34 = objc_claimAutoreleasedReturnValue();

              v33 = (void *)v34;
              if (!v34)
                goto LABEL_27;
            }

          }
        }
      }
LABEL_27:
      v37[0] = MEMORY[0x1E0C809B0];
      v37[1] = 3221225472;
      v37[2] = __53__UITabGroup__updateForManagingNavigationStackChange__block_invoke_3;
      v37[3] = &unk_1E16B47A8;
      v24 = v5;
      v38 = v24;
      v25 = v6;
      v39 = v25;
      v40 = self;
      -[UITabGroup _performWithoutUpdatingManagingNavigationController:](self, "_performWithoutUpdatingManagingNavigationController:", v37);
      if (v6)
        v26 = v25;
      else
        v26 = v24;
      objc_storeStrong(v51 + 5, v26);

    }
    v27 = v57[3];
    if ((unint64_t)(v27 - 0x7FFFFFFFFFFFFFFFLL) >= 0x8000000000000002)
    {
      while (1)
      {
        objc_msgSend(v3, "objectAtIndex:", v27 - 1);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        if ((__53__UITabGroup__updateForManagingNavigationStackChange__block_invoke((uint64_t)v28, v51[5], v28) & 1) == 0)
          break;
        --v57[3];

        v27 = v57[3];
        if ((unint64_t)(v27 - 0x7FFFFFFFFFFFFFFFLL) < 0x8000000000000002)
          goto LABEL_36;
      }

      v27 = v57[3];
    }
LABEL_36:
    v29 = objc_msgSend(v3, "count");
    objc_msgSend(v3, "subarrayWithRange:", v27, v29 - v57[3]);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51[5], "_setDisplayedViewControllers:", v30);

    _Block_object_dispose(&v50, 8);
    _Block_object_dispose(&v56, 8);

  }
}

uint64_t __53__UITabGroup__updateForManagingNavigationStackChange__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v8;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v5, "tab");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (v6 == v4)
  {
    v8 = 1;
  }
  else
  {
    objc_msgSend(v4, "_displayedViewControllers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "containsObject:", v5);

  }
  return v8;
}

void __53__UITabGroup__updateForManagingNavigationStackChange__block_invoke_13(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  __int128 v14;
  uint64_t v15;
  uint64_t v16;

  v7 = a2;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __53__UITabGroup__updateForManagingNavigationStackChange__block_invoke_2;
  v11[3] = &unk_1E16C3820;
  v8 = *(void **)(a1 + 32);
  v9 = *(id *)(a1 + 40);
  v12 = v7;
  v13 = v9;
  v14 = *(_OWORD *)(a1 + 48);
  v15 = a3;
  v16 = a4;
  v10 = v7;
  objc_msgSend(v8, "enumerateObjectsWithOptions:usingBlock:", 2, v11);

}

void __53__UITabGroup__updateForManagingNavigationStackChange__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;

  v7 = a2;
  if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 40) + 16))())
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = *(_QWORD *)(a1 + 64);
    **(_BYTE **)(a1 + 72) = 1;
    *a4 = 1;
  }

}

void __53__UITabGroup__updateForManagingNavigationStackChange__block_invoke_3(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "setSelectedChild:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 48), "_tabModel");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "selectElement:notifyOnReselection:", *(_QWORD *)(a1 + 32), 0);

}

- (void)_performWithoutUpdatingManagingNavigationController:(id)a3
{
  BOOL isUpdatingManagedNavigationController;

  isUpdatingManagedNavigationController = self->_isUpdatingManagedNavigationController;
  self->_isUpdatingManagedNavigationController = 1;
  (*((void (**)(id, SEL))a3 + 2))(a3, a2);
  self->_isUpdatingManagedNavigationController = isUpdatingManagedNavigationController;
}

- (id)_selectedTabHierarchy
{
  id v3;
  UITabGroup *v4;
  void *v5;
  id v6;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v4 = self;
  if (v4)
  {
    v5 = v4;
    do
    {
      objc_msgSend(v3, "addObject:", v5);
      if (!objc_msgSend(v5, "_isGroup"))
        break;
      v6 = v5;
      objc_msgSend(v6, "selectedChild");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

    }
    while (v5);

  }
  return v3;
}

- (void)_registerManagingNavigationTraitsIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  UITraitChangeRegistration *v6;
  UITraitChangeRegistration *sizeClassTraitRegistration;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  if (!self->_sizeClassTraitRegistration)
  {
    -[UITab tabBarController](self, "tabBarController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_self();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "registerForTraitChanges:withTarget:action:", v5, self, sel__updateManagingNavigationStack);
    v6 = (UITraitChangeRegistration *)objc_claimAutoreleasedReturnValue();
    sizeClassTraitRegistration = self->_sizeClassTraitRegistration;
    self->_sizeClassTraitRegistration = v6;

  }
}

- (void)_elementsDidChange
{
  id v3;

  -[UITab _tabModel](self, "_tabModel");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "elementsDidChangeForGroup:", self);

}

- (void)_selectedElementDidChange
{
  id v3;

  -[UITab _tabModel](self, "_tabModel");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "selectedElementDidChangeForGroup:", self);

}

- (void)_validateSelectedElement
{
  void *v3;
  UITabGroup *v4;
  NSArray *children;
  id v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;

  -[UITabGroup selectedChild](self, "selectedChild");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v8 = v3;
    objc_msgSend(v3, "parent");
    v4 = (UITabGroup *)objc_claimAutoreleasedReturnValue();

    if (v4 != self)
    {
      children = self->_children;
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __38__UITabGroup__validateSelectedElement__block_invoke;
      v9[3] = &unk_1E16BFD48;
      v6 = v8;
      v10 = v6;
      v7 = -[NSArray indexOfObjectPassingTest:](children, "indexOfObjectPassingTest:", v9);
      if (v7 == 0x7FFFFFFFFFFFFFFFLL)
        -[UITabGroup _defaultChildForSelection](self, "_defaultChildForSelection");
      else
        -[NSArray objectAtIndex:](self->_children, "objectAtIndex:", v7);
      v8 = (id)objc_claimAutoreleasedReturnValue();

      -[UITabGroup setSelectedChild:](self, "setSelectedChild:", v8);
    }
    v3 = v8;
  }

}

uint64_t __38__UITabGroup__validateSelectedElement__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v8;

  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v3;
  v6 = v4;
  v7 = v6;
  if (v5 == v6)
  {
    v8 = 1;
  }
  else
  {
    v8 = 0;
    if (v5 && v6)
      v8 = objc_msgSend(v5, "isEqual:", v6);
  }

  return v8;
}

- (void)_invalidateDisplayOrder
{
  NSArray *displayOrder;

  displayOrder = self->_displayOrder;
  self->_displayOrder = 0;

}

- (BOOL)_isGroup
{
  return 1;
}

- (BOOL)_isCustomizable
{
  BOOL v3;
  BOOL v4;
  void *v6;
  _QWORD v7[5];
  objc_super v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  unsigned __int8 v12;

  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  v8.receiver = self;
  v8.super_class = (Class)UITabGroup;
  v12 = -[UITab _isCustomizable](&v8, sel__isCustomizable);
  if (*((_BYTE *)v10 + 24)
    || (v3 = -[UITabGroup allowsReordering](self, "allowsReordering"), (*((_BYTE *)v10 + 24) = v3) != 0))
  {
    v4 = 1;
  }
  else
  {
    -[UITabGroup children](self, "children");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __29__UITabGroup__isCustomizable__block_invoke;
    v7[3] = &unk_1E16C3870;
    v7[4] = &v9;
    objc_msgSend(v6, "enumerateObjectsUsingBlock:", v7);

    v4 = *((_BYTE *)v10 + 24) != 0;
  }
  _Block_object_dispose(&v9, 8);
  return v4;
}

uint64_t __29__UITabGroup__isCustomizable__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(a2, "_isCustomizable");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) |= result;
  *a4 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

- (void)_didChangeTabModel:(id)a3
{
  id v4;
  void *v5;
  UITraitChangeRegistration *sizeClassTraitRegistration;
  void *v7;
  void *v8;
  void *v9;
  NSArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  objc_super v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_sizeClassTraitRegistration)
  {
    -[UITab tabBarController](self, "tabBarController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "unregisterForTraitChanges:", self->_sizeClassTraitRegistration);

    sizeClassTraitRegistration = self->_sizeClassTraitRegistration;
    self->_sizeClassTraitRegistration = 0;

  }
  v19.receiver = self;
  v19.super_class = (Class)UITabGroup;
  -[UITab _didChangeTabModel:](&v19, sel__didChangeTabModel_, v4);
  if (v4)
  {
    objc_msgSend(v4, "customizationStore");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITab identifier](self, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "displayOrderIdentifiersForGroupWithIdentifier:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
      -[UITabGroup _setDisplayOrderIdentifiers:](self, "_setDisplayOrderIdentifiers:", v9);
    -[UITabGroup _registerManagingNavigationTraitsIfNeeded](self, "_registerManagingNavigationTraitsIfNeeded");

  }
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v10 = self->_children;
  v11 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v16;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v16 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v14++), "_didChangeTabModel:", v4, (_QWORD)v15);
      }
      while (v12 != v14);
      v12 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
    }
    while (v12);
  }

}

- (id)_defaultChildForSelection
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v14[4];
  id v15;
  id v16;
  uint64_t *v17;
  _QWORD *v18;
  uint64_t *v19;
  _QWORD aBlock[4];
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  _QWORD v34[3];
  char v35;

  -[UITab _tabModel](self, "_tabModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITabGroup defaultChildIdentifier](self, "defaultChildIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = 0;
  v34[1] = v34;
  v34[2] = 0x2020000000;
  v35 = 0;
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__66;
  v32 = __Block_byref_object_dispose__66;
  v33 = 0;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__66;
  v26 = __Block_byref_object_dispose__66;
  v27 = 0;
  v5 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __39__UITabGroup__defaultChildForSelection__block_invoke;
  aBlock[3] = &unk_1E16C3898;
  v6 = v3;
  v21 = v6;
  v7 = _Block_copy(aBlock);
  -[UITabGroup children](self, "children");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v5;
  v14[1] = 3221225472;
  v14[2] = __39__UITabGroup__defaultChildForSelection__block_invoke_2;
  v14[3] = &unk_1E16C38C0;
  v9 = v4;
  v15 = v9;
  v10 = v7;
  v16 = v10;
  v17 = &v28;
  v18 = v34;
  v19 = &v22;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v14);

  v11 = (void *)v29[5];
  if (!v11)
    v11 = (void *)v23[5];
  v12 = v11;

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v28, 8);

  _Block_object_dispose(v34, 8);
  return v12;
}

uint64_t __39__UITabGroup__defaultChildForSelection__block_invoke(uint64_t a1, void *a2)
{
  void *v2;

  v2 = *(void **)(a1 + 32);
  if (v2)
    return objc_msgSend(v2, "isTabHidden:", a2);
  else
    return objc_msgSend(a2, "isHidden");
}

void __39__UITabGroup__defaultChildForSelection__block_invoke_2(_QWORD *a1, void *a2, uint64_t a3, char *a4)
{
  void *v7;
  int v8;
  char v9;
  id v10;

  v10 = a2;
  objc_msgSend(v10, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", a1[4]);

  if (v8)
  {
    if (objc_msgSend(v10, "_isElement") && ((*(uint64_t (**)(void))(a1[5] + 16))() & 1) == 0)
      objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), a2);
    *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = 1;
  }
  if (!*(_QWORD *)(*(_QWORD *)(a1[8] + 8) + 40)
    && objc_msgSend(v10, "_isElement")
    && ((*(uint64_t (**)(void))(a1[5] + 16))() & 1) == 0)
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1[8] + 8) + 40), a2);
  }
  v9 = *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24);
  if (v9)
  {
    if (*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40))
      v9 = 1;
    else
      v9 = *(_QWORD *)(*(_QWORD *)(a1[8] + 8) + 40) != 0;
  }
  *a4 = v9;

}

- (BOOL)_canBeReordered
{
  objc_super v4;

  if (-[UITabGroup sidebarAppearance](self, "sidebarAppearance") == 2)
    return 0;
  v4.receiver = self;
  v4.super_class = (Class)UITabGroup;
  return -[UITab _canBeReordered](&v4, sel__canBeReordered);
}

- (BOOL)_canReorderChild:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  BOOL v8;

  v4 = a3;
  -[UITabGroup children](self, "children");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  v8 = v6
    && (-[UITabGroup sidebarAppearance](self, "sidebarAppearance") != 1
     || (-[UITab parent](self, "parent"), v7 = (void *)objc_claimAutoreleasedReturnValue(), v7, v7))
    && (objc_msgSend(v4, "_isAction") & 1) == 0
    && -[UITabGroup allowsReordering](self, "allowsReordering");

  return v8;
}

- (id)_filteredDisplayOrderIdentifiers
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[UITabGroup displayOrder](self, "displayOrder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v2, "count"));
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = v2;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "identifier", (_QWORD)v11);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return v3;
}

- (id)_orderedChildrenForDisplayOrder:(id)a3
{
  id v4;
  NSArray *displayOrderIdentifiers;
  NSArray *v6;
  NSArray *v7;
  NSArray *v8;
  int v9;
  NSArray *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id v22;
  NSArray *v23;
  id obj;
  _QWORD v25[5];
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
    -[UITabGroup displayOrderIdentifiers](self, "displayOrderIdentifiers");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (!self->_displayOrder)
    goto LABEL_12;
  displayOrderIdentifiers = self->_displayOrderIdentifiers;
  v6 = (NSArray *)v4;
  v7 = displayOrderIdentifiers;
  if (v6 == v7)
  {

    goto LABEL_10;
  }
  v8 = v7;
  if (!v6 || !v7)
  {

    goto LABEL_12;
  }
  v9 = -[NSArray isEqual:](v6, "isEqual:", v7);

  if (v9)
  {
LABEL_10:
    v23 = self->_displayOrder;
    goto LABEL_24;
  }
LABEL_12:
  -[UITabGroup children](self, "children");
  v10 = (NSArray *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    v11 = (void *)-[NSArray mutableCopy](v10, "mutableCopy");
    v22 = v4;
    v23 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSArray count](v10, "count"));
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    obj = v4;
    v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v27;
      v15 = MEMORY[0x1E0C809B0];
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v27 != v14)
            objc_enumerationMutation(obj);
          v17 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i);
          v25[0] = v15;
          v25[1] = 3221225472;
          v25[2] = __46__UITabGroup__orderedChildrenForDisplayOrder___block_invoke;
          v25[3] = &unk_1E16BFD48;
          v25[4] = v17;
          v18 = objc_msgSend(v11, "indexOfObjectPassingTest:", v25);
          if (v18 != 0x7FFFFFFFFFFFFFFFLL)
          {
            v19 = v18;
            objc_msgSend(v11, "objectAtIndex:", v18);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSArray addObject:](v23, "addObject:", v20);
            objc_msgSend(v11, "removeObjectAtIndex:", v19);

          }
        }
        v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      }
      while (v13);
    }

    -[NSArray addObjectsFromArray:](v23, "addObjectsFromArray:", v11);
    v4 = v22;
  }
  else
  {
    v23 = v10;
  }
LABEL_24:

  return v23;
}

uint64_t __46__UITabGroup__orderedChildrenForDisplayOrder___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (void)_selectElement:(id)a3 notifyOnReselection:(BOOL)a4 performBeforeNotifyingDelegate:(id)a5
{
  _BOOL4 v6;
  UITab *v10;
  void (**v11)(_QWORD);
  UITab *selectedChild;
  UITab *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  UITab *v18;

  v6 = a4;
  v10 = (UITab *)a3;
  v11 = (void (**)(_QWORD))a5;
  if (v10 && !-[UITab _isElement](v10, "_isElement"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UITabGroup.m"), 586, CFSTR("Cannot select a tab (%@) that is not seletable."), v10);

  }
  selectedChild = self->_selectedChild;
  objc_storeStrong((id *)&self->_selectedChild, a3);
  if (v11)
    v11[2](v11);
  if (selectedChild != v10 || !v6)
  {
    v18 = v10;
  }
  else
  {
    if (v10)
    {
      v14 = v10;
      while (1)
      {
        v18 = v14;
        -[UITab _setDisplayedViewControllers:](v14, "_setDisplayedViewControllers:", 0);
        if (!-[UITab _isGroup](v18, "_isGroup"))
          break;
        -[UITab selectedChild](v18, "selectedChild");
        v15 = objc_claimAutoreleasedReturnValue();

        v14 = (UITab *)v15;
        if (!v15)
          goto LABEL_16;
      }
    }
    else
    {
LABEL_16:
      v18 = 0;
    }
    -[UITabGroup managingTabGroup](self, "managingTabGroup");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "_updateManagingNavigationStackUsingTransition:", 1);

  }
  if (selectedChild != v10)
    -[UITabGroup _selectedElementDidChange](self, "_selectedElementDidChange");

}

- (BOOL)_setDisplayOrderIdentifiers:(id)a3
{
  id v5;
  NSArray *v6;
  NSArray *v7;
  NSArray *v8;
  BOOL v9;
  char v10;
  void *v11;

  v5 = a3;
  v6 = self->_displayOrderIdentifiers;
  v7 = (NSArray *)v5;
  v8 = v7;
  v9 = v6 != v7;
  if (v6 == v7)
  {

    v11 = v8;
LABEL_9:

    goto LABEL_10;
  }
  if (!v7 || !v6)
  {

    goto LABEL_8;
  }
  v10 = -[NSArray isEqual:](v6, "isEqual:", v7);

  if ((v10 & 1) == 0)
  {
LABEL_8:
    objc_storeStrong((id *)&self->_displayOrderIdentifiers, a3);
    -[UITabGroup _invalidateDisplayOrder](self, "_invalidateDisplayOrder");
    -[UITab _tabModel](self, "_tabModel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "displayOrderIdentifiersDidChangeForGroup:", self);
    goto LABEL_9;
  }
  v9 = 0;
LABEL_10:

  return v9;
}

- (void)_updateDescriptionWithBuilder:(id)a3 recursive:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;
  objc_super v8;

  v4 = a4;
  v6 = a3;
  v8.receiver = self;
  v8.super_class = (Class)UITabGroup;
  -[UITab _updateDescriptionWithBuilder:recursive:](&v8, sel__updateDescriptionWithBuilder_recursive_, v6, v4);
  if (!v4 && -[NSArray count](self->_children, "count"))
    v7 = (id)objc_msgSend(v6, "appendName:object:usingLightweightDescription:", CFSTR("children"), self->_children, 1);

}

- (UITab)selectedChild
{
  return self->_selectedChild;
}

- (NSString)defaultChildIdentifier
{
  return self->_defaultChildIdentifier;
}

- (void)setDefaultChildIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (NSArray)children
{
  return self->_children;
}

- (NSArray)displayOrderIdentifiers
{
  return self->_displayOrderIdentifiers;
}

- (BOOL)allowsReordering
{
  return self->_allowsReordering;
}

- (UINavigationController)managingNavigationController
{
  return self->_managingNavigationController;
}

- (NSArray)sidebarActions
{
  return self->_sidebarActions;
}

- (void)setSidebarActions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 200);
}

- (unint64_t)sidebarAppearance
{
  return self->_sidebarAppearance;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sidebarActions, 0);
  objc_storeStrong((id *)&self->_managingNavigationController, 0);
  objc_storeStrong((id *)&self->_displayOrderIdentifiers, 0);
  objc_storeStrong((id *)&self->_children, 0);
  objc_storeStrong((id *)&self->_defaultChildIdentifier, 0);
  objc_storeStrong((id *)&self->_selectedChild, 0);
  objc_storeStrong((id *)&self->_displayOrder, 0);
  objc_storeStrong((id *)&self->_sizeClassTraitRegistration, 0);
}

@end
