@implementation PXSearchComposableDataSource

- (PXSearchComposableDataSource)initWithCollectionView:(id)a3 searchDataSourceSectionProviders:(id)a4
{
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  PXSearchComposableDataSource *v11;
  uint64_t v12;
  NSArray *sectionProviders;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  UICollectionViewDiffableDataSource *diffableDataSource;
  void *v24;
  void *v25;
  _QWORD v26[4];
  id v27;
  _QWORD aBlock[4];
  id v29;
  id buf[2];
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  objc_super v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSearchComposableDataSource.m"), 22, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("collectionView"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSearchComposableDataSource.m"), 23, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sectionProviders"));

LABEL_3:
  if (!objc_msgSend(v9, "count"))
  {
    PLPhotosSearchGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_1A6789000, v10, OS_LOG_TYPE_ERROR, "Photos Search Datasource: Intialization with an empty array of section providers", (uint8_t *)buf, 2u);
    }

  }
  v35.receiver = self;
  v35.super_class = (Class)PXSearchComposableDataSource;
  v11 = -[PXSearchComposableDataSource init](&v35, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v9, "copy");
    sectionProviders = v11->_sectionProviders;
    v11->_sectionProviders = (NSArray *)v12;

    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v14 = v9;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    if (v15)
    {
      v16 = *(_QWORD *)v32;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v32 != v16)
            objc_enumerationMutation(v14);
          objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * v17++), "setChangeObserver:", v11);
        }
        while (v15 != v17);
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
      }
      while (v15);
    }

    -[PXSearchComposableDataSource _registerClassesForCollectionView:withPXSearchDataSourceSectionProviders:](v11, "_registerClassesForCollectionView:withPXSearchDataSourceSectionProviders:", v7, v14);
    objc_initWeak(buf, v11);
    v18 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __88__PXSearchComposableDataSource_initWithCollectionView_searchDataSourceSectionProviders___block_invoke;
    aBlock[3] = &unk_1E511B140;
    objc_copyWeak(&v29, buf);
    v19 = _Block_copy(aBlock);
    v26[0] = v18;
    v26[1] = 3221225472;
    v26[2] = __88__PXSearchComposableDataSource_initWithCollectionView_searchDataSourceSectionProviders___block_invoke_2;
    v26[3] = &unk_1E511B168;
    objc_copyWeak(&v27, buf);
    v20 = _Block_copy(v26);
    v21 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC35E8]), "initWithCollectionView:cellProvider:", v7, v19);
    diffableDataSource = v11->_diffableDataSource;
    v11->_diffableDataSource = (UICollectionViewDiffableDataSource *)v21;

    -[UICollectionViewDiffableDataSource setSupplementaryViewProvider:](v11->_diffableDataSource, "setSupplementaryViewProvider:", v20);
    objc_msgSend(v7, "setPrefetchDataSource:", v11);
    -[PXSearchComposableDataSource _reloadDataAnimated:reloadItemIdentifiers:](v11, "_reloadDataAnimated:reloadItemIdentifiers:", 0, MEMORY[0x1E0C9AA60]);

    objc_destroyWeak(&v27);
    objc_destroyWeak(&v29);
    objc_destroyWeak(buf);
  }

  return v11;
}

- (void)_registerClassesForCollectionView:(id)a3 withPXSearchDataSourceSectionProviders:(id)a4
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  _QWORD v20[5];
  id v21;
  SEL v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _QWORD v27[5];
  id v28;
  SEL v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v31;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v31 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v12);
        v27[0] = MEMORY[0x1E0C809B0];
        v27[1] = 3221225472;
        v27[2] = __105__PXSearchComposableDataSource__registerClassesForCollectionView_withPXSearchDataSourceSectionProviders___block_invoke;
        v27[3] = &unk_1E511B190;
        v29 = a2;
        v27[4] = self;
        v28 = v7;
        objc_msgSend(v13, "registerClassesForCellReuseIdentifiers:", v27);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    }
    while (v10);
  }
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v14 = v8;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v23, v34, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v24;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v24 != v17)
          objc_enumerationMutation(v14);
        v19 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v18);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          v20[0] = MEMORY[0x1E0C809B0];
          v20[1] = 3221225472;
          v20[2] = __105__PXSearchComposableDataSource__registerClassesForCollectionView_withPXSearchDataSourceSectionProviders___block_invoke_2;
          v20[3] = &unk_1E511B1B8;
          v22 = a2;
          v20[4] = self;
          v21 = v7;
          objc_msgSend(v19, "registerClassesForSupplementaryViewReuseIdentifiers:", v20);

        }
        ++v18;
      }
      while (v16 != v18);
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v23, v34, 16);
    }
    while (v16);
  }

}

