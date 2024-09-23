@implementation FRArticleEditorialItemProvider

- (FRArticleEditorialItemProvider)initWithEditorialItemEntryManager:(id)a3 thumbnailCreator:(id)a4 editorialItemCreator:(id)a5
{
  id v9;
  id v10;
  id v11;
  FRArticleEditorialItemProvider *v12;
  FRArticleEditorialItemProvider *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v9 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10007E0F4();
    if (v10)
      goto LABEL_6;
  }
  else if (v10)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_10007E03C();
LABEL_6:
  if (!v11 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_10007DF84();
  v15.receiver = self;
  v15.super_class = (Class)FRArticleEditorialItemProvider;
  v12 = -[FRArticleEditorialItemProvider init](&v15, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_editorialItemEntryManager, a3);
    objc_storeStrong((id *)&v13->_thumbnailCreator, a4);
    objc_storeStrong((id *)&v13->_editorialItemCreator, a5);
  }

  return v13;
}

- (FRArticleEditorialItemProvider)init
{
  id v2;
  void *v3;
  id v4;
  uint8_t buf[4];
  const char *v6;
  __int16 v7;
  char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  id v12;

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    v2 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Do not call method"));
    *(_DWORD *)buf = 136315906;
    v6 = "-[FRArticleEditorialItemProvider init]";
    v7 = 2080;
    v8 = "FRArticleEditorialItemProvider.m";
    v9 = 1024;
    v10 = 35;
    v11 = 2114;
    v12 = v2;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[FRArticleEditorialItemProvider init]"));
  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v3, 0));

  objc_exception_throw(v4);
}

- (void)createEditorialItemWithContext:(id)a3 articleModifiedDate:(id)a4 articleID:(id)a5 headline:(id)a6 flintDataProvider:(id)a7 completion:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  unsigned int v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  id *v34;
  id v35;
  id *v36;
  id *v37;
  id *v38;
  id v39;
  FRArticleEditorialItemProvider *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  id v45;
  id *v46;
  id *v47;
  id *v48;
  id *v49;
  id *v50;
  id *v51;
  id *v52;
  id v53;
  void *v54;
  void *v55;
  void *v56;
  id v57;
  id v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  id v63;
  _QWORD v64[4];
  id v65;
  id v66;
  id v67;
  id v68;
  id v69;
  id v70;
  id v71;
  _QWORD v72[2];
  void *v73;
  id v74;
  id v75;
  char v76;
  _QWORD v77[4];
  id v78;
  id v79;
  id v80;
  id v81;
  id v82;
  id v83;
  id v84;
  _QWORD v85[2];
  void *v86;
  id v87;
  id v88;
  char v89;
  _QWORD v90[6];
  id v91;
  uint8_t buf[4];
  void *v93;
  __int16 v94;
  void *v95;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v58 = a7;
  v63 = a8;
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[FRArticleEditorialItemProvider editorialItemEntryManager](self, "editorialItemEntryManager"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "editorialItemsByID"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKey:", v16));

  v57 = v14;
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "documentController"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "metadata"));

  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "documentVersion"));
  v62 = v20;
  v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "lastSeenDocumentVersion"));
  v24 = -[FRArticleEditorialItemProvider shouldShowBadgeForArticleID:currentDocumentVersion:lastSeenDocumentVersion:](self, "shouldShowBadgeForArticleID:currentDocumentVersion:lastSeenDocumentVersion:", v16, v23);
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "feedNavigationAppearance"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "compactTitle"));

  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "feedNavigationAppearance"));
  v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "subtitle"));

  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "feedNavigationAppearance"));
  v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "subtitleColor"));

  v59 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("https://apple.news/%@"), v16));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "feedNavigationAppearance"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "iconImageIdentifier"));

  v31 = FCDefaultLog;
  if (os_log_type_enabled(FCDefaultLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v93 = v26;
    v94 = 2112;
    v95 = v30;
    _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Editorial Item Provider: compactitle=%@ iconIdentifier=%@", buf, 0x16u);
  }
  v56 = v23;
  if (v26)
  {
    v54 = v17;
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    if (v24)
    {
      v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", 0));
      objc_msgSend(v32, "addObject:", v33);

    }
    v53 = v15;
    if (v30)
    {
      v64[0] = _NSConcreteStackBlock;
      v64[1] = 3221225472;
      v64[2] = sub_100041788;
      v64[3] = &unk_1000DBB98;
      v52 = &v65;
      v65 = v16;
      v51 = &v66;
      v66 = v26;
      v50 = &v67;
      v67 = v61;
      v49 = &v68;
      v68 = v60;
      v48 = &v69;
      v69 = v59;
      v47 = &v70;
      v70 = v15;
      v46 = &v71;
      v71 = v23;
      v34 = (id *)v72;
      v35 = v62;
      v76 = v24;
      v72[0] = v35;
      v72[1] = self;
      v36 = &v73;
      v73 = v32;
      v37 = &v74;
      v74 = v54;
      v38 = &v75;
      v75 = v63;
      v39 = v32;
      v40 = self;
      v41 = v57;
      -[FRArticleEditorialItemProvider downloadThumbnailIconWithContext:flintDataProvider:iconIdentifier:completion:](v40, "downloadThumbnailIconWithContext:flintDataProvider:iconIdentifier:completion:", v57, v58, v30, v64);
    }
    else
    {
      v77[0] = _NSConcreteStackBlock;
      v77[1] = 3221225472;
      v77[2] = sub_100041640;
      v77[3] = &unk_1000DBB70;
      v52 = &v78;
      v78 = v16;
      v51 = &v79;
      v79 = v26;
      v50 = &v80;
      v80 = v61;
      v49 = &v81;
      v81 = v60;
      v48 = &v82;
      v82 = v59;
      v47 = &v83;
      v83 = v15;
      v46 = &v84;
      v84 = v23;
      v34 = (id *)v85;
      v44 = v62;
      v89 = v24;
      v85[0] = v44;
      v85[1] = self;
      v36 = &v86;
      v86 = v32;
      v37 = &v87;
      v87 = v54;
      v38 = &v88;
      v88 = v63;
      v45 = v32;
      FCPerformBlockOnMainThread(v77);
      v41 = v57;
    }

    v15 = v53;
    v17 = v54;
    v43 = v62;
    v42 = v63;
  }
  else
  {
    v90[0] = _NSConcreteStackBlock;
    v90[1] = 3221225472;
    v90[2] = sub_1000415CC;
    v90[3] = &unk_1000DBB48;
    v42 = v63;
    v90[4] = self;
    v43 = v62;
    v90[5] = v62;
    v91 = v63;
    sub_1000415CC((uint64_t)v90);
    v32 = v91;
    v41 = v57;
  }

}

