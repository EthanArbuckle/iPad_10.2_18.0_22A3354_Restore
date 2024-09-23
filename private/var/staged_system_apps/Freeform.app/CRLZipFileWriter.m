@implementation CRLZipFileWriter

- (CRLZipFileWriter)initWithURL:(id)a3 error:(id *)a4
{
  return -[CRLZipFileWriter initWithURL:options:error:](self, "initWithURL:options:error:", a3, 0, a4);
}

- (CRLZipFileWriter)initWithURL:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  id v8;
  CRLZipFileWriter *v9;
  CRLFileIOChannel *v10;
  CRLRandomWriteChannel *v11;
  CRLRandomWriteChannel *writeChannel;
  CRLRandomWriteChannel *v13;
  void **v15;
  uint64_t v16;
  void (*v17)(uint64_t);
  void *v18;
  id v19;
  id location;
  objc_super v21;

  v8 = a3;
  v21.receiver = self;
  v21.super_class = (Class)CRLZipFileWriter;
  v9 = -[CRLZipWriter initWithOptions:](&v21, "initWithOptions:", a4);
  if (v9)
  {
    objc_initWeak(&location, v9);
    v10 = [CRLFileIOChannel alloc];
    v15 = _NSConcreteStackBlock;
    v16 = 3221225472;
    v17 = sub_10042B878;
    v18 = &unk_10125D530;
    objc_copyWeak(&v19, &location);
    v11 = -[CRLFileIOChannel initForRandomWritingURL:error:cleanupHandler:](v10, "initForRandomWritingURL:error:cleanupHandler:", v8, a5, &v15);
    writeChannel = v9->_writeChannel;
    v9->_writeChannel = v11;

    v13 = v9->_writeChannel;
    if (v13)
    {
      -[CRLRandomWriteChannel setLowWater:](v13, "setLowWater:", -1, v15, v16, v17, v18);
    }
    else
    {

      v9 = 0;
    }
    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }

  return v9;
}

- (CRLZipFileWriter)initWithZipFileArchive:(id)a3 error:(id *)a4
{
  return -[CRLZipFileWriter initWithZipFileArchive:options:error:](self, "initWithZipFileArchive:options:error:", a3, 0, a4);
}

