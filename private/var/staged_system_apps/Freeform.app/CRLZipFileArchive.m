@implementation CRLZipFileArchive

+ (BOOL)isZipArchiveAtURL:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  unsigned __int8 v10;
  void *v11;
  id v12;
  id v13;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "path"));
  if (objc_msgSend(v7, "length"))
  {
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "path")));
    v9 = open((const char *)objc_msgSend(v8, "fileSystemRepresentation"), 0, 0);

    if ((v9 & 0x80000000) != 0)
    {
      v12 = +[NSError crl_fileReadPOSIXErrorWithNumber:userInfo:](NSError, "crl_fileReadPOSIXErrorWithNumber:userInfo:", *__error(), 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue(v12);
      v10 = 0;
      if (!a4)
        goto LABEL_12;
      goto LABEL_8;
    }
    v10 = objc_msgSend(a1, "isZipArchiveAtFD:", v9);
    close(v9);
  }
  else
  {
    v10 = 0;
  }
  v11 = 0;
  if (!a4)
    goto LABEL_12;
LABEL_8:
  if ((v10 & 1) == 0)
  {
    if (v11)
    {
      *a4 = objc_retainAutorelease(v11);
    }
    else
    {
      v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[NSError crl_fileReadUnknownErrorWithUserInfo:](NSError, "crl_fileReadUnknownErrorWithUserInfo:", 0)));
      *a4 = v13;

    }
  }
LABEL_12:

  return v10;
}

+ (BOOL)isZipSignatureAllZerosAtURL:(id)a3
{
  id v3;
  int v4;
  ssize_t v5;
  uint8x8_t v6;
  BOOL v7;
  BOOL v8;
  __int32 v10;

  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "path")));
  v4 = open((const char *)objc_msgSend(v3, "fileSystemRepresentation"), 0, 0);

  if (v4 < 0)
    return 0;
  v5 = read(v4, &v10, 4uLL);
  v6.i32[0] = v10;
  if (vmovn_s16((int16x8_t)vmovl_u8(v6)).u32[0])
    v7 = 0;
  else
    v7 = v5 == 4;
  v8 = v7;
  close(v4);
  return v8;
}

+ (BOOL)isZipArchiveAtFD:(int)a3
{
  off_t v4;
  off_t v5;
  BOOL v7;
  int v9;

  v4 = lseek(a3, 0, 1);
  v5 = v4;
  if ((unint64_t)(v4 - 1) > 0xFFFFFFFFFFFFFFFDLL)
  {
    if (v4 == -1)
      return 0;
  }
  else if (lseek(a3, 0, 0) == -1)
  {
    goto LABEL_12;
  }
  if (read(a3, &v9, 4uLL) == 4)
  {
    v7 = v9 == 67324752 || v9 == 101010256;
    return lseek(a3, v5, 0) != -1 && v7;
  }
LABEL_12:
  v7 = 0;
  return lseek(a3, v5, 0) != -1 && v7;
}

- (id)URL
{
  return self->_URL;
}

+ (void)readArchiveFromURL:(id)a3 options:(unint64_t)a4 queue:(id)a5 completion:(id)a6
{
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD block[4];
  id v16;
  NSObject *v17;
  id v18;

  v10 = a6;
  v11 = a5;
  v12 = a3;
  v18 = 0;
  v13 = objc_msgSend(objc_alloc((Class)a1), "initForReadingFromURL:options:error:", v12, a4, &v18);

  v14 = v18;
  if (v13)
  {
    objc_msgSend(v13, "readArchiveWithQueue:completion:", v11, v10);
  }
  else
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000B994;
    block[3] = &unk_10122C360;
    v17 = v10;
    v16 = v14;
    dispatch_async(v11, block);

    v11 = v17;
  }

}

