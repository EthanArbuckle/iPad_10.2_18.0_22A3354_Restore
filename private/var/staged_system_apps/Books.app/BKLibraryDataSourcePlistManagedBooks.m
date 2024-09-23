@implementation BKLibraryDataSourcePlistManagedBooks

- (void)managedBooksDidChange
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourcePlist libraryManager](self, "libraryManager"));
  objc_msgSend(v3, "reloadDataSource:completion:", self, 0);

}

- (BOOL)wantsPlistEntry:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;
  BOOL v11;
  void *v12;

  v4 = a3;
  v5 = objc_opt_class(NSString);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("FullPath")));

  v7 = BUDynamicCast(v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  if (!v8)
    goto LABEL_5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourcePlist fileManager](self, "fileManager"));
  v10 = objc_msgSend(v9, "fileExistsAtPath:", v8);

  if ((v10 & 1) == 0)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourcePlistManagedBooks pathsOfMissingAssets](self, "pathsOfMissingAssets"));
    objc_msgSend(v12, "addObject:", v8);

LABEL_5:
    v11 = 0;
    goto LABEL_6;
  }
  v11 = 1;
LABEL_6:

  return v11;
}

- (void)q_willJoinPlistContentsOnFetch
{
  id v3;

  -[BKLibraryDataSourcePlistManagedBooks setFetchGeneration:](self, "setFetchGeneration:", (char *)-[BKLibraryDataSourcePlistManagedBooks fetchGeneration](self, "fetchGeneration") + 1);
  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  -[BKLibraryDataSourcePlistManagedBooks setPathsOfMissingAssets:](self, "setPathsOfMissingAssets:", v3);

}

- (void)q_didJoinPlistContentsOnFetch
{
  void *v3;
  id v4;
  NSObject *v5;
  dispatch_time_t v6;
  _QWORD block[5];
  id v8;
  id location;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourcePlistManagedBooks pathsOfMissingAssets](self, "pathsOfMissingAssets"));
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    v5 = objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourcePlist assetsQueue](self, "assetsQueue"));
    -[BKLibraryDataSourcePlistManagedBooks setPollSeconds:](self, "setPollSeconds:", 1);
    v6 = dispatch_time(0, 1000000000 * -[BKLibraryDataSourcePlistManagedBooks pollSeconds](self, "pollSeconds"));
    objc_initWeak(&location, self);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100143464;
    block[3] = &unk_1008EAF88;
    objc_copyWeak(&v8, &location);
    block[4] = self;
    dispatch_after(v6, v5, block);
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);

  }
}

- (id)q_pathsOfStillMissingAssets
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourcePlistManagedBooks pathsOfMissingAssets](self, "pathsOfMissingAssets"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100143554;
  v8[3] = &unk_1008EBF90;
  v8[4] = self;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "indexesOfObjectsPassingTest:", v8));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourcePlistManagedBooks pathsOfMissingAssets](self, "pathsOfMissingAssets"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectsAtIndexes:", v4));

  return v6;
}

- (void)q_pollStorageForMissingFilesWithGeneration:(int64_t)a3
{
  void *v5;
  dispatch_time_t v6;
  NSObject *v7;
  _QWORD block[4];
  id v9[2];
  id location;

  if (-[BKLibraryDataSourcePlistManagedBooks fetchGeneration](self, "fetchGeneration") == a3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourcePlistManagedBooks q_pathsOfStillMissingAssets](self, "q_pathsOfStillMissingAssets"));
    if (objc_msgSend(v5, "count"))
    {
      -[BKLibraryDataSourcePlistManagedBooks setPollSeconds:](self, "setPollSeconds:", 2 * -[BKLibraryDataSourcePlistManagedBooks pollSeconds](self, "pollSeconds"));
      if (-[BKLibraryDataSourcePlistManagedBooks pollSeconds](self, "pollSeconds") <= 600)
      {
        v6 = dispatch_time(0, 1000000000 * -[BKLibraryDataSourcePlistManagedBooks pollSeconds](self, "pollSeconds"));
        objc_initWeak(&location, self);
        v7 = objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourcePlist assetsQueue](self, "assetsQueue"));
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_1001436F4;
        block[3] = &unk_1008EBFB8;
        objc_copyWeak(v9, &location);
        v9[1] = (id)a3;
        dispatch_after(v6, v7, block);

        objc_destroyWeak(v9);
        objc_destroyWeak(&location);
      }
    }
    else
    {
      -[BKLibraryDataSourcePlistManagedBooks managedBooksDidChange](self, "managedBooksDidChange");
    }

  }
}

- (NSMutableArray)pathsOfMissingAssets
{
  return self->_pathsOfMissingAssets;
}

- (void)setPathsOfMissingAssets:(id)a3
{
  objc_storeStrong((id *)&self->_pathsOfMissingAssets, a3);
}

- (int64_t)pollSeconds
{
  return self->_pollSeconds;
}

- (void)setPollSeconds:(int64_t)a3
{
  self->_pollSeconds = a3;
}

- (int64_t)fetchGeneration
{
  return self->_fetchGeneration;
}

- (void)setFetchGeneration:(int64_t)a3
{
  self->_fetchGeneration = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pathsOfMissingAssets, 0);
}

@end
