@implementation CRLMultipleItemImporter

- (CRLMultipleItemImporter)initWithURLs:(id)a3 boardItemFactory:(id)a4
{
  return -[CRLMultipleItemImporter initWithURLs:boardItemFactory:importAnimatedGIFsAsImages:](self, "initWithURLs:boardItemFactory:importAnimatedGIFsAsImages:", a3, a4, 0);
}

- (CRLMultipleItemImporter)initWithURLs:(id)a3 boardItemFactory:(id)a4 importAnimatedGIFsAsImages:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  CRLMultipleItemImporter *v10;
  CRLMultipleItemImporter *v11;
  NSArray *v12;
  NSArray *URLs;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  unsigned __int8 v21;
  __objc2_class **v22;
  id v23;
  void *v24;
  CRLMultipleImporterHelper *v25;
  CRLMultipleImporterHelper *importerHelper;
  id v28;
  NSArray *obj;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  objc_super v35;
  _BYTE v36[128];

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v35.receiver = self;
  v35.super_class = (Class)CRLMultipleItemImporter;
  v10 = -[CRLMultipleItemImporter init](&v35, "init");
  v11 = v10;
  if (v10)
  {
    sub_100438CC8((id *)&v10->super.isa, v9);
    v28 = v8;
    v12 = (NSArray *)objc_msgSend(v8, "copy");
    URLs = v11->_URLs;
    v11->_URLs = v12;

    v30 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSArray count](v11->_URLs, "count"));
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    obj = v11->_URLs;
    v14 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v32;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v32 != v16)
            objc_enumerationMutation(obj);
          v18 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * (_QWORD)v17);
          if (!v5
            || (v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * (_QWORD)v17), "crl_fileTypeIdentifierHandlingFileCoordinationPromises")), v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "identifier")), v21 = +[CRLBoardItemImporter isSupportedAnimatedImageFileType:](CRLBoardItemImporter, "isSupportedAnimatedImageFileType:", v20), v20, v19, v22 = off_1012298F8, (v21 & 1) == 0))
          {
            v22 = off_1012297E0;
          }
          v23 = objc_msgSend(objc_alloc(*v22), "initWithURL:boardItemFactory:", v18, v9);
          v24 = v23;
          if (v23)
          {
            objc_msgSend(v23, "setDelegate:", v11);
            objc_msgSend(v30, "addObject:", v24);
          }

          v17 = (char *)v17 + 1;
        }
        while (v15 != v17);
        v15 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
      }
      while (v15);
    }

    sub_100438D6C(v11, v30);
    v25 = -[CRLMultipleImporterHelper initWithImporters:]([CRLMultipleImporterHelper alloc], "initWithImporters:", v30);
    importerHelper = v11->_importerHelper;
    v11->_importerHelper = v25;

    v8 = v28;
  }

  return v11;
}

- (CRLMultipleItemImporter)initWithDataWrappers:(id)a3 boardItemFactory:(id)a4 importAnimatedGIFsAsImages:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  CRLMultipleItemImporter *v10;
  CRLMultipleItemImporter *v11;
  NSArray *URLs;
  id v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  __objc2_class **v22;
  id v23;
  void *v24;
  CRLMultipleImporterHelper *v25;
  CRLMultipleImporterHelper *importerHelper;
  id v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  objc_super v34;
  _BYTE v35[128];

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v34.receiver = self;
  v34.super_class = (Class)CRLMultipleItemImporter;
  v10 = -[CRLMultipleItemImporter init](&v34, "init");
  v11 = v10;
  if (v10)
  {
    v28 = v9;
    sub_100438CC8((id *)&v10->super.isa, v9);
    URLs = v11->_URLs;
    v11->_URLs = (NSArray *)&__NSArray0__struct;

    v13 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v8, "count"));
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v29 = v8;
    v14 = v8;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v31;
      do
      {
        v18 = 0;
        do
        {
          if (*(_QWORD *)v31 != v17)
            objc_enumerationMutation(v14);
          v19 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)v18);
          if (!v5
            || (v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)v18), "type")),
                v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v20, "identifier")),
                (id)v20,
                LOBYTE(v20) = +[CRLBoardItemImporter isSupportedAnimatedImageFileType:](CRLBoardItemImporter, "isSupportedAnimatedImageFileType:", v21), v21, v22 = off_1012298F8, (v20 & 1) == 0))
          {
            v22 = off_1012297E0;
          }
          v23 = objc_msgSend(objc_alloc(*v22), "initWithData:boardItemFactory:", v19, v11->_boardItemFactory);
          v24 = v23;
          if (v23)
          {
            objc_msgSend(v23, "setDelegate:", v11);
            objc_msgSend(v13, "addObject:", v24);
          }

          v18 = (char *)v18 + 1;
        }
        while (v16 != v18);
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
      }
      while (v16);
    }

    sub_100438D6C(v11, v13);
    v25 = -[CRLMultipleImporterHelper initWithImporters:]([CRLMultipleImporterHelper alloc], "initWithImporters:", v13);
    importerHelper = v11->_importerHelper;
    v11->_importerHelper = v25;

    v9 = v28;
    v8 = v29;
  }

  return v11;
}

