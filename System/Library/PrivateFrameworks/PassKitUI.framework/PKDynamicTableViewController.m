@implementation PKDynamicTableViewController

- (PKDynamicTableViewController)init
{
  return -[PKDynamicTableViewController initWithStyle:](self, "initWithStyle:", objc_msgSend(MEMORY[0x1E0DC3D48], "pkui_groupedStyleDefaultRoundedCornerBehavior"));
}

- (PKDynamicTableViewController)initWithStyle:(int64_t)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKDynamicTableViewController;
  return -[PKDynamicTableViewController initWithStyle:](&v4, sel_initWithStyle_, a3);
}

- (void)viewDidLoad
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKDynamicTableViewController;
  -[PKDynamicTableViewController viewDidLoad](&v4, sel_viewDidLoad);
  -[PKDynamicTableViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pkui_setupForReadableContentGuide");

}

- (void)setSectionControllers:(id)a3
{
  -[PKDynamicTableViewController setSectionControllers:sectionIdentifiers:](self, "setSectionControllers:sectionIdentifiers:", a3, 0);
}

- (void)setSectionControllers:(id)a3 sectionIdentifiers:(id)a4
{
  id v6;
  id v7;

  objc_storeStrong((id *)&self->_sectionControllers, a3);
  v6 = a4;
  -[PKDynamicTableViewController _computeSectionControllerMap:](self, "_computeSectionControllerMap:", v6);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[PKDynamicTableViewController _sortMappedSectionIdentifiers:](self, "_sortMappedSectionIdentifiers:", v7);
  -[PKDynamicTableViewController _reloadData:](self, "_reloadData:", 0);

}

- (void)_reloadData:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;

  v3 = a3;
  if (-[PKDynamicTableViewController isViewLoaded](self, "isViewLoaded"))
  {
    -[PKDynamicTableViewController tableView](self, "tableView");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setEditing:animated:", 0, v3);
    -[PKDynamicTableViewController tableView](self, "tableView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "reloadData");

  }
}

- (void)reloadSectionIdentifier:(id)a3
{
  int64_t v4;
  int64_t v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  if (-[PKDynamicTableViewController isViewLoaded](self, "isViewLoaded"))
  {
    v4 = -[PKDynamicTableViewController indexOfSectionIdentifier:](self, "indexOfSectionIdentifier:", v8);
    if (v4 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v5 = v4;
      -[PKDynamicTableViewController tableView](self, "tableView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "reloadSections:withRowAnimation:", v7, -[PKDynamicTableViewController rowAnimationForReloadingSection:](self, "rowAnimationForReloadingSection:", v5));

    }
  }

}

- (void)reloadSectionIdentifiers:(id)a3
{
  void *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  PKDynamicTableViewController *v9;
  id v10;

  v6 = a3;
  if (-[PKDynamicTableViewController isViewLoaded](self, "isViewLoaded") && objc_msgSend(v6, "count"))
  {
    -[PKDynamicTableViewController tableView](self, "tableView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __57__PKDynamicTableViewController_reloadSectionIdentifiers___block_invoke;
    v7[3] = &unk_1E3E61400;
    v8 = v6;
    v9 = self;
    v10 = v4;
    v5 = v4;
    objc_msgSend(v5, "performBatchUpdates:completion:", v7, 0);

  }
}

void __57__PKDynamicTableViewController_reloadSectionIdentifiers___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
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
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v12;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v12 != v5)
          objc_enumerationMutation(v2);
        v7 = objc_msgSend(*(id *)(a1 + 40), "indexOfSectionIdentifier:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v6), (_QWORD)v11);
        if (v7 != 0x7FFFFFFFFFFFFFFFLL)
        {
          v8 = v7;
          v9 = *(void **)(a1 + 48);
          objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", v7);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "reloadSections:withRowAnimation:", v10, objc_msgSend(*(id *)(a1 + 40), "rowAnimationForReloadingSection:", v8));

        }
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v4);
  }

}

- (void)reloadRow:(int64_t)a3 inSectionWithSectionIdentifier:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = a4;
  objc_msgSend(v6, "numberWithInteger:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKDynamicTableViewController reloadRows:inSectionWithSectionIdentifier:](self, "reloadRows:inSectionWithSectionIdentifier:", v9, v7);

}

