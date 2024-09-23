@implementation CRLMovieItemImporter

+ (id)protected_supportedFileTypes
{
  return +[CRLIngestionTypes supportedMovieTypes](CRLIngestionTypes, "supportedMovieTypes");
}

+ (id)protected_supportedFileUTTypes
{
  return +[CRLIngestionTypes supportedMovieUTTypes](CRLIngestionTypes, "supportedMovieUTTypes");
}

+ (id)protected_supportedAnimatedImageFileTypes
{
  return +[CRLIngestionTypes supportedMovieAnimatedImageTypes](CRLIngestionTypes, "supportedMovieAnimatedImageTypes");
}

+ (BOOL)protected_canImportFileAtURL:(id)a3 type:(id)a4
{
  id v6;
  const __CFURL *v7;
  CGImageSourceRef v8;
  unsigned __int8 v9;
  objc_super v11;

  v6 = a4;
  v7 = (const __CFURL *)a3;
  if (objc_msgSend(a1, "isSupportedAnimatedImageFileType:", v6))
  {
    v8 = CGImageSourceCreateWithURL(v7, 0);

    if (v8)
    {
      if ((+[PFImageMetadata imageSourceIsSpatial:](PFImageMetadata, "imageSourceIsSpatial:", v8) & 1) != 0)v9 = 0;
      else
        v9 = objc_msgSend(a1, "p_canImportImageSource:", v8);
      CFRelease(v8);
    }
    else
    {
      v9 = 0;
    }
  }
  else
  {
    v11.receiver = a1;
    v11.super_class = (Class)&OBJC_METACLASS___CRLMovieItemImporter;
    v9 = objc_msgSendSuper2(&v11, "protected_canImportFileAtURL:type:", v7, v6);

  }
  return v9;
}

+ (BOOL)protected_canImportFileWithPreinsertionAsset:(id)a3 type:(id)a4
{
  id v6;
  id v7;
  id v8;
  unsigned __int8 v9;
  objc_super v11;

  v6 = a4;
  v7 = a3;
  if (objc_msgSend(a1, "isSupportedAnimatedImageFileType:", v6))
  {
    v8 = objc_msgSend(v7, "newCGImageSource");

    if (v8)
    {
      if ((+[PFImageMetadata imageSourceIsSpatial:](PFImageMetadata, "imageSourceIsSpatial:", v8) & 1) != 0)v9 = 0;
      else
        v9 = objc_msgSend(a1, "p_canImportImageSource:", v8);
      CFRelease(v8);
    }
    else
    {
      v9 = 0;
    }
  }
  else
  {
    v11.receiver = a1;
    v11.super_class = (Class)&OBJC_METACLASS___CRLMovieItemImporter;
    v9 = objc_msgSendSuper2(&v11, "protected_canImportFileWithPreinsertionAsset:type:", v7, v6);

  }
  return v9;
}

+ (BOOL)p_canImportImageSource:(CGImageSource *)a3
{
  return CGImageSourceGetCount(a3) > 1;
}

+ (BOOL)p_canAnimate:(CGImageSource *)a3
{
  CFDictionaryRef v3;
  void *v4;
  void *v5;
  BOOL v6;

  if (!a3)
    return 1;
  v3 = CGImageSourceCopyProperties(a3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[__CFDictionary objectForKeyedSubscript:](v3, "objectForKeyedSubscript:", CFSTR("CanAnimate")));
  v5 = v4;
  if (v4)
    v6 = objc_msgSend(v4, "intValue") != 0;
  else
    v6 = 1;

  return v6;
}

- (CRLMovieItemImporter)initWithURL:(id)a3 boardItemFactory:(id)a4
{
  CRLMovieItemImporter *v4;
  CRLMovieItemImporter *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CRLMovieItemImporter;
  v4 = -[CRLBoardItemImporter initWithURL:boardItemFactory:](&v7, "initWithURL:boardItemFactory:", a3, a4);
  v5 = v4;
  if (v4)
    sub_1002B69E0(v4);
  return v5;
}

- (CRLMovieItemImporter)initWithData:(id)a3 boardItemFactory:(id)a4
{
  CRLMovieItemImporter *v4;
  CRLMovieItemImporter *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CRLMovieItemImporter;
  v4 = -[CRLBoardItemImporter initWithData:boardItemFactory:](&v7, "initWithData:boardItemFactory:", a3, a4);
  v5 = v4;
  if (v4)
    sub_1002B69E0(v4);
  return v5;
}

- (BOOL)p_isURLRemote
{
  void *v2;
  void *v3;
  unsigned int v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemImporter URL](self, "URL"));
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "isFileURL") ^ 1;
  else
    LOBYTE(v4) = 0;

  return v4;
}

