@implementation BKLibraryDataSourceJaliscoPurchases

- (BKLibraryDataSourceJaliscoPurchases)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BKLibraryDataSourceJaliscoPurchases;
  return -[BKLibraryDataSourceJalisco initWithIdentifier:](&v3, "initWithIdentifier:", CFSTR("com.apple.ibooks.datasource.jalisco.purchases"));
}

- (void)fetchAssetIDsWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  uint64_t v21;
  NSObject *v22;
  id v23;
  BKLibraryDataSourceJaliscoPurchases *v24;
  objc_super v25;
  _QWORD v26[4];
  id v27;
  id v28;
  _QWORD v29[2];
  _QWORD v30[2];

  v4 = a3;
  kdebug_trace(725353716, 74, 0, 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[BLJaliscoDAAPClient sharedClient](BLJaliscoDAAPClient, "sharedClient"));

  if (v5)
  {
    v24 = self;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[BLJaliscoDAAPClient sharedClient](BLJaliscoDAAPClient, "sharedClient"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "predicateForItems:", 0));

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("expectedDate = %@"), v8));

    v10 = objc_alloc((Class)NSCompoundPredicate);
    v30[0] = v7;
    v30[1] = v9;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v30, 2));
    v12 = objc_msgSend(v10, "initWithType:subpredicates:", 1, v11);

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[BLJaliscoDAAPClient sharedClient](BLJaliscoDAAPClient, "sharedClient"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "predicateForBookletItems:", 0));

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("parentItem.expectedDate = %@"), v15));

    v17 = objc_alloc((Class)NSCompoundPredicate);
    v29[0] = v14;
    v29[1] = v16;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v29, 2));
    v19 = objc_msgSend(v17, "initWithType:subpredicates:", 1, v18);

    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_1001D9A88;
    v26[3] = &unk_1008E9D38;
    v27 = v12;
    v28 = v4;
    v25.receiver = v24;
    v25.super_class = (Class)BKLibraryDataSourceJaliscoPurchases;
    v20 = v12;
    -[BKLibraryDataSourceJalisco fetchAssetIDsWithPredicate:bookletPredicate:completion:](&v25, "fetchAssetIDsWithPredicate:bookletPredicate:completion:", v20, v19, v26);

  }
  else
  {
    kdebug_trace(725353716, 75, 0, 0, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSError bu_errorWithDomain:code:description:underlyingError:](NSError, "bu_errorWithDomain:code:description:underlyingError:", BLJaliscoDAAPClientErrorDomain, 3, CFSTR("Purchases assets fetch failed - jalisco client is nil"), 0));
    v21 = BKLibraryDataSourceJaliscoLog(v7);
    v22 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      sub_1006A5F1C();

    v23 = objc_retainBlock(v4);
    v9 = v23;
    if (v23)
      (*((void (**)(id, void *, void *))v23 + 2))(v23, &__NSArray0__struct, v7);
  }

}

@end
