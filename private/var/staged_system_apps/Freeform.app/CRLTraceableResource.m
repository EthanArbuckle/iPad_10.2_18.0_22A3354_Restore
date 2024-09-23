@implementation CRLTraceableResource

- (CRLTraceableResource)init
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
    dispatch_once(&qword_10147E370, &stru_101259640);
  v3 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109890;
    v12 = v2;
    v13 = 2082;
    v14 = "-[CRLTraceableResource init]";
    v15 = 2082;
    v16 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLTraceableResource.m";
    v17 = 1024;
    v18 = 103;
    _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Do not call method", buf, 0x22u);
  }
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_101259660);
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
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLTraceableResource init]"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLTraceableResource.m"));
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 103, 0, "Do not call method");

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s: %s"), "Do not call method", "-[CRLTraceableResource init]"));
  v10 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v9, 0));

  objc_exception_throw(v10);
}

- (CRLTraceableResource)initWithName:(id)a3 logContext:(id)a4
{
  id v6;
  id v7;
  CRLTraceableResource *v8;
  NSString *v9;
  NSString *name;
  NSMutableArray *v11;
  NSMutableArray *tokens;
  NSMapTable *v13;
  NSMapTable *timeoutBlocksMap;
  id v15;
  const char *v16;
  dispatch_queue_attr_t v17;
  NSObject *v18;
  dispatch_queue_t v19;
  OS_dispatch_queue *queue;
  void *v21;
  objc_super v23;

  v6 = a3;
  v7 = a4;
  v23.receiver = self;
  v23.super_class = (Class)CRLTraceableResource;
  v8 = -[CRLTraceableResource init](&v23, "init");
  if (v8)
  {
    v9 = (NSString *)objc_msgSend(v6, "copy");
    name = v8->_name;
    v8->_name = v9;

    v8->_printTimeoutAsError = 1;
    objc_storeStrong((id *)&v8->_logContext, a4);
    v11 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    tokens = v8->_tokens;
    v8->_tokens = v11;

    v13 = (NSMapTable *)objc_msgSend(objc_alloc((Class)NSMapTable), "initWithKeyOptions:valueOptions:capacity:", 512, 512, 0);
    timeoutBlocksMap = v8->_timeoutBlocksMap;
    v8->_timeoutBlocksMap = v13;

    v15 = objc_retainAutorelease(objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("CRLTraceableResource.[%@]"), v6));
    v16 = (const char *)objc_msgSend(v15, "UTF8String");
    v17 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v18 = objc_claimAutoreleasedReturnValue(v17);
    v19 = dispatch_queue_create(v16, v18);
    queue = v8->_queue;
    v8->_queue = (OS_dispatch_queue *)v19;

    v21 = (void *)objc_claimAutoreleasedReturnValue(+[CRLTraceableResourceManager sharedManager](CRLTraceableResourceManager, "sharedManager"));
    objc_msgSend(v21, "registerTraceableResource:", v8);

  }
  return v8;
}

- (id)willAcquireResourceWithIntent:(id)a3 timeout:(unint64_t)a4 parent:(id)a5 context:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  double v14;
  CRLTraceableResourceToken *v15;
  NSObject *queue;
  CRLTraceableResourceToken *v17;
  CRLTraceableResourceToken *v18;
  CRLTraceableResourceToken *v19;
  _QWORD v21[5];
  CRLTraceableResourceToken *v22;

  v10 = a6;
  v11 = a5;
  v12 = a3;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackReturnAddresses](NSThread, "callStackReturnAddresses"));
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  v15 = -[CRLTraceableResourceToken initWithIntent:timeout:parent:context:acquireCallStack:acquireTime:logContext:]([CRLTraceableResourceToken alloc], "initWithIntent:timeout:parent:context:acquireCallStack:acquireTime:logContext:", v12, a4, v11, v10, v13, self->_logContext, v14);

  queue = self->_queue;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_1003D98F8;
  v21[3] = &unk_10122D3D8;
  v21[4] = self;
  v17 = v15;
  v22 = v17;
  dispatch_async(queue, v21);
  v18 = v22;
  v19 = v17;

  return v19;
}

