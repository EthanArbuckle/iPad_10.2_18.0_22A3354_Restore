@implementation CRLImageCompatibilityConverter

+ (void)initialize
{
  CRLWidthLimitedQueue *v2;
  void *v3;

  if ((id)objc_opt_class(CRLImageCompatibilityConverter, a2) == a1)
  {
    v2 = -[CRLWidthLimitedQueue initWithLimit:]([CRLWidthLimitedQueue alloc], "initWithLimit:", 10);
    v3 = (void *)qword_101414CB8;
    qword_101414CB8 = (uint64_t)v2;

  }
}

- (CRLImageCompatibilityConverter)initWithImageData:(id)a3 desiredCompatibilityLevel:(int64_t)a4 assetOwner:(id)a5
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  CRLImageCompatibilityConverter *v14;
  CRLImageCompatibilityConverter *v15;
  CRLBasicProgress *v16;
  CRLBasicProgress *mProgress;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  objc_super v23;

  v9 = a3;
  v10 = a5;
  if (!v9)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101231E38);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DF0D7C();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101231E58);
    v11 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageCompatibilityConverter initWithImageData:desiredCompatibilityLevel:assetOwner:]"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLImageCompatibilityConverter.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v12, v13, 56, 0, "Invalid parameter not satisfying: %{public}s", "imageData != nil");

  }
  v23.receiver = self;
  v23.super_class = (Class)CRLImageCompatibilityConverter;
  v14 = -[CRLImageCompatibilityConverter init](&v23, "init");
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->mImageData, a3);
    v16 = -[CRLBasicProgress initWithMaxValue:]([CRLBasicProgress alloc], "initWithMaxValue:", 1.0);
    mProgress = v15->mProgress;
    v15->mProgress = v16;

    v15->mDesiredCompatibilityLevel = a4;
    objc_storeStrong((id *)&v15->mAssetOwner, a5);
    if (v15->mDesiredCompatibilityLevel <= 2)
    {
      v18 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101231E78);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DF0CD4((uint64_t)&v15->mDesiredCompatibilityLevel, v18);
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101231E98);
      v19 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageCompatibilityConverter initWithImageData:desiredCompatibilityLevel:assetOwner:]"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLImageCompatibilityConverter.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v20, v21, 63, 0, "Image converter created without need for conversion (level %zd)", v15->mDesiredCompatibilityLevel);

    }
  }

  return v15;
}

- (void)convertMediaWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;

  v4 = a3;
  if (!self->mImageData)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101231EB8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DF0E10();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101231ED8);
    v5 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageCompatibilityConverter convertMediaWithCompletionHandler:]"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLImageCompatibilityConverter.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 73, 0, "invalid nil value for '%{public}s'", "mImageData");

  }
  v8 = (void *)qword_101414CB8;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100080988;
  v10[3] = &unk_101231F00;
  v10[4] = self;
  v11 = v4;
  v9 = v4;
  objc_msgSend(v8, "performAsync:", v10);

}

- (void)p_performAsyncMediaConversionWorkWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned int v9;
  int64_t mDesiredCompatibilityLevel;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  void *v16;
  CRLImageResamplingOperation *v17;
  CRLImageResamplingOperation *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _TtC8Freeform27CRLPreinsertionAssetWrapper *v24;
  void *v25;
  void *v26;
  _TtC8Freeform27CRLPreinsertionAssetWrapper *v27;
  _QWORD v28[5];
  id v29;
  _QWORD v30[5];
  id v31;
  _QWORD v32[5];
  id v33;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLAsset type](self->mImageData, "type"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[CRLIngestionTypes imageUTTypesThatRequireConversion](CRLIngestionTypes, "imageUTTypesThatRequireConversion"));
  if (objc_msgSend(v5, "crl_conformsToAnyUTType:", v6))
  {

    goto LABEL_4;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLAsset type](self->mImageData, "type"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[CRLIngestionTypes highEfficiencyImageUTTypes](CRLIngestionTypes, "highEfficiencyImageUTTypes"));
  v9 = objc_msgSend(v7, "crl_conformsToAnyUTType:", v8);

  if (v9)
  {
LABEL_4:
    mDesiredCompatibilityLevel = self->mDesiredCompatibilityLevel;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[CRLImageProviderPool sharedPool](CRLImageProviderPool, "sharedPool"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "temporaryProviderForAsset:shouldValidate:", self->mImageData, 1));

    if (mDesiredCompatibilityLevel == 3)
    {
      v14 = objc_opt_class(CRLBitmapImageProvider, v13);
      v15 = sub_100221D0C(v14, v12);
      v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
      v17 = [CRLImageResamplingOperation alloc];
      objc_msgSend(v16, "naturalSize");
      v18 = -[CRLImageResamplingOperation initWithImageProvider:desiredSize:assetOwner:](v17, "initWithImageProvider:desiredSize:assetOwner:", v16, self->mAssetOwner);
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[CRLAsset filename](self->mImageData, "filename"));
      -[CRLImageResamplingOperation setDisplayName:](v18, "setDisplayName:", v19);

      v20 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageResamplingOperation performResampleOperationWithResampleOptions:bitmapContextOptions:](v18, "performResampleOperationWithResampleOptions:bitmapContextOptions:", 16, 9));
      if (!v20)
      {
        +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_101231F20);
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          sub_100DF0EA4();
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_101231F40);
        v21 = off_1013D9070;
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          sub_100DE7468(v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageCompatibilityConverter p_performAsyncMediaConversionWorkWithCompletionHandler:]"));
        v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLImageCompatibilityConverter.m"));
        +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v22, v23, 112, 0, "invalid nil value for '%{public}s'", "convertedImageDataWrapper");

      }
      v32[0] = _NSConcreteStackBlock;
      v32[1] = 3221225472;
      v32[2] = sub_100080E14;
      v32[3] = &unk_101231FA8;
      v32[4] = self;
      v33 = v4;
      objc_msgSend(v20, "createAssetWithCompletionHandler:", v32);

      goto LABEL_22;
    }
    if ((objc_msgSend(v12, "isError") & 1) == 0)
    {
      v24 = sub_1004104A4(self->mImageData, self->mAssetOwner);
      v16 = (void *)objc_claimAutoreleasedReturnValue(v24);
      v30[0] = _NSConcreteStackBlock;
      v30[1] = 3221225472;
      v30[2] = sub_100081054;
      v30[3] = &unk_101231FA8;
      v30[4] = self;
      v31 = v4;
      objc_msgSend(v16, "createAssetWithCompletionHandler:", v30);
      v25 = v31;
LABEL_21:

LABEL_22:
      goto LABEL_23;
    }
    goto LABEL_19;
  }
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[CRLImageProviderPool sharedPool](CRLImageProviderPool, "sharedPool"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "temporaryProviderForAsset:shouldValidate:", self->mImageData, 1));

  if ((objc_msgSend(v12, "isError") & 1) == 0)
  {
    v27 = sub_100410498(self->mImageData, self->mAssetOwner);
    v16 = (void *)objc_claimAutoreleasedReturnValue(v27);
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_100081294;
    v28[3] = &unk_101231FA8;
    v28[4] = self;
    v29 = v4;
    objc_msgSend(v16, "createAssetWithCompletionHandler:", v28);
    v25 = v29;
    goto LABEL_21;
  }
LABEL_19:
  -[CRLImageCompatibilityConverter p_completeConversionWithCompletionHandler:](self, "p_completeConversionWithCompletionHandler:", v4);
LABEL_23:

}

- (int64_t)mediaType
{
  return 2;
}

- (void)p_completeConversionWithCompletionHandler:(id)a3
{
  void (**v4)(_QWORD);
  unsigned __int8 v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSError *v12;
  NSError *mError;
  _QWORD v14[2];
  _QWORD v15[2];

  v4 = (void (**)(_QWORD))a3;
  if (!self->mConvertedImageData)
  {
    v5 = atomic_load((unsigned __int8 *)&self->mIsCancelled);
    if ((v5 & 1) == 0)
    {
      v6 = objc_alloc((Class)NSError);
      v14[0] = NSLocalizedDescriptionKey;
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("This image can’t be added."), 0, 0));
      v15[0] = v8;
      v14[1] = NSLocalizedFailureReasonErrorKey;
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("The file couldn’t be converted into a compatible format."), 0, 0));
      v15[1] = v10;
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v15, v14, 2));
      v12 = (NSError *)objc_msgSend(v6, "initWithDomain:code:userInfo:", CFSTR("com.apple.freeform.CRLErrorDomainMediaCompatibility"), 100, v11);
      mError = self->mError;
      self->mError = v12;

    }
  }
  -[CRLBasicProgress setValue:](self->mProgress, "setValue:", 1.0);
  if (v4)
    v4[2](v4);

}

- (void)cancel
{
  atomic_store(1u, (unsigned __int8 *)&self->mIsCancelled);
}

- (NSError)error
{
  return self->mError;
}

- (_TtC8Freeform8CRLAsset)convertedMediaData
{
  return self->mConvertedImageData;
}

- (CRLProgress)progress
{
  return &self->mProgress->super;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mError, 0);
  objc_storeStrong((id *)&self->mAssetOwner, 0);
  objc_storeStrong((id *)&self->mConvertedImageData, 0);
  objc_storeStrong((id *)&self->mProgress, 0);
  objc_storeStrong((id *)&self->mImageData, 0);
}

@end
