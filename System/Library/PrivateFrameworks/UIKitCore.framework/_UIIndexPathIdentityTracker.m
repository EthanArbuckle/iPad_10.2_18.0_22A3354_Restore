@implementation _UIIndexPathIdentityTracker

- (void)reset
{
  void *v2;
  uint64_t v3;
  void *v4;
  id WeakRetained;
  id v6;
  id v7;
  id v8;
  id v9;

  if (a1)
  {
    if (*(_BYTE *)(a1 + 40))
    {
LABEL_3:
      v9 = 0;
      goto LABEL_4;
    }
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));

    if (WeakRetained)
    {
      v6 = objc_loadWeakRetained((id *)(a1 + 8));
      objc_msgSend(v6, "dataSource");
      v9 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v7 = objc_loadWeakRetained((id *)(a1 + 16));

      if (!v7)
        goto LABEL_3;
      v8 = objc_loadWeakRetained((id *)(a1 + 16));
      objc_msgSend(v8, "dataSource");
      v9 = (id)objc_claimAutoreleasedReturnValue();

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v2 = v9;
      goto LABEL_5;
    }
LABEL_4:
    v2 = 0;
LABEL_5:
    objc_storeStrong((id *)(a1 + 24), v2);
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(void **)(a1 + 32);
    *(_QWORD *)(a1 + 32) = v3;

  }
}

- (id)initWithTableView:(id *)a1
{
  id v3;
  id *v4;
  objc_super v6;

  v3 = a2;
  if (a1)
  {
    v6.receiver = a1;
    v6.super_class = (Class)_UIIndexPathIdentityTracker;
    v4 = (id *)objc_msgSendSuper2(&v6, sel_init);
    a1 = v4;
    if (v4)
    {
      objc_storeWeak(v4 + 1, v3);
      -[_UIIndexPathIdentityTracker reset]((uint64_t)a1);
    }
  }

  return a1;
}

- (id)initWithCollectionView:(id *)a1
{
  id v3;
  id *v4;
  objc_super v6;

  v3 = a2;
  if (a1)
  {
    v6.receiver = a1;
    v6.super_class = (Class)_UIIndexPathIdentityTracker;
    v4 = (id *)objc_msgSendSuper2(&v6, sel_init);
    a1 = v4;
    if (v4)
    {
      objc_storeWeak(v4 + 2, v3);
      -[_UIIndexPathIdentityTracker reset]((uint64_t)a1);
    }
  }

  return a1;
}

- (id)_mappingIdentifierForSanitizedIndexPath:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v3 = a2;
  v4 = v3;
  if (v3)
  {
    v11 = 0;
    v12 = &v11;
    v13 = 0x3032000000;
    v14 = __Block_byref_object_copy__153;
    v15 = __Block_byref_object_dispose__153;
    v16 = 0;
    v6 = *(void **)(a1 + 32);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __71___UIIndexPathIdentityTracker__mappingIdentifierForSanitizedIndexPath___block_invoke;
    v8[3] = &unk_1E16DACD8;
    v9 = v3;
    v10 = &v11;
    _enumerateMapTableKeysAndObjectsUsingBlock(v6, v8);
    v5 = (id)v12[5];

    _Block_object_dispose(&v11, 8);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)identifierForIndexPath:(uint64_t)a1
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    _sanitizedIndexPath(v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    -[_UIIndexPathIdentityTracker _mappingIdentifierForSanitizedIndexPath:](a1, v5);
    v6 = objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = (void *)v6;
      v4 = v5;
    }
    else
    {
      v8 = *(id *)(a1 + 24);
      v9 = v5;
      v4 = v9;
      if (v8)
      {
        if (objc_msgSend(v9, "length") == 1)
          objc_msgSend(v8, "sectionIdentifierForIndex:", objc_msgSend(v4, "section"));
        else
          objc_msgSend(v8, "itemIdentifierForIndexPath:", v4);
        v10 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v10 = objc_opt_new();
      }
      v7 = (void *)v10;

      objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v4, v7);
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)currentIndexPathForIdentifier:(uint64_t)a1
{
  void *v3;

  v3 = 0;
  if (a1 && a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "objectForKey:", a2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (void)_identifierBasedUpdateWithUpdateItems:(uint64_t)a1
{
  id v3;
  void *v4;
  void *v5;
  _QWORD v6[5];

  v3 = a2;
  if (a1)
  {
    if (!*(_QWORD *)(a1 + 24))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", sel__identifierBasedUpdateWithUpdateItems_, a1, CFSTR("_UIIndexPathIdentityTracker.m"), 216, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_identityBasedDataSource != nil"));

    }
    v4 = (void *)objc_msgSend(*(id *)(a1 + 32), "copy");
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __69___UIIndexPathIdentityTracker__identifierBasedUpdateWithUpdateItems___block_invoke;
    v6[3] = &unk_1E16DAD00;
    v6[4] = a1;
    _enumerateMapTableKeysAndObjectsUsingBlock(v4, v6);

  }
}

