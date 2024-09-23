@implementation _UITabElementGroup

- (_UITabElementGroup)initWithIdentifier:(id)a3 title:(id)a4 image:(id)a5
{
  return -[_UITabElementGroup initWithIdentifier:title:image:children:](self, "initWithIdentifier:title:image:children:", a3, a4, a5, MEMORY[0x1E0C9AA60]);
}

- (_UITabElementGroup)initWithIdentifier:(id)a3 title:(id)a4 image:(id)a5 children:(id)a6
{
  id v10;
  _UITabElementGroup *v11;
  _UITabElementGroup *v12;
  NSArray *children;
  objc_super v15;

  v10 = a6;
  v15.receiver = self;
  v15.super_class = (Class)_UITabElementGroup;
  v11 = -[_UITabElement initWithIdentifier:title:image:](&v15, sel_initWithIdentifier_title_image_, a3, a4, a5);
  v12 = v11;
  if (v11)
  {
    children = v11->_children;
    v11->_children = (NSArray *)MEMORY[0x1E0C9AA60];

    -[_UITabElementGroup _setChildren:](v12, "_setChildren:", v10);
  }

  return v12;
}

- (void)_setDelegate:(id)a3
{
  _UITabElementGroupDelegate **p_delegate;
  id v5;
  char v6;

  p_delegate = &self->_delegate;
  v5 = a3;
  objc_storeWeak((id *)p_delegate, v5);
  *(_BYTE *)&self->_delegateImplements = *(_BYTE *)&self->_delegateImplements & 0xFE | objc_opt_respondsToSelector() & 1;
  LOBYTE(p_delegate) = objc_opt_respondsToSelector();

  if ((p_delegate & 1) != 0)
    v6 = 2;
  else
    v6 = 0;
  *(_BYTE *)&self->_delegateImplements = *(_BYTE *)&self->_delegateImplements & 0xFD | v6;
}

- (void)_setSelectedElement:(id)a3
{
  -[_UITabElementGroup _selectElement:notifyingDelegate:notifyOnReselection:](self, "_selectElement:notifyingDelegate:notifyOnReselection:", a3, 0, 0);
}

- (void)_setChildren:(id)a3
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
  uint64_t m;
  void *v32;
  void *v33;
  _UITabElement *v34;
  void *v35;
  _UITabElementGroup *v36;
  id v37;
  uint64_t v38;
  void *v39;
  SEL v40;
  void *v41;
  _QWORD v42[4];
  id v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _BYTE v60[128];
  _BYTE v61[128];
  _BYTE v62[128];
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UITabGroup.m"), 678, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("children"));

  }
  objc_msgSend(v5, "differenceFromArray:withOptions:usingEquivalenceTest:", self->_children, 0, &__block_literal_global_179);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "hasChanges"))
  {
    v40 = a2;
    v7 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v56 = 0u;
    v57 = 0u;
    v58 = 0u;
    v59 = 0u;
    v41 = v6;
    objc_msgSend(v6, "removals");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v56, v63, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v57;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v57 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v56 + 1) + 8 * i), "object");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v13);

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v56, v63, 16);
      }
      while (v10);
    }

    v54 = 0u;
    v55 = 0u;
    v52 = 0u;
    v53 = 0u;
    objc_msgSend(v41, "insertions");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v52, v62, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v53;
      do
      {
        for (j = 0; j != v16; ++j)
        {
          if (*(_QWORD *)v53 != v17)
            objc_enumerationMutation(v14);
          objc_msgSend(*(id *)(*((_QWORD *)&v52 + 1) + 8 * j), "object");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "removeObject:", v19);

        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v52, v62, 16);
      }
      while (v16);
    }

    v50 = 0u;
    v51 = 0u;
    v48 = 0u;
    v49 = 0u;
    v20 = v7;
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v48, v61, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v49;
      do
      {
        for (k = 0; k != v22; ++k)
        {
          if (*(_QWORD *)v49 != v23)
            objc_enumerationMutation(v20);
          objc_msgSend(*(id *)(*((_QWORD *)&v48 + 1) + 8 * k), "set_parent:", 0);
        }
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v48, v61, 16);
      }
      while (v22);
    }

    v25 = (NSArray *)objc_msgSend(v5, "copy");
    children = self->_children;
    self->_children = v25;

    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    v27 = v5;
    v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v44, v60, 16);
    if (v28)
    {
      v29 = v28;
      v30 = *(_QWORD *)v45;
      do
      {
        for (m = 0; m != v29; ++m)
        {
          if (*(_QWORD *)v45 != v30)
            objc_enumerationMutation(v27);
          v32 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * m);
          if ((objc_msgSend(v32, "_isUniquelySPI") & 1) == 0)
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", v40, self, CFSTR("UITabGroup.m"), 699, CFSTR("Cannot add UITab objects to a UITabElementGroup. Please use UITab + UITabGroup directly."));

          }
          objc_msgSend(v32, "set_parent:", self);
        }
        v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v44, v60, 16);
      }
      while (v29);
    }

    -[_UITabElementGroup _notifyObserversElementsChanged](self, "_notifyObserversElementsChanged");
    v34 = self->_selectedElement;
    v35 = v34;
    v6 = v41;
    if (v34)
    {
      -[_UITab _parent](v34, "_parent");
      v36 = (_UITabElementGroup *)objc_claimAutoreleasedReturnValue();

      if (v36 != self)
      {
        v42[0] = MEMORY[0x1E0C809B0];
        v42[1] = 3221225472;
        v42[2] = __35___UITabElementGroup__setChildren___block_invoke_2;
        v42[3] = &unk_1E16C3908;
        v37 = v35;
        v43 = v37;
        v38 = objc_msgSend(v27, "indexOfObjectPassingTest:", v42);
        if (v38 == 0x7FFFFFFFFFFFFFFFLL)
          -[_UITabElementGroup _defaultChildElement](self, "_defaultChildElement");
        else
          objc_msgSend(v27, "objectAtIndex:", v38);
        v35 = (void *)objc_claimAutoreleasedReturnValue();

        -[_UITabElementGroup _selectElement:notifyingDelegate:notifyOnReselection:](self, "_selectElement:notifyingDelegate:notifyOnReselection:", v35, 1, 1);
      }
    }

  }
}

