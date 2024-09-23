@implementation PKSectionedDashboardDataSourceTileContext

- (PKSectionedDashboardDataSourceTileContext)initWithSectionDataSources:(id)a3
{
  id v5;
  PKSectionedDashboardDataSourceTileContext *v6;
  PKSectionedDashboardDataSourceTileContext *v7;
  PKSectionedDashboardDataSourceTileContext *v8;
  _QWORD v10[4];
  PKSectionedDashboardDataSourceTileContext *v11;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PKSectionedDashboardDataSourceTileContext;
  v6 = -[PKSectionedDashboardDataSourceTileContext init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_sectionDataSources, a3);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __72__PKSectionedDashboardDataSourceTileContext_initWithSectionDataSources___block_invoke;
    v10[3] = &unk_1E3E70AF0;
    v8 = v7;
    v11 = v8;
    objc_msgSend(v5, "enumerateObjectsUsingBlock:", v10);
    -[PKSectionedDashboardDataSourceTileContext _reloadSectionMap](v8, "_reloadSectionMap");

  }
  return v7;
}

uint64_t __72__PKSectionedDashboardDataSourceTileContext_initWithSectionDataSources___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setDelegate:", *(_QWORD *)(a1 + 32));
}

- (void)setDataSourceDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
  -[PKSectionedDashboardDataSourceTileContext _notifyContentLoadedIfNecessary](self, "_notifyContentLoadedIfNecessary");
}

- (void)_reloadSectionMap
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  uint64_t v15;
  NSArray *sectionIdentifiers;
  uint64_t v17;
  NSDictionary *sectionMap;
  PKSectionedDashboardDataSourceTileContext *v19;
  NSArray *obj;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v19 = self;
  obj = self->_sectionDataSources;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v26 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        objc_msgSend(v9, "sectionIdentifiers", v19);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = 0u;
        v22 = 0u;
        v23 = 0u;
        v24 = 0u;
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v22;
          do
          {
            for (j = 0; j != v12; ++j)
            {
              if (*(_QWORD *)v22 != v13)
                objc_enumerationMutation(v10);
              objc_msgSend(v4, "setObject:forKey:", v9, *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * j));
            }
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
          }
          while (v12);
        }
        objc_msgSend(v3, "addObjectsFromArray:", v10);

      }
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v6);
  }

  v15 = objc_msgSend(v3, "copy");
  sectionIdentifiers = v19->_sectionIdentifiers;
  v19->_sectionIdentifiers = (NSArray *)v15;

  v17 = objc_msgSend(v4, "copy");
  sectionMap = v19->_sectionMap;
  v19->_sectionMap = (NSDictionary *)v17;

}

- (unint64_t)_sectionOffsetForDataSource:(id)a3
{
  unint64_t v3;
  id v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = self->_sectionDataSources;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v3 = 0;
    v9 = *(_QWORD *)v15;
LABEL_3:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v15 != v9)
        objc_enumerationMutation(v6);
      v11 = *(id *)(*((_QWORD *)&v14 + 1) + 8 * v10);
      if (v11 == v5)
        break;
      objc_msgSend(v11, "sectionIdentifiers", (_QWORD)v14);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v3 += objc_msgSend(v12, "count");

      if (v8 == ++v10)
      {
        v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        if (v8)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:

    __break(1u);
  }

  return v3;
}

- (void)_notifyContentLoadedIfNecessary
{
  uint64_t v3;
  id WeakRetained;

  if (!self->_isAllContentLoaded)
  {
    v3 = -[NSArray pk_countObjectsPassingTest:](self->_sectionDataSources, "pk_countObjectsPassingTest:", &__block_literal_global_138);
    if (v3 == -[NSArray count](self->_sectionDataSources, "count"))
    {
      self->_isAllContentLoaded = 1;
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(WeakRetained, "contentIsLoaded");

    }
  }
}

uint64_t __76__PKSectionedDashboardDataSourceTileContext__notifyContentLoadedIfNecessary__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isContentLoaded");
}