+ (id)zipArchiveFromURL:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  id v8;
  unsigned int v9;
  dispatch_semaphore_t v10;
  dispatch_queue_global_t global_queue;
  void *v12;
  NSObject *v13;
  void *v14;
  id v15;
  id v16;
  _QWORD v18[4];
  NSObject *v19;
  uint64_t *v20;
  uint64_t *v21;
  id obj;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;

  v8 = a3;
  v29 = 0;
  v30 = &v29;
  v31 = 0x3032000000;
  v32 = sub_10000BBF8;
  v33 = sub_10000BC08;
  v34 = 0;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = sub_10000BBF8;
  v27 = sub_10000BC08;
  v28 = 0;
  obj = 0;
  v9 = objc_msgSend(a1, "isZipArchiveAtURL:error:", v8, &obj);
  objc_storeStrong(&v28, obj);
  if (v9)
  {
    v10 = dispatch_semaphore_create(0);
    global_queue = dispatch_get_global_queue(0, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue(global_queue);
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10000BC10;
    v18[3] = &unk_10122C388;
    v20 = &v29;
    v21 = &v23;
    v13 = v10;
    v19 = v13;
    objc_msgSend(a1, "readArchiveFromURL:options:queue:completion:", v8, a4, v12, v18);
    dispatch_semaphore_wait(v13, 0xFFFFFFFFFFFFFFFFLL);

  }
  if (a5 && !v30[5])
  {
    v14 = (void *)v24[5];
    if (v14)
    {
      *a5 = objc_retainAutorelease(v14);
    }
    else
    {
      v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[NSError crl_fileReadUnknownErrorWithUserInfo:](NSError, "crl_fileReadUnknownErrorWithUserInfo:", 0)));
      *a5 = v15;

    }
  }
  v16 = (id)v30[5];
  _Block_object_dispose(&v23, 8);

  _Block_object_dispose(&v29, 8);
  return v16;
}

- (id)initForReadingFromURL:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  CRLZipFileArchive *v12;
  dispatch_queue_attr_t v13;
  NSObject *v14;
  dispatch_queue_t v15;
  OS_dispatch_queue *accessQueue;
  objc_super v18;

  v8 = a3;
  if ((objc_msgSend(v8, "isFileURL") & 1) == 0)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10122C3A8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7858();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10122C3C8);
    v9 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLZipFileArchive initForReadingFromURL:options:error:]"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/Zip/CRLZipFileArchive.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v10, v11, 170, 0, "Need a file URL");

  }
  v18.receiver = self;
  v18.super_class = (Class)CRLZipFileArchive;
  v12 = -[CRLZipArchive initWithOptions:](&v18, "initWithOptions:", a4);
  if (v12)
  {
    v13 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v14 = objc_claimAutoreleasedReturnValue(v13);
    v15 = dispatch_queue_create("CRLZipFileArchive.Access", v14);
    accessQueue = v12->_accessQueue;
    v12->_accessQueue = (OS_dispatch_queue *)v15;

    if (!-[CRLZipFileArchive openWithURL:error:](v12, "openWithURL:error:", v8, a5))
    {

      v12 = 0;
    }
  }

  return v12;
}

