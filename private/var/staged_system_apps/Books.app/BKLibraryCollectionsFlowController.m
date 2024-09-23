@implementation BKLibraryCollectionsFlowController

- (BKLibraryCollectionsFlowController)initWithLibraryAssetProvider:(id)a3
{
  id v5;
  BKLibraryCollectionsFlowController *v6;
  BKLibraryCollectionsFlowController *v7;
  dispatch_queue_attr_t v8;
  NSObject *v9;
  dispatch_queue_t v10;
  OS_dispatch_queue *queue;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)BKLibraryCollectionsFlowController;
  v6 = -[BKLibraryCollectionsFlowController init](&v13, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_libraryAssetProvider, a3);
    v8 = dispatch_queue_attr_make_with_autorelease_frequency((dispatch_queue_attr_t)&_dispatch_queue_attr_concurrent, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    v10 = dispatch_queue_create("BKLibraryCollectionsFlowController.queue", v9);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v10;

  }
  return v7;
}

- (id)libraryCollectionListViewControllerWithAssetIDs:(id)a3 knownAssetTypes:(id)a4 knownStoreAssetIDs:(id)a5 containsSeriesContainer:(BOOL)a6 showDivider:(BOOL)a7
{
  _BOOL8 v7;
  _BOOL8 v8;
  id v12;
  id v13;
  id v14;
  BKLibraryCollectionsListViewController *v15;
  void *v16;
  void *v17;

  v7 = a7;
  v8 = a6;
  v12 = a5;
  v13 = a4;
  v14 = a3;
  v15 = -[BKLibraryCollectionsListViewController initWithSelectedBookIDs:knownAssetTypes:knownStoreAssetIDs:containsSeriesContainer:showDivider:]([BKLibraryCollectionsListViewController alloc], "initWithSelectedBookIDs:knownAssetTypes:knownStoreAssetIDs:containsSeriesContainer:showDivider:", v14, v13, v12, v8, v7);

  -[BKLibraryCollectionsListViewController setDelegate:](v15, "setDelegate:", self);
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager defaultManager](BKLibraryManager, "defaultManager"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "uiChildContext"));
  -[BKLibraryCollectionsListViewController setManagedObjectContext:](v15, "setManagedObjectContext:", v17);

  return v15;
}

- (void)collectionListView:(id)a3 cancelSelected:(BOOL)a4
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "bc_windowForViewController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "rootViewController"));

  v6 = v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "presentedViewController"));

  if (v7)
  {
    v12 = v6;
    do
    {
      v8 = v12;

      v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "presentedViewController"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "presentedViewController"));

      v6 = v8;
    }
    while (v9);
  }
  else
  {
    v12 = v6;
    v8 = v6;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "navigationController"));
  v11 = objc_msgSend(v10, "popToViewController:animated:", v8, 1);

}

- (void)collectionListView:(id)a3 collectionSelected:(id)a4
{
  id v5;
  id v6;

  v5 = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "collectionID"));
  objc_msgSend(v5, "bk_presentCollectionWithID:", v6);

}

- (void)collectionListView:(id)a3 addSelectedAssetIDs:(id)a4 toCollection:(id)a5 knownAssetTypes:(id)a6 animationDestination:(CGRect)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  NSObject *queue;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  BKLibraryCollectionsFlowController *v29;

  v11 = a3;
  v12 = a4;
  v13 = a6;
  v14 = a5;
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "collectionID"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "title"));

  queue = self->_queue;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_1000D9874;
  v23[3] = &unk_1008E9800;
  v24 = v12;
  v25 = v15;
  v26 = v13;
  v27 = v11;
  v28 = v16;
  v29 = self;
  v18 = v16;
  v19 = v11;
  v20 = v13;
  v21 = v15;
  v22 = v12;
  dispatch_async(queue, v23);

}

- (BOOL)collectionListView:(id)a3 collectionDeleted:(id)a4
{
  id v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;

  v4 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager defaultManager](BKLibraryManager, "defaultManager"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "collectionController"));
  v7 = objc_msgSend(v6, "deleteCollectionOnMainQueue:", v4);

  return v7;
}

