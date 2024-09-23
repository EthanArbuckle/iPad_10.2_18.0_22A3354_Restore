@implementation BKBookFlowController

- (BKBookFlowController)initWithLibraryAssetProvider:(id)a3
{
  id v4;
  BKBookFlowController *v5;
  BKBookFlowController *v6;
  void *v7;
  void *v8;
  NSArray *v9;
  NSArray *pendingShowAssetInvocations;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)BKBookFlowController;
  v5 = -[BKBookFlowController init](&v12, "init");
  v6 = v5;
  if (v5)
  {
    -[BKBookFlowController setLibraryAssetProvider:](v5, "setLibraryAssetProvider:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v7, "addObserver:selector:name:object:", v6, "_libraryOwnershipNotification:", BKLibraryOwnershipDidChangeNotification, 0);

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v8, "addObserver:selector:name:object:", v6, "_pendingAssetUpdateNotification:", BKLibraryPendingUpdateNotification, 0);

    v9 = (NSArray *)objc_alloc_init((Class)NSArray);
    pendingShowAssetInvocations = v6->_pendingShowAssetInvocations;
    v6->_pendingShowAssetInvocations = v9;

  }
  return v6;
}

- (id)bookPresenterCurrentlyOpenBookForSingleScene:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "bookFlowAssetPresenting"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "presenterFirstVisibleChildConformingToProtocol:", &OBJC_PROTOCOL___BKAssetPresenting));

  return v4;
}

- (void)setStorePresenter:(id)a3
{
  objc_storeStrong((id *)&self->_storePresenter, a3);
}

- (void)setSceneHosting:(id)a3
{
  objc_storeWeak((id *)&self->_sceneHosting, a3);
}

- (void)setMinifiedPresenter:(id)a3
{
  objc_storeStrong((id *)&self->_minifiedPresenter, a3);
}

- (void)setLibraryAssetProvider:(id)a3
{
  objc_storeStrong((id *)&self->_libraryAssetProvider, a3);
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:name:object:", self, BKLibraryOwnershipDidChangeNotification, 0);

  v4.receiver = self;
  v4.super_class = (Class)BKBookFlowController;
  -[BKBookFlowController dealloc](&v4, "dealloc");
}

- (BKMinifiedPresenting)minifiedPresenter
{
  return self->_minifiedPresenter;
}

- (void)_pendingAssetUpdateNotification:(id)a3
{
  void *v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "object"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000ABD74;
  v6[3] = &unk_1008E7338;
  v6[4] = self;
  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "assetID"));
  v5 = v7;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);

}

- (void)_libraryOwnershipNotification:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  unsigned __int16 v21;
  void *v22;
  __CFString *v23;
  __CFString *v24;
  unsigned __int8 v25;
  char v26;
  unsigned __int8 v27;
  unsigned __int8 v28;
  id v29;
  BKBookFlowController *v30;
  void *v31;
  void *v32;
  id v33;
  id obj;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  _QWORD block[5];
  id v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];

  v30 = self;
  v33 = a3;
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "userInfo"));
  v4 = objc_opt_class(BKAppDelegate);
  v5 = BCGetUnsafeAppDelegateReference();
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = BUDynamicCast(v4, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  v31 = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "ubiquityStatusMonitor"));
  objc_msgSend(v9, "isICloudDriveEnabled");

  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v32 = v3;
  obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", BKLibraryOwnershipAssetsKey));
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
  if (v10)
  {
    v11 = v10;
    v40 = *(_QWORD *)v45;
    v41 = 0;
    v38 = BKLibraryOwnershipNewDatasourceKey;
    v39 = BKLibraryOwnershipOldDatasourceKey;
    v36 = BKLibraryOwnershipOldStateKey;
    v37 = BKLibraryOwnershipNewStateKey;
    v35 = BKLibraryOwnershipAssetIDKey;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v45 != v40)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * (_QWORD)i);
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", v39, v30));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "stringValue"));

        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", v38));
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "stringValue"));

        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", v37));
        v19 = (unsigned __int16)objc_msgSend(v18, "integerValue");

        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", v36));
        v21 = (unsigned __int16)objc_msgSend(v20, "integerValue");

        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", v35));
        v23 = CFSTR("com.apple.iBooks.plist.sample.stashed");
        v24 = CFSTR("com.apple.ibooks.plist.untethered");
        if (objc_msgSend(v15, "isEqualToString:", v23))
        {
          v25 = objc_msgSend(v17, "isEqualToString:", v24);
          if (v19 == 2)
            v26 = 1;
          else
            v26 = v25;
        }
        else
        {
          v26 = 0;
        }
        v27 = objc_msgSend(v15, "isEqualToString:", v24);
        if (v19 == 2)
          v28 = v27;
        else
          v28 = 0;
        if (v22 && v21 == 1 && (v26 & 1) == 0 && (v28 & 1) == 0)
        {
          v29 = v41;
          if (!v41)
            v29 = objc_alloc_init((Class)NSMutableSet);
          v41 = v29;
          objc_msgSend(v29, "addObject:", v22);
        }

      }
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
    }
    while (v11);
  }
  else
  {
    v41 = 0;
  }

  if (objc_msgSend(v41, "count"))
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000AC318;
    block[3] = &unk_1008E7338;
    block[4] = v30;
    v43 = v41;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  }
}

- (id)_storeController
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[BKAppDelegate delegate](BKAppDelegate, "delegate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "storeController"));

  return v3;
}

- (id)_optionsForLibraryAsset:(id)a3 transaction:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD *v15;
  id v16;
  _QWORD v18[5];
  id v19;
  id v20;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  if (objc_msgSend(v6, "isPreorderBook"))
    objc_msgSend(v8, "setObject:forKey:", &__kCFBooleanTrue, AEHelperNumberIsPreorderKey);
  if (objc_msgSend(v6, "isAudiobook"))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "lastOpenDate"));

    if (v9)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "lastOpenDate"));
      objc_msgSend(v8, "setObject:forKey:", v10, AEHelperDateLastOpenKey);

    }
    if (objc_msgSend(v6, "isStore"))
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "supplementalContentAssets"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "allObjects"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "bu_arrayByInvokingBlock:", &stru_1008E8DA0));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "bu_arrayByRemovingNSNulls"));

      objc_msgSend(v8, "setObject:forKeyedSubscript:", v14, AEHelperNumberSupplementalContentAssetIDs);
    }
    else
    {
      objc_msgSend(v8, "setObject:forKeyedSubscript:", &__NSArray0__struct, AEHelperNumberSupplementalContentAssetIDs);
    }
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_1000ACAE0;
    v18[3] = &unk_1008E8DC8;
    v18[4] = self;
    v19 = v7;
    v20 = v6;
    v15 = objc_retainBlock(v18);
    v16 = objc_msgSend(v15, "copy");
    objc_msgSend(v8, "setObject:forKey:", v16, AEHelperImageMetadataCoverBlockKey);

    objc_msgSend(v8, "setObject:forKey:", &__kCFBooleanFalse, CFSTR("BKBookPresentingResetLocationForMiniToFullTransition"));
  }

  return v8;
}

- (id)_largeCoverViewControllerForBook:(id)a3 options:(id)a4 transaction:(id)a5 minifiedPresenter:(id)a6 holdAnimationAssertion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;

  v12 = a3;
  v13 = a4;
  v14 = a7;
  v15 = a6;
  v16 = a5;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v18 = v17;
  if (v13)
    objc_msgSend(v17, "addEntriesFromDictionary:", v13);
  if ((objc_msgSend(v12, "isDownloading") & 1) != 0
    || (objc_msgSend(v12, "isLocal") & 1) == 0)
  {
    v19 = objc_msgSend(v12, "streamable") ^ 1;
  }
  else
  {
    v19 = 0;
  }
  v20 = BKLibraryAssetIdentifierFromAsset(v12);
  v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookFlowController _largeCoverViewControllerForAssetIdentifier:download:options:minifiedPresenter:holdAnimationAssertion:withTransaction:](self, "_largeCoverViewControllerForAssetIdentifier:download:options:minifiedPresenter:holdAnimationAssertion:withTransaction:", v21, v19, v18, v15, v14, v16));

  return v22;
}

