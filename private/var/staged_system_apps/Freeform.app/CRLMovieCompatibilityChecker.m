@implementation CRLMovieCompatibilityChecker

- (CRLMovieCompatibilityChecker)initWithData:(id)a3 asset:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  CRLMovieCompatibilityChecker *v12;
  CRLMovieCompatibilityChecker *v13;
  void *v14;
  void *v15;
  objc_super v17;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101247B68);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E1173C();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101247B88);
    v9 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLMovieCompatibilityChecker initWithData:asset:]"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLMovieCompatibilityChecker.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v10, v11, 46, 0, "invalid nil value for '%{public}s'", "data");

  }
  v17.receiver = self;
  v17.super_class = (Class)CRLMovieCompatibilityChecker;
  v12 = -[CRLMovieCompatibilityChecker init](&v17, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_data, a3);
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "type"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "identifier"));
    v13->_movieIsAnimatedImage = +[CRLAnimatedGIFController canInitWithDataType:](CRLAnimatedGIFController, "canInitWithDataType:", v15);

    if (!v13->_movieIsAnimatedImage)
    {
      if (!v8)
        v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "AVAssetAndReturnError:", 0));
      objc_storeStrong((id *)&v13->_asset, v8);
    }
  }

  return v13;
}

- (CRLMovieCompatibilityChecker)initWithData:(id)a3
{
  return -[CRLMovieCompatibilityChecker initWithData:asset:](self, "initWithData:asset:", a3, 0);
}

- (CRLMovieCompatibilityChecker)init
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
    dispatch_once(&qword_10147E370, &stru_101247BA8);
  v3 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109890;
    v12 = v2;
    v13 = 2082;
    v14 = "-[CRLMovieCompatibilityChecker init]";
    v15 = 2082;
    v16 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLMovieCompatibilityChecker.m";
    v17 = 1024;
    v18 = 71;
    _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Do not call method", buf, 0x22u);
  }
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_101247BC8);
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
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLMovieCompatibilityChecker init]"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLMovieCompatibilityChecker.m"));
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 71, 0, "Do not call method");

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s: %s"), "Do not call method", "-[CRLMovieCompatibilityChecker init]"));
  v10 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v9, 0));

  objc_exception_throw(v10);
}

- (void)checkCompatibilityUpToLevel:(int64_t)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  CRLMovieCompatibilityChecker *v10;
  int64_t v11;
  uint64_t v12;

  v6 = a4;
  if (a3 <= 1)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101247BE8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E117D0();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101247C08);
    v7 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLMovieCompatibilityChecker checkCompatibilityUpToLevel:completionHandler:]"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLMovieCompatibilityChecker.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v8, v9, 75, 0, "Invalid parameter not satisfying: %{public}s", "maxDesiredCompatibilityLevel > CRLMediaCompatibilityLevelNone");

  }
  if (self->_movieIsAnimatedImage)
  {
    v10 = self;
    v11 = a3;
    v12 = 5;
LABEL_17:
    -[CRLMovieCompatibilityChecker p_didFinishCheckingCompatibilityUpToLevel:actualLevel:error:completionHandler:](v10, "p_didFinishCheckingCompatibilityUpToLevel:actualLevel:error:completionHandler:", v11, v12, 0, v6);
    goto LABEL_18;
  }
  if (-[CRLAsset needsDownload](self->_data, "needsDownload") || !self->_asset)
  {
    v10 = self;
    v11 = a3;
    v12 = 0;
    goto LABEL_17;
  }
  -[CRLMovieCompatibilityChecker p_checkCompatibilityOfAVAssetUpToLevel:completionHandler:](self, "p_checkCompatibilityOfAVAssetUpToLevel:completionHandler:", a3, v6);
LABEL_18:

}

- (void)p_checkCompatibilityOfAVAssetUpToLevel:(int64_t)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  AVAsset *asset;
  id v9;
  _QWORD v10[5];
  id v11;
  int64_t v12;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[AVAsset crl_playableKeysWithKeys:](AVAsset, "crl_playableKeysWithKeys:", &off_1012CB6C8));
  asset = self->_asset;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10024D5D0;
  v10[3] = &unk_1012313C0;
  v11 = v6;
  v12 = a3;
  v10[4] = self;
  v9 = v6;
  -[AVAsset loadValuesAsynchronouslyForKeys:completionHandler:](asset, "loadValuesAsynchronouslyForKeys:completionHandler:", v7, v10);

}

- (void)checkCustomCompatibilityWithVideoCodecTypes:(id)a3 maxPlayableVideoDimensions:(CGSize)a4 maxPlayableVideoPixelsPerFrame:(int)a5 completionHandler:(id)a6
{
  -[CRLMovieCompatibilityChecker p_checkCustomCompatibilityWithVideoCodecTypes:maxPlayableVideoDimensions:maxPlayableVideoPixelsPerFrame:maxAudioBitRate:completionHandler:](self, "p_checkCustomCompatibilityWithVideoCodecTypes:maxPlayableVideoDimensions:maxPlayableVideoPixelsPerFrame:maxAudioBitRate:completionHandler:", a3, *(_QWORD *)&a5, 0, a6, a4.width, a4.height);
}

