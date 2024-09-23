@implementation CRLImageDataHelper

- (CRLImageDataHelper)initWithImageData:(id)a3 assetOwner:(id)a4
{
  id v7;
  id v8;
  CRLImageDataHelper *v9;
  CRLImageDataHelper *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CRLImageDataHelper;
  v9 = -[CRLImageDataHelper init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_imageData, a3);
    objc_storeStrong((id *)&v10->_assetOwner, a4);
  }

  return v10;
}

- (CGSize)naturalSize
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageDataHelper imageData](self, "imageData"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CRLImageProviderPool sharedPool](CRLImageProviderPool, "sharedPool"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "providerForAsset:shouldValidate:", v2, 1));

  objc_msgSend(v4, "naturalSize");
  v6 = v5;
  v8 = v7;

  v9 = v6;
  v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (void)generateThumbnailImageDataWithCompletionHandler:(id)a3
{
  void (**v4)(id, _QWORD);
  void *v5;
  int v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  _TtC8Freeform27CRLPreinsertionAssetWrapper *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  void (**v15)(id, _QWORD);

  v4 = (void (**)(id, _QWORD))a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageDataHelper imageData](self, "imageData"));
  if (objc_msgSend(v5, "needsDownload"))
  {
    v6 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101233FA8);
    v7 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DF4798(v6, v7);
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101233FC8);
    v8 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE81F0(v8, v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageDataHelper generateThumbnailImageDataWithCompletionHandler:]"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLImageDataHelper.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v9, v10, 52, 0, "Needs to implement download-handling thumbnail creation!");

    v4[2](v4, 0);
  }
  else
  {
    v11 = sub_10040EE30(v5, 3, self->_assetOwner, 256.0, 256.0);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    if (v12)
    {
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_1000B0BC8;
      v13[3] = &unk_101231FA8;
      v14 = v5;
      v15 = v4;
      objc_msgSend(v12, "createAssetWithCompletionHandler:", v13);

    }
    else
    {
      v4[2](v4, 0);
    }

  }
}

- (_TtC8Freeform8CRLAsset)imageData
{
  return self->_imageData;
}

- (CRLAssetOwning)assetOwner
{
  return self->_assetOwner;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetOwner, 0);
  objc_storeStrong((id *)&self->_imageData, 0);
}

@end
