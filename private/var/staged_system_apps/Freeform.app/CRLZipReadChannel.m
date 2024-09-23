@implementation CRLZipReadChannel

- (CRLZipReadChannel)initWithEntry:(id)a3 archive:(id)a4 validateCRC:(BOOL)a5
{
  id v9;
  id v10;
  CRLZipReadChannel *v11;
  CRLZipReadChannel *v12;
  CRLReadChannel *v13;
  CRLReadChannel *archiveReadChannel;
  void *v15;
  void *v16;
  void *v17;
  objc_super v19;

  v9 = a3;
  v10 = a4;
  v19.receiver = self;
  v19.super_class = (Class)CRLZipReadChannel;
  v11 = -[CRLZipReadChannel init](&v19, "init");
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_entry, a3);
    objc_storeStrong((id *)&v12->_archive, a4);
    v12->_validateCRC = a5;
    v13 = (CRLReadChannel *)objc_msgSend(v10, "newArchiveReadChannel");
    archiveReadChannel = v12->_archiveReadChannel;
    v12->_archiveReadChannel = v13;

    if (!v12->_archiveReadChannel)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101256490);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E28520();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_1012564B0);
      v15 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLZipReadChannel initWithEntry:archive:validateCRC:]"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/Zip/CRLZipReadChannel.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v16, v17, 35, 0, "Archive is closed");

      v12 = 0;
    }
  }

  return v12;
}

- (void)dealloc
{
  objc_super v3;

  -[CRLZipReadChannel close](self, "close");
  v3.receiver = self;
  v3.super_class = (Class)CRLZipReadChannel;
  -[CRLZipReadChannel dealloc](&v3, "dealloc");
}

- (void)readWithHandler:(id)a3
{
  id v4;
  unint64_t v5;
  unint64_t v6;
  unsigned int v7;
  unsigned int v8;
  id v9;
  CRLReadChannel *archiveReadChannel;
  unint64_t v11;
  _QWORD v12[5];
  id v13;
  _QWORD *v14;
  _QWORD *v15;
  _QWORD *v16;
  _QWORD *v17;
  unint64_t v18;
  _QWORD v19[3];
  int v20;
  _QWORD v21[3];
  char v22;
  _QWORD v23[3];
  char v24;
  _QWORD v25[5];
  id v26;

  v4 = a3;
  v5 = -[CRLZipEntry compressedSize](self->_entry, "compressedSize");
  v6 = -[CRLZipEntry fileHeaderLength](self->_entry, "fileHeaderLength");
  if (v6)
  {
    -[CRLZipReadChannel readWithFileHeaderLength:handler:](self, "readWithFileHeaderLength:handler:", v6, v4);
  }
  else
  {
    v7 = -[CRLZipEntry nameLength](self->_entry, "nameLength");
    v8 = -[CRLZipEntry extraFieldsLength](self->_entry, "extraFieldsLength");
    v25[0] = 0;
    v25[1] = v25;
    v25[2] = 0x3032000000;
    v25[3] = sub_100385CA0;
    v25[4] = sub_100385CB0;
    v9 = &_dispatch_data_empty;
    v26 = &_dispatch_data_empty;
    v23[0] = 0;
    v23[1] = v23;
    v23[2] = 0x2020000000;
    v24 = 0;
    v21[0] = 0;
    v21[1] = v21;
    v21[2] = 0x2020000000;
    v22 = 1;
    v19[0] = 0;
    v19[1] = v19;
    v19[2] = 0x2020000000;
    v20 = 0;
    v20 = crc32(0, 0, 0);
    archiveReadChannel = self->_archiveReadChannel;
    v11 = -[CRLZipEntry offset](self->_entry, "offset");
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100385CB8;
    v12[3] = &unk_1012564F8;
    v14 = v21;
    v12[4] = self;
    v13 = v4;
    v15 = v25;
    v16 = v23;
    v17 = v19;
    v18 = v7 + (unint64_t)v8 + 30;
    -[CRLReadChannel readFromOffset:length:handler:](archiveReadChannel, "readFromOffset:length:handler:", v11, v18 + v5, v12);

    _Block_object_dispose(v19, 8);
    _Block_object_dispose(v21, 8);
    _Block_object_dispose(v23, 8);
    _Block_object_dispose(v25, 8);

  }
}