- (void)p_checkCustomCompatibilityWithVideoCodecTypes:(id)a3 maxPlayableVideoDimensions:(CGSize)a4 maxPlayableVideoPixelsPerFrame:(int)a5 maxAudioBitRate:(int)a6 completionHandler:(id)a7
{
  double height;
  double width;
  NSSet *v13;
  NSSet *customPlayableVideoCodecTypes;
  id v15;

  height = a4.height;
  width = a4.width;
  v15 = a7;
  v13 = (NSSet *)objc_msgSend(a3, "copy");
  customPlayableVideoCodecTypes = self->_customPlayableVideoCodecTypes;
  self->_customPlayableVideoCodecTypes = v13;

  self->_customMaxPlayableVideoDimensions.width = (int)width;
  self->_customMaxPlayableVideoDimensions.height = (int)height;
  self->_customMaxPlayableVideoPixelsPerFrame = a5;
  self->_customMaxAudioBitRate = a6;
  -[CRLMovieCompatibilityChecker checkCompatibilityUpToLevel:completionHandler:](self, "checkCompatibilityUpToLevel:completionHandler:", 6, v15);

}

- (void)checkCustomCompatibilityWithConverterPreset:(int64_t)a3 completionHandler:(id)a4
{
  uint64_t v6;
  void (**v7)(_QWORD);
  void *v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  id v19;
  id v20;

  v7 = (void (**)(_QWORD))a4;
  if ((unint64_t)a3 > 1)
  {
    *(_QWORD *)&v11 = objc_opt_class(self, v6).n128_u64[0];
    v13 = v12;
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "videoCodecsForMediaCompatibilityConverterPreset:", a3, v11));
    objc_msgSend(v13, "maxPlayableVideoDimensionsForMediaCompatibilityConverterPreset:", a3);
    v16 = v15;
    v18 = v17;
    v19 = objc_msgSend(v13, "maxPlayableVideoPixelsPerFrameForMediaCompatibilityConverterPreset:", a3);
    v20 = objc_msgSend(v13, "maxPlayableAudioBitrateForMediaCompatibilityConverterPreset:", a3);
    self->_wasConverterPresetMoreCompatibleThanAsset = +[CRLMovieCompatibilityChecker isPreset:moreCompatibleThanAsset:](CRLMovieCompatibilityChecker, "isPreset:moreCompatibleThanAsset:", a3, self->_asset);
    -[CRLMovieCompatibilityChecker p_checkCustomCompatibilityWithVideoCodecTypes:maxPlayableVideoDimensions:maxPlayableVideoPixelsPerFrame:maxAudioBitRate:completionHandler:](self, "p_checkCustomCompatibilityWithVideoCodecTypes:maxPlayableVideoDimensions:maxPlayableVideoPixelsPerFrame:maxAudioBitRate:completionHandler:", v14, v19, v20, v7, v16, v18);

  }
  else
  {
    if (!a3)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101247D90);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E11B38();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101247DB0);
      v8 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLMovieCompatibilityChecker checkCustomCompatibilityWithConverterPreset:completionHandler:]"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLMovieCompatibilityChecker.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v9, v10, 273, 0, "Invalid preset");

    }
    self->_compatibilityLevel = 4;
    if (v7)
      v7[2](v7);
  }

}

- (void)p_didFinishCheckingCompatibilityUpToLevel:(int64_t)a3 actualLevel:(int64_t)a4 error:(id)a5 completionHandler:(id)a6
{
  id v10;
  void (**v11)(_QWORD);
  void *v12;
  unsigned int v13;
  void *v14;
  void *v15;
  void *v16;
  int64_t v17;
  NSError *v18;
  NSError *error;
  NSErrorUserInfoKey v20;
  void *v21;

  v10 = a5;
  v11 = (void (**)(_QWORD))a6;
  if (!-[CRLMovieCompatibilityChecker isCancelled](self, "isCancelled"))
  {
    if (a4 || !v10)
    {
      if (a4 || v10)
      {
LABEL_11:
        if (a4 >= a3)
          v17 = a3;
        else
          v17 = a4;
        self->_compatibilityLevel = v17;
        v18 = (NSError *)objc_msgSend(v10, "copy");
        error = self->_error;
        self->_error = v18;

        goto LABEL_15;
      }
      v20 = NSLocalizedDescriptionKey;
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("This movie can’t be added."), 0, 0));
      v21 = v15;
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1));

      v10 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.freeform.CRLErrorDomainMediaCompatibility"), 100, v16));
    }
    else if (objc_msgSend(v10, "code") == (id)-11828)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "domain"));
      v13 = objc_msgSend(v12, "isEqualToString:", AVFoundationErrorDomain);

      if (v13)
      {

        v10 = 0;
        a4 = 1;
        goto LABEL_11;
      }
    }
    a4 = 0;
    goto LABEL_11;
  }
LABEL_15:
  if (v11)
    v11[2](v11);

}

- (void)cancel
{
  atomic_store(1u, (unsigned __int8 *)&self->_cancelled);
  -[AVAsset cancelLoading](self->_asset, "cancelLoading");
}

- (BOOL)isCancelled
{
  unsigned __int8 v2;

  v2 = atomic_load((unsigned __int8 *)&self->_cancelled);
  return v2 & 1;
}

