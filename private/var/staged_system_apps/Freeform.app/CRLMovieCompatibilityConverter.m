@implementation CRLMovieCompatibilityConverter

+ (void)initialize
{
  dispatch_queue_t v2;
  void *v3;

  if ((id)objc_opt_class(CRLMovieCompatibilityConverter, a2) == a1)
  {
    v2 = dispatch_queue_create("com.apple.freeform.CRLMovieCompatibilityConverter", 0);
    v3 = (void *)qword_101415530;
    qword_101415530 = (uint64_t)v2;

  }
}

- (CRLMovieCompatibilityConverter)initWithMovieData:(id)a3 auxiliaryMovieData:(id)a4 auxiliaryMovieDataFilename:(id)a5 desiredCompatibilityLevel:(int64_t)a6 initialCompatibilityLevel:(int64_t)a7 assetOwner:(id)a8
{
  id v14;
  id v15;
  CRLMovieCompatibilityConverter *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  NSString *v27;
  NSString *mAuxiliaryMovieDataFilename;
  id v29;
  CRLBasicProgress *v30;
  CRLBasicProgress *mMakePlayableProgress;
  CRLBasicProgress *v32;
  CRLBasicProgress *mAllDevicesProgress;
  CRLProgressGroup *v34;
  CRLProgressGroup *mProgress;
  Class v37;
  NSString *v38;
  void *v39;
  void *v40;
  id v42;
  void *v43;
  id v44;
  __CFString *v45;
  id v46;
  id v47;
  int64_t v48;
  objc_super v49;
  uint8_t buf[4];
  CRLMovieCompatibilityConverter *v51;
  __int16 v52;
  __CFString *v53;
  __int16 v54;
  void *v55;
  __int16 v56;
  void *v57;
  __int16 v58;
  int64_t v59;
  __int16 v60;
  int64_t v61;

  v14 = a3;
  v42 = a4;
  v47 = a4;
  v15 = a5;
  v44 = a8;
  v46 = a8;
  v49.receiver = self;
  v49.super_class = (Class)CRLMovieCompatibilityConverter;
  v16 = -[CRLMovieCompatibilityConverter init](&v49, "init");
  v48 = a7;
  if (a6 <= 2)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101252AA8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E22030();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101252AC8);
    v17 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLMovieCompatibilityConverter initWithMovieData:auxiliaryMovieData:auxiliaryMovieDataFilename:desiredCompatibilityLevel:initialCompatibilityLevel:assetOwner:]"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLMovieCompatibilityConverter.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v18, v19, 68, 0, "Invalid parameter not satisfying: %{public}s", "desiredCompatibilityLevel >= CRLMediaCompatibilityLevelPlayableOnThisDevice");

    a7 = v48;
  }
  if (a7 >= a6)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101252AE8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E21FA4();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101252B08);
    v20 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLMovieCompatibilityConverter initWithMovieData:auxiliaryMovieData:auxiliaryMovieDataFilename:desiredCompatibilityLevel:initialCompatibilityLevel:assetOwner:]"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLMovieCompatibilityConverter.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v21, v22, 69, 0, "Invalid parameter not satisfying: %{public}s", "initialCompatibilityLevel < desiredCompatibilityLevel");

    a7 = v48;
  }
  if (v16)
  {
    if (qword_10147E5F0 != -1)
      dispatch_once(&qword_10147E5F0, &stru_101252B28);
    v24 = v42;
    v23 = v44;
    v25 = off_1013DB978;
    if (os_log_type_enabled((os_log_t)v25, OS_LOG_TYPE_DEBUG))
    {
      if (v14)
      {
        objc_opt_class(v14, v26);
        v38 = NSStringFromClass(v37);
        v45 = (__CFString *)objc_claimAutoreleasedReturnValue(v38);
      }
      else
      {
        v45 = CFSTR("Nil");
      }
      v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "filename"));
      v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "assetUUID"));
      v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "UUIDString"));
      *(_DWORD *)buf = 134219266;
      v51 = v16;
      v52 = 2114;
      v53 = v45;
      v54 = 2112;
      v55 = v39;
      v56 = 2114;
      v57 = v40;
      v58 = 2048;
      v59 = v48;
      v60 = 2048;
      v61 = a6;
      _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)v25, OS_LOG_TYPE_DEBUG, "creating converter %p for data <%{public}@: filename=%@, assetUUID=%{public}@>  initialCompatLevel %li desiredCompatLevel %li", buf, 0x3Eu);

      if (v14)
      a7 = v48;
    }

    objc_storeStrong((id *)&v16->mMovieData, a3);
    objc_storeStrong((id *)&v16->mAuxiliaryMovieData, v24);
    v27 = (NSString *)objc_msgSend(v15, "copy");
    mAuxiliaryMovieDataFilename = v16->mAuxiliaryMovieDataFilename;
    v16->mAuxiliaryMovieDataFilename = v27;

    v16->mInitialCompatibilityLevel = a7;
    v16->mDesiredCompatibilityLevel = a6;
    objc_storeStrong((id *)&v16->mAssetOwner, v23);
    v29 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 4);
    if (v16->mInitialCompatibilityLevel <= 2)
    {
      v30 = -[CRLBasicProgress initWithMaxValue:]([CRLBasicProgress alloc], "initWithMaxValue:", 3.0);
      mMakePlayableProgress = v16->mMakePlayableProgress;
      v16->mMakePlayableProgress = v30;

      objc_msgSend(v29, "addObject:", v16->mMakePlayableProgress);
    }
    if (v16->mDesiredCompatibilityLevel >= 3)
    {
      v32 = -[CRLBasicProgress initWithMaxValue:]([CRLBasicProgress alloc], "initWithMaxValue:", 3.0);
      mAllDevicesProgress = v16->mAllDevicesProgress;
      v16->mAllDevicesProgress = v32;

      objc_msgSend(v29, "addObject:", v16->mAllDevicesProgress);
    }
    v34 = -[CRLProgressGroup initWithChildren:]([CRLProgressGroup alloc], "initWithChildren:", v29);
    mProgress = v16->mProgress;
    v16->mProgress = v34;

  }
  return v16;
}

