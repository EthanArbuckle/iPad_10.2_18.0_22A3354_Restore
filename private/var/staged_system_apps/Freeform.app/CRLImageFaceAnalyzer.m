@implementation CRLImageFaceAnalyzer

- (CRLImageFaceAnalyzer)initWithImageData:(id)a3 assetOwner:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  CRLImageFaceAnalyzer *v12;
  CRLImageFaceAnalyzer *v13;
  objc_super v15;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101246738);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E0F968();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101246758);
    v9 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE8358(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageFaceAnalyzer initWithImageData:assetOwner:]"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLImageFaceAnalyzer.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v10, v11, 38, 0, "invalid nil value for '%{public}s'", "imageData");

  }
  v15.receiver = self;
  v15.super_class = (Class)CRLImageFaceAnalyzer;
  v12 = -[CRLImageFaceAnalyzer init](&v15, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_imageData, a3);
    objc_storeStrong((id *)&v13->_assetOwner, a4);
  }

  return v13;
}

+ (CGPoint)maskCenterForFacesInImageData:(id)a3 imageSize:(CGSize)a4 maskSize:(CGSize)a5 defaultCenter:(CGPoint)a6 assetOwner:(id)a7
{
  double y;
  double x;
  double height;
  double width;
  double v11;
  double v12;
  id v14;
  id v15;
  CRLImageFaceAnalyzer *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  CGPoint result;

  y = a6.y;
  x = a6.x;
  height = a5.height;
  width = a5.width;
  v11 = a4.height;
  v12 = a4.width;
  v14 = a7;
  v15 = a3;
  v16 = -[CRLImageFaceAnalyzer initWithImageData:assetOwner:]([CRLImageFaceAnalyzer alloc], "initWithImageData:assetOwner:", v15, v14);

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageFaceAnalyzer faceAnalyzerResult](v16, "faceAnalyzerResult"));
  v18 = v17;
  if (v17)
  {
    objc_msgSend(v17, "maskCenterForFacesWithImageSize:maskSize:defaultCenter:", v12, v11, width, height, x, y);
    x = v19;
    y = v20;
  }

  v21 = x;
  v22 = y;
  result.y = v22;
  result.x = v21;
  return result;
}

- (_TtC8Freeform26CRLImageFaceAnalyzerResult)faceAnalyzerResult
{
  -[CRLImageFaceAnalyzer p_analyzeFaceRectsIfNeeded](self, "p_analyzeFaceRectsIfNeeded");
  return self->_faceAnalyzerResult;
}

- (void)p_analyzeFaceRectsIfNeeded
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  CRLImageResamplingOperation *v7;
  CRLImageResamplingOperation *v8;
  void *v9;
  _QWORD v10[7];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  if (!self->_hasAnalyzedData)
  {
    v17 = 0;
    v18 = &v17;
    v19 = 0x3032000000;
    v20 = sub_100229090;
    v21 = sub_1002290A0;
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[CRLImageProviderPool sharedPool](CRLImageProviderPool, "sharedPool"));
    v22 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "providerForAsset:shouldValidate:", self->_imageData, 1));

    if (objc_msgSend((id)v18[5], "isValid")
      && (objc_msgSend((id)v18[5], "isError") & 1) == 0)
    {
      v11 = 0;
      v12 = &v11;
      v13 = 0x3032000000;
      v14 = sub_100229090;
      v15 = sub_1002290A0;
      objc_opt_class(CRLBitmapImageProvider, v4);
      v6 = sub_100221D0C(v5, (void *)v18[5]);
      v16 = (id)objc_claimAutoreleasedReturnValue(v6);
      if (v12[5])
      {
        -[CRLImageFaceAnalyzer p_analyzeFaceRectsWithProvider:](self, "p_analyzeFaceRectsWithProvider:");
      }
      else
      {
        v7 = [CRLImageResamplingOperation alloc];
        v8 = -[CRLImageResamplingOperation initWithImageProvider:desiredSize:assetOwner:](v7, "initWithImageProvider:desiredSize:assetOwner:", v18[5], self->_assetOwner, CGSizeZero.width, CGSizeZero.height);
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageResamplingOperation performResampleOperationWithResampleOptions:bitmapContextOptions:](v8, "performResampleOperationWithResampleOptions:bitmapContextOptions:", 2, 3));
        v10[0] = _NSConcreteStackBlock;
        v10[1] = 3221225472;
        v10[2] = sub_1002290A8;
        v10[3] = &unk_1012467C0;
        v10[5] = &v17;
        v10[6] = &v11;
        v10[4] = self;
        objc_msgSend(v9, "createAssetWithCompletionHandler:", v10);

      }
      _Block_object_dispose(&v11, 8);

    }
    else
    {
      -[CRLImageFaceAnalyzer p_analyzeFaceRectsWithProvider:](self, "p_analyzeFaceRectsWithProvider:", 0);
    }
    _Block_object_dispose(&v17, 8);

  }
}

