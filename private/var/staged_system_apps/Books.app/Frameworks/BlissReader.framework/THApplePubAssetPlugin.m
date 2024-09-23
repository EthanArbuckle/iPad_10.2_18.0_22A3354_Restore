@implementation THApplePubAssetPlugin

+ (id)sharedPlugin
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_72614;
  block[3] = &unk_428238;
  block[4] = a1;
  if (qword_5431A0 != -1)
    dispatch_once(&qword_5431A0, block);
  return (id)qword_543198;
}

- (THApplePubAssetPlugin)init
{
  THApplePubAssetPlugin *v2;
  void *v3;
  void *v4;
  NSMutableSet *v5;
  NSMutableSet *currentBookViewControllers;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)THApplePubAssetPlugin;
  v2 = -[THApplicationDelegate init](&v8, "init");
  if (v2)
  {
    +[TSKApplicationDelegate setSurrogateDelegate:](TSKApplicationDelegate, "setSurrogateDelegate:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, "didReceiveMemoryWarning:", UIApplicationDidReceiveMemoryWarningNotification, 0);

    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v4, "addObserver:selector:name:object:", v2, "didEnterBackground:", UIApplicationDidEnterBackgroundNotification, 0);

    TSWPForegroundInit();
    v5 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    currentBookViewControllers = v2->_currentBookViewControllers;
    v2->_currentBookViewControllers = v5;

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  if (-[NSMutableSet count](self->_currentBookViewControllers, "count"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THApplePubAssetPlugin dealloc]"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THApplePubAssetPlugin.m"));
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, v5, 93, CFSTR("Current book not closed."));

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v6, "removeObserver:", self);

  v7.receiver = self;
  v7.super_class = (Class)THApplePubAssetPlugin;
  -[THApplicationDelegate dealloc](&v7, "dealloc");
}

- (BOOL)shouldCheckMovieValidityOnImport
{
  return 0;
}

- (id)viewControllerForBook:(id)a3
{
  id v3;
  THBookViewController *v4;

  v3 = a3;
  v4 = -[THBookViewController initWithBookDescription:]([THBookViewController alloc], "initWithBookDescription:", v3);

  return v4;
}

- (id)existingBookViewControllerForDocumentRoot:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  id v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](self->_currentBookViewControllers, "allObjects", 0));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "documentViewController"));
        v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "documentRoot"));

        if (v11 == v4)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)willOpenBook:(id)a3
{
  -[NSMutableSet addObject:](self->_currentBookViewControllers, "addObject:", a3);
}

- (void)willCloseBook:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  THApplePubAssetPlugin *v8;
  id v9;

  v9 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "bookDescription"));
  v5 = v4;
  if (v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "asset"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "url"));

    if (v7)
    {
      v8 = self;
      objc_sync_enter(v8);
      -[THApplicationDelegate uncacheBookDescriptionForURL:](v8, "uncacheBookDescriptionForURL:", v7);
      objc_sync_exit(v8);

    }
  }
  -[NSMutableSet removeObject:](self->_currentBookViewControllers, "removeObject:", v9);

}

- (void)didCloseBook:(id)a3
{
  -[NSMutableSet removeObject:](self->_currentBookViewControllers, "removeObject:", a3);
}

- (id)uniqueIdForURL:(id)a3
{
  void *v3;
  const __CFString *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "path"));
  v4 = THUniqueIdForPath(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);

  return v5;
}

