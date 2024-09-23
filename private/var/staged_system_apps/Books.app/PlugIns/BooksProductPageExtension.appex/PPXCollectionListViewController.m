@implementation PPXCollectionListViewController

- (PPXCollectionListViewController)initWithAssetID:(id)a3 isPurchased:(BOOL)a4 isAudiobook:(BOOL)a5
{
  id v8;
  PPXCollectionListViewController *v9;
  NSString *v10;
  NSString *assetID;
  objc_super v13;

  v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PPXCollectionListViewController;
  v9 = -[PPXCollectionListViewController init](&v13, "init");
  if (v9)
  {
    v10 = (NSString *)objc_msgSend(v8, "copy");
    assetID = v9->_assetID;
    v9->_assetID = v10;

    v9->_isPurchased = a4;
    v9->_isAudiobook = a5;
  }

  return v9;
}

- (void)loadView
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("Add to Collection"), &stru_10002E1D8, 0));
  -[PPXCollectionListViewController setTitle:](self, "setTitle:", v4);

  v5 = objc_alloc_init((Class)UITableView);
  objc_msgSend(v5, "setDelegate:", self);
  objc_msgSend(v5, "setDataSource:", self);
  -[PPXCollectionListViewController setView:](self, "setView:", v5);
  -[PPXCollectionListViewController _updateCollections](self, "_updateCollections");

}

- (void)_updateCollections
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[BCCloudCollectionsManager sharedManager](BCCloudCollectionsManager, "sharedManager"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "collectionDetailManager"));

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100003BC0;
  v4[3] = &unk_10002D188;
  objc_copyWeak(&v5, &location);
  objc_msgSend(v3, "fetchCollectionDetailsIncludingDeleted:completion:", 0, v4);
  objc_destroyWeak(&v5);

  objc_destroyWeak(&location);
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v4;
  id v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PPXCollectionListViewController collectionDetailsCache](self, "collectionDetailsCache", a3, a4));
  v5 = objc_msgSend(v4, "count");

  return (int64_t)v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = a4;
  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "dequeueReusableCellWithIdentifier:", CFSTR("PPXCollectionListCell")));
  if (!v7)
    v7 = objc_msgSend(objc_alloc((Class)UITableViewCell), "initWithStyle:reuseIdentifier:", 0, CFSTR("PPXCollectionListCell"));
  v8 = objc_msgSend(v6, "row");
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[PPXCollectionListViewController collectionDetailsCache](self, "collectionDetailsCache"));
  if (v8 >= objc_msgSend(v9, "count"))
    v10 = 0;
  else
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndex:", v8));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "name"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "textLabel"));
  objc_msgSend(v12, "setText:", v11);

  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void **v13;
  uint64_t v14;
  void (*v15)(uint64_t, int);
  void *v16;
  id v17;
  PPXCollectionListViewController *v18;
  id v19;
  id v20;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PPXCollectionListViewController assetID](self, "assetID"));
  if (v6)
  {
    v7 = objc_msgSend(v5, "row");
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[PPXCollectionListViewController collectionDetailsCache](self, "collectionDetailsCache"));
    if (v7 < objc_msgSend(v8, "count"))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndex:", v7));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "collectionID"));
      if (v10)
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[PPXCollectionListViewController ba_effectiveAnalyticsTracker](self, "ba_effectiveAnalyticsTracker"));
        v13 = _NSConcreteStackBlock;
        v14 = 3221225472;
        v15 = sub_10000414C;
        v16 = &unk_10002D1B0;
        v17 = v6;
        v18 = self;
        v19 = v11;
        v20 = v10;
        v12 = v11;
        +[BDSServiceCenter addStoreID:toCollectionID:completion:](BDSServiceCenter, "addStoreID:toCollectionID:completion:", v17, v20, &v13);

      }
    }

  }
  -[PPXCollectionListViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0, v13, v14, v15, v16);

}

- (NSArray)collectionDetailsCache
{
  return self->_collectionDetailsCache;
}

- (void)setCollectionDetailsCache:(id)a3
{
  objc_storeStrong((id *)&self->_collectionDetailsCache, a3);
}

- (NSString)assetID
{
  return self->_assetID;
}

- (void)setAssetID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (BOOL)isPurchased
{
  return self->_isPurchased;
}

- (void)setIsPurchased:(BOOL)a3
{
  self->_isPurchased = a3;
}

- (BOOL)isAudiobook
{
  return self->_isAudiobook;
}

- (void)setIsAudiobook:(BOOL)a3
{
  self->_isAudiobook = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetID, 0);
  objc_storeStrong((id *)&self->_collectionDetailsCache, 0);
}

@end
