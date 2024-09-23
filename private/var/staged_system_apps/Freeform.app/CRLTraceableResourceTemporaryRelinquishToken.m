@implementation CRLTraceableResourceTemporaryRelinquishToken

- (void)dealloc
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  CKRecordID v12;
  Swift::String v13;
  objc_super v14;

  if (!self->_didCallCompletionHandler)
  {
    sub_1003D9AD4();
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101259C78);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E2E428();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101259C98);
    v2 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v2);
    sub_1001BC7E8((uint64_t)"Fatal Assertion failure: %{public}s %{public}s:%d Operation completion handler is getting deallocated before it was invoked.", v3, v4, v5, v6, v7, v8, v9, (uint64_t)"-[CRLTraceableResourceTemporaryRelinquishToken dealloc]");
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLTraceableResourceTemporaryRelinquishToken dealloc]"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLTraceableResource.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v10, v11, 741, 1, "Operation completion handler is getting deallocated before it was invoked.");

    SyncEvent.FetchedRecordZoneChanges.Deletion.init(recordID:recordType:)(v12, v13);
    abort();
  }
  v14.receiver = self;
  v14.super_class = (Class)CRLTraceableResourceTemporaryRelinquishToken;
  -[CRLTraceableResourceTemporaryRelinquishToken dealloc](&v14, "dealloc");
}

- (void)didCallCompletionHandler
{
  self->_didCallCompletionHandler = 1;
}

@end