- (id)descriptionForAsset:(id)a3
{
  id v4;
  THApplePubAssetPlugin *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned __int8 v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v7 = objc_opt_class(THBookDescription, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "url"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[THApplicationDelegate cachedBookDescriptionForURL:](v5, "cachedBookDescriptionForURL:", v8));
  v10 = TSUDynamicCast(v7, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "asset"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "assetID"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "assetID"));
    v15 = objc_msgSend(v13, "isEqual:", v14);

    if ((v15 & 1) != 0)
      goto LABEL_8;

    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "url"));
    -[THApplicationDelegate uncacheBookDescriptionForURL:](v5, "uncacheBookDescriptionForURL:", v16);

  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "url"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "path"));
  v19 = THIsApplePubAtPath(v18);

  if (v19)
  {
    -[THApplicationDelegate clearBookDescriptionCache](v5, "clearBookDescriptionCache");
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[THBookDescription descriptionWithAsset:](THBookDescription, "descriptionWithAsset:", v4));
    if (v11)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "url"));
      -[THApplicationDelegate cacheBookDescription:forURL:](v5, "cacheBookDescription:forURL:", v11, v20);

    }
  }
  else
  {
    v11 = 0;
  }
LABEL_8:
  objc_sync_exit(v5);

  return v11;
}

- (id)coverDescriptionForURL:(id)a3
{
  id v4;
  THApplePubAssetPlugin *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int v12;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v7 = objc_opt_class(THBookCoverDescription, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v5->mBookCoverDescriptionCache, "objectForKey:", v4));
  v9 = TSUDynamicCast(v7, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

  if (!v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "path"));
    v12 = THIsApplePubAtPath(v11);

    if (v12)
    {
      -[NSMutableDictionary removeAllObjects](v5->mBookCoverDescriptionCache, "removeAllObjects");
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[THBookCoverDescription descriptionWithURL:](THBookCoverDescription, "descriptionWithURL:", v4));
      if (v10)
        -[NSMutableDictionary setObject:forKey:](v5->mBookCoverDescriptionCache, "setObject:forKey:", v10, v4);
    }
    else
    {
      v10 = 0;
    }
  }
  objc_sync_exit(v5);

  return v10;
}

- (id)coverDescriptionForAsset:(id)a3
{
  id v4;
  THApplePubAssetPlugin *v5;
  uint64_t v6;
  uint64_t v7;
  NSMutableDictionary *mBookCoverDescriptionCache;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unsigned __int8 v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  NSMutableDictionary *v23;
  void *v24;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v7 = objc_opt_class(THBookCoverDescription, v6);
  mBookCoverDescriptionCache = v5->mBookCoverDescriptionCache;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "url"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](mBookCoverDescriptionCache, "objectForKey:", v9));
  v11 = TSUDynamicCast(v7, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "asset"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "assetID"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "assetID"));
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if ((v16 & 1) != 0)
      goto LABEL_8;

    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "url"));
    -[THApplicationDelegate uncacheBookDescriptionForURL:](v5, "uncacheBookDescriptionForURL:", v17);

  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "url"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "path"));
  v20 = THIsApplePubAtPath(v19);

  if (v20)
  {
    -[THApplicationDelegate clearBookDescriptionCache](v5, "clearBookDescriptionCache");
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "url"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "assetID"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[THBookCoverDescription descriptionWithURL:assetID:](THBookCoverDescription, "descriptionWithURL:assetID:", v21, v22));

    if (v12)
    {
      v23 = v5->mBookCoverDescriptionCache;
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "url"));
      -[NSMutableDictionary setObject:forKey:](v23, "setObject:forKey:", v12, v24);

    }
  }
  else
  {
    v12 = 0;
  }
LABEL_8:
  objc_sync_exit(v5);

  return v12;
}

- (BOOL)supportsAssetAtURL:(id)a3 quickCheck:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  _BOOL4 v9;

  v4 = a4;
  v6 = a3;
  v7 = v6;
  if (v6)
  {
    if (v4)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "pathExtension"));
      if (objc_msgSend(v8, "caseInsensitiveCompare:", CFSTR("ibooks")))
        LOBYTE(v9) = objc_msgSend(v8, "caseInsensitiveCompare:", CFSTR("epub")) == 0;
      else
        LOBYTE(v9) = 1;
    }
    else
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[THApplePubAssetPlugin assetInfoForURL:](self, "assetInfoForURL:", v6));
      v9 = v8 != 0;
    }

  }
  else
  {
    LOBYTE(v9) = 0;
  }

  return v9;
}

