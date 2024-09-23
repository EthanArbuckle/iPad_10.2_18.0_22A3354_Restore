@implementation BKAppURLHandler

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BKAppURLHandler)initWithLibraryAssetProvider:(id)a3
{
  id v4;
  BKAppURLHandler *v5;
  BKAppURLHandler *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)BKAppURLHandler;
  v5 = -[BKAppURLHandler init](&v8, "init");
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_libraryAssetProvider, v4);

  return v6;
}

- (id)locationFromURLFragment:(id)a3
{
  const __CFURL *v3;
  __CFString *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  char *v25;
  char *v26;
  id v28;
  void *v29;
  uint64_t v30;
  id v31;
  uint8_t buf[4];
  const char *v33;
  __int16 v34;
  const char *v35;
  __int16 v36;
  int v37;

  v3 = (const __CFURL *)a3;
  v4 = (__CFString *)CFURLCopyFragment(v3, &stru_10091C438);
  v31 = 0;
  v5 = (id)objc_claimAutoreleasedReturnValue(+[BKEpubCFILocation locationForCFI:error:](BKEpubCFILocation, "locationForCFI:error:", v4, &v31));
  v6 = v31;
  if (v5)
    goto LABEL_20;
  if (!-[__CFString hasPrefix:](v4, "hasPrefix:", CFSTR("annotationID("))
    || !-[__CFString hasSuffix:](v4, "hasSuffix:", CFSTR(")")))
  {
    v15 = objc_alloc((Class)BKAnchorPathLocation);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[__CFURL fragment](v3, "fragment"));
    v5 = objc_msgSend(v15, "initWithOrdinal:anchor:andPath:", -1, v7, 0);
    goto LABEL_14;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString substringWithRange:](v4, "substringWithRange:", 13, (char *)-[__CFString length](v4, "length") - 14));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[AEAnnotationProvider sharedInstance](AEAnnotationProvider, "sharedInstance"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "uiManagedObjectContext"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[AEAnnotation annotationIncludingDeletedWithUUID:assetID:inManagedObjectContext:](AEAnnotation, "annotationIncludingDeletedWithUUID:assetID:inManagedObjectContext:", v7, 0, v9));
  v11 = v10;
  if (!v10)
  {
LABEL_12:
    v5 = 0;
    goto LABEL_13;
  }
  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "location"));
  if (!v5)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "annotationLocation"));

    if (!v12)
      goto LABEL_11;
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "annotationLocation"));
    v14 = (char *)objc_msgSend(v13, "rangeOfString:", CFSTR("#"));
    if (v14 == (char *)0x7FFFFFFFFFFFFFFFLL)
    {

      goto LABEL_11;
    }
    v30 = 0;
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "substringFromIndex:", v14 + 1));
    v5 = (id)objc_claimAutoreleasedReturnValue(+[BKEpubCFILocation locationForCFI:error:](BKEpubCFILocation, "locationForCFI:error:", v16, &v30));

    if (!v5)
    {
LABEL_11:
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "plAbsolutePhysicalLocation"));
      v18 = objc_msgSend(v17, "unsignedIntegerValue");

      if (v18 != (id)0x7FFFFFFFFFFFFFFFLL)
      {
        v28 = objc_alloc((Class)BKPageLocation);
        v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "plAbsolutePhysicalLocation"));
        v5 = objc_msgSend(v28, "initWithOrdinal:andOffset:", 0, objc_msgSend(v29, "unsignedIntegerValue"));

        goto LABEL_13;
      }
      goto LABEL_12;
    }
  }
LABEL_13:

LABEL_14:
  if (!v5)
  {
    v20 = BCIMLog(v19);
    v21 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      v33 = "-[BKAppURLHandler locationFromURLFragment:]";
      v34 = 2080;
      v35 = "/Library/Caches/com.apple.xbs/Sources/Alder/ios/BKAppURLHandler.m";
      v36 = 1024;
      v37 = 139;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "%s %s:%d", buf, 0x1Cu);
    }

    v23 = BCIMLog(v22);
    v24 = objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      v25 = (char *)objc_claimAutoreleasedReturnValue(-[__CFURL absoluteString](v3, "absoluteString"));
      v26 = (char *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedDescription"));
      *(_DWORD *)buf = 138412546;
      v33 = v25;
      v34 = 2112;
      v35 = v26;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "@\"Error parsing CFI from URL %@: %@\", buf, 0x16u);

    }
    v5 = 0;
  }