- (void)_obtainImageForAsset:(id)a3 withAssetIdentifier:(id)a4 options:(id)a5 withTransaction:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  NSObject *v31;
  unsigned int v32;
  id v33;
  void *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  void *v38;
  unsigned int v39;
  void *v40;
  double v41;
  double v42;
  double v43;
  double v44;
  id v45;
  int v46;
  uint64_t v47;
  NSObject *v48;
  int v49;
  int v50;
  int v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  void *v56;
  void *v57;
  void *v58;
  NSObject *v59;
  void *v60;
  NSObject *v61;
  void *v62;
  NSObject *v63;
  void *v64;
  NSObject *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  id v72;
  void *v73;
  _QWORD block[4];
  id v75;
  _QWORD *v76;
  _QWORD *v77;
  _QWORD *v78;
  _QWORD v79[4];
  NSObject *v80;
  _QWORD *v81;
  _QWORD v82[4];
  NSObject *v83;
  _QWORD *v84;
  _QWORD v85[4];
  NSObject *v86;
  _QWORD *v87;
  _QWORD v88[5];
  id v89;
  _QWORD v90[5];
  id v91;
  _QWORD v92[5];
  id v93;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "permanentOrTemporaryAssetID"));
  if (objc_msgSend(v17, "length"))
  {
    v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("storeAsset")));
    v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "objectForKeyedSubscript:", CFSTR("artwork")));
    v19 = objc_opt_class(BKAssetID);
    v20 = BUDynamicCast(v19, v13);
    v21 = objc_claimAutoreleasedReturnValue(v20);
    v71 = v16;
    v73 = (void *)v18;
    v69 = (void *)v21;
    if (v18)
    {
      v22 = (void *)v21;
      if (v21)
      {
        v23 = objc_alloc_init((Class)BICProductProfileData);
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "assetID"));
        objc_msgSend(v23, "setIdentifier:", v24);

        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "objectForKeyedSubscript:", CFSTR("url")));
        objc_msgSend(v23, "setUrl:", v25);

        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "objectForKeyedSubscript:", CFSTR("width")));
        objc_msgSend(v23, "setWidth:", objc_msgSend(v26, "unsignedIntegerValue"));

        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "objectForKeyedSubscript:", CFSTR("height")));
        objc_msgSend(v23, "setHeight:", objc_msgSend(v27, "unsignedIntegerValue"));

        v28 = (void *)objc_claimAutoreleasedReturnValue(+[BCCacheManager defaultCacheManager](BCCacheManager, "defaultCacheManager"));
        v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "describedImagesFromProductProfile:", v23));
        v30 = BCImageCacheLog(objc_msgSend(v28, "addDescribedImages:", v29));
        v31 = objc_claimAutoreleasedReturnValue(v30);
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
          sub_10069E520();

      }
    }
    if (v12)
      v32 = +[BKLibraryManager processingOptionsFor:coverEffectsEnvironment:](BKLibraryManager, "processingOptionsFor:coverEffectsEnvironment:", v12, 0);
    else
      v32 = 2;
    v35 = objc_opt_class(NSNumber);
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("isRTL")));
    v37 = BUDynamicCast(v35, v36);
    v38 = (void *)objc_claimAutoreleasedReturnValue(v37);

    v68 = v38;
    v39 = objc_msgSend(v38, "BOOLValue");
    v40 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
    objc_msgSend(v40, "nativeBounds");
    v42 = v41;
    v44 = v43;

    v72 = v15;
    v67 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookFlowController _bookFlowAssetPresentingForShowAssetAction:](self, "_bookFlowAssetPresentingForShowAssetAction:", v15));
    v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "presenterFirstVisibleChildConformingToProtocol:", &OBJC_PROTOCOL___BCUCoverEffectsEnvironment));
    v45 = objc_msgSend(v66, "coverEffectsNightMode");
    v46 = (int)v45;
    v47 = BCImageCacheLog(v45);
    v48 = objc_claimAutoreleasedReturnValue(v47);
    if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
      sub_10069E4C0();

    if (v46)
      v49 = 64;
    else
      v49 = 0;
    if (v39)
      v50 = 128;
    else
      v50 = 0;
    v51 = v50 | v32 | v49;
    v52 = (void *)objc_claimAutoreleasedReturnValue(+[BICDescribedImage describedImageWithIdentifier:size:processingOptions:](BICDescribedImage, "describedImageWithIdentifier:size:processingOptions:", v17, v51 | 0x100u, v42, v44));
    objc_msgSend(v52, "setRequestOptions:", 18);
    objc_msgSend(v52, "setPriority:", 6);
    v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("title")));
    objc_msgSend(v52, "setTitle:", v53);

    v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("author")));
    objc_msgSend(v52, "setAuthor:", v54);

    v55 = objc_msgSend(v52, "copy");
    objc_msgSend(v55, "setRequestOptions:", 514);
    v56 = (void *)objc_claimAutoreleasedReturnValue(+[BICDescribedImage describedImageWithIdentifier:size:processingOptions:](BICDescribedImage, "describedImageWithIdentifier:size:processingOptions:", v17, v51 | 0x10u, v42, v44));
    objc_msgSend(v56, "setRequestOptions:", 18);
    objc_msgSend(v56, "setPriority:", 6);
    v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("title")));
    objc_msgSend(v56, "setTitle:", v57);

    v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("author")));
    objc_msgSend(v56, "setAuthor:", v58);

    v92[0] = 0;
    v92[1] = v92;
    v92[2] = 0x3032000000;
    v92[3] = sub_10004E370;
    v92[4] = sub_10004E238;
    v93 = 0;
    v90[0] = 0;
    v90[1] = v90;
    v90[2] = 0x3032000000;
    v90[3] = sub_10004E370;
    v90[4] = sub_10004E238;
    v91 = 0;
    v88[0] = 0;
    v88[1] = v88;
    v88[2] = 0x3032000000;
    v88[3] = sub_10004E370;
    v88[4] = sub_10004E238;
    v89 = 0;
    v59 = dispatch_group_create();
    dispatch_group_enter(v59);
    dispatch_group_enter(v59);
    dispatch_group_enter(v59);
    v60 = (void *)objc_claimAutoreleasedReturnValue(+[BCCacheManager defaultCacheManager](BCCacheManager, "defaultCacheManager"));
    v85[0] = _NSConcreteStackBlock;
    v85[1] = 3221225472;
    v85[2] = sub_1000AD4A4;
    v85[3] = &unk_1008E8DF0;
    v87 = v92;
    v61 = v59;
    v86 = v61;
    objc_msgSend(v60, "fetchCGImageFor:forRequest:timeOut:waitForNonGeneric:completion:", v55, v55, 1, v85, 4.0);

    v62 = (void *)objc_claimAutoreleasedReturnValue(+[BCCacheManager defaultCacheManager](BCCacheManager, "defaultCacheManager"));
    v82[0] = _NSConcreteStackBlock;
    v82[1] = 3221225472;
    v82[2] = sub_1000AD53C;
    v82[3] = &unk_1008E8DF0;
    v84 = v90;
    v63 = v61;
    v83 = v63;
    objc_msgSend(v62, "fetchCGImageFor:forRequest:timeOut:waitForNonGeneric:completion:", v52, v52, 1, v82, 4.0);

    v64 = (void *)objc_claimAutoreleasedReturnValue(+[BCCacheManager defaultCacheManager](BCCacheManager, "defaultCacheManager"));
    v79[0] = _NSConcreteStackBlock;
    v79[1] = 3221225472;
    v79[2] = sub_1000AD5D4;
    v79[3] = &unk_1008E8DF0;
    v81 = v88;
    v65 = v63;
    v80 = v65;
    objc_msgSend(v64, "fetchCGImageFor:forRequest:timeOut:waitForNonGeneric:completion:", v56, v56, 1, v79, 4.0);

    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000AD690;
    block[3] = &unk_1008E8E18;
    v76 = v92;
    v77 = v90;
    v16 = v71;
    v75 = v71;
    v78 = v88;
    dispatch_group_notify(v65, (dispatch_queue_t)&_dispatch_main_q, block);

    _Block_object_dispose(v88, 8);
    _Block_object_dispose(v90, 8);

    _Block_object_dispose(v92, 8);
    v15 = v72;
  }
  else
  {
    v33 = objc_retainBlock(v16);
    v34 = v33;
    if (v33)
      (*((void (**)(id, _QWORD, _QWORD, _QWORD))v33 + 2))(v33, 0, 0, 0);

  }
}

- (id)_largeCoverViewControllerForAssetIdentifier:(id)a3 download:(BOOL)a4 options:(id)a5 minifiedPresenter:(id)a6 holdAnimationAssertion:(id)a7 withTransaction:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  BCMutableFutureValue *v19;
  void *v20;
  void *v21;
  id v22;
  NSObject *v23;
  unsigned __int16 v24;
  BOOL v25;
  BCMutableFutureValue *v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  void ***v32;
  BCMutableFutureValue *v33;
  void **v35;
  uint64_t v36;
  void (*v37)(uint64_t, void *, void *, void *);
  void *v38;
  id v39;
  id v40;
  id v41;
  BKBookFlowController *v42;
  id v43;
  id v44;
  BCMutableFutureValue *v45;
  BOOL v46;
  BOOL v47;
  uint8_t buf[4];
  uint64_t v49;
  __int16 v50;
  id v51;
  __int16 v52;
  void *v53;

  v14 = a3;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  v19 = objc_opt_new(BCMutableFutureValue);
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookFlowController libraryAssetProvider](self, "libraryAssetProvider"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "libraryAssetOnMainQueueWithAssetIdentifier:", v14));

  v22 = sub_1000ABB38();
  v23 = objc_claimAutoreleasedReturnValue(v22);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 141558530;
    v49 = 1752392040;
    v50 = 2112;
    v51 = v14;
    v52 = 2112;
    v53 = v21;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "[%{mask.hash}@] _largeCoverViewControllerForAssetIdentifier: %@", buf, 0x20u);
  }

  v24 = (unsigned __int16)objc_msgSend(v21, "contentType");
  v35 = _NSConcreteStackBlock;
  v36 = 3221225472;
  v37 = sub_1000AD9F4;
  v38 = &unk_1008E8EB8;
  v25 = (unsigned __int16)(v24 - 7) != 65534 && (unsigned __int16)(v24 - 7) != 0xFFFF;
  v46 = v25;
  v39 = v15;
  v40 = v14;
  v41 = v17;
  v42 = self;
  v47 = a4;
  v43 = v16;
  v44 = v18;
  v26 = v19;
  v45 = v26;
  v27 = v18;
  v28 = v16;
  v29 = v17;
  v30 = v14;
  v31 = v15;
  v32 = objc_retainBlock(&v35);
  -[BKBookFlowController _obtainImageForAsset:withAssetIdentifier:options:withTransaction:completion:](self, "_obtainImageForAsset:withAssetIdentifier:options:withTransaction:completion:", v21, v30, v31, v27, v32, v35, v36, v37, v38);
  v33 = v26;

  return v33;
}

- (id)_bookFlowAssetPresentingForShowAssetAction:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookFlowController sceneHosting](self, "sceneHosting"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "defaultSceneControllerForTransaction:", v4));

  if (!v6)
    BCReportAssertionFailureWithMessage("/Library/Caches/com.apple.xbs/Sources/Alder/ios/AppSource/Classes/BKBookFlowController.m", 531, "-[BKBookFlowController _bookFlowAssetPresentingForShowAssetAction:]", "cc", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bookFlowAssetPresenting"));
  if (!v7)
    BCReportAssertionFailureWithMessage("/Library/Caches/com.apple.xbs/Sources/Alder/ios/AppSource/Classes/BKBookFlowController.m", 534, "-[BKBookFlowController _bookFlowAssetPresentingForShowAssetAction:]", "result", 0);

  return v7;
}

- (void)_presentViewController:(id)a3 transaction:(id)a4 animated:(BOOL)a5 overlayView:(id)a6 options:(id)a7 completion:(id)a8
{
  _BOOL8 v11;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void ***v25;
  void **v26;
  uint64_t v27;
  void (*v28)(uint64_t);
  void *v29;
  BKBookFlowController *v30;
  id v31;
  id v32;
  id v33;
  uint8_t buf[4];
  id v35;
  __int16 v36;
  _BOOL4 v37;

  v11 = a5;
  v14 = a3;
  v15 = a4;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  v19 = sub_1000ABB38();
  v20 = objc_claimAutoreleasedReturnValue(v19);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v35 = v14;
    v36 = 1024;
    v37 = v11;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "_presentViewController: %@ animated: %{BOOL}d", buf, 0x12u);
  }

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookFlowController _bookFlowAssetPresentingForShowAssetAction:](self, "_bookFlowAssetPresentingForShowAssetAction:", v15));
  v22 = v21;
  if (v16)
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "presenterModalPresentingViewController"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "view"));
    objc_msgSend(v24, "addSubview:", v16);

    v26 = _NSConcreteStackBlock;
    v27 = 3221225472;
    v28 = sub_1000AE2A0;
    v29 = &unk_1008E8EE0;
    v30 = self;
    v31 = v15;
    v32 = v17;
    v33 = v18;
    v25 = objc_retainBlock(&v26);

  }
  else
  {
    v25 = (void ***)objc_retainBlock(v18);
  }
  -[BKBookFlowController _presentViewController:bookFlowPresenting:options:animated:completion:](self, "_presentViewController:bookFlowPresenting:options:animated:completion:", v14, v22, v17, v11, v25, v26, v27, v28, v29, v30);

}