- (BOOL)openWithURL:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSURL *v10;
  NSURL *URL;
  unsigned int v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  CRLZipFileDescriptorWrapper *v18;
  CRLZipFileDescriptorWrapper *fdWrapper;
  uint64_t v20;
  BOOL v21;
  void *v22;
  id v23;
  uint64_t v24;
  CRLZipFileDescriptorWrapper *v25;
  void *v26;
  id v28;
  id v29;

  v6 = a3;
  if (self->_fdWrapper)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10122C3E8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7A30();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10122C408);
    v7 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLZipFileArchive openWithURL:error:]"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/Zip/CRLZipFileArchive.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v8, v9, 188, 0, "Shouldn't open the archive if it's already open.");

  }
  v10 = (NSURL *)objc_msgSend(v6, "copy");
  URL = self->_URL;
  self->_URL = v10;

  objc_msgSend(v6, "removeCachedResourceValueForKey:", NSURLFileSizeKey);
  v28 = 0;
  v29 = 0;
  v12 = objc_msgSend(v6, "getResourceValue:forKey:error:", &v29, NSURLFileSizeKey, &v28);
  v13 = v29;
  v14 = v28;
  if (v12)
  {
    self->_archiveLength = (unint64_t)objc_msgSend(v13, "unsignedLongLongValue");
    v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "path")));
    v16 = open((const char *)objc_msgSend(v15, "fileSystemRepresentation"), 0, 0);

    if ((v16 & 0x80000000) != 0)
    {
      v23 = +[NSError crl_fileReadPOSIXErrorWithNumber:userInfo:](NSError, "crl_fileReadPOSIXErrorWithNumber:userInfo:", *__error(), 0);
      v24 = objc_claimAutoreleasedReturnValue(v23);
    }
    else
    {
      if ((-[CRLZipArchive options](self, "options") & 0x10) != 0 && fcntl(v16, 48, 1) == -1)
      {
        if (qword_10147E368 != -1)
          dispatch_once(&qword_10147E368, &stru_10122C428);
        v17 = off_1013D9068;
        if (os_log_type_enabled((os_log_t)off_1013D9068, OS_LOG_TYPE_ERROR))
          sub_100DE78D8(v17);
      }
      v18 = -[CRLZipFileDescriptorWrapper initWithFileDescriptor:]([CRLZipFileDescriptorWrapper alloc], "initWithFileDescriptor:", v16);
      fdWrapper = self->_fdWrapper;
      self->_fdWrapper = v18;

      if (self->_fdWrapper)
      {
        if ((objc_msgSend((id)objc_opt_class(self, v20), "isZipArchiveAtFD:", v16) & 1) != 0)
        {
          v21 = 1;
          if (!a4)
            goto LABEL_35;
          goto LABEL_33;
        }
        v25 = self->_fdWrapper;
        self->_fdWrapper = 0;

        v24 = objc_claimAutoreleasedReturnValue(+[NSError crl_fileReadCorruptedFileErrorWithUserInfo:](NSError, "crl_fileReadCorruptedFileErrorWithUserInfo:", 0));
      }
      else
      {
        v24 = objc_claimAutoreleasedReturnValue(+[NSError crl_fileReadUnknownErrorWithUserInfo:](NSError, "crl_fileReadUnknownErrorWithUserInfo:", 0));
      }
    }
    v26 = (void *)v24;

    v21 = 0;
    v14 = v26;
    if (!a4)
      goto LABEL_35;
    goto LABEL_33;
  }
  if (qword_10147E368 != -1)
    dispatch_once(&qword_10147E368, &stru_10122C448);
  v22 = off_1013D9068;
  if (os_log_type_enabled((os_log_t)off_1013D9068, OS_LOG_TYPE_ERROR))
    sub_100DE794C((uint64_t)v6, v22, v14);
  v21 = 0;
  if (a4)
  {
LABEL_33:
    if (v14)
      *a4 = objc_retainAutorelease(v14);
  }
LABEL_35:

  return v21;
}

