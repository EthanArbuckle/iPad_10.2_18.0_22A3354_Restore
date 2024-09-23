@implementation CRLPasteboardMultipleImportableBoardItemProvider

- (CRLPasteboardMultipleImportableBoardItemProvider)initWithImportableBoardItemProviders:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  CRLPasteboardMultipleImportableBoardItemProvider *v10;
  dispatch_queue_t v11;
  OS_dispatch_queue *mProviderQueue;
  CRLMultipleImporterHelper *v13;
  CRLMultipleImporterHelper *mImporterHelper;
  id v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  void *i;
  void *v21;
  void *v22;
  CRLProgressGroup *v23;
  CRLProgress *mProgress;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  objc_super v30;
  _BYTE v31[128];

  v4 = a3;
  v5 = objc_msgSend(v4, "count");
  v6 = v5;
  if (!v4 || !v5)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125B948);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E305C4();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125B968);
    v7 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE87A4(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLPasteboardMultipleImportableBoardItemProvider initWithImportableBoardItemProviders:]"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLPasteboardMultipleImportableBoardItemProvider.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v8, v9, 37, 0, "Invalid parameter not satisfying: %{public}s", "(boardItemProviders != nil) && (boardItemProvidersCount > 0)");

  }
  v30.receiver = self;
  v30.super_class = (Class)CRLPasteboardMultipleImportableBoardItemProvider;
  v10 = -[CRLPasteboardMultipleImportableBoardItemProvider init](&v30, "init");
  if (v10)
  {
    v11 = dispatch_queue_create("CRLPasteboardMultipleImportableBoardItemProvider", 0);
    mProviderQueue = v10->mProviderQueue;
    v10->mProviderQueue = (OS_dispatch_queue *)v11;

    v13 = -[CRLMultipleImporterHelper initWithImporters:]([CRLMultipleImporterHelper alloc], "initWithImporters:", v4);
    mImporterHelper = v10->mImporterHelper;
    v10->mImporterHelper = v13;

    v15 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", v6);
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v16 = v4;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v18; i = (char *)i + 1)
        {
          if (*(_QWORD *)v27 != v19)
            objc_enumerationMutation(v16);
          v21 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)i);
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "progress"));
          if (v22)
            objc_msgSend(v15, "addObject:", v22);
          objc_msgSend(v21, "setDelegate:", v10);

        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
      }
      while (v18);
    }

    v23 = -[CRLProgressGroup initWithChildren:]([CRLProgressGroup alloc], "initWithChildren:", v15);
    mProgress = v10->mProgress;
    v10->mProgress = &v23->super;

  }
  return v10;
}

- (NSArray)boardItemProviders
{
  return -[CRLMultipleImporterHelper importers](self->mImporterHelper, "importers");
}

- (BOOL)p_validateSizeOfImportWithTotalSize:(unint64_t)a3 totalEmbeddedDataSize:(unint64_t)a4 insertedImage:(BOOL)a5 insertedMovie:(BOOL)a6 insertedAudio:(BOOL)a7 preexistingTooLargeErrors:(id)a8 error:(id *)a9
{
  if (a9)
    *a9 = 0;
  return 1;
}

- (void)provideBoardItemsWithFactory:(id)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *i;
  void *v16;
  NSObject *mProviderQueue;
  id v18;
  id v19;
  id v20;
  CRLPasteboardMultipleImportableBoardItemProvider *v21;
  _QWORD block[4];
  id v23;
  CRLPasteboardMultipleImportableBoardItemProvider *v24;
  id v25;
  _QWORD v26[4];
  NSObject *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];

  v6 = a3;
  v20 = a4;
  if (!v20)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125B988);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E30664();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125B9A8);
    v7 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE87A4(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLPasteboardMultipleImportableBoardItemProvider provideBoardItemsWithFactory:completionHandler:]"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLPasteboardMultipleImportableBoardItemProvider.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v8, v9, 85, 0, "Invalid parameter not satisfying: %{public}s", "completionHandler != nil");

  }
  v10 = dispatch_group_create();
  v21 = self;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLMultipleImporterHelper importers](self->mImporterHelper, "importers"));
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(_QWORD *)v29 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)i);
        dispatch_group_enter(v10);
        v26[0] = _NSConcreteStackBlock;
        v26[1] = 3221225472;
        v26[2] = sub_10040B75C;
        v26[3] = &unk_10122D110;
        v27 = v10;
        objc_msgSend(v16, "provideBoardItemWithFactory:completionHandler:", v6, v26);

      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v13);
  }
  mProviderQueue = v21->mProviderQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10040B764;
  block[3] = &unk_101234DA0;
  v23 = v11;
  v24 = v21;
  v25 = v20;
  v18 = v20;
  v19 = v11;
  dispatch_group_notify(v10, mProviderQueue, block);

}

- (void)cancel
{
  NSObject *mProviderQueue;
  _QWORD block[5];

  mProviderQueue = self->mProviderQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10040BC48;
  block[3] = &unk_10122D110;
  block[4] = self;
  dispatch_async(mProviderQueue, block);
}