- (void)_presentViewController:(id)a3 bookFlowPresenting:(id)a4 options:(id)a5 animated:(BOOL)a6 completion:(id)a7
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  id v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  id v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  id v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  _BOOL4 v52;
  id v53;

  v52 = a6;
  v53 = a3;
  v10 = a5;
  v11 = a7;
  v12 = a4;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "presenterFirstVisibleChildConformingToProtocol:", &OBJC_PROTOCOL___BCCoverAnimatingHost));
  v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "ba_effectiveAnalyticsTracker"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "chainWithName:", CFSTR("ContentReading")));
  v15 = objc_opt_class(NSString);
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("interimTrackerPathOverride")));
  v17 = BUDynamicCast(v15, v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);

  if (v18)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "chainWithName:", v18));

    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "chainWithName:", CFSTR("ContentReading")));
  }
  objc_msgSend(v53, "ba_setAnalyticsTracker:", v14);
  v20 = objc_opt_class(NSDictionary);
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("rawUpSellData")));
  v22 = BUDynamicCast(v20, v21);
  v23 = (void *)objc_claimAutoreleasedReturnValue(v22);

  if (v23)
  {
    v50 = v13;
    v24 = objc_opt_class(NSNumber);
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "valueForKey:", BAUpSellLocationKey));
    v26 = BUDynamicCast(v24, v25);
    v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
    v28 = objc_msgSend(v27, "integerValue");

    v29 = objc_opt_class(NSNumber);
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "valueForKey:", BAUpSellVariantKey));
    v31 = BUDynamicCast(v29, v30);
    v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
    v33 = objc_msgSend(v32, "integerValue");

    v34 = objc_opt_class(NSString);
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "objectForKeyedSubscript:", BAUpSellVariantVersionKey));
    v36 = BUDynamicCast(v34, v35);
    v37 = (void *)objc_claimAutoreleasedReturnValue(v36);

    v38 = objc_opt_class(BKAssetPresentingViewController);
    v39 = BUDynamicCast(v38, v53);
    v40 = (void *)objc_claimAutoreleasedReturnValue(v39);
    if (v40)
    {
      v41 = objc_msgSend(objc_alloc((Class)BAUpSellData), "initWithLocation:variant:variantVersion:", v28, v33, v37);
      objc_msgSend(v40, "setUpSellData:", v41);

    }
    v13 = v50;
  }
  v42 = objc_opt_class(NSDictionary);
  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("rawAppAnalyticsAdditionalData")));
  v44 = BUDynamicCast(v42, v43);
  v45 = (void *)objc_claimAutoreleasedReturnValue(v44);

  if (v45 && _os_feature_enabled_impl("Books", "unifiedProductPage"))
  {
    v46 = objc_opt_class(BKAssetPresentingViewController);
    v47 = BUDynamicCast(v46, v53);
    v48 = (void *)objc_claimAutoreleasedReturnValue(v47);
    if (v48)
    {
      v49 = (void *)objc_claimAutoreleasedReturnValue(+[BAAppAnalyticsAdditionalData dataWithDictionary:](BAAppAnalyticsAdditionalData, "dataWithDictionary:", v45));
      objc_msgSend(v48, "setAppAnalyticsAdditionalData:", v49);

    }
  }
  objc_msgSend(v53, "setModalPresentationStyle:", 0, v50);
  objc_msgSend(v12, "presenterShowModalController:animated:completion:", v53, v52, v11);

}

- (id)_removePresenters:(id)a3 thatMustStayOpenWhenOpeningBook:(id)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned int v13;
  id v14;

  v5 = a4;
  v6 = objc_msgSend(a3, "mutableCopy");
  v7 = objc_msgSend(v6, "count");
  if ((uint64_t)v7 - 1 >= 0)
  {
    v8 = (uint64_t)v7;
    do
    {
      --v8;
      if (objc_msgSend(v5, "isSupplementalContent"))
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "supplementalContentParent"));
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "assetID"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndexedSubscript:", v8));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "assetPresenterAssetID"));
        v13 = objc_msgSend(v10, "isEqualToString:", v12);

        if (v13)
          objc_msgSend(v6, "removeObjectAtIndex:", v8);
      }
    }
    while (v8 > 0);
  }
  v14 = objc_msgSend(v6, "copy");

  return v14;
}

- (id)_pushLargeCoverAndOpenBook:(id)a3 options:(id)a4 minifiedPresenter:(id)a5 animated:(BOOL)a6 transaction:(id)a7 completion:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  id v27;
  _QWORD v29[5];
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  BOOL v36;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a7;
  v18 = a8;
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookFlowController _bookFlowAssetPresentingForShowAssetAction:](self, "_bookFlowAssetPresentingForShowAssetAction:", v17));
  if (!v19)
    BCReportAssertionFailureWithMessage("/Library/Caches/com.apple.xbs/Sources/Alder/ios/AppSource/Classes/BKBookFlowController.m", 639, "-[BKBookFlowController _pushLargeCoverAndOpenBook:options:minifiedPresenter:animated:transaction:completion:]", "bookFlowPresenting", 0);
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_1000AE924;
  v29[3] = &unk_1008E8F58;
  v29[4] = self;
  v30 = v14;
  v31 = v15;
  v32 = v17;
  v33 = v16;
  v20 = (id)objc_claimAutoreleasedReturnValue(+[BKBasePresentingViewController holdAnimationAssertion](BKAssetPresentingViewController, "holdAnimationAssertion"));
  v36 = a6;
  v34 = v20;
  v35 = v18;
  v21 = v18;
  v22 = v16;
  v23 = v17;
  v24 = v15;
  v25 = v14;
  objc_msgSend(v19, "presenterFinishModalTransitionsWithCompletion:", v29);
  v26 = v35;
  v27 = v20;

  return v27;
}

- (void)enqueueShowAssetWithTransactionProvider:(id)a3 assetID:(id)a4 location:(id)a5 options:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  _BKShowAssetInvocation *v20;

  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  v20 = objc_alloc_init(_BKShowAssetInvocation);
  -[_BKShowAssetInvocation setTransactionProvider:](v20, "setTransactionProvider:", v16);

  -[_BKShowAssetInvocation setAssetID:](v20, "setAssetID:", v15);
  -[_BKShowAssetInvocation setLocation:](v20, "setLocation:", v14);

  -[_BKShowAssetInvocation setOptions:](v20, "setOptions:", v13);
  -[_BKShowAssetInvocation setCompletion:](v20, "setCompletion:", v12);

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookFlowController pendingShowAssetInvocations](self, "pendingShowAssetInvocations"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "arrayByAddingObject:", v20));
  -[BKBookFlowController setPendingShowAssetInvocations:](self, "setPendingShowAssetInvocations:", v18);

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookFlowController runningShowAssetInvocation](self, "runningShowAssetInvocation"));
  if (!v19)
    -[BKBookFlowController _processNextShowAssetInvocation](self, "_processNextShowAssetInvocation");

}

- (void)_processNextShowAssetInvocation
{
  void *v3;
  void *v4;
  char *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id location;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookFlowController runningShowAssetInvocation](self, "runningShowAssetInvocation"));

  if (v3)
    BCReportAssertionFailureWithMessage("/Library/Caches/com.apple.xbs/Sources/Alder/ios/AppSource/Classes/BKBookFlowController.m", 707, "-[BKBookFlowController _processNextShowAssetInvocation]", "!self.runningShowAssetInvocation", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookFlowController pendingShowAssetInvocations](self, "pendingShowAssetInvocations"));
  v5 = (char *)objc_msgSend(v4, "count");

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookFlowController pendingShowAssetInvocations](self, "pendingShowAssetInvocations"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "firstObject"));
    -[BKBookFlowController setRunningShowAssetInvocation:](self, "setRunningShowAssetInvocation:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookFlowController pendingShowAssetInvocations](self, "pendingShowAssetInvocations"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "subarrayWithRange:", 1, v5 - 1));
    -[BKBookFlowController setPendingShowAssetInvocations:](self, "setPendingShowAssetInvocations:", v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "transactionProvider"));
    if (v10)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "transactionProvider"));
      v12 = objc_msgSend(v11, "newShowAssetTransaction");

      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "options"));
      v14 = objc_msgSend(v13, "mutableCopy");

      if (!v14)
        v14 = objc_alloc_init((Class)NSMutableDictionary);
      if (+[BKSceneUtilities hasMultiWindowEnabled](BKSceneUtilities, "hasMultiWindowEnabled"))
        objc_msgSend(v14, "setObject:forKeyedSubscript:", v12, BCTransactionOptionsTransactionKey);
      objc_initWeak(&location, self);
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "assetID"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "location"));
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_1000AF0A4;
      v17[3] = &unk_1008E8F80;
      v18 = v7;
      objc_copyWeak(&v19, &location);
      -[BKBookFlowController showAssetWithTransaction:assetID:location:options:completion:](self, "showAssetWithTransaction:assetID:location:options:completion:", v12, v15, v16, v14, v17);

      objc_destroyWeak(&v19);
      objc_destroyWeak(&location);

    }
  }
}

- (void)_processAndClearReopenAssetIDs:(id)a3 options:(id)a4 assetIDToPresenterMap:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  id v21;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v8, "count"))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "firstObject"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", v11));
    v13 = v12;
    if (v12)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "im_ancestorConformingToProtocol:", &OBJC_PROTOCOL___BKTransactionProviding));
      v15 = objc_msgSend(v14, "newShowAssetTransaction");
      v16 = objc_msgSend(v9, "mutableCopy");
      if (!v16)
        v16 = objc_alloc_init((Class)NSMutableDictionary);
      objc_msgSend(v16, "setObject:forKeyedSubscript:", v15, BCTransactionOptionsTransactionKey);
      objc_initWeak(&location, self);
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_1000AF328;
      v17[3] = &unk_1008E8FA8;
      v18 = v8;
      objc_copyWeak(&v21, &location);
      v19 = v9;
      v20 = v10;
      -[BKBookFlowController showAssetWithTransaction:assetID:location:options:completion:](self, "showAssetWithTransaction:assetID:location:options:completion:", v15, v11, 0, v16, v17);

      objc_destroyWeak(&v21);
      objc_destroyWeak(&location);

    }
  }

}

- (void)requestReopenAssetIDs:(id)a3 options:(id)a4
{
  id v6;
  void *v7;
  NSMutableDictionary *v8;
  NSMutableDictionary *v9;
  NSMutableDictionary *v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *i;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];

  v20 = a3;
  v6 = a4;
  v7 = v6;
  if (v6)
    v8 = (NSMutableDictionary *)objc_msgSend(v6, "mutableCopy");
  else
    v8 = objc_opt_new(NSMutableDictionary);
  v9 = v8;
  -[NSMutableDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, CFSTR("BKBookPresentingCloseAndReopenAssetIfNeeded"));
  v10 = objc_opt_new(NSMutableDictionary);
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookFlowController _currentAssetPresentersFromAllScenes](self, "_currentAssetPresentersFromAllScenes"));
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(_QWORD *)v22 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i);
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "assetPresenterAssetID"));

        if (v17)
        {
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "assetPresenterAssetID"));
          -[NSMutableDictionary setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", v16, v18);

        }
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v13);
  }

  v19 = objc_msgSend(v20, "mutableCopy");
  -[BKBookFlowController _processAndClearReopenAssetIDs:options:assetIDToPresenterMap:](self, "_processAndClearReopenAssetIDs:options:assetIDToPresenterMap:", v19, v9, v10);

}

- (void)_prepareMinifiedAssetPresenterForAssetID:(id)a3 transaction:(id)a4 force:(BOOL)a5 openBook:(BOOL)a6 showRestorationScrim:(BOOL)a7
{
  _BOOL4 v7;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  unsigned int v20;
  void *v21;
  unsigned __int8 v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  _QWORD *v35;
  void *v36;
  id v37;
  uint64_t v38;
  NSObject *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  id v44;
  _QWORD v45[5];
  id v46;
  id v47;
  _QWORD *v48;
  _QWORD v49[5];
  id v50;
  id v51;
  id v52;
  BOOL v53;
  uint8_t buf[4];
  id v55;

  v7 = a6;
  v10 = a3;
  v11 = a4;
  v12 = objc_msgSend(v10, "length");
  if (!v12)
    goto LABEL_27;
  if (v7)
  {
    v13 = BCCurrentBookLog(v12);
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v55 = v10;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Requesting opening of the last known open book %@.", buf, 0xCu);
    }

  }
  v15 = BCCurrentBookLog(v12);
  v16 = objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v55 = v10;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Requesting minified opening of book %@.", buf, 0xCu);
  }

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookFlowController libraryAssetProvider](self, "libraryAssetProvider"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "libraryAssetOnMainQueueWithAssetID:", v10));

  if ((objc_msgSend(v18, "canOpen") & 1) == 0)
  {

    v28 = BCCurrentBookLog(v27);
    v25 = objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      v26 = "Requested minified opening of book that is not local or streamable.";
      goto LABEL_15;
    }
