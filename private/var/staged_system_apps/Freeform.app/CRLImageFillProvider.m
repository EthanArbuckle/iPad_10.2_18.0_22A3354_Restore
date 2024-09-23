@implementation CRLImageFillProvider

+ (NSArray)readableTypeIdentifiersForItemProvider
{
  return +[CRLBoardItemImporter supportedImageFileTypes](CRLBoardItemImporter, "supportedImageFileTypes");
}

+ (id)objectWithItemProviderData:(id)a3 typeIdentifier:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  unsigned int v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v17[2];
  _QWORD v18[2];

  v8 = a3;
  v9 = a4;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[CRLBoardItemImporter supportedImageFileTypes](CRLBoardItemImporter, "supportedImageFileTypes"));
  v11 = objc_msgSend(v9, "crl_conformsToAnyUTI:", v10);

  if (v11)
  {
    a5 = (id *)objc_msgSend(objc_alloc((Class)a1), "initWithData:type:", v8, v9);
  }
  else if (a5)
  {
    v17[0] = NSLocalizedDescriptionKey;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("The image type is not supported on this device."), 0, 0));
    v17[1] = CFSTR("CRLBoardItemImporterErrorMediaTypeKey");
    v18[0] = v13;
    v18[1] = &off_1012CC808;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v18, v17, 2));

    v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.freeform.CRLErrorDomainInfoImporter"), 103, v14)));
    *a5 = v15;

    a5 = 0;
  }

  return a5;
}

- (CRLImageFillProvider)initWithData:(id)a3 type:(id)a4
{
  id v7;
  id v8;
  CRLImageFillProvider *v9;
  CRLImageFillProvider *v10;
  NSString *v11;
  NSString *type;
  CRLScaledProgress *v13;
  CRLScaledProgress *progress;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)CRLImageFillProvider;
  v9 = -[CRLImageFillProvider init](&v16, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_data, a3);
    v11 = (NSString *)objc_msgSend(v8, "copy");
    type = v10->_type;
    v10->_type = v11;

    v13 = objc_alloc_init(CRLScaledProgress);
    progress = v10->_progress;
    v10->_progress = v13;

  }
  return v10;
}

- (CRLImageFillProvider)initWithURL:(id)a3
{
  id v4;
  CRLImageFillProvider *v5;
  NSURL *v6;
  NSURL *url;
  CRLScaledProgress *v8;
  CRLScaledProgress *progress;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CRLImageFillProvider;
  v5 = -[CRLImageFillProvider init](&v11, "init");
  if (v5)
  {
    v6 = (NSURL *)objc_msgSend(v4, "copy");
    url = v5->_url;
    v5->_url = v6;

    v8 = objc_alloc_init(CRLScaledProgress);
    progress = v5->_progress;
    v5->_progress = v8;

  }
  return v5;
}

- (CRLImageFillProvider)init
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
    dispatch_once(&qword_10147E370, &stru_101252F28);
  v3 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109890;
    v12 = v2;
    v13 = 2082;
    v14 = "-[CRLImageFillProvider init]";
    v15 = 2082;
    v16 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLImageFillProvider.m";
    v17 = 1024;
    v18 = 79;
    _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Do not call method", buf, 0x22u);
  }
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_101252F48);
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
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageFillProvider init]"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLImageFillProvider.m"));
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 79, 0, "Do not call method");

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s: %s"), "Do not call method", "-[CRLImageFillProvider init]"));
  v10 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v9, 0));

  objc_exception_throw(v10);
}

- (void)cancel
{
  self->_cancelled = 1;
}

- (void)p_continueWorkOnMainThreadWithModalOperationPresenter:(id)a3 usingBlock:(id)a4
{
  if (a3)
    objc_msgSend(a3, "continueAsynchronousWorkOnMainThreadUsingBlock:", a4);
  else
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, a4);
}

- (void)provideImageDataForAssetOwner:(id)a3 compatibilityAlertPresenter:(id)a4 completionHandler:(id)a5
{
  -[CRLImageFillProvider provideImageDataForAssetOwner:modalOperationPresenter:compatibilityAlertPresenter:completionHandler:](self, "provideImageDataForAssetOwner:modalOperationPresenter:compatibilityAlertPresenter:completionHandler:", a3, 0, a4, a5);
}

