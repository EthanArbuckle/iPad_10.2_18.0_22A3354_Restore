@implementation BKLibraryDataSourcePlistSampleBooks

- (BOOL)wantsPlistEntry:(id)a3
{
  void *v3;
  unsigned __int8 v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[IMLibraryPlist isSampleFromPlistEntry:](IMLibraryPlist, "isSampleFromPlistEntry:", a3));
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (void)fetchAssetIDsWithCompletion:(id)a3
{
  id v3;
  objc_super v4;
  _QWORD v5[4];
  BKLibraryDataSourcePlistSampleBooks *v6;
  id v7;

  v5[1] = 3221225472;
  v5[2] = sub_1000C5460;
  v5[3] = &unk_1008E9D38;
  v6 = self;
  v7 = a3;
  v4.receiver = v6;
  v4.super_class = (Class)BKLibraryDataSourcePlistSampleBooks;
  v5[0] = _NSConcreteStackBlock;
  v3 = v7;
  -[BKLibraryDataSourcePlist fetchAssetIDsWithCompletion:](&v4, "fetchAssetIDsWithCompletion:", v5);

}

- (void)fetchAssetsWithIDs:(id)a3 completion:(id)a4
{
  id v5;
  void *v6;
  char *v7;
  char *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;

  v12 = a3;
  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v7 = (char *)objc_msgSend(v12, "count");
  if (v7)
  {
    v8 = v7;
    do
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
      objc_msgSend(v6, "addObject:", v9);

      --v8;
    }
    while (v8);
  }
  v10 = objc_retainBlock(v5);
  v11 = v10;
  if (v10)
    (*((void (**)(id, void *, _QWORD))v10 + 2))(v10, v6, 0);

}

- (BOOL)replacesSampleBooks
{
  return 0;
}

@end