- (void)importBoardItemWithCompletionHandler:(id)a3
{
  id v4;
  id completionHandler;
  NSObject *importQueue;
  _QWORD block[5];

  v4 = objc_msgSend(a3, "copy");
  completionHandler = self->_completionHandler;
  self->_completionHandler = v4;

  importQueue = self->_importQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002B6B88;
  block[3] = &unk_10122D110;
  block[4] = self;
  dispatch_async(importQueue, block);
}

- (void)p_createAssetDataAndThenContinueImport
{
  OS_dispatch_queue *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  unsigned int v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  _TtC8Freeform27CRLPreinsertionAssetWrapper *v18;
  void *v19;
  void *v20;
  _TtC8Freeform27CRLPreinsertionAssetWrapper *v21;
  void *v22;
  _QWORD v23[5];
  id v24;

  v3 = self->_importQueue;
  if (v3 != (OS_dispatch_queue *)&_dispatch_main_q || !+[NSThread isMainThread](NSThread, "isMainThread"))
    dispatch_assert_queue_V2((dispatch_queue_t)v3);

  if (self->_isCancelled)
  {
    -[CRLMovieItemImporter p_finishImportingWithBoardItem:error:](self, "p_finishImportingWithBoardItem:error:", 0, 0);
    return;
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemImporter URL](self, "URL"));
  v5 = v4;
  if (v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lastPathComponent"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "pathExtension"));
    v8 = objc_msgSend(v7, "length");

    if (!v8)
    {
      v24 = 0;
      v9 = objc_msgSend(v5, "getResourceValue:forKey:error:", &v24, NSURLTypeIdentifierKey, 0);
      v10 = v24;
      v11 = v10;
      if (v9 && v10)
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[UTType typeWithIdentifier:](UTType, "typeWithIdentifier:", v10));
        if (!v12)
        {
          +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
          if (qword_10147E370 != -1)
            dispatch_once(&qword_10147E370, &stru_10124C8B8);
          if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
            sub_100E18FC0();
          if (qword_10147E370 != -1)
            dispatch_once(&qword_10147E370, &stru_10124C8D8);
          v13 = off_1013D9070;
          if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
            sub_100DE7468(v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLMovieItemImporter p_createAssetDataAndThenContinueImport]"));
          v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLMovieItemImporter.m"));
          +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v14, v15, 185, 0, "invalid nil value for '%{public}s'", "extensionUTType");

        }
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "preferredFilenameExtension"));
        if (objc_msgSend(v16, "length"))
        {
          v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringByAppendingPathExtension:", v16));

          v6 = (void *)v17;
        }

      }
    }
    v18 = [_TtC8Freeform27CRLPreinsertionAssetWrapper alloc];
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemImporter boardItemFactory](self, "boardItemFactory"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "assetOwner"));
    v21 = -[CRLPreinsertionAssetWrapper initWithUrl:filename:owner:](v18, "initWithUrl:filename:owner:", v5, v6, v20);

    if (!v21)
      goto LABEL_29;
  }
  else
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemImporter preinsertionAsset](self, "preinsertionAsset"));

    if (!v22
      || (v21 = (_TtC8Freeform27CRLPreinsertionAssetWrapper *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemImporter preinsertionAsset](self, "preinsertionAsset"))) == 0)
    {
LABEL_29:
      -[CRLMovieItemImporter p_performMovieCompatibilityAnalysis](self, "p_performMovieCompatibilityAnalysis");
      goto LABEL_30;
    }
  }
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_1002B6F74;
  v23[3] = &unk_10124C920;
  v23[4] = self;
  -[CRLPreinsertionAssetWrapper createAssetWithCompletionHandler:](v21, "createAssetWithCompletionHandler:", v23);

LABEL_30:
}

