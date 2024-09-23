@implementation BKAssetPresentingViewController

- (void)assetViewControllerRequestToBuy:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id location;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController storeID](self, "storeID"));
  if (v8
    || (v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController assetIdentifier](self, "assetIdentifier")),
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "permanentAssetID")),
        v9,
        v8))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKAssetPresentingViewController ba_effectiveAnalyticsTracker](self, "ba_effectiveAnalyticsTracker"));
    objc_initWeak(&location, self);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController sampleProfileFuture](self, "sampleProfileFuture"));
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1000910C4;
    v16[3] = &unk_1008E8170;
    objc_copyWeak(&v21, &location);
    v12 = v10;
    v17 = v12;
    v13 = v8;
    v18 = v13;
    v19 = v6;
    v20 = v7;
    objc_msgSend(v11, "get:", v16);

    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);

  }
  else
  {
    v14 = objc_retainBlock(v7);
    v15 = v14;
    if (v14)
      (*((void (**)(id, _QWORD, _QWORD))v14 + 2))(v14, 0, 0);

  }
}

- (void)_trackProgressForLibraryAsset:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  void *v21;
  BOOL v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  _QWORD v30[4];
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36[2];
  BOOL v37;
  id location;

  v4 = a3;
  if ((objc_msgSend(v4, "isSample") & 1) == 0 && (objc_msgSend(v4, "isAudiobook") & 1) == 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController assetViewController](self, "assetViewController"));
    if ((objc_opt_respondsToSelector(v5, "pageCountIncludingUpsell") & 1) != 0)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController assetViewController](self, "assetViewController"));
      v7 = (uint64_t)objc_msgSend(v6, "pageCountIncludingUpsell");

    }
    else
    {
      v7 = 0x7FFFFFFFFFFFFFFFLL;
    }

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController assetViewController](self, "assetViewController"));
    v9 = BUProtocolCast(&OBJC_PROTOCOL___BCProgressContextTreeBuilding, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

    v11 = BCProgressKitLog();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      sub_10069D16C(v4, v12);

    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "title"));
    if (objc_msgSend(v13, "length"))
      v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "title"));
    else
      v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "sortTitle"));
    v15 = (void *)v14;

    if (!objc_msgSend(v15, "length"))
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("Untitled"), &stru_10091C438, 0));

      v18 = BCProgressKitLog();
      v19 = objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        sub_10069D140();

      v15 = (void *)v17;
    }
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[BKBasePresentingViewController assetIdentifier](self, "assetIdentifier"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "permanentAssetID"));

    objc_initWeak(&location, self);
    v22 = (objc_msgSend(v4, "isSample") & 1) == 0
       && (objc_msgSend(v4, "isAudiobook") & 1) == 0
       && objc_msgSend(v4, "contentType") != 3;
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "versionNumberHumanReadable"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "storeID"));
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_100091B4C;
    v30[3] = &unk_1008E8210;
    v25 = v21;
    v31 = v25;
    v26 = v23;
    v32 = v26;
    v27 = v15;
    v33 = v27;
    v36[1] = (id)v7;
    v28 = v24;
    v34 = v28;
    objc_copyWeak(v36, &location);
    v37 = v22;
    v29 = v10;
    v35 = v29;
    +[BKLibraryManager fetchImageForAsset:size:includeSpine:includeShadow:coverEffectsEnvironment:completion:](BKLibraryManager, "fetchImageForAsset:size:includeSpine:includeShadow:coverEffectsEnvironment:completion:", v4, 0, 0, 0, v30, 240.0, 240.0);

    objc_destroyWeak(v36);
    objc_destroyWeak(&location);

  }
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  return sel_isEqual(a3, "performClose:");
}

- (void)performClose:(id)a3
{
  -[BKAssetPresentingViewController im_dismissAnimated:](self, "im_dismissAnimated:", 1);
}

@end