+ (BOOL)p_doesTrack:(id)a3 matchCodecTypes:(id)a4
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *i;
  NSNumber *v10;
  void *v11;
  unsigned __int8 v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v5 = a4;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "formatDescriptions", 0));
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v6);
        v10 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", CMFormatDescriptionGetMediaSubType(*(CMFormatDescriptionRef *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i)));
        v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
        v12 = objc_msgSend(v5, "containsObject:", v11);

        if ((v12 & 1) != 0)
        {
          LOBYTE(v7) = 1;
          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

  return (char)v7;
}

+ (BOOL)p_doesAsset:(id)a3 containTrackWithMediaType:(id)a4 matchingCodecTypes:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  void *v15;
  void *v16;
  unsigned __int8 v17;
  BOOL v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];

  v8 = a4;
  v9 = a5;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "tracks", 0));
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(_QWORD *)v21 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v15, "isEnabled"))
        {
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "mediaType"));
          if ((objc_msgSend(v16, "isEqualToString:", v8) & 1) != 0)
          {
            v17 = objc_msgSend(a1, "p_doesTrack:matchCodecTypes:", v15, v9);

            if ((v17 & 1) != 0)
            {
              v18 = 1;
              goto LABEL_14;
            }
          }
          else
          {

          }
        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v12);
  }
  v18 = 0;
LABEL_14:

  return v18;
}

+ (BOOL)assetContainsHEVCVideoTracks:(id)a3
{
  return objc_msgSend(a1, "p_doesAsset:containTrackWithMediaType:matchingCodecTypes:", a3, AVMediaTypeVideo, &off_1012CB710);
}

+ (BOOL)assetContainsVideoTracksWithAlpha:(id)a3
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  BOOL v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "tracks", 0));
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)i), "hasMediaCharacteristic:", AVMediaCharacteristicContainsAlphaChannel) & 1) != 0)
        {
          v8 = 1;
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v5)
        continue;
      break;
    }
  }
  v8 = 0;
LABEL_11:

  return v8;
}

+ (BOOL)assetContainsH264VideoTracks:(id)a3
{
  return objc_msgSend(a1, "p_doesAsset:containTrackWithMediaType:matchingCodecTypes:", a3, AVMediaTypeVideo, &off_1012CB728);
}

+ (BOOL)assetContainsProResVideoTracks:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[AVAsset crl_codecTypesForProRes](AVAsset, "crl_codecTypesForProRes"));
  LOBYTE(a1) = objc_msgSend(a1, "p_doesAsset:containTrackWithMediaType:matchingCodecTypes:", v4, AVMediaTypeVideo, v5);

  return (char)a1;
}

+ (BOOL)isPreset:(int64_t)a3 moreCompatibleThanAsset:(id)a4
{
  id v6;
  unsigned __int8 v7;
  unsigned int v8;
  void *v9;

  v6 = a4;
  if (!objc_msgSend(v6, "crl_containsVideoTracks"))
    goto LABEL_8;
  if (!sub_100243F8C(a3))
  {
    if (sub_100243FA4(a3))
    {
      if ((objc_msgSend(a1, "assetContainsH264VideoTracks:", v6) & 1) == 0)
      {
        v7 = objc_msgSend(a1, "assetContainsHEVCVideoTracks:", v6);
        goto LABEL_7;
      }
LABEL_9:
      LOBYTE(v8) = 0;
      goto LABEL_11;
    }
LABEL_8:
    if ((unint64_t)a3 >= 2)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "p_defaultPlayableAudioCodecTypes"));
      v8 = objc_msgSend(a1, "p_doesAsset:containTrackWithMediaType:matchingCodecTypes:", v6, AVMediaTypeAudio, v9) ^ 1;

      goto LABEL_11;
    }
    goto LABEL_9;
  }
  v7 = objc_msgSend(a1, "assetContainsH264VideoTracks:", v6);
LABEL_7:
  LOBYTE(v8) = v7 ^ 1;
LABEL_11:

  return v8;
}

+ (BOOL)platformSupportsProRes
{
  return 1;
}

+ (id)videoCodecsForMediaCompatibilityConverterPreset:(int64_t)a3
{
  void *v3;
  _UNKNOWN **v4;

  if ((unint64_t)a3 > 1)
  {
    if (sub_100243FA4(a3))
      v4 = &off_1012CC388;
    else
      v4 = &off_1012CC3A0;
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", v4));
  }
  else
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet set](NSSet, "set"));
  }
  return v3;
}

+ (CGSize)maxPlayableVideoDimensionsForMediaCompatibilityConverterPreset:(int64_t)a3
{
  double height;
  double width;
  CGSize result;

  if ((unint64_t)a3 > 5)
  {
    width = 568.0;
    height = 568.0;
  }
  else if (((1 << a3) & 3) != 0)
  {
    width = CGSizeZero.width;
    height = CGSizeZero.height;
  }
  else
  {
    height = 1920.0;
    if (((1 << a3) & 0x14) != 0)
      width = 1920.0;
    else
      width = 3840.0;
    if (((1 << a3) & 0x14) == 0)
      height = 3840.0;
  }
  result.height = height;
  result.width = width;
  return result;
}