- (void)p_performMovieCompatibilityAnalysis
{
  OS_dispatch_queue *v3;
  uint64_t v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  CRLMovieCompatibilityChecker *v10;
  CRLMovieCompatibilityChecker *compatibilityChecker;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  CRLMovieCompatibilityChecker *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  _QWORD v21[5];
  id v22;
  uint64_t v23;

  v3 = self->_importQueue;
  if (v3 != (OS_dispatch_queue *)&_dispatch_main_q || !+[NSThread isMainThread](NSThread, "isMainThread"))
    dispatch_assert_queue_V2((dispatch_queue_t)v3);

  if (!self->_isCancelled && !-[CRLMovieItemImporter p_isURLRemote](self, "p_isURLRemote") && self->_movieData)
  {
    *(_QWORD *)&v5 = objc_opt_class(self, v4).n128_u64[0];
    v7 = v6;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLAsset type](self->_movieData, "type", v5));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "identifier"));
    LODWORD(v7) = objc_msgSend(v7, "isSupportedAnimatedImageFileType:", v9);

    if ((_DWORD)v7)
    {
      -[CRLMovieItemImporter p_importBoardItemFromAnimatedGIF](self, "p_importBoardItemFromAnimatedGIF");
    }
    else
    {
      v10 = -[CRLMovieCompatibilityChecker initWithData:asset:]([CRLMovieCompatibilityChecker alloc], "initWithData:asset:", self->_movieData, self->_asset);
      compatibilityChecker = self->_compatibilityChecker;
      self->_compatibilityChecker = v10;

      v12 = objc_claimAutoreleasedReturnValue(-[CRLBoardItemImporter delegate](self, "delegate"));
      v13 = (void *)v12;
      if (v12)
        v14 = 4;
      else
        v14 = 3;
      if (v12)
        v15 = 5;
      else
        v15 = 3;
      v16 = self->_compatibilityChecker;
      if (!v16)
      {
        +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_10124C940);
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          sub_100E190E0();
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_10124C960);
        v17 = off_1013D9070;
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          sub_100DE7468(v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLMovieItemImporter p_performMovieCompatibilityAnalysis]"));
        v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLMovieItemImporter.m"));
        +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v18, v19, 246, 0, "invalid nil value for '%{public}s'", "self->_compatibilityChecker");

        v16 = self->_compatibilityChecker;
      }
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_1002B744C;
      v21[3] = &unk_10122EC90;
      v21[4] = self;
      v22 = v13;
      v23 = v14;
      v20 = v13;
      -[CRLMovieCompatibilityChecker checkCompatibilityUpToLevel:completionHandler:](v16, "checkCompatibilityUpToLevel:completionHandler:", v15, v21);

    }
  }
  if (!self->_asset && !self->_boardItem || self->_isCancelled)
    -[CRLMovieItemImporter p_finishImportingWithBoardItem:error:](self, "p_finishImportingWithBoardItem:error:", 0, 0);
}

- (void)p_importBoardItemFromAssetConvertingIfNeededToRequiredCompatibilityLevel:(int64_t)a3 allowHEVCContent:(BOOL)a4 fromCompatibilityLevel:(int64_t)a5
{
  _BOOL4 v6;
  OS_dispatch_queue *v9;
  void *v10;
  void *v11;
  void *v12;
  CRLMovieCompatibilityConverter *v13;
  _TtC8Freeform8CRLAsset *movieData;
  void *v15;
  void *v16;
  CRLMovieCompatibilityConverter *v17;
  CRLMovieCompatibilityConverter *compatibilityConverter;
  void *v19;
  unsigned int v20;
  void *v21;
  CRLMovieCompatibilityConverter *v22;
  CRLBasicProgress *v23;
  _QWORD v24[5];

  v6 = a4;
  v9 = self->_importQueue;
  if (v9 != (OS_dispatch_queue *)&_dispatch_main_q || !+[NSThread isMainThread](NSThread, "isMainThread"))
    dispatch_assert_queue_V2((dispatch_queue_t)v9);

  if (self->_isCancelled)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124C9D0);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E1916C();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124C9F0);
    v10 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLMovieItemImporter p_importBoardItemFromAssetConvertingIfNeededToRequiredCompatibilityLevel:allowHEVCContent:fromCompatibilityLevel:]"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLMovieItemImporter.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v11, v12, 342, 0, "This method must not be called if the importer has been canceled.");

  }
  if (a5 >= a3)
  {
    v23 = -[CRLBasicProgress initWithMaxValue:]([CRLBasicProgress alloc], "initWithMaxValue:", 1.0);
    -[CRLScaledProgress setMaxValue:](self->_progress, "setMaxValue:", 1.0);
    -[CRLScaledProgress setProgress:](self->_progress, "setProgress:", v23);
    -[CRLMovieItemImporter p_importBoardItemFromAsset](self, "p_importBoardItemFromAsset");

  }
  else
  {
    v13 = [CRLMovieCompatibilityConverter alloc];
    movieData = self->_movieData;
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemImporter boardItemFactory](self, "boardItemFactory"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "assetOwner"));
    v17 = -[CRLMovieCompatibilityConverter initWithMovieData:desiredCompatibilityLevel:initialCompatibilityLevel:assetOwner:](v13, "initWithMovieData:desiredCompatibilityLevel:initialCompatibilityLevel:assetOwner:", movieData, a3, a5, v16);
    compatibilityConverter = self->_compatibilityConverter;
    self->_compatibilityConverter = v17;

    if (a3 == 4 && v6)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[CRLCapabilities currentCapabilities](CRLCapabilities, "currentCapabilities"));
      v20 = objc_msgSend(v19, "hasHEVCHardwareEncoding");

      if (v20)
        -[CRLMovieCompatibilityConverter setPlayableOnAllDevicesPreset:](self->_compatibilityConverter, "setPlayableOnAllDevicesPreset:", 5);
    }
    -[CRLScaledProgress setMaxValue:](self->_progress, "setMaxValue:", 100.0);
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[CRLMovieCompatibilityConverter progress](self->_compatibilityConverter, "progress"));
    -[CRLScaledProgress setProgress:](self->_progress, "setProgress:", v21);

    v22 = self->_compatibilityConverter;
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_1002B7B30;
    v24[3] = &unk_10122D110;
    v24[4] = self;
    -[CRLMovieCompatibilityConverter convertMediaWithCompletionHandler:](v22, "convertMediaWithCompletionHandler:", v24);
  }
}