- (void)_reloadDataAnimated:(BOOL)a3 reloadItemIdentifiers:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  uint64_t v16;
  void *v17;
  void *v18;
  _BOOL4 v19;
  PXSearchComposableDataSource *v20;
  void *v21;
  id v22;
  id obj;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v19 = a3;
  v35 = *MEMORY[0x1E0C80C00];
  v22 = a4;
  -[PXSearchComposableDataSource diffableDataSource](self, "diffableDataSource");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc_init(MEMORY[0x1E0DC3398]);
  v20 = self;
  -[PXSearchComposableDataSource sectionProviders](self, "sectionProviders");
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
  if (v6)
  {
    v7 = v6;
    v24 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v30 != v24)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        objc_msgSend(v9, "sectionIdentifiers");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "appendSectionsWithIdentifiers:", v10);

        v27 = 0u;
        v28 = 0u;
        v25 = 0u;
        v26 = 0u;
        objc_msgSend(v9, "sectionIdentifiers");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v26;
          do
          {
            for (j = 0; j != v13; ++j)
            {
              if (*(_QWORD *)v26 != v14)
                objc_enumerationMutation(v11);
              v16 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * j);
              objc_msgSend(v9, "itemIdentifiersInSectionWithIdentifier:", v16);
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v5, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", v17, v16);

            }
            v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
          }
          while (v13);
        }

      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    }
    while (v7);
  }
  objc_msgSend(v5, "reloadItemsWithIdentifiers:", v22);
  if (v19)
    objc_msgSend(v21, "applySnapshot:animatingDifferences:", v5, 1);
  else
    objc_msgSend(v21, "applySnapshotUsingReloadData:", v5);
  -[PXSearchComposableDataSource changeObserver](v20, "changeObserver");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "searchComposableDataSourceDidChange:", v20);

}

- (void)searchDataSourceSectionProviderDidChange:(id)a3 animateChanges:(BOOL)a4
{
  -[PXSearchComposableDataSource _reloadDataAnimated:reloadItemIdentifiers:](self, "_reloadDataAnimated:reloadItemIdentifiers:", a4, MEMORY[0x1E0C9AA60]);
}

- (void)searchDataSourceSectionProviderDidChange:(id)a3 reloadItemIdentifiers:(id)a4 animateChanges:(BOOL)a5
{
  -[PXSearchComposableDataSource _reloadDataAnimated:reloadItemIdentifiers:](self, "_reloadDataAnimated:reloadItemIdentifiers:", a5, a4);
}

- (id)searchDataSourceSectionProviderForIndexPath:(id)a3
{
  id v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v17;
  uint8_t buf[4];
  unint64_t v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSearchComposableDataSource.m"), 143, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("indexPath"));

  }
  v6 = objc_msgSend(v5, "section");
  if (v6 < 0 || v6 >= -[PXSearchComposableDataSource numberOfSections](self, "numberOfSections"))
  {
    PLPhotosSearchGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      -[PXSearchComposableDataSource sectionProviders](self, "sectionProviders");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218242;
      v19 = v6;
      v20 = 2112;
      v21 = (uint64_t)v13;
      _os_log_impl(&dword_1A6789000, v7, OS_LOG_TYPE_ERROR, "Photos Search Datasource: No section provider exists for section: %ld, with providers: %@", buf, 0x16u);

    }
    v12 = 0;
  }
  else
  {
    -[PXSearchComposableDataSource searchDataSourceSectionProviderForSection:](self, "searchDataSourceSectionProviderForSection:", v6);
    v7 = objc_claimAutoreleasedReturnValue();
    -[PXSearchComposableDataSource sectionIdentifiers](self, "sectionIdentifiers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndexedSubscript:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSObject itemIdentifiersInSectionWithIdentifier:](v7, "itemIdentifiersInSectionWithIdentifier:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v5, "item");
    if (v11 >= objc_msgSend(v10, "count"))
    {
      PLPhotosSearchGetLog();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        -[PXSearchComposableDataSource sectionProviders](self, "sectionProviders");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218498;
        v19 = v11;
        v20 = 2048;
        v21 = v6;
        v22 = 2112;
        v23 = v15;
        _os_log_impl(&dword_1A6789000, v14, OS_LOG_TYPE_ERROR, "Photos Search Datasource: No section provider exists for item: %ld, section: %ld, with providers: %@", buf, 0x20u);

      }
      v12 = 0;
    }
    else
    {
      v12 = v7;
    }

  }
  return v12;
}