+ (int)maxPlayableVideoPixelsPerFrameForMediaCompatibilityConverterPreset:(int64_t)a3
{
  if ((unint64_t)(a3 - 2) > 4)
    return 0;
  else
    return dword_100EEE720[a3 - 2];
}

+ (int)maxPlayableAudioBitrateForMediaCompatibilityConverterPreset:(int64_t)a3
{
  if ((unint64_t)(a3 - 2) > 4)
    return 0;
  else
    return dword_100EEE734[a3 - 2];
}

- (BOOL)p_doesLoadedAssetHaveHEVCTracks
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  id v8;

  if (-[AVAsset statusOfValueForKey:error:](self->_asset, "statusOfValueForKey:error:", CFSTR("tracks"), 0) != (id)2)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101247DD0);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E11BB8();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101247DF0);
    v4 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLMovieCompatibilityChecker p_doesLoadedAssetHaveHEVCTracks]"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLMovieCompatibilityChecker.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v5, v6, 518, 0, "Asset tracks must be loaded");

  }
  *(_QWORD *)&v7 = objc_opt_class(self, v3).n128_u64[0];
  return objc_msgSend(v8, "assetContainsHEVCVideoTracks:", self->_asset, v7);
}

- (BOOL)p_doesLoadedAssetHaveProResTracks
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  id v8;

  if (-[AVAsset statusOfValueForKey:error:](self->_asset, "statusOfValueForKey:error:", CFSTR("tracks"), 0) != (id)2)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101247E10);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E11C38();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101247E30);
    v4 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLMovieCompatibilityChecker p_doesLoadedAssetHaveProResTracks]"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLMovieCompatibilityChecker.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v5, v6, 524, 0, "Asset tracks must be loaded");

  }
  *(_QWORD *)&v7 = objc_opt_class(self, v3).n128_u64[0];
  return objc_msgSend(v8, "assetContainsProResVideoTracks:", self->_asset, v7);
}

- (BOOL)p_isLoadedAssetPlayableOnSupportedDevices
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *i;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;
  int v21;
  int v22;
  int v23;
  int v24;
  float v25;
  uint64_t v27;
  CRLMovieCompatibilityChecker *v28;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];

  if (-[CRLMovieCompatibilityChecker p_assetHasSupportedFileTypeOnAllDevices](self, "p_assetHasSupportedFileTypeOnAllDevices"))
  {
    if (-[AVAsset statusOfValueForKey:error:](self->_asset, "statusOfValueForKey:error:", CFSTR("tracks"), 0) != (id)2)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101247E50);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E11CB8();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101247E70);
      v3 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v3);
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLMovieCompatibilityChecker p_isLoadedAssetPlayableOnSupportedDevices]"));
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLMovieCompatibilityChecker.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, v5, 540, 0, "Asset tracks must be loaded");

    }
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObjects:](NSSet, "setWithObjects:", AVMediaTypeAudio, AVMediaTypeClosedCaption, AVMediaTypeSubtitle, 0));
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v28 = self;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[AVAsset tracks](self->_asset, "tracks"));
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    if (v8)
    {
      v9 = v8;
      v27 = 0;
      v10 = 0;
      v11 = 0;
      v12 = *(_QWORD *)v31;
      v29 = v7;
      while (2)
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(_QWORD *)v31 != v12)
            objc_enumerationMutation(v7);
          v14 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)i);
          if (objc_msgSend(v14, "isEnabled"))
          {
            v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "mediaType"));
            if (objc_msgSend(v6, "containsObject:", v15))
            {
              v16 = v6;
              if (!objc_msgSend(v14, "isSelfContained")
                || (v17 = v10,
                    v18 = v11,
                    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "formatDescriptions")),
                    v20 = objc_msgSend(v19, "count"),
                    v19,
                    v11 = v18,
                    v10 = v17,
                    !v20))
              {

                v21 = 0;
                v23 = v27;
                v22 = HIDWORD(v27);
                v6 = v16;
                v7 = v29;
                goto LABEL_33;
              }
              if (objc_msgSend(v15, "isEqualToString:", AVMediaTypeVideo))
              {
                v10 = -[CRLMovieCompatibilityChecker p_isVideoTrackPlayableOnSupportedDevices:](v28, "p_isVideoTrackPlayableOnSupportedDevices:", v14) | v17;
                LODWORD(v27) = 1;
              }
              else if (objc_msgSend(v15, "isEqualToString:", AVMediaTypeAudio))
              {
                HIDWORD(v27) |= -[CRLMovieCompatibilityChecker p_isAudioTrackPlayableOnAllDevices:](v28, "p_isAudioTrackPlayableOnAllDevices:", v14);
                v11 = 1;
              }
              v6 = v16;
              v7 = v29;
            }

          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
        if (v9)
          continue;
        break;
      }
      v21 = 1;
      v23 = v27;
      v22 = HIDWORD(v27);
    }
    else
    {
      v23 = 0;
      LODWORD(v10) = 0;
      LODWORD(v11) = 0;
      v22 = 0;
      v21 = 1;
    }