- (id)p_importErrorForLackOfAVTracks
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v10[2];
  _QWORD v11[2];

  v10[0] = NSLocalizedDescriptionKey;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("The movie doesn’t contain audio or video."), 0, 0));
  v10[1] = CFSTR("CRLBoardItemImporterErrorMediaTypeKey");
  v11[0] = v4;
  v11[1] = &off_1012CC670;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v11, v10, 2));

  v6 = objc_msgSend(v5, "mutableCopy");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemImporter URL](self, "URL"));
  if (v7)
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, NSURLErrorKey);
  v8 = objc_msgSend(objc_alloc((Class)NSError), "initWithDomain:code:userInfo:", CFSTR("com.apple.freeform.CRLErrorDomainInfoImporter"), 101, v6);

  return v8;
}

- (id)p_makeMovieItemWithContainsVisibleTrack:(BOOL)a3 andIsURLRemote:(BOOL)a4
{
  double v6;
  double v7;
  CRLCanvasInfoGeometry *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  if (a3)
  {
    -[AVAsset naturalSizeWithPreferredTransforms](self->_asset, "naturalSizeWithPreferredTransforms");
    +[CRLMovieItem defaultVideoItemSizeWithOriginalSize:](_TtC8Freeform12CRLMovieItem, "defaultVideoItemSizeWithOriginalSize:");
  }
  else
  {
    +[CRLMovieItem defaultAudioItemSize](_TtC8Freeform12CRLMovieItem, "defaultAudioItemSize");
  }
  v8 = -[CRLCanvasInfoGeometry initWithSize:]([CRLCanvasInfoGeometry alloc], "initWithSize:", v6, v7);
  if (a4)
  {
    v9 = 0;
  }
  else
  {
    if (!self->_movieData)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10124CA10);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E191F0();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10124CA30);
      v10 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLMovieItemImporter p_makeMovieItemWithContainsVisibleTrack:andIsURLRemote:]"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLMovieItemImporter.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v11, v12, 449, 0, "invalid nil value for '%{public}s'", "self->_movieData");

    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemImporter boardItemFactory](self, "boardItemFactory"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "makeMovieItemWithGeometry:movieData:posterImageData:posterTime:", v8, self->_movieData, 0, 0.0));

    -[CRLMovieItemImporter p_removeShadowIfNeeded:](self, "p_removeShadowIfNeeded:", v9);
  }

  return v9;
}

- (void)p_setPropertiesFromLoadedAssetToMovie:(id)a3 containsVideoTrack:(BOOL)a4
{
  +[CRLMovieItemImporter p_setMovieProperties:fromLoadedAsset:containsVideoTrack:](CRLMovieItemImporter, "p_setMovieProperties:fromLoadedAsset:containsVideoTrack:", a3, self->_asset, a4);
}

- (void)p_enableLoopingIfNeeded:(id)a3
{
  id v3;

  v3 = a3;
  if (objc_msgSend(v3, "isAnimatedImage"))
    objc_msgSend(v3, "setIsLooping:", 1);

}

- (void)p_removeShadowIfNeeded:(id)a3
{
  void *v4;
  id v5;
  id v6;

  v6 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AVAsset tracksWithMediaCharacteristic:](self->_asset, "tracksWithMediaCharacteristic:", AVMediaCharacteristicContainsAlphaChannel));
  v5 = objc_msgSend(v4, "count");
  if ((objc_msgSend(v6, "isAnimatedImage") & 1) != 0 || v5)
    objc_msgSend(v6, "setShadow:", 0);

}

+ (void)p_setMovieProperties:(id)a3 fromLoadedAsset:(id)a4 containsVideoTrack:(BOOL)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
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
  double Seconds;
  id v22;
  CMTime v23[2];

  v7 = a3;
  v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "metadata"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[AVAsset crl_titleWithMetadataArray:](AVAsset, "crl_titleWithMetadataArray:", v9));
  if (v10
    || (v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "movieAssetPayload")),
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "filename")),
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "stringByDeletingPathExtension")),
        v12,
        v11,
        v10))
  {
    objc_msgSend(v7, "setTitle:", v10);

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[AVAsset crl_creatorArtistOrAuthorWithMetadataArray:](AVAsset, "crl_creatorArtistOrAuthorWithMetadataArray:", v9));
  objc_msgSend(v7, "setCreator:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "creator"));
  if (!v14)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "movieAssetPayload"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "type"));

    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "localizedDescription"));
    objc_msgSend(v7, "setCreator:", v17);

  }
  memset(&v23[1], 0, sizeof(CMTime));
  if (!v8 || (objc_msgSend(v8, "duration"), (v23[1].flags & 1) == 0))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124CA50);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E1927C();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124CA70);
    v18 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLMovieItemImporter p_setMovieProperties:fromLoadedAsset:containsVideoTrack:]"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLMovieItemImporter.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v19, v20, 502, 0, "invalid duration received from avAsset on load, preventing us from setting up start and end time properly based on it.");

  }
  v23[0] = v23[1];
  Seconds = CMTimeGetSeconds(v23);
  objc_msgSend(v7, "setStartTime:", 0.0);
  objc_msgSend(v7, "setEndTime:", Seconds);
  if (a5)
    v22 = 0;
  else
    v22 = objc_msgSend(v8, "crl_containsTracksWithVisualCharacteristics");
  objc_msgSend(v7, "setIsAudioOnly:", v22);

}

