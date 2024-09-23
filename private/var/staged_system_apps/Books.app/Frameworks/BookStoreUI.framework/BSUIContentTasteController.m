@implementation BSUIContentTasteController

+ (id)getInstance
{
  return +[BSUIContentTasteController sharedController](BSUIContentTasteController, "sharedController");
}

+ (BSUIContentTasteController)sharedController
{
  if (qword_32BF90 != -1)
    dispatch_once(&qword_32BF90, &stru_2E4338);
  return (BSUIContentTasteController *)(id)qword_32BF88;
}

- (BSUIContentTasteController)init
{
  BSUIContentTasteController *v2;
  BUCoalescingCallBlock *v3;
  BUCoalescingCallBlock *syncTastesCallBlock;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BSUIContentTasteController;
  v2 = -[BSUIContentTasteController init](&v6, "init");
  if (v2)
  {
    v3 = (BUCoalescingCallBlock *)objc_msgSend(objc_alloc((Class)BUCoalescingCallBlock), "initWithNotifyBlock:blockDescription:", &stru_2E4378, CFSTR("BSUIContentTasteController"));
    syncTastesCallBlock = v2->_syncTastesCallBlock;
    v2->_syncTastesCallBlock = v3;

    -[BUCoalescingCallBlock setCoalescingDelay:](v2->_syncTastesCallBlock, "setCoalescingDelay:", 0.5);
  }
  return v2;
}

- (void)tastesForStoreUploading:(id)a3
{
  id v4;
  _QWORD v5[4];
  id v6;

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_DFF0;
  v5[3] = &unk_2E43A0;
  v6 = a3;
  v4 = v6;
  -[BSUIContentTasteController fetchTastesForStoreUploading:](self, "fetchTastesForStoreUploading:", v5);

}

- (void)tastesUploadedToStore:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (objc_msgSend(v5, "isObject"))
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "toDictionary"));
  else
    v4 = 0;
  -[BSUIContentTasteController tastesUploadedToStore:completion:](self, "tastesUploadedToStore:completion:", v4, 0);

}

- (void)fetchTasteTypeForStoreID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id location;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[BCCloudAssetManager sharedManager](BCCloudAssetManager, "sharedManager"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "assetDetailManager"));

  if (v9)
  {
    objc_initWeak(&location, self);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_E280;
    v12[3] = &unk_2E43C8;
    objc_copyWeak(&v14, &location);
    v13 = v7;
    objc_msgSend(v9, "assetDetailForAssetID:completion:", v6, v12);

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
  else
  {
    v10 = objc_retainBlock(v7);
    v11 = v10;
    if (v10)
      (*((void (**)(id, _QWORD, _QWORD))v10 + 2))(v10, 0, 0);

  }
}

- (void)setTasteType:(unint64_t)a3 forStoreID:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  id v18[2];
  id location;

  v8 = a4;
  v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[BCCloudAssetManager sharedManager](BCCloudAssetManager, "sharedManager"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "assetDetailManager"));

  if (v11)
  {
    objc_initWeak(&location, self);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_E52C;
    v14[3] = &unk_2E4438;
    v15 = v8;
    objc_copyWeak(v18, &location);
    v18[1] = (id)a3;
    v16 = v11;
    v17 = v9;
    objc_msgSend(v16, "assetDetailForAssetID:completion:", v15, v14);

    objc_destroyWeak(v18);
    objc_destroyWeak(&location);
  }
  else
  {
    v12 = objc_retainBlock(v9);
    v13 = v12;
    if (v12)
      (*((void (**)(id, _QWORD))v12 + 2))(v12, 0);

  }
}

- (void)setExplicitlyDeclined:(BOOL)a3 forStoreID:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  BSUIContentTasteController *v16;
  id v17;
  id v18;
  id v19;
  BOOL v20;
  id location;

  v8 = a4;
  v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[BCCloudAssetManager sharedManager](BCCloudAssetManager, "sharedManager"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "assetDetailManager"));

  if (v11)
  {
    objc_initWeak(&location, self);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_E984;
    v14[3] = &unk_2E4480;
    v15 = v8;
    objc_copyWeak(&v19, &location);
    v16 = self;
    v20 = a3;
    v17 = v11;
    v18 = v9;
    objc_msgSend(v17, "assetDetailForAssetID:completion:", v15, v14);

    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }
  else
  {
    v12 = objc_retainBlock(v9);
    v13 = v12;
    if (v12)
      (*((void (**)(id, _QWORD))v12 + 2))(v12, 0);

  }
}

- (void)fetchTastesForStoreUploading:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[BCCloudAssetManager sharedManager](BCCloudAssetManager, "sharedManager"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "assetDetailManager"));

  if (v6)
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_ED40;
    v9[3] = &unk_2E44A8;
    v9[4] = self;
    v10 = v4;
    objc_msgSend(v6, "fetchAssetDetailsForUnsyncedTastes:", v9);

  }
  else
  {
    v7 = objc_retainBlock(v4);
    v8 = v7;
    if (v7)
      (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);

  }
}

- (void)tastesUploadedToStore:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  BSUIContentTasteController *v15;
  id v16;
  id v17;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[BCCloudAssetManager sharedManager](BCCloudAssetManager, "sharedManager"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "assetDetailManager"));

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "allKeys"));
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_F064;
    v13[3] = &unk_2E44F8;
    v14 = v6;
    v15 = self;
    v16 = v9;
    v17 = v7;
    objc_msgSend(v16, "assetDetailsForAssetIDs:completion:", v10, v13);

  }
  else
  {
    v11 = objc_retainBlock(v7);
    v12 = v11;
    if (v11)
      (*((void (**)(id, _QWORD))v11 + 2))(v11, 0);

  }
}

- (BOOL)_explicitlyDeclinedFromTasteInteger:(signed __int16)a3
{
  return (a3 >> 2) & 1;
}

- (unint64_t)_loveOrHateFromTasteInteger:(signed __int16)a3
{
  return a3 & 3;
}

- (signed)_tasteIntegerFromTasteType:(unint64_t)a3 explicitlyDeclined:(BOOL)a4
{
  __int16 v4;

  if (a4)
    v4 = 4;
  else
    v4 = 0;
  return v4 | a3;
}

- (BUCoalescingCallBlock)syncTastesCallBlock
{
  return self->_syncTastesCallBlock;
}

- (void)setSyncTastesCallBlock:(id)a3
{
  objc_storeStrong((id *)&self->_syncTastesCallBlock, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncTastesCallBlock, 0);
}

@end