- (id)willAcquireResourceWithIntent:(id)a3 timeout:(unint64_t)a4 parent:(id)a5
{
  return -[CRLTraceableResource willAcquireResourceWithIntent:timeout:parent:context:](self, "willAcquireResourceWithIntent:timeout:parent:context:", a3, a4, a5, 0);
}

- (void)didAcquireResourceWithToken:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  CKRecordID v17;
  Swift::String v18;
  _QWORD block[4];
  id v20;

  v4 = a3;
  if (!v4)
  {
    sub_1003D9AD4();
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101259680);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E2D950();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012596A0);
    v7 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v7);
    sub_1001BC7E8((uint64_t)"Fatal Assertion failure: %{public}s %{public}s:%d Token cannot be nil.", v8, v9, v10, v11, v12, v13, v14, (uint64_t)"-[CRLTraceableResource didAcquireResourceWithToken:]");
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLTraceableResource didAcquireResourceWithToken:]"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLTraceableResource.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v15, v16, 149, 1, "Token cannot be nil.");

    SyncEvent.FetchedRecordZoneChanges.Deletion.init(recordID:recordType:)(v17, v18);
    abort();
  }
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1003D9B68;
  block[3] = &unk_10122D110;
  v20 = v4;
  v6 = v4;
  dispatch_async(queue, block);

}

- (void)didRelinquishResourceWithToken:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *queue;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  CKRecordID v21;
  Swift::String v22;
  _QWORD block[4];
  id v24;
  id v25;
  CRLTraceableResource *v26;
  uint64_t v27;

  v4 = a3;
  if (!v4)
  {
    sub_1003D9AD4();
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012596C0);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E2D9D0();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012596E0);
    v11 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v11);
    sub_1001BC7E8((uint64_t)"Fatal Assertion failure: %{public}s %{public}s:%d Token cannot be nil.", v12, v13, v14, v15, v16, v17, v18, (uint64_t)"-[CRLTraceableResource didRelinquishResourceWithToken:]");
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLTraceableResource didRelinquishResourceWithToken:]"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLTraceableResource.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v19, v20, 157, 1, "Token cannot be nil.");

    SyncEvent.FetchedRecordZoneChanges.Deletion.init(recordID:recordType:)(v21, v22);
    abort();
  }
  v5 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackReturnAddresses](NSThread, "callStackReturnAddresses"));
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1003D9DD4;
  block[3] = &unk_10124CB28;
  v24 = v5;
  v25 = v6;
  v27 = v8;
  v26 = self;
  v9 = v6;
  v10 = v5;
  dispatch_async(queue, block);

}

- (void)temporarilyRelinquishForToken:(id)a3 usingBlock:(id)a4
{
  id v6;
  id v7;
  void (**v8)(_QWORD, _QWORD);
  NSObject *queue;
  id v10;
  CRLTraceableResourceTemporaryRelinquishToken *v11;
  id v12;
  CRLTraceableResourceTemporaryRelinquishToken *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  CKRecordID v24;
  uint64_t v25;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  _QWORD v37[4];
  id v38;
  CRLTraceableResource *v39;
  CRLTraceableResourceTemporaryRelinquishToken *v40;
  _QWORD *v41;
  _QWORD v42[3];
  char v43;
  _QWORD v44[5];
  _QWORD block[5];

  v6 = a3;
  v7 = a4;
  if (!v6)
  {
    sub_1003D9AD4();
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101259740);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E2DAF0();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101259760);
    v14 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E2DA50(v14);
    sub_1001BC7E8((uint64_t)"Fatal Assertion failure: %{public}s %{public}s:%d Token cannot be nil.", v15, v16, v17, v18, v19, v20, v21, (uint64_t)"-[CRLTraceableResource temporarilyRelinquishForToken:usingBlock:]");
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLTraceableResource temporarilyRelinquishForToken:usingBlock:]"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLTraceableResource.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v22, v23, 180, 1, "Token cannot be nil.");