- (CRLMovieCompatibilityConverter)initWithMovieData:(id)a3 desiredCompatibilityLevel:(int64_t)a4 initialCompatibilityLevel:(int64_t)a5 assetOwner:(id)a6
{
  return -[CRLMovieCompatibilityConverter initWithMovieData:auxiliaryMovieData:auxiliaryMovieDataFilename:desiredCompatibilityLevel:initialCompatibilityLevel:assetOwner:](self, "initWithMovieData:auxiliaryMovieData:auxiliaryMovieDataFilename:desiredCompatibilityLevel:initialCompatibilityLevel:assetOwner:", a3, 0, 0, a4, a5, a6);
}

- (CRLMovieCompatibilityConverter)init
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
    dispatch_once(&qword_10147E370, &stru_101252B48);
  v3 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109890;
    v12 = v2;
    v13 = 2082;
    v14 = "-[CRLMovieCompatibilityConverter init]";
    v15 = 2082;
    v16 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLMovieCompatibilityConverter.m";
    v17 = 1024;
    v18 = 109;
    _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Do not call method", buf, 0x22u);
  }
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_101252B68);
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
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLMovieCompatibilityConverter init]"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLMovieCompatibilityConverter.m"));
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 109, 0, "Do not call method");

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s: %s"), "Do not call method", "-[CRLMovieCompatibilityConverter init]"));
  v10 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v9, 0));

  objc_exception_throw(v10);
}

- (int64_t)mediaType
{
  return 1;
}

- (int64_t)playableOnAllDevicesPreset
{
  if (self->mPlayableOnAllDevicesPreset)
    return self->mPlayableOnAllDevicesPreset;
  else
    return 4;
}

