@implementation HomeOutlineSectionController

- (HomeOutlineSectionController)initWithConfiguration:(id)a3
{
  id v5;
  HomeOutlineSectionController *v6;
  HomeOutlineSectionController *v7;
  uint64_t v8;
  NSMutableDictionary *deletions;
  void *v10;
  void *v11;
  uint64_t v12;
  IdentifierPath *sectionIdentifierPath;
  objc_super v15;

  v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)HomeOutlineSectionController;
  v6 = -[HomeOutlineSectionController init](&v15, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_configuration, a3);
    v8 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    deletions = v7->_deletions;
    v7->_deletions = (NSMutableDictionary *)v8;

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineSectionController configuration](v7, "configuration"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "sectionIdentifier"));
    v12 = objc_claimAutoreleasedReturnValue(+[IdentifierPath identifierPathWithIdentifier:](IdentifierPath, "identifierPathWithIdentifier:", v11));
    sectionIdentifierPath = v7->_sectionIdentifierPath;
    v7->_sectionIdentifierPath = (IdentifierPath *)v12;

    -[HomeOutlineSectionController _loadExpandedIdentifierPaths](v7, "_loadExpandedIdentifierPaths");
  }

  return v7;
}

- (HomeOutlineSectionControllerDelegate)delegate
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineSectionController configuration](self, "configuration"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "delegate"));

  return (HomeOutlineSectionControllerDelegate *)v3;
}

- (MapsUIDiffableDataSourceOutlineNodeSnapshot)sectionSnapshot
{
  MapsUIDiffableDataSourceOutlineNodeSnapshot *sectionSnapshot;
  MapsUIDiffableDataSourceOutlineNodeSnapshot *v4;
  void *v5;
  void *v6;
  void *v7;
  MapsUIDiffableDataSourceOutlineNodeSnapshot *v8;
  MapsUIDiffableDataSourceOutlineNodeSnapshot *v9;
  MapsUIDiffableDataSourceOutlineNodeSnapshot *v10;
  MapsUIDiffableDataSourceOutlineNodeSnapshot *v11;

  sectionSnapshot = self->_sectionSnapshot;
  if (!sectionSnapshot)
  {
    v4 = [MapsUIDiffableDataSourceOutlineNodeSnapshot alloc];
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineSectionController sectionIdentifierPath](self, "sectionIdentifierPath"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineSectionController sectionHeaderViewModel](self, "sectionHeaderViewModel"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineSectionController itemSnapshots](self, "itemSnapshots"));
    v8 = -[MapsUIDiffableDataSourceOutlineNodeSnapshot initWithIdentifierPath:viewModel:childSnapshots:expanded:](v4, "initWithIdentifierPath:viewModel:childSnapshots:expanded:", v5, v6, v7, -[HomeOutlineSectionController expanded](self, "expanded"));
    v9 = self->_sectionSnapshot;
    self->_sectionSnapshot = v8;

    v10 = (MapsUIDiffableDataSourceOutlineNodeSnapshot *)objc_claimAutoreleasedReturnValue(-[HomeOutlineSectionController _sectionSnapshotByProcessingDeletionsInSectionSnapshot:](self, "_sectionSnapshotByProcessingDeletionsInSectionSnapshot:", self->_sectionSnapshot));
    v11 = self->_sectionSnapshot;
    self->_sectionSnapshot = v10;

    -[MapsUIDiffableDataSourceIdentifierCache markGeneration](self->_identifierCache, "markGeneration");
    sectionSnapshot = self->_sectionSnapshot;
  }
  return sectionSnapshot;
}

- (void)invalidateSectionSnapshot
{
  MapsUIDiffableDataSourceOutlineNodeSnapshot *sectionSnapshot;

  sectionSnapshot = self->_sectionSnapshot;
  self->_sectionSnapshot = 0;

}