LABEL_22:
    SyncEvent.FetchedRecordZoneChanges.Deletion.init(recordID:recordType:)(v24, *(Swift::String *)&v25);
    abort();
  }
  v8 = (void (**)(_QWORD, _QWORD))v7;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1003DA55C;
  block[3] = &unk_10122D110;
  block[4] = self;
  dispatch_sync(queue, block);
  if ((-[NSMutableArray containsObject:](self->_tokens, "containsObject:", v6) & 1) == 0)
  {
    sub_1003D9AD4();
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101259780);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E2DC10();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012597A0);
    v27 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E2DB70(v27);
    sub_1001BC7E8((uint64_t)"Fatal Assertion failure: %{public}s %{public}s:%d Attempted to temporarily relinquish token that has already been relinquished: %{public}@", v28, v29, v30, v31, v32, v33, v34, (uint64_t)"-[CRLTraceableResource temporarilyRelinquishForToken:usingBlock:]");
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLTraceableResource temporarilyRelinquishForToken:usingBlock:]"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLTraceableResource.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v35, v36, 187, 1, "Attempted to temporarily relinquish token that has already been relinquished: %{public}@", v6, "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLTraceableResource.m", 187, v6);

    goto LABEL_22;
  }
  v10 = -[NSMutableArray copy](self->_tokens, "copy");
  v44[0] = _NSConcreteStackBlock;
  v44[1] = 3221225472;
  v44[2] = sub_1003DA5C8;
  v44[3] = &unk_1012597C8;
  v44[4] = self;
  objc_msgSend(v10, "enumerateObjectsWithOptions:usingBlock:", 2, v44);
  v11 = objc_alloc_init(CRLTraceableResourceTemporaryRelinquishToken);
  v42[0] = 0;
  v42[1] = v42;
  v42[2] = 0x2020000000;
  v43 = 0;
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472;
  v37[2] = sub_1003DA5D8;
  v37[3] = &unk_101259830;
  v41 = v42;
  v12 = v10;
  v38 = v12;
  v39 = self;
  v13 = v11;
  v40 = v13;
  ((void (**)(_QWORD, _QWORD *))v8)[2](v8, v37);

  _Block_object_dispose(v42, 8);
}

- (void)addToken:(id)a3 isForTemporaryRelinquish:(BOOL)a4
{
  void *v6;
  id v7;

  -[NSMutableArray addObject:](self->_tokens, "addObject:", a3);
  if (!a4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray firstObject](self->_tokens, "firstObject"));
    if (v6)
    {
      v7 = v6;
      -[CRLTraceableResource scheduleRelinquishTimeoutForToken:timeout:isForTemporaryRelinquish:](self, "scheduleRelinquishTimeoutForToken:timeout:isForTemporaryRelinquish:", v6, objc_msgSend(v6, "timeout"), 0);
      v6 = v7;
    }

  }
}

- (void)removeToken:(id)a3 isForTemporaryRelinquish:(BOOL)a4
{
  NSMutableArray *tokens;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  tokens = self->_tokens;
  v7 = a3;
  -[NSMutableArray removeObject:](tokens, "removeObject:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->_timeoutBlocksMap, "objectForKey:", v7));
  -[NSMapTable removeObjectForKey:](self->_timeoutBlocksMap, "removeObjectForKey:", v7);

  if (v8)
    dispatch_block_cancel(v8);
  if (!a4)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray firstObject](self->_tokens, "firstObject"));
    v10 = v9;
    if (v9)
      -[CRLTraceableResource scheduleRelinquishTimeoutForToken:timeout:isForTemporaryRelinquish:](self, "scheduleRelinquishTimeoutForToken:timeout:isForTemporaryRelinquish:", v9, objc_msgSend(v9, "timeout"), 0);

  }
  if (!-[NSMutableArray count](self->_tokens, "count") && -[NSMapTable count](self->_timeoutBlocksMap, "count"))
  {
    sub_1003D9AD4();
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101259850);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E2DD14();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101259870);
    v11 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLTraceableResource removeToken:isForTemporaryRelinquish:]"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLTraceableResource.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v12, v13, 254, 0, "Removing all tokens should also cancel all timeout blocks.");

  }
}