- (void)provideImageDataForAssetOwner:(id)a3 modalOperationPresenter:(id)a4 compatibilityAlertPresenter:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  __CFString *v27;
  void *v28;
  id v29;
  _TtC8Freeform27CRLPreinsertionAssetWrapper *v30;
  _TtC8Freeform27CRLPreinsertionAssetWrapper *v31;
  void *v32;
  id v33;
  _QWORD v34[5];
  id v35;
  id v36;
  id v37;
  id v38;

  v10 = a3;
  v33 = a4;
  v11 = a5;
  v12 = a6;
  if (+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    if (v12)
      goto LABEL_3;
  }
  else
  {
    v13 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101252F68);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E229E4();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101252F88);
    v14 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DEA91C(v14, v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageFillProvider provideImageDataForAssetOwner:modalOperationPresenter:compatibilityAlertPresenter:completionHandler:]"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLImageFillProvider.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v15, v16, 107, 0, "This operation must only be performed on the main thread.");

    if (v12)
    {
LABEL_3:
      if (v11)
        goto LABEL_32;
      goto LABEL_23;
    }
  }
  v17 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_101252FA8);
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
    sub_100E22958();
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_101252FC8);
  v18 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
    sub_100DEA91C(v18, v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageFillProvider provideImageDataForAssetOwner:modalOperationPresenter:compatibilityAlertPresenter:completionHandler:]"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLImageFillProvider.m"));
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v19, v20, 108, 0, "invalid nil value for '%{public}s'", "completionHandler");

  if (!v11)
  {
LABEL_23:
    v21 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101252FE8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E228CC();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101253008);
    v22 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DEA91C(v22, v21);
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageFillProvider provideImageDataForAssetOwner:modalOperationPresenter:compatibilityAlertPresenter:completionHandler:]"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLImageFillProvider.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v23, v24, 109, 0, "invalid nil value for '%{public}s'", "alertPresenter");

  }
LABEL_32:
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[UTType typeWithIdentifier:](UTType, "typeWithIdentifier:", self->_type));
  v26 = v25;
  if (v25)
    v27 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "preferredFilenameExtension"));
  else
    v27 = CFSTR("png");
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[CRLBoardItemImporter defaultPastedImageName](CRLBoardItemImporter, "defaultPastedImageName"));
  v29 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%@.%@"), v28, v27);
  if (self->_data)
  {
    v30 = -[CRLPreinsertionAssetWrapper initWithData:filename:owner:error:]([_TtC8Freeform27CRLPreinsertionAssetWrapper alloc], "initWithData:filename:owner:error:", self->_data, v29, v10, 0);
  }
  else
  {
    if (!self->_url)
    {
LABEL_41:
      v32 = v33;
      -[CRLImageFillProvider p_provideImageDataForAssetOwner:data:modalOperationPresenter:compatibilityAlertPresenter:completionHandler:](self, "p_provideImageDataForAssetOwner:data:modalOperationPresenter:compatibilityAlertPresenter:completionHandler:", v10, 0, v33, v11, v12);
      goto LABEL_42;
    }
    v30 = -[CRLPreinsertionAssetWrapper initWithUrl:owner:]([_TtC8Freeform27CRLPreinsertionAssetWrapper alloc], "initWithUrl:owner:", self->_url, v10);
  }
  v31 = v30;
  if (!v30)
    goto LABEL_41;
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_10033BF4C;
  v34[3] = &unk_101253030;
  v34[4] = self;
  v35 = v10;
  v32 = v33;
  v36 = v33;
  v37 = v11;
  v38 = v12;
  -[CRLPreinsertionAssetWrapper createAssetWithCompletionHandler:](v31, "createAssetWithCompletionHandler:", v34);

LABEL_42:
}

