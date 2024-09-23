@implementation BKResolveAssetForImportOperation

- (BKResolveAssetForImportOperation)initWithURL:(id)a3
{
  id v5;
  BKResolveAssetForImportOperation *v6;
  BKResolveAssetForImportOperation *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSURL *inboxURL;
  NSURL *v12;
  unsigned __int8 v13;
  id v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  id v19;
  objc_super v20;

  v5 = a3;
  v20.receiver = self;
  v20.super_class = (Class)BKResolveAssetForImportOperation;
  v6 = -[BKResolveAssetForImportOperation init](&v20, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_originalURL, a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "URLForDirectory:inDomain:appropriateForURL:create:error:", 13, 1, 0, 1, 0));
    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "URLByAppendingPathComponent:", CFSTR("Inbox")));
    inboxURL = v7->_inboxURL;
    v7->_inboxURL = (NSURL *)v10;

    v12 = v7->_inboxURL;
    v19 = 0;
    v13 = objc_msgSend(v8, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v12, 1, 0, &v19);
    v14 = v19;
    v15 = v14;
    if ((v13 & 1) == 0)
    {
      v16 = BKLibraryBookImportLog(v14);
      v17 = objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        sub_1006A223C();

    }
  }

  return v7;
}

- (void)cleanup
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  id v12;
  uint64_t v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKResolveAssetForImportOperation resultURL](self, "resultURL"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v13 = 2;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKResolveAssetForImportOperation inboxURL](self, "inboxURL"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKResolveAssetForImportOperation resultURL](self, "resultURL"));
    objc_msgSend(v4, "getRelationship:ofDirectoryAtURL:toItemAtURL:error:", &v13, v5, v6, 0);

    if (!v13)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKResolveAssetForImportOperation resultURL](self, "resultURL"));
      v12 = 0;
      objc_msgSend(v4, "removeItemAtURL:error:", v7, &v12);
      v8 = v12;

      if (v8)
      {
        v10 = BKLibraryBookImportLog(v9);
        v11 = objc_claimAutoreleasedReturnValue(v10);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          sub_1006A229C();

      }
    }

  }
}