- (void)p_asynchronouslyGeneratePosterImagesAndFinishImportingMovieItem:(id)a3
{
  id v4;
  double v5;
  Float64 v6;
  CRLMoviePosterImageGenerator *v7;
  CRLMoviePosterImageGenerator *posterImageGenerator;
  CRLMoviePosterImageGenerator *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  CMTime v13;

  v4 = a3;
  objc_msgSend(v4, "posterTime");
  v6 = v5;
  v7 = -[CRLMoviePosterImageGenerator initWithAsset:]([CRLMoviePosterImageGenerator alloc], "initWithAsset:", self->_asset);
  posterImageGenerator = self->_posterImageGenerator;
  self->_posterImageGenerator = v7;

  v9 = self->_posterImageGenerator;
  CMTimeMakeWithSeconds(&v13, v6, +[CRLCommonConstants timeScale](_TtC8Freeform18CRLCommonConstants, "timeScale"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1002B8540;
  v11[3] = &unk_10124CB50;
  v11[4] = self;
  v12 = v4;
  v10 = v4;
  -[CRLMoviePosterImageGenerator generateCGImageAsynchronouslyForTime:completionHandler:](v9, "generateCGImageAsynchronouslyForTime:completionHandler:", &v13, v11);

}

- (void)p_importBoardItemFromAsset
{
  OS_dispatch_queue *v3;
  AVAsset *asset;
  _UNKNOWN **v5;

  v3 = self->_importQueue;
  if (v3 != (OS_dispatch_queue *)&_dispatch_main_q || !+[NSThread isMainThread](NSThread, "isMainThread"))
    dispatch_assert_queue_V2((dispatch_queue_t)v3);

  asset = self->_asset;
  v5 = &off_1012CB848;
  -[AVAsset loadValuesAsynchronouslyForKeys:completionHandler:](asset, "loadValuesAsynchronouslyForKeys:completionHandler:", _NSConcreteStackBlock, 3221225472, sub_1002B8AA8, &unk_10122D3D8, self);

}

- (void)p_importBoardItemFromAnimatedGIF
{
  double v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  CRLCanvasInfoGeometry *v10;
  CRLCanvasInfoGeometry *v11;
  void *v12;
  id v13;
  void *v14;
  CRLAnimatedGIFController *v15;
  _TtC8Freeform27CRLPreinsertionAssetWrapper *v16;
  __CFData *v17;
  void *v18;
  void *v19;
  void *v20;
  _TtC8Freeform27CRLPreinsertionAssetWrapper *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  CRLCanvasInfoGeometry *v26;
  _TtC8Freeform27CRLPreinsertionAssetWrapper *v27;
  id v28;
  void *v29;
  void *v30;
  CGImageSource *v31;
  size_t Count;
  size_t v33;
  size_t i;
  CFDictionaryRef v35;
  CFDictionaryRef v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  _TtC8Freeform27CRLPreinsertionAssetWrapper *v48;
  CRLCanvasInfoGeometry *v49;
  void *v50;
  _QWORD v51[5];
  id v52;
  id v53;
  _QWORD v54[2];
  _QWORD v55[2];

  *(_QWORD *)&v3 = objc_opt_class(CRLBitmapImageProvider, a2).n128_u64[0];
  v5 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[CRLImageProviderPool sharedPool](CRLImageProviderPool, "sharedPool", v3));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "temporaryProviderForAsset:shouldValidate:", self->_movieData, 1));
  v8 = sub_100221D0C(v5, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  if (v9)
  {
    v10 = [CRLCanvasInfoGeometry alloc];
    objc_msgSend(v9, "naturalSize");
    v11 = -[CRLCanvasInfoGeometry initWithSize:](v10, "initWithSize:");
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemImporter boardItemFactory](self, "boardItemFactory"));
    v49 = v11;
    v13 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "makeMovieItemWithGeometry:movieData:posterImageData:posterTime:", v11, self->_movieData, 0, 0.0));

    v14 = objc_autoreleasePoolPush();
    v15 = -[CRLAnimatedGIFController initWithData:delegate:]([CRLAnimatedGIFController alloc], "initWithData:delegate:", self->_movieData, 0);
    v50 = v9;
    if (v15)
    {
      v16 = [_TtC8Freeform27CRLPreinsertionAssetWrapper alloc];
      objc_msgSend(v13, "startTime");
      v17 = sub_100435130(-[CRLAnimatedGIFController imageForTime:](v15, "imageForTime:"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemImporter boardItemFactory](self, "boardItemFactory"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "assetOwner"));
      v53 = 0;
      v21 = -[CRLPreinsertionAssetWrapper initWithData:filename:owner:error:](v16, "initWithData:filename:owner:error:", v18, CFSTR("posterImage.png"), v20, &v53);
      v22 = v53;

      v48 = v21;
      if (!v21)
      {
        if (qword_10147E368 != -1)
          dispatch_once(&qword_10147E368, &stru_10124CBB0);
        v23 = off_1013D9068;
        if (os_log_type_enabled((os_log_t)off_1013D9068, OS_LOG_TYPE_ERROR))
          sub_100E19300(v23);
      }
      -[CRLAnimatedGIFController absoluteDuration](v15, "absoluteDuration");
      objc_msgSend(v13, "setEndTime:");
    }
    else
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10124CB70);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E19430();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10124CB90);
      v29 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v29);
      v22 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLMovieItemImporter p_importBoardItemFromAnimatedGIF]"));
      v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLMovieItemImporter.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v22, v30, 646, 0, "invalid nil value for '%{public}s'", "controller");

      v48 = 0;
    }

    objc_autoreleasePoolPop(v14);
    v31 = -[CRLAsset newCGImageSource](self->_movieData, "newCGImageSource");
    Count = CGImageSourceGetCount(v31);
    if (Count)
    {
      v33 = Count;
      for (i = 0; i < v33; ++i)
      {
        v35 = CGImageSourceCopyPropertiesAtIndex(v31, i, 0);
        v36 = v35;
        if (v35)
        {
          v37 = (void *)objc_claimAutoreleasedReturnValue(-[__CFDictionary objectForKeyedSubscript:](v35, "objectForKeyedSubscript:", kCGImagePropertyGIFDictionary));
          if (v37)
          {
            v38 = v37;
            v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "objectForKeyedSubscript:", kCGImagePropertyGIFLoopCount));
            if (v39)
            {
              v40 = v39;
              v41 = objc_msgSend(v39, "integerValue");

              if (v41 == (id)1)
                break;
              continue;
            }

          }
        }

      }
    }
    if (v31)
      CFRelease(v31);
    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "movieAssetPayload"));
    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "filename"));
    v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "stringByDeletingPathExtension"));
    objc_msgSend(v13, "setTitle:", v44);

    v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "movieAssetPayload"));
    v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "type"));

    v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "localizedDescription"));
    objc_msgSend(v13, "setCreator:", v47);

    -[CRLMovieItemImporter p_removeShadowIfNeeded:](self, "p_removeShadowIfNeeded:", v13);
    -[CRLMovieItemImporter p_enableLoopingIfNeeded:](self, "p_enableLoopingIfNeeded:", v13);
    v9 = v50;
    v27 = v48;
    if (v48)
    {
      v51[0] = _NSConcreteStackBlock;
      v51[1] = 3221225472;
      v51[2] = sub_1002B9418;
      v51[3] = &unk_10124CB00;
      v51[4] = self;
      v13 = v13;
      v52 = v13;
      -[CRLPreinsertionAssetWrapper createAssetWithCompletionHandler:](v48, "createAssetWithCompletionHandler:", v51);

    }
    else
    {
      -[CRLMovieItemImporter p_finishImportingWithBoardItem:error:](self, "p_finishImportingWithBoardItem:error:", v13, 0);
    }
    v26 = v49;
  }
  else
  {
    v54[0] = NSLocalizedDescriptionKey;
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "localizedStringForKey:value:table:", CFSTR("The movie doesn’t contain audio or video."), 0, 0));
    v54[1] = CFSTR("CRLBoardItemImporterErrorMediaTypeKey");
    v55[0] = v25;
    v55[1] = &off_1012CC670;
    v26 = (CRLCanvasInfoGeometry *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v55, v54, 2));

    v13 = -[CRLCanvasInfoGeometry mutableCopy](v26, "mutableCopy");
    v27 = (_TtC8Freeform27CRLPreinsertionAssetWrapper *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemImporter URL](self, "URL"));
    if (v27)
      objc_msgSend(v13, "setObject:forKeyedSubscript:", v27, NSURLErrorKey);
    v28 = objc_msgSend(objc_alloc((Class)NSError), "initWithDomain:code:userInfo:", CFSTR("com.apple.freeform.CRLErrorDomainInfoImporter"), 101, v13);
    -[CRLMovieItemImporter p_finishImportingWithBoardItem:error:](self, "p_finishImportingWithBoardItem:error:", 0, v28);

  }
}

