@implementation CRLCommandControllerObjCHelper

+ (void)fatalAssertOnNilCommand:(id)a3
{
  id v3;
  int v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  CKRecordID v16;
  Swift::String v17;

  v3 = a3;
  if (!v3)
  {
    v4 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124BE48);
    v5 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E18170(v4, v5);
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124BE68);
    v6 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE81F0(v6, v4);
    sub_1001BC7E8((uint64_t)"Fatal Assertion failure: %{public}s %{public}s:%d Tried to enqueue nil command.", v7, v8, v9, v10, v11, v12, v13, (uint64_t)"+[CRLCommandControllerObjCHelper fatalAssertOnNilCommand:]");
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLCommandControllerObjCHelper fatalAssertOnNilCommand:]"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCommands/CRLCommandControllerObjCHelper.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v14, v15, 17, 1, "Tried to enqueue nil command.");

    SyncEvent.FetchedRecordZoneChanges.Deletion.init(recordID:recordType:)(v16, v17);
    abort();
  }

}

@end