- (CRLZipFileWriter)initWithZipFileArchive:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  id v8;
  void *v9;
  CRLZipFileWriter *v10;
  CRLZipFileWriter *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  CRLFileIOChannel *v17;
  id *v18;
  CRLRandomWriteChannel *v19;
  CRLRandomWriteChannel *writeChannel;
  CRLRandomWriteChannel *v21;
  dispatch_semaphore_t v22;
  CRLRandomWriteChannel *v23;
  id v24;
  NSObject *v25;
  CRLZipFileWriter *v26;
  _QWORD v28[4];
  NSObject *v29;
  uint64_t *v30;
  _QWORD v31[4];
  id v32;
  id obj;
  id location;
  _QWORD v35[4];
  CRLZipFileWriter *v36;
  objc_super v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  id v43;
  char v44[32];

  v8 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "URL"));
  v38 = 0;
  v39 = &v38;
  v40 = 0x3032000000;
  v41 = sub_10042BD44;
  v42 = sub_10042BD54;
  v43 = 0;
  v37.receiver = self;
  v37.super_class = (Class)CRLZipFileWriter;
  v10 = -[CRLZipWriter initWithOptions:](&v37, "initWithOptions:", a4);
  if (!v10)
  {
    v11 = 0;
    if (!a5)
      goto LABEL_20;
LABEL_19:
    *a5 = objc_retainAutorelease((id)v39[5]);
    goto LABEL_20;
  }
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472;
  v35[2] = sub_10042BD5C;
  v35[3] = &unk_10125D558;
  v11 = v10;
  v36 = v11;
  objc_msgSend(v8, "enumerateEntriesUsingBlock:", v35);
  if ((uint64_t)objc_msgSend(v8, "endOfLastEntry") <= 0)
  {
    v12 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125D578);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E33658();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125D598);
    v13 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_ERROR))
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
      sub_100DEE33C(v14, (uint64_t)v44, v12, v13);
    }

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLZipFileWriter initWithZipFileArchive:options:error:]"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/Zip/CRLZipFileWriter.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v15, v16, 67, 0, "Unexpected offset");

  }
  -[CRLZipWriter setEntryInsertionOffset:](v11, "setEntryInsertionOffset:", objc_msgSend(v8, "endOfLastEntry"));
  objc_initWeak(&location, v11);
  v17 = [CRLFileIOChannel alloc];
  v18 = (id *)(v39 + 5);
  obj = (id)v39[5];
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_10042BDC4;
  v31[3] = &unk_10125D530;
  objc_copyWeak(&v32, &location);
  v19 = -[CRLFileIOChannel initForRandomReadingWritingURL:error:cleanupHandler:](v17, "initForRandomReadingWritingURL:error:cleanupHandler:", v9, &obj, v31);
  objc_storeStrong(v18, obj);
  writeChannel = v11->_writeChannel;
  v11->_writeChannel = v19;

  v21 = v11->_writeChannel;
  if (v21)
  {
    -[CRLRandomWriteChannel setLowWater:](v21, "setLowWater:", -1);
    v22 = dispatch_semaphore_create(0);
    v23 = v11->_writeChannel;
    v24 = objc_msgSend(v8, "endOfLastEntry");
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_10042BE2C;
    v28[3] = &unk_101236818;
    v30 = &v38;
    v25 = v22;
    v29 = v25;
    -[CRLRandomWriteChannel truncateToLength:completion:](v23, "truncateToLength:completion:", v24, v28);
    dispatch_semaphore_wait(v25, 0xFFFFFFFFFFFFFFFFLL);

  }
  if (v39[5])
  {

    v11 = 0;
  }
  objc_destroyWeak(&v32);
  objc_destroyWeak(&location);

  if (a5)
    goto LABEL_19;
LABEL_20:
  v26 = v11;
  _Block_object_dispose(&v38, 8);

  return v26;
}

- (void)copyEntriesFromZipFileWriter:(id)a3 readingFromURL:(id)a4 options:(unint64_t)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  void (**v12)(id, id);
  CRLZipFileArchive *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  id v29;

  v10 = a3;
  v11 = a4;
  v12 = (void (**)(id, id))a6;
  if ((objc_msgSend(v10, "isClosed") & 1) != 0)
  {
    v29 = 0;
    v13 = -[CRLZipFileArchive initWithWriter:forReadingFromURL:options:error:]([CRLZipFileArchive alloc], "initWithWriter:forReadingFromURL:options:error:", v10, v11, a5, &v29);
    v14 = v29;
    v15 = v14;
    if (v13)
    {
      v25 = 0;
      v26 = &v25;
      v27 = 0x2020000000;
      v28 = 0;
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472;
      v22[2] = sub_10042C224;
      v22[3] = &unk_10125D600;
      v16 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[CRLZipArchive entriesCount](v13, "entriesCount"));
      v23 = v16;
      v24 = &v25;
      -[CRLZipArchive enumerateEntriesUsingBlock:](v13, "enumerateEntriesUsingBlock:", v22);
      objc_msgSend(v16, "sortUsingComparator:", &stru_10125D640);
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSProgress progressWithTotalUnitCount:](NSProgress, "progressWithTotalUnitCount:", v26[3]));
      -[CRLZipFileWriter copyRemainingEntries:fromArchive:progress:completionHandler:](self, "copyRemainingEntries:fromArchive:progress:completionHandler:", v16, v13, v17, v12);

      _Block_object_dispose(&v25, 8);
    }
    else if (v12)
    {
      if (v14)
      {
        v12[2](v12, v14);
      }
      else
      {
        v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSError crl_fileWriteUnknownErrorWithUserInfo:](NSError, "crl_fileWriteUnknownErrorWithUserInfo:", 0));
        v12[2](v12, v21);

      }
    }

    goto LABEL_15;
  }
  +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_10125D5B8);
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
    sub_100E33774();
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_10125D5D8);
  v18 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
    sub_100E336DC(v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLZipFileWriter copyEntriesFromZipFileWriter:readingFromURL:options:completionHandler:]"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/Zip/CRLZipFileWriter.m"));
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v19, v20, 110, 0, "Closed writer must be closed.");

  if (v12)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSError crl_fileWriteUnknownErrorWithUserInfo:](NSError, "crl_fileWriteUnknownErrorWithUserInfo:", 0));
    v12[2](v12, v15);