- (void)_manuallyUpdateWithUpdateItems:(uint64_t)a1
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  _QWORD *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  uint64_t v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t k;
  uint64_t v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  _QWORD v38[5];
  _QWORD v39[6];
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _QWORD v44[6];
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
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    if (*(_QWORD *)(a1 + 24))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", sel__manuallyUpdateWithUpdateItems_, a1, CFSTR("_UIIndexPathIdentityTracker.m"), 226, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_identityBasedDataSource == nil"));

    }
    if (objc_msgSend(*(id *)(a1 + 32), "count"))
    {
      v36 = (void *)objc_opt_new();
      v37 = (void *)objc_opt_new();
      objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = 0u;
      v50 = 0u;
      v51 = 0u;
      v52 = 0u;
      v4 = v3;
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v49, v55, 16);
      if (!v5)
        goto LABEL_22;
      v6 = v5;
      v7 = *(_QWORD *)v50;
      while (1)
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v50 != v7)
            objc_enumerationMutation(v4);
          v9 = *(_QWORD **)(*((_QWORD *)&v49 + 1) + 8 * i);
          objc_msgSend(v9, "indexPathBeforeUpdate");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          _sanitizedIndexPath(v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v9, "indexPathAfterUpdate");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          _sanitizedIndexPath(v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v9 || (v14 = v9[10]) == 0)
          {
            v15 = v37;
            v16 = v13;
LABEL_16:
            objc_msgSend(v15, "addObject:", v16);
            goto LABEL_20;
          }
          if (v14 != 3)
          {
            if (v14 != 1)
              goto LABEL_20;
            v15 = v36;
            v16 = v11;
            goto LABEL_16;
          }
          objc_msgSend(v36, "addObject:", v11);
          objc_msgSend(v37, "addObject:", v13);
          -[_UIIndexPathIdentityTracker _mappingIdentifierForSanitizedIndexPath:](a1, v11);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if (v17)
            objc_msgSend(v35, "setObject:forKey:", v13, v17);

LABEL_20:
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v49, v55, 16);
        if (!v6)
        {
LABEL_22:
          v34 = v3;

          objc_msgSend(v36, "sortUsingSelector:", sel_compare_);
          objc_msgSend(v37, "sortUsingSelector:", sel_compare_);
          v47 = 0u;
          v48 = 0u;
          v45 = 0u;
          v46 = 0u;
          objc_msgSend(v36, "reverseObjectEnumerator");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v45, v54, 16);
          v20 = MEMORY[0x1E0C809B0];
          if (v19)
          {
            v21 = v19;
            v22 = *(_QWORD *)v46;
            do
            {
              for (j = 0; j != v21; ++j)
              {
                if (*(_QWORD *)v46 != v22)
                  objc_enumerationMutation(v18);
                v24 = *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * j);
                v25 = (void *)objc_msgSend(*(id *)(a1 + 32), "copy");
                v44[0] = v20;
                v44[1] = 3221225472;
                v44[2] = __62___UIIndexPathIdentityTracker__manuallyUpdateWithUpdateItems___block_invoke;
                v44[3] = &unk_1E16DAD28;
                v44[4] = v24;
                v44[5] = a1;
                _enumerateMapTableKeysAndObjectsUsingBlock(v25, v44);

              }
              v21 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v45, v54, 16);
            }
            while (v21);
          }

          v43 = 0u;
          v41 = 0u;
          v42 = 0u;
          v40 = 0u;
          v26 = v37;
          v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v40, v53, 16);
          if (v27)
          {
            v28 = v27;
            v29 = *(_QWORD *)v41;
            do
            {
              for (k = 0; k != v28; ++k)
              {
                if (*(_QWORD *)v41 != v29)
                  objc_enumerationMutation(v26);
                v31 = *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * k);
                v32 = (void *)objc_msgSend(*(id *)(a1 + 32), "copy");
                v39[0] = v20;
                v39[1] = 3221225472;
                v39[2] = __62___UIIndexPathIdentityTracker__manuallyUpdateWithUpdateItems___block_invoke_2;
                v39[3] = &unk_1E16DAD28;
                v39[4] = v31;
                v39[5] = a1;
                _enumerateMapTableKeysAndObjectsUsingBlock(v32, v39);

              }
              v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v40, v53, 16);
            }
            while (v28);
          }

          v38[0] = v20;
          v38[1] = 3221225472;
          v38[2] = __62___UIIndexPathIdentityTracker__manuallyUpdateWithUpdateItems___block_invoke_3;
          v38[3] = &unk_1E16DAD00;
          v38[4] = a1;
          _enumerateMapTableKeysAndObjectsUsingBlock(v35, v38);

          v3 = v34;
          break;
        }
      }
    }
  }

}

- (void)updateWithUpdateItems:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    v5 = v3;
    if (*(_QWORD *)(a1 + 24))
      -[_UIIndexPathIdentityTracker _identifierBasedUpdateWithUpdateItems:](a1, v3);
    else
      -[_UIIndexPathIdentityTracker _manuallyUpdateWithUpdateItems:](a1, v3);
    v4 = v5;
  }

}

- (_UIIndexPathIdentityTracker)init
{
  _UIIndexPathIdentityTracker *v2;
  _UIIndexPathIdentityTracker *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UIIndexPathIdentityTracker;
  v2 = -[_UIIndexPathIdentityTracker init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_enforcesManualMapping = 1;
    -[_UIIndexPathIdentityTracker reset]((uint64_t)v2);
  }
  return v3;
}

- (void)enforceManualMapping
{
  self->_enforcesManualMapping = 1;
  -[_UIIndexPathIdentityTracker reset]((uint64_t)self);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapping, 0);
  objc_storeStrong(&self->_identityBasedDataSource, 0);
  objc_destroyWeak((id *)&self->_collectionView);
  objc_destroyWeak((id *)&self->_tableView);
}

@end