LABEL_33:

    v24 = v21 & (v10 | v23 ^ 1) & (v22 | v11 ^ 1);
    if (v24 == 1 && (v22 & 1) != 0 && (v23 & 1) == 0 && v28->_customMaxAudioBitRate >= 1)
    {
      -[CRLMovieCompatibilityChecker p_estimatedAudioAssetDataRate](v28, "p_estimatedAudioAssetDataRate");
      LOBYTE(v24) = v25 <= (float)v28->_customMaxAudioBitRate;
    }

  }
  else
  {
    LOBYTE(v24) = 0;
  }
  return v24;
}

- (BOOL)p_assetHasSupportedFileTypeOnAllDevices
{
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned __int8 v12;
  unsigned __int8 v13;
  void *v14;
  void *v15;
  id v17;
  id v18[2];

  objc_opt_class(AVURLAsset, a2);
  v4 = sub_100221D0C(v3, self->_asset);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = v5;
  if (v5)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "URL"));
    if (objc_msgSend(v7, "isFileURL")
      && (v18[0] = 0,
          objc_msgSend(v7, "getResourceValue:forKey:error:", v18, NSURLTypeIdentifierKey, 0)))
    {
      v17 = v18[0];
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(UTTypeAppleProtectedMPEG4Audio, "identifier"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(UTTypeMP3, "identifier"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(UTTypeMPEG, "identifier"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObjects:](NSSet, "setWithObjects:", AVFileTypeQuickTimeMovie, AVFileTypeMPEG4, AVFileTypeAppleM4V, AVFileTypeAppleM4A, CFSTR("public.3gpp"), CFSTR("public.3gpp2"), CFSTR("com.apple.itunes.audible"), v8, AVFileTypeAIFF, AVFileTypeAIFC, AVFileTypeCoreAudioFormat, AVFileTypeWAVE, CFSTR("public.au-audio"), v9, AVFileTypeAMR, v10,
                        CFSTR("public.mpeg-2-video"),
                        CFSTR("public.mp2"),
                        CFSTR("public.mpeg-2-transport-stream"),
                        CFSTR("public.avi"),
                        0));

      v12 = objc_msgSend(v11, "containsObject:", v17);
      if ((v12 & 1) != 0)
      {
        v13 = 1;
      }
      else
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "pathExtension"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObjects:](NSSet, "setWithObjects:", CFSTR("mqv"), CFSTR("m4r"), CFSTR("m1a"), CFSTR("m2a"), CFSTR("mpa"), CFSTR("aac"), CFSTR("adts"), CFSTR("mod"), CFSTR("vob"), CFSTR("m2ts"), CFSTR("m2t"), CFSTR("mts"), 0));
        v13 = objc_msgSend(v15, "containsObject:", v14);

      }
    }
    else
    {
      v13 = 0;
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

+ (id)p_defaultPlayableVideoCodecTypes
{
  return &off_1012CB740;
}

+ (id)p_defaultPlayableAudioCodecTypes
{
  return &off_1012CB758;
}

- (BOOL)p_isVideoTrackPlayableOnSupportedDevices:(id)a3
{
  id v4;
  uint64_t v5;
  double v6;
  id v7;
  float v8;
  uint64_t v9;
  double v10;
  id v11;
  void *v12;
  int32_t width;
  int height;
  BOOL v15;
  int customMaxPlayableVideoPixelsPerFrame;
  id v17;
  id v18;
  uint64_t v19;
  void *i;
  const opaqueCMFormatDescription *v21;
  uint64_t MediaSubType;
  void *v23;
  unsigned int v24;
  CMVideoDimensions Dimensions;
  BOOL v26;
  int v27;
  BOOL v28;
  char v29;
  id v31;
  id obj;
  int32_t v33;
  NSSet *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];

  v4 = a3;
  *(_QWORD *)&v6 = objc_opt_class(self, v5).n128_u64[0];
  if (objc_msgSend(v7, "p_doesTrack:matchCodecTypes:", v4, &off_1012CB770, v6)
    && (objc_msgSend(v4, "nominalFrameRate"), v8 <= 30.0))
  {
    v29 = 1;
  }
  else
  {
    if (-[NSSet count](self->_customPlayableVideoCodecTypes, "count"))
    {
      v34 = self->_customPlayableVideoCodecTypes;
    }
    else
    {
      *(_QWORD *)&v10 = objc_opt_class(self, v9).n128_u64[0];
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "p_defaultPlayableVideoCodecTypes", v10));
      v34 = (NSSet *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v12));

    }
    width = 1920;
    if (self->_customMaxPlayableVideoDimensions.width < 1)
    {
      v33 = 1920;
    }
    else
    {
      height = self->_customMaxPlayableVideoDimensions.height;
      v15 = height <= 0;
      if (height <= 0)
        height = 1920;
      v33 = height;
      if (v15)
        width = 1920;
      else
        width = self->_customMaxPlayableVideoDimensions.width;
    }
    if (self->_customMaxPlayableVideoPixelsPerFrame <= 0)
      customMaxPlayableVideoPixelsPerFrame = 2073600;
    else
      customMaxPlayableVideoPixelsPerFrame = self->_customMaxPlayableVideoPixelsPerFrame;
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "formatDescriptions"));
    v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v42;
      v31 = v4;
      while (2)
      {
        for (i = 0; i != v18; i = (char *)i + 1)
        {
          if (*(_QWORD *)v42 != v19)
            objc_enumerationMutation(obj);
          v21 = *(const opaqueCMFormatDescription **)(*((_QWORD *)&v41 + 1) + 8 * (_QWORD)i);
          MediaSubType = CMFormatDescriptionGetMediaSubType(v21);
          v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", MediaSubType));
          v24 = -[NSSet containsObject:](v34, "containsObject:", v23);

          if (!v24
            || ((Dimensions = CMVideoFormatDescriptionGetDimensions(v21), v33 >= Dimensions.height)
              ? (v26 = width < Dimensions.width)
              : (v26 = 1),
                !v26 ? (v27 = 0) : (v27 = 1),
                (v27 & 1) != 0
             || ((Dimensions.height * Dimensions.width > customMaxPlayableVideoPixelsPerFrame) & ~v27) != 0))
          {
LABEL_48:

            v28 = 1;
            v4 = v31;
            goto LABEL_51;
          }
          if ((int)MediaSubType > 1748121138)
          {
            if ((_DWORD)MediaSubType == 1748121139)
            {
              if (!-[CRLMovieCompatibilityChecker p_isH263VideoFormatPlayableOnAllDevices:](self, "p_isH263VideoFormatPlayableOnAllDevices:", v21))goto LABEL_48;
            }
            else if ((_DWORD)MediaSubType == 1836070006
                   && !-[CRLMovieCompatibilityChecker p_isMPEG4VideoFormatPlayableOnAllDevices:](self, "p_isMPEG4VideoFormatPlayableOnAllDevices:", v21))
            {
              goto LABEL_48;
            }
          }
          else if ((_DWORD)MediaSubType == 1398165811)
          {
            if (!-[CRLMovieCompatibilityChecker p_isSorenson3VideoFormatPlayableOnAllDevices:](self, "p_isSorenson3VideoFormatPlayableOnAllDevices:", v21))goto LABEL_48;
          }
          else if ((_DWORD)MediaSubType == 1635148593
                 && !-[CRLMovieCompatibilityChecker p_isH264VideoFormatPlayableOnAllDevices:](self, "p_isH264VideoFormatPlayableOnAllDevices:", v21))
          {
            goto LABEL_48;
          }
        }
        v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
        v4 = v31;
        if (v18)
          continue;
        break;
      }
    }

    v39 = 0u;
    v40 = 0u;
    v38 = 0u;
    if (v4)
      objc_msgSend(v4, "preferredTransform");
    v35 = v38;
    v36 = v39;
    v37 = v40;
    if (sub_100079384((double *)&v35))
    {
      v35 = v38;
      v36 = v39;
      v37 = v40;
      v28 = sub_100079210((double *)&v35);
    }
    else
    {
      v28 = 1;
    }