- (void)setActive:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *j;
  void *v15;
  id v16;
  id v17;
  uint64_t v18;
  void *k;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
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
  _BYTE v35[128];

  if (self->_active != a3)
  {
    v3 = a3;
    self->_active = a3;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineSectionController dataProviders](self, "dataProviders"));
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v30;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(_QWORD *)v30 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)i), "setActive:", v3);
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
      }
      while (v7);
    }

    if (v3)
    {
      v27 = 0uLL;
      v28 = 0uLL;
      v25 = 0uLL;
      v26 = 0uLL;
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineSectionController dataProviders](self, "dataProviders"));
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v26;
        do
        {
          for (j = 0; j != v12; j = (char *)j + 1)
          {
            if (*(_QWORD *)v26 != v13)
              objc_enumerationMutation(v10);
            v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)j), "observers"));
            objc_msgSend(v15, "registerObserver:", self);

          }
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
        }
        while (v12);
      }
    }
    else
    {
      v23 = 0uLL;
      v24 = 0uLL;
      *((_QWORD *)&v21 + 1) = 0;
      v22 = 0uLL;
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineSectionController dataProviders](self, "dataProviders", 0));
      v16 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v33, 16);
      if (v16)
      {
        v17 = v16;
        v18 = *(_QWORD *)v22;
        do
        {
          for (k = 0; k != v17; k = (char *)k + 1)
          {
            if (*(_QWORD *)v22 != v18)
              objc_enumerationMutation(v10);
            v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)k), "observers"));
            objc_msgSend(v20, "unregisterObserver:", self);

          }
          v17 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v33, 16);
        }
        while (v17);
      }
    }

  }
}

- (void)_loadExpandedIdentifierPaths
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSMutableSet *v8;
  NSMutableSet *expandedIdentifierPaths;
  id v10;

  v10 = (id)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", self->_sectionIdentifierPath));
  if (-[HomeOutlineSectionController persistsExpansions](self, "persistsExpansions"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineSectionController configuration](self, "configuration"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "storage"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineSectionController configuration](self, "configuration"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "sectionIdentifier"));
    v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "expandedIdentifierPathsInSection:defaultExpandedIdentifierPaths:", v6, v10));

  }
  else
  {
    v7 = v10;
  }
  v8 = (NSMutableSet *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithSet:](NSMutableSet, "setWithSet:", v7));
  expandedIdentifierPaths = self->_expandedIdentifierPaths;
  self->_expandedIdentifierPaths = v8;

}

- (void)_storeExpandedIdentifierPaths
{
  NSMutableSet *expandedIdentifierPaths;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];

  if (-[HomeOutlineSectionController persistsExpansions](self, "persistsExpansions"))
  {
    expandedIdentifierPaths = self->_expandedIdentifierPaths;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100352290;
    v9[3] = &unk_1011B2838;
    v9[4] = self;
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet objectsPassingTest:](expandedIdentifierPaths, "objectsPassingTest:", v9));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineSectionController configuration](self, "configuration"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "storage"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineSectionController configuration](self, "configuration"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "sectionIdentifier"));
    objc_msgSend(v6, "storeExpandedIdentifierPaths:forSection:", v4, v8);

  }
}

- (BOOL)expanded
{
  NSMutableSet *expandedIdentifierPaths;
  void *v3;

  expandedIdentifierPaths = self->_expandedIdentifierPaths;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineSectionController sectionIdentifierPath](self, "sectionIdentifierPath"));
  LOBYTE(expandedIdentifierPaths) = -[NSMutableSet containsObject:](expandedIdentifierPaths, "containsObject:", v3);

  return (char)expandedIdentifierPaths;
}

- (void)expandElementAtIdentifierPath:(id)a3
{
  void *v4;
  unsigned int v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineSectionController sectionIdentifierPath](self, "sectionIdentifierPath"));
  v5 = objc_msgSend(v7, "hasPrefix:", v4);

  if (v5
    && (-[NSMutableSet containsObject:](self->_expandedIdentifierPaths, "containsObject:", v7) & 1) == 0)
  {
    -[NSMutableSet addObject:](self->_expandedIdentifierPaths, "addObject:", v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineSectionController delegate](self, "delegate"));
    objc_msgSend(v6, "sectionController:setNeedsApplySnapshotAnimated:", self, 1);

    -[HomeOutlineSectionController _storeExpandedIdentifierPaths](self, "_storeExpandedIdentifierPaths");
  }

}