- (CRLMultipleItemImporter)init
{
  unsigned int v2;
  NSObject *v3;
  void *v4;
  NSObject *v5;
  char *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint8_t buf[4];
  unsigned int v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;

  v2 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_10125DF80);
  v3 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109890;
    v12 = v2;
    v13 = 2082;
    v14 = "-[CRLMultipleItemImporter init]";
    v15 = 2082;
    v16 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLMultipleItemImporter.m";
    v17 = 1024;
    v18 = 167;
    _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Do not call method", buf, 0x22u);
  }
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_10125DFA0);
  v4 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
  {
    v5 = v4;
    v6 = (char *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
    *(_DWORD *)buf = 67109378;
    v12 = v2;
    v13 = 2114;
    v14 = v6;
    _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLMultipleItemImporter init]"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLMultipleItemImporter.m"));
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 167, 0, "Do not call method");

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s: %s"), "Do not call method", "-[CRLMultipleItemImporter init]"));
  v10 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v9, 0));

  objc_exception_throw(v10);
}

- (void)importBoardItemsWithCompletionHandler:(id)a3
{
  NSObject *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSObject *importQueue;
  id v12;
  id v13;
  _QWORD block[5];
  id v15;
  _QWORD v16[4];
  NSObject *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  v13 = a3;
  v4 = dispatch_group_create();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLMultipleImporterHelper importers](self->_importerHelper, "importers"));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v19;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v19 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)v9);
        dispatch_group_enter(v4);
        v16[0] = _NSConcreteStackBlock;
        v16[1] = 3221225472;
        v16[2] = sub_1004395AC;
        v16[3] = &unk_10122D110;
        v17 = v4;
        objc_msgSend(v10, "importBoardItemWithCompletionHandler:", v16);

        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v7);
  }

  importQueue = self->_importQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1004395B4;
  block[3] = &unk_101231F00;
  block[4] = self;
  v15 = v13;
  v12 = v13;
  dispatch_group_notify(v4, importQueue, block);

}

- (void)cancel
{
  NSObject *importQueue;
  _QWORD block[5];

  importQueue = self->_importQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100439974;
  block[3] = &unk_10122D110;
  block[4] = self;
  dispatch_async(importQueue, block);
}

- (NSString)localizedErrorDescription
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLMultipleItemImporter errors](self, "errors"));
  v3 = objc_msgSend(v2, "count");

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v3));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumberFormatter localizedStringFromNumber:numberStyle:](NSNumberFormatter, "localizedStringFromNumber:numberStyle:", v4, 1));

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("%@ files couldn’t be inserted."), 0, 0));
    v3 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v7, v5));

  }
  return (NSString *)v3;
}

- (void)boardItemImporter:(id)a3 needsMediaCompatibilityFeedbackWithReasons:(int64_t)a4 forMediaType:(int64_t)a5 usingBlock:(id)a6
{
  id v10;
  id v11;
  NSObject *importQueue;
  id v13;
  id v14;
  _QWORD block[5];
  id v16;
  id v17;
  int64_t v18;
  int64_t v19;

  v10 = a3;
  v11 = a6;
  importQueue = self->_importQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100439B58;
  block[3] = &unk_10125B9D0;
  block[4] = self;
  v16 = v10;
  v18 = a4;
  v19 = a5;
  v17 = v11;
  v13 = v11;
  v14 = v10;
  dispatch_async(importQueue, block);

}