- (void)scheduleRelinquishTimeoutForToken:(id)a3 timeout:(unint64_t)a4 isForTemporaryRelinquish:(BOOL)a5
{
  id v8;
  void *v9;
  id v10;
  dispatch_block_t v11;
  NSMapTable *timeoutBlocksMap;
  id v13;
  dispatch_time_t v14;
  void **v15;
  uint64_t v16;
  void (*v17)(uint64_t);
  void *v18;
  CRLTraceableResource *v19;
  id v20;
  unint64_t v21;
  BOOL v22;

  v8 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->_timeoutBlocksMap, "objectForKey:", v8));

  if (!v9)
  {
    v15 = _NSConcreteStackBlock;
    v16 = 3221225472;
    v17 = sub_1003DAC84;
    v18 = &unk_10123AE08;
    v19 = self;
    v10 = v8;
    v20 = v10;
    v21 = a4;
    v22 = a5;
    v11 = dispatch_block_create((dispatch_block_flags_t)0, &v15);
    timeoutBlocksMap = self->_timeoutBlocksMap;
    v13 = objc_retainBlock(v11);
    -[NSMapTable setObject:forKey:](timeoutBlocksMap, "setObject:forKey:", v13, v10, v15, v16, v17, v18, v19);

    v14 = dispatch_time(0, 1000000000 * a4);
    dispatch_after(v14, (dispatch_queue_t)self->_queue, v11);

  }
}

- (id)tokenSerializationDescription
{
  NSObject *queue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = sub_1003DB058;
  v10 = sub_1003DB068;
  v11 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1003DB070;
  v5[3] = &unk_10122C5F0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)logSerializationAsError
{
  -[CRLTraceableResource logSerializationAsErrorWithPrefix:](self, "logSerializationAsErrorWithPrefix:", &stru_1012A72B0);
}

- (void)logSerializationAsErrorWithPrefix:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1003DB130;
  block[3] = &unk_10122D3D8;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queue, block);

}