- (id)itemAtIndexPath:(id)a3
{
  NSArray *sectionIdentifiers;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;

  sectionIdentifiers = self->_sectionIdentifiers;
  v5 = a3;
  -[NSArray objectAtIndexedSubscript:](sectionIdentifiers, "objectAtIndexedSubscript:", objc_msgSend(v5, "section"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](self->_sectionMap, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "item");

  objc_msgSend(v7, "itemForSectionIdentifier:atIndex:", v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (unint64_t)numberOfItemsInSection:(unint64_t)a3
{
  void *v4;
  void *v5;
  unint64_t v6;

  if (!self->_isAllContentLoaded)
    return 0;
  -[NSArray objectAtIndexedSubscript:](self->_sectionIdentifiers, "objectAtIndexedSubscript:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](self->_sectionMap, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "numberOfItemsInSection:", v4);

  return v6;
}

- (unint64_t)numberOfSections
{
  if (self->_isAllContentLoaded)
    return -[NSArray count](self->_sectionIdentifiers, "count");
  else
    return 0;
}

- (id)titleForSection:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;

  -[NSArray objectAtIndexedSubscript:](self->_sectionIdentifiers, "objectAtIndexedSubscript:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](self->_sectionMap, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "titleForSectionIdentifier:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)footerTextItemForSection:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;

  -[NSArray objectAtIndexedSubscript:](self->_sectionIdentifiers, "objectAtIndexedSubscript:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](self->_sectionMap, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "footerTextItemForSectionIdentifier:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)updateSectionDataSource:(id)a3 withUpdates:(id)a4 diff:(id)a5
{
  id v8;
  void (**v9)(_QWORD);
  id v10;
  id WeakRetained;
  _QWORD v12[5];
  id v13;
  void (**v14)(_QWORD);
  id v15;
  id v16;
  id location;

  v8 = a3;
  v9 = (void (**)(_QWORD))a4;
  v10 = a5;
  if (self->_isAllContentLoaded)
  {
    objc_initWeak(&location, self);
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __86__PKSectionedDashboardDataSourceTileContext_updateSectionDataSource_withUpdates_diff___block_invoke;
    v12[3] = &unk_1E3E70B58;
    objc_copyWeak(&v16, &location);
    v14 = v9;
    v12[4] = self;
    v13 = v8;
    v15 = v10;
    objc_msgSend(WeakRetained, "performBatchUpdates:completion:", v12, 0);

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
  else
  {
    v9[2](v9);
    -[PKSectionedDashboardDataSourceTileContext _reloadSectionMap](self, "_reloadSectionMap");
    -[PKSectionedDashboardDataSourceTileContext _notifyContentLoadedIfNecessary](self, "_notifyContentLoadedIfNecessary");
  }

}

void __86__PKSectionedDashboardDataSourceTileContext_updateSectionDataSource_withUpdates_diff___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    objc_msgSend(*(id *)(a1 + 32), "_reloadSectionMap");
    objc_msgSend(WeakRetained, "_sectionOffsetForDataSource:", *(_QWORD *)(a1 + 40));
    v2 = *(void **)(a1 + 32);
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "_applyDiff:", v3);

  }
}

- (void)_applyDiff:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  unint64_t v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  void *v26;
  void *v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v4, "deletedIndexPaths");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "deleteItemsAtIndexPaths:", v6);

    v7 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v4, "deletedSections");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "deleteSections:", v8);

    v9 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v4, "insertedIndexPaths");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "insertItemsAtIndexPaths:", v10);

    v11 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v4, "insertedSections");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "insertSections:", v12);

    objc_msgSend(v4, "movedFromIndexPaths");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "movedToIndexPaths");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "count"))
    {
      v15 = 0;
      do
      {
        v16 = objc_loadWeakRetained((id *)&self->_delegate);
        objc_msgSend(v13, "objectAtIndexedSubscript:", v15);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectAtIndexedSubscript:", v15);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "moveItemAtIndexPath:toIndexPath:", v17, v18);

        ++v15;
      }
      while (objc_msgSend(v13, "count") > v15);
    }
    v28 = v4;
    objc_msgSend(v4, "changedIndexPaths", v14);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v30;
      do
      {
        v23 = 0;
        do
        {
          if (*(_QWORD *)v30 != v22)
            objc_enumerationMutation(v19);
          v24 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * v23);
          v25 = objc_loadWeakRetained((id *)&self->_delegate);
          -[PKSectionedDashboardDataSourceTileContext itemAtIndexPath:](self, "itemAtIndexPath:", v24);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "itemChanged:atIndexPath:", v26, v24);

          ++v23;
        }
        while (v21 != v23);
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      }
      while (v21);
    }

    v4 = v28;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionMap, 0);
  objc_storeStrong((id *)&self->_sectionIdentifiers, 0);
  objc_storeStrong((id *)&self->_sectionDataSources, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