LABEL_16:

    v18 = 0;
    goto LABEL_17;
  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "isExplicit"));
  v20 = objc_msgSend(v19, "BOOLValue");

  if (!v20)
  {
    if (!objc_msgSend(v18, "isEphemeral"))
      goto LABEL_17;

    v43 = BCCurrentBookLog(v42);
    v25 = objc_claimAutoreleasedReturnValue(v43);
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      goto LABEL_16;
    *(_WORD *)buf = 0;
    v26 = "The book we tried to re-open is ephemeral.";
    goto LABEL_15;
  }
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookFlowController libraryAssetProvider](self, "libraryAssetProvider"));
  v22 = objc_msgSend(v21, "isExplicitMaterialAllowed");

  if ((v22 & 1) == 0)
  {

    v24 = BCCurrentBookLog(v23);
    v25 = objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      v26 = "Book is explicit which is not allowed for opening.";
LABEL_15:
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, v26, buf, 2u);
      goto LABEL_16;
    }
    goto LABEL_16;
  }
LABEL_17:
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "assetID"));
  if (v29)
  {
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookFlowController libraryAssetProvider](self, "libraryAssetProvider"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "libraryAssetOnMainQueueWithAssetID:", v29));

    v32 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookFlowController minifiedPresenter](self, "minifiedPresenter"));
    objc_msgSend(v32, "setShouldIgnoreCurrentBookNotifications:", 1);

    v49[0] = _NSConcreteStackBlock;
    v49[1] = 3221225472;
    v49[2] = sub_1000AFA00;
    v49[3] = &unk_1008E9020;
    v49[4] = self;
    v33 = v31;
    v50 = v33;
    v51 = v29;
    v34 = v11;
    v52 = v34;
    v53 = v7;
    v35 = objc_retainBlock(v49);
    if (objc_msgSend(v33, "isAudiobook"))
    {
      v36 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookFlowController _optionsForLibraryAsset:transaction:](self, "_optionsForLibraryAsset:transaction:", v33, v34));
      v37 = objc_msgSend(v36, "mutableCopy");

      v38 = _AEBookPluginsAudiobookLog(objc_msgSend(v37, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, AEAudiobookOptionsShouldNotAutoplayKey));
      v39 = objc_claimAutoreleasedReturnValue(v38);
      if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_INFO, "Preventing auto-play of audiobook on auto-reopen of previous asset.", buf, 2u);
      }

      ((void (*)(_QWORD *, id))v35[2])(v35, v37);
    }
    else
    {
      v44 = v11;
      if (+[BKAssetUtilities supportsRestorationSnapshots:](BKAssetUtilities, "supportsRestorationSnapshots:", objc_msgSend(v33, "contentType")))-[BKBookFlowController _showRestorationScrimForAssetID:transaction:](self, "_showRestorationScrimForAssetID:transaction:", v10, v34);
      v40 = (void *)objc_claimAutoreleasedReturnValue(+[BKAppDelegate delegate](BKAppDelegate, "delegate"));
      v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "appLaunchCoordinator"));
      v45[0] = _NSConcreteStackBlock;
      v45[1] = 3221225472;
      v45[2] = sub_1000B005C;
      v45[3] = &unk_1008E9048;
      v48 = v35;
      v45[4] = self;
      v46 = v33;
      v47 = v34;
      objc_msgSend(v41, "appLaunchCoordinatorOnConditionMask:blockID:performBlock:", 0x4000, CFSTR("minifiedAssetPresenter resolveAndShowAsset"), v45);

      v37 = v48;
      v11 = v44;
    }

  }
LABEL_27:

}

- (void)_showRestorationScrimForAssetID:(id)a3 transaction:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  BKRestorationScrimView *v11;
  BKRestorationScrimView *v12;
  _QWORD block[4];
  BKRestorationScrimView *v14;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookFlowController _bookFlowAssetPresentingForShowAssetAction:](self, "_bookFlowAssetPresentingForShowAssetAction:", a4));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "presenterModalPresentingViewController"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "view"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "window"));

  if (v10)
    v11 = -[BKRestorationScrimView initWithAssetID:window:]([BKRestorationScrimView alloc], "initWithAssetID:window:", v6, v10);
  else
    v11 = 0;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000B01B4;
  block[3] = &unk_1008E72C0;
  v14 = v11;
  v12 = v11;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  -[BKRestorationScrimView removeEventually](v12, "removeEventually");

}

- (void)requestOpenLastKnownBookWithTransaction:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  unsigned __int8 v9;
  int v10;
  void *v11;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[BKBasePresentingViewController lastKnownSuccessfullyOpenBookID](BKAssetPresentingViewController, "lastKnownSuccessfullyOpenBookID"));
  if (objc_msgSend(v5, "length"))
  {
    v6 = sub_1000ABB38();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 138412290;
      v11 = v5;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Open Last Known Book. last ID: %@", (uint8_t *)&v10, 0xCu);
    }

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[BKLastOpenBookManager sharedInstance](BKLastOpenBookManager, "sharedInstance"));
    v9 = objc_msgSend(v8, "shouldAutoOpenAsset:", v5);

    if ((v9 & 1) == 0)
      +[BKBasePresentingViewController clearLastKnownSuccessfullyOpenBookID](BKAssetPresentingViewController, "clearLastKnownSuccessfullyOpenBookID");
    -[BKBookFlowController _prepareMinifiedAssetPresenterForAssetID:transaction:force:openBook:showRestorationScrim:](self, "_prepareMinifiedAssetPresenterForAssetID:transaction:force:openBook:showRestorationScrim:", v5, v4, 0, 1, 1);
  }

}

- (void)requestOpenBookMinified:(id)a3 transaction:(id)a4 force:(BOOL)a5
{
  -[BKBookFlowController _prepareMinifiedAssetPresenterForAssetID:transaction:force:openBook:showRestorationScrim:](self, "_prepareMinifiedAssetPresenterForAssetID:transaction:force:openBook:showRestorationScrim:", a3, a4, a5, 0, 0);
}

- (void)minifiedAssetPresenterForAssetIdentifier:(id)a3 transaction:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookFlowController libraryAssetProvider](self, "libraryAssetProvider"));
  v13 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "libraryAssetOnMainQueueWithAssetIdentifier:", v10));

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookFlowController _optionsForLibraryAsset:transaction:](self, "_optionsForLibraryAsset:transaction:", v13, v9));
  -[BKBookFlowController minifiedAssetPresenterForAssetIdentifier:transaction:options:completion:](self, "minifiedAssetPresenterForAssetIdentifier:transaction:options:completion:", v10, v9, v12, v8);

}

- (void)minifiedAssetPresenterForAssetIdentifier:(id)a3 transaction:(id)a4 options:(id)a5 completion:(id)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;

  v14 = a3;
  v9 = a5;
  v10 = a6;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookFlowController minifiedPresenter](self, "minifiedPresenter"));

  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookFlowController minifiedPresenter](self, "minifiedPresenter"));
    objc_msgSend(v12, "minifiedPresenterAssetPresenterForAssetIdentifier:options:completion:", v14, v9, v10);
  }
  else
  {
    v13 = objc_retainBlock(v10);
    v12 = v13;
    if (v13)
      (*((void (**)(id, _QWORD))v13 + 2))(v13, 0);
  }

}

- (BOOL)_wantsMinifiedAssetPresenterToOpenForTransaction:(id)a3 forceOpen:(BOOL)a4
{
  id v5;
  void *v6;
  unsigned __int8 v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;

  v5 = a3;
  v6 = v5;
  if (a4)
  {
    v7 = 1;
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "targetSceneDescriptor"));

    if (v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "targetSceneDescriptor"));
      v10 = BUProtocolCast(&OBJC_PROTOCOL___BKSceneDescriptor, v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

      if (!v11)
        BCReportAssertionFailureWithMessage("/Library/Caches/com.apple.xbs/Sources/Alder/ios/AppSource/Classes/BKBookFlowController.m", 970, "-[BKBookFlowController _wantsMinifiedAssetPresenterToOpenForTransaction:forceOpen:]", "targetSceneDescriptor", 0);
    }
    else
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "destinationSceneController"));
      v13 = BUProtocolCast(&OBJC_PROTOCOL___BKSceneControlling, v12);
      v11 = (void *)objc_claimAutoreleasedReturnValue(v13);

    }
    v7 = objc_msgSend(v11, "sceneSupportsMinifiedPresenting");

  }
  return v7;
}

- (void)_updateAssetAfterOpen:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v4 = a3;
  if ((+[AEAnnotationSerializationManager managedBooksAllowedToSync](AEAnnotationSerializationManager, "managedBooksAllowedToSync") & 1) == 0)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1000B0608;
    v6[3] = &unk_1008E8398;
    v7 = (id)objc_claimAutoreleasedReturnValue(-[BKBookFlowController libraryAssetProvider](self, "libraryAssetProvider"));
    v8 = v4;
    v5 = v7;
    objc_msgSend(v5, "performBlockOnWorkerQueue:", v6);

  }
}

- (id)currentAssetPresentersForSingleSceneWithTransaction:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookFlowController _bookFlowAssetPresentingForShowAssetAction:](self, "_bookFlowAssetPresentingForShowAssetAction:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "presenterViewControllersConformingToProtocol:", &OBJC_PROTOCOL___BKAssetPresenting));

  return v4;
}

- (id)_currentAssetPresentersFromAllScenes
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookFlowController sceneHosting](self, "sceneHosting"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "sceneHostingAllViewControllersConformingToProtocol:", &OBJC_PROTOCOL___BKAssetPresenting));

  return v3;
}

- (id)_currentPresenterFromAllScenesForAssetID:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  unsigned int v11;
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
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookFlowController _currentAssetPresentersFromAllScenes](self, "_currentAssetPresentersFromAllScenes", 0));
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
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "assetPresenterAssetID"));
        v11 = objc_msgSend(v10, "isEqualToString:", v4);

        if (v11)
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

- (id)_dockedAssetViewController
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[BKAppDelegate sceneManager](BKAppDelegate, "sceneManager"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "primarySceneController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "rootBarCoordinator"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "miniPlayerViewController"));
  v6 = objc_opt_class(UIViewController);
  v7 = BUClassAndProtocolCast(v5, v6, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  return v8;
}

- (BOOL)_shouldOpenBookUsingLargeCover:(id)a3
{
  void *v3;
  unsigned __int8 v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookFlowController _bookFlowAssetPresentingForShowAssetAction:](self, "_bookFlowAssetPresentingForShowAssetAction:", a3));
  v4 = objc_msgSend(v3, "presenterShouldOpenBookUsingLargeCover");

  return v4;
}

- (BOOL)_isPresenterAudiobook:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookFlowController libraryAssetProvider](self, "libraryAssetProvider"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "assetPresenterAssetID"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "libraryAssetOnMainQueueWithPermanentOrTemporaryAssetID:", v6));
  LOBYTE(v5) = objc_msgSend(v7, "isAudiobook");

  return (char)v5;
}

- (void)_popToPresenterIfNeeded:(id)a3 completion:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;

  v9 = a3;
  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "bc_descendentPresentedViewController"));

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "bc_descendentPresentedViewController"));
    objc_msgSend(v7, "dismissViewControllerAnimated:completion:", 1, v5);
  }
  else
  {
    v8 = objc_retainBlock(v5);
    v7 = v8;
    if (v8)
      (*((void (**)(id))v8 + 2))(v8);
  }

}

