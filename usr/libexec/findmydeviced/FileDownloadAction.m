@implementation FileDownloadAction

- (FileDownloadAction)initWithAsset:(id)a3 serverInteractionController:(id)a4 assetRegistry:(id)a5
{
  id v8;
  id v9;
  id v10;
  FileDownloadAction *v11;
  FileDownloadAction *v12;
  objc_super v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)FileDownloadAction;
  v11 = -[FileDownloadAction init](&v14, "init");
  v12 = v11;
  if (v11)
  {
    -[FileDownloadAction setAsset:](v11, "setAsset:", v8);
    -[FileDownloadAction setServerInteractionController:](v12, "setServerInteractionController:", v9);
    -[FileDownloadAction setAssetRegistry:](v12, "setAssetRegistry:", v10);
  }

  return v12;
}

- (id)actionType
{
  return CFSTR("FileDownloadAction");
}

- (void)runWithCompletion:(id)a3
{
  id v4;
  FMFileDownloadRequest *v5;
  void *v6;
  FMFileDownloadRequest *v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id location;

  v4 = a3;
  v5 = [FMFileDownloadRequest alloc];
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FileDownloadAction asset](self, "asset"));
  v7 = -[FMFileDownloadRequest initWithAsset:](v5, "initWithAsset:", v6);

  objc_initWeak(&location, self);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10001EF38;
  v10[3] = &unk_1002C1E30;
  objc_copyWeak(&v12, &location);
  v8 = v4;
  v11 = v8;
  -[FMDRequest setCompletionHandler:](v7, "setCompletionHandler:", v10);
  -[FileDownloadAction setRequest:](self, "setRequest:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[FileDownloadAction serverInteractionController](self, "serverInteractionController"));
  objc_msgSend(v9, "enqueueRequest:", v7);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

}

- (void)_saveAsset:(id)a3 fromLocation:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    v8 = objc_claimAutoreleasedReturnValue(-[FileDownloadAction assetRegistry](self, "assetRegistry"));
    -[NSObject storeAsset:fromLocation:](v8, "storeAsset:fromLocation:", v6, v7);
  }
  else
  {
    v9 = sub_1000031B8();
    v8 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_1002267D4(v8);
  }

}

- (void)willCancelAction
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[FileDownloadAction serverInteractionController](self, "serverInteractionController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FileDownloadAction request](self, "request"));
  objc_msgSend(v4, "cancelRequest:", v3);

}

- (BOOL)shouldWaitForAction:(id)a3
{
  return 0;
}

- (BOOL)shouldCancelAction:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned __int8 v13;

  v4 = a3;
  v6 = objc_opt_class(self, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "asset"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "url"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "absoluteString"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[FileDownloadAction asset](self, "asset"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "url"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "absoluteString"));
    v13 = objc_msgSend(v9, "isEqualToString:", v12);

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (FMDAsset)asset
{
  return self->_asset;
}

- (void)setAsset:(id)a3
{
  objc_storeStrong((id *)&self->_asset, a3);
}

- (FMDServerInteractionController)serverInteractionController
{
  return (FMDServerInteractionController *)objc_loadWeakRetained((id *)&self->_serverInteractionController);
}

- (void)setServerInteractionController:(id)a3
{
  objc_storeWeak((id *)&self->_serverInteractionController, a3);
}

- (FMDAssetRegistry)assetRegistry
{
  return self->_assetRegistry;
}

- (void)setAssetRegistry:(id)a3
{
  objc_storeStrong((id *)&self->_assetRegistry, a3);
}

- (FMFileDownloadRequest)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
  objc_storeStrong((id *)&self->_request, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_assetRegistry, 0);
  objc_destroyWeak((id *)&self->_serverInteractionController);
  objc_storeStrong((id *)&self->_asset, 0);
}

@end