- (void)p_tellMovieCompatibilityProviderToIgnoreCompatibilityLevelIfNeeded
{
  OS_dispatch_queue *v3;
  uint64_t v4;
  void *v5;
  char v6;
  void *v7;

  v3 = self->_importQueue;
  if (v3 != (OS_dispatch_queue *)&_dispatch_main_q || !+[NSThread isMainThread](NSThread, "isMainThread"))
    dispatch_assert_queue_V2((dispatch_queue_t)v3);

  if (!self->_didMessageDelegateAboutMovieCompatibility)
  {
    self->_didMessageDelegateAboutMovieCompatibility = 1;
    v4 = objc_claimAutoreleasedReturnValue(-[CRLBoardItemImporter delegate](self, "delegate"));
    v5 = (void *)v4;
    if (v4)
    {
      v7 = (void *)v4;
      v6 = objc_opt_respondsToSelector(v4, "boardItemImporterWillIgnoreMediaCompatibilityOnAllDevicesRequirement:");
      v5 = v7;
      if ((v6 & 1) != 0)
      {
        objc_msgSend(v7, "boardItemImporterWillIgnoreMediaCompatibilityOnAllDevicesRequirement:", self);
        v5 = v7;
      }
    }

  }
}

- (BOOL)p_validateSizeOfImportWithBoardItem:(id)a3 error:(id *)a4
{
  if (a4)
    *a4 = 0;
  return 1;
}

