@implementation AEBookInfoAssetPlugin

- (id)associatedAssetType
{
  -[AEBookInfoAssetPlugin doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (BOOL)isEpubURL:(id)a3
{
  id v3;
  void *v4;
  BOOL v5;

  v3 = a3;
  if (objc_msgSend(v3, "isFileURL"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "pathExtension"));
    v5 = objc_msgSend(v4, "caseInsensitiveCompare:", CFSTR("epub")) == 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)_bookInfoForAssetAtURL:(id)a3 withMoc:(id)a4 error:(id *)a5 needsCoordination:(BOOL)a6 updateDate:(id)a7
{
  _BOOL8 v8;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;

  v8 = a6;
  v11 = a3;
  v12 = a4;
  v13 = a7;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[AEEpubInfoSource sharedInstance](AEEpubInfoSource, "sharedInstance"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "bookInfoForURL:fromManagedObjectContext:error:needsCoordination:updateDate:", v11, v12, a5, v8, v13));

  return v15;
}

- (id)newViewControllerForAEBookInfo:(id)a3 storeID:(id)a4
{
  return 0;
}

- (id)helper:(id)a3 metadataForKey:(id)a4 forURL:(id)a5 needsCoordination:(BOOL)a6
{
  _BOOL8 v6;
  id v9;
  id v10;
  void *v11;
  void *v12;

  v6 = a6;
  v9 = a4;
  v10 = a5;
  if (-[AEBookInfoAssetPlugin isEpubURL:](self, "isEpubURL:", v10))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[AEEpubInfoSource sharedInstance](AEEpubInfoSource, "sharedInstance"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "metadataForKey:forURL:needsCoordination:", v9, v10, v6));

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void)helper:(id)a3 deletePersistentCacheForURL:(id)a4
{
  void *v4;
  id v5;

  v5 = a4;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[AEEpubInfoSource sharedInstance](AEEpubInfoSource, "sharedInstance"));
  objc_msgSend(v4, "resetBookForURL:", v5);

}

- (void)helper:(id)a3 updateCachedURLFrom:(id)a4 to:(id)a5
{
  id v6;
  void *v7;
  id v8;

  v8 = a4;
  v6 = a5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[AEEpubInfoSource sharedInstance](AEEpubInfoSource, "sharedInstance"));
  objc_msgSend(v7, "updateCachedURLFrom:to:", v8, v6);

}

- (void)helper:(id)a3 canRefetch:(BOOL)a4 viewControllerWithOptions:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  AEBookInfoAssetPlugin *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  NSFileCoordinator *v19;
  void *v20;
  NSOperationQueue *v21;
  id v22;
  id v23;
  void *v24;
  id v25;
  _QWORD *v26;
  void *v27;
  id v28;
  _QWORD v29[4];
  id v30;
  id v31;
  id v32;
  AEBookInfoAssetPlugin *v33;
  id v34;
  id v35;
  id v36;
  _QWORD *v37;
  id v38;
  BOOL v39;
  _QWORD v40[4];
  id v41;
  id v42;
  _QWORD *v43;
  _QWORD v44[5];
  AEBookInfoAssetPlugin *v45;
  void *v46;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  v28 = v10;
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "url"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", BCTransactionOptionsTransactionKey));
  v44[0] = 0;
  v44[1] = v44;
  v44[2] = 0x3032000000;
  v44[3] = sub_3B564;
  v44[4] = sub_3B574;
  v14 = self;
  v45 = v14;
  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472;
  v40[2] = sub_3B57C;
  v40[3] = &unk_1BF808;
  v43 = v44;
  v25 = v13;
  v41 = v25;
  v15 = v12;
  v42 = v15;
  v26 = objc_retainBlock(v40);
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKey:", AEHelperNumberIsApplePubKey));
  LODWORD(v13) = objc_msgSend(v16, "BOOLValue");

  if ((_DWORD)v13)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", AssetEngineErrorDomain, 1004, 0));
    if (v17)
      ((void (*)(_QWORD *, _QWORD, _QWORD, void *))v26[2])(v26, 0, 0, v17);
  }
  else
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "valueForKey:", CFSTR("assetID")));
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileAccessIntent readingIntentWithURL:options:](NSFileAccessIntent, "readingIntentWithURL:options:", v27, 1));
    v19 = objc_opt_new(NSFileCoordinator);
    v46 = v18;
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v46, 1));
    v21 = objc_opt_new(NSOperationQueue);
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_3B7A8;
    v29[3] = &unk_1BF8F8;
    v30 = v27;
    v31 = v11;
    v37 = v26;
    v22 = v18;
    v32 = v22;
    v33 = v14;
    v23 = v24;
    v34 = v23;
    v39 = a4;
    v35 = v25;
    v36 = v28;
    v38 = v15;
    -[NSFileCoordinator coordinateAccessWithIntents:queue:byAccessor:](v19, "coordinateAccessWithIntents:queue:byAccessor:", v20, v21, v29);

    v17 = 0;
  }

  _Block_object_dispose(v44, 8);
}