- (id)assetInfoForURL:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[THApplicationDelegate descriptionForURL:](self, "descriptionForURL:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "asset"));

  return v4;
}

- (id)assetHelperForAsset:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  THAssetHelper *v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[THApplePubAssetPlugin descriptionForAsset:](self, "descriptionForAsset:", v4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[THApplePubAssetPlugin coverDescriptionForAsset:](self, "coverDescriptionForAsset:", v4));

  v7 = -[THAssetHelper initWithBookDescription:bookCoverDescription:]([THAssetHelper alloc], "initWithBookDescription:bookCoverDescription:", v5, v6);
  return v7;
}

- (id)viewControllerForAsset:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[THApplePubAssetPlugin descriptionForAsset:](self, "descriptionForAsset:", v7));
  objc_msgSend(v8, "loadMetadata");
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[THApplePubAssetPlugin viewControllerForAsset:bookDescription:options:](self, "viewControllerForAsset:bookDescription:options:", v7, v8, v6));

  return v9;
}

- (id)viewControllerForAsset:(id)a3 bookDescription:(id)a4 options:(id)a5
{
  id v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;

  v7 = a3;
  v8 = a4;
  if (-[THApplePubAssetPlugin isDeviceSupported](self, "isDeviceSupported"))
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_73224;
    v11[3] = &unk_428260;
    v12 = v7;
    +[THPerformanceRegressionLogger logEventWithBlock:](THPerformanceRegressionLogger, "logEventWithBlock:", v11);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[THApplePubAssetPlugin viewControllerForBook:](self, "viewControllerForBook:", v8));

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (AEAnnotationProvider)sharedAnnotationProvider
{
  AEAnnotationProvider *sharedAnnotationProvider;
  AEAnnotationProvider *v4;
  AEAnnotationProvider *v5;

  sharedAnnotationProvider = self->_sharedAnnotationProvider;
  if (!sharedAnnotationProvider)
  {
    v4 = (AEAnnotationProvider *)objc_alloc_init((Class)AEAnnotationProvider);
    v5 = self->_sharedAnnotationProvider;
    self->_sharedAnnotationProvider = v4;

    -[AEAnnotationProvider loadCoreData](self->_sharedAnnotationProvider, "loadCoreData");
    sharedAnnotationProvider = self->_sharedAnnotationProvider;
  }
  return sharedAnnotationProvider;
}

- (BOOL)isDeviceSupported
{
  if ((isPad(self, a2) & 1) != 0)
    return 1;
  else
    return isPhone();
}

- (id)helper:(id)a3 coverImageForURL:(id)a4 size:(CGSize)a5
{
  return -[THApplePubAssetPlugin helper:coverImageForURL:](self, "helper:coverImageForURL:", a3, a4, a5.width, a5.height);
}