- (void)_setSidebarAppearance:(unint64_t)a3
{
  if (self->__sidebarAppearance != a3)
  {
    self->__sidebarAppearance = a3;
    -[_UITabElementGroup _notifyObserversElementsChanged](self, "_notifyObserversElementsChanged");
  }
}

- (void)_setDisplayOrder:(id)a3
{
  -[_UITabElementGroup _setDisplayOrder:notifyingDelegate:](self, "_setDisplayOrder:notifyingDelegate:", a3, 0);
}

- (void)_setDisplayOrder:(id)a3 notifyingDelegate:(BOOL)a4
{
  _BOOL4 v4;
  id v7;
  NSArray *displayOrder;
  NSArray *v9;
  char v10;
  id WeakRetained;
  void *v12;
  NSArray *v13;

  v4 = a4;
  v7 = a3;
  displayOrder = self->__displayOrder;
  v13 = (NSArray *)v7;
  v9 = displayOrder;
  if (v9 == v13)
  {

    WeakRetained = v13;
LABEL_11:

    goto LABEL_12;
  }
  if (v13 && v9)
  {
    v10 = -[NSArray isEqual:](v13, "isEqual:", v9);

    if ((v10 & 1) != 0)
      goto LABEL_12;
  }
  else
  {

  }
  objc_storeStrong((id *)&self->__displayOrder, a3);
  -[_UITabElementGroup _notifyObserversElementsChanged](self, "_notifyObserversElementsChanged");
  -[UITab _tabModel](self, "_tabModel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "displayOrderIdentifiersDidChangeForGroup:", self);

  if (v4 && (*(_BYTE *)&self->_delegateImplements & 2) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "_tabElementGroup:didCustomizeDisplayOrder:", self, v13);
    goto LABEL_11;
  }
LABEL_12:

}

- (void)_setAllowsReordering:(BOOL)a3
{
  if (self->__allowsReordering != a3)
  {
    self->__allowsReordering = a3;
    -[UITab _customizabilityDidChange](self, "_customizabilityDidChange");
  }
}

- (id)_orderedChildrenForDisplayOrder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v17;
  id obj;
  _QWORD v19[5];
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
    -[_UITabElementGroup _displayOrder](self, "_displayOrder");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  -[_UITabElementGroup _children](self, "_children");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    v6 = (void *)objc_msgSend(v5, "mutableCopy");
    v17 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v5, "count"));
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    obj = v4;
    v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v21;
      v10 = MEMORY[0x1E0C809B0];
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v21 != v9)
            objc_enumerationMutation(obj);
          v12 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
          v19[0] = v10;
          v19[1] = 3221225472;
          v19[2] = __54___UITabElementGroup__orderedChildrenForDisplayOrder___block_invoke;
          v19[3] = &unk_1E16C3908;
          v19[4] = v12;
          v13 = objc_msgSend(v6, "indexOfObjectPassingTest:", v19);
          if (v13 != 0x7FFFFFFFFFFFFFFFLL)
          {
            v14 = v13;
            objc_msgSend(v6, "objectAtIndex:", v13);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "addObject:", v15);
            objc_msgSend(v6, "removeObjectAtIndex:", v14);

          }
        }
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v8);
    }

    objc_msgSend(v17, "addObjectsFromArray:", v6);
  }
  else
  {
    v17 = v5;
  }

  return v17;
}