- (void)helper:(id)a3 viewControllerWithOptions:(id)a4 completion:(id)a5
{
  -[AEBookInfoAssetPlugin helper:canRefetch:viewControllerWithOptions:completion:](self, "helper:canRefetch:viewControllerWithOptions:completion:", a3, 1, a4, a5);
}

- (BOOL)helper:(id)a3 validateBookAuthorizationWithError:(id *)a4 needsCoordination:(BOOL)a5
{
  id v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v13[5];
  id v14;
  uint64_t *v15;
  id *v16;
  BOOL v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;

  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  v8 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "url"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[AEEpubInfoSource sharedInstance](AEEpubInfoSource, "sharedInstance"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_3CE40;
  v13[3] = &unk_1BF920;
  v13[4] = self;
  v11 = v9;
  v17 = a5;
  v14 = v11;
  v15 = &v18;
  v16 = a4;
  objc_msgSend(v10, "performBackgroundTaskAndWait:", v13);

  LOBYTE(v9) = *((_BYTE *)v19 + 24);
  _Block_object_dispose(&v18, 8);

  return (char)v9;
}

- (id)helper:(id)a3 coverImageForURL:(id)a4 size:(CGSize)a5
{
  return (id)objc_claimAutoreleasedReturnValue(-[AEBookInfoAssetPlugin helper:coverImageForURL:](self, "helper:coverImageForURL:", a3, a4, a5.width, a5.height));
}

- (id)helper:(id)a3 coverImageForURL:(id)a4
{
  id v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  id v11;
  AEBookInfoAssetPlugin *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v5 = a4;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = sub_3B564;
  v18 = sub_3B574;
  v19 = 0;
  if (-[AEBookInfoAssetPlugin isEpubURL:](self, "isEpubURL:", v5))
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_3D13C;
    v9[3] = &unk_1BF948;
    v10 = (id)objc_claimAutoreleasedReturnValue(+[AEEpubInfoSource sharedInstance](AEEpubInfoSource, "sharedInstance"));
    v11 = v5;
    v12 = self;
    v13 = &v14;
    v6 = v10;
    objc_msgSend(v6, "performBackgroundTaskAndWait:", v9);

  }
  v7 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  return v7;
}

- (id)helper:(id)a3 annotationProviderForURL:(id)a4 needsCoordination:(BOOL)a5 forAssetID:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  uint64_t v20;

  v7 = a5;
  v10 = a3;
  v11 = a4;
  v12 = a6;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[AEBookInfoAssetPlugin sharedAnnotationProvider](self, "sharedAnnotationProvider"));
  if (v12)
    v14 = v12;
  else
    v14 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "helperMetadataForKey:needsCoordination:", AEHelperStringMetadataAssetIDKey, v7));
  v15 = v14;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication contextDirectoryForAssetWithID:](UIApplication, "contextDirectoryForAssetWithID:", v14));
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[IMLibraryPlist isManagedBookFromURL:](IMLibraryPlist, "isManagedBookFromURL:", v11));
  v18 = objc_msgSend(v17, "BOOLValue");

  v19 = (void *)objc_claimAutoreleasedReturnValue(+[AEAnnotationSerializationManager annotationSerializationManagerWithAssetID:assetURL:bookVersionString:pathToAssetContextDirectory:isManagedBook:](AEAnnotationSerializationManager, "annotationSerializationManagerWithAssetID:assetURL:bookVersionString:pathToAssetContextDirectory:isManagedBook:", v15, v11, 0, v16, v18));
  if ((objc_msgSend(v19, "isAssetOfflineWithAssetID:", v15) & 1) != 0
    || objc_msgSend(v19, "takeBookOfflineIfManagedWithAnnotationProvider:assetID:", v13, v15))
  {
    v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "annotationProviderForOfflineDBWithAssetID:", v15));

    v13 = (void *)v20;
  }

  return v13;
}

- (id)supportedFileExtensions
{
  return +[NSArray arrayWithObject:](NSArray, "arrayWithObject:", CFSTR("epub"));
}

- (id)supportedUrlSchemes
{
  return 0;
}

- (id)helperForURL:(id)a3 withOptions:(id)a4
{
  id v5;
  id v6;

  v5 = a3;
  v6 = objc_msgSend(objc_alloc((Class)AEPluginDelegateInstance), "initWithDelegate:forURL:", self, v5);

  return v6;
}