- (id)cellForRowAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[PKDynamicTableViewController tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cellForRowAtIndexPath:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)reloadRows:(id)a3 inSectionWithSectionIdentifier:(id)a4
{
  id v6;
  id v7;
  int64_t v8;
  int64_t v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (-[PKDynamicTableViewController isViewLoaded](self, "isViewLoaded"))
  {
    v8 = -[PKDynamicTableViewController indexOfSectionIdentifier:](self, "indexOfSectionIdentifier:", v7);
    if (v8 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v9 = v8;
      v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v19 = 0u;
      v20 = 0u;
      v21 = 0u;
      v22 = 0u;
      v18 = v6;
      v11 = v6;
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v20;
        do
        {
          v15 = 0;
          do
          {
            if (*(_QWORD *)v20 != v14)
              objc_enumerationMutation(v11);
            objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v15), "integerValue"), v9);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "addObject:", v16);

            ++v15;
          }
          while (v13 != v15);
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        }
        while (v13);
      }

      -[PKDynamicTableViewController tableView](self, "tableView");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "reloadRowsAtIndexPaths:withRowAnimation:", v10, -[PKDynamicTableViewController rowAnimationForReloadingSection:](self, "rowAnimationForReloadingSection:", v9));

      v6 = v18;
    }
  }

}

- (id)_computeSectionControllerMap:(id)a3
{
  NSMutableDictionary *v4;
  NSMutableDictionary *sectionControllerMap;
  id v6;
  uint64_t i;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  id v19;
  NSArray *obj;
  uint64_t v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v19 = a3;
  v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  sectionControllerMap = self->_sectionControllerMap;
  self->_sectionControllerMap = v4;

  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  obj = self->_sectionControllers;
  v22 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v22)
  {
    v21 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v22; ++i)
      {
        if (*(_QWORD *)v28 != v21)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        v23 = 0u;
        v24 = 0u;
        v25 = 0u;
        v26 = 0u;
        objc_msgSend(v8, "sectionIdentifiers", v19);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v24;
          do
          {
            for (j = 0; j != v11; ++j)
            {
              if (*(_QWORD *)v24 != v12)
                objc_enumerationMutation(v9);
              v14 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * j);
              -[NSMutableDictionary setObject:forKey:](self->_sectionControllerMap, "setObject:forKey:", v8, v14);
              objc_msgSend(v6, "addObject:", v14);
            }
            v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
          }
          while (v11);
        }

      }
      v22 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    }
    while (v22);
  }

  v15 = v19;
  v16 = v19;
  if (!v19)
    v16 = (void *)objc_msgSend(v6, "copy");
  objc_storeStrong((id *)&self->_orderOfSectionIdentifiers, v16);
  if (!v19)

  v17 = (void *)objc_msgSend(v6, "copy", v19);
  return v17;
}

- (void)_sortMappedSectionIdentifiers:(id)a3
{
  id v4;
  NSMutableArray *v5;
  NSMutableArray *sectionItems;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v4, "count"));
  sectionItems = self->_sectionItems;
  self->_sectionItems = v5;

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v7 = self->_orderOfSectionIdentifiers;
  v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v4, "containsObject:", v12, (_QWORD)v13))
          -[NSMutableArray addObject:](self->_sectionItems, "addObject:", v12);
      }
      v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

}

- (void)recomputeMappedSectionsAndReloadSections:(id)a3 sectionIdentifiers:(id)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;
  id v13;

  v9 = a3;
  v6 = a4;
  if (-[PKDynamicTableViewController isViewLoaded](self, "isViewLoaded") && self->_sectionItems)
  {
    -[PKDynamicTableViewController tableView](self, "tableView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __92__PKDynamicTableViewController_recomputeMappedSectionsAndReloadSections_sectionIdentifiers___block_invoke;
    v10[3] = &unk_1E3E62460;
    v10[4] = self;
    v11 = v6;
    v12 = v9;
    v13 = v7;
    v8 = v7;
    objc_msgSend(v8, "performBatchUpdates:completion:", v10, 0);

  }
}