- (id)helper:(id)a3 coverImageForURL:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;

  v6 = a4;
  v7 = a3;
  v9 = objc_opt_class(THAEHelper, v8);
  v10 = TSUDynamicCast(v9, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

  if (v11
    || (v13 = objc_opt_class(THAEHelper, v12),
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[THApplePubAssetPlugin helperForURL:withOptions:](self, "helperForURL:withOptions:", v6, 0)),
        v15 = TSUDynamicCast(v13, v14),
        v11 = (void *)objc_claimAutoreleasedReturnValue(v15),
        v14,
        v11))
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "helperCoverImage"));
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (id)_helper:(id)a3 assetInfo:(id)a4 viewControllerForBookDescription:(id)a5 options:(id)a6 error:(id *)a7
{
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  float v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v54;
  void *v55;
  void *v56;
  void *v57;

  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (-[THApplePubAssetPlugin isDeviceSupported](self, "isDeviceSupported"))
  {
    if (v12)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKey:", AEHelperNumberIsPreorderKey));
      objc_msgSend(v12, "setIsPreorderBook:", objc_msgSend(v14, "BOOLValue"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "requiredVersion"));
      v16 = v15;
      if (v15 && (objc_msgSend(v15, "floatValue"), v17 > 2.2))
      {
        v18 = THBundle();
        v54 = (void *)objc_claimAutoreleasedReturnValue(v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "localizedStringForKey:value:table:", CFSTR("New Features"), &stru_43D7D8, 0));
        v20 = THBundle();
        v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
        v56 = v16;
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("This book has new interactive features. To open it, you’ll need to update Apple Books."), &stru_43D7D8, 0));
        v23 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v19, v22, 1));

        v24 = THBundle();
        v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_43D7D8, 0));
        v27 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v26, 1, 0));
        objc_msgSend(v23, "addAction:", v27);

        v16 = v56;
        -[THApplePubAssetPlugin presentAlertController:options:animated:](self, "presentAlertController:options:animated:", v23, v13, 1);

        v28 = 0;
        if (!a7)
        {
LABEL_17:

LABEL_18:
          goto LABEL_19;
        }
      }
      else
      {
        if (objc_msgSend(v12, "containsUnknownContentVersions"))
        {
          v41 = THBundle();
          v55 = (void *)objc_claimAutoreleasedReturnValue(v41);
          v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "localizedStringForKey:value:table:", CFSTR("New Features"), &stru_43D7D8, 0));
          v43 = THBundle();
          v44 = (void *)objc_claimAutoreleasedReturnValue(v43);
          v57 = v16;
          v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "localizedStringForKey:value:table:", CFSTR("This book has new interactive features. For the best reading experience, you’ll need to update Apple Books."), &stru_43D7D8, 0));
          v46 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v42, v45, 1));

          v47 = THBundle();
          v48 = (void *)objc_claimAutoreleasedReturnValue(v47);
          v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_43D7D8, 0));
          v50 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v49, 1, 0));
          objc_msgSend(v46, "addAction:", v50);

          v16 = v57;
          -[THApplePubAssetPlugin presentAlertController:options:animated:](self, "presentAlertController:options:animated:", v46, v13, 1);

        }
        v28 = (void *)objc_claimAutoreleasedReturnValue(-[THApplePubAssetPlugin viewControllerForAsset:bookDescription:options:](self, "viewControllerForAsset:bookDescription:options:", v11, v12, 0));
        if (!a7)
          goto LABEL_17;
      }
      if (!v28)
      {
        v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "url"));
        v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObject:forKey:](NSDictionary, "dictionaryWithObject:forKey:", v51, AssetEngineErrorAssetURLUserInfoKey));

        *a7 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", AssetEngineErrorDomain, 1000, v52));
      }
      goto LABEL_17;
    }
  }
  else if (!-[THApplePubAssetPlugin isDeviceSupported](self, "isDeviceSupported"))
  {
    if (a7)
    {
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "url"));
      v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObject:forKey:](NSDictionary, "dictionaryWithObject:forKey:", v29, AssetEngineErrorAssetURLUserInfoKey));

      *a7 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", AssetEngineErrorDomain, 1003, v30));
    }
    v31 = THBundle();
    v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "localizedStringForKey:value:table:", CFSTR("Device not supported"), &stru_43D7D8, 0));
    v34 = THBundle();
    v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "localizedStringForKey:value:table:", CFSTR("This document can only be experienced on iPad."), &stru_43D7D8, 0));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v33, v36, 1));

    v37 = THBundle();
    v38 = (void *)objc_claimAutoreleasedReturnValue(v37);
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_43D7D8, 0));
    v40 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v39, 1, 0));
    objc_msgSend(v14, "addAction:", v40);

    -[THApplePubAssetPlugin presentAlertController:options:animated:](self, "presentAlertController:options:animated:", v14, v13, 1);
    v28 = 0;
    goto LABEL_18;
  }
  v28 = 0;
LABEL_19:

  return v28;
}