- (BOOL)_shouldShowAlertForError:(id)a3
{
  id v3;
  char *v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;
  char v8;

  v3 = a3;
  v4 = (char *)objc_msgSend(v3, "code");
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "domain"));
  v6 = v5;
  if (v4 == (char *)-996)
  {
    v7 = objc_msgSend(v5, "isEqualToString:", fd45c988dd8cc08fce2e58d17f4ed2);
  }
  else
  {
    if (v4 != &stru_3D8.segname[4])
    {
      v8 = 1;
      goto LABEL_7;
    }
    v7 = objc_msgSend(v5, "isEqualToString:", AssetEngineErrorDomain);
  }
  v8 = v7 ^ 1;
LABEL_7:

  return v8;
}

- (void)_showAlertForError:(id)a3 forAssetAtURL:(id)a4 transaction:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint32_t *v20;
  id v21;
  void *v22;
  uint64_t v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  unsigned int v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;

  v34 = a3;
  v7 = a4;
  v8 = a5;
  if (!v8)
    BCReportAssertionFailureWithMessage("/Library/Caches/com.apple.xbs/Sources/Alder/ios/AEBookPlugins/Shared/AEBookInfoAssetPlugin.mm", 554, "-[AEBookInfoAssetPlugin _showAlertForError:forAssetAtURL:transaction:]", "transaction", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[AEAssetEngine libraryMgr](AEAssetEngine, "libraryMgr"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "metadataForAssetAtURL:needsCoordination:", v7, 1));

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[IMLibraryPlist titleFromPlistEntry:](IMLibraryPlist, "titleFromPlistEntry:", v10));
  v12 = AEBundle();
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_1C3088, 0));

  if (objc_msgSend(v11, "length"))
  {
    v15 = AEBundle();
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("Cannot Open “%@”"), &stru_1C3088, 0));
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v17, v11));

  }
  else
  {
    v19 = AEBundle();
    v16 = (void *)objc_claimAutoreleasedReturnValue(v19);
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("Cannot Open Book"), &stru_1C3088, 0));
  }

  v20 = (uint32_t *)objc_msgSend(v34, "code");
  if ((uint64_t)v20 <= 999)
  {
    if (v20 == &stru_20.flags || v20 == (uint32_t *)((char *)&stru_108.size + 1))
    {
      v24 = AEBundle();
      v22 = (void *)objc_claimAutoreleasedReturnValue(v24);
      v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("You must authorize this computer from the Account menu."), &stru_1C3088, 0));
      goto LABEL_20;
    }
  }
  else
  {
    if ((unint64_t)(v20 - 250) < 2)
      goto LABEL_19;
    if (v20 == &stru_798.reloff)
    {
      v26 = AEBundle();
      v22 = (void *)objc_claimAutoreleasedReturnValue(v26);
      v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("This book is protected by an incompatible technology."), &stru_1C3088, 0));
      goto LABEL_20;
    }
    if (v20 == (uint32_t *)((char *)&stru_798.reloff + 2))
      goto LABEL_10;
  }
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "domain"));
  if (!objc_msgSend(v25, "isEqualToString:", AMSErrorDomain))
  {
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "domain"));
    v28 = objc_msgSend(v27, "isEqualToString:", AKAppleIDAuthenticationErrorDomain);

    if (v28)
      goto LABEL_10;
LABEL_19:
    v29 = AEBundle();
    v22 = (void *)objc_claimAutoreleasedReturnValue(v29);
    v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("It is formatted incorrectly, or is not a format that Apple Books can open."), &stru_1C3088, 0));
    goto LABEL_20;
  }

LABEL_10:
  v21 = AEBundle();
  v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
  v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("This book cannot be opened because required software cannot be downloaded."), &stru_1C3088, 0));
LABEL_20:
  v30 = (void *)v23;

  v31 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v18, v30, 1));
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v14, 1, 0));
  objc_msgSend(v31, "addAction:", v32);

  v33 = (void *)objc_claimAutoreleasedReturnValue(+[AEAssetEngine appInfoMgr](AEAssetEngine, "appInfoMgr"));
  objc_msgSend(v33, "presentViewController:transaction:animated:completion:", v31, v8, 1, 0);

}

- (AEAnnotationProvider)sharedAnnotationProvider
{
  return self->_sharedAnnotationProvider;
}

- (void)setSharedAnnotationProvider:(id)a3
{
  objc_storeStrong((id *)&self->_sharedAnnotationProvider, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharedAnnotationProvider, 0);
}

@end