- (void)_replacePresenterWithTransaction:(id)a3 oldPresenter:(id)a4 newPresenter:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookFlowController _bookFlowAssetPresentingForShowAssetAction:](self, "_bookFlowAssetPresentingForShowAssetAction:", a3));
  if (!v13)
    BCReportAssertionFailureWithMessage("/Library/Caches/com.apple.xbs/Sources/Alder/ios/AppSource/Classes/BKBookFlowController.m", 1059, "-[BKBookFlowController _replacePresenterWithTransaction:oldPresenter:newPresenter:completion:]", "bookFlowPresenting", 0);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1000B0B5C;
  v17[3] = &unk_1008E8898;
  v18 = v13;
  v19 = v11;
  v20 = v12;
  v14 = v12;
  v15 = v11;
  v16 = v13;
  objc_msgSend(v16, "presenterDismissModalController:animated:completion:", v10, 0, v17);

}

- (void)showStoreAsset:(id)a3 asset:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  unsigned int v15;
  id *v16;
  id *v17;
  id *v18;
  id v19;
  id v20;
  id v21;
  const __CFString *v22;
  _QWORD *v23;
  void *v24;
  uint64_t v25;
  id v26;
  id v27;
  id v28;
  _QWORD v29[5];
  id v30;
  id v31;
  id v32;
  _QWORD v33[5];
  id v34;
  id v35;
  id v36;
  _QWORD v37[4];
  id v38;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[BKAppDelegate delegate](BKAppDelegate, "delegate"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "appLaunchCoordinator"));

  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472;
  v37[2] = sub_1000B0D70;
  v37[3] = &unk_1008E77C8;
  v38 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "appLaunchCoordinatorHoldAtConditionAssertion:", 3));
  v13 = v38;
  objc_msgSend(v12, "appLaunchCoordinatorOnConditionMask:blockID:performBlock:", 2, CFSTR("showStoreAsset invalidate holdAssertion"), v37);
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("BKBookPresentingForceOpenBeforeWelcomeCompleted")));
  v15 = objc_msgSend(v14, "BOOLValue");

  if (v15)
  {
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_1000B0D78;
    v33[3] = &unk_1008E9070;
    v16 = &v34;
    v33[4] = self;
    v34 = v8;
    v17 = &v35;
    v18 = &v36;
    v35 = v9;
    v36 = v10;
    v19 = v10;
    v20 = v9;
    v21 = v8;
    v22 = CFSTR("_showStoreAsset forceOpenBeforeWelcome");
    v23 = v33;
    v24 = v12;
    v25 = 2;
  }
  else
  {
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_1000B0D88;
    v29[3] = &unk_1008E9070;
    v16 = &v30;
    v29[4] = self;
    v30 = v8;
    v17 = &v31;
    v18 = &v32;
    v31 = v9;
    v32 = v10;
    v26 = v10;
    v27 = v9;
    v28 = v8;
    v22 = CFSTR("_showStoreAsset");
    v23 = v29;
    v24 = v12;
    v25 = 10;
  }
  objc_msgSend(v24, "appLaunchCoordinatorOnConditionMask:blockID:performBlock:", v25, v22, v23);

}

- (void)_showStoreAsset:(id)a3 asset:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  BKBookFlowController *v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookFlowController minifiedPresenter](self, "minifiedPresenter"));

  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookFlowController minifiedPresenter](self, "minifiedPresenter"));
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1000B0E7C;
    v13[3] = &unk_1008E9098;
    v14 = v8;
    v15 = self;
    objc_msgSend(v12, "minifiedPresenterAssetPresenterForStoreAsset:options:completion:", v9, v10, v13);

  }
}

- (CGRect)openAnimationSourceRect
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  -[BKBookFlowController openAnimationRect](self, "openAnimationRect");
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (BOOL)isOpeningFromCard:(id)a3 options:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookFlowController _bookFlowAssetPresentingForShowAssetAction:](self, "_bookFlowAssetPresentingForShowAssetAction:", a3));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("BKBookPresentingFromUserActivity")));

  LOBYTE(v6) = objc_msgSend(v8, "BOOLValue");
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "presenterViewControllersConformingToProtocol:", &OBJC_PROTOCOL___BKAugmentedExperienceCardPresenting));
  v10 = v9;
  v11 = (v6 & 1) == 0 && objc_msgSend(v9, "count") != 0;

  return v11;
}

- (id)_prepareOpenFromCardOverlayWithTransaction:(id)a3 assetIdentifier:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  __CFString *v21;
  __CFString *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  void *v40;
  double v41;
  double v42;
  double v43;
  double v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  id v56;
  void *v57;
  void *v58;
  uint8_t buf[4];
  id v60;
  __int16 v61;
  void *v62;
  CGRect v63;
  CGRect v64;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = sub_1000ABB38();
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", AEAssetLogID));
    *(_DWORD *)buf = 138412546;
    v60 = v9;
    v61 = 2114;
    v62 = v13;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "prepare to open asset %@ from card logID: %{public}@ with transaction", buf, 0x16u);

  }
  v14 = v10;
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("BKBookPresentingOverlayView")));

  v16 = v14;
  if (!v15)
  {
    v56 = v8;
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookFlowController _bookFlowAssetPresentingForShowAssetAction:](self, "_bookFlowAssetPresentingForShowAssetAction:", v8));
    v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("BKBookPresentingAnimateFromUid")));
    v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("BKBookPresentingAnimateFromRefId")));
    v20 = (void *)v19;
    v21 = CFSTR("cover");
    if (v19)
      v21 = (__CFString *)v19;
    v22 = v21;

    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("BKBookPresentingAnimateFromRefInstance")));
    v24 = v23;
    if (v23)
      v25 = v23;
    else
      v25 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "permanentOrTemporaryAssetID"));
    v26 = v25;

    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "presenterModalPresentingViewController"));
    v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "presentedViewController"));
    v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "im_firstVisibleChildConformingToProtocol:includePresented:", &OBJC_PROTOCOL___BCCoverAnimatingHost, 1));
    v57 = (void *)v18;
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "coverAnimationHostSourceForUUID:uid:refId:refInstance:", 0, v18, v22, v26));

    v29 = objc_opt_class(BKMainFlowController);
    v58 = v17;
    v30 = BUDynamicCast(v29, v17);
    v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
    objc_msgSend(v31, "setBookOpenAnimationHelper:", self);
    objc_msgSend(v28, "coverAnimationSourceFrame");
    v33 = v32;
    v35 = v34;
    v37 = v36;
    v39 = v38;
    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "coverAnimationSourceReferenceView"));
    v64.origin.x = CGRectZero.origin.x;
    v64.origin.y = CGRectZero.origin.y;
    v64.size.width = CGRectZero.size.width;
    v64.size.height = CGRectZero.size.height;
    v63.origin.x = v33;
    v63.origin.y = v35;
    v63.size.width = v37;
    v63.size.height = v39;
    v52 = v40;
    if (!CGRectEqualToRect(v63, v64))
    {
      objc_msgSend(v40, "convertRect:toView:", 0, v33, v35, v37, v39, v40);
      v33 = v41;
      v35 = v42;
      v37 = v43;
      v39 = v44;
    }
    -[BKBookFlowController setOpenAnimationRect:](self, "setOpenAnimationRect:", v33, v35, v37, v39, v52);
    objc_msgSend(v28, "coverAnimationSourcePrepare");
    v45 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
    v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "snapshotViewAfterScreenUpdates:", 0));

    objc_msgSend(v28, "coverAnimationSourceFinalize");
    v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "layer"));
    objc_msgSend(v47, "setZPosition:", 1000.0);

    v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "view"));
    v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "window"));
    objc_msgSend(v49, "addSubview:", v46);

    if (v14)
      v50 = objc_msgSend(v14, "mutableCopy");
    else
      v50 = objc_alloc_init((Class)NSMutableDictionary);
    v16 = v50;
    objc_msgSend(v50, "setObject:forKeyedSubscript:", v46, CFSTR("BKBookPresentingOverlayView"));
    objc_msgSend(v16, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, CFSTR("BKBookPresentWithoutCloseAnimation"));

    v8 = v56;
  }

  return v16;
}

- (id)_viewForCardOverlayFromOptions:(id)a3
{
  return objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("BKBookPresentingOverlayView"));
}

- (void)_removeViewForCardOverlayWithTransaction:(id)a3 options:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;

  v6 = a3;
  v11 = (id)objc_claimAutoreleasedReturnValue(-[BKBookFlowController _viewForCardOverlayFromOptions:](self, "_viewForCardOverlayFromOptions:", a4));
  objc_msgSend(v11, "removeFromSuperview");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookFlowController _bookFlowAssetPresentingForShowAssetAction:](self, "_bookFlowAssetPresentingForShowAssetAction:", v6));

  v8 = objc_opt_class(BKMainFlowController);
  v9 = BUDynamicCast(v8, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  objc_msgSend(v10, "setBookOpenAnimationHelper:", 0);

}

- (void)_promptInVCToRestartReadingFromBeginning:(id)a3 completion:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  id v23;

  v5 = a4;
  v19 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("You Are Reading This Book"), &stru_10091C438, 0));

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("The book you selected is already open. Would you like to start from the beginning?"), &stru_10091C438, 0));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v18, v17, 1));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("Cancel"), &stru_10091C438, 0));
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_1000B17C4;
  v22[3] = &unk_1008E90C0;
  v11 = v5;
  v23 = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v10, 1, v22));
  objc_msgSend(v8, "addAction:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("Start from Beginning"), &stru_10091C438, 0));
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_1000B17FC;
  v20[3] = &unk_1008E90C0;
  v21 = v11;
  v15 = v11;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v14, 0, v20));
  objc_msgSend(v8, "addAction:", v16);

  objc_msgSend(v19, "presentViewController:animated:completion:", v8, 1, 0);
}

- (void)_optionallyCloseCardStack:(id)a3 inPresentedVC:(id)a4 completion:(id)a5
{
  id v8;
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

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  if (v8)
    v11 = v8;
  else
    v11 = v9;
  v15[2] = sub_1000B190C;
  v15[3] = &unk_1008E9110;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  -[BKBookFlowController _promptInVCToRestartReadingFromBeginning:completion:](self, "_promptInVCToRestartReadingFromBeginning:completion:", v11, v15);

}

- (void)showAssetWithTransaction:(id)a3 assetID:(id)a4 location:(id)a5 options:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;

  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a3;
  v16 = (id)objc_claimAutoreleasedReturnValue(+[BKAssetID identifierWithAssetID:](BKAssetID, "identifierWithAssetID:", a4));
  -[BKBookFlowController showAssetWithTransaction:assetIdentifier:location:options:completion:](self, "showAssetWithTransaction:assetIdentifier:location:options:completion:", v15, v16, v14, v13, v12);

}