- (void)collapseElementAtIdentifierPath:(id)a3
{
  void *v4;
  unsigned int v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineSectionController sectionIdentifierPath](self, "sectionIdentifierPath"));
  v5 = objc_msgSend(v7, "hasPrefix:", v4);

  if (v5 && -[NSMutableSet containsObject:](self->_expandedIdentifierPaths, "containsObject:", v7))
  {
    -[NSMutableSet removeObject:](self->_expandedIdentifierPaths, "removeObject:", v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineSectionController delegate](self, "delegate"));
    objc_msgSend(v6, "sectionController:setNeedsApplySnapshotAnimated:", self, 1);

    -[HomeOutlineSectionController _storeExpandedIdentifierPaths](self, "_storeExpandedIdentifierPaths");
  }

}

- (void)toggleElementAtIdentifierPath:(id)a3
{
  NSMutableSet *expandedIdentifierPaths;
  id v5;

  expandedIdentifierPaths = self->_expandedIdentifierPaths;
  v5 = a3;
  if (-[NSMutableSet containsObject:](expandedIdentifierPaths, "containsObject:"))
    -[HomeOutlineSectionController collapseElementAtIdentifierPath:](self, "collapseElementAtIdentifierPath:", v5);
  else
    -[HomeOutlineSectionController expandElementAtIdentifierPath:](self, "expandElementAtIdentifierPath:", v5);

}

- (BOOL)shouldPersistExpandedIdentifierPath:(id)a3
{
  return 1;
}

- (NSSet)selectedIdentifierPaths
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v10[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineSectionController configuration](self, "configuration"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "collectionView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "indexPathsForSelectedItems"));

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10035254C;
  v10[3] = &unk_1011B2860;
  v10[4] = self;
  v6 = sub_10039DCD4(v5, v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v7));

  return (NSSet *)v8;
}

- (MapsUIDiffableDataSourceIdentifierCache)identifierCache
{
  MapsUIDiffableDataSourceIdentifierCache *identifierCache;
  MapsUIDiffableDataSourceIdentifierCache *v4;
  MapsUIDiffableDataSourceIdentifierCache *v5;

  identifierCache = self->_identifierCache;
  if (!identifierCache)
  {
    v4 = objc_alloc_init(MapsUIDiffableDataSourceIdentifierCache);
    v5 = self->_identifierCache;
    self->_identifierCache = v4;

    identifierCache = self->_identifierCache;
  }
  return identifierCache;
}

- (id)contentInjectorForSnapshot:(id)a3
{
  return 0;
}

- (id)shareItemSourceForSnapshot:(id)a3
{
  return 0;
}

- (void)homeDataProvidingObjectDidUpdate:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  if (self->_active && objc_msgSend(v5, "active"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineSectionController delegate](self, "delegate"));
    objc_msgSend(v4, "sectionController:setNeedsApplySnapshotAnimated:", self, 1);

  }
}

- (void)beginDeletions:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  id v10;
  NSObject *v11;
  NSMutableDictionary *deletions;
  void *v13;
  void *v14;
  NSMutableDictionary *v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  void *v23;
  _BYTE v24[128];

  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v4 = a3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v19;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v19 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i);
        v10 = sub_100432EDC();
        v11 = objc_claimAutoreleasedReturnValue(v10);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v23 = v9;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "HomeOutlineSectionController addDeletion: %@", buf, 0xCu);
        }

        deletions = self->_deletions;
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "identifierPath"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](deletions, "objectForKeyedSubscript:", v13));

        if (v14)
        {
          v17 = v4;
          goto LABEL_13;
        }
        v15 = self->_deletions;
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "identifierPath"));
        -[NSMutableDictionary setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", v9, v16);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
      if (v6)
        continue;
      break;
    }
  }

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineSectionController delegate](self, "delegate"));
  objc_msgSend(v17, "sectionController:setNeedsApplySnapshotAnimated:", self, 1);
LABEL_13:

}

- (void)endFailedDeletions:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v6 = a3;
  v7 = a4;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v11), "markAsCompletedWithSuccess:error:", 0, v7);
        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }
  -[HomeOutlineSectionController _removeDeletions:applySnapshot:](self, "_removeDeletions:applySnapshot:", v6, 1);

}