- (CRLZipFileArchive)initWithWriter:(id)a3 forReadingFromURL:(id)a4 options:(unint64_t)a5 error:(id *)a6
{
  id v10;
  id v11;
  CRLZipFileArchive *v12;
  CRLZipFileArchive *v13;
  id archiveLength;
  CRLZipFileArchive *v15;
  unsigned int v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v23;
  unint64_t v24;
  NSObject *log;
  _QWORD v26[4];
  CRLZipFileArchive *v27;
  uint8_t buf[4];
  unsigned int v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  const char *v33;
  __int16 v34;
  int v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  unint64_t v39;
  __int16 v40;
  id v41;

  v10 = a3;
  v11 = a4;
  v12 = -[CRLZipFileArchive initForReadingFromURL:options:error:](self, "initForReadingFromURL:options:error:", v11, a5, a6);
  if (v12)
  {
    v13 = v12;
    archiveLength = (id)v12->_archiveLength;
    if (archiveLength == objc_msgSend(v10, "archiveLength"))
    {
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472;
      v26[2] = sub_10000C698;
      v26[3] = &unk_10122C470;
      v15 = v13;
      v27 = v15;
      objc_msgSend(v10, "enumerateEntriesUsingBlock:", v26);
      v13 = v27;
    }
    else
    {
      v16 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10122C490);
      v17 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      {
        log = v17;
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "path"));
        v24 = v13->_archiveLength;
        *(_DWORD *)buf = 67110658;
        v29 = v16;
        v30 = 2082;
        v31 = "-[CRLZipFileArchive initWithWriter:forReadingFromURL:options:error:]";
        v32 = 2082;
        v33 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/Zip/CRLZipFileArchive.m";
        v34 = 1024;
        v35 = 250;
        v36 = 2112;
        v37 = v23;
        v38 = 2048;
        v39 = v24;
        v40 = 2048;
        v41 = objc_msgSend(v10, "archiveLength");
        _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Length of archive at %@ doesn't match archive length of writer. %llu != %llu", buf, 0x40u);

      }
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10122C4B0);
      v18 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLZipFileArchive initWithWriter:forReadingFromURL:options:error:]"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/Zip/CRLZipFileArchive.m"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "path"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v19, v20, 250, 0, "Length of archive at %@ doesn't match archive length of writer. %llu != %llu", v21, v13->_archiveLength, objc_msgSend(v10, "archiveLength"));

      v15 = 0;
    }

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (void)dealloc
{
  CRLZipFileDescriptorWrapper *fdWrapper;
  objc_super v4;

  self->_archiveLength = 0;
  fdWrapper = self->_fdWrapper;
  self->_fdWrapper = 0;

  -[CRLZipFileArchive removeTemporaryDirectory](self, "removeTemporaryDirectory");
  v4.receiver = self;
  v4.super_class = (Class)CRLZipFileArchive;
  -[CRLZipFileArchive dealloc](&v4, "dealloc");
}

- (void)createTemporaryDirectoryRelativeToURL:(id)a3
{
  id v4;
  void *v5;
  NSURL *v6;
  NSURL *v7;
  CRLTemporaryDirectory *v8;
  NSURL *v9;
  NSURL *temporaryDirectoryURL;
  id v11;

  v4 = a3;
  if (!self->_temporaryDirectoryURL)
  {
    v11 = v4;
    if (!v4
      || (v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager")),
          v6 = (NSURL *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "URLForDirectory:inDomain:appropriateForURL:create:error:", 99, 1, v11, 1, 0)), v7 = self->_temporaryDirectoryURL, self->_temporaryDirectoryURL = v6, v7, v5, v4 = v11, !self->_temporaryDirectoryURL))
    {
      v8 = -[CRLTemporaryDirectory initWithSignature:error:]([CRLTemporaryDirectory alloc], "initWithSignature:error:", CFSTR("ZipFile"), 0);
      -[CRLTemporaryDirectory leakTemporaryDirectory](v8, "leakTemporaryDirectory");
      v9 = (NSURL *)objc_claimAutoreleasedReturnValue(-[CRLTemporaryDirectory URL](v8, "URL"));
      temporaryDirectoryURL = self->_temporaryDirectoryURL;
      self->_temporaryDirectoryURL = v9;

      v4 = v11;
    }
  }

}

- (void)removeTemporaryDirectory
{
  void *v3;
  NSURL *temporaryDirectoryURL;
  unsigned __int8 v5;
  id v6;
  void *v7;
  NSURL *v8;
  id v9;

  if (self->_temporaryDirectoryURL)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    temporaryDirectoryURL = self->_temporaryDirectoryURL;
    v9 = 0;
    v5 = objc_msgSend(v3, "removeItemAtURL:error:", temporaryDirectoryURL, &v9);
    v6 = v9;

    if ((v5 & 1) == 0)
    {
      if (qword_10147E368 != -1)
        dispatch_once(&qword_10147E368, &stru_10122C4D0);
      v7 = off_1013D9068;
      if (os_log_type_enabled((os_log_t)off_1013D9068, OS_LOG_TYPE_ERROR))
        sub_100DE7AB0(v7, v6);
    }
    v8 = self->_temporaryDirectoryURL;
    self->_temporaryDirectoryURL = 0;

  }
}