- (void)readFromOffset:(int64_t)a3 length:(unint64_t)a4 handler:(id)a5
{
  void (**v8)(id, uint64_t, void *, _QWORD);
  unint64_t v9;
  unint64_t v10;
  void *v11;
  unint64_t v12;
  CRLReadChannel *archiveReadChannel;
  unint64_t v14;
  CRLZipEntry *entry;
  NSObject *v16;
  void *v17;
  _QWORD v18[5];
  void (**v19)(id, uint64_t, void *, _QWORD);
  int64_t v20;
  unint64_t v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  unint64_t v25;
  __int16 v26;
  int64_t v27;

  v8 = (void (**)(id, uint64_t, void *, _QWORD))a5;
  v9 = -[CRLZipEntry compressedSize](self->_entry, "compressedSize");
  v10 = v9;
  if (a3 < 0 || v9 < a3)
  {
    if (qword_10147E368 != -1)
      dispatch_once(&qword_10147E368, &stru_101256518);
    v11 = off_1013D9068;
    if (os_log_type_enabled((os_log_t)off_1013D9068, OS_LOG_TYPE_ERROR))
    {
      entry = self->_entry;
      v16 = v11;
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[CRLZipEntry name](entry, "name"));
      *(_DWORD *)buf = 138412802;
      v23 = v17;
      v24 = 2048;
      v25 = v10;
      v26 = 2048;
      v27 = a3;
      _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Requested range is not within the entry: %@. Size: %llu. Requested offset: %llu", buf, 0x20u);

    }
    v8[2](v8, 1, &_dispatch_data_empty, 0);
  }
  else
  {
    if (v9 - a3 < a4)
      a4 = v9 - a3;
    if (a3 || a4 != v9)
    {
      v12 = -[CRLZipEntry fileHeaderLength](self->_entry, "fileHeaderLength");
      if (v12)
      {
        -[CRLReadChannel readFromOffset:length:handler:](self->_archiveReadChannel, "readFromOffset:length:handler:", (char *)-[CRLZipEntry offset](self->_entry, "offset") + v12 + a3, a4, v8);
      }
      else
      {
        archiveReadChannel = self->_archiveReadChannel;
        v14 = -[CRLZipEntry offset](self->_entry, "offset");
        v18[0] = _NSConcreteStackBlock;
        v18[1] = 3221225472;
        v18[2] = sub_100386324;
        v18[3] = &unk_101256540;
        v18[4] = self;
        v20 = a3;
        v21 = a4;
        v19 = v8;
        +[CRLIOUtils readAllFromChannel:offset:length:completion:](CRLIOUtils, "readAllFromChannel:offset:length:completion:", archiveReadChannel, v14, 30, v18);

      }
    }
    else
    {
      -[CRLZipReadChannel readWithHandler:](self, "readWithHandler:", v8);
    }
  }

}

- (void)readFromOffsetAndWait:(int64_t)a3 length:(unint64_t)a4 handler:(id)a5
{
  +[CRLIOUtils readFromOffsetAndWait:offset:length:handler:](CRLIOUtils, "readFromOffsetAndWait:offset:length:handler:", self, a3, a4, a5);
}