- (void)_removeDeletions:(id)a3 applySnapshot:(BOOL)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  id v11;
  NSObject *v12;
  NSMutableDictionary *deletions;
  void *v14;
  void *v15;
  NSMutableDictionary *v16;
  void *v17;
  NSMutableSet *expandedIdentifierPaths;
  void *v19;
  void *v20;
  _BOOL4 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[4];
  void *v27;
  _BYTE v28[128];

  v21 = a4;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v5 = a3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v23;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v23 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)i);
        v11 = sub_100432EDC();
        v12 = objc_claimAutoreleasedReturnValue(v11);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v27 = v10;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "HomeOutlineSectionController removeDeletion: %@", buf, 0xCu);
        }

        deletions = self->_deletions;
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "identifierPath"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](deletions, "objectForKeyedSubscript:", v14));

        if (!v15)
        {
          v20 = v5;
          goto LABEL_14;
        }
        v16 = self->_deletions;
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "identifierPath"));
        -[NSMutableDictionary setObject:forKeyedSubscript:](v16, "setObject:forKeyedSubscript:", 0, v17);

        expandedIdentifierPaths = self->_expandedIdentifierPaths;
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "identifierPath"));
        -[NSMutableSet removeObject:](expandedIdentifierPaths, "removeObject:", v19);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
      if (v7)
        continue;
      break;
    }
  }

  if (v21)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineSectionController delegate](self, "delegate"));
    objc_msgSend(v20, "sectionController:setNeedsApplySnapshotAnimated:", self, 1);
LABEL_14:

  }
}

- (id)deletionWithSnapshot:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  HomeDeletion *v8;
  void *v9;
  HomeDeletion *v10;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineSectionController delegate](self, "delegate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifierPath"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "sectionController:indexPathForIdentifierPath:", self, v6));

  v8 = [HomeDeletion alloc];
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifierPath"));
  v10 = -[HomeDeletion initWithObject:indexPath:identifierPath:contextualActionCompletionHandler:](v8, "initWithObject:indexPath:identifierPath:contextualActionCompletionHandler:", v4, v7, v9, 0);

  return v10;
}

- (id)_sectionSnapshotByProcessingDeletionsInSectionSnapshot:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[HomeOutlineSectionController _scrubDeletionsWithSectionSnapshot:](self, "_scrubDeletionsWithSectionSnapshot:", v4);
  v5 = objc_claimAutoreleasedReturnValue(-[HomeOutlineSectionController _snapshotByFilteringDeletionsFromSnapshot:](self, "_snapshotByFilteringDeletionsFromSnapshot:", v4));
  v6 = (void *)v5;
  if (v5)
    v7 = (void *)v5;
  else
    v7 = v4;
  v8 = v7;

  return v8;
}

- (void)_scrubDeletionsWithSectionSnapshot:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = -[NSMutableDictionary copy](self->_deletions, "copy", 0);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_deletions, "objectForKeyedSubscript:", v11));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "identifierPathByRemovingFirstIdentifier"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "nodeSnapshotAtIdentifierPath:", v13));

        if (!v14 && (objc_msgSend(v12, "completed") & 1) == 0)
          objc_msgSend(v12, "markAsCompletedWithSuccess:error:", 1, 0);
        if (objc_msgSend(v12, "completed"))
          objc_msgSend(v5, "addObject:", v12);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  if (objc_msgSend(v5, "count"))
    -[HomeOutlineSectionController _removeDeletions:applySnapshot:](self, "_removeDeletions:applySnapshot:", v5, 0);

}