- (BOOL)reopenWithTemporaryURL:(id)a3 error:(id *)a4
{
  unint64_t archiveLength;
  id *p_fdWrapper;
  CRLZipFileDescriptorWrapper *fdWrapper;
  CRLZipFileDescriptorWrapper *v10;
  id v11;
  id v12;
  BOOL v13;

  archiveLength = self->_archiveLength;
  p_fdWrapper = (id *)&self->_fdWrapper;
  fdWrapper = self->_fdWrapper;
  v10 = fdWrapper;
  self->_archiveLength = 0;
  v11 = *p_fdWrapper;
  *p_fdWrapper = 0;
  v12 = a3;

  v13 = -[CRLZipFileArchive openWithURL:error:](self, "openWithURL:error:", v12, a4);
  if (!v13)
  {
    self->_archiveLength = archiveLength;
    objc_storeStrong(p_fdWrapper, fdWrapper);
  }

  return v13;
}

- (BOOL)copyToTemporaryLocationRelativeToURL:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *accessQueue;
  id v8;
  void *v9;
  id v10;
  char v11;
  void **v13;
  uint64_t v14;
  void (*v15)(uint64_t);
  void *v16;
  CRLZipFileArchive *v17;
  id v18;
  uint64_t *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  char v30;

  v6 = a3;
  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v30 = 0;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = sub_10000BBF8;
  v25 = sub_10000BC08;
  accessQueue = self->_accessQueue;
  v26 = 0;
  v13 = _NSConcreteStackBlock;
  v14 = 3221225472;
  v15 = sub_10000CB8C;
  v16 = &unk_10122C5C8;
  v17 = self;
  v8 = v6;
  v18 = v8;
  v19 = &v21;
  v20 = &v27;
  dispatch_sync(accessQueue, &v13);
  if (a4 && !*((_BYTE *)v28 + 24))
  {
    v9 = (void *)v22[5];
    if (v9)
    {
      *a4 = objc_retainAutorelease(v9);
    }
    else
    {
      v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[NSError crl_fileReadUnknownErrorWithUserInfo:](NSError, "crl_fileReadUnknownErrorWithUserInfo:", 0, v13, v14, v15, v16, v17)));
      *a4 = v10;

    }
  }
  v11 = *((_BYTE *)v28 + 24);

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);

  return v11;
}

- (unint64_t)archiveLength
{
  NSObject *accessQueue;
  unint64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10000D400;
  v5[3] = &unk_10122C5F0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)newArchiveReadChannel
{
  NSObject *accessQueue;
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
  v9 = sub_10000BBF8;
  v10 = sub_10000BC08;
  v11 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10000D4D8;
  v5[3] = &unk_10122C6A0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (BOOL)isValid
{
  NSObject *accessQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10000D82C;
  v5[3] = &unk_10122C6A0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)debugDescription
{
  CRLDescription *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  objc_super v10;

  v3 = +[CRLDescription descriptionWithObject:class:](CRLDescription, "descriptionWithObject:class:", self, objc_opt_class(self, a2));
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%qu"), self->_archiveLength));
  objc_msgSend(v4, "addField:value:", CFSTR("archiveLength"), v5);

  v10.receiver = self;
  v10.super_class = (Class)CRLZipFileArchive;
  v6 = -[CRLZipArchive debugDescription](&v10, "debugDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  objc_msgSend(v4, "addFieldValue:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "descriptionString"));
  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_URL, 0);
  objc_storeStrong((id *)&self->_temporaryDirectoryURL, 0);
  objc_storeStrong((id *)&self->_fdWrapper, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
}

@end