- (void)presentAlertController:(id)a3 options:(id)a4 animated:(BOOL)a5
{
  uint64_t v6;
  id v7;
  void *v8;
  id v9;

  v6 = BCTransactionOptionsTransactionKey;
  v7 = a3;
  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "objectForKeyedSubscript:", v6));
  if (!v9)
    BCReportAssertionFailureWithMessage("/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THApplePubAssetPlugin.m", 403, "-[THApplePubAssetPlugin presentAlertController:options:animated:]", "transaction", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[AEAssetEngine appInfoMgr](AEAssetEngine, "appInfoMgr"));
  objc_msgSend(v8, "presentViewController:transaction:animated:completion:", v7, v9, 1, 0);

}

- (id)helper:(id)a3 metadataForKey:(id)a4 forURL:(id)a5 needsCoordination:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;

  v6 = a6;
  v10 = a4;
  v11 = a5;
  v12 = a3;
  v14 = objc_opt_class(THAEHelper, v13);
  v15 = TSUDynamicCast(v14, v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);

  if (!v16)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[THApplicationDelegate descriptionForURL:](self, "descriptionForURL:", v11));
    if (v18)
    {
      if (objc_msgSend(v10, "isEqual:", AEHelperStringMetadataAuthorKey))
      {
        v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "bookAuthor"));
LABEL_10:
        v17 = (void *)v19;
LABEL_12:

        goto LABEL_13;
      }
      if (objc_msgSend(v10, "isEqual:", AEHelperStringMetadataTitleKey))
      {
        v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "bookTitle"));
        goto LABEL_10;
      }
      if (objc_msgSend(v10, "isEqual:", AEHelperStringMetadataGenreKey))
      {
        v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "genre"));
        goto LABEL_10;
      }
    }
    v17 = 0;
    goto LABEL_12;
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "helperMetadataForKey:needsCoordination:", v10, v6));
LABEL_13:

  return v17;
}

- (void)helper:(id)a3 deletePersistentCacheForURL:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned int v11;
  unsigned int v12;
  char v13;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[THApplicationDelegate descriptionForURL:](self, "descriptionForURL:", v7));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "contextDirectoryPath"));
  if (v9)
  {
    v13 = 0;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v11 = objc_msgSend(v10, "fileExistsAtPath:isDirectory:", v9, &v13);
    if (v13)
      v12 = v11;
    else
      v12 = 0;
    if (v12 == 1)
      objc_msgSend(v10, "removeItemAtPath:error:", v9, 0);

  }
}

- (void)helper:(id)a3 viewControllerWithOptions:(id)a4 completion:(id)a5
{
  -[THApplePubAssetPlugin _helper:canRefetch:viewControllerWithOptions:completion:](self, "_helper:canRefetch:viewControllerWithOptions:completion:", a3, 1, a4, a5);
}

- (void)_helper:(id)a3 canRefetch:(BOOL)a4 viewControllerWithOptions:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;
  THApplePubAssetPlugin *v27;
  id v28;
  id v29;
  id v30;
  BOOL v31;
  void *v32;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  v13 = v10;
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "url"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileAccessIntent readingIntentWithURL:options:](NSFileAccessIntent, "readingIntentWithURL:options:", v14, 1));
  v17 = (void *)objc_opt_new(NSFileCoordinator, v16);
  v32 = v15;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v32, 1));
  v20 = (void *)objc_opt_new(NSOperationQueue, v19);
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_73E84;
  v25[3] = &unk_428378;
  v29 = v11;
  v30 = v12;
  v26 = v14;
  v27 = self;
  v28 = v13;
  v31 = a4;
  v21 = v11;
  v22 = v13;
  v23 = v12;
  v24 = v14;
  objc_msgSend(v17, "coordinateAccessWithIntents:queue:byAccessor:", v18, v20, v25);

}