LABEL_51:
    v29 = !v28;

  }
  return v29;
}

- (BOOL)p_isSorenson3VideoFormatPlayableOnAllDevices:(opaqueCMFormatDescription *)a3
{
  CMVideoDimensions Dimensions;

  Dimensions = CMVideoFormatDescriptionGetDimensions(a3);
  return Dimensions.height * Dimensions.width < 76801;
}

- (BOOL)p_isH264VideoFormatPlayableOnAllDevices:(opaqueCMFormatDescription *)a3
{
  void *v4;
  id v5;
  unsigned __int8 *v6;
  unsigned int v7;
  BOOL v8;
  uint64_t v9;
  BOOL v10;
  CFPropertyListRef Extension;
  void *v12;
  BOOL v13;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLMovieCompatibilityChecker p_sampleDescriptionExtensionAto_dataFromVideoFormatDescription:forAtomType:](self, "p_sampleDescriptionExtensionAto_dataFromVideoFormatDescription:forAtomType:", a3, CFSTR("avcC")));
  v5 = v4;
  if (!v4)
    goto LABEL_10;
  if ((unint64_t)objc_msgSend(v4, "length") < 4)
    goto LABEL_10;
  v5 = objc_retainAutorelease(v5);
  v6 = (unsigned __int8 *)objc_msgSend(v5, "bytes");
  if (v6[3] > 0x29u)
    goto LABEL_10;
  v7 = v6[1] - 66;
  v8 = v7 > 0x22;
  v9 = (1 << v7) & 0x400000801;
  v10 = v8 || v9 == 0;
  if (!v10
    && (v5,
        Extension = CMFormatDescriptionGetExtension(a3, kCVImageBufferFieldCountKey),
        v12 = (void *)objc_claimAutoreleasedReturnValue(Extension),
        (v5 = v12) != 0))
  {
    v13 = objc_msgSend(v12, "integerValue") != (id)1;
  }
  else
  {
LABEL_10:
    v13 = 1;
  }

  return !v13;
}