- (id)searchDataSourceSectionProviderForSection:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  NSObject *v9;
  void *v10;
  int v11;
  int64_t v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (a3 < 0 || -[PXSearchComposableDataSource numberOfSections](self, "numberOfSections") <= a3)
  {
    PLPhotosSearchGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      -[PXSearchComposableDataSource sectionProviders](self, "sectionProviders");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 134218242;
      v12 = a3;
      v13 = 2112;
      v14 = v10;
      _os_log_impl(&dword_1A6789000, v9, OS_LOG_TYPE_ERROR, "Photos Search Datasource: No section provider exists for section: %ld, with providers: %@", (uint8_t *)&v11, 0x16u);

    }
    return 0;
  }
  else
  {
    -[PXSearchComposableDataSource sectionIdentifiers](self, "sectionIdentifiers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectAtIndexedSubscript:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[PXSearchComposableDataSource searchDataSourceSectionProviderForSectionIdentifier:](self, "searchDataSourceSectionProviderForSectionIdentifier:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    return v7;
  }
}

- (id)searchDataSourceSectionProviderForItemIdentifier:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v11;
  uint8_t buf[4];
  id v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSearchComposableDataSource.m"), 177, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("itemIdentifier"));

  }
  -[PXSearchComposableDataSource sectionIdentifierForSectionContainingItemIdentifier:](self, "sectionIdentifierForSectionContainingItemIdentifier:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[PXSearchComposableDataSource searchDataSourceSectionProviderForSectionIdentifier:](self, "searchDataSourceSectionProviderForSectionIdentifier:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    PLPhotosSearchGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      -[PXSearchComposableDataSource sectionProviders](self, "sectionProviders");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v13 = v5;
      v14 = 2112;
      v15 = v9;
      _os_log_impl(&dword_1A6789000, v8, OS_LOG_TYPE_ERROR, "Photos Search Datasource: No section identifier exists for item identifier: %@, with providers: %@", buf, 0x16u);

    }
    v7 = 0;
  }

  return v7;
}

- (id)searchDataSourceSectionProviderForSectionIdentifier:(id)a3
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  char v12;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSearchComposableDataSource.m"), 191, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sectionIdentifier"));

  }
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[PXSearchComposableDataSource sectionProviders](self, "sectionProviders");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v10, "sectionIdentifiers");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "containsObject:", v5);

        if ((v12 & 1) != 0)
        {
          v7 = v10;
          goto LABEL_13;
        }
      }
      v7 = (id)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_13:

  return v7;
}

- (id)_convertIndexPath:(id)a3 toPXSearchDataSourceSectionProvider:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v16;
  void *v17;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSearchComposableDataSource.m"), 205, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("indexPath"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSearchComposableDataSource.m"), 206, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("searchDataSourceSectionProvider"));

LABEL_3:
  -[PXSearchComposableDataSource sectionIdentifiers](self, "sectionIdentifiers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectAtIndexedSubscript:", objc_msgSend(v7, "section"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "sectionIdentifiers");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "indexOfObject:", v11);

  if (v13 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v14 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", objc_msgSend(v7, "item"), v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v14;
}