- (void)p_logErrorTokenSerializationDescriptionFromQueueWithPrefix:(id)a3
{
  unint64_t v3;
  void *v4;
  NSMutableArray *v5;
  __int128 v6;
  uint64_t v7;
  void *v8;
  id v9;
  char *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  CRLLogContext *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  CRLLogContext *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  CRLLogContext *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  CRLLogContext *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  void *v39;
  CRLLogContext *logContext;
  NSObject *v41;
  void *v42;
  void *v43;
  NSString *name;
  id v45;
  CRLLogContext *v46;
  NSObject *v47;
  void *v48;
  void *v49;
  __int128 v50;
  NSMutableArray *v51;
  unint64_t v52;
  id v54;
  uint64_t v55;
  uint64_t v56;
  id v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  uint8_t v62[128];
  uint8_t buf[4];
  void *v64;
  __int16 v65;
  void *v66;
  __int16 v67;
  id v68;
  __int16 v69;
  unint64_t v70;
  __int16 v71;
  NSString *v72;
  __int16 v73;
  id v74;

  v54 = a3;
  do
    v3 = __ldaxr(&qword_1014157B8);
  while (__stlxr(v3 + 1, &qword_1014157B8));
  v52 = v3;
  if (qword_10147E368 != -1)
    dispatch_once(&qword_10147E368, &stru_1012598D0);
  v4 = off_1013D9068;
  if (os_log_type_enabled((os_log_t)off_1013D9068, OS_LOG_TYPE_ERROR))
  {
    logContext = self->_logContext;
    v41 = v4;
    v42 = (void *)objc_claimAutoreleasedReturnValue(-[CRLLogContext publicString](logContext, "publicString"));
    v43 = (void *)objc_claimAutoreleasedReturnValue(-[CRLLogContext privateString](self->_logContext, "privateString"));
    name = self->_name;
    v45 = -[NSMutableArray count](self->_tokens, "count");
    *(_DWORD *)buf = 138544642;
    v64 = v42;
    v65 = 2112;
    v66 = v43;
    v67 = 2114;
    v68 = v54;
    v69 = 2048;
    v70 = v52;
    v71 = 2112;
    v72 = name;
    v73 = 2048;
    v74 = v45;
    _os_log_error_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_ERROR, "%{public}@ %@ %{public}@┏ %llx '%@' pending resource requests (%tu total)", buf, 0x3Eu);

  }
  v60 = 0u;
  v61 = 0u;
  v58 = 0u;
  v59 = 0u;
  v5 = self->_tokens;
  v57 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v58, v62, 16);
  if (v57)
  {
    v7 = 0;
    v56 = *(_QWORD *)v59;
    *(_QWORD *)&v6 = 138544642;
    v50 = v6;
    v51 = v5;
    do
    {
      v8 = 0;
      v55 = v7;
      do
      {
        if (*(_QWORD *)v59 != v56)
          objc_enumerationMutation(v5);
        v9 = *(id *)(*((_QWORD *)&v58 + 1) + 8 * (_QWORD)v8);
        if (qword_10147E368 != -1)
          dispatch_once(&qword_10147E368, &stru_1012598F0);
        v10 = (char *)v8 + v7;
        v11 = off_1013D9068;
        if (os_log_type_enabled((os_log_t)off_1013D9068, OS_LOG_TYPE_ERROR))
        {
          v19 = self->_logContext;
          v20 = v11;
          v21 = (void *)objc_claimAutoreleasedReturnValue(-[CRLLogContext publicString](v19, "publicString"));
          v22 = (void *)objc_claimAutoreleasedReturnValue(-[CRLLogContext privateString](self->_logContext, "privateString"));
          v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v10));
          v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "metadataDescriptionWithIndex:", v23));
          *(_DWORD *)buf = v50;
          v64 = v21;
          v65 = 2112;
          v66 = v22;
          v67 = 2114;
          v68 = v54;
          v69 = 2048;
          v70 = v52;
          v71 = 2048;
          v72 = (NSString *)v9;
          v73 = 2114;
          v74 = v24;
          _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "%{public}@ %@ %{public}@  %llx %p %{public}@", buf, 0x3Eu);

          v5 = v51;
          v7 = v55;

        }
        if (qword_10147E368 != -1)
          dispatch_once(&qword_10147E368, &stru_101259910);
        v12 = off_1013D9068;
        if (os_log_type_enabled((os_log_t)off_1013D9068, OS_LOG_TYPE_ERROR))
        {
          v25 = self->_logContext;
          v26 = v12;
          v27 = (void *)objc_claimAutoreleasedReturnValue(-[CRLLogContext publicString](v25, "publicString"));
          v28 = (void *)objc_claimAutoreleasedReturnValue(-[CRLLogContext privateString](self->_logContext, "privateString"));
          v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v10));
          v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "acquireCallStackDescriptionWithIndex:", v29));
          *(_DWORD *)buf = v50;
          v64 = v27;
          v65 = 2112;
          v66 = v28;
          v67 = 2114;
          v68 = v54;
          v69 = 2048;
          v70 = v52;
          v71 = 2048;
          v72 = (NSString *)v9;
          v73 = 2114;
          v74 = v30;
          _os_log_error_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "%{public}@ %@ %{public}@  %llx %p %{public}@", buf, 0x3Eu);

          v5 = v51;
          v7 = v55;

        }
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v10, v50));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "breadcrumbsDescriptionWithIndex:", v13));

        if (objc_msgSend(v14, "length"))
        {
          if (qword_10147E368 != -1)
            dispatch_once(&qword_10147E368, &stru_101259930);
          v15 = off_1013D9068;
          if (os_log_type_enabled((os_log_t)off_1013D9068, OS_LOG_TYPE_ERROR))
          {
            v31 = self->_logContext;
            v32 = v15;
            v33 = (void *)objc_claimAutoreleasedReturnValue(-[CRLLogContext publicString](v31, "publicString"));
            v34 = (void *)objc_claimAutoreleasedReturnValue(-[CRLLogContext privateString](self->_logContext, "privateString"));
            *(_DWORD *)buf = v50;
            v64 = v33;
            v65 = 2112;
            v66 = v34;
            v67 = 2114;
            v68 = v54;
            v69 = 2048;
            v70 = v52;
            v71 = 2048;
            v72 = (NSString *)v9;
            v73 = 2114;
            v74 = v14;
            _os_log_error_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "%{public}@ %@ %{public}@  %llx %p %{public}@", buf, 0x3Eu);

            v7 = v55;
            v5 = v51;
          }
        }
        v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v10));
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "parentDescriptionWithIndex:", v16));

        if (objc_msgSend(v17, "length"))
        {
          if (qword_10147E368 != -1)
            dispatch_once(&qword_10147E368, &stru_101259950);
          v18 = off_1013D9068;
          if (os_log_type_enabled((os_log_t)off_1013D9068, OS_LOG_TYPE_ERROR))
          {
            v35 = self->_logContext;
            v36 = v18;
            v37 = (void *)objc_claimAutoreleasedReturnValue(-[CRLLogContext publicString](v35, "publicString"));
            v38 = (void *)objc_claimAutoreleasedReturnValue(-[CRLLogContext privateString](self->_logContext, "privateString"));
            *(_DWORD *)buf = v50;
            v64 = v37;
            v65 = 2112;
            v66 = v38;
            v67 = 2114;
            v68 = v54;
            v69 = 2048;
            v70 = v52;
            v71 = 2048;
            v72 = (NSString *)v9;
            v73 = 2114;
            v74 = v17;
            _os_log_error_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_ERROR, "%{public}@ %@ %{public}@  %llx %p %{public}@", buf, 0x3Eu);

            v7 = v55;
            v5 = v51;
          }
        }

        v8 = (char *)v8 + 1;
      }
      while (v57 != v8);
      v7 += (uint64_t)v8;
      v57 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v58, v62, 16);
    }
    while (v57);
  }

  if (qword_10147E368 != -1)
    dispatch_once(&qword_10147E368, &stru_101259970);
  v39 = off_1013D9068;
  if (os_log_type_enabled((os_log_t)off_1013D9068, OS_LOG_TYPE_ERROR))
  {
    v46 = self->_logContext;
    v47 = v39;
    v48 = (void *)objc_claimAutoreleasedReturnValue(-[CRLLogContext publicString](v46, "publicString"));
    v49 = (void *)objc_claimAutoreleasedReturnValue(-[CRLLogContext privateString](self->_logContext, "privateString"));
    *(_DWORD *)buf = 138544130;
    v64 = v48;
    v65 = 2112;
    v66 = v49;
    v67 = 2114;
    v68 = v54;
    v69 = 2048;
    v70 = v52;
    _os_log_error_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_ERROR, "%{public}@ %@ %{public}@┗ %llx", buf, 0x2Au);

  }
}

