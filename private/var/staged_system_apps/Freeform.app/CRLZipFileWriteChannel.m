@implementation CRLZipFileWriteChannel

- (CRLZipFileWriteChannel)init
{
  unsigned int v3;
  void *v4;
  uint64_t v5;
  Class v6;
  NSString *v7;
  void *v8;
  void *v9;
  char *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  Class v14;
  NSString *v15;
  void *v16;
  uint64_t v17;
  Class v18;
  NSString *v19;
  void *v20;
  void *v21;
  id v22;
  uint8_t buf[4];
  unsigned int v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  int v30;
  __int16 v31;
  void *v32;

  v3 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_10124A340);
  v4 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_ERROR))
  {
    objc_opt_class(self, v5);
    v7 = NSStringFromClass(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    *(_DWORD *)buf = 67110146;
    v24 = v3;
    v25 = 2082;
    v26 = "-[CRLZipFileWriteChannel init]";
    v27 = 2082;
    v28 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/Zip/CRLZipFileWriteChannel.mm";
    v29 = 1024;
    v30 = 20;
    v31 = 2114;
    v32 = v8;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v4, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Abstract method not overridden by %{public}@", buf, 0x2Cu);

  }
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_10124A360);
  v9 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_ERROR))
  {
    v10 = (char *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
    *(_DWORD *)buf = 67109378;
    v24 = v3;
    v25 = 2114;
    v26 = v10;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v9, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);

  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLZipFileWriteChannel init]"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/Zip/CRLZipFileWriteChannel.mm"));
  objc_opt_class(self, v13);
  v15 = NSStringFromClass(v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v11, v12, 20, 0, "Abstract method not overridden by %{public}@", v16);

  objc_opt_class(self, v17);
  v19 = NSStringFromClass(v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Abstract method not overridden by %@: %s"), v20, "-[CRLZipFileWriteChannel init]"));
  v22 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v21, 0));

  objc_exception_throw(v22);
}

- (CRLZipFileWriteChannel)initWithArchiveWriter:(id)a3
{
  id v5;
  CRLZipFileWriteChannel *v6;
  CRLZipFileWriteChannel *v7;
  dispatch_queue_attr_t v8;
  NSObject *v9;
  dispatch_queue_t v10;
  OS_dispatch_queue *writerQueue;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CRLZipFileWriteChannel;
  v6 = -[CRLZipFileWriteChannel init](&v13, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_archiveWriter, a3);
    v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    v10 = dispatch_queue_create("CRLZipFileWriteChannel.Writer", v9);
    writerQueue = v7->_writerQueue;
    v7->_writerQueue = (OS_dispatch_queue *)v10;

  }
  return v7;
}

- (void)writeData:(id)a3 handler:(id)a4
{
  NSObject *v6;
  id v7;
  unsigned __int8 v8;
  size_t size;
  CRLZipFileWriter *archiveWriter;
  OS_dispatch_queue *writerQueue;
  id v12;
  int v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  CKRecordID v25;
  Swift::String v26;
  _QWORD v27[4];
  id v28;
  size_t v29;
  _BYTE v30[24];

  v6 = a3;
  v7 = a4;
  v8 = atomic_load((unsigned __int8 *)&self->_isClosed);
  if ((v8 & 1) != 0)
  {
    v13 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124A3A8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E15450();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124A3C8);
    v14 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_ERROR))
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
      sub_100DEB414(v15, (uint64_t)v30, v13);
    }

    sub_1001BC7E8((uint64_t)"Fatal Assertion failure: %{public}s %{public}s:%d Channel is closed", v16, v17, v18, v19, v20, v21, v22, (uint64_t)"-[CRLZipFileWriteChannel writeData:handler:]");
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLZipFileWriteChannel writeData:handler:]"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/Zip/CRLZipFileWriteChannel.mm"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v23, v24, 40, 1, "Channel is closed");

    SyncEvent.FetchedRecordZoneChanges.Deletion.init(recordID:recordType:)(v25, v26);
    abort();
  }
  if (v6)
    size = dispatch_data_get_size(v6);
  else
    size = 0;
  archiveWriter = self->_archiveWriter;
  writerQueue = self->_writerQueue;
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_10027E740;
  v27[3] = &unk_10124A388;
  v12 = v7;
  v28 = v12;
  v29 = size;
  -[CRLZipWriter addData:queue:completion:](archiveWriter, "addData:queue:completion:", v6, writerQueue, v27);

}

- (void)close
{
  atomic_store(1u, (unsigned __int8 *)&self->_isClosed);
}

- (void)addBarrier:(id)a3
{
  -[CRLZipWriter addBarrier:](self->_archiveWriter, "addBarrier:", a3);
}

- (void)flushWithCompletion:(id)a3
{
  id v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _BYTE v13[24];

  v4 = a3;
  v5 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_10124A3E8);
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
    sub_100E154D4();
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_10124A408);
  v6 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_ERROR))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
    sub_100DEB414(v7, (uint64_t)v13, v5);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLZipFileWriteChannel flushWithCompletion:]"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/Zip/CRLZipFileWriteChannel.mm"));
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v8, v9, 57, 0, "Flushing ZIP write channel only adds a barrier.");

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10027EAB8;
  v11[3] = &unk_10123C4A8;
  v10 = v4;
  v12 = v10;
  -[CRLZipFileWriteChannel addBarrier:](self, "addBarrier:", v11);

}

- (BOOL)isValid
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_writerQueue, 0);
  objc_storeStrong((id *)&self->_archiveWriter, 0);
}

@end