LABEL_20:

  return v5;
}

- (void)handleURL:(id)a3 sourceApplication:(id)a4 annotation:(id)a5 isLaunch:(BOOL)a6 transaction:(id)a7 completion:(id)a8
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _BOOL4 v22;
  void *v23;
  void *v24;
  BOOL v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  NSObject *v34;
  NSObject *v35;
  NSObject *v36;
  NSObject *v37;
  unsigned __int8 v38;
  unsigned __int8 v39;
  id v42;
  _QWORD block[4];
  id v44;
  BKAppURLHandler *v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  _QWORD *v51;
  _QWORD *v52;
  _QWORD *v53;
  unsigned __int8 v54;
  unsigned __int8 v55;
  BOOL v56;
  BOOL v57;
  _QWORD v58[4];
  NSObject *v59;
  _QWORD *v60;
  _QWORD v61[3];
  char v62;
  _QWORD v63[4];
  NSObject *v64;
  _QWORD *v65;
  _QWORD v66[3];
  char v67;
  _QWORD v68[4];
  NSObject *v69;
  _QWORD *v70;
  _QWORD v71[3];
  char v72;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v42 = a7;
  v15 = a8;
  v16 = objc_msgSend(objc_alloc((Class)NSURLComponents), "initWithURL:resolvingAgainstBaseURL:", v12, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "path"));
  v39 = objc_msgSend(v17, "hasPrefix:", CFSTR("/assetid"));

  v38 = objc_msgSend(v13, "isEqualToString:", CFSTR("__self__"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "scheme"));
  v19 = v14;
  if (objc_msgSend(v18, "length"))
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "scheme"));
    if (objc_msgSend(v20, "caseInsensitiveCompare:", CFSTR("itms-bookss")))
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "scheme"));
      v22 = objc_msgSend(v21, "caseInsensitiveCompare:", CFSTR("itms-books")) == 0;

    }
    else
    {
      v22 = 1;
    }

  }
  else
  {
    v22 = 0;
  }

  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "scheme"));
  if (objc_msgSend(v23, "length"))
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "scheme"));
    v25 = objc_msgSend(v24, "caseInsensitiveCompare:", CFSTR("ibooks")) == 0;

  }
  else
  {
    v25 = 0;
  }

  if (v22
    && (v26 = (void *)objc_claimAutoreleasedReturnValue(+[BSUIURL URLWithURL:](BSUIURL, "URLWithURL:", v12)),
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "actionString")),
        v28 = objc_msgSend(v27, "length"),
        v27,
        v26,
        v28))
  {
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppURLHandler delegate](self, "delegate"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "storePresenter"));
    objc_msgSend(v30, "showStore:sourceApplication:annotation:transaction:", v12, v13, v19, v42);

    v31 = objc_retainBlock(v15);
    v32 = v31;
    if (v31)
      (*((void (**)(id, uint64_t))v31 + 2))(v31, 1);

    v33 = v42;
  }
  else
  {
    v34 = dispatch_group_create();
    v71[0] = 0;
    v71[1] = v71;
    v71[2] = 0x2020000000;
    v72 = 0;
    dispatch_group_enter(v34);
    v68[0] = _NSConcreteStackBlock;
    v68[1] = 3221225472;
    v68[2] = sub_100130314;
    v68[3] = &unk_1008EBCF0;
    v70 = v71;
    v35 = v34;
    v69 = v35;
    objc_msgSend(v12, "bc_isStoreProductURLWithCompletion:", v68);
    dispatch_group_enter(v35);
    v66[0] = 0;
    v66[1] = v66;
    v66[2] = 0x2020000000;
    v67 = 0;
    v63[0] = _NSConcreteStackBlock;
    v63[1] = 3221225472;
    v63[2] = sub_100130328;
    v63[3] = &unk_1008EBCF0;
    v65 = v66;
    v36 = v35;
    v64 = v36;
    objc_msgSend(v12, "bc_isBookStoreURLWithCompletion:", v63);
    dispatch_group_enter(v36);
    v61[0] = 0;
    v61[1] = v61;
    v61[2] = 0x2020000000;
    v62 = 0;
    v58[0] = _NSConcreteStackBlock;
    v58[1] = 3221225472;
    v58[2] = sub_10013033C;
    v58[3] = &unk_1008EBCF0;
    v60 = v61;
    v37 = v36;
    v59 = v37;
    objc_msgSend(v12, "bc_isStoreURLWithCompletion:", v58);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100130350;
    block[3] = &unk_1008EBD18;
    v51 = v66;
    v52 = v71;
    v53 = v61;
    v54 = v38;
    v55 = v39;
    v33 = v42;
    v44 = v12;
    v45 = self;
    v46 = v42;
    v47 = v13;
    v48 = v19;
    v56 = a6;
    v57 = v25;
    v49 = v16;
    v50 = v15;
    dispatch_group_notify(v37, (dispatch_queue_t)&_dispatch_main_q, block);

    _Block_object_dispose(v61, 8);
    _Block_object_dispose(v66, 8);

    _Block_object_dispose(v71, 8);
  }

}