- (void)p_finishImportingWithBoardItem:(id)a3 error:(id)a4
{
  id v7;
  id v8;
  OS_dispatch_queue *v9;
  uint64_t v10;
  double v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  _TtC8Freeform12CRLBoardItem **p_boardItem;
  uint64_t v18;
  objc_class *v19;
  id v20;
  void *v21;
  unsigned __int8 v22;
  id v23;
  id v24;
  _TtC8Freeform12CRLBoardItem *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  _TtC8Freeform12CRLBoardItem *v31;
  __CFString *v32;
  id v33;
  __CFString *v34;
  uint64_t v35;
  id v36;
  const __CFString *v37;
  _TtC8Freeform12CRLBoardItem *v38;
  NSError *v39;
  NSError *error;
  _TtC8Freeform8CRLAsset *movieData;
  _TtC8Freeform8CRLAsset *readonlyMovieData;
  AVAsset *asset;
  CRLMoviePosterImageGenerator *posterImageGenerator;
  void (**completionHandler)(void);
  id v46;
  id v47;
  id v48;
  _QWORD v49[2];
  _QWORD v50[2];

  v7 = a3;
  v8 = a4;
  v9 = self->_importQueue;
  if (v9 != (OS_dispatch_queue *)&_dispatch_main_q || !+[NSThread isMainThread](NSThread, "isMainThread"))
    dispatch_assert_queue_V2((dispatch_queue_t)v9);

  -[CRLMovieItemImporter p_tellMovieCompatibilityProviderToIgnoreCompatibilityLevelIfNeeded](self, "p_tellMovieCompatibilityProviderToIgnoreCompatibilityLevelIfNeeded");
  if (!self->_isCancelled)
  {
    *(_QWORD *)&v11 = objc_opt_class(CRLBasicProgress, v10).n128_u64[0];
    v13 = v12;
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[CRLScaledProgress progress](self->_progress, "progress", v11));
    v15 = sub_100221D0C(v13, v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);

    if (v16)
    {
      objc_msgSend(v16, "maxValue");
      objc_msgSend(v16, "setValue:");
    }
    if (v7)
    {
      p_boardItem = &self->_boardItem;
      objc_storeStrong((id *)&self->_boardItem, a3);
      objc_opt_class(_TtC8Freeform12CRLMovieItem, v18);
      v20 = sub_1002223BC(v19, v7);
      v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
      objc_msgSend(v21, "setPosterImageData:", self->_posterImageData);
      v48 = 0;
      v22 = -[CRLMovieItemImporter p_validateSizeOfImportWithBoardItem:error:](self, "p_validateSizeOfImportWithBoardItem:error:", v21, &v48);
      v23 = v48;
      v24 = v48;
      if ((v22 & 1) != 0)
      {
LABEL_27:

        goto LABEL_28;
      }
      objc_storeStrong((id *)&self->_error, v23);
      v25 = *p_boardItem;
      *p_boardItem = 0;
    }
    else
    {
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemImporter URL](self, "URL"));
      v21 = v26;
      if (v26)
      {
        v47 = 0;
        objc_msgSend(v26, "getResourceValue:forKey:error:", &v47, NSURLLocalizedNameKey, 0);
        v27 = v47;
        if (!v27)
          v27 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "lastPathComponent"));
        v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "localizedStringForKey:value:table:", CFSTR("The movie “%@” couldn’t be inserted."), 0, 0));
        v24 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v29, v27));

      }
      else
      {
        v27 = (id)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v24 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "localizedStringForKey:value:table:", CFSTR("The movie couldn’t be inserted."), 0, 0));
      }

      if (v8)
      {
        v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "userInfo"));
        v25 = (_TtC8Freeform12CRLBoardItem *)objc_msgSend(v30, "mutableCopy");

        if (v21)
          -[CRLBoardItem setObject:forKeyedSubscript:](v25, "setObject:forKeyedSubscript:", v21, NSURLErrorKey);
        v31 = (_TtC8Freeform12CRLBoardItem *)objc_claimAutoreleasedReturnValue(-[CRLBoardItem objectForKeyedSubscript:](v25, "objectForKeyedSubscript:", NSLocalizedDescriptionKey));
        if (!v31
          || (-[CRLBoardItem setObject:forKeyedSubscript:](v25, "setObject:forKeyedSubscript:", v31, NSLocalizedFailureReasonErrorKey), v32 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "domain")), v32, v32 != CFSTR("com.apple.freeform.CRLErrorDomainInfoImporter")))
        {
          -[CRLBoardItem setObject:forKeyedSubscript:](v25, "setObject:forKeyedSubscript:", v24, NSLocalizedDescriptionKey);
        }
        v33 = objc_alloc((Class)NSError);
        v34 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "domain"));
        v35 = (uint64_t)objc_msgSend(v8, "code");
        v36 = v33;
        v37 = v34;
        v38 = v25;
      }
      else
      {
        v49[0] = NSLocalizedDescriptionKey;
        v49[1] = CFSTR("CRLBoardItemImporterErrorMediaTypeKey");
        v50[0] = v24;
        v50[1] = &off_1012CC670;
        v25 = (_TtC8Freeform12CRLBoardItem *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v50, v49, 2));
        v31 = (_TtC8Freeform12CRLBoardItem *)-[CRLBoardItem mutableCopy](v25, "mutableCopy");
        v34 = (__CFString *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemImporter URL](self, "URL"));
        if (v34)
          -[CRLBoardItem setObject:forKeyedSubscript:](v31, "setObject:forKeyedSubscript:", v34, NSURLErrorKey);
        v36 = objc_alloc((Class)NSError);
        v37 = CFSTR("com.apple.freeform.CRLErrorDomainInfoImporter");
        v35 = 100;
        v38 = v31;
      }
      v39 = (NSError *)objc_msgSend(v36, "initWithDomain:code:userInfo:", v37, v35, v38);
      error = self->_error;
      self->_error = v39;

    }
    goto LABEL_27;
  }
