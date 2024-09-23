@implementation CRLZipInflateReadChannel

- (CRLZipInflateReadChannel)initWithReadChannel:(id)a3 uncompressedSize:(unint64_t)a4 CRC:(unsigned int)a5 validateCRC:(BOOL)a6
{
  id v11;
  CRLZipInflateReadChannel *v12;
  CRLZipInflateReadChannel *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  objc_super v23;

  v11 = a3;
  v23.receiver = self;
  v23.super_class = (Class)CRLZipInflateReadChannel;
  v12 = -[CRLZipInflateReadChannel init](&v23, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_readChannel, a3);
    v13->_stream.next_in = 0;
    v13->_remainingUncompressedSize = a4;
    v13->_CRC = a5;
    v13->_validateCRC = a6;
    v13->_stream.avail_in = 0;
    v13->_stream.avail_out = 0;
    v13->_stream.next_out = 0;
    v13->_stream.zfree = 0;
    v13->_stream.opaque = 0;
    v13->_stream.zalloc = 0;
    if (inflateInit2_(&v13->_stream, -15, "1.2.12", 112))
    {
      if (qword_10147E368 != -1)
        dispatch_once(&qword_10147E368, &stru_10122CBD8);
      v14 = off_1013D9068;
      if (os_log_type_enabled((os_log_t)off_1013D9068, OS_LOG_TYPE_ERROR))
        sub_100DE8774(v14, v15, v16, v17, v18, v19, v20, v21);

      v13 = 0;
    }
  }

  return v13;
}

- (void)dealloc
{
  objc_super v3;

  -[CRLZipInflateReadChannel close](self, "close");
  inflateEnd(&self->_stream);
  free(self->_outBuffer);
  v3.receiver = self;
  v3.super_class = (Class)CRLZipInflateReadChannel;
  -[CRLZipInflateReadChannel dealloc](&v3, "dealloc");
}

- (void)prepareBuffer
{
  void *v3;
  void *v4;
  void *v5;
  unint64_t remainingUncompressedSize;
  unint64_t v7;
  unint64_t v8;
  char *v9;

  if (self->_outBuffer)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10122CBF8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE8838();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10122CC18);
    v3 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE87A4(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLZipInflateReadChannel prepareBuffer]"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/Zip/CRLZipInflateReadChannel.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, v5, 77, 0, "expected nil value for '%{public}s'", "_outBuffer");

  }
  remainingUncompressedSize = self->_remainingUncompressedSize;
  if (remainingUncompressedSize >= 0x40000)
    v7 = 0x40000;
  else
    v7 = self->_remainingUncompressedSize;
  if (remainingUncompressedSize)
    v8 = v7;
  else
    v8 = 0x40000;
  self->_outBufferSize = v8;
  v9 = (char *)malloc_type_malloc(v8, 0xADB39EEDuLL);
  self->_outBuffer = v9;
  self->_stream.avail_out = self->_outBufferSize;
  self->_stream.next_out = (Bytef *)v9;
}

- (void)readWithHandler:(id)a3
{
  id v4;
  CRLStreamReadChannel *readChannel;
  id v6;
  _QWORD v7[5];
  id v8;
  _QWORD *v9;
  _QWORD *v10;
  _QWORD *v11;
  _QWORD *v12;
  _QWORD v13[3];
  int v14;
  _QWORD v15[3];
  int v16;
  _QWORD v17[3];
  char v18;
  _QWORD v19[3];
  char v20;

  v4 = a3;
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x2020000000;
  v20 = 1;
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x2020000000;
  v18 = 1;
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x2020000000;
  v16 = 0;
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x2020000000;
  v14 = 0;
  v14 = crc32(0, 0, 0);
  readChannel = self->_readChannel;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100012FA4;
  v7[3] = &unk_10122CC40;
  v9 = v19;
  v7[4] = self;
  v6 = v4;
  v8 = v6;
  v10 = v15;
  v11 = v17;
  v12 = v13;
  -[CRLStreamReadChannel readWithHandler:](readChannel, "readWithHandler:", v7);

  _Block_object_dispose(v13, 8);
  _Block_object_dispose(v15, 8);
  _Block_object_dispose(v17, 8);
  _Block_object_dispose(v19, 8);

}