- (id)p_libraryAssetFromIbooksSchemeURL:(id)a3 remainingPath:(id *)a4 needsBookID:(id *)a5 transaction:(id)a6
{
  id v9;
  void *v10;
  void *v11;
  const __CFURL *v12;
  __CFString *v13;
  uint64_t v14;
  void *v15;
  __CFString *v16;
  __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  __CFString *v21;
  __CFString *v22;
  void *v23;
  __CFString *v24;
  uint64_t v25;

  v9 = a3;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "host"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL assetIDFromURL:](NSURL, "assetIDFromURL:", v9));
  v12 = (const __CFURL *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "absoluteURL"));

  v13 = (__CFString *)CFURLCopyPath(v12);
  if (-[__CFString hasPrefix:](v13, "hasPrefix:", CFSTR("/")))
  {
    v14 = objc_claimAutoreleasedReturnValue(-[__CFString substringFromIndex:](v13, "substringFromIndex:", 1));

    v13 = (__CFString *)v14;
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString componentsSeparatedByString:](v13, "componentsSeparatedByString:", CFSTR("/")));
  v16 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectAtIndex:", 0));
  v17 = (__CFString *)CFURLCreateStringByReplacingPercentEscapes(0, v16, &stru_10091C438);

  if (a4)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "subarrayWithRange:", 1, (char *)objc_msgSend(v15, "count") - 1));
    *a4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "componentsJoinedByString:", CFSTR("/")));

  }
  if (objc_msgSend(v10, "isEqualToString:", CFSTR("storeid")))
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppURLHandler libraryAssetProvider](self, "libraryAssetProvider"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "libraryAssetOnMainQueueWithStoreID:", v17));
    v21 = 0;
    goto LABEL_11;
  }
  if (objc_msgSend(v10, "isEqualToString:", CFSTR("bookid")))
  {
    v22 = v17;
    v21 = v22;
    if (a5)
      *a5 = objc_retainAutorelease(v22);
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppURLHandler libraryAssetProvider](self, "libraryAssetProvider"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "libraryAssetOnMainQueueWithEpubID:", v21));
LABEL_11:

    if (v20)
      goto LABEL_17;
    goto LABEL_14;
  }
  v21 = 0;
LABEL_14:
  if (objc_msgSend(v11, "length"))
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppURLHandler libraryAssetProvider](self, "libraryAssetProvider"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "libraryAssetOnMainQueueWithAssetID:", v11));
LABEL_19:

    goto LABEL_20;
  }
  v20 = 0;
LABEL_17:
  if (objc_msgSend(v10, "isEqualToString:", CFSTR("filename")))
  {
    v24 = v17;
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppURLHandler libraryAssetProvider](self, "libraryAssetProvider"));
    v25 = objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "libraryAssetOnMainQueueWithFilename:", v24));

    v20 = (void *)v25;
    goto LABEL_19;
  }
LABEL_20:

  return v20;
}