void __92__PKDynamicTableViewController_recomputeMappedSectionsAndReloadSections_sectionIdentifiers___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t k;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
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
  __int128 v45;
  _BYTE v46[128];
  _BYTE v47[128];
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1024), "copy");
  v3 = *(void **)(a1 + 32);
  objc_msgSend(v3, "_computeSectionControllerMap:", *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_sortMappedSectionIdentifiers:", v4);

  v5 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1024), "copy");
  v33 = (void *)objc_msgSend(*(id *)(a1 + 48), "mutableCopy");
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v6 = v2;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v43;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v43 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * i);
        if ((objc_msgSend(v5, "containsObject:", v11) & 1) == 0)
        {
          v12 = objc_msgSend(v6, "indexOfObject:", v11);
          v13 = *(void **)(a1 + 56);
          objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", v12);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "deleteSections:withRowAnimation:", v14, objc_msgSend(*(id *)(a1 + 32), "rowAnimationForDeletingSection:", v12));

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
    }
    while (v8);
  }

  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v15 = v5;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v39;
    do
    {
      for (j = 0; j != v17; ++j)
      {
        if (*(_QWORD *)v39 != v18)
          objc_enumerationMutation(v15);
        v20 = *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * j);
        if ((objc_msgSend(v6, "containsObject:", v20) & 1) == 0)
        {
          v21 = objc_msgSend(v15, "indexOfObject:", v20);
          v22 = *(void **)(a1 + 56);
          objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", v21);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "insertSections:withRowAnimation:", v23, objc_msgSend(*(id *)(a1 + 32), "rowAnimationForDeletingSection:", v21));

          objc_msgSend(v33, "removeObject:", v20);
        }
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
    }
    while (v17);
  }

  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v24 = v33;
  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v34, v46, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v35;
    do
    {
      for (k = 0; k != v26; ++k)
      {
        if (*(_QWORD *)v35 != v27)
          objc_enumerationMutation(v24);
        v29 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * k);
        if (objc_msgSend(v6, "containsObject:", v29)
          && objc_msgSend(v15, "containsObject:", v29))
        {
          v30 = objc_msgSend(v6, "indexOfObject:", v29);
          v31 = *(void **)(a1 + 56);
          objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", v30);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "reloadSections:withRowAnimation:", v32, objc_msgSend(*(id *)(a1 + 32), "rowAnimationForInsertingSection:", v30));

        }
      }
      v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v34, v46, 16);
    }
    while (v26);
  }

}