- (void)showAssetWithTransaction:(id)a3 assetIdentifier:(id)a4 location:(id)a5 options:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  NSObject *v18;
  void *v19;
  void *v20;
  id v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  id v27;
  id v28;
  NSObject *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  id v35;
  id v36;
  uint64_t v37;
  id v38;
  id v39;
  id v40;
  _QWORD *v41;
  id v42;
  _QWORD *v43;
  _QWORD *v44;
  void *v45;
  void *v46;
  id v47;
  id v48;
  id v49;
  _QWORD *v50;
  void *v51;
  void *v52;
  id v53;
  NSObject *v54;
  _BOOL4 v55;
  uint64_t v56;
  id v57;
  _QWORD *v58;
  _QWORD *v59;
  id v60;
  id v61;
  void *v62;
  _QWORD v63[5];
  id v64;
  id v65;
  id v66;
  id v67;
  _QWORD v68[4];
  id v69;
  id v70;
  id v71;
  id v72;
  _QWORD v73[5];
  id v74;
  id v75;
  id v76;
  _QWORD v77[5];
  id v78;
  id v79;
  id v80;
  id v81;
  id v82;
  _QWORD v83[4];
  id v84;
  id v85;
  uint8_t buf[4];
  uint64_t v87;
  __int16 v88;
  uint64_t v89;
  __int16 v90;
  id v91;
  __int16 v92;
  void *v93;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v17 = sub_1000ABB38();
  v18 = objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "debugDescription"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", AEAssetLogID));
    *(_DWORD *)buf = 138544130;
    v87 = (uint64_t)v19;
    v88 = 2160;
    v89 = 1752392040;
    v90 = 2112;
    v91 = v13;
    v92 = 2114;
    v93 = v20;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "showAssetWithTransaction: %{public}@ assetID: %{mask.hash}@ logID: %{public}@", buf, 0x2Au);

  }
  v62 = v14;
  if (-[BKBookFlowController isOpeningFromCard:options:](self, "isOpeningFromCard:options:", v12, v15))
  {
    v21 = sub_1000ABB38();
    v22 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", AEAssetLogID));
      *(_DWORD *)buf = 141558530;
      v87 = 1752392040;
      v88 = 2112;
      v89 = (uint64_t)v13;
      v90 = 2114;
      v91 = v23;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "showAssetWithTransaction step 0: open asset %{mask.hash}@ from card logID: %{public}@", buf, 0x20u);

    }
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "permanentOrTemporaryAssetID"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookFlowController _currentPresenterFromAllScenesForAssetID:](self, "_currentPresenterFromAllScenesForAssetID:", v24));

    v26 = objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "presentedViewController"));
    if (v26)
    {
      v27 = (id)v26;
      v28 = sub_1000ABB38();
      v29 = objc_claimAutoreleasedReturnValue(v28);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", AEAssetLogID));
        *(_DWORD *)buf = 141558530;
        v87 = 1752392040;
        v88 = 2112;
        v89 = (uint64_t)v13;
        v90 = 2114;
        v91 = v30;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "showAssetWithTransaction step 0: asset %{mask.hash}@ already open logID: %{public}@", buf, 0x20u);

      }
      v31 = objc_opt_class(BCCardStackViewController);
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "presentedViewController"));
      v33 = BUDynamicCast(v31, v32);
      v34 = (void *)objc_claimAutoreleasedReturnValue(v33);

      v83[0] = _NSConcreteStackBlock;
      v83[1] = 3221225472;
      v83[2] = sub_1000B2238;
      v83[3] = &unk_1008E8058;
      v84 = v25;
      v85 = v16;
      v35 = v16;
      v36 = v25;
      -[BKBookFlowController _optionallyCloseCardStack:inPresentedVC:completion:](self, "_optionallyCloseCardStack:inPresentedVC:completion:", v34, v27, v83);

      goto LABEL_19;
    }
    v37 = objc_claimAutoreleasedReturnValue(-[BKBookFlowController _prepareOpenFromCardOverlayWithTransaction:assetIdentifier:options:](self, "_prepareOpenFromCardOverlayWithTransaction:assetIdentifier:options:", v12, v13, v15));

    v15 = (id)v37;
  }
  v77[0] = _NSConcreteStackBlock;
  v77[1] = 3221225472;
  v77[2] = sub_1000B2294;
  v77[3] = &unk_1008E9160;
  v77[4] = self;
  v61 = v12;
  v78 = v12;
  v38 = v16;
  v82 = v38;
  v60 = v13;
  v39 = v13;
  v79 = v39;
  v80 = v14;
  v40 = v15;
  v81 = v40;
  v41 = objc_retainBlock(v77);
  v73[0] = _NSConcreteStackBlock;
  v73[1] = 3221225472;
  v73[2] = sub_1000B251C;
  v73[3] = &unk_1008E91B0;
  v73[4] = self;
  v42 = v39;
  v74 = v42;
  v15 = v40;
  v75 = v15;
  v43 = v41;
  v76 = v43;
  v44 = objc_retainBlock(v73);
  v45 = (void *)objc_claimAutoreleasedReturnValue(+[BKAppDelegate delegate](BKAppDelegate, "delegate"));
  v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "appLaunchCoordinator"));

  v68[0] = _NSConcreteStackBlock;
  v68[1] = 3221225472;
  v68[2] = sub_1000B2A5C;
  v68[3] = &unk_1008E9200;
  v71 = v44;
  v47 = v46;
  v69 = v47;
  v48 = v42;
  v70 = v48;
  v49 = v38;
  v72 = v49;
  v59 = v44;
  v50 = objc_retainBlock(v68);
  v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("BKBookPresentingForceOpenBeforeWelcomeCompleted")));
  LODWORD(v44) = objc_msgSend(v51, "BOOLValue");

  v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", AEAssetLogID));
  v53 = sub_1000ABB38();
  v54 = objc_claimAutoreleasedReturnValue(v53);
  v55 = os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT);
  if ((_DWORD)v44)
  {
    if (v55)
    {
      *(_DWORD *)buf = 141558530;
      v87 = 1752392040;
      v88 = 2112;
      v89 = (uint64_t)v48;
      v90 = 2114;
      v91 = v52;
      v56 = 32;
      _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_DEFAULT, "showAssetWithTransaction step 2: force open asset %{mask.hash}@ before welcome logID: %{public}@", buf, 0x20u);
    }
    else
    {
      v56 = 32;
    }
  }
  else
  {
    if (v55)
    {
      *(_DWORD *)buf = 141558274;
      v87 = 1752392040;
      v88 = 2112;
      v89 = (uint64_t)v48;
      _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_DEFAULT, "showAssetWithTransaction step 2: appLaunchCoordinatorOnConditionMask begin. assetID: %{mask.hash}@", buf, 0x16u);
    }
    v56 = 40;
  }

  v63[0] = _NSConcreteStackBlock;
  v63[1] = 3221225472;
  v63[2] = sub_1000B2B90;
  v63[3] = &unk_1008E9228;
  v63[4] = self;
  v64 = v48;
  v65 = v47;
  v66 = v50;
  v67 = v49;
  v27 = v49;
  v57 = v47;
  v58 = v50;
  objc_msgSend(v57, "appLaunchCoordinatorOnConditionMask:blockID:performBlock:", v56, CFSTR("showAsset:onLaunch"), v63);

  v13 = v60;
  v12 = v61;
LABEL_19:

}

- (void)_showAssetWithTransaction:(id)a3 assetIdentifier:(id)a4 location:(id)a5 options:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  NSObject *v18;
  id v19;
  id v20;
  _QWORD *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  NSObject *v28;
  _BOOL4 v29;
  void *v30;
  _QWORD v31[4];
  id v32;
  BKBookFlowController *v33;
  id v34;
  id v35;
  id v36;
  _QWORD *v37;
  _QWORD v38[4];
  id v39;
  id v40;
  uint8_t buf[4];
  uint64_t v42;
  __int16 v43;
  id v44;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v17 = sub_1000ABB38();
  v18 = objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 141558274;
    v42 = 1752392040;
    v43 = 2112;
    v44 = v13;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "_showAssetWithTransaction: assetID: %{mask.hash}@", buf, 0x16u);
  }

  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472;
  v38[2] = sub_1000B30F4;
  v38[3] = &unk_1008E9250;
  v19 = v13;
  v39 = v19;
  v20 = v16;
  v40 = v20;
  v21 = objc_retainBlock(v38);
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookFlowController sceneHosting](self, "sceneHosting"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "permanentOrTemporaryAssetID"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "sceneInfoPresentingAssetID:", v23));

  if (v24
    && (v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "sceneController")), v25, !v25))
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookFlowController sceneHosting](self, "sceneHosting"));
    v27 = sub_1000ABB38();
    v28 = objc_claimAutoreleasedReturnValue(v27);
    v29 = os_log_type_enabled(v28, OS_LOG_TYPE_ERROR);
    if (v26)
    {
      if (v29)
        sub_10069E7B0((uint64_t)v19, v15, v28);

      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "permanentOrTemporaryAssetID"));
      v31[0] = _NSConcreteStackBlock;
      v31[1] = 3221225472;
      v31[2] = sub_1000B3230;
      v31[3] = &unk_1008E9278;
      v32 = v12;
      v33 = self;
      v34 = v19;
      v35 = v14;
      v36 = v15;
      v37 = v21;
      objc_msgSend(v26, "requestSceneWithAssetID:completion:", v30, v31);

    }
    else
    {
      if (v29)
        sub_10069E720(v15, v28);

      ((void (*)(_QWORD *, _QWORD, _QWORD, _QWORD))v21[2])(v21, 0, 0, 0);
    }

  }
  else
  {
    -[BKBookFlowController _showAssetWithoutStateRestoration:assetIdentifier:location:options:completion:](self, "_showAssetWithoutStateRestoration:assetIdentifier:location:options:completion:", v12, v19, v14, v15, v21);
  }

}

- (void)_openPDFAsset:(id)a3
{
  id v3;
  _QWORD block[4];
  id v5;

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000B32DC;
  block[3] = &unk_1008E72C0;
  v5 = a3;
  v3 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

}

