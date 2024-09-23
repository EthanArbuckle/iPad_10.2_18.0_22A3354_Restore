@implementation MCDBrowserIdentifiers

+ (id)sharedInstance
{
  if (qword_1011ECAB0 != -1)
    dispatch_once(&qword_1011ECAB0, &stru_1010A8D90);
  return (id)qword_1011ECAA8;
}

- (BOOL)_identifiersDidChange
{
  void *v3;
  NSArray *v4;
  id v5;
  uint64_t v6;
  void *v7;
  NSSet *v8;
  id v9;
  void *v10;
  uint64_t v11;
  unsigned int v12;
  NSArray *orderedIdentifiers;
  NSArray *v14;
  NSSet *activeIdentifiers;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v4 = (NSArray *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "libraryMenuOrderedIdentifiers"));

  if (!-[NSArray count](v4, "count"))
  {
    v5 = sub_100011024();
    v6 = objc_claimAutoreleasedReturnValue(v5);

    v4 = (NSArray *)v6;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v8 = (NSSet *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "libraryMenuSelectedIdentifiers"));

  if (!-[NSSet count](v8, "count"))
  {
    v9 = sub_100011024();
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v11 = objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v10));

    v8 = (NSSet *)v11;
  }
  if (-[NSArray isEqualToArray:](v4, "isEqualToArray:", self->_orderedIdentifiers))
    v12 = !-[NSSet isEqualToSet:](v8, "isEqualToSet:", self->_activeIdentifiers);
  else
    LOBYTE(v12) = 1;
  orderedIdentifiers = self->_orderedIdentifiers;
  self->_orderedIdentifiers = v4;
  v14 = v4;

  activeIdentifiers = self->_activeIdentifiers;
  self->_activeIdentifiers = v8;

  return v12;
}

- (BOOL)shouldShowCellForIdentifier:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;

  if (!a3)
    return 0;
  v3 = a3;
  v4 = sub_100011188();
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "allKeys"));
  v7 = objc_msgSend(v6, "containsObject:", v3);

  return v7;
}

+ (id)symbolImageForIdentifier:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;

  v3 = qword_1011ECAC0;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&qword_1011ECAC0, &stru_1010A8DB0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_1011ECAB8, "objectForKeyedSubscript:", v4));

  return v5;
}

- (void)_updateCellIdentifiersOrdering
{
  void *v3;
  NSArray *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  uint64_t v9;
  NSMutableArray *v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *j;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v4 = self->_orderedIdentifiers;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v22 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i);
        if (-[NSSet containsObject:](self->_activeIdentifiers, "containsObject:", v9))
          objc_msgSend(v3, "addObject:", v9);
      }
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v6);
  }

  v10 = objc_opt_new(NSMutableArray);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v11 = v3;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v18;
    do
    {
      for (j = 0; j != v13; j = (char *)j + 1)
      {
        if (*(_QWORD *)v18 != v14)
          objc_enumerationMutation(v11);
        v16 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)j);
        if (-[MCDBrowserIdentifiers shouldShowCellForIdentifier:](self, "shouldShowCellForIdentifier:", v16, (_QWORD)v17))
        {
          -[NSMutableArray addObject:](v10, "addObject:", v16);
        }
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    }
    while (v13);
  }

  -[MCDBrowserIdentifiers setCellIdentifiers:](self, "setCellIdentifiers:", v10);
}

- (NSArray)cellIdentifiers
{
  return self->_cellIdentifiers;
}

- (void)setCellIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_cellIdentifiers, a3);
}

- (NSArray)orderedIdentifiers
{
  return self->_orderedIdentifiers;
}

- (void)setOrderedIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_orderedIdentifiers, a3);
}

- (NSSet)activeIdentifiers
{
  return self->_activeIdentifiers;
}

- (void)setActiveIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_activeIdentifiers, a3);
}

- (double)maxImageWidth
{
  return self->_maxImageWidth;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeIdentifiers, 0);
  objc_storeStrong((id *)&self->_orderedIdentifiers, 0);
  objc_storeStrong((id *)&self->_cellIdentifiers, 0);
}

@end