- (int64_t)numberOfItems
{
  void *v2;
  void *v3;
  int64_t v4;

  -[PXSearchComposableDataSource diffableDataSource](self, "diffableDataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "snapshot");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "numberOfItems");

  return v4;
}

- (int64_t)numberOfSections
{
  void *v2;
  void *v3;
  int64_t v4;

  -[PXSearchComposableDataSource diffableDataSource](self, "diffableDataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "snapshot");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "numberOfSections");

  return v4;
}

- (NSArray)sectionIdentifiers
{
  void *v2;
  void *v3;
  void *v4;

  -[PXSearchComposableDataSource diffableDataSource](self, "diffableDataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "snapshot");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sectionIdentifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (NSArray)itemIdentifiers
{
  void *v2;
  void *v3;
  void *v4;

  -[PXSearchComposableDataSource diffableDataSource](self, "diffableDataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "snapshot");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "itemIdentifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (int64_t)numberOfItemsInSection:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int64_t v7;

  v4 = a3;
  -[PXSearchComposableDataSource diffableDataSource](self, "diffableDataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "snapshot");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "numberOfItemsInSection:", v4);

  return v7;
}

- (id)itemIdentifiersInSectionWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[PXSearchComposableDataSource diffableDataSource](self, "diffableDataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "snapshot");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "itemIdentifiersInSectionWithIdentifier:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)sectionIdentifierForSectionContainingItemIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[PXSearchComposableDataSource diffableDataSource](self, "diffableDataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "snapshot");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sectionIdentifierForSectionContainingItemIdentifier:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)itemIdentifierForIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[PXSearchComposableDataSource diffableDataSource](self, "diffableDataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "itemIdentifierForIndexPath:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)indexPathForItemIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[PXSearchComposableDataSource diffableDataSource](self, "diffableDataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "indexPathForItemIdentifier:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)collectionView:(id)a3 prefetchItemsAtIndexPaths:(id)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  unint64_t v20;
  void *v21;
  void *v22;
  id obj;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  obj = v5;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v26;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v26 != v10)
          objc_enumerationMutation(obj);
        -[PXSearchComposableDataSource itemIdentifierForIndexPath:](self, "itemIdentifierForIndexPath:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v11));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v12)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSearchComposableDataSource.m"), 264, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("itemIdentifier"));

        }
        -[PXSearchComposableDataSource searchDataSourceSectionProviderForItemIdentifier:](self, "searchDataSourceSectionProviderForItemIdentifier:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v13)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSearchComposableDataSource.m"), 266, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sectionProvider"));

        }
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          v14 = objc_msgSend(v6, "indexOfObject:", v13);
          if (v14 == 0x7FFFFFFFFFFFFFFFLL)
          {
            objc_msgSend(v6, "addObject:", v13);
            v15 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
            objc_msgSend(v15, "addObject:", v12);
            v16 = v7;
            v17 = v15;
          }
          else
          {
            objc_msgSend(v7, "objectAtIndex:", v14);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = v16;
            v17 = v12;
          }
          objc_msgSend(v16, "addObject:", v17);

        }
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v9);
  }

  if (objc_msgSend(v6, "count"))
  {
    v20 = 0;
    do
    {
      objc_msgSend(v6, "objectAtIndexedSubscript:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectAtIndexedSubscript:", v20);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "prefetchItemsForItemIdentifiers:", v22);

      ++v20;
    }
    while (v20 < objc_msgSend(v6, "count"));
  }

}

- (id)_configuredCellForCollectionView:(id)a3 indexPath:(id)a4 itemIdentifier:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;
  void *v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  -[PXSearchComposableDataSource searchDataSourceSectionProviderForItemIdentifier:](self, "searchDataSourceSectionProviderForItemIdentifier:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSearchComposableDataSource.m"), 299, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("searchSectionProvider"));

  }
  objc_msgSend(v12, "cellReuseIdentifierForItemIdentifier:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSearchComposableDataSource.m"), 301, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("reuseIdentifier"));

  }
  objc_msgSend(v9, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v13, v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "configureCell:forItemIdentifier:", v14, v11);

  return v14;
}

