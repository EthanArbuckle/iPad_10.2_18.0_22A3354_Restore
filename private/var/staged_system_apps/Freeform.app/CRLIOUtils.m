@implementation CRLIOUtils

+ (void)readAllFromChannel:(id)a3 offset:(int64_t)a4 length:(unint64_t)a5 completion:(id)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  _QWORD *v22;
  _QWORD v23[5];
  id v24;

  v9 = a3;
  v10 = a6;
  v11 = v10;
  if (v9)
  {
    if (v10)
      goto LABEL_22;
    goto LABEL_13;
  }
  +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_1012557B0);
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
    sub_100E27298();
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_1012557D0);
  v12 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
    sub_100E27200(v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLIOUtils readAllFromChannel:offset:length:completion:]"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/IO/CRLIOUtils.m"));
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v13, v14, 74, 0, "invalid nil value for '%{public}s'", "readChannel");

  if (!v11)
  {
LABEL_13:
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012557F0);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E27174();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101255810);
    v15 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E270DC(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLIOUtils readAllFromChannel:offset:length:completion:]"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/IO/CRLIOUtils.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v16, v17, 75, 0, "invalid nil value for '%{public}s'", "completion");

  }
LABEL_22:
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x3032000000;
  v23[3] = sub_10036C60C;
  v23[4] = sub_10036C61C;
  v18 = &_dispatch_data_empty;
  v24 = &_dispatch_data_empty;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10036C624;
  v20[3] = &unk_101255838;
  v22 = v23;
  v19 = v11;
  v21 = v19;
  objc_msgSend(v9, "readFromOffset:length:handler:", a4, a5, v20);

  _Block_object_dispose(v23, 8);
}

+ (void)readAllFromChannel:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD *v18;
  _QWORD v19[5];
  id v20;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v5)
  {
    if (v6)
      goto LABEL_22;
    goto LABEL_13;
  }
  +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_101255858);
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
    sub_100E274E0();
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_101255878);
  v8 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
    sub_100E27448(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLIOUtils readAllFromChannel:completion:]"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/IO/CRLIOUtils.m"));
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v9, v10, 99, 0, "invalid nil value for '%{public}s'", "readChannel");

  if (!v7)
  {
LABEL_13:
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101255898);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E273BC();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012558B8);
    v11 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E27324(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLIOUtils readAllFromChannel:completion:]"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/IO/CRLIOUtils.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v12, v13, 100, 0, "invalid nil value for '%{public}s'", "completion");

  }
LABEL_22:
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x3032000000;
  v19[3] = sub_10036C60C;
  v19[4] = sub_10036C61C;
  v14 = &_dispatch_data_empty;
  v20 = &_dispatch_data_empty;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10036CAF8;
  v16[3] = &unk_101255838;
  v18 = v19;
  v15 = v7;
  v17 = v15;
  objc_msgSend(v5, "readWithHandler:", v16);

  _Block_object_dispose(v19, 8);
}

+ (CGDataProvider)newCGDataProviderForInputStream:(id)a3
{
  return (CGDataProvider *)objc_msgSend(a1, "newCGDataProviderForInputStream:outInfo:outCallbacks:", a3, 0, 0);
}

+ (CGDataProvider)newCGDataProviderForInputStream:(id)a3 outInfo:(void *)a4 outCallbacks:(const CGDataProviderSequentialCallbacks *)a5
{
  id v7;
  CGDataProvider *Sequential;

  if (!a3)
    return 0;
  v7 = a3;
  CFRetain(v7);
  if (a4)
    *a4 = v7;
  if (a5)
    *a5 = (const CGDataProviderSequentialCallbacks *)&unk_1012558D8;
  Sequential = CGDataProviderCreateSequential(v7, (const CGDataProviderSequentialCallbacks *)&unk_1012558D8);

  return Sequential;
}

+ (CGDataProvider)newCGDataProviderForReadChannel:(id)a3 length:(unint64_t)a4
{
  return (CGDataProvider *)_objc_msgSend(a1, "newCGDataProviderForReadChannel:length:outInfo:outCallbacks:", a3, a4, 0, 0);
}

+ (CGDataProvider)newCGDataProviderForReadChannel:(id)a3 length:(unint64_t)a4 outInfo:(void *)a5 outCallbacks:(const CGDataProviderSequentialCallbacks *)a6
{
  id v10;
  CRLReadChannelInputStreamAdapter *v11;
  CGDataProvider *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;

  if (!a3)
    return 0;
  v10 = a3;
  v11 = -[CRLReadChannelInputStreamAdapter initWithReadChannel:length:]([CRLReadChannelInputStreamAdapter alloc], "initWithReadChannel:length:", v10, a4);

  if (-[CRLReadChannelInputStreamAdapter canSeek](v11, "canSeek"))
  {
    v12 = (CGDataProvider *)objc_msgSend(a1, "newCGDataProviderForInputStream:outInfo:outCallbacks:", v11, a5, a6);
  }
  else
  {
    v13 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101255900);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E27620();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101255920);
    v14 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E2756C(v14, v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLIOUtils newCGDataProviderForReadChannel:length:outInfo:outCallbacks:]"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/IO/CRLIOUtils.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v15, v16, 156, 0, "Need a seekable input stream for CGDataProvider");

    v12 = 0;
  }

  return v12;
}

+ (void)readWithHandlerAndWait:(id)a3 handler:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  _QWORD v9[4];
  dispatch_semaphore_t v10;
  id v11;

  v5 = a4;
  v6 = a3;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10036CF14;
  v9[3] = &unk_101255948;
  v10 = dispatch_semaphore_create(0);
  v11 = v5;
  v7 = v10;
  v8 = v5;
  objc_msgSend(v6, "readWithHandler:", v9);

  dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
}

+ (void)readFromOffsetAndWait:(id)a3 offset:(int64_t)a4 length:(unint64_t)a5 handler:(id)a6
{
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  _QWORD v13[4];
  dispatch_semaphore_t v14;
  id v15;

  v9 = a6;
  v10 = a3;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10036D024;
  v13[3] = &unk_101255948;
  v14 = dispatch_semaphore_create(0);
  v15 = v9;
  v11 = v14;
  v12 = v9;
  objc_msgSend(v10, "readFromOffset:length:handler:", a4, a5, v13);

  dispatch_semaphore_wait(v11, 0xFFFFFFFFFFFFFFFFLL);
}

@end