- (void)p_logDebugTokenSerializationDescriptionFromQueue
{
  unint64_t v2;
  void *v3;
  NSMutableArray *v4;
  __int128 v5;
  uint64_t v6;
  void *v7;
  id v8;
  char *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  CRLLogContext *logContext;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  CRLLogContext *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  CRLLogContext *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  CRLLogContext *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v38;
  __int128 v39;
  NSMutableArray *v40;
  uint64_t v41;
  uint64_t v43;
  uint64_t v44;
  id v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  uint8_t buf[4];
  void *v51;
  __int16 v52;
  void *v53;
  __int16 v54;
  uint64_t v55;
  __int16 v56;
  id v57;
  __int16 v58;
  void *v59;
  _BYTE v60[128];

  do
    v2 = __ldaxr(&qword_1014157B8);
  while (__stlxr(v2 + 1, &qword_1014157B8));
  v41 = v2;
  if (qword_10147E368 != -1)
    dispatch_once(&qword_10147E368, &stru_101259990);
  v3 = off_1013D9068;
  if (os_log_type_enabled((os_log_t)off_1013D9068, OS_LOG_TYPE_DEBUG))
    sub_100E2DFCC((uint64_t)self, v3, v41);
  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  v4 = self->_tokens;
  v45 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v46, v60, 16);
  if (v45)
  {
    v6 = 0;
    v44 = *(_QWORD *)v47;
    *(_QWORD *)&v5 = 138544386;
    v39 = v5;
    v40 = v4;
    do
    {
      v7 = 0;
      v43 = v6;
      do
      {
        if (*(_QWORD *)v47 != v44)
          objc_enumerationMutation(v4);
        v8 = *(id *)(*((_QWORD *)&v46 + 1) + 8 * (_QWORD)v7);
        if (qword_10147E368 != -1)
          dispatch_once(&qword_10147E368, &stru_1012599B0);
        v9 = (char *)v7 + v6;
        v10 = off_1013D9068;
        if (os_log_type_enabled((os_log_t)off_1013D9068, OS_LOG_TYPE_DEBUG))
        {
          logContext = self->_logContext;
          v19 = v10;
          v20 = (void *)objc_claimAutoreleasedReturnValue(-[CRLLogContext publicString](logContext, "publicString"));
          v21 = (void *)objc_claimAutoreleasedReturnValue(-[CRLLogContext privateString](self->_logContext, "privateString"));
          v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v9));
          v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "metadataDescriptionWithIndex:", v22));
          *(_DWORD *)buf = v39;
          v51 = v20;
          v52 = 2112;
          v53 = v21;
          v54 = 2048;
          v55 = v41;
          v56 = 2048;
          v57 = v8;
          v58 = 2114;
          v59 = v23;
          _os_log_debug_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "%{public}@ %@   %llx %p %{public}@", buf, 0x34u);

          v4 = v40;
          v6 = v43;

        }
        if (qword_10147E368 != -1)
          dispatch_once(&qword_10147E368, &stru_1012599D0);
        v11 = off_1013D9068;
        if (os_log_type_enabled((os_log_t)off_1013D9068, OS_LOG_TYPE_DEBUG))
        {
          v24 = self->_logContext;
          v25 = v11;
          v26 = (void *)objc_claimAutoreleasedReturnValue(-[CRLLogContext publicString](v24, "publicString"));
          v27 = (void *)objc_claimAutoreleasedReturnValue(-[CRLLogContext privateString](self->_logContext, "privateString"));
          v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v9));
          v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "acquireCallStackDescriptionWithIndex:", v28));
          *(_DWORD *)buf = v39;
          v51 = v26;
          v52 = 2112;
          v53 = v27;
          v54 = 2048;
          v55 = v41;
          v56 = 2048;
          v57 = v8;
          v58 = 2114;
          v59 = v29;
          _os_log_debug_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEBUG, "%{public}@ %@   %llx %p %{public}@", buf, 0x34u);

          v4 = v40;
          v6 = v43;

        }
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v9, v39));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "breadcrumbsDescriptionWithIndex:", v12));

        if (objc_msgSend(v13, "length"))
        {
          if (qword_10147E368 != -1)
            dispatch_once(&qword_10147E368, &stru_1012599F0);
          v14 = off_1013D9068;
          if (os_log_type_enabled((os_log_t)off_1013D9068, OS_LOG_TYPE_DEBUG))
          {
            v30 = self->_logContext;
            v31 = v14;
            v32 = (void *)objc_claimAutoreleasedReturnValue(-[CRLLogContext publicString](v30, "publicString"));
            v33 = (void *)objc_claimAutoreleasedReturnValue(-[CRLLogContext privateString](self->_logContext, "privateString"));
            *(_DWORD *)buf = v39;
            v51 = v32;
            v52 = 2112;
            v53 = v33;
            v54 = 2048;
            v55 = v41;
            v56 = 2048;
            v57 = v8;
            v58 = 2114;
            v59 = v13;
            _os_log_debug_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEBUG, "%{public}@ %@   %llx %p %{public}@", buf, 0x34u);

            v6 = v43;
            v4 = v40;
          }
        }
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v9));
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "parentDescriptionWithIndex:", v15));

        if (objc_msgSend(v16, "length"))
        {
          if (qword_10147E368 != -1)
            dispatch_once(&qword_10147E368, &stru_101259A10);
          v17 = off_1013D9068;
          if (os_log_type_enabled((os_log_t)off_1013D9068, OS_LOG_TYPE_DEBUG))
          {
            v34 = self->_logContext;
            v35 = v17;
            v36 = (void *)objc_claimAutoreleasedReturnValue(-[CRLLogContext publicString](v34, "publicString"));
            v37 = (void *)objc_claimAutoreleasedReturnValue(-[CRLLogContext privateString](self->_logContext, "privateString"));
            *(_DWORD *)buf = v39;
            v51 = v36;
            v52 = 2112;
            v53 = v37;
            v54 = 2048;
            v55 = v41;
            v56 = 2048;
            v57 = v8;
            v58 = 2114;
            v59 = v16;
            _os_log_debug_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEBUG, "%{public}@ %@   %llx %p %{public}@", buf, 0x34u);

            v6 = v43;
            v4 = v40;
          }
        }

        v7 = (char *)v7 + 1;
      }
      while (v45 != v7);
      v6 += (uint64_t)v7;
      v45 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v46, v60, 16);
    }
    while (v45);
  }

  if (qword_10147E368 != -1)
    dispatch_once(&qword_10147E368, &stru_101259A30);
  v38 = off_1013D9068;
  if (os_log_type_enabled((os_log_t)off_1013D9068, OS_LOG_TYPE_DEBUG))
    sub_100E2DEEC((uint64_t)self, v38, v41);
}