+ (id)progressStringForUpgradingMoviesWithPreset:(int64_t)a3 dataCount:(unint64_t)a4 filename:(id)a5
{
  id v7;
  void *v8;
  const __CFString *v9;
  NSObject *v10;
  __CFString *v11;
  void *v12;
  NSString *v13;
  const __CFString *v14;

  v7 = a5;
  switch(a3)
  {
    case 0:
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      if (a4 == 1)
      {
        v9 = CFSTR("Converting “%@”…");
        goto LABEL_19;
      }
      v14 = CFSTR("Converting %u movies");
      goto LABEL_26;
    case 1:
      if (qword_10147E368 != -1)
        dispatch_once(&qword_10147E368, &stru_101252B88);
      v10 = off_1013D9068;
      if (os_log_type_enabled((os_log_t)off_1013D9068, OS_LOG_TYPE_ERROR))
        sub_100E220BC(v10);
      goto LABEL_8;
    case 2:
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      if (a4 == 1)
      {
        v9 = CFSTR("Converting “%@” to H.264 (1080p)…");
        goto LABEL_19;
      }
      v14 = CFSTR("Converting %u movies to H.264 (1080p)");
      goto LABEL_26;
    case 3:
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      if (a4 == 1)
      {
        v9 = CFSTR("Converting “%@” to H.264 (4K)…");
        goto LABEL_19;
      }
      v14 = CFSTR("Converting %u movies to H.264 (4K)");
      goto LABEL_26;
    case 4:
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      if (a4 == 1)
      {
        v9 = CFSTR("Converting “%@” to HEVC (1080p)…");
        goto LABEL_19;
      }
      v14 = CFSTR("Converting %u movies to HEVC (1080p)");
      goto LABEL_26;
    case 5:
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      if (a4 == 1)
      {
        v9 = CFSTR("Converting “%@” to HEVC (4K)…");
        goto LABEL_19;
      }
      v14 = CFSTR("Converting %u movies to HEVC (4K)");
      goto LABEL_26;
    case 6:
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      if (a4 == 1)
      {
        v9 = CFSTR("Converting “%@” to H.264 (Draft Quality / Smaller File)…");
LABEL_19:
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", v9, 0, 0));
        v13 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v12, v7);
      }
      else
      {
        v14 = CFSTR("Converting %u movies to H.264 (Draft Quality / Smaller File)");
LABEL_26:
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", v14, 0, 0));
        v13 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v12, a4);
      }
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue(v13);

LABEL_28:
      return v11;
    default:
LABEL_8:
      v11 = &stru_1012A72B0;
      goto LABEL_28;
  }
}

- (void)convertMediaWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = qword_101415530;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100339188;
  v7[3] = &unk_101231F00;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

+ (id)p_uniquePathForConvertingData:(id)a3 toType:(id)a4
{
  id v5;
  id v6;
  CRLTemporaryDirectory *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  NSString *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v26;
  char __dst[1023];
  char v28;

  v5 = a4;
  v6 = a3;
  v26 = 0;
  v7 = -[CRLTemporaryDirectory initWithError:]([CRLTemporaryDirectory alloc], "initWithError:", &v26);
  v8 = v26;
  if (!v7)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101252BE8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E221D0();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101252C08);
    v9 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLMovieCompatibilityConverter p_uniquePathForConvertingData:toType:]"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLMovieCompatibilityConverter.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v10, v11, 210, 0, "invalid nil value for '%{public}s'", "temporaryDirectory");

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLTemporaryDirectory path](v7, "path"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL crl_fileURLWithPath:](NSURL, "crl_fileURLWithPath:", v12));

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "URLByAppendingPathComponent:", CFSTR("MovieCompatibilityConverter.XXXXXX")));
  v28 = 0;
  v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "path")));
  strncpy(__dst, (const char *)objc_msgSend(v15, "fileSystemRepresentation"), 0x3FFuLL);

  v28 = 0;
  v16 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", mkdtemp(__dst));
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:](NSURL, "fileURLWithPath:isDirectory:", v17, 1));

  v19 = (void *)objc_claimAutoreleasedReturnValue(+[UTType typeWithMIMEType:](UTType, "typeWithMIMEType:", v5));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "preferredFilenameExtension"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "filename"));

  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "stringByDeletingPathExtension"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "stringByAppendingPathExtension:", v20));

  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "URLByAppendingPathComponent:", v23));
  return v24;
}