- (void)p_provideImageDataForAssetOwner:(id)a3 data:(id)a4 modalOperationPresenter:(id)a5 compatibilityAlertPresenter:(id)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  _QWORD *v22;
  id v23;
  id v24;
  _QWORD *v25;
  id v26;
  CRLImageCompatibilityChecker *v27;
  id v28;
  int v29;
  _QWORD v30[5];
  id v31;
  CRLImageCompatibilityChecker *v32;
  id v33;
  id v34;
  id v35;
  id v36;
  _QWORD v37[5];
  id v38;
  id v39;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  if (!v13)
  {
    v29 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101253050);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E22A64();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101253070);
    v17 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DEA91C(v17, v29);
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageFillProvider p_provideImageDataForAssetOwner:data:modalOperationPresenter:compatibilityAlertPresenter:completionHandler:]"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLImageFillProvider.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v18, v19, 152, 0, "Cannot make image data to provide a fill!");

  }
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472;
  v37[2] = sub_10033C28C;
  v37[3] = &unk_1012530C0;
  v37[4] = self;
  v20 = v14;
  v38 = v20;
  v39 = v16;
  v21 = v16;
  v22 = objc_retainBlock(v37);
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_10033C3E0;
  v30[3] = &unk_101253110;
  v30[4] = self;
  v31 = v20;
  v32 = -[CRLImageCompatibilityChecker initWithImageData:]([CRLImageCompatibilityChecker alloc], "initWithImageData:", v13);
  v33 = v13;
  v35 = v15;
  v36 = v22;
  v34 = v12;
  v23 = v15;
  v24 = v12;
  v25 = v22;
  v26 = v13;
  v27 = v32;
  v28 = v20;
  -[CRLImageCompatibilityChecker checkCompatibilityUpToLevel:completionHandler:](v27, "checkCompatibilityUpToLevel:completionHandler:", 4, v30);

}

- (void)p_convertImageData:(id)a3 toCompatibilityLevel:(int64_t)a4 assetOwner:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  CRLImageCompatibilityConverter *v13;
  id v14;
  CRLImageCompatibilityConverter *v15;
  _QWORD v16[4];
  CRLImageCompatibilityConverter *v17;
  CRLImageFillProvider *v18;
  id v19;

  v10 = a6;
  v11 = a5;
  v12 = a3;
  v13 = -[CRLImageCompatibilityConverter initWithImageData:desiredCompatibilityLevel:assetOwner:]([CRLImageCompatibilityConverter alloc], "initWithImageData:desiredCompatibilityLevel:assetOwner:", v12, a4, v11);

  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10033C9F4;
  v16[3] = &unk_101253178;
  v18 = self;
  v19 = v10;
  v17 = v13;
  v14 = v10;
  v15 = v13;
  -[CRLImageCompatibilityConverter convertMediaWithCompletionHandler:](v15, "convertMediaWithCompletionHandler:", v16);

}

+ (void)makeCompatibleImageDataFromURL:(id)a3 forAssetOwner:(id)a4 modalOperationPresenter:(id)a5 compatibilityAlertPresenter:(id)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  CRLImageFillProvider *v17;

  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  v17 = -[CRLImageFillProvider initWithURL:]([CRLImageFillProvider alloc], "initWithURL:", v16);

  objc_msgSend(a1, "p_makeCompatibleImageFillDataForFill:withFillProvider:forAssetOwner:modalOperationPresenter:compatibilityAlertPresenter:completionHandler:", 0, v17, v15, v14, v13, v12);
}

+ (void)makeCompatibleImageFillDataFromURL:(id)a3 forAssetOwner:(id)a4 modalOperationPresenter:(id)a5 compatibilityAlertPresenter:(id)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  CRLImageFillProvider *v17;

  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  v17 = -[CRLImageFillProvider initWithURL:]([CRLImageFillProvider alloc], "initWithURL:", v16);

  objc_msgSend(a1, "p_makeCompatibleImageFillDataForFill:withFillProvider:forAssetOwner:modalOperationPresenter:compatibilityAlertPresenter:completionHandler:", 1, v17, v15, v14, v13, v12);
}