- (BOOL)readFileHeaderFromData:(id)a3 headerLength:(unint64_t *)a4 error:(id *)a5
{
  NSObject *v8;
  size_t size;
  NSObject *subrange;
  uint64_t v11;
  void *v12;
  dispatch_data_t v13;
  unsigned __int16 *v14;
  int v15;
  BOOL v16;
  id v17;
  BOOL v18;
  void *v19;
  uint64_t v20;
  void *v21;
  const __CFString *v22;
  _QWORD *v23;
  _QWORD *v24;
  void *v25;
  uint64_t v26;
  const __CFString *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  const __CFString *v31;
  void *v32;
  size_t size_ptr;
  void *buffer_ptr;
  _QWORD v36[2];
  _QWORD v37[2];
  _QWORD v38[2];
  _QWORD v39[2];
  _QWORD v40[2];
  _QWORD v41[2];

  v8 = a3;
  size = dispatch_data_get_size(v8);
  if (size == 30)
  {
    subrange = v8;
    goto LABEL_5;
  }
  v11 = size;
  if (size < 0x1F)
  {
    if (qword_10147E368 != -1)
      dispatch_once(&qword_10147E368, &stru_101256560);
    v29 = off_1013D9068;
    if (os_log_type_enabled((os_log_t)off_1013D9068, OS_LOG_TYPE_ERROR))
    {
      sub_100E286B0((uint64_t)self, v29, v11);
      if (a5)
        goto LABEL_33;
    }
    else if (a5)
    {
LABEL_33:
      v41[0] = CFSTR("Read was less than record size");
      v40[0] = CFSTR("CRLZipArchiveErrorDescription");
      v40[1] = CFSTR("CRLZipArchiveErrorEntryName");
      v30 = objc_claimAutoreleasedReturnValue(-[CRLZipEntry name](self->_entry, "name"));
      v12 = (void *)v30;
      v31 = &stru_1012A72B0;
      if (v30)
        v31 = (const __CFString *)v30;
      v41[1] = v31;
      v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v41, v40, 2));
      *a5 = (id)objc_claimAutoreleasedReturnValue(+[NSError crl_fileReadCorruptedFileErrorWithUserInfo:](NSError, "crl_fileReadCorruptedFileErrorWithUserInfo:", v32));

      v18 = 0;
      goto LABEL_38;
    }
    v18 = 0;
    goto LABEL_39;
  }
  subrange = dispatch_data_create_subrange(v8, 0, 0x1EuLL);
LABEL_5:
  v12 = subrange;
  size_ptr = 0;
  buffer_ptr = 0;
  v13 = dispatch_data_create_map(subrange, (const void **)&buffer_ptr, &size_ptr);
  v14 = (unsigned __int16 *)buffer_ptr;
  if (*(_DWORD *)buffer_ptr != 67324752)
  {
    if (qword_10147E368 != -1)
      dispatch_once(&qword_10147E368, &stru_101256580);
    v19 = off_1013D9068;
    if (os_log_type_enabled((os_log_t)off_1013D9068, OS_LOG_TYPE_ERROR))
      sub_100E28628((uint64_t)self, v19);
    v39[0] = CFSTR("Local file header has bad signature");
    v38[0] = CFSTR("CRLZipArchiveErrorDescription");
    v38[1] = CFSTR("CRLZipArchiveErrorEntryName");
    v20 = objc_claimAutoreleasedReturnValue(-[CRLZipEntry name](self->_entry, "name"));
    v21 = (void *)v20;
    v22 = &stru_1012A72B0;
    if (v20)
      v22 = (const __CFString *)v20;
    v39[1] = v22;
    v23 = v39;
    v24 = v38;
    goto LABEL_27;
  }
  v15 = *((unsigned __int16 *)buffer_ptr + 4);
  if (*((_WORD *)buffer_ptr + 4))
    v16 = v15 == 8;
  else
    v16 = 1;
  if (!v16 || (((v15 != 8) ^ -[CRLZipEntry isCompressed](self->_entry, "isCompressed")) & 1) == 0)
  {
    if (qword_10147E368 != -1)
      dispatch_once(&qword_10147E368, &stru_1012565A0);
    v25 = off_1013D9068;
    if (os_log_type_enabled((os_log_t)off_1013D9068, OS_LOG_TYPE_ERROR))
      sub_100E285A0((uint64_t)self, v25);
    v37[0] = CFSTR("Local file header doesn't match compression method from central directory file header");
    v36[0] = CFSTR("CRLZipArchiveErrorDescription");
    v36[1] = CFSTR("CRLZipArchiveErrorEntryName");
    v26 = objc_claimAutoreleasedReturnValue(-[CRLZipEntry name](self->_entry, "name"));
    v21 = (void *)v26;
    v27 = &stru_1012A72B0;
    if (v26)
      v27 = (const __CFString *)v26;
    v37[1] = v27;
    v23 = v37;
    v24 = v36;
LABEL_27:
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v23, v24, 2));
    v17 = (id)objc_claimAutoreleasedReturnValue(+[NSError crl_fileReadCorruptedFileErrorWithUserInfo:](NSError, "crl_fileReadCorruptedFileErrorWithUserInfo:", v28));

    if (a5)
    {
      v17 = objc_retainAutorelease(v17);
      v18 = 0;
      *a5 = v17;
    }
    else
    {
      v18 = 0;
    }
    goto LABEL_37;
  }
  *a4 = v14[13] + (unint64_t)v14[14] + 30;
  -[CRLZipEntry setFileHeaderLength:](self->_entry, "setFileHeaderLength:");
  v17 = 0;
  v18 = 1;