LABEL_15:

  }
}

- (void)copyRemainingEntries:(id)a3 fromArchive:(id)a4 progress:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  _QWORD v27[4];
  id v28;
  id v29;
  CRLZipFileWriter *v30;
  id v31;
  id v32;
  id v33;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "firstObject"));
  if (v14)
  {
    objc_msgSend(v10, "removeObjectAtIndex:", 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "streamReadChannelForEntry:", v14));
    if (v15)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "name"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "lastModificationDate"));
      v26 = objc_msgSend(v14, "size");
      v18 = v15;
      v19 = objc_msgSend(v14, "CRC");
      v27[0] = _NSConcreteStackBlock;
      v27[1] = 3221225472;
      v27[2] = sub_10042C654;
      v27[3] = &unk_10125D6A8;
      v33 = v13;
      v28 = v12;
      v29 = v14;
      v30 = self;
      v31 = v10;
      v32 = v11;
      v20 = v19;
      v15 = v18;
      -[CRLZipWriter writeEntryWithName:force32BitSize:lastModificationDate:size:CRC:fromReadChannel:completion:](self, "writeEntryWithName:force32BitSize:lastModificationDate:size:CRC:fromReadChannel:completion:", v16, 0, v17, v26, v20, v18, v27);

      v21 = v33;
    }
    else
    {
      v22 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10125D660);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E3389C();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10125D680);
      v23 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E337F8(v23, v22);
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLZipFileWriter copyRemainingEntries:fromArchive:progress:completionHandler:]"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/Zip/CRLZipFileWriter.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v24, v25, 154, 0, "invalid nil value for '%{public}s'", "channel");

      if (!v13)
        goto LABEL_17;
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSError crl_fileWriteUnknownErrorWithUserInfo:](NSError, "crl_fileWriteUnknownErrorWithUserInfo:", 0));
      (*((void (**)(id, void *))v13 + 2))(v13, v21);
    }

LABEL_17:
    goto LABEL_18;
  }
  if (v13)
    (*((void (**)(id, _QWORD))v13 + 2))(v13, 0);
LABEL_18:

}

- (id)prepareWriteChannelWithCloseCompletionHandler:(id)a3
{
  id v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id writeChannelCompletionHandler;
  CRLRandomWriteChannel *writeChannel;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  CRLRandomWriteChannel *v16;

  v4 = a3;
  if (self->_writeChannelCompletionHandler)
  {
    v5 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125D6C8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E339B4();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125D6E8);
    v6 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E337F8(v6, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLZipFileWriter prepareWriteChannelWithCloseCompletionHandler:]"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/Zip/CRLZipFileWriter.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 175, 0, "expected nil value for '%{public}s'", "_writeChannelCompletionHandler");

  }
  v9 = objc_msgSend(v4, "copy");
  writeChannelCompletionHandler = self->_writeChannelCompletionHandler;
  self->_writeChannelCompletionHandler = v9;

  writeChannel = self->_writeChannel;
  if (!writeChannel)
  {
    v12 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125D708);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E33928();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125D728);
    v13 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E337F8(v13, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLZipFileWriter prepareWriteChannelWithCloseCompletionHandler:]"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/Zip/CRLZipFileWriter.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v14, v15, 178, 0, "invalid nil value for '%{public}s'", "_writeChannel");

    writeChannel = self->_writeChannel;
  }
  v16 = writeChannel;

  return v16;
}