- (BOOL)helper:(id)a3 validateBookAuthorizationWithError:(id *)a4 needsCoordination:(BOOL)a5
{
  _BOOL8 v5;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  unsigned __int8 v12;

  v5 = a5;
  v7 = a3;
  v9 = objc_opt_class(THAEHelper, v8);
  v10 = TSUDynamicCast(v9, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

  if (v11)
    v12 = objc_msgSend(v11, "helperValidateBookAuthorizationWithError:needsCoordination:", a4, v5);
  else
    v12 = 0;

  return v12;
}

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  return 1;
}

- (void)applicationWillResignActive:(id)a3
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](self->_currentBookViewControllers, "allObjects", a3, 0));
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v7), "documentViewController"));
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "documentRoot"));

        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "userDataManager"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "moc"));
        objc_msgSend(v10, "save:", v11);

        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }

}

- (void)applicationDidEnterBackground:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[TSUFlushingManager sharedManager](TSUFlushingManager, "sharedManager", a3));
  objc_msgSend(v3, "didEnterBackground");

}

- (void)applicationWillEnterForeground:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[TSUFlushingManager sharedManager](TSUFlushingManager, "sharedManager", a3));
  objc_msgSend(v3, "willEnterForeground");

}

- (void)didReceiveMemoryWarning:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication", a3));
  -[THApplePubAssetPlugin applicationDidReceiveMemoryWarning:](self, "applicationDidReceiveMemoryWarning:", v4);

}

- (void)applicationDidReceiveMemoryWarning:(id)a3
{
  THApplePubAssetPlugin *v4;
  id v5;

  v5 = a3;
  v4 = self;
  objc_sync_enter(v4);
  -[THApplicationDelegate clearBookDescriptionCache](v4, "clearBookDescriptionCache");
  objc_sync_exit(v4);

}

- (void)didEnterBackground:(id)a3
{
  THApplePubAssetPlugin *v4;
  id v5;

  v5 = a3;
  v4 = self;
  objc_sync_enter(v4);
  -[THApplicationDelegate clearBookDescriptionCache](v4, "clearBookDescriptionCache");
  objc_sync_exit(v4);

}

- (id)associatedAssetType
{
  return CFSTR("application/ibooks");
}

- (id)supportedFileExtensions
{
  _QWORD v3[2];

  v3[0] = CFSTR("ibooks");
  v3[1] = CFSTR("epub");
  return (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v3, 2));
}

- (id)supportedUrlSchemes
{
  return +[NSArray array](NSArray, "array");
}

- (id)helperForURL:(id)a3 withOptions:(id)a4
{
  id v6;
  id v7;
  id v8;
  THAEHelper *v9;
  _QWORD v11[4];
  id v12;

  v6 = a3;
  v7 = a4;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_74EC8;
  v11[3] = &unk_428260;
  v8 = v6;
  v12 = v8;
  +[THPerformanceRegressionLogger logEventWithBlock:](THPerformanceRegressionLogger, "logEventWithBlock:", v11);
  if (-[THApplePubAssetPlugin supportsAssetAtURL:quickCheck:](self, "supportsAssetAtURL:quickCheck:", v8, 1))
    v9 = -[THAEHelper initWithURL:withOptions:]([THAEHelper alloc], "initWithURL:withOptions:", v8, v7);
  else
    v9 = 0;

  return v9;
}

- (NSMutableDictionary)bookCoverDescriptionCache
{
  return self->mBookCoverDescriptionCache;
}

- (void)setBookCoverDescriptionCache:(id)a3
{
  objc_storeStrong((id *)&self->mBookCoverDescriptionCache, a3);
}

- (void)setSharedAnnotationProvider:(id)a3
{
  objc_storeStrong((id *)&self->_sharedAnnotationProvider, a3);
}

- (NSMutableSet)currentBookViewControllers
{
  return self->_currentBookViewControllers;
}

- (void)setCurrentBookViewControllers:(id)a3
{
  objc_storeStrong((id *)&self->_currentBookViewControllers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentBookViewControllers, 0);
  objc_storeStrong((id *)&self->_sharedAnnotationProvider, 0);
  objc_storeStrong((id *)&self->mBookCoverDescriptionCache, 0);
}

@end