- (BOOL)hasSectionForSectionIdentifier:(id)a3
{
  void *v3;
  BOOL v4;

  -[NSMutableDictionary objectForKey:](self->_sectionControllerMap, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (int64_t)indexOfSectionIdentifier:(id)a3
{
  uint64_t v4;
  int64_t v5;
  int64_t v6;
  void *v7;
  BOOL v8;

  v4 = -[NSMutableArray indexOfObject:](self->_sectionItems, "indexOfObject:", a3);
  v5 = 0x7FFFFFFFFFFFFFFFLL;
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v6 = v4;
    -[PKDynamicTableViewController tableView](self, "tableView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v6 < objc_msgSend(v7, "numberOfSections");

    if (v8)
      return v6;
  }
  return v5;
}

- (int64_t)numberOfSections
{
  return -[NSMutableArray count](self->_sectionItems, "count");
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return -[NSMutableArray count](self->_sectionItems, "count", a3);
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  NSMutableArray *sectionItems;
  id v7;
  void *v8;
  void *v9;
  int64_t v10;

  sectionItems = self->_sectionItems;
  v7 = a3;
  -[NSMutableArray objectAtIndexedSubscript:](sectionItems, "objectAtIndexedSubscript:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKDynamicTableViewController _sectionControllerForSectionIdentifier:](self, "_sectionControllerForSectionIdentifier:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "tableView:numberOfRowsInSectionIdentifier:", v7, v8);

  return v10;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  NSMutableArray *sectionItems;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;

  sectionItems = self->_sectionItems;
  v7 = a4;
  v8 = a3;
  -[NSMutableArray objectAtIndexedSubscript:](sectionItems, "objectAtIndexedSubscript:", objc_msgSend(v7, "section"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKDynamicTableViewController _sectionControllerForSectionIdentifier:](self, "_sectionControllerForSectionIdentifier:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "tableView:cellForRowAtIndexPath:sectionIdentifier:", v8, v7, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  void *v5;
  void *v6;
  void *v7;

  -[NSMutableArray objectAtIndexedSubscript:](self->_sectionItems, "objectAtIndexedSubscript:", a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKDynamicTableViewController _sectionControllerForSectionIdentifier:](self, "_sectionControllerForSectionIdentifier:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v6, "titleForHeaderInSectionIdentifier:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  void *v5;
  void *v6;
  void *v7;

  -[NSMutableArray objectAtIndexedSubscript:](self->_sectionItems, "objectAtIndexedSubscript:", a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKDynamicTableViewController _sectionControllerForSectionIdentifier:](self, "_sectionControllerForSectionIdentifier:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v6, "titleForFooterInSectionIdentifier:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;

  v6 = a3;
  -[NSMutableArray objectAtIndexedSubscript:](self->_sectionItems, "objectAtIndexedSubscript:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKDynamicTableViewController _sectionControllerForSectionIdentifier:](self, "_sectionControllerForSectionIdentifier:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v8, "tableView:viewForHeaderInSectionIdentifier:", v6, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      -[PKDynamicTableViewController tableView:titleForHeaderInSection:](self, "tableView:titleForHeaderInSection:", v6, a4);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "length");

      if (v11)
      {
        v9 = 0;
      }
      else
      {
        objc_msgSend(v6, "dequeueReusableHeaderFooterViewWithIdentifier:", CFSTR("default"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v9)
          v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D78]), "initWithReuseIdentifier:", CFSTR("default"));
      }
    }
    objc_msgSend(v9, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67C48]);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;

  v6 = a3;
  -[NSMutableArray objectAtIndexedSubscript:](self->_sectionItems, "objectAtIndexedSubscript:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKDynamicTableViewController _sectionControllerForSectionIdentifier:](self, "_sectionControllerForSectionIdentifier:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v8, "tableView:viewForFooterInSectionIdentifier:", v6, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      -[PKDynamicTableViewController tableView:titleForFooterInSection:](self, "tableView:titleForFooterInSection:", v6, a4);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "length");

      if (v11)
      {
        v9 = 0;
      }
      else
      {
        objc_msgSend(v6, "dequeueReusableHeaderFooterViewWithIdentifier:", CFSTR("default"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v9)
          v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D78]), "initWithReuseIdentifier:", CFSTR("default"));
      }
    }
    objc_msgSend(v9, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67C18]);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  double v10;
  double v11;

  v6 = a3;
  v7 = a4;
  -[NSMutableArray objectAtIndexedSubscript:](self->_sectionItems, "objectAtIndexedSubscript:", objc_msgSend(v7, "section"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKDynamicTableViewController _sectionControllerForSectionIdentifier:](self, "_sectionControllerForSectionIdentifier:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v9, "tableView:heightForRowAtIndexPath:sectionIdentifier:", v6, v7, v8);
    v11 = v10;
  }
  else
  {
    v11 = *MEMORY[0x1E0DC53D8];
  }

  return v11;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  double v9;
  double v10;

  v6 = a3;
  -[NSMutableArray objectAtIndexedSubscript:](self->_sectionItems, "objectAtIndexedSubscript:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKDynamicTableViewController _sectionControllerForSectionIdentifier:](self, "_sectionControllerForSectionIdentifier:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v8, "tableView:heightForHeaderInSectionIdentifier:", v6, v7);
    v10 = v9;
  }
  else
  {
    v10 = *MEMORY[0x1E0DC53D8];
  }

  return v10;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  double v9;
  double v10;

  v6 = a3;
  -[NSMutableArray objectAtIndexedSubscript:](self->_sectionItems, "objectAtIndexedSubscript:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKDynamicTableViewController _sectionControllerForSectionIdentifier:](self, "_sectionControllerForSectionIdentifier:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v8, "tableView:heightForFooterInSectionIdentifier:", v6, v7);
    v10 = v9;
  }
  else
  {
    v10 = *MEMORY[0x1E0DC53D8];
  }

  return v10;
}

- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  double v8;
  double v9;

  v5 = a4;
  -[NSMutableArray objectAtIndexedSubscript:](self->_sectionItems, "objectAtIndexedSubscript:", objc_msgSend(v5, "section"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKDynamicTableViewController _sectionControllerForSectionIdentifier:](self, "_sectionControllerForSectionIdentifier:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v7, "estimatedHeightForRowAtIndexPath:sectionIdentifier:", v5, v6);
    v9 = v8;
  }
  else
  {
    v9 = *MEMORY[0x1E0DC53D8];
  }

  return v9;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  -[NSMutableArray objectAtIndexedSubscript:](self->_sectionItems, "objectAtIndexedSubscript:", objc_msgSend(v6, "section"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKDynamicTableViewController _sectionControllerForSectionIdentifier:](self, "_sectionControllerForSectionIdentifier:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v8, "tableView:didSelectRowAtIndexPath:sectionIdentifier:", v9, v6, v7);

}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  char v10;

  v6 = a3;
  v7 = a4;
  -[NSMutableArray objectAtIndexedSubscript:](self->_sectionItems, "objectAtIndexedSubscript:", objc_msgSend(v7, "section"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKDynamicTableViewController _sectionControllerForSectionIdentifier:](self, "_sectionControllerForSectionIdentifier:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v10 = objc_msgSend(v9, "tableView:canEditRowAtIndexPath:sectionIdentifier:", v6, v7, v8);
  else
    v10 = 0;

  return v10;
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  int64_t v8;

  v5 = a4;
  -[NSMutableArray objectAtIndexedSubscript:](self->_sectionItems, "objectAtIndexedSubscript:", objc_msgSend(v5, "section"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKDynamicTableViewController _sectionControllerForSectionIdentifier:](self, "_sectionControllerForSectionIdentifier:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v8 = objc_msgSend(v7, "editingStyleForRowAtIndexPath:sectionIdentifier:", v5, v6);
  else
    v8 = 0;

  return v8;
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  char v8;

  v5 = a4;
  -[NSMutableArray objectAtIndexedSubscript:](self->_sectionItems, "objectAtIndexedSubscript:", objc_msgSend(v5, "section"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKDynamicTableViewController _sectionControllerForSectionIdentifier:](self, "_sectionControllerForSectionIdentifier:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v8 = objc_msgSend(v7, "shouldHighlightRowAtIndexPath:sectionIdentifier:", v5, v6);
  else
    v8 = 1;

  return v8;
}

- (BOOL)tableView:(id)a3 shouldDrawTopSeparatorForSection:(int64_t)a4
{
  void *v5;
  void *v6;
  char v7;

  -[NSMutableArray objectAtIndexedSubscript:](self->_sectionItems, "objectAtIndexedSubscript:", a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKDynamicTableViewController _sectionControllerForSectionIdentifier:](self, "_sectionControllerForSectionIdentifier:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v7 = objc_msgSend(v6, "shouldDrawTopSeparatorForSectionIdentifier:", v5);
  else
    v7 = 0;

  return v7;
}

- (BOOL)tableView:(id)a3 shouldDrawBottomSeparatorForSection:(int64_t)a4
{
  void *v5;
  void *v6;
  char v7;

  -[NSMutableArray objectAtIndexedSubscript:](self->_sectionItems, "objectAtIndexedSubscript:", a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKDynamicTableViewController _sectionControllerForSectionIdentifier:](self, "_sectionControllerForSectionIdentifier:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v7 = objc_msgSend(v6, "shouldDrawBottomSeparatorForSectionIdentifier:", v5);
  else
    v7 = 0;

  return v7;
}

- (id)tableView:(id)a3 leadingSwipeActionsConfigurationForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  -[NSMutableArray objectAtIndexedSubscript:](self->_sectionItems, "objectAtIndexedSubscript:", objc_msgSend(v7, "section"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKDynamicTableViewController _sectionControllerForSectionIdentifier:](self, "_sectionControllerForSectionIdentifier:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v9, "tableView:leadingSwipeActionsConfigurationForRowAtIndexPath:sectionIdentifier:", v6, v7, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)tableView:(id)a3 trailingSwipeActionsConfigurationForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  -[NSMutableArray objectAtIndexedSubscript:](self->_sectionItems, "objectAtIndexedSubscript:", objc_msgSend(v7, "section"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKDynamicTableViewController _sectionControllerForSectionIdentifier:](self, "_sectionControllerForSectionIdentifier:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v9, "tableView:trailingSwipeActionsConfigurationForRowAtIndexPath:sectionIdentifier:", v6, v7, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)tableView:(id)a3 contextMenuConfigurationForRowAtIndexPath:(id)a4 point:(CGPoint)a5
{
  double y;
  double x;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;

  y = a5.y;
  x = a5.x;
  v9 = a3;
  v10 = a4;
  -[NSMutableArray objectAtIndexedSubscript:](self->_sectionItems, "objectAtIndexedSubscript:", objc_msgSend(v10, "section"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKDynamicTableViewController _sectionControllerForSectionIdentifier:](self, "_sectionControllerForSectionIdentifier:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v12, "tableView:contextMenuConfigurationForRowAtIndexPath:point:sectionIdentifier:", v9, v10, v11, x, y);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (int64_t)rowAnimationForInsertingSection:(unint64_t)a3
{
  return 0;
}

- (int64_t)rowAnimationForReloadingSection:(unint64_t)a3
{
  return 0;
}

- (int64_t)rowAnimationForDeletingSection:(unint64_t)a3
{
  return 0;
}

- (id)_sectionControllerForSectionIdentifier:(id)a3
{
  return (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_sectionControllerMap, "objectForKeyedSubscript:", a3);
}

- (NSArray)sectionControllers
{
  return self->_sectionControllers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionControllers, 0);
  objc_storeStrong((id *)&self->_orderOfSectionIdentifiers, 0);
  objc_storeStrong((id *)&self->_sectionItems, 0);
  objc_storeStrong((id *)&self->_sectionControllerMap, 0);
}

@end
