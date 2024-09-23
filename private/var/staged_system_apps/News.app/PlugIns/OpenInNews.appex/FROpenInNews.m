@implementation FROpenInNews

- (void)beginRequestWithExtensionContext:(id)a3
{
  NSObject *v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  id *v14;
  id v15;
  id v17;
  id obj;
  uint64_t v19;
  id v20;
  uint64_t v21;
  _QWORD block[5];
  id v23;
  _QWORD *v24;
  _QWORD v25[4];
  _QWORD v26[2];
  _QWORD v27[4];
  _QWORD v28[2];
  _QWORD v29[4];
  _QWORD v30[2];
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _QWORD v39[5];
  id v40;
  _QWORD v41[5];
  id v42;
  _QWORD v43[5];
  id v44;
  _BYTE v45[128];
  _BYTE v46[128];

  v17 = a3;
  objc_storeStrong((id *)&self->_extensionContext, a3);
  v43[0] = 0;
  v43[1] = v43;
  v43[2] = 0x3032000000;
  v43[3] = sub_100002620;
  v43[4] = sub_100002630;
  v44 = 0;
  v41[0] = 0;
  v41[1] = v41;
  v41[2] = 0x3032000000;
  v41[3] = sub_100002620;
  v41[4] = sub_100002630;
  v42 = 0;
  v39[0] = 0;
  v39[1] = v39;
  v39[2] = 0x3032000000;
  v39[3] = sub_100002620;
  v39[4] = sub_100002630;
  v40 = 0;
  v4 = dispatch_group_create();
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "inputItems"));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v35, v46, 16);
  obj = v5;
  if (v6)
  {
    v19 = *(_QWORD *)v36;
    do
    {
      v7 = 0;
      v20 = v6;
      do
      {
        if (*(_QWORD *)v36 != v19)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * v7);
        v31 = 0u;
        v32 = 0u;
        v33 = 0u;
        v34 = 0u;
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "attachments"));
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v31, v45, 16);
        v21 = v7;
        if (v10)
        {
          v11 = *(_QWORD *)v32;
          do
          {
            for (i = 0; i != v10; i = (char *)i + 1)
            {
              if (*(_QWORD *)v32 != v11)
                objc_enumerationMutation(v9);
              v13 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * (_QWORD)i);
              if (objc_msgSend(v13, "hasItemConformingToTypeIdentifier:", kUTTypeURL))
              {
                dispatch_group_enter(v4);
                v29[0] = _NSConcreteStackBlock;
                v29[1] = 3221225472;
                v29[2] = sub_100002638;
                v29[3] = &unk_100008328;
                v30[1] = v41;
                v30[0] = v4;
                objc_msgSend(v13, "loadItemForTypeIdentifier:options:completionHandler:", kUTTypeURL, 0, v29);
                v14 = (id *)v30;
              }
              else if (objc_msgSend(v13, "hasItemConformingToTypeIdentifier:", kUTTypePlainText))
              {
                dispatch_group_enter(v4);
                v27[0] = _NSConcreteStackBlock;
                v27[1] = 3221225472;
                v27[2] = sub_1000026A4;
                v27[3] = &unk_100008350;
                v28[1] = v43;
                v28[0] = v4;
                objc_msgSend(v13, "loadItemForTypeIdentifier:options:completionHandler:", kUTTypePlainText, 0, v27);
                v14 = (id *)v28;
              }
              else
              {
                if (!objc_msgSend(v13, "hasItemConformingToTypeIdentifier:", CFSTR("FRRSSFeedURL")))
                  continue;
                dispatch_group_enter(v4);
                v25[0] = _NSConcreteStackBlock;
                v25[1] = 3221225472;
                v25[2] = sub_100002710;
                v25[3] = &unk_100008328;
                v26[1] = v39;
                v26[0] = v4;
                objc_msgSend(v13, "loadItemForTypeIdentifier:options:completionHandler:", CFSTR("FRRSSFeedURL"), 0, v25);
                v14 = (id *)v26;
              }

            }
            v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v31, v45, 16);
          }
          while (v10);
        }

        v7 = v21 + 1;
      }
      while ((id)(v21 + 1) != v20);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v46, 16);
    }
    while (v6);
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000277C;
  block[3] = &unk_100008378;
  v24 = v41;
  block[4] = self;
  v23 = v17;
  v15 = v17;
  dispatch_group_notify(v4, (dispatch_queue_t)&_dispatch_main_q, block);

  _Block_object_dispose(v39, 8);
  _Block_object_dispose(v41, 8);

  _Block_object_dispose(v43, 8);
}

- (FCCoreConfigurationManager)configurationManager
{
  uint64_t v3;
  uint64_t v4;
  id v5;
  FCCoreConfigurationManager *v6;
  _QWORD block[4];
  id v9;

  v3 = FCURLForContainerizedUserAccountCachesDirectory(1, a2);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000028BC;
  block[3] = &unk_1000083A0;
  v9 = (id)objc_claimAutoreleasedReturnValue(v3);
  v4 = qword_10000D788;
  v5 = v9;
  if (v4 != -1)
    dispatch_once(&qword_10000D788, block);
  objc_storeStrong((id *)&self->_configurationManager, (id)qword_10000D780);
  v6 = self->_configurationManager;

  return v6;
}

- (void)_openNewsArticleWithURL:(id)a3
{
  id v4;
  FROpenInNewsManager *v5;
  void *v6;
  void *v7;
  FROpenInNewsManager *v8;
  _QWORD v9[5];

  v4 = a3;
  v5 = [FROpenInNewsManager alloc];
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FROpenInNews configurationManager](self, "configurationManager"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[FCNetworkReachability sharedNetworkReachability](FCNetworkReachability, "sharedNetworkReachability"));
  v8 = -[FROpenInNewsManager initWithConfigurationManager:networkReachability:](v5, "initWithConfigurationManager:networkReachability:", v6, v7);

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100002A24;
  v9[3] = &unk_1000083A0;
  v9[4] = self;
  -[FROpenInNewsManager openArticleWithURL:completion:](v8, "openArticleWithURL:completion:", v4, v9);

}

- (void)setConfigurationManager:(id)a3
{
  objc_storeStrong((id *)&self->_configurationManager, a3);
}

- (NSURL)cachesDirectory
{
  return self->_cachesDirectory;
}

- (void)setCachesDirectory:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSURL)archiveFileURL
{
  return self->_archiveFileURL;
}

- (void)setArchiveFileURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSExtensionContext)extensionContext
{
  return self->_extensionContext;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extensionContext, 0);
  objc_storeStrong((id *)&self->_archiveFileURL, 0);
  objc_storeStrong((id *)&self->_cachesDirectory, 0);
  objc_storeStrong((id *)&self->_configurationManager, 0);
}

@end
