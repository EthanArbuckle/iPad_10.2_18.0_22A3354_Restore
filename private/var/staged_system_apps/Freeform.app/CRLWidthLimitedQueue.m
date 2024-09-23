@implementation CRLWidthLimitedQueue

- (CRLWidthLimitedQueue)init
{
  return -[CRLWidthLimitedQueue initWithLimit:](self, "initWithLimit:", qword_10147E600);
}

- (CRLWidthLimitedQueue)initWithLimit:(unint64_t)a3
{
  return -[CRLWidthLimitedQueue initWithLimit:name:targetQueue:](self, "initWithLimit:name:targetQueue:", a3, 0, 0);
}

- (CRLWidthLimitedQueue)initWithLimit:(unint64_t)a3 name:(id)a4
{
  return -[CRLWidthLimitedQueue initWithLimit:name:targetQueue:](self, "initWithLimit:name:targetQueue:", a3, a4, 0);
}

- (CRLWidthLimitedQueue)initWithLimit:(unint64_t)a3 name:(id)a4 targetQueue:(id)a5
{
  __CFString *v8;
  NSObject *v9;
  CRLWidthLimitedQueue *v10;
  void *v11;
  id v12;
  uint64_t v13;
  unint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  const char *v19;
  dispatch_queue_t v20;
  OS_dispatch_queue *mManagerQueue;
  const char *v22;
  dispatch_queue_t v23;
  OS_dispatch_queue *mTargetQueue;
  void *v26;
  void *v27;
  void *v28;
  objc_super v29;

  v8 = (__CFString *)a4;
  v9 = a5;
  v29.receiver = self;
  v29.super_class = (Class)CRLWidthLimitedQueue;
  v10 = -[CRLWidthLimitedQueue init](&v29, "init");
  if (!v10)
    goto LABEL_30;
  if (qword_10147E600 != a3)
  {
    if (a3)
      goto LABEL_4;
LABEL_13:
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125B438);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E2FF58();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125B458);
    v15 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE87A4(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWidthLimitedQueue initWithLimit:name:targetQueue:]"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLWidthLimitedQueue.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v16, v17, 48, 0, "Queue limit should be at least one.");

    a3 = 1;
    if (!v8)
      goto LABEL_23;
    goto LABEL_22;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](NSProcessInfo, "processInfo"));
  v12 = objc_msgSend(v11, "processorCount");

  if ((unint64_t)v12 <= 1)
    v13 = 1;
  else
    v13 = (uint64_t)v12;
  v14 = 2 * v13;
  if (v14 >= 0x18)
    a3 = 24;
  else
    a3 = v14;
  if (!a3)
    goto LABEL_13;
LABEL_4:
  if (!v8)
    goto LABEL_23;
LABEL_22:
  if (!-[__CFString length](v8, "length"))
  {
LABEL_23:

    v8 = CFSTR("com.apple.freeform.limitedqueue");
  }
  if (a3 >> 31)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125B478);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E2FED4();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125B498);
    v26 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE87A4(v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWidthLimitedQueue initWithLimit:name:targetQueue:]"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLWidthLimitedQueue.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v27, v28, 56, 0, "Out-of-bounds type assignment was clamped to max");

    LODWORD(a3) = 0x7FFFFFFF;
  }
  v10->mReaderCount = 0;
  v10->mLimit = a3;
  v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[__CFString stringByAppendingString:](v8, "stringByAppendingString:", CFSTR(".manager"))));
  v19 = (const char *)objc_msgSend(v18, "UTF8String");
  if (!v19)
    v19 = "com.apple.freeform.limitedqueue.manager";
  v20 = dispatch_queue_create(v19, 0);
  mManagerQueue = v10->mManagerQueue;
  v10->mManagerQueue = (OS_dispatch_queue *)v20;

  v8 = objc_retainAutorelease(v8);
  v22 = (const char *)-[__CFString UTF8String](v8, "UTF8String");
  if (!v22)
    v22 = "com.apple.freeform.limitedqueue";
  v23 = dispatch_queue_create_with_target_V2(v22, (dispatch_queue_attr_t)&_dispatch_queue_attr_concurrent, v9);
  mTargetQueue = v10->mTargetQueue;
  v10->mTargetQueue = (OS_dispatch_queue *)v23;

  v10->mUnfairLock._os_unfair_lock_opaque = 0;
  __dmb(0xBu);
LABEL_30:

  return v10;
}

- (void)performAsync:(id)a3
{
  id v4;
  NSObject *mManagerQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  mManagerQueue = self->mManagerQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100401790;
  v7[3] = &unk_101231F00;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(mManagerQueue, v7);

}

- (void)performSync:(id)a3
{
  id v4;
  NSObject *mManagerQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  mManagerQueue = self->mManagerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10040192C;
  block[3] = &unk_101231F00;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_barrier_sync(mManagerQueue, block);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mTargetQueue, 0);
  objc_storeStrong((id *)&self->mManagerQueue, 0);
}

@end