- (void)truncateToOffsetImpl:(int64_t)a3 completion:(id)a4
{
  -[CRLRandomWriteChannel truncateToLength:completion:](self->_writeChannel, "truncateToLength:completion:", a3, a4);
}

+ (void)zipDirectoryAtURL:(id)a3 toURL:(id)a4 queue:(id)a5 completion:(id)a6
{
  id v10;
  _QWORD v11[4];
  id v12;

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10042CB44;
  v11[3] = &unk_10125D750;
  v12 = a6;
  v10 = v12;
  objc_msgSend(a1, "zipDirectoryAtURL:customDirectoryFilename:toURL:queue:progressHandler:", a3, 0, a4, a5, v11);

}

+ (void)zipDirectoryAtURL:(id)a3 customDirectoryFilename:(id)a4 toURL:(id)a5 queue:(id)a6 progressHandler:(id)a7
{
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  uint64_t v35;
  void *v36;
  void *v37;
  unsigned int v38;
  id v39;
  void *v40;
  unsigned int v41;
  id v42;
  void *v43;
  unsigned int v44;
  NSObject *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  uint64_t v52;
  void *i;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  uint64_t v59;
  CRLFileIOChannel *v60;
  id *v61;
  id v62;
  unsigned __int8 v63;
  id v64;
  void *v65;
  unsigned __int8 v66;
  id v67;
  void *v68;
  id v69;
  char *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  NSObject *queue;
  id v76;
  id v77;
  CRLZipFileWriter *v78;
  id v79;
  id v80;
  uint64_t v81;
  id obj;
  _QWORD v83[4];
  id v84;
  uint8_t *v85;
  uint64_t v86;
  _QWORD v87[4];
  id v88;
  _QWORD *v89;
  uint8_t *v90;
  uint64_t v91;
  id v92;
  id v93;
  id v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  id v99;
  id v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  _QWORD v105[4];
  _QWORD block[4];
  id v107;
  id v108;
  id v109;
  uint8_t v110[128];
  uint8_t buf[8];
  _BYTE v112[40];
  _BYTE v113[128];
  _QWORD v114[2];

  v11 = a3;
  v77 = a4;
  v12 = a5;
  queue = a6;
  v79 = a7;
  v74 = v11;
  if (!v11)
  {
    v13 = v12;
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125D770);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E33E44();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125D790);
    v14 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E33DAC(v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLZipFileWriter zipDirectoryAtURL:customDirectoryFilename:toURL:queue:progressHandler:]"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/Zip/CRLZipFileWriter.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v15, v16, 197, 0, "invalid nil value for '%{public}s'", "directoryURL");

    v12 = v13;
  }
  v73 = v12;
  if (!v12)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125D7B0);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E33D20();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125D7D0);
    v17 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E33C88(v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLZipFileWriter zipDirectoryAtURL:customDirectoryFilename:toURL:queue:progressHandler:]"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/Zip/CRLZipFileWriter.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v18, v19, 198, 0, "invalid nil value for '%{public}s'", "URL");

  }
  if (!queue)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125D7F0);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E33BFC();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125D810);
    v20 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E33B64(v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLZipFileWriter zipDirectoryAtURL:customDirectoryFilename:toURL:queue:progressHandler:]"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/Zip/CRLZipFileWriter.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v21, v22, 199, 0, "invalid nil value for '%{public}s'", "queue");

  }
  if (!v79)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125D830);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E33AD8();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125D850);
    v23 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E33A40(v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLZipFileWriter zipDirectoryAtURL:customDirectoryFilename:toURL:queue:progressHandler:]"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/Zip/CRLZipFileWriter.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v24, v25, 200, 0, "invalid nil value for '%{public}s'", "progressHandler");

  }
  v109 = 0;
  v78 = -[CRLZipFileWriter initWithURL:error:]([CRLZipFileWriter alloc], "initWithURL:error:", v73, &v109);
  v26 = v109;
  v72 = v26;
  if (!v78)
  {
    v49 = v26;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10042DAB8;
    block[3] = &unk_10122C360;
    v108 = v79;
    v107 = v49;
    dispatch_async(queue, block);

    v50 = v108;
    goto LABEL_86;
  }
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "path"));
  v28 = v27;
  if (!v77)
  {
    v29 = objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "stringByDeletingLastPathComponent"));

    v28 = (void *)v29;
  }
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "stringByStandardizingPath"));
  v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "precomposedStringWithCanonicalMapping"));

  v70 = (char *)objc_msgSend(v71, "length");
  v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v114[0] = NSURLIsDirectoryKey;
  v114[1] = NSURLFileSizeKey;
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v114, 2));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v11, v32, 0, 0));

  v105[0] = 0;
  v105[1] = v105;
  v105[2] = 0x2020000000;
  v105[3] = 0;
  v80 = objc_alloc_init((Class)NSMutableArray);
  v103 = 0u;
  v104 = 0u;
  v101 = 0u;
  v102 = 0u;
  obj = v33;
  v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v101, v113, 16);
  if (!v34)
  {
    v81 = 0;
    goto LABEL_69;
  }
  v81 = 0;
  v35 = *(_QWORD *)v102;
  do
  {
    v36 = 0;
    do
    {
      if (*(_QWORD *)v102 != v35)
        objc_enumerationMutation(obj);
      v37 = *(void **)(*((_QWORD *)&v101 + 1) + 8 * (_QWORD)v36);
      v100 = 0;
      v38 = objc_msgSend(v37, "getResourceValue:forKey:error:", &v100, NSURLIsDirectoryKey, 0);
      v39 = v100;
      v40 = v39;
      if (v38)
      {
        if ((objc_msgSend(v39, "BOOLValue") & 1) != 0)
          goto LABEL_64;
        v99 = 0;
        v41 = objc_msgSend(v37, "getResourceValue:forKey:error:", &v99, NSURLFileSizeKey, 0);
        v42 = v99;
        v43 = v42;
        if (v41)
          v81 += (uint64_t)objc_msgSend(v42, "unsignedLongLongValue");
        objc_msgSend(v80, "addObject:", v37);
      }
      else
      {
        v44 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_10125D870);
        v45 = off_1013D9070;
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67110146;
          *(_DWORD *)&buf[4] = v44;
          *(_WORD *)v112 = 2082;
          *(_QWORD *)&v112[2] = "+[CRLZipFileWriter zipDirectoryAtURL:customDirectoryFilename:toURL:queue:progressHandler:]";
          *(_WORD *)&v112[10] = 2082;
          *(_QWORD *)&v112[12] = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/Zip/CRLZipFileWriter.m";
          *(_WORD *)&v112[20] = 1024;
          *(_DWORD *)&v112[22] = 237;
          *(_WORD *)&v112[26] = 2112;
          *(_QWORD *)&v112[28] = v37;
          _os_log_error_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Failed to obtain resource value for %@", buf, 0x2Cu);
        }
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_10125D890);
        v46 = off_1013D9070;
        if (os_log_type_enabled((os_log_t)v46, OS_LOG_TYPE_ERROR))
        {
          v48 = (void *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)&buf[4] = v44;
          *(_WORD *)v112 = 2114;
          *(_QWORD *)&v112[2] = v48;
          _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v46, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);

        }
        v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLZipFileWriter zipDirectoryAtURL:customDirectoryFilename:toURL:queue:progressHandler:]"));
        v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/Zip/CRLZipFileWriter.m"));
        +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v43, v47, 237, 0, "Failed to obtain resource value for %@", v37);

      }
