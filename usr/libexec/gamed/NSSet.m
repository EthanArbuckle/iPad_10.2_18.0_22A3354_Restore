@implementation NSSet

+ (id)_gkSetOfResourcesWithIDs:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "_gkMapWithBlock:", &stru_1002C2048));
  v6 = objc_msgSend((id)objc_opt_class(a1, v5), "setWithArray:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  return v7;
}

- (id)_gkResourcesWithIDs:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSSet _gkResourceWithID:](self, "_gkResourceWithID:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v10), (_QWORD)v13));
        objc_msgSend(v5, "addObject:", v11);

        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  return v5;
}

- (id)_gkResourceWithID:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  _QWORD block[4];
  id v9;

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000D8D60;
  block[3] = &unk_1002BBBD8;
  v9 = a3;
  v4 = qword_100317F40;
  v5 = v9;
  if (v4 != -1)
    dispatch_once(&qword_100317F40, block);
  objc_msgSend((id)qword_100317F38, "setResourceID:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSSet member:](self, "member:", qword_100317F38));

  return v6;
}

- (BOOL)_gkContainsObjectPassingPredicate:(id)a3
{
  id v4;
  _QWORD v6[4];
  id v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000D8E6C;
  v6[3] = &unk_1002C2070;
  v4 = a3;
  v7 = v4;
  v8 = &v9;
  -[NSSet enumerateObjectsUsingBlock:](self, "enumerateObjectsUsingBlock:", v6);
  LOBYTE(self) = *((_BYTE *)v10 + 24);

  _Block_object_dispose(&v9, 8);
  return (char)self;
}

- (id)_gkExpiredResources
{
  return -[NSSet objectsPassingTest:](self, "objectsPassingTest:", &stru_1002C20B0);
}

- (id)_gkInvalidResources
{
  return -[NSSet objectsPassingTest:](self, "objectsPassingTest:", &stru_1002C20D0);
}

- (id)_gkValidAndNonExpiredResources
{
  return -[NSSet objectsPassingTest:](self, "objectsPassingTest:", &stru_1002C20F0);
}

- (id)_gkInvalidOrExpiredResources
{
  return -[NSSet objectsPassingTest:](self, "objectsPassingTest:", &stru_1002C2110);
}

- (id)_gkAllRepresentedItems
{
  return -[NSSet _gkDistinctValuesForKeyPath:](self, "_gkDistinctValuesForKeyPath:", CFSTR("representedItem"));
}

- (id)_gkAllResourceIDs
{
  return -[NSSet _gkDistinctValuesForKeyPath:](self, "_gkDistinctValuesForKeyPath:", CFSTR("resourceID"));
}

- (BOOL)_gkContainsInvalidOrExpiredResource
{
  return -[NSSet _gkContainsObjectPassingPredicate:](self, "_gkContainsObjectPassingPredicate:", &stru_1002C2150);
}

- (BOOL)_gkContainsExpiredResource
{
  return -[NSSet _gkContainsObjectPassingPredicate:](self, "_gkContainsObjectPassingPredicate:", &stru_1002C2170);
}

- (BOOL)_gkContainsInvalidResource
{
  return -[NSSet _gkContainsObjectPassingPredicate:](self, "_gkContainsObjectPassingPredicate:", &stru_1002C2190);
}

@end