LABEL_37:

LABEL_38:
LABEL_39:

  return v18;
}

- (void)readWithFileHeaderLength:(unint64_t)a3 handler:(id)a4
{
  id v6;
  CRLReadChannel *archiveReadChannel;
  unint64_t v8;
  unint64_t v9;
  id v10;
  _QWORD v11[5];
  id v12;
  _QWORD *v13;
  _QWORD *v14;
  _QWORD v15[3];
  int v16;
  _QWORD v17[3];
  char v18;

  v6 = a4;
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x2020000000;
  v18 = 1;
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x2020000000;
  v16 = 0;
  v16 = crc32(0, 0, 0);
  archiveReadChannel = self->_archiveReadChannel;
  v8 = -[CRLZipEntry offset](self->_entry, "offset");
  v9 = -[CRLZipEntry compressedSize](self->_entry, "compressedSize");
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100386A00;
  v11[3] = &unk_1012565C8;
  v13 = v17;
  v11[4] = self;
  v10 = v6;
  v12 = v10;
  v14 = v15;
  -[CRLReadChannel readFromOffset:length:handler:](archiveReadChannel, "readFromOffset:length:handler:", v8 + a3, v9, v11);

  _Block_object_dispose(v15, 8);
  _Block_object_dispose(v17, 8);

}

- (BOOL)processData:(id)a3 CRC:(unsigned int *)a4 isDone:(BOOL)a5 handler:(id)a6
{
  _BOOL8 v7;
  NSObject *v10;
  void (**v11)(id, _BOOL8, NSObject *, _QWORD);
  BOOL v12;
  void *v14;
  uint64_t v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  _QWORD v20[5];
  _QWORD v21[2];
  _QWORD v22[2];

  v7 = a5;
  v10 = a3;
  v11 = (void (**)(id, _BOOL8, NSObject *, _QWORD))a6;
  if (a4
    && self->_validateCRC
    && (v20[0] = _NSConcreteStackBlock,
        v20[1] = 3221225472,
        v20[2] = sub_100386CB4,
        v20[3] = &unk_101256628,
        v20[4] = a4,
        dispatch_data_apply(v10, v20),
        v7)
    && -[CRLZipEntry CRC](self->_entry, "CRC") != *a4)
  {
    if (qword_10147E368 != -1)
      dispatch_once(&qword_10147E368, &stru_101256648);
    v14 = off_1013D9068;
    if (os_log_type_enabled((os_log_t)off_1013D9068, OS_LOG_TYPE_ERROR))
      sub_100E28774((void **)&self->_entry, v14);
    v22[0] = CFSTR("CRC does not match");
    v21[0] = CFSTR("CRLZipArchiveErrorDescription");
    v21[1] = CFSTR("CRLZipArchiveErrorEntryName");
    v15 = objc_claimAutoreleasedReturnValue(-[CRLZipEntry name](self->_entry, "name"));
    v16 = (void *)v15;
    v17 = &stru_1012A72B0;
    if (v15)
      v17 = (const __CFString *)v15;
    v22[1] = v17;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v22, v21, 2));
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSError crl_fileReadCorruptedFileErrorWithUserInfo:](NSError, "crl_fileReadCorruptedFileErrorWithUserInfo:", v18));

    -[CRLZipReadChannel handleFailureWithHandler:error:](self, "handleFailureWithHandler:error:", v11, v19);
    v12 = 0;
  }
  else
  {
    v11[2](v11, v7, v10, 0);
    v12 = 1;
  }

  return v12;
}