- (void)p_convertMovieData:(id)a3 fromPlayableByAVFoundationToAllDevicesWithCompletionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;

  v6 = a4;
  v7 = a3;
  v8 = sub_100243E6C((id)-[CRLMovieCompatibilityConverter playableOnAllDevicesPreset](self, "playableOnAllDevicesPreset"), 0);
  v9 = (id)objc_claimAutoreleasedReturnValue(v8);
  -[CRLMovieCompatibilityConverter p_convertMovieData:withPresetName:completionHandler:](self, "p_convertMovieData:withPresetName:completionHandler:", v7, v9, v6);

}

- (void)p_convertMovieData:(id)a3 withPresetName:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void (**v11)(_QWORD, _QWORD, _QWORD);
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  AVAssetExportSession *v23;
  AVAssetExportSession *mExportSession;
  OS_dispatch_source *v25;
  OS_dispatch_source *mAllDevicesProgressTimer;
  NSObject *v27;
  dispatch_time_t v28;
  NSObject *v29;
  AVAssetExportSession *v30;
  _QWORD v31[6];
  id v32;
  id v33;
  id v34;
  void (**v35)(_QWORD, _QWORD, _QWORD);
  _QWORD handler[5];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void (**)(_QWORD, _QWORD, _QWORD))v10;
  if (atomic_load((unsigned int *)&self->mIsCancelled))
  {
    (*((void (**)(id, _QWORD, _QWORD))v10 + 2))(v10, 0, 0);
  }
  else
  {
    if (qword_10147E5F0 != -1)
      dispatch_once(&qword_10147E5F0, &stru_101252C28);
    if (os_log_type_enabled((os_log_t)off_1013DB978, OS_LOG_TYPE_DEBUG))
      sub_100E222E8();
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "AVAssetAndReturnError:", 0));
    if (self->mExportSession)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101252C48);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E2225C();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101252C68);
      v15 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLMovieCompatibilityConverter p_convertMovieData:withPresetName:completionHandler:]"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLMovieCompatibilityConverter.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v16, v17, 265, 0, "expected nil value for '%{public}s'", "mExportSession");

    }
    *(_QWORD *)&v18 = objc_opt_class(self, v13).n128_u64[0];
    v20 = v19;
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(UTTypeQuickTimeMovie, "identifier", v18));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "p_uniquePathForConvertingData:toType:", v8, v21));

    v23 = (AVAssetExportSession *)objc_claimAutoreleasedReturnValue(-[CRLMovieCompatibilityConverter p_exportSessionForAsset:presetName:data:outputURL:preserveFrameDuration:](self, "p_exportSessionForAsset:presetName:data:outputURL:preserveFrameDuration:", v14, v9, v8, v22, self->mDesiredCompatibilityLevel < 4));
    mExportSession = self->mExportSession;
    self->mExportSession = v23;

    if (self->mExportSession)
    {
      -[CRLBasicProgress setValue:](self->mAllDevicesProgress, "setValue:", 0.0);
      v25 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)qword_101415530);
      mAllDevicesProgressTimer = self->mAllDevicesProgressTimer;
      self->mAllDevicesProgressTimer = v25;

      v27 = self->mAllDevicesProgressTimer;
      v28 = dispatch_time(0, 1000000000);
      dispatch_source_set_timer(v27, v28, 0x3B9ACA00uLL, 0x64uLL);
      v29 = self->mAllDevicesProgressTimer;
      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472;
      handler[2] = sub_100339DBC;
      handler[3] = &unk_10122D110;
      handler[4] = self;
      dispatch_source_set_event_handler(v29, handler);
      dispatch_resume((dispatch_object_t)self->mAllDevicesProgressTimer);
      v30 = self->mExportSession;
      v31[0] = _NSConcreteStackBlock;
      v31[1] = 3221225472;
      v31[2] = sub_100339E08;
      v31[3] = &unk_101252DE8;
      v31[4] = self;
      v31[5] = v22;
      v32 = v8;
      v33 = v9;
      v34 = v14;
      v35 = v11;
      -[AVAssetExportSession exportAsynchronouslyWithCompletionHandler:](v30, "exportAsynchronouslyWithCompletionHandler:", v31);

    }
    else
    {
      ((void (**)(_QWORD, id, _QWORD))v11)[2](v11, v8, 0);
    }

  }
}