- (id)_snapshotByFilteringDeletionsFromSnapshot:(id)a3
{
  MapsUIDiffableDataSourceOutlineNodeSnapshot *v4;
  NSMutableDictionary *deletions;
  void *v6;
  void *v7;
  MapsUIDiffableDataSourceOutlineNodeSnapshot *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  MapsUIDiffableDataSourceOutlineNodeSnapshot *v14;
  void *v15;
  void *v16;
  MapsUIDiffableDataSourceOutlineNodeSnapshot *v17;
  _QWORD v19[6];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;

  v4 = (MapsUIDiffableDataSourceOutlineNodeSnapshot *)a3;
  deletions = self->_deletions;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MapsUIDiffableDataSourceOutlineNodeSnapshot identifierPath](v4, "identifierPath"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](deletions, "objectForKeyedSubscript:", v6));

  if (v7)
  {
    v8 = 0;
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MapsUIDiffableDataSourceOutlineNodeSnapshot childSnapshots](v4, "childSnapshots"));
    v10 = objc_msgSend(v9, "count");

    if (v10)
    {
      v20 = 0;
      v21 = &v20;
      v22 = 0x2020000000;
      v23 = 0;
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[MapsUIDiffableDataSourceOutlineNodeSnapshot childSnapshots](v4, "childSnapshots"));
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_100353050;
      v19[3] = &unk_1011B2888;
      v19[4] = self;
      v19[5] = &v20;
      v12 = sub_10039DCD4(v11, v19);
      v13 = (void *)objc_claimAutoreleasedReturnValue(v12);

      if (*((_BYTE *)v21 + 24))
      {
        v14 = [MapsUIDiffableDataSourceOutlineNodeSnapshot alloc];
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[MapsUIDiffableDataSourceOutlineNodeSnapshot identifierPath](v4, "identifierPath"));
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[MapsUIDiffableDataSourceOutlineNodeSnapshot viewModel](v4, "viewModel"));
        v17 = -[MapsUIDiffableDataSourceOutlineNodeSnapshot initWithIdentifierPath:viewModel:childSnapshots:expanded:](v14, "initWithIdentifierPath:viewModel:childSnapshots:expanded:", v15, v16, v13, -[MapsUIDiffableDataSourceOutlineNodeSnapshot expanded](v4, "expanded"));

        v4 = v17;
      }

      _Block_object_dispose(&v20, 8);
    }
    v4 = v4;
    v8 = v4;
  }

  return v8;
}

- (void)clearSelectionWithReason:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineSectionController selectedIdentifierPaths](self, "selectedIdentifierPaths"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "anyObject"));

  if (v5
    && -[HomeOutlineSectionController shouldClearSelectionWithReason:](self, "shouldClearSelectionWithReason:", v8))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineSectionController delegate](self, "delegate"));
    objc_msgSend(v6, "sectionController:deselectItemAtIdentifierPath:", self, v5);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineSectionController delegate](self, "delegate"));
    objc_msgSend(v7, "sectionController:setNeedsApplySnapshotAnimated:", self, 1);

  }
}

- (BOOL)shouldClearSelectionWithReason:(id)a3
{
  return objc_msgSend(a3, "action") != (id)2;
}

- (void)_updateDragAndDropPreview
{
  DragAndDropPreview *dragAndDropPreview;
  void *v4;
  UIDragItem *dragItem;
  id v6;
  _QWORD v7[4];
  id v8;

  dragAndDropPreview = self->_dragAndDropPreview;
  if (dragAndDropPreview)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[DragAndDropPreview renderPreviewImage](dragAndDropPreview, "renderPreviewImage"));
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100353224;
    v7[3] = &unk_1011B28B0;
    v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dragPreview"));
    dragItem = self->_dragItem;
    v6 = v8;
    -[UIDragItem setPreviewProvider:](dragItem, "setPreviewProvider:", v7);

  }
}

- (BOOL)isSourceOfDropCoordinator:(id)a3
{
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  BOOL v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "items", 0));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(v4);
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i), "sourceIndexPath"));
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineSectionController delegate](self, "delegate"));
        v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "sectionController:nodeSnapshotAtIndexPath:", self, v9));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v11, "identifierPath"));

        v13 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineSectionController sectionIdentifierPath](self, "sectionIdentifierPath"));
        LOBYTE(v11) = objc_msgSend(v12, "hasPrefix:", v13);

        if ((v11 & 1) != 0)
        {
          v14 = 1;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v6)
        continue;
      break;
    }
  }
  v14 = 0;
LABEL_11:

  return v14;
}

- (BOOL)isDestinationOfDropCoordinator:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "destinationIndexPath"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineSectionController delegate](self, "delegate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "sectionController:nodeSnapshotAtIndexPath:", self, v4));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifierPath"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineSectionController sectionIdentifierPath](self, "sectionIdentifierPath"));
  LOBYTE(v5) = objc_msgSend(v7, "hasPrefix:", v8);

  return (char)v5;
}

- (id)mapItemForDropSession:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "items"));
  v5 = objc_msgSend(v4, "count");

  if (v5 == (id)1)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "items"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "firstObject"));

    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localObject"));
    if (objc_msgSend(v8, "conformsToProtocol:", &OBJC_PROTOCOL___MapsDragMapItemProviding))
      v9 = v8;
    else
      v9 = 0;
    v10 = v9;

    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "draggedMapItem"));
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)dragAndDropItem:(id)a3 didResolveMapItem:(id)a4
{
  -[HomeOutlineSectionController _updateDragAndDropPreview](self, "_updateDragAndDropPreview", a3, a4);
}