- (void)main
{
  uint64_t v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  unsigned int v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  unsigned __int8 v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  NSObject *v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  NSObject *v35;
  unsigned int v36;
  NSObject *v37;
  void *v38;
  unsigned int v39;
  uint64_t v40;
  uint64_t v41;
  NSObject *v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  id v46;
  id v47;
  id v48;
  id v49;
  uint64_t v50;
  uint8_t buf[4];
  uint64_t v52;
  __int16 v53;
  NSObject *v54;

  v3 = BKLibraryBookImportLog(self);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = objc_claimAutoreleasedReturnValue(-[BKResolveAssetForImportOperation originalURL](self, "originalURL"));
    *(_DWORD *)buf = 141558274;
    v52 = 1752392040;
    v53 = 2112;
    v54 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "BKResolveAssetForImportOperation: start main: url: %{mask.hash}@", buf, 0x16u);

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKResolveAssetForImportOperation originalURL](self, "originalURL"));
  v8 = objc_msgSend(v7, "startAccessingSecurityScopedResource");

  if ((v8 & 1) == 0)
  {
    v10 = BKLibraryBookImportLog(v9);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_1006A247C(self, v11);

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKResolveAssetForImportOperation originalURL](self, "originalURL"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "ui_downloadOperationForActivity:", 0));

  objc_msgSend(v13, "start");
  v14 = objc_msgSend(v13, "isCancelled");
  if ((_DWORD)v14)
  {
    v15 = BKLibraryBookImportLog(v14);
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "BKResolveAssetForImportOperation: User cancelled import of cloud asset.", buf, 2u);
    }
    goto LABEL_37;
  }
  v50 = 2;
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[BKResolveAssetForImportOperation originalURL](self, "originalURL"));
  v49 = 0;
  v18 = objc_msgSend(v6, "getRelationship:ofDirectory:inDomain:toItemAtURL:error:", &v50, 9, 1, v17, &v49);
  v16 = v49;

  if ((v18 & 1) == 0)
  {
    v24 = BKLibraryBookImportLog(v19);
    v23 = objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      sub_1006A241C();
    goto LABEL_34;
  }
  if (v50 != 2)
  {
    if (v50)
      goto LABEL_35;
    v20 = BKLibraryBookImportLog(v19);
    v21 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v22 = objc_claimAutoreleasedReturnValue(-[BKResolveAssetForImportOperation originalURL](self, "originalURL"));
      *(_DWORD *)buf = 141558274;
      v52 = 1752392040;
      v53 = 2112;
      v54 = v22;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "BKResolveAssetForImportOperation: File is in container. url: %{mask.hash}@", buf, 0x16u);

    }
    v23 = objc_claimAutoreleasedReturnValue(-[BKResolveAssetForImportOperation originalURL](self, "originalURL"));
    goto LABEL_21;
  }
  v25 = BKLibraryBookImportLog(v19);
  v26 = objc_claimAutoreleasedReturnValue(v25);
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "BKResolveAssetForImportOperation: Copying to Inbox.", buf, 2u);
  }

  v27 = (void *)objc_claimAutoreleasedReturnValue(-[BKResolveAssetForImportOperation inboxURL](self, "inboxURL"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[BKResolveAssetForImportOperation originalURL](self, "originalURL"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "lastPathComponent"));
  v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "URLByAppendingPathComponent:", v29));

  v30 = (void *)objc_claimAutoreleasedReturnValue(-[BKResolveAssetForImportOperation originalURL](self, "originalURL"));
  v48 = 0;
  LODWORD(v28) = objc_msgSend(v6, "copyItemAtURL:toURL:error:", v30, v23, &v48);
  v16 = v48;

  if (!(_DWORD)v28)
  {
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject domain](v16, "domain"));
    if (objc_msgSend(v31, "isEqualToString:", NSCocoaErrorDomain))
    {
      v32 = -[NSObject code](v16, "code");

      if (v32 == (id)516)
      {
        v34 = BKLibraryBookImportLog(v33);
        v35 = objc_claimAutoreleasedReturnValue(v34);
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 141558274;
          v52 = 1752392040;
          v53 = 2112;
          v54 = v23;
          _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "BKResolveAssetForImportOperation: Removing exising file from Inbox. url: %{mask.hash}@", buf, 0x16u);
        }

        v47 = 0;
        v36 = objc_msgSend(v6, "removeItemAtURL:error:", v23, &v47);
        v37 = v47;
        v16 = v37;
        if (v36)
        {

          v38 = (void *)objc_claimAutoreleasedReturnValue(-[BKResolveAssetForImportOperation originalURL](self, "originalURL"));
          v46 = 0;
          v39 = objc_msgSend(v6, "copyItemAtURL:toURL:error:", v38, v23, &v46);
          v16 = v46;

          if (v39)
            goto LABEL_21;
          v41 = BKLibraryBookImportLog(v40);
          v42 = objc_claimAutoreleasedReturnValue(v41);
          if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
            sub_1006A22FC();
        }
        else
        {
          v45 = BKLibraryBookImportLog(v37);
          v42 = objc_claimAutoreleasedReturnValue(v45);
          if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
            sub_1006A235C();
        }
LABEL_33:

        goto LABEL_34;
      }
    }
    else
    {

    }
    v43 = BKLibraryBookImportLog(v33);
    v42 = objc_claimAutoreleasedReturnValue(v43);
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      sub_1006A23BC();
    goto LABEL_33;
  }
LABEL_21:
  -[BKResolveAssetForImportOperation setResultURL:](self, "setResultURL:", v23);
LABEL_34:

LABEL_35:
  if (v8)
  {
    v44 = (void *)objc_claimAutoreleasedReturnValue(-[BKResolveAssetForImportOperation originalURL](self, "originalURL"));
    objc_msgSend(v44, "stopAccessingSecurityScopedResource");

  }
LABEL_37:

}

- (BOOL)failed
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKResolveAssetForImportOperation resultURL](self, "resultURL"));
  v3 = v2 == 0;

  return v3;
}

- (NSURL)originalURL
{
  return self->_originalURL;
}

- (NSURL)resultURL
{
  return self->_resultURL;
}

- (void)setResultURL:(id)a3
{
  objc_storeStrong((id *)&self->_resultURL, a3);
}

- (NSURL)inboxURL
{
  return self->_inboxURL;
}

- (void)setInboxURL:(id)a3
{
  objc_storeStrong((id *)&self->_inboxURL, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inboxURL, 0);
  objc_storeStrong((id *)&self->_resultURL, 0);
  objc_storeStrong((id *)&self->_originalURL, 0);
}

@end