- (id)p_libraryAssetFromIbooksSchemeURL:(id)a3 sourceApplication:(id)a4 annotation:(id)a5 remainingPath:(id *)a6 canScheduleOperations:(BOOL)a7 transaction:(id)a8
{
  _BOOL4 v9;
  id v14;
  id v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  unsigned __int8 v23;
  unsigned __int8 v24;
  unsigned __int8 v25;
  id v26;
  id v27;
  _QWORD *v28;
  void *v29;
  id v31;
  id v32;
  _QWORD v33[5];
  id v34;
  id v35;
  _QWORD *v36;
  _QWORD v37[5];
  id v38;
  id v39;
  id v40;
  id v41;
  unsigned __int8 v42;
  id v43[2];

  v9 = a7;
  v14 = a3;
  v32 = a4;
  v31 = a5;
  v15 = a8;
  v43[0] = 0;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppURLHandler p_libraryAssetFromIbooksSchemeURL:remainingPath:needsBookID:transaction:](self, "p_libraryAssetFromIbooksSchemeURL:remainingPath:needsBookID:transaction:", v14, a6, v43, v15));
  v17 = v43[0];
  v18 = objc_opt_class(BKLibraryDataSourcePlist);
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager defaultManager](BKLibraryManager, "defaultManager"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "dataSourceWithIdentifier:", CFSTR("com.apple.ibooks.plist.untethered")));
  v21 = BUDynamicCast(v18, v20);
  v22 = (void *)objc_claimAutoreleasedReturnValue(v21);

  v23 = objc_msgSend(v16, "canOpen");
  if (v16)
    v24 = v23;
  else
    v24 = 0;
  if (v9 && (v24 & 1) == 0)
  {
    v25 = v23;
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472;
    v37[2] = sub_100131614;
    v37[3] = &unk_1008EBD68;
    v37[4] = self;
    v26 = v14;
    v38 = v26;
    v39 = v32;
    v40 = v31;
    v27 = v15;
    v41 = v27;
    v42 = v25;
    v28 = objc_retainBlock(v37);
    if (objc_msgSend(v22, "hasDigestChangedSinceFetch"))
    {
      v29 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager defaultManager](BKLibraryManager, "defaultManager"));
      v33[0] = _NSConcreteStackBlock;
      v33[1] = 3221225472;
      v33[2] = sub_100131AF4;
      v33[3] = &unk_1008E8EE0;
      v33[4] = self;
      v34 = v26;
      v35 = v27;
      v36 = v28;
      objc_msgSend(v29, "reloadDataSource:completion:", v22, v33);

    }
    else
    {
      ((void (*)(_QWORD *, void *, id))v28[2])(v28, v16, v17);
    }

  }
  return v16;
}

- (id)sceneManager
{
  return +[BKAppDelegate sceneManager](BKAppDelegate, "sceneManager");
}

- (id)_newShowAssetTransactionFromExistingTransaction:(id)a3 forAssetID:(id)a4 isAudiobook:(BOOL)a5
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppURLHandler sceneManager](self, "sceneManager"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "defaultSceneControllerForTransaction:", v6));

  v9 = objc_msgSend(v8, "newShowAssetTransaction");
  return v9;
}

- (BOOL)_handleShowReadingNowWithTransaction:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppURLHandler delegate](self, "delegate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "storePresenter"));
  objc_msgSend(v6, "showReadingNowWithTransaction:", v4);

  return 1;
}

- (BOOL)_handleShowAudiobooksMainWithTransaction:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppURLHandler delegate](self, "delegate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "storePresenter"));
  objc_msgSend(v6, "showAudiobookStoreWithTransaction:", v4);

  return 1;
}

- (BOOL)_handleShowMangaMainWithTransaction:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppURLHandler delegate](self, "delegate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "storePresenter"));
  objc_msgSend(v6, "showMangaStoreWithTransaction:", v4);

  return 1;
}

- (BKAppURLHandlingDelegate)delegate
{
  return (BKAppURLHandlingDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (BKLibraryAssetProvider)libraryAssetProvider
{
  return (BKLibraryAssetProvider *)objc_loadWeakRetained((id *)&self->_libraryAssetProvider);
}

- (void)setLibraryAssetProvider:(id)a3
{
  objc_storeWeak((id *)&self->_libraryAssetProvider, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_libraryAssetProvider);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