- (id)_defaultChildElement
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  _QWORD *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  _QWORD v26[3];
  char v27;

  -[_UITabElementGroup _defaultChildIdentifier](self, "_defaultChildIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x2020000000;
  v27 = 0;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__66;
  v24 = __Block_byref_object_dispose__66;
  v25 = 0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__66;
  v18 = __Block_byref_object_dispose__66;
  v19 = 0;
  -[_UITabElementGroup _children](self, "_children");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __42___UITabElementGroup__defaultChildElement__block_invoke;
  v9[3] = &unk_1E16C3930;
  v5 = v3;
  v10 = v5;
  v11 = &v20;
  v12 = v26;
  v13 = &v14;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v9);

  v6 = (void *)v21[5];
  if (!v6)
    v6 = (void *)v15[5];
  v7 = v6;

  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v20, 8);

  _Block_object_dispose(v26, 8);
  return v7;
}

- (void)_selectElement:(id)a3 notifyingDelegate:(BOOL)a4 notifyOnReselection:(BOOL)a5
{
  -[_UITabElementGroup _selectElement:notifyingDelegate:notifyOnReselection:performBeforeNotifyingDelegate:](self, "_selectElement:notifyingDelegate:notifyOnReselection:performBeforeNotifyingDelegate:", a3, a4, a5, 0);
}

- (void)_selectElement:(id)a3 notifyOnReselection:(BOOL)a4 performBeforeNotifyingDelegate:(id)a5
{
  -[_UITabElementGroup _selectElement:notifyingDelegate:notifyOnReselection:performBeforeNotifyingDelegate:](self, "_selectElement:notifyingDelegate:notifyOnReselection:performBeforeNotifyingDelegate:", a3, 1, a4, a5);
}

- (void)_selectElement:(id)a3 notifyingDelegate:(BOOL)a4 notifyOnReselection:(BOOL)a5 performBeforeNotifyingDelegate:(id)a6
{
  _BOOL4 v7;
  _BOOL4 v8;
  id v12;
  void (**v13)(_QWORD);
  _UITabElement *selectedElement;
  id WeakRetained;
  void *v17;
  void *v18;
  _UITabElement *v19;

  v7 = a5;
  v8 = a4;
  v12 = a3;
  v13 = (void (**)(_QWORD))a6;
  if (v12 && (objc_msgSend(v12, "_isElement") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UITabGroup.m"), 824, CFSTR("Cannot select a tab (%@) that is not selectable in %@."), v12, self);

  }
  v19 = (_UITabElement *)v12;
  selectedElement = self->_selectedElement;
  objc_storeStrong((id *)&self->_selectedElement, a3);
  if (v13)
    v13[2](v13);
  if (selectedElement != v19 || v7)
  {
    if (v8 && (*(_BYTE *)&self->_delegateImplements & 1) != 0)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(WeakRetained, "_tabElementGroup:didSelectElement:", self, v19);

    }
    -[UITab _tabModel](self, "_tabModel");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "selectedElementDidChangeForGroup:", self);

  }
}

- (id)_tabForIdentifier:(id)a3
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
  -[_UITabElementGroup _children](self, "_children", 0);
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
      objc_msgSend(v10, "_identifier");
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
  v8.super_class = (Class)_UITabElementGroup;
  v12 = -[UITab _isCustomizable](&v8, sel__isCustomizable);
  if (*((_BYTE *)v10 + 24)
    || (v3 = -[_UITabElementGroup allowsReordering](self, "allowsReordering"), (*((_BYTE *)v10 + 24) = v3) != 0))
  {
    v4 = 1;
  }
  else
  {
    -[_UITabElementGroup children](self, "children");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __37___UITabElementGroup__isCustomizable__block_invoke;
    v7[3] = &unk_1E16C3870;
    v7[4] = &v9;
    objc_msgSend(v6, "enumerateObjectsUsingBlock:", v7);

    v4 = *((_BYTE *)v10 + 24) != 0;
  }
  _Block_object_dispose(&v9, 8);
  return v4;
}

- (void)_didChangeTabModel:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  objc_super v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)_UITabElementGroup;
  -[UITab _didChangeTabModel:](&v17, sel__didChangeTabModel_, v4);
  if (v4)
  {
    objc_msgSend(v4, "customizationStore");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITab identifier](self, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "displayOrderIdentifiersForGroupWithIdentifier:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
      -[_UITabElementGroup _setDisplayOrderIdentifiers:](self, "_setDisplayOrderIdentifiers:", v7);

  }
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v8 = self->_children;
  v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
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
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v12++), "_didChangeTabModel:", v4, (_QWORD)v13);
      }
      while (v10 != v12);
      v10 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
    }
    while (v10);
  }

}