- (NSArray)boardItems
{
  return (NSArray *)-[NSArray crl_boardItemsFromIngestibleItemsAndDescriptions:](self->mPasteboardBoardItems, "crl_boardItemsFromIngestibleItemsAndDescriptions:", self->mPasteboardBoardItems);
}

- (NSString)localizedErrorDescription
{
  void *v2;
  id v3;
  void *v4;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPasteboardMultipleImportableBoardItemProvider errors](self, "errors"));
  v3 = objc_msgSend(v2, "count");

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("%ld items couldn’t be inserted."), 0, 0));
    v3 = (id)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v5, v3));

  }
  return (NSString *)v3;
}

- (void)importableBoardItemProvider:(id)a3 needsMediaCompatibilityFeedbackWithReasons:(int64_t)a4 forMediaType:(int64_t)a5 usingBlock:(id)a6
{
  id v10;
  id v11;
  NSObject *mProviderQueue;
  id v13;
  id v14;
  _QWORD block[5];
  id v16;
  id v17;
  int64_t v18;
  int64_t v19;

  v10 = a3;
  v11 = a6;
  mProviderQueue = self->mProviderQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10040BE08;
  block[3] = &unk_10125B9D0;
  block[4] = self;
  v16 = v10;
  v18 = a4;
  v19 = a5;
  v17 = v11;
  v13 = v11;
  v14 = v10;
  dispatch_async(mProviderQueue, block);

}

- (void)importableBoardItemProviderWillIgnoreMediaCompatibilityOnAllDevicesRequirement:(id)a3
{
  id v4;
  NSObject *mProviderQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  mProviderQueue = self->mProviderQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10040BEC8;
  v7[3] = &unk_10122D3D8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(mProviderQueue, v7);

}

- (void)p_boardItemProviderDidRequestMediaCompatibilityRequirement:(id)a3
{
  void *v4;
  CRLMultipleImporterHelper *mImporterHelper;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  int64_t v10;
  _BOOL8 v11;
  _QWORD v12[5];

  -[CRLMultipleImporterHelper mediaCompatibilityCheckHasBeenHandledForImporter:](self->mImporterHelper, "mediaCompatibilityCheckHasBeenHandledForImporter:", a3);
  if (-[CRLMultipleImporterHelper allImportersHaveGivenCompatibilityResponse](self->mImporterHelper, "allImportersHaveGivenCompatibilityResponse")&& -[CRLMultipleImporterHelper numberOfImportersRequiringCompatibilityConversion](self->mImporterHelper, "numberOfImportersRequiringCompatibilityConversion"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPasteboardMultipleImportableBoardItemProvider alertPresenter](self, "alertPresenter"));
    mImporterHelper = self->mImporterHelper;
    if (v4)
    {
      v6 = -[CRLMultipleImporterHelper mediaTypeForConversion](mImporterHelper, "mediaTypeForConversion");
      if (!v6)
      {
        +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_10125B9F0);
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          sub_100E30704();
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_10125BA10);
        v7 = off_1013D9070;
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          sub_100DE87A4(v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLPasteboardMultipleImportableBoardItemProvider p_boardItemProviderDidRequestMediaCompatibilityRequirement:]"));
        v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLPasteboardMultipleImportableBoardItemProvider.m"));
        +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v8, v9, 248, 0, "No media types were specified! Falling back to Mixed to have understandable strings.");

        v6 = 3;
      }
      v10 = -[CRLMultipleImporterHelper reasonsForMediaConversion](self->mImporterHelper, "reasonsForMediaConversion");
      v11 = (id)-[CRLMultipleImporterHelper numberOfImportersRequiringCompatibilityConversion](self->mImporterHelper, "numberOfImportersRequiringCompatibilityConversion") == (id)1;
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_10040C168;
      v12[3] = &unk_10125BA60;
      v12[4] = self;
      objc_msgSend(v4, "presentMediaCompatibilityAlertWithReasons:forMediaType:forSingleMediaObject:completionHandler:", v10, v6, v11, v12);
    }
    else
    {
      -[CRLMultipleImporterHelper completeImportWithCompatibilityOnAllDevices:allowHEVCContent:](mImporterHelper, "completeImportWithCompatibilityOnAllDevices:allowHEVCContent:", 0, 1);
    }

  }
}

- (CRLMediaCompatibilityAlertPresenter)alertPresenter
{
  return (CRLMediaCompatibilityAlertPresenter *)objc_loadWeakRetained((id *)&self->mAlertPresenter);
}

- (void)setAlertPresenter:(id)a3
{
  objc_storeWeak((id *)&self->mAlertPresenter, a3);
}

- (CRLProgress)progress
{
  return self->mProgress;
}

- (BOOL)isCancelled
{
  return self->mCancelled;
}

- (NSArray)pasteboardBoardItems
{
  return self->mPasteboardBoardItems;
}

- (NSArray)errors
{
  return self->mErrors;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mErrors, 0);
  objc_storeStrong((id *)&self->mPasteboardBoardItems, 0);
  objc_storeStrong((id *)&self->mProgress, 0);
  objc_storeStrong((id *)&self->mImporterHelper, 0);
  objc_destroyWeak((id *)&self->mAlertPresenter);
  objc_storeStrong((id *)&self->mProviderQueue, 0);
}

@end