- (void)dragAndDropPreviewDidUpdate:(id)a3
{
  -[HomeOutlineSectionController _updateDragAndDropPreview](self, "_updateDragAndDropPreview", a3);
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineSectionController delegate](self, "delegate"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "sectionController:nodeSnapshotAtIndexPath:", self, v5));

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "viewModel"));
  LODWORD(v6) = objc_msgSend(v8, "conformsToProtocol:", &OBJC_PROTOCOL___HomeCellModel);

  v11 = 0;
  if ((_DWORD)v6)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "viewModel"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "homeActionObject"));

    if (v10)
      v11 = 1;
  }

  return v11;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  unsigned __int8 v19;
  id v20;

  v20 = a3;
  v6 = a4;
  +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 2007, 8, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineSectionController delegate](self, "delegate"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "sectionController:nodeSnapshotAtIndexPath:", self, v6));

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "viewModel"));
  v10 = objc_msgSend(v9, "conformsToProtocol:", &OBJC_PROTOCOL___HomeCellModel);

  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "viewModel"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "homeActionObject"));

    if (v12)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineSectionController configuration](self, "configuration"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "homeActionDelegate"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "homeActionObject"));
      objc_msgSend(v14, "homeItemTapped:", v15);

    }
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKey:", CFSTR("SIDEBAR_SELECTION_ENABLED_KEY")));

  v18 = objc_opt_class(NSNumber);
  if ((objc_opt_isKindOfClass(v17, v18) & 1) != 0)
  {
    v19 = objc_msgSend(v17, "BOOLValue");

    if ((v19 & 1) == 0)
      objc_msgSend(v20, "deselectItemAtIndexPath:animated:", v6, 1);
  }
  else
  {

  }
}

- (void)collectionView:(id)a3 didUpdateFocusInContext:(id)a4 withAnimationCoordinator:(id)a5
{
  IdentifierPath *focusedIdentifierPath;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned int v12;
  IdentifierPath *v13;
  IdentifierPath *v14;
  id v15;

  v15 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "nextFocusedIndexPath", a3));
  focusedIdentifierPath = self->_focusedIdentifierPath;
  self->_focusedIdentifierPath = 0;

  v7 = v15;
  if (v15)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineSectionController delegate](self, "delegate"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "sectionController:nodeSnapshotAtIndexPath:", self, v15));

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "identifierPath"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineSectionController sectionIdentifierPath](self, "sectionIdentifierPath"));
    v12 = objc_msgSend(v10, "hasPrefix:", v11);

    if (v12)
    {
      v13 = (IdentifierPath *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "identifierPath"));
      v14 = self->_focusedIdentifierPath;
      self->_focusedIdentifierPath = v13;

    }
    v7 = v15;
  }

}