- (NSArray)sidebarActions
{
  return (NSArray *)MEMORY[0x1E0C9AA60];
}

- (BOOL)_canBeReordered
{
  objc_super v4;

  if (-[_UITabElementGroup _sidebarAppearance](self, "_sidebarAppearance") == 2)
    return 0;
  v4.receiver = self;
  v4.super_class = (Class)_UITabElementGroup;
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
  -[_UITabElementGroup _children](self, "_children");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  v8 = v6
    && (-[_UITabElementGroup _sidebarAppearance](self, "_sidebarAppearance") != 1
     || (-[_UITab _parent](self, "_parent"), v7 = (void *)objc_claimAutoreleasedReturnValue(), v7, v7))
    && (objc_msgSend(v4, "_isAction") & 1) == 0
    && -[_UITabElementGroup _allowsReordering](self, "_allowsReordering");

  return v8;
}

- (id)_filteredDisplayOrderIdentifiers
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, void *);
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t (*v19)(uint64_t, void *);
  uint64_t v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v29;
  id obj;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _QWORD v35[5];
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  -[_UITabElementGroup _children](self, "_children");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[_UITabElementGroup _displayOrder](self, "_displayOrder");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7)
  {
    v29 = v5;
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    -[_UITabElementGroup _displayOrder](self, "_displayOrder");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v37;
      v11 = MEMORY[0x1E0C809B0];
      v12 = __54___UITabElementGroup__filteredDisplayOrderIdentifiers__block_invoke;
      v13 = &unk_1E16C3908;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v37 != v10)
            objc_enumerationMutation(obj);
          v15 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * v14);
          v35[0] = v11;
          v35[1] = 3221225472;
          v35[2] = v12;
          v35[3] = v13;
          v35[4] = v15;
          v16 = objc_msgSend(v4, "indexOfObjectPassingTest:", v35);
          if (v16 != 0x7FFFFFFFFFFFFFFFLL)
          {
            v17 = v16;
            objc_msgSend(v4, "objectAtIndex:", v16);
            v18 = v13;
            v19 = v12;
            v20 = v11;
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "addObject:", v15);
            objc_msgSend(v4, "removeObjectAtIndex:", v17);

            v11 = v20;
            v12 = v19;
            v13 = v18;
          }
          ++v14;
        }
        while (v9 != v14);
        v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
      }
      while (v9);
    }

    v5 = v29;
  }
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v22 = v4;
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v31, v40, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v32;
    do
    {
      v26 = 0;
      do
      {
        if (*(_QWORD *)v32 != v25)
          objc_enumerationMutation(v22);
        objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * v26), "_identifier");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v27);

        ++v26;
      }
      while (v24 != v26);
      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v31, v40, 16);
    }
    while (v24);
  }

  return v5;
}

- (BOOL)_setDisplayOrderIdentifiers:(id)a3
{
  -[_UITabElementGroup _setDisplayOrder:notifyingDelegate:](self, "_setDisplayOrder:notifyingDelegate:", a3, 1);
  return 0;
}

- (void)_notifyObserversElementsChanged
{
  id v3;

  -[UITab _tabModel](self, "_tabModel");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "elementsDidChangeForGroup:", self);

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
  v8.super_class = (Class)_UITabElementGroup;
  -[UITab _updateDescriptionWithBuilder:recursive:](&v8, sel__updateDescriptionWithBuilder_recursive_, v6, v4);
  if (!v4 && -[NSArray count](self->_children, "count"))
    v7 = (id)objc_msgSend(v6, "appendName:object:usingLightweightDescription:", CFSTR("children"), self->_children, 1);

}

- (_UITabElementGroupDelegate)_delegate
{
  return (_UITabElementGroupDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (_UITabElement)_selectedElement
{
  return self->_selectedElement;
}

- (NSArray)_children
{
  return self->_children;
}

- (NSString)_defaultChildIdentifier
{
  return self->__defaultChildIdentifier;
}

- (void)_setDefaultChildIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->__defaultChildIdentifier, a3);
}

- (NSArray)_displayOrder
{
  return self->__displayOrder;
}

- (unint64_t)_sidebarAppearance
{
  return self->__sidebarAppearance;
}

- (BOOL)_allowsReordering
{
  return self->__allowsReordering;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__displayOrder, 0);
  objc_storeStrong((id *)&self->__defaultChildIdentifier, 0);
  objc_storeStrong((id *)&self->_children, 0);
  objc_storeStrong((id *)&self->_selectedElement, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