- (BOOL)p_isMPEG4VideoFormatPlayableOnAllDevices:(opaqueCMFormatDescription *)a3
{
  void *v3;
  void *v4;
  id v5;
  _BYTE *v6;
  id v7;
  uint64_t v8;
  BOOL v9;
  unint64_t v11;
  int v12;
  char *v13;
  int v14;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLMovieCompatibilityChecker p_sampleDescriptionExtensionAto_dataFromVideoFormatDescription:forAtomType:](self, "p_sampleDescriptionExtensionAto_dataFromVideoFormatDescription:forAtomType:", a3, CFSTR("esds")));
  v4 = v3;
  if (!v3)
    goto LABEL_9;
  v5 = objc_retainAutorelease(v3);
  v6 = objc_msgSend(v5, "bytes");
  v7 = objc_msgSend(v5, "length");
  if ((unint64_t)v7 < 5)
    goto LABEL_9;
  v8 = 0;
  while (v6[v8] || v6[v8 + 1] || v6[v8 + 2] != 1 || v6[v8 + 3] != 176)
  {
    if (++v8 + 4 >= (unint64_t)v7)
      goto LABEL_9;
  }
  if (v8 + 4 < (unint64_t)v7)
  {
    v11 = 0;
    v12 = v6[v8 + 4];
    v13 = &byte_100EEE6F0;
    while (1)
    {
      v14 = *v13;
      v13 += 3;
      if (v14 == v12)
        break;
      v9 = 0;
      if (++v11 == 15)
        goto LABEL_10;
    }
    v9 = v11 < 0xB;
  }
  else
  {
LABEL_9:
    v9 = 0;
  }
LABEL_10:

  return v9;
}

- (BOOL)p_isH263VideoFormatPlayableOnAllDevices:(opaqueCMFormatDescription *)a3
{
  void *v3;
  void *v4;
  _BYTE *v5;
  BOOL v6;
  BOOL v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLMovieCompatibilityChecker p_sampleDescriptionExtensionAto_dataFromVideoFormatDescription:forAtomType:](self, "p_sampleDescriptionExtensionAto_dataFromVideoFormatDescription:forAtomType:", a3, CFSTR("d263")));
  v4 = v3;
  if (v3 && (unint64_t)objc_msgSend(v3, "length") >= 7)
  {
    v5 = objc_msgSend(objc_retainAutorelease(v4), "bytes");
    if (v5[6])
      v6 = 1;
    else
      v6 = v5[5] >= 0x2Eu;
    v7 = !v6;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)p_sampleDescriptionExtensionAto_dataFromVideoFormatDescription:(opaqueCMFormatDescription *)a3 forAtomType:(id)a4
{
  id v5;
  CFPropertyListRef Extension;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  id v14;
  uint64_t v15;

  v5 = a4;
  Extension = CMFormatDescriptionGetExtension(a3, kCMFormatDescriptionExtension_SampleDescriptionExtensionAtoms);
  v7 = (void *)objc_claimAutoreleasedReturnValue(Extension);
  v8 = v7;
  if (v7)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", v5));
    objc_opt_class(NSArray, v10);
    if ((objc_opt_isKindOfClass(v9, v11) & 1) != 0)
    {
      v13 = v9;
      if (objc_msgSend(v13, "count"))
        v14 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectAtIndexedSubscript:", 0));
      else
        v14 = 0;

    }
    else
    {
      objc_opt_class(NSData, v12);
      if ((objc_opt_isKindOfClass(v9, v15) & 1) != 0)
        v14 = v9;
      else
        v14 = 0;
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (BOOL)p_isAudioTrackPlayableOnAllDevices:(id)a3
{
  id v4;
  uint64_t v5;
  double v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  unsigned __int8 v13;
  uint64_t v14;
  void *v15;
  const opaqueCMFormatDescription *v16;
  uint64_t MediaSubType;
  int v18;
  void *v19;
  unsigned int v20;
  const AudioStreamBasicDescription *StreamBasicDescription;
  id v22;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];

  v4 = a3;
  *(_QWORD *)&v6 = objc_opt_class(self, v5).n128_u64[0];
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "p_defaultPlayableAudioCodecTypes", v6));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v8));

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v24 = v4;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "formatDescriptions"));
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v11)
  {
    v12 = v11;
    v13 = 0;
    v14 = *(_QWORD *)v26;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v26 != v14)
          objc_enumerationMutation(v10);
        v16 = *(const opaqueCMFormatDescription **)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)v15);
        MediaSubType = CMFormatDescriptionGetMediaSubType(v16);
        if ((v13 & 1) == 0
          && (v18 = MediaSubType,
              v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", MediaSubType)), v20 = objc_msgSend(v9, "containsObject:", v19), v19, v20)&& (StreamBasicDescription = CMAudioFormatDescriptionGetStreamBasicDescription(v16)) != 0&& StreamBasicDescription->mChannelsPerFrame <= 6&& StreamBasicDescription->mSampleRate <= 48000.0)
        {
          if (v18 == 1885430579 || v18 == 1633889587)
            v13 = objc_msgSend(v24, "isEnabled", StreamBasicDescription->mSampleRate);
          else
            v13 = 0;
        }
        else
        {
          v13 = 1;
        }
        v15 = (char *)v15 + 1;
      }
      while (v12 != v15);
      v22 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      v12 = v22;
    }
    while (v22);
  }
  else
  {
    v13 = 0;
  }

  return v13 ^ 1;
}