- (void)handleFailureWithHandler:(id)a3 error:(id)a4
{
  void (**v6)(id, uint64_t, _QWORD, void *);
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  const __CFString *v18;
  _QWORD v19[2];
  _QWORD v20[2];
  const __CFString *v21;
  const __CFString *v22;

  v6 = (void (**)(id, uint64_t, _QWORD, void *))a3;
  v7 = a4;
  if (!v7)
  {
    v21 = CFSTR("CRLZipArchiveErrorEntryName");
    v17 = objc_claimAutoreleasedReturnValue(-[CRLZipEntry name](self->_entry, "name"));
    v10 = (void *)v17;
    v18 = &stru_1012A72B0;
    if (v17)
      v18 = (const __CFString *)v17;
    v22 = v18;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSError crl_fileReadCorruptedFileErrorWithUserInfo:](NSError, "crl_fileReadCorruptedFileErrorWithUserInfo:", v13));
    goto LABEL_9;
  }
  v8 = v7;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "crl_zipArchiveErrorEntryName"));

  if (!v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "domain"));
    v11 = objc_msgSend(v8, "code");
    v20[0] = v8;
    v19[0] = NSUnderlyingErrorKey;
    v19[1] = CFSTR("CRLZipArchiveErrorEntryName");
    v12 = objc_claimAutoreleasedReturnValue(-[CRLZipEntry name](self->_entry, "name"));
    v13 = (void *)v12;
    v14 = &stru_1012A72B0;
    if (v12)
      v14 = (const __CFString *)v12;
    v20[1] = v14;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v20, v19, 2));
    v16 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v10, v11, v15));

    v8 = (void *)v16;
LABEL_9:

  }
  v6[2](v6, 1, 0, v8);

}

- (void)close
{
  CRLReadChannel *archiveReadChannel;
  CRLZipEntry *entry;
  CRLZipArchive *archive;

  -[CRLReadChannel close](self->_archiveReadChannel, "close");
  archiveReadChannel = self->_archiveReadChannel;
  self->_archiveReadChannel = 0;

  entry = self->_entry;
  self->_entry = 0;

  archive = self->_archive;
  self->_archive = 0;

}

- (void)readWithHandlerAndWait:(id)a3
{
  +[CRLIOUtils readWithHandlerAndWait:handler:](CRLIOUtils, "readWithHandlerAndWait:handler:", self, a3);
}

- (void)setLowWater:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  if (!self->_archiveReadChannel)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101256668);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E28914();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101256688);
    v5 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLZipReadChannel setLowWater:]"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/Zip/CRLZipReadChannel.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 307, 0, "Already closed");

  }
  if (a3 <= 0x1D)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012566A8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E28894();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012566C8);
    v8 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLZipReadChannel setLowWater:]"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/Zip/CRLZipReadChannel.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v9, v10, 308, 0, "Low water is too small");

  }
  -[CRLReadChannel setLowWater:](self->_archiveReadChannel, "setLowWater:", a3);
}

- (void)addBarrier:(id)a3
{
  id v4;
  CRLReadChannel *archiveReadChannel;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  archiveReadChannel = self->_archiveReadChannel;
  if (!archiveReadChannel)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012566E8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E28994();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101256708);
    v6 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLZipReadChannel addBarrier:]"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/Zip/CRLZipReadChannel.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 314, 0, "Already closed");

    archiveReadChannel = self->_archiveReadChannel;
  }
  -[CRLReadChannel addBarrier:](archiveReadChannel, "addBarrier:", v4);

}

- (BOOL)isValid
{
  return -[CRLReadChannel isValid](self->_archiveReadChannel, "isValid");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_archiveReadChannel, 0);
  objc_storeStrong((id *)&self->_archive, 0);
  objc_storeStrong((id *)&self->_entry, 0);
}

@end
