@implementation FRArticleEditorialItemDownloader

- (FRArticleEditorialItemDownloader)initWithArticleController:(id)a3 dataProviderFactory:(id)a4 articleEditorialItemProvider:(id)a5 editorialItemEntryManager:(id)a6 thumbnailCreator:(id)a7 editorialItemCreator:(id)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  FRArticleEditorialItemDownloader *v20;
  FRArticleEditorialItemDownloader *v21;
  id obj;
  id v24;
  id v25;
  objc_super v26;

  v25 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  obj = a7;
  v18 = a7;
  v24 = a8;
  v19 = a8;
  if (!v15 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100080280();
    if (v17)
      goto LABEL_6;
  }
  else if (v17)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_1000801C8();
LABEL_6:
  if (!v16 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100080110();
    if (v18)
      goto LABEL_11;
  }
  else if (v18)
  {
    goto LABEL_11;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_100080058();
LABEL_11:
  if (!v19 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_10007FFA0();
  v26.receiver = self;
  v26.super_class = (Class)FRArticleEditorialItemDownloader;
  v20 = -[FRArticleEditorialItemDownloader init](&v26, "init");
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_articleController, a3);
    objc_storeStrong((id *)&v21->_flintDataProviderFactory, a4);
    objc_storeStrong((id *)&v21->_articleEditorialItemProvider, a5);
    objc_storeStrong((id *)&v21->_editorialItemEntryManager, a6);
    objc_storeStrong((id *)&v21->_thumbnailCreator, obj);
    objc_storeStrong((id *)&v21->_editorialItemCreator, v24);
  }

  return v21;
}

- (void)downloadEditorialItemWithIDs:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  void *i;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id obj;
  _QWORD block[4];
  id v20;
  _QWORD *v21;
  _QWORD v22[4];
  NSObject *v23;
  _QWORD *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _QWORD v29[5];
  id v30;
  _BYTE v31[128];

  v6 = a3;
  v7 = a4;
  v17 = v6;
  if (objc_msgSend(v6, "count"))
  {
    v16 = v7;
    v29[0] = 0;
    v29[1] = v29;
    v29[2] = 0x3032000000;
    v29[3] = sub_100018664;
    v29[4] = sub_100018554;
    v30 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    v8 = dispatch_group_create();
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    obj = v6;
    v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(_QWORD *)v26 != v10)
            objc_enumerationMutation(obj);
          v12 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)i);
          v13 = (void *)objc_claimAutoreleasedReturnValue(-[FRArticleEditorialItemDownloader editorialItemEntryManager](self, "editorialItemEntryManager"));
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "editorialItemsByID"));
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKey:", v12));

          dispatch_group_enter(v8);
          v22[0] = _NSConcreteStackBlock;
          v22[1] = 3221225472;
          v22[2] = sub_10005A92C;
          v22[3] = &unk_1000DD388;
          v24 = v29;
          v23 = v8;
          -[FRArticleEditorialItemDownloader downloadArticleWithArticleID:editorialItemFromCache:completion:](self, "downloadArticleWithArticleID:editorialItemFromCache:completion:", v12, v15, v22);

        }
        v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
      }
      while (v9);
    }

    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10005AA28;
    block[3] = &unk_1000DC830;
    v20 = v16;
    v21 = v29;
    dispatch_group_notify(v8, (dispatch_queue_t)&_dispatch_main_q, block);

    _Block_object_dispose(v29, 8);
    v7 = v16;
  }
  else if (v7)
  {
    (*((void (**)(id, void *))v7 + 2))(v7, &__NSDictionary0__struct);
  }

}

- (void)downloadArticleWithArticleID:(id)a3 editorialItemFromCache:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[FRArticleEditorialItemDownloader articleController](self, "articleController"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "articleWithID:forceArticleUpdate:qualityOfService:relativePriority:", v8, 1, 25, 1));

  objc_initWeak(&location, self);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10005ABF0;
  v17[3] = &unk_1000DD400;
  objc_copyWeak(&v22, &location);
  v13 = v12;
  v18 = v13;
  v14 = v10;
  v21 = v14;
  v15 = v9;
  v19 = v15;
  v16 = v8;
  v20 = v16;
  objc_msgSend(v13, "performBlockWhenContentIsLoaded:", v17);

  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);

}

- (void)loadArticleMetadataWithHeadline:(id)a3 editorialItemFromCache:(id)a4 content:(id)a5 articleModifiedDate:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  _QWORD v28[5];
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  uint8_t buf[4];
  void *v35;

  v12 = a4;
  v13 = a6;
  v14 = a7;
  v15 = a5;
  v16 = a3;
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "articleID"));
  v18 = FCDefaultLog;
  if (os_log_type_enabled(FCDefaultLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v35 = v17;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "ToC Editorial Manager: Download flint data initiated for articleID: %{public}@", buf, 0xCu);
  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[FRArticleEditorialItemDownloader flintDataProviderFactory](self, "flintDataProviderFactory"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "anfContent"));

  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "flintDataProviderForANFContent:headline:", v20, v16));
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_10005B268;
  v28[3] = &unk_1000DD4A0;
  v28[4] = self;
  v29 = v17;
  v30 = v12;
  v31 = v13;
  v32 = v21;
  v33 = v14;
  v22 = v21;
  v23 = v13;
  v24 = v12;
  v25 = v14;
  v26 = v17;
  v27 = objc_msgSend(v22, "loadContextWithCompletionBlock:", v28);

}

- (FRFlintDataProviderFactory)flintDataProviderFactory
{
  return self->_flintDataProviderFactory;
}

- (FCArticleController)articleController
{
  return self->_articleController;
}

- (FREditorialItemEntryManager)editorialItemEntryManager
{
  return self->_editorialItemEntryManager;
}

- (FRArticleEditorialItemProvider)articleEditorialItemProvider
{
  return self->_articleEditorialItemProvider;
}

- (FREditorialItemThumbnailCreator)thumbnailCreator
{
  return self->_thumbnailCreator;
}

- (FREditorialItemCreator)editorialItemCreator
{
  return self->_editorialItemCreator;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_editorialItemCreator, 0);
  objc_storeStrong((id *)&self->_thumbnailCreator, 0);
  objc_storeStrong((id *)&self->_articleEditorialItemProvider, 0);
  objc_storeStrong((id *)&self->_editorialItemEntryManager, 0);
  objc_storeStrong((id *)&self->_articleController, 0);
  objc_storeStrong((id *)&self->_flintDataProviderFactory, 0);
}

@end