- (id)_configuredSupplementaryViewForCollectionView:(id)a3 kind:(id)a4 indexPath:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v17;
  void *v18;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  -[PXSearchComposableDataSource searchDataSourceSectionProviderForSection:](self, "searchDataSourceSectionProviderForSection:", objc_msgSend(v11, "section"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSearchComposableDataSource _convertIndexPath:toPXSearchDataSourceSectionProvider:](self, "_convertIndexPath:toPXSearchDataSourceSectionProvider:", v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSearchComposableDataSource.m"), 312, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("itemProviderLocalIndexPath"));

  }
  objc_msgSend(v12, "supplementaryViewReuseIdentifierForKind:indexPath:", v10, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSearchComposableDataSource.m"), 314, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("reuseIdentifier"));

  }
  objc_msgSend(v9, "dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:", v10, v14, v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "configureSupplementaryView:kind:indexPath:", v15, v10, v13);

  return v15;
}

- (PXSearchComposableDataSourceChangeObserver)changeObserver
{
  return (PXSearchComposableDataSourceChangeObserver *)objc_loadWeakRetained((id *)&self->_changeObserver);
}

- (void)setChangeObserver:(id)a3
{
  objc_storeWeak((id *)&self->_changeObserver, a3);
}

- (NSArray)sectionProviders
{
  return self->_sectionProviders;
}

- (void)setSectionProviders:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (UICollectionViewDiffableDataSource)diffableDataSource
{
  return self->_diffableDataSource;
}

- (void)setDiffableDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_diffableDataSource, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_diffableDataSource, 0);
  objc_storeStrong((id *)&self->_sectionProviders, 0);
  objc_destroyWeak((id *)&self->_changeObserver);
}

void __105__PXSearchComposableDataSource__registerClassesForCollectionView_withPXSearchDataSourceSectionProviders___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v5 = a3;
  v8 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), CFSTR("PXSearchComposableDataSource.m"), 77, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("reuseIdentifier"));

    v5 = 0;
    if (a2)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), CFSTR("PXSearchComposableDataSource.m"), 78, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("class"));

    v5 = v8;
    goto LABEL_3;
  }
  if (!a2)
    goto LABEL_5;
LABEL_3:
  objc_msgSend(*(id *)(a1 + 40), "registerClass:forCellWithReuseIdentifier:", a2, v5);

}

void __105__PXSearchComposableDataSource__registerClassesForCollectionView_withPXSearchDataSourceSectionProviders___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v7 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), CFSTR("PXSearchComposableDataSource.m"), 88, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("reuseIdentifier"));

  }
  v8 = v12;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), CFSTR("PXSearchComposableDataSource.m"), 89, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("kind"));

    v8 = 0;
    if (a2)
      goto LABEL_5;
LABEL_7:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), CFSTR("PXSearchComposableDataSource.m"), 90, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("class"));

    v8 = v12;
    goto LABEL_5;
  }
  if (!a2)
    goto LABEL_7;
LABEL_5:
  objc_msgSend(*(id *)(a1 + 40), "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:", a2, v8, v7);

}

id __88__PXSearchComposableDataSource_initWithCollectionView_searchDataSourceSectionProviders___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id *v6;
  id v7;
  id v8;
  id v9;
  id WeakRetained;
  void *v11;

  v6 = (id *)(a1 + 32);
  v7 = a4;
  v8 = a3;
  v9 = a2;
  WeakRetained = objc_loadWeakRetained(v6);
  objc_msgSend(WeakRetained, "_configuredCellForCollectionView:indexPath:itemIdentifier:", v9, v8, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

id __88__PXSearchComposableDataSource_initWithCollectionView_searchDataSourceSectionProviders___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id *v6;
  id v7;
  id v8;
  id v9;
  id WeakRetained;
  void *v11;

  v6 = (id *)(a1 + 32);
  v7 = a4;
  v8 = a3;
  v9 = a2;
  WeakRetained = objc_loadWeakRetained(v6);
  objc_msgSend(WeakRetained, "_configuredSupplementaryViewForCollectionView:kind:indexPath:", v9, v8, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

@end