LABEL_64:

      v36 = (char *)v36 + 1;
    }
    while (v34 != v36);
    v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v101, v113, 16);
  }
  while (v34);
LABEL_69:

  *(_QWORD *)buf = 0;
  *(_QWORD *)v112 = buf;
  *(_QWORD *)&v112[8] = 0x3032000000;
  *(_QWORD *)&v112[16] = sub_10042BD44;
  *(_QWORD *)&v112[24] = sub_10042BD54;
  *(_QWORD *)&v112[32] = 0;
  v95 = 0u;
  v96 = 0u;
  v97 = 0u;
  v98 = 0u;
  v76 = v80;
  v51 = objc_msgSend(v76, "countByEnumeratingWithState:objects:count:", &v95, v110, 16);
  if (v51)
  {
    v52 = *(_QWORD *)v96;
    while (2)
    {
      for (i = 0; i != v51; i = (char *)i + 1)
      {
        if (*(_QWORD *)v96 != v52)
          objc_enumerationMutation(v76);
        v54 = *(void **)(*((_QWORD *)&v95 + 1) + 8 * (_QWORD)i);
        v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "path"));
        v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "stringByStandardizingPath"));
        v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "precomposedStringWithCanonicalMapping"));

        v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "substringFromIndex:", v70 + 1));
        if (v77)
        {
          v59 = objc_claimAutoreleasedReturnValue(objc_msgSend(v77, "stringByAppendingPathComponent:", v58));

          v58 = (void *)v59;
        }
        v60 = [CRLFileIOChannel alloc];
        v61 = (id *)(*(_QWORD *)v112 + 40);
        v94 = *(id *)(*(_QWORD *)v112 + 40);
        v62 = -[CRLFileIOChannel initForReadingURL:error:](v60, "initForReadingURL:error:", v54, &v94);
        objc_storeStrong(v61, v94);
        if (!v62)
        {

          goto LABEL_85;
        }
        v93 = 0;
        v63 = objc_msgSend(v54, "getResourceValue:forKey:error:", &v93, NSURLFileSizeKey, 0);
        v64 = v93;
        v65 = v64;
        if ((v63 & 1) == 0)
        {

          v65 = 0;
        }
        v92 = 0;
        v66 = objc_msgSend(v54, "getResourceValue:forKey:error:", &v92, NSURLContentModificationDateKey, 0);
        v67 = v92;
        v68 = v67;
        if ((v66 & 1) == 0)
        {

          v68 = 0;
        }
        v69 = objc_msgSend(v65, "unsignedLongLongValue");
        v87[0] = _NSConcreteStackBlock;
        v87[1] = 3221225472;
        v87[2] = sub_10042DB54;
        v87[3] = &unk_10125D8B8;
        v89 = v105;
        v88 = v79;
        v90 = buf;
        v91 = v81;
        -[CRLZipWriter writeEntryWithName:force32BitSize:lastModificationDate:size:CRC:fromReadChannel:writeHandler:](v78, "writeEntryWithName:force32BitSize:lastModificationDate:size:CRC:fromReadChannel:writeHandler:", v58, 0, v68, v69, 0, v62, v87);

      }
      v51 = objc_msgSend(v76, "countByEnumeratingWithState:objects:count:", &v95, v110, 16);
      if (v51)
        continue;
      break;
    }
  }
LABEL_85:

  v83[0] = _NSConcreteStackBlock;
  v83[1] = 3221225472;
  v83[2] = sub_10042DC2C;
  v83[3] = &unk_10125D8E0;
  v84 = v79;
  v85 = buf;
  v86 = v81;
  -[CRLZipWriter closeWithQueue:completion:](v78, "closeWithQueue:completion:", queue, v83);

  _Block_object_dispose(buf, 8);
  _Block_object_dispose(v105, 8);

  v50 = v71;
LABEL_86:

}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_writeChannelCompletionHandler, 0);
  objc_storeStrong((id *)&self->_writeChannel, 0);
}

@end