- (void)_showAssetWithoutStateRestoration:(id)a3 assetIdentifier:(id)a4 location:(id)a5 options:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  unsigned __int8 v28;
  void *v29;
  void *v30;
  id v31;
  _QWORD *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  id v36;
  unsigned __int8 v37;
  void *v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  _QWORD *v46;
  id v47;
  void *v48;
  unsigned __int8 v49;
  unsigned __int8 v50;
  void *v51;
  void *v52;
  id v53;
  id v54;
  _QWORD v55[4];
  id v56;
  id v57;
  id v58;
  id v59;
  BKBookFlowController *v60;
  id v61;
  id v62;
  id v63;
  id v64;
  id v65;
  _BYTE *v66;
  _QWORD *v67;
  uint64_t *v68;
  unsigned __int8 v69;
  unsigned __int8 v70;
  unsigned __int8 v71;
  unsigned __int8 v72;
  _QWORD v73[5];
  id v74;
  _QWORD v75[5];
  id v76;
  uint64_t v77;
  uint64_t *v78;
  uint64_t v79;
  uint64_t (*v80)(uint64_t, uint64_t);
  void (*v81)(uint64_t);
  id v82;
  _BYTE buf[24];
  uint64_t (*v84)(uint64_t, uint64_t);
  void (*v85)(uint64_t);
  id v86;

  v12 = a3;
  v13 = a4;
  v54 = a5;
  v14 = a6;
  v53 = a7;
  v15 = sub_1000ABB38();
  v16 = objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", AEAssetLogID));
    *(_DWORD *)buf = 141558530;
    *(_QWORD *)&buf[4] = 1752392040;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v13;
    *(_WORD *)&buf[22] = 2114;
    v84 = v17;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "_showAssetWithoutStateRestoration: Showing asset: %{mask.hash}@ logID: %{public}@", buf, 0x20u);

  }
  v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "originatingSceneController"));
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v84 = sub_10004E370;
  v85 = sub_10004E238;
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookFlowController sceneHosting](self, "sceneHosting"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "defaultSceneControllerForTransaction:", v12));
  v20 = BUProtocolCast(&OBJC_PROTOCOL___BKSceneControlling, v19);
  v86 = (id)objc_claimAutoreleasedReturnValue(v20);

  v21 = objc_claimAutoreleasedReturnValue(-[BKBookFlowController _bookFlowAssetPresentingForShowAssetAction:](self, "_bookFlowAssetPresentingForShowAssetAction:", v12));
  if (!v21)
    BCReportAssertionFailureWithMessage("/Library/Caches/com.apple.xbs/Sources/Alder/ios/AppSource/Classes/BKBookFlowController.m", 1470, "-[BKBookFlowController _showAssetWithoutStateRestoration:assetIdentifier:location:options:completion:]", "bookFlowPresenting", 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "permanentOrTemporaryAssetID", v21));
  v51 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookFlowController _currentPresenterFromAllScenesForAssetID:](self, "_currentPresenterFromAllScenesForAssetID:", v22));

  v77 = 0;
  v78 = &v77;
  v79 = 0x3032000000;
  v80 = sub_10004E370;
  v81 = sub_10004E238;
  v82 = (id)objc_claimAutoreleasedReturnValue(-[BKBookFlowController currentAssetPresentersForSingleSceneWithTransaction:](self, "currentAssetPresentersForSingleSceneWithTransaction:", v12));
  v75[0] = 0;
  v75[1] = v75;
  v75[2] = 0x3032000000;
  v75[3] = sub_10004E370;
  v75[4] = sub_10004E238;
  v76 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v78[5], "lastObject"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("BKBookPresentingCloseAndReopenAssetIfNeeded")));
  v50 = objc_msgSend(v23, "BOOLValue");

  v24 = objc_opt_class(NSNumber);
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("BKBookPresentingSecure")));
  v26 = BUDynamicCast(v24, v25);
  v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
  v28 = objc_msgSend(v27, "BOOLValue");

  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("BKBookPresentingForceExistingAssetToClose")));
  v30 = v29;
  if (v29)
    v49 = objc_msgSend(v29, "BOOLValue");
  else
    v49 = 1;

  v73[0] = _NSConcreteStackBlock;
  v73[1] = 3221225472;
  v73[2] = sub_1000B3C20;
  v73[3] = &unk_1008E92C8;
  v73[4] = self;
  v31 = v13;
  v74 = v31;
  v32 = objc_retainBlock(v73);
  v33 = ((uint64_t (*)(void))v32[2])();
  v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookFlowController _optionsForLibraryAsset:transaction:](self, "_optionsForLibraryAsset:transaction:", v34, v12));
  v36 = objc_msgSend(v35, "mutableCopy");

  v37 = objc_msgSend(v34, "isAudiobook");
  if (v14)
    objc_msgSend(v36, "addEntriesFromDictionary:", v14);
  if (v54)
    objc_msgSend(v36, "setObject:forKeyedSubscript:", v54, CFSTR("BKAssetPresentingOpenLocationKey"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookFlowController minifiedPresenter](self, "minifiedPresenter"));
  objc_msgSend(v38, "setShouldIgnoreCurrentBookNotifications:", 1);

  v55[0] = _NSConcreteStackBlock;
  v55[1] = 3221225472;
  v55[2] = sub_1000B3C64;
  v55[3] = &unk_1008E9698;
  v39 = v31;
  v56 = v39;
  v40 = v14;
  v57 = v40;
  v41 = v12;
  v58 = v41;
  v42 = v36;
  v59 = v42;
  v60 = self;
  v69 = v28;
  v66 = buf;
  v43 = v53;
  v64 = v43;
  v44 = v51;
  v61 = v44;
  v45 = v52;
  v70 = v37;
  v62 = v45;
  v67 = v75;
  v68 = &v77;
  v46 = v32;
  v65 = v46;
  v71 = v50;
  v47 = v54;
  v63 = v47;
  v72 = v49;
  -[BKBookFlowController minifiedAssetPresenterForAssetIdentifier:transaction:options:completion:](self, "minifiedAssetPresenterForAssetIdentifier:transaction:options:completion:", v39, v41, v42, v55);

  _Block_object_dispose(v75, 8);
  _Block_object_dispose(&v77, 8);

  _Block_object_dispose(buf, 8);
}

- (void)_closePresenter:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  BOOL v20;

  v8 = a3;
  v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookFlowController sceneHosting](self, "sceneHosting"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "sceneControllerForViewController:", v8));

  if (!v11)
    BCReportAssertionFailureWithMessage("/Library/Caches/com.apple.xbs/Sources/Alder/ios/AppSource/Classes/BKBookFlowController.m", 1928, "-[BKBookFlowController _closePresenter:animated:completion:]", "sceneController", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "bookFlowAssetPresenting"));
  if (!v12)
    BCReportAssertionFailureWithMessage("/Library/Caches/com.apple.xbs/Sources/Alder/ios/AppSource/Classes/BKBookFlowController.m", 1931, "-[BKBookFlowController _closePresenter:animated:completion:]", "bookFlowPresenting", 0);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1000B7464;
  v16[3] = &unk_1008E96C0;
  v17 = v12;
  v18 = v8;
  v20 = a4;
  v19 = v9;
  v13 = v9;
  v14 = v8;
  v15 = v12;
  objc_msgSend(v15, "presenterWaitForAssetPresenterTransitionsToFinishIfNeededWithCompletion:", v16);

}

- (void)closeAllPresentersForSingleSceneWithTransaction:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  id v8;
  id v9;

  v5 = a4;
  v8 = a5;
  v9 = (id)objc_claimAutoreleasedReturnValue(-[BKBookFlowController currentAssetPresentersForSingleSceneWithTransaction:](self, "currentAssetPresentersForSingleSceneWithTransaction:", a3));
  -[BKBookFlowController _closePresenters:animated:completion:](self, "_closePresenters:animated:completion:", v9, v5, v8);

}

- (void)_closePresenters:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  BKBookFlowController *v16;
  id v17;
  BOOL v18;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "lastObject"));
  if (v10)
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1000B75EC;
    v13[3] = &unk_1008E96E8;
    v14 = v8;
    v15 = v10;
    v16 = self;
    v18 = v6;
    v17 = v9;
    -[BKBookFlowController _closePresenter:animated:completion:](self, "_closePresenter:animated:completion:", v15, v6, v13);

  }
  else
  {
    v11 = objc_retainBlock(v9);
    v12 = v11;
    if (v11)
      (*((void (**)(id))v11 + 2))(v11);

  }
}

- (void)_closeMinifiedPresenters:(id)a3 excludeAssetID:(id)a4 isAudiobook:(BOOL)a5 completion:(id)a6
{
  int v7;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  _QWORD *v16;
  void *v17;
  unsigned __int8 v18;
  void *v19;
  id v20;
  void *v21;
  _QWORD v22[4];
  _QWORD *v23;
  _QWORD v24[4];
  id v25;
  id v26;
  BKBookFlowController *v27;
  id v28;
  id v29;
  char v30;

  v7 = a5;
  v10 = a3;
  v11 = a4;
  v12 = a6;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "anyObject"));
  if (v13)
  {
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_1000B7878;
    v24[3] = &unk_1008E8F08;
    v25 = v10;
    v14 = v13;
    v26 = v14;
    v27 = self;
    v15 = v11;
    v28 = v15;
    v30 = v7;
    v29 = v12;
    v16 = objc_retainBlock(v24);
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "minifiedAssetPresenterAssetID"));
    v18 = objc_msgSend(v17, "isEqualToString:", v15);

    if (objc_msgSend(v14, "minifiedAssetPresenterIsAudiobook") != v7
      || (v18 & 1) != 0
      || +[BKSceneUtilities hasMultiWindowEnabled](BKSceneUtilities, "hasMultiWindowEnabled")
      || (v7 & 1) != 0)
    {
      ((void (*)(_QWORD *))v16[2])(v16);
    }
    else
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookFlowController minifiedPresenter](self, "minifiedPresenter"));
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472;
      v22[2] = sub_1000B78D4;
      v22[3] = &unk_1008E7818;
      v23 = v16;
      objc_msgSend(v19, "minifiedPresenterClose:completion:", v14, v22);

    }
  }
  else
  {
    v20 = objc_retainBlock(v12);
    v21 = v20;
    if (v20)
      (*((void (**)(id))v20 + 2))(v20);

  }
}

- (void)handleFamilyChangeErrorWithTransaction:(id)a3 error:(id)a4 assetIdentifier:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  id v32;
  _QWORD v33[4];
  id v34;
  id v35;
  _QWORD *v36;
  _QWORD v37[5];
  BKBookFlowController *v38;
  _QWORD v39[4];
  id v40;

  v8 = a3;
  v32 = a4;
  v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookFlowController _bookFlowAssetPresentingForShowAssetAction:](self, "_bookFlowAssetPresentingForShowAssetAction:", v8));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("To read it, you must buy it from the Book Store."), &stru_10091C438, 0));

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("This book is no longer shared with you."), &stru_10091C438, 0));
  v31 = (void *)v12;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v14, v12, 1));

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("Cancel"), &stru_10091C438, 0));
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v17, 1, 0));
  objc_msgSend(v15, "addAction:", v18);

  v19 = objc_opt_class(BKAssetID);
  v20 = BUDynamicCast(v19, v9);
  v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "assetID"));

  if (v22)
  {
    v30 = v8;
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("Delete Book"), &stru_10091C438, 0));
    v39[0] = _NSConcreteStackBlock;
    v39[1] = 3221225472;
    v39[2] = sub_1000B7C90;
    v39[3] = &unk_1008E9710;
    v25 = v22;
    v40 = v25;
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v24, 2, v39));
    objc_msgSend(v15, "addAction:", v26);

    v37[0] = 0;
    v37[1] = v37;
    v37[2] = 0x3032000000;
    v37[3] = sub_10004E370;
    v37[4] = sub_10004E238;
    v38 = self;
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "localizedStringForKey:value:table:", CFSTR("View in Book Store"), &stru_10091C438, 0));
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_1000B7D2C;
    v33[3] = &unk_1008E9738;
    v36 = v37;
    v34 = v25;
    v35 = v10;
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v28, 0, v33));
    objc_msgSend(v15, "addAction:", v29);

    _Block_object_dispose(v37, 8);
    v8 = v30;
  }
  objc_msgSend(v10, "presenterShowAlertController:animated:", v15, 1);

}

- (void)preflightShowAssetWithTransaction:(id)a3 assetIdentifier:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  _QWORD v25[4];
  id v26;
  char v27;

  v8 = a3;
  v9 = a5;
  v10 = a4;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookFlowController libraryAssetProvider](self, "libraryAssetProvider"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "libraryAssetOnMainQueueWithAssetIdentifier:", v10));

  LOBYTE(v10) = objc_msgSend(v12, "isLocal");
  if ((v10 & 1) != 0
    || !+[BKReachability isOffline](BKReachability, "isOffline"))
  {
    v23 = objc_retainBlock(v9);
    v24 = v23;
    if (v23)
      (*((void (**)(id, uint64_t))v23 + 2))(v23, 1);

  }
  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("This book can’t be downloaded."), &stru_10091C438, 0));

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("Apple Books isn’t connected to the internet."), &stru_10091C438, 0));

    v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v14, v16, 1));
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_10091C438, 0));
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v19, 1, 0));
    objc_msgSend(v17, "addAction:", v20);

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookFlowController _bookFlowAssetPresentingForShowAssetAction:](self, "_bookFlowAssetPresentingForShowAssetAction:", v8));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "presenterSceneController"));
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_1000B8004;
    v25[3] = &unk_1008E90E8;
    v26 = v9;
    v27 = 0;
    objc_msgSend(v22, "presentViewController:animated:completion:", v17, 1, v25);

  }
}