- (void)p_analyzeFaceRectsWithProvider:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  _TtC8Freeform26CRLImageFaceAnalyzerResult *v18;
  _TtC8Freeform26CRLImageFaceAnalyzerResult *faceAnalyzerResult;
  id v20;
  id v21;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "naturalSize");
    if (v6 >= v7)
      v8 = v6;
    else
      v8 = v7;
    if (v8 <= 5000.0)
    {
      v9 = objc_msgSend(v5, "CGImageOfLargestSafeSize");
    }
    else
    {
      do
        v8 = v8 * 0.5;
      while (v8 > 5000.0);
      v9 = objc_msgSend(v5, "CGImageForSize:inContext:orContentsScaleProvider:", 0, self, sub_100062DDC(v6, v7, v8, v8));
    }
    v10 = objc_msgSend(objc_alloc((Class)VNImageRequestHandler), "initWithCGImage:orientation:options:", v9, sub_1003F624C((uint64_t)objc_msgSend(v5, "orientation")), &__NSDictionary0__struct);
    v11 = objc_alloc_init((Class)VNDetectFaceRectanglesRequest);
    v21 = v11;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v21, 1));
    v20 = 0;
    objc_msgSend(v10, "performRequests:error:", v12, &v20);
    v13 = v20;

    if (v13)
    {
      if (qword_10147E368 != -1)
        dispatch_once(&qword_10147E368, &stru_1012467E0);
      v14 = off_1013D9068;
      if (os_log_type_enabled((os_log_t)off_1013D9068, OS_LOG_TYPE_ERROR))
        sub_100E0FAA0((uint64_t)v13, v14);
    }
    else
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "results"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageFaceAnalyzer p_faceRectsForResults:](self, "p_faceRectsForResults:", v15));

      if (objc_msgSend(v16, "count"))
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageFaceAnalyzer p_interestingfaceRectsFromFaceRects:](self, "p_interestingfaceRectsFromFaceRects:", v16));
        if (objc_msgSend(v17, "count"))
        {
          v18 = -[CRLImageFaceAnalyzerResult initWithFaceRectValues:]([_TtC8Freeform26CRLImageFaceAnalyzerResult alloc], "initWithFaceRectValues:", v17);
          faceAnalyzerResult = self->_faceAnalyzerResult;
          self->_faceAnalyzerResult = v18;

        }
      }

    }
  }
  self->_hasAnalyzedData = 1;

}

- (id)p_interestingfaceRectsFromFaceRects:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  _QWORD v9[5];

  v4 = a3;
  -[CRLImageFaceAnalyzer p_largestAreaFromFaceRects:](self, "p_largestAreaFromFaceRects:", v4);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100229648;
  v9[3] = &unk_101246800;
  v9[4] = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "indexesOfObjectsPassingTest:", v9));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectsAtIndexes:", v6));

  return v7;
}

- (id)p_faceRectsForResults:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  _QWORD v16[4];
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v18;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)v9), "boundingBox");
        if (v12 > 0.0199999996 && v13 > 0.0199999996)
        {
          v16[0] = v10;
          *(double *)&v16[1] = 1.0 - v11 - v13;
          *(double *)&v16[2] = v12;
          *(double *)&v16[3] = v13;
          v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithBytes:objCType:](NSValue, "valueWithBytes:objCType:", v16, "{CGRect={CGPoint=dd}{CGSize=dd}}"));
          objc_msgSend(v4, "addObject:", v14);

        }
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v7);
  }

  return v4;
}

- (double)p_largestAreaFromFaceRects:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  double v7;
  void *i;
  double v9;
  double v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v3 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    v7 = 0.0;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i), "CGRectValue");
        if (v9 * v10 > v7)
          v7 = v9 * v10;
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }
  else
  {
    v7 = 0.0;
  }

  return v7;
}

- (double)contentsScale
{
  return 1.0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_faceAnalyzerResult, 0);
  objc_storeStrong((id *)&self->_assetOwner, 0);
  objc_storeStrong((id *)&self->_imageData, 0);
}

@end