+ (void)p_makeCompatibleImageFillDataForFill:(BOOL)a3 withFillProvider:(id)a4 forAssetOwner:(id)a5 modalOperationPresenter:(id)a6 compatibilityAlertPresenter:(id)a7 completionHandler:(id)a8
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  void *v31;
  void *v32;
  int v33;
  void *v34;
  void *v35;
  void *v36;
  CRLBasicProgress *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  id v41;
  void *v42;
  id v43;
  id v44;
  _BOOL4 v45;
  _QWORD v46[4];
  id v47;
  void *v48;
  id v49;
  _QWORD *v50;
  _QWORD v51[4];
  id v52;
  _QWORD *v53;
  _QWORD v54[3];
  char v55;

  v45 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v16 = a8;
  if (+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    if (v12)
      goto LABEL_3;
  }
  else
  {
    v17 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101253198);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E230DC();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012531B8);
    v18 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E23034(v18, v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLImageFillProvider p_makeCompatibleImageFillDataForFill:withFillProvider:forAssetOwner:modalOperationPresenter:compatibilityAlertPresenter:completionHandler:]"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLImageFillProvider.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v19, v20, 321, 0, "This operation must only be performed on the main thread.");

    if (v12)
    {
LABEL_3:
      if (v15)
        goto LABEL_4;
      goto LABEL_25;
    }
  }
  v21 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_1012531D8);
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
    sub_100E22FA8();
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_1012531F8);
  v22 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
    sub_100E22F00(v22, v21);
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLImageFillProvider p_makeCompatibleImageFillDataForFill:withFillProvider:forAssetOwner:modalOperationPresenter:compatibilityAlertPresenter:completionHandler:]"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLImageFillProvider.m"));
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v23, v24, 322, 0, "invalid nil value for '%{public}s'", "fillProvider");

  if (v15)
  {
LABEL_4:
    if (v14)
      goto LABEL_5;
    goto LABEL_34;
  }
LABEL_25:
  v25 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_101253218);
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
    sub_100E22E74();
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_101253238);
  v26 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
    sub_100E22DCC(v26, v25);
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLImageFillProvider p_makeCompatibleImageFillDataForFill:withFillProvider:forAssetOwner:modalOperationPresenter:compatibilityAlertPresenter:completionHandler:]"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLImageFillProvider.m"));
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v27, v28, 323, 0, "invalid nil value for '%{public}s'", "alertPresenter");

  if (v14)
  {
LABEL_5:
    if (v16)
      goto LABEL_52;
    goto LABEL_43;
  }
LABEL_34:
  v29 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_101253258);
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
    sub_100E22D40();
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_101253278);
  v30 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
    sub_100E22C98(v30, v29);
  v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLImageFillProvider p_makeCompatibleImageFillDataForFill:withFillProvider:forAssetOwner:modalOperationPresenter:compatibilityAlertPresenter:completionHandler:]"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLImageFillProvider.m"));
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v31, v32, 324, 0, "invalid nil value for '%{public}s'", "modalOperationPresenter");

  if (!v16)
  {
LABEL_43:
    v33 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101253298);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E22C0C();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012532B8);
    v34 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E22B64(v34, v33);
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLImageFillProvider p_makeCompatibleImageFillDataForFill:withFillProvider:forAssetOwner:modalOperationPresenter:compatibilityAlertPresenter:completionHandler:]"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLImageFillProvider.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v35, v36, 325, 0, "invalid nil value for '%{public}s'", "completionHandler");

  }
LABEL_52:
  v37 = -[CRLBasicProgress initWithMaxValue:]([CRLBasicProgress alloc], "initWithMaxValue:", 1.0);
  -[CRLBasicProgress setIndeterminate:](v37, "setIndeterminate:", 1);
  v54[0] = 0;
  v54[1] = v54;
  v54[2] = 0x2020000000;
  v55 = 0;
  v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  if (v45)
    v39 = objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "localizedStringForKey:value:table:", CFSTR("Inserting image fill"), 0, 0));
  else
    v39 = objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "localizedStringForKey:value:table:", CFSTR("Inserting image"), 0, 0));
  v40 = (void *)v39;

  v51[0] = _NSConcreteStackBlock;
  v51[1] = 3221225472;
  v51[2] = sub_10033D914;
  v51[3] = &unk_10122C5F0;
  v53 = v54;
  v41 = v12;
  v52 = v41;
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "beginModalOperationWithLocalizedMessage:progress:cancelHandler:", v40, v37, v51));
  v46[0] = _NSConcreteStackBlock;
  v46[1] = 3221225472;
  v46[2] = sub_10033D92C;
  v46[3] = &unk_101253308;
  v43 = v14;
  v47 = v43;
  v48 = v42;
  v44 = v16;
  v49 = v44;
  v50 = v54;
  objc_msgSend(v41, "provideImageDataForAssetOwner:modalOperationPresenter:compatibilityAlertPresenter:completionHandler:", v13, v43, v15, v46);

  _Block_object_dispose(v54, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

@end