- (id)collectionView:(id)a3 contextMenuConfigurationForItemsAtIndexPaths:(id)a4 point:(CGPoint)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD *v13;
  void *v14;
  void *v15;
  _QWORD v17[4];
  id v18;
  id v19;
  id location;

  v7 = a3;
  v8 = a4;
  if (objc_msgSend(v8, "count") == (id)1)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "firstObject"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineSectionController delegate](self, "delegate"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "sectionController:nodeSnapshotAtIndexPath:", self, v9));

    objc_initWeak(&location, self);
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_1003539DC;
    v17[3] = &unk_1011B28D8;
    objc_copyWeak(&v19, &location);
    v12 = v11;
    v18 = v12;
    v13 = objc_retainBlock(v17);
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "identifierPath"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIContextMenuConfiguration configurationWithIdentifier:previewProvider:actionProvider:](UIContextMenuConfiguration, "configurationWithIdentifier:previewProvider:actionProvider:", v14, 0, v13));

    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (id)collectionView:(id)a3 itemsForBeginningDragSession:(id)a4 atIndexPath:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  DragAndDropPreview *v17;
  void *v18;
  DragAndDropPreview *v19;
  DragAndDropPreview *dragAndDropPreview;
  void *v21;
  UIDragItem *v22;
  UIDragItem *dragItem;
  HomeDragLocalContext *v24;
  void *v25;
  UIDragItem *v27;

  v7 = a3;
  v8 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineSectionController delegate](self, "delegate"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "sectionController:nodeSnapshotAtIndexPath:", self, v8));

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "viewModel"));
  if (objc_msgSend(v11, "conformsToProtocol:", &OBJC_PROTOCOL___HomeCellModel))
    v12 = v11;
  else
    v12 = 0;
  v13 = v12;

  if (v13
    && (v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "homeDragAndDropObject"))) != 0
    && (v15 = (void *)v14,
        v16 = (void *)objc_claimAutoreleasedReturnValue(+[DragAndDropMapItem dragAndDropItemWithObject:](DragAndDropMapItem, "dragAndDropItemWithObject:", v14)), objc_msgSend(v16, "setObserver:", self), v15, v16))
  {
    v17 = [DragAndDropPreview alloc];
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "traitCollection"));
    v19 = -[DragAndDropPreview initWithDragAndDropMapItem:traitCollection:](v17, "initWithDragAndDropMapItem:traitCollection:", v16, v18);
    dragAndDropPreview = self->_dragAndDropPreview;
    self->_dragAndDropPreview = v19;

    -[DragAndDropPreview setContentUpdateDelegate:](self->_dragAndDropPreview, "setContentUpdateDelegate:", self);
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "itemProvider"));
    v22 = (UIDragItem *)objc_msgSend(objc_alloc((Class)UIDragItem), "initWithItemProvider:", v21);
    dragItem = self->_dragItem;
    self->_dragItem = v22;

    v24 = -[HomeDragLocalContext initWithItemSnapshot:dragAndDropMapItem:]([HomeDragLocalContext alloc], "initWithItemSnapshot:dragAndDropMapItem:", v10, v16);
    -[UIDragItem setLocalObject:](self->_dragItem, "setLocalObject:", v24);

    v27 = self->_dragItem;
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v27, 1));

  }
  else
  {
    v25 = &__NSArray0__struct;
  }

  return v25;
}

- (void)collectionView:(id)a3 dragSessionDidEnd:(id)a4
{
  UIDragItem *dragItem;
  DragAndDropPreview *dragAndDropPreview;

  dragItem = self->_dragItem;
  self->_dragItem = 0;

  -[DragAndDropPreview setContentUpdateDelegate:](self->_dragAndDropPreview, "setContentUpdateDelegate:", 0);
  dragAndDropPreview = self->_dragAndDropPreview;
  self->_dragAndDropPreview = 0;

}

- (NSArray)dataProviders
{
  return (NSArray *)&__NSArray0__struct;
}

- (MapsUIDiffableDataSourceViewModel)sectionHeaderViewModel
{
  return (MapsUIDiffableDataSourceViewModel *)-[SectionHeaderBasicOutlineCellModel initWithTitle:]([SectionHeaderBasicOutlineCellModel alloc], "initWithTitle:", &stru_1011EB268);
}

- (NSArray)itemSnapshots
{
  return (NSArray *)&__NSArray0__struct;
}

- (id)contextMenuForSnapshot:(id)a3
{
  return 0;
}

- (BOOL)persistsExpansions
{
  return 0;
}

- (NSDictionary)deletions
{
  return &self->_deletions->super;
}

- (NSSet)expandedIdentifierPaths
{
  return &self->_expandedIdentifierPaths->super;
}

- (HomeOutlineSectionControllerConfiguration)configuration
{
  return self->_configuration;
}

- (BOOL)active
{
  return self->_active;
}

- (IdentifierPath)sectionIdentifierPath
{
  return self->_sectionIdentifierPath;
}

- (IdentifierPath)focusedIdentifierPath
{
  return self->_focusedIdentifierPath;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_focusedIdentifierPath, 0);
  objc_storeStrong((id *)&self->_sectionIdentifierPath, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_dragAndDropPreview, 0);
  objc_storeStrong((id *)&self->_dragItem, 0);
  objc_storeStrong((id *)&self->_expandedIdentifierPaths, 0);
  objc_storeStrong((id *)&self->_identifierCache, 0);
  objc_storeStrong((id *)&self->_deletions, 0);
  objc_storeStrong((id *)&self->_sectionSnapshot, 0);
}

@end
