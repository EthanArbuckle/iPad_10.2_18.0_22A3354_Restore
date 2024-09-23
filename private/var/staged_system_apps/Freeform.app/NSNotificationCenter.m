@implementation NSNotificationCenter

- (id)crl_addObserverForName:(id)a3 object:(id)a4 queue:(id)a5 usingBlock:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  int v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  CKRecordID v29;
  Swift::String v30;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (!v10)
  {
    v14 = (id)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](NSOperationQueue, "mainQueue"));

    if (v14 == v12)
    {
      v17 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101235760);
      v18 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DF6930(v17, v18);
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101235780);
      v19 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE81F0(v19, v17);
      sub_1001BC7E8((uint64_t)"Fatal Assertion failure: %{public}s %{public}s:%d You should not add an observer for all notifications on the main thread because it's deadlock prone.", v20, v21, v22, v23, v24, v25, v26, (uint64_t)"-[NSNotificationCenter(CRLAdditions) crl_addObserverForName:object:queue:usingBlock:]");
      v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[NSNotificationCenter(CRLAdditions) crl_addObserverForName:object:queue:usingBlock:]"));
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/NSNotificationCenter_CRLAdditions.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v27, v28, 17, 1, "You should not add an observer for all notifications on the main thread because it's deadlock prone.");

      SyncEvent.FetchedRecordZoneChanges.Deletion.init(recordID:recordType:)(v29, v30);
      abort();
    }
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSNotificationCenter addObserverForName:object:queue:usingBlock:](self, "addObserverForName:object:queue:usingBlock:", v10, v11, v12, v13));

  return v15;
}

@end