- (BOOL)shouldShowBadgeForArticleID:(id)a3 currentDocumentVersion:(id)a4 lastSeenDocumentVersion:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  BOOL v12;
  char v13;
  _QWORD v15[5];
  _QWORD v16[5];
  uint8_t buf[4];
  id v18;
  __int16 v19;
  id v20;
  __int16 v21;
  void *v22;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = v9;
  if (!v8)
  {
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100041A9C;
    v16[3] = &unk_1000DBBC0;
    v16[4] = v7;
    v13 = sub_100041A9C((uint64_t)v16);
LABEL_9:
    v12 = v13;
    goto LABEL_11;
  }
  if (!v9)
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100041AE8;
    v15[3] = &unk_1000DBBC0;
    v15[4] = v7;
    v13 = sub_100041AE8((uint64_t)v15);
    goto LABEL_9;
  }
  if (objc_msgSend(v8, "compare:options:", v9, 64) == (id)1)
  {
    v11 = FCDefaultLog;
    if (os_log_type_enabled(FCDefaultLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      v18 = v7;
      v19 = 2114;
      v20 = v8;
      v21 = 2114;
      v22 = v10;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Editorial Item Provider: New version of Editorial ArticleID: %{public}@ currentDocumentVersion: %{public}@ lastSeenDocumentVersion: %{public}@, showing badge", buf, 0x20u);
    }
    v12 = 1;
  }
  else
  {
    v12 = 0;
  }
LABEL_11:

  return v12;
}

- (void)downloadThumbnailIconWithContext:(id)a3 flintDataProvider:(id)a4 iconIdentifier:(id)a5 completion:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  id v19;

  v9 = a3;
  v10 = a4;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100041C6C;
  v15[3] = &unk_1000DBC38;
  v16 = v9;
  v17 = a5;
  v18 = v10;
  v19 = a6;
  v11 = v19;
  v12 = v10;
  v13 = v17;
  v14 = v9;
  FCPerformBlockOnMainThread(v15);

}

- (FREditorialItemEntryManager)editorialItemEntryManager
{
  return self->_editorialItemEntryManager;
}

- (FREditorialItemThumbnailCreator)thumbnailCreator
{
  return self->_thumbnailCreator;
}

- (void)setThumbnailCreator:(id)a3
{
  objc_storeStrong((id *)&self->_thumbnailCreator, a3);
}

- (FREditorialItemCreator)editorialItemCreator
{
  return self->_editorialItemCreator;
}

- (void)setEditorialItemCreator:(id)a3
{
  objc_storeStrong((id *)&self->_editorialItemCreator, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_editorialItemCreator, 0);
  objc_storeStrong((id *)&self->_thumbnailCreator, 0);
  objc_storeStrong((id *)&self->_editorialItemEntryManager, 0);
}

@end