- (id)p_tokenSerializationDescriptionFromQueue
{
  NSMutableString *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSMutableArray *obj;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];

  v3 = objc_opt_new(NSMutableString);
  -[NSMutableString appendFormat:](v3, "appendFormat:", CFSTR("'%@' pending resource requests (%tu total)"), self->_name, -[NSMutableArray count](self->_tokens, "count"));
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  obj = self->_tokens;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v20 = *(_QWORD *)v22;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v22 != v20)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)v7);
        -[NSMutableString appendString:](v3, "appendString:", CFSTR("\n"));
        v9 = v8;
        v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", (char *)v7 + v6));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "metadataDescriptionWithIndex:", v10));
        -[NSMutableString appendString:](v3, "appendString:", v11);

        -[NSMutableString appendString:](v3, "appendString:", CFSTR("\n"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", (char *)v7 + v6));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "acquireCallStackDescriptionWithIndex:", v12));
        -[NSMutableString appendString:](v3, "appendString:", v13);

        v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", (char *)v7 + v6));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "breadcrumbsDescriptionWithIndex:", v14));

        if (objc_msgSend(v15, "length"))
        {
          -[NSMutableString appendString:](v3, "appendString:", CFSTR("\n"));
          -[NSMutableString appendString:](v3, "appendString:", v15);
        }
        v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", (char *)v7 + v6));
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "parentDescriptionWithIndex:", v16));

        if (objc_msgSend(v17, "length"))
        {
          -[NSMutableString appendString:](v3, "appendString:", CFSTR("\n"));
          -[NSMutableString appendString:](v3, "appendString:", v17);
        }

        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      v6 += (uint64_t)v7;
    }
    while (v5);
  }

  return v3;
}

- (id)description
{
  Class v3;
  NSString *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_opt_class(self, a2);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLTraceableResource name](self, "name"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLTraceableResource tokenSerializationDescription](self, "tokenSerializationDescription"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: %p name='%@'>\n%@"), v5, self, v6, v7));

  return v8;
}

- (NSString)name
{
  return self->_name;
}

- (CRLLogContext)logContext
{
  return self->_logContext;
}

- (void)setLogContext:(id)a3
{
  objc_storeStrong((id *)&self->_logContext, a3);
}

- (BOOL)printTimeoutAsError
{
  return self->_printTimeoutAsError;
}

- (void)setPrintTimeoutAsError:(BOOL)a3
{
  self->_printTimeoutAsError = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logContext, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_timeoutBlocksMap, 0);
  objc_storeStrong((id *)&self->_tokens, 0);
}

@end