- (void)handleBookOpenErrorWithTransaction:(id)a3 error:(id)a4 assetIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  unsigned __int8 v12;
  void *v13;
  unsigned int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  unsigned int v19;
  _QWORD v20[5];
  id v21;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v9, "code") != (id)2002
    || (v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "domain")),
        v12 = objc_msgSend(v11, "isEqualToString:", AssetEngineErrorDomain),
        v11,
        (v12 & 1) == 0))
  {
    if (objc_msgSend(v9, "code") == (id)2003
      && (v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "domain")),
          v14 = objc_msgSend(v13, "isEqualToString:", AssetEngineErrorDomain),
          v13,
          v14))
    {
      -[BKBookFlowController handleFamilyChangeErrorWithTransaction:error:assetIdentifier:](self, "handleFamilyChangeErrorWithTransaction:error:assetIdentifier:", v8, v9, v10);
    }
    else if (objc_msgSend(v9, "code") == (id)3001)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookFlowController libraryAssetProvider](self, "libraryAssetProvider"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "libraryAssetOnMainQueueWithAssetIdentifier:", v10));

      v17 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookFlowController libraryAssetProvider](self, "libraryAssetProvider"));
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_1000B8224;
      v20[3] = &unk_1008E92A0;
      v20[4] = self;
      v21 = v8;
      objc_msgSend(v17, "assetForLibraryAsset:completion:", v16, v20);

    }
    else if (objc_msgSend(v9, "code") == (id)1)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "domain"));
      v19 = objc_msgSend(v18, "isEqualToString:", CFSTR("BKAssetLookup"));

      if (v19)
        -[BKBookFlowController showInstallationErrorWithTransaction:assetIdentifier:](self, "showInstallationErrorWithTransaction:assetIdentifier:", v8, v10);
    }
  }

}

- (void)showNotEnoughMemAlertWithTransaction:(id)a3 name:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Unable to Open “%@”"), &stru_10091C438, 0));
  v18 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v9, v6));

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("Cannot Open Document"), &stru_10091C438, 0));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v11, v18, 1));

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_10091C438, 0));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v14, 1, 0));
  objc_msgSend(v12, "addAction:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookFlowController _bookFlowAssetPresentingForShowAssetAction:](self, "_bookFlowAssetPresentingForShowAssetAction:", v7));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "presenterSceneController"));
  objc_msgSend(v17, "presentViewController:animated:completion:", v12, 1, 0);

}

- (void)showInstallationErrorWithTransaction:(id)a3 assetIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v26[5];
  id v27;
  _QWORD v28[5];
  id v29;

  v6 = a3;
  if (a4)
  {
    v7 = a4;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager defaultManager](BKLibraryManager, "defaultManager"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "libraryAssetOnMainQueueWithAssetIdentifier:", v7));

    if (v9)
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "title"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("There is not enough available storage to install this book. You can manage your storage in Settings."), &stru_10091C438, 0));

      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("Cannot install “%@”"), &stru_10091C438, 0));
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v12, v25));
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v13, v24, 1));

      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_10091C438, 0));
      v28[0] = _NSConcreteStackBlock;
      v28[1] = 3221225472;
      v28[2] = sub_1000B87F8;
      v28[3] = &unk_1008E9760;
      v28[4] = self;
      v17 = v9;
      v29 = v17;
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v16, 1, v28));
      objc_msgSend(v14, "addAction:", v18);

      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("Settings"), &stru_10091C438, 0));
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472;
      v26[2] = sub_1000B8894;
      v26[3] = &unk_1008E9760;
      v26[4] = self;
      v27 = v17;
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v20, 0, v26));
      objc_msgSend(v14, "addAction:", v21);

      v22 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookFlowController _bookFlowAssetPresentingForShowAssetAction:](self, "_bookFlowAssetPresentingForShowAssetAction:", v6));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "presenterSceneController"));
      objc_msgSend(v23, "presentViewController:animated:completion:", v14, 1, 0);

    }
  }

}

- (void)showAssetWithTransaction:(id)a3 storeID:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[5];
  id v16;
  id v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  id v25;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v9 && objc_msgSend(v9, "unsignedLongLongValue"))
  {
    v19 = 0;
    v20 = &v19;
    v21 = 0x3032000000;
    v22 = sub_10004E370;
    v23 = sub_10004E238;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[BSUIItemDescriptionCache sharedInstance](BSUIItemDescriptionCache, "sharedInstance"));
    v25 = v9;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v25, 1));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "itemDescriptionsFromIdentifiers:", v12));
    v24 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", v9));

    v14 = (void *)v20[5];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1000B8B50;
    v15[3] = &unk_1008E9788;
    v15[4] = self;
    v16 = v8;
    v17 = v10;
    v18 = &v19;
    objc_msgSend(v14, "get:", v15);

    _Block_object_dispose(&v19, 8);
  }

}

- (void)presentItem:(id)a3 transaction:(id)a4 host:(id)a5 source:(id)a6
{
  -[BKBookFlowController presentItem:transaction:host:source:options:](self, "presentItem:transaction:host:source:options:", a3, a4, a5, a6, &__NSDictionary0__struct);
}

- (void)presentItem:(id)a3 transaction:(id)a4 host:(id)a5 source:(id)a6 options:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;

  v17 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "storeID"));
  if (v17 && v16)
    -[BKBookFlowController _presentItem:transaction:host:source:options:](self, "_presentItem:transaction:host:source:options:", v17, v12, v13, v14, v15);

}

- (void)_presentItem:(id)a3 transaction:(id)a4 host:(id)a5 source:(id)a6 options:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  unsigned int v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  id v37;
  void *v38;
  _QWORD v39[4];
  id v40;
  BKBookFlowController *v41;
  id v42;
  id v43;
  id v44;
  _QWORD v45[4];
  id v46;
  BKBookFlowController *v47;
  id v48;
  id v49;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "storeID"));
  v18 = (void *)v17;
  if (v12 && v17)
  {
    if (-[BKBookFlowController isOpeningFromCard:options:](self, "isOpeningFromCard:options:", v13, v16))
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "storeID"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[BKAssetID identifierWithAssetID:](BKAssetID, "identifierWithAssetID:", v19));
      v21 = objc_claimAutoreleasedReturnValue(-[BKBookFlowController _prepareOpenFromCardOverlayWithTransaction:assetIdentifier:options:](self, "_prepareOpenFromCardOverlayWithTransaction:assetIdentifier:options:", v13, v20, v16));

      v16 = (id)v21;
    }
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookFlowController libraryAssetProvider](self, "libraryAssetProvider"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "libraryAssetOnMainQueueWithAssetID:", v18));

    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", v16));
    objc_msgSend(v24, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, CFSTR("BKBookPresentingCanPresentOverStore"));
    objc_msgSend(v24, "setObject:forKeyedSubscript:", v14, CFSTR("BKBookPresentingCoverAnimationHost"));
    objc_msgSend(v24, "setObject:forKeyedSubscript:", v15, CFSTR("BKBookPresentingCoverAnimationSource"));
    if (objc_msgSend(v23, "canOpen"))
    {
      -[BKBookFlowController showAssetWithTransaction:assetID:location:options:completion:](self, "showAssetWithTransaction:assetID:location:options:completion:", v13, v18, 0, v24, 0);
    }
    else if (objc_msgSend(v23, "isCloud") && (objc_msgSend(v23, "isPreorderBook") & 1) == 0)
    {
      v38 = (void *)objc_claimAutoreleasedReturnValue(+[BKAssetID identifierWithAssetID:](BKAssetID, "identifierWithAssetID:", v18));
      v45[0] = _NSConcreteStackBlock;
      v45[1] = 3221225472;
      v45[2] = sub_1000B9110;
      v45[3] = &unk_1008E97D8;
      v46 = v13;
      v47 = self;
      v48 = v23;
      v49 = v24;
      -[BKBookFlowController minifiedAssetPresenterForAssetIdentifier:transaction:completion:](self, "minifiedAssetPresenterForAssetIdentifier:transaction:completion:", v38, v46, v45);

    }
    else
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "sampleDownloadURL"));

      if (v25)
      {
        v35 = v23;
        v26 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "artworkURLTemplate"));
        if (v26)
        {
          v36 = v15;
          v27 = (void *)objc_claimAutoreleasedReturnValue(+[BCCacheManager defaultCacheManager](BCCacheManager, "defaultCacheManager"));
          v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "storeID"));
          objc_msgSend(v27, "addURLTemplate:forIdentifier:", v26, v28);

          v15 = v36;
        }
        v34 = (void *)v26;
        v29 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "title"));
        if (v29)
          objc_msgSend(v24, "setObject:forKeyedSubscript:", v29, CFSTR("title"));
        v37 = v14;
        v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "author", v29));
        if (v30)
          objc_msgSend(v24, "setObject:forKeyedSubscript:", v30, CFSTR("author"));
        v31 = (void *)objc_claimAutoreleasedReturnValue(+[BKAppDelegate delegate](BKAppDelegate, "delegate"));
        v32 = objc_msgSend(v31, "isConnectedToInternet");

        if (v32)
        {
          v39[0] = _NSConcreteStackBlock;
          v39[1] = 3221225472;
          v39[2] = sub_1000B9420;
          v39[3] = &unk_1008E78B8;
          v40 = v18;
          v41 = self;
          v42 = v24;
          v43 = v13;
          v44 = v16;
          objc_msgSend(v43, "commit:", v39);

        }
        v23 = v35;
        v14 = v37;
      }
    }

  }
}

- (BKSceneHosting)sceneHosting
{
  return (BKSceneHosting *)objc_loadWeakRetained((id *)&self->_sceneHosting);
}

- (BKStorePresenting)storePresenter
{
  return self->_storePresenter;
}

- (BKLibraryAssetProvider)libraryAssetProvider
{
  return self->_libraryAssetProvider;
}

- (_BKShowAssetInvocation)runningShowAssetInvocation
{
  return self->_runningShowAssetInvocation;
}

- (void)setRunningShowAssetInvocation:(id)a3
{
  objc_storeStrong((id *)&self->_runningShowAssetInvocation, a3);
}

- (NSArray)pendingShowAssetInvocations
{
  return self->_pendingShowAssetInvocations;
}

- (void)setPendingShowAssetInvocations:(id)a3
{
  objc_storeStrong((id *)&self->_pendingShowAssetInvocations, a3);
}

- (CGRect)openAnimationRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_openAnimationRect.origin.x;
  y = self->_openAnimationRect.origin.y;
  width = self->_openAnimationRect.size.width;
  height = self->_openAnimationRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setOpenAnimationRect:(CGRect)a3
{
  self->_openAnimationRect = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingShowAssetInvocations, 0);
  objc_storeStrong((id *)&self->_runningShowAssetInvocation, 0);
  objc_storeStrong((id *)&self->_libraryAssetProvider, 0);
  objc_storeStrong((id *)&self->_minifiedPresenter, 0);
  objc_storeStrong((id *)&self->_storePresenter, 0);
  objc_destroyWeak((id *)&self->_sceneHosting);
}

@end