- (void)readWithHandlerAndWait:(id)a3
{
  +[CRLIOUtils readWithHandlerAndWait:handler:](CRLIOUtils, "readWithHandlerAndWait:handler:", self, a3);
}

- (BOOL)processData:(id)a3 inflateResult:(int *)a4 CRC:(unsigned int *)a5 isDone:(BOOL)a6 handler:(id)a7
{
  _BOOL4 v8;
  NSObject *v12;
  id v13;
  int v14;
  BOOL v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD applier[5];
  id v34;
  uint64_t *v35;
  int *v36;
  unsigned int *v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  char v41;

  v8 = a6;
  v12 = a3;
  v38 = 0;
  v39 = &v38;
  v40 = 0x2020000000;
  v41 = 1;
  applier[0] = _NSConcreteStackBlock;
  applier[1] = 3221225472;
  applier[2] = sub_1000132D4;
  applier[3] = &unk_10122CD28;
  v35 = &v38;
  v36 = a4;
  applier[4] = self;
  v37 = a5;
  v13 = a7;
  v34 = v13;
  dispatch_data_apply(v12, applier);
  v14 = *((unsigned __int8 *)v39 + 24);
  if (!self->_validateCRC)
    goto LABEL_10;
  if (!*((_BYTE *)v39 + 24))
    goto LABEL_24;
  if (v8)
  {
    if (!a5)
    {
LABEL_9:
      v14 = 1;
LABEL_10:
      if (v14 && v8)
      {
        if (*a4 != 1)
        {
          if (qword_10147E368 != -1)
            dispatch_once(&qword_10147E368, &stru_10122CD68);
          v16 = off_1013D9068;
          if (os_log_type_enabled((os_log_t)off_1013D9068, OS_LOG_TYPE_ERROR))
            sub_100DE88E0(v16, v17, v18, v19, v20, v21, v22, v23);
LABEL_23:
          *((_BYTE *)v39 + 24) = 0;
          goto LABEL_24;
        }
        goto LABEL_18;
      }
      if (v14)
      {
LABEL_18:
        v15 = 1;
        goto LABEL_25;
      }
LABEL_24:
      -[CRLZipInflateReadChannel handleFailureWithHandler:error:](self, "handleFailureWithHandler:error:", v13, 0);
      v15 = *((_BYTE *)v39 + 24) != 0;
      goto LABEL_25;
    }
LABEL_8:
    if (self->_CRC != *a5)
    {
      if (qword_10147E368 != -1)
        dispatch_once(&qword_10147E368, &stru_10122CD48);
      v24 = off_1013D9068;
      if (os_log_type_enabled((os_log_t)off_1013D9068, OS_LOG_TYPE_ERROR))
        sub_100DE8910(v24, v25, v26, v27, v28, v29, v30, v31);
      goto LABEL_23;
    }
    goto LABEL_9;
  }
  v15 = 1;
  if (a5 && *a4 == 1)
    goto LABEL_8;
LABEL_25:

  _Block_object_dispose(&v38, 8);
  return v15;
}

- (void)handleFailureWithHandler:(id)a3 error:(id)a4
{
  void (*v5)(void);
  id v6;
  id v7;

  if (a4)
  {
    v5 = (void (*)(void))*((_QWORD *)a3 + 2);
    v7 = a3;
    v5();
  }
  else
  {
    v6 = a3;
    v7 = (id)objc_claimAutoreleasedReturnValue(+[NSError crl_fileReadUnknownErrorWithUserInfo:](NSError, "crl_fileReadUnknownErrorWithUserInfo:", 0));
    (*((void (**)(id, uint64_t, _QWORD))a3 + 2))(v6, 1, 0);

  }
}

- (void)close
{
  CRLStreamReadChannel *readChannel;

  -[CRLStreamReadChannel close](self->_readChannel, "close");
  readChannel = self->_readChannel;
  self->_readChannel = 0;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_readChannel, 0);
}

@end