- (void)boardItemImporterWillIgnoreMediaCompatibilityOnAllDevicesRequirement:(id)a3
{
  id v4;
  NSObject *importQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  importQueue = self->_importQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100439C08;
  v7[3] = &unk_10122D3D8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(importQueue, v7);

}

- (void)p_importerDidRequestMediaCompatibilityRequirement:(id)a3
{
  void *v4;
  CRLMultipleImporterHelper *importerHelper;
  uint64_t v6;
  int v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  int64_t v12;
  _BOOL8 v13;
  _QWORD v14[5];

  -[CRLMultipleImporterHelper mediaCompatibilityCheckHasBeenHandledForImporter:](self->_importerHelper, "mediaCompatibilityCheckHasBeenHandledForImporter:", a3);
  if (-[CRLMultipleImporterHelper allImportersHaveGivenCompatibilityResponse](self->_importerHelper, "allImportersHaveGivenCompatibilityResponse")&& -[CRLMultipleImporterHelper numberOfImportersRequiringCompatibilityConversion](self->_importerHelper, "numberOfImportersRequiringCompatibilityConversion"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLMultipleItemImporter alertPresenter](self, "alertPresenter"));
    importerHelper = self->_importerHelper;
    if (v4)
    {
      v6 = -[CRLMultipleImporterHelper mediaTypeForConversion](importerHelper, "mediaTypeForConversion");
      if (!v6)
      {
        v7 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_10125DFC0);
        v8 = off_1013D9070;
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          sub_100E34784(v7, v8);
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_10125DFE0);
        v9 = off_1013D9070;
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          sub_100DE81F0(v9, v7);
        v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLMultipleItemImporter p_importerDidRequestMediaCompatibilityRequirement:]"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLMultipleItemImporter.m"));
        +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v10, v11, 318, 0, "No media types were specified! Falling back to Mixed to have understandable strings.");

        v6 = 3;
      }
      v12 = -[CRLMultipleImporterHelper reasonsForMediaConversion](self->_importerHelper, "reasonsForMediaConversion");
      v13 = (id)-[CRLMultipleImporterHelper numberOfImportersRequiringCompatibilityConversion](self->_importerHelper, "numberOfImportersRequiringCompatibilityConversion") == (id)1;
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_100439E84;
      v14[3] = &unk_10125BA60;
      v14[4] = self;
      objc_msgSend(v4, "presentMediaCompatibilityAlertWithReasons:forMediaType:forSingleMediaObject:completionHandler:", v12, v6, v13, v14);
    }
    else
    {
      -[CRLMultipleImporterHelper completeImportWithCompatibilityOnAllDevices:allowHEVCContent:](importerHelper, "completeImportWithCompatibilityOnAllDevices:allowHEVCContent:", 0, 1);
    }

  }
}

- (NSArray)URLs
{
  return self->_URLs;
}

- (_TtC8Freeform19CRLBoardItemFactory)boardItemFactory
{
  return self->_boardItemFactory;
}

- (CRLMediaCompatibilityAlertPresenter)alertPresenter
{
  return (CRLMediaCompatibilityAlertPresenter *)objc_loadWeakRetained((id *)&self->_alertPresenter);
}

- (void)setAlertPresenter:(id)a3
{
  objc_storeWeak((id *)&self->_alertPresenter, a3);
}

- (BOOL)isCancelled
{
  return self->_cancelled;
}

- (CRLProgress)progress
{
  return &self->_progress->super;
}

- (void)setProgress:(id)a3
{
  objc_storeStrong((id *)&self->_progress, a3);
}

- (BOOL)usesProgressDialog
{
  return self->_usesProgressDialog;
}

- (NSArray)boardItems
{
  return self->_boardItems;
}

- (void)setBoardItems:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSArray)errors
{
  return self->_errors;
}

- (void)setErrors:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errors, 0);
  objc_storeStrong((id *)&self->_boardItems, 0);
  objc_destroyWeak((id *)&self->_alertPresenter);
  objc_storeStrong((id *)&self->_boardItemFactory, 0);
  objc_storeStrong((id *)&self->_URLs, 0);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_importerHelper, 0);
  objc_storeStrong((id *)&self->_importQueue, 0);
}

@end