LABEL_28:
  movieData = self->_movieData;
  self->_movieData = 0;

  readonlyMovieData = self->_readonlyMovieData;
  self->_readonlyMovieData = 0;

  asset = self->_asset;
  self->_asset = 0;

  posterImageGenerator = self->_posterImageGenerator;
  self->_posterImageGenerator = 0;

  completionHandler = (void (**)(void))self->_completionHandler;
  if (completionHandler)
  {
    completionHandler[2]();
    v46 = self->_completionHandler;
    self->_completionHandler = 0;

  }
}

- (void)cancel
{
  NSObject *importQueue;
  _QWORD block[5];

  importQueue = self->_importQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002B9BE8;
  block[3] = &unk_10122D110;
  block[4] = self;
  dispatch_async(importQueue, block);
}

- (unint64_t)uploadDataLength
{
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  objc_opt_class(_TtC8Freeform12CRLMovieItem, a2);
  v4 = sub_100221D0C(v3, self->_boardItem);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "movieAssetPayload"));
  v7 = objc_msgSend(v6, "length");

  return (unint64_t)v7;
}

- (unint64_t)embeddedDataLength
{
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  char *v7;
  void *v8;
  char *v9;

  objc_opt_class(_TtC8Freeform12CRLMovieItem, a2);
  v4 = sub_100221D0C(v3, self->_boardItem);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "posterImageAssetPayload"));
  v7 = (char *)objc_msgSend(v6, "length");

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "movieAssetPayload"));
  v9 = &v7[(_QWORD)objc_msgSend(v8, "length")];

  return (unint64_t)v9;
}

- (unint64_t)p_onlyMovieFileDataLength
{
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  objc_opt_class(_TtC8Freeform12CRLMovieItem, a2);
  v4 = sub_100221D0C(v3, self->_boardItem);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "movieAssetPayload"));
  v7 = objc_msgSend(v6, "length");

  return (unint64_t)v7;
}

- (id)progress
{
  return self->_progress;
}

- (id)boardItem
{
  return self->_boardItem;
}

- (id)error
{
  return self->_error;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_boardItem, 0);
  objc_storeStrong((id *)&self->_posterImageGenerator, 0);
  objc_storeStrong((id *)&self->_compatibilityConverter, 0);
  objc_storeStrong((id *)&self->_compatibilityChecker, 0);
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_readonlyMovieData, 0);
  objc_storeStrong((id *)&self->_posterImageData, 0);
  objc_storeStrong((id *)&self->_movieData, 0);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_importQueue, 0);
}

@end
