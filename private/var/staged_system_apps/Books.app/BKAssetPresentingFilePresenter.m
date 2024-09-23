@implementation BKAssetPresentingFilePresenter

- (BKAssetPresentingFilePresenter)initWithViewController:(id)a3
{
  id v4;
  BKAssetPresentingFilePresenter *v5;
  BKAssetPresentingFilePresenter *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSURL *urlForPresentingBook;
  NSFileCoordinator *v12;
  NSFileCoordinator *bookCoordinator;
  id v14;
  NSURL *v15;
  void *v16;
  NSURL *v17;
  NSFileCoordinator *v18;
  void *v19;
  NSOperationQueue *v20;
  NSObject *v21;
  NSURL *v22;
  uint64_t v23;
  _QWORD v25[4];
  NSURL *v26;
  id v27;
  objc_super v28;
  void *v29;

  v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)BKAssetPresentingFilePresenter;
  v5 = -[BKAssetPresentingFilePresenter init](&v28, "init");
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_viewController, v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKAssetPresentingFilePresenter viewController](v6, "viewController"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "assetViewController"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "asset"));
    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "url"));
    urlForPresentingBook = v6->_urlForPresentingBook;
    v6->_urlForPresentingBook = (NSURL *)v10;

    v12 = objc_opt_new(NSFileCoordinator);
    bookCoordinator = v6->_bookCoordinator;
    v6->_bookCoordinator = v12;

    v14 = +[NSFileCoordinator addFilePresenter:](NSFileCoordinator, "addFilePresenter:", v6);
    v6->_active = 1;
    v15 = v6->_urlForPresentingBook;
    if (v15)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileAccessIntent readingIntentWithURL:options:](NSFileAccessIntent, "readingIntentWithURL:options:", v15, 0));
      v17 = v6->_urlForPresentingBook;
      v18 = v6->_bookCoordinator;
      v29 = v16;
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v29, 1));
      v20 = objc_opt_new(NSOperationQueue);
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472;
      v25[2] = sub_10019A0E4;
      v25[3] = &unk_1008EDBC8;
      v26 = v17;
      v27 = v16;
      v21 = v16;
      v22 = v17;
      -[NSFileCoordinator coordinateAccessWithIntents:queue:byAccessor:](v18, "coordinateAccessWithIntents:queue:byAccessor:", v19, v20, v25);

    }
    else
    {
      v23 = BCCurrentBookLog(v14);
      v21 = objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        sub_1006A3970(v21);
    }

  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  if (self->_active)
    +[NSFileCoordinator removeFilePresenter:](NSFileCoordinator, "removeFilePresenter:", self);
  v3.receiver = self;
  v3.super_class = (Class)BKAssetPresentingFilePresenter;
  -[BKAssetPresentingFilePresenter dealloc](&v3, "dealloc");
}

- (void)activate
{
  if (!self->_active)
  {
    self->_active = 1;
    +[NSFileCoordinator addFilePresenter:](NSFileCoordinator, "addFilePresenter:", self);
  }
}

- (void)deactivate
{
  if (self->_active)
  {
    self->_active = 0;
    +[NSFileCoordinator removeFilePresenter:](NSFileCoordinator, "removeFilePresenter:", self);
  }
}

- (NSURL)presentedItemURL
{
  return -[BKAssetPresentingFilePresenter urlForPresentingBook](self, "urlForPresentingBook");
}

- (NSOperationQueue)presentedItemOperationQueue
{
  return +[NSOperationQueue mainQueue](NSOperationQueue, "mainQueue");
}

- (void)accommodatePresentedItemDeletionWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKAssetPresentingFilePresenter viewController](self, "viewController"));
  objc_msgSend(v5, "im_dismissAnimated:immediate:", 0, 1);

  v7 = objc_retainBlock(v4);
  v6 = v7;
  if (v7)
  {
    (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);
    v6 = v7;
  }

}

- (BKBasePresentingViewController)viewController
{
  return (BKBasePresentingViewController *)objc_loadWeakRetained((id *)&self->_viewController);
}

- (NSURL)urlForPresentingBook
{
  return self->_urlForPresentingBook;
}

- (NSFileCoordinator)bookCoordinator
{
  return self->_bookCoordinator;
}

- (BOOL)active
{
  return self->_active;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bookCoordinator, 0);
  objc_storeStrong((id *)&self->_urlForPresentingBook, 0);
  objc_destroyWeak((id *)&self->_viewController);
}

@end
