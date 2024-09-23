@implementation CRLCountedObserver

- (CRLCountedObserver)initWithObserver:(id)a3
{
  id v4;
  CRLCountedObserver *v5;
  CRLCountedObserver *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CRLCountedObserver;
  v5 = -[CRLCountedObserver init](&v8, "init");
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_observer, v4);
    v6->_count = 1;
  }

  return v6;
}

- (id)observer
{
  id WeakRetained;

  if (self->_count)
    WeakRetained = objc_loadWeakRetained((id *)&self->_observer);
  else
    WeakRetained = 0;
  return WeakRetained;
}

- (id)observerIgnoringCount
{
  return objc_loadWeakRetained((id *)&self->_observer);
}

- (unint64_t)incrementCount
{
  unint64_t v2;

  v2 = self->_count + 1;
  self->_count = v2;
  return v2;
}

- (unint64_t)decrementCount
{
  unint64_t count;
  unint64_t v3;
  int v5;
  void *v6;
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
  id v17;
  CKRecordID v18;
  Swift::String v19;
  id WeakRetained;

  count = self->_count;
  if (!count)
  {
    v5 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101243E70);
    v6 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E0B96C((uint64_t)self, v6, v5);
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101243E90);
    v7 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v7);
    WeakRetained = objc_loadWeakRetained((id *)&self->_observer);
    sub_1001BC7E8((uint64_t)"Fatal Assertion failure: %{public}s %{public}s:%d CRLCountedObserver - attempted to decrement past 0 for observer %@!", v8, v9, v10, v11, v12, v13, v14, (uint64_t)"-[CRLCountedObserver decrementCount]");

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCountedObserver decrementCount]"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCommands/CRLChangeNotifier.m"));
    v17 = objc_loadWeakRetained((id *)&self->_observer);
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v15, v16, 59, 1, "CRLCountedObserver - attempted to decrement past 0 for observer %@!", v17, "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCommands/CRLChangeNotifier.m", 59, WeakRetained);

    SyncEvent.FetchedRecordZoneChanges.Deletion.init(recordID:recordType:)(v18, v19);
    abort();
  }
  v3 = count - 1;
  self->_count = v3;
  return v3;
}

- (unint64_t)currentCount
{
  return self->_count;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_observer);
}

@end