- (id)collectionListView:(id)a3 alertControllerForDeletingCollection:(id)a4 completionHandler:(id)a5
{
  id v6;
  uint64_t v7;
  void *v8;
  __CFString *v9;
  __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  void *v27;
  void *v28;
  _QWORD v29[4];
  id v30;
  _QWORD v31[4];
  id v32;

  v6 = a5;
  v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "title"));
  v8 = (void *)v7;
  if (v7)
    v9 = (__CFString *)v7;
  else
    v9 = &stru_10091C438;
  v10 = v9;

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("…"), &stru_10091C438, 0));

  v27 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString stringByTruncatingToLength:options:truncationString:](v10, "stringByTruncatingToLength:options:truncationString:", 50, 3, v28));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("Delete Collection?"), &stru_10091C438, 0));

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("If you delete the collection “%@”, its content will remain in your library."), &stru_10091C438, 0));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v15, v27));

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("Delete"), &stru_10091C438, 0));

  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("Cancel"), &stru_10091C438, 0));

  v21 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v13, v16, 1));
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_1000DA51C;
  v31[3] = &unk_1008E90C0;
  v22 = v6;
  v32 = v22;
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v18, 2, v31));
  objc_msgSend(v21, "addAction:", v23);

  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_1000DA554;
  v29[3] = &unk_1008E90C0;
  v30 = v22;
  v24 = v22;
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v20, 1, v29));
  objc_msgSend(v21, "addAction:", v25);

  return v21;
}

- (id)sceneManager
{
  return +[BKAppDelegate sceneManager](BKAppDelegate, "sceneManager");
}

- (void)showLibraryWithTransaction:(id)a3
{
  -[BKLibraryCollectionsFlowController showLibraryWithTransaction:animated:completion:](self, "showLibraryWithTransaction:animated:completion:", a3, 0, 0);
}

- (void)showLibraryWithTransaction:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  id v6;
  _QWORD v7[5];
  id v8;
  BOOL v9;

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000DA630;
  v7[3] = &unk_1008E7388;
  v9 = a4;
  v7[4] = self;
  v8 = a5;
  v6 = v8;
  objc_msgSend(a3, "commit:", v7);

}

- (void)showLibraryWithTransaction:(id)a3 animated:(BOOL)a4 assetID:(id)a5 completion:(id)a6
{
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;
  BOOL v13;

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000DA7C8;
  v10[3] = &unk_1008E96C0;
  v13 = a4;
  v10[4] = self;
  v11 = a5;
  v12 = a6;
  v8 = v12;
  v9 = v11;
  objc_msgSend(a3, "commit:", v10);

}

- (void)showLibraryCollectionInPlaceWithTransaction:(id)a3 collectionID:(id)a4
{
  -[BKLibraryCollectionsFlowController showLibraryCollectionInPlaceWithTransaction:collectionID:replaceExistingPresentedCollection:](self, "showLibraryCollectionInPlaceWithTransaction:collectionID:replaceExistingPresentedCollection:", a3, a4, 0);
}

- (void)showLibraryCollectionInPlaceWithTransaction:(id)a3 collectionID:(id)a4 replaceExistingPresentedCollection:(BOOL)a5
{
  id v7;
  _QWORD v8[5];
  id v9;
  BOOL v10;

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000DA954;
  v8[3] = &unk_1008E7D78;
  v8[4] = self;
  v9 = a4;
  v10 = a5;
  v7 = v9;
  objc_msgSend(a3, "commit:", v8);

}

- (id)successfulAddFinishedBlock
{
  return self->successfulAddFinishedBlock;
}

- (void)setSuccessfulAddFinishedBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (BKLibraryAssetProvider)libraryAssetProvider
{
  return self->_libraryAssetProvider;
}

- (void)setLibraryAssetProvider:(id)a3
{
  objc_storeStrong((id *)&self->_libraryAssetProvider, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_libraryAssetProvider, 0);
  objc_storeStrong(&self->successfulAddFinishedBlock, 0);
}

@end