- (float)p_estimatedAudioAssetDataRate
{
  void *v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  float v8;
  void *i;
  float v10;
  float v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *j;
  float v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AVAsset tracksWithMediaType:](self->_asset, "tracksWithMediaType:", AVMediaTypeAudio));
  if (!objc_msgSend(v3, "count"))
  {
    v8 = 0.0;
    goto LABEL_27;
  }
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v24;
    v8 = 0.0;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v24 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)i), "estimatedDataRate");
        if (v8 < v10)
          v8 = v10;
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v6);

    if (v8 != 0.0)
      goto LABEL_16;
  }
  else
  {

  }
  -[CRLMovieCompatibilityChecker p_estimatedAudioAssetDataRateUsingFileSize](self, "p_estimatedAudioAssetDataRateUsingFileSize");
  v8 = v11;
LABEL_16:
  if (v8 == 0.0)
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v12 = v4;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v20;
      do
      {
        for (j = 0; j != v14; j = (char *)j + 1)
        {
          if (*(_QWORD *)v20 != v15)
            objc_enumerationMutation(v12);
          -[CRLMovieCompatibilityChecker p_estimatedDataRateForAudioTrack:](self, "p_estimatedDataRateForAudioTrack:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)j), (_QWORD)v19);
          if (v8 < v17)
            v8 = v17;
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
      }
      while (v14);
    }

  }
LABEL_27:

  return v8;
}

- (float)p_estimatedAudioAssetDataRateUsingFileSize
{
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  float v8;
  AVAsset *asset;
  uint64_t v10;
  double Seconds;
  CMTime v13[2];

  objc_opt_class(AVURLAsset, a2);
  v4 = sub_100221D0C(v3, self->_asset);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "URL"));

  v7 = objc_msgSend(v6, "crl_fileSize");
  memset(&v13[1], 0, sizeof(CMTime));
  v8 = 0.0;
  asset = self->_asset;
  if (asset)
  {
    -[AVAsset duration](asset, "duration");
    if ((v13[1].flags & 0x1D) == 1)
    {
      v10 = 8 * (_QWORD)v7;
      v13[0] = v13[1];
      Seconds = CMTimeGetSeconds(v13);
      if (v10)
      {
        if (Seconds > 0.0)
          v8 = (double)(unint64_t)v10 / Seconds;
      }
    }
  }

  return v8;
}

- (float)p_estimatedDataRateForAudioTrack:(id)a3
{
  id v4;
  float v5;
  float v6;
  float v7;

  v4 = a3;
  objc_msgSend(v4, "estimatedDataRate");
  if (v5 == 0.0)
    -[CRLMovieCompatibilityChecker p_estimatedDataRateUsingTrackPropertiesForAudioTrack:](self, "p_estimatedDataRateUsingTrackPropertiesForAudioTrack:", v4);
  v6 = v5;
  if (v5 == 0.0)
  {
    -[CRLMovieCompatibilityChecker p_estimatedDataRateUsingFormatDescriptionForAudioTrack:](self, "p_estimatedDataRateUsingFormatDescriptionForAudioTrack:", v4);
    v6 = v7;
  }

  return v6;
}

- (float)p_estimatedDataRateUsingTrackPropertiesForAudioTrack:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  float v6;
  double Seconds;
  CMTime v9;
  CMTime v10;

  v3 = a3;
  v4 = (uint64_t)objc_msgSend(v3, "totalSampleDataLength");
  memset(&v10, 0, sizeof(v10));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "asset"));

  if (v5)
    objc_msgSend(v5, "duration");
  else
    memset(&v10, 0, sizeof(v10));

  v6 = 0.0;
  if (v4 >= 1 && (v10.flags & 0x1D) == 1)
  {
    v9 = v10;
    Seconds = CMTimeGetSeconds(&v9);
    if (Seconds > 0.0)
      return (double)v4 * 8.0 / Seconds;
  }
  return v6;
}

- (float)p_estimatedDataRateUsingFormatDescriptionForAudioTrack:(id)a3
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  float v7;
  void *i;
  const AudioStreamBasicDescription *StreamBasicDescription;
  unint64_t v10;
  double v11;
  float v12;
  float v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "formatDescriptions", 0));
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v16;
    v7 = 0.0;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v6)
          objc_enumerationMutation(v3);
        StreamBasicDescription = CMAudioFormatDescriptionGetStreamBasicDescription(*(CMAudioFormatDescriptionRef *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i));
        if (StreamBasicDescription)
        {
          v11 = 1.0;
          if ((StreamBasicDescription->mFormatFlags & 0x20) == 0)
          {
            LODWORD(v11) = StreamBasicDescription->mChannelsPerFrame;
            v11 = (double)*(unint64_t *)&v11;
          }
          v12 = v11;
          LODWORD(v10) = StreamBasicDescription->mBytesPerFrame;
          v13 = StreamBasicDescription->mSampleRate * 8.0 * (double)v10 * v12;
          if (v7 < v13)
            v7 = v13;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v5);
  }
  else
  {
    v7 = 0.0;
  }

  return v7;
}

- (int64_t)compatibilityLevel
{
  return self->_compatibilityLevel;
}

- (NSError)error
{
  return self->_error;
}

- (BOOL)wasAssetHEVC
{
  return self->_wasAssetHEVC;
}

- (BOOL)wasAssetProRes
{
  return self->_wasAssetProRes;
}

- (BOOL)wasConverterPresetMoreCompatibleThanAsset
{
  return self->_wasConverterPresetMoreCompatibleThanAsset;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customPlayableVideoCodecTypes, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

@end