- (id)p_exportSessionForAsset:(id)a3 presetName:(id)a4 data:(id)a5 outputURL:(id)a6 preserveFrameDuration:(BOOL)a7
{
  _BOOL8 v7;
  id v10;
  void *v11;
  void *v12;

  v7 = a7;
  v10 = a6;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[AVAssetExportSession crl_exportSessionWithAsset:presetName:preserveFrameDuration:](AVAssetExportSession, "crl_exportSessionWithAsset:presetName:preserveFrameDuration:", a3, a4, v7));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(UTTypeQuickTimeMovie, "identifier"));
  objc_msgSend(v11, "setOutputFileType:", v12);

  objc_msgSend(v11, "setOutputURL:", v10);
  return v11;
}

- (void)p_finishConvertingWithConvertedMovieData:(id)a3 error:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(_QWORD);
  _TtC8Freeform8CRLAsset *v12;
  void *mConvertedMovieData;
  NSError *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSError *v19;
  NSError *mError;
  id v21;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(_QWORD))a5;
  if (!atomic_load((unsigned int *)&self->mIsCancelled))
  {
    if (v8)
    {
      if (qword_10147E5F0 != -1)
        dispatch_once(&qword_10147E5F0, &stru_101252E08);
      if (os_log_type_enabled((os_log_t)off_1013DB978, OS_LOG_TYPE_DEBUG))
        sub_100E22670();
      v12 = (_TtC8Freeform8CRLAsset *)v8;
      mConvertedMovieData = self->mConvertedMovieData;
      self->mConvertedMovieData = v12;
LABEL_8:

      goto LABEL_10;
    }
    if (!self->mError)
    {
      if (v9)
      {
        if (qword_10147E5F0 != -1)
          dispatch_once(&qword_10147E5F0, &stru_101252E28);
        if (os_log_type_enabled((os_log_t)off_1013DB978, OS_LOG_TYPE_DEBUG))
          sub_100E22610();
        v14 = (NSError *)objc_msgSend(v9, "copy");
        mConvertedMovieData = self->mError;
        self->mError = v14;
      }
      else
      {
        if (qword_10147E5F0 != -1)
          dispatch_once(&qword_10147E5F0, &stru_101252E48);
        if (os_log_type_enabled((os_log_t)off_1013DB978, OS_LOG_TYPE_DEBUG))
          sub_100E225B0();
        v21 = objc_alloc((Class)NSError);
        mConvertedMovieData = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(mConvertedMovieData, "localizedStringForKey:value:table:", CFSTR("This movie can’t be added."), 0, 0));
        v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("The file couldn’t be converted into a compatible format."), 0, 0));
        v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", v15, NSLocalizedDescriptionKey, v17, NSLocalizedFailureReasonErrorKey, 0));
        v19 = (NSError *)objc_msgSend(v21, "initWithDomain:code:userInfo:", CFSTR("com.apple.freeform.CRLErrorDomainMediaCompatibility"), 100, v18);
        mError = self->mError;
        self->mError = v19;

      }
      goto LABEL_8;
    }
  }
LABEL_10:
  if (v10)
    v10[2](v10);

}

- (void)cancel
{
  int *p_mIsCancelled;
  unsigned int v4;
  __CFRunLoop *Main;
  _QWORD v6[5];
  _QWORD block[5];

  if (qword_10147E5F0 != -1)
    dispatch_once(&qword_10147E5F0, &stru_101252E68);
  if (os_log_type_enabled((os_log_t)off_1013DB978, OS_LOG_TYPE_DEBUG))
    sub_100E226D0();
  p_mIsCancelled = &self->mIsCancelled;
  do
    v4 = __ldaxr((unsigned int *)p_mIsCancelled);
  while (__stlxr(v4 + 1, (unsigned int *)p_mIsCancelled));
  Main = CFRunLoopGetMain();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10033AC84;
  block[3] = &unk_10122D110;
  block[4] = self;
  CFRunLoopPerformBlock(Main, kCFRunLoopCommonModes, block);
  CFRunLoopWakeUp(Main);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10033AD70;
  v6[3] = &unk_10122D110;
  v6[4] = self;
  dispatch_async((dispatch_queue_t)qword_101415530, v6);
}

- (void)p_checkInitialCompatibilityLevelWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  CRLMovieCompatibilityChecker *v12;
  CRLMovieCompatibilityChecker *mCompatibilityChecker;
  CRLMovieCompatibilityChecker *v14;
  int64_t mDesiredCompatibilityLevel;
  id v16;
  _QWORD v17[5];
  id v18;

  v4 = a3;
  if (qword_10147E5F0 != -1)
    dispatch_once(&qword_10147E5F0, &stru_101252E88);
  if (os_log_type_enabled((os_log_t)off_1013DB978, OS_LOG_TYPE_DEBUG))
    sub_100E2286C();
  if (self->mCompatibilityChecker)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101252EA8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E227E0();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101252EC8);
    v5 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLMovieCompatibilityConverter p_checkInitialCompatibilityLevelWithCompletionHandler:]"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLMovieCompatibilityConverter.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 402, 0, "expected nil value for '%{public}s'", "mCompatibilityChecker");

  }
  if (self->mInitialCompatibilityLevel)
  {
    v8 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101252EE8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E22730((uint64_t)&self->mInitialCompatibilityLevel, v8);
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101252F08);
    v9 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLMovieCompatibilityConverter p_checkInitialCompatibilityLevelWithCompletionHandler:]"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLMovieCompatibilityConverter.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v10, v11, 403, 0, "mInitialCompatibilityLevel is %zd, not CRLMediaCompatibilityLevelUnknown", self->mInitialCompatibilityLevel);

  }
  v12 = -[CRLMovieCompatibilityChecker initWithData:]([CRLMovieCompatibilityChecker alloc], "initWithData:", self->mMovieData);
  mCompatibilityChecker = self->mCompatibilityChecker;
  self->mCompatibilityChecker = v12;

  v14 = self->mCompatibilityChecker;
  mDesiredCompatibilityLevel = self->mDesiredCompatibilityLevel;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10033B1E8;
  v17[3] = &unk_101231F00;
  v17[4] = self;
  v18 = v4;
  v16 = v4;
  -[CRLMovieCompatibilityChecker checkCompatibilityUpToLevel:completionHandler:](v14, "checkCompatibilityUpToLevel:completionHandler:", mDesiredCompatibilityLevel, v17);

}

- (CRLProgress)progress
{
  return &self->mProgress->super;
}

- (_TtC8Freeform8CRLAsset)convertedMediaData
{
  return self->mConvertedMovieData;
}

- (NSError)error
{
  return self->mError;
}

- (void)setPlayableOnAllDevicesPreset:(int64_t)a3
{
  self->mPlayableOnAllDevicesPreset = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mError, 0);
  objc_storeStrong((id *)&self->mConvertedMovieData, 0);
  objc_storeStrong((id *)&self->mBookmarkPreloadProgressObjects, 0);
  objc_storeStrong((id *)&self->mProgress, 0);
  objc_storeStrong((id *)&self->mAllDevicesProgressTimer, 0);
  objc_storeStrong((id *)&self->mAllDevicesProgress, 0);
  objc_storeStrong((id *)&self->mMakePlayableProgress, 0);
  objc_storeStrong((id *)&self->mAuxiliaryMovieDataBookmarkPreloadProgress, 0);
  objc_storeStrong((id *)&self->mMovieDataBookmarkPreloadProgress, 0);
  objc_storeStrong((id *)&self->mCompatibilityChecker, 0);
  objc_storeStrong((id *)&self->mExportSession, 0);
  objc_storeStrong((id *)&self->mAssetOwner, 0);
  objc_storeStrong((id *)&self->mAuxiliaryMovieDataFilename, 0);
  objc_storeStrong((id *)&self->mAuxiliaryMovieData, 0);
  objc_storeStrong((id *)&self->mMovieData, 0);
}

@end
