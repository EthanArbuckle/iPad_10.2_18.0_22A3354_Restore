@implementation CSHealthWrapMessage

- (CSHealthWrapMessage)initWithUUID:(id)a3 senderUUID:(id)a4 studyUUID:(id)a5 channel:(id)a6 payloadType:(id)a7 startDate:(id)a8 endDate:(id)a9 payloadIdentifier:(id)a10 applicationData:(id)a11 certificate:(__SecCertificate *)cf
{
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  CSHealthWrapMessage *v26;
  CSHealthWrapMessage *v27;
  uint64_t v28;
  CSHWProtoPayloadHeader *payloadHeader;
  id v30;
  void *v31;
  id v32;
  id v33;
  double v34;
  double v35;
  id v36;
  dispatch_queue_global_t global_queue;
  NSObject *v38;
  dispatch_queue_t v39;
  OS_dispatch_queue *encryptQueue;
  id v42;
  id v43;
  objc_super v44;
  _QWORD v45[2];

  v43 = a3;
  v19 = a4;
  v42 = a5;
  v20 = a6;
  v21 = a7;
  v22 = a8;
  v23 = a9;
  v24 = a10;
  v25 = a11;
  v44.receiver = self;
  v44.super_class = (Class)CSHealthWrapMessage;
  v26 = -[CSHealthWrapMessage init](&v44, "init");
  v27 = v26;
  if (v26)
  {
    *(_WORD *)&v26->_compressionEnabled = 1;
    *(_WORD *)&v26->_shouldCloseStream = 1;
    objc_storeStrong((id *)&v26->_uuid, a3);
    objc_storeStrong((id *)&v27->_studyUUID, a5);
    v28 = objc_claimAutoreleasedReturnValue(+[GPBMessage message](CSHWProtoPayloadHeader, "message"));
    payloadHeader = v27->_payloadHeader;
    v27->_payloadHeader = (CSHWProtoPayloadHeader *)v28;

    v30 = objc_msgSend(v24, "copy");
    -[CSHWProtoPayloadHeader setPayloadIdentifier:](v27->_payloadHeader, "setPayloadIdentifier:", v30);

    v45[0] = 0;
    v45[1] = 0;
    objc_msgSend(v19, "getUUIDBytes:", v45);
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v45, 16));
    -[CSHWProtoPayloadHeader setSubjectUuid:](v27->_payloadHeader, "setSubjectUuid:", v31);

    v32 = objc_msgSend(v20, "copy");
    -[CSHWProtoPayloadHeader setChannel:](v27->_payloadHeader, "setChannel:", v32);

    v33 = objc_msgSend(v21, "copy");
    -[CSHWProtoPayloadHeader setPayloadType:](v27->_payloadHeader, "setPayloadType:", v33);

    if (v22)
    {
      objc_msgSend(v22, "timeIntervalSinceReferenceDate");
      -[CSHWProtoPayloadHeader setStartDate:](v27->_payloadHeader, "setStartDate:", (uint64_t)v34);
    }
    if (v23)
    {
      objc_msgSend(v23, "timeIntervalSinceReferenceDate");
      -[CSHWProtoPayloadHeader setEndDate:](v27->_payloadHeader, "setEndDate:", (uint64_t)v35);
    }
    if (v25)
    {
      v36 = objc_msgSend(v25, "copy");
      -[CSHWProtoPayloadHeader setApplicationData:](v27->_payloadHeader, "setApplicationData:", v36);

    }
    CFRetain(cf);
    v27->_certificate = cf;
    global_queue = dispatch_get_global_queue(0, 0);
    v38 = objc_claimAutoreleasedReturnValue(global_queue);
    v39 = dispatch_queue_create("healthwrap_message", 0);
    encryptQueue = v27->_encryptQueue;
    v27->_encryptQueue = (OS_dispatch_queue *)v39;

    dispatch_set_target_queue((dispatch_object_t)v27->_encryptQueue, v38);
  }

  return v27;
}

- (CSHealthWrapMessage)initWithConfiguration:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  CSHealthWrapMessage *v13;
  void *v14;
  void *v15;
  void *v17;
  void *v19;

  v4 = a3;
  if (!v4)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CSHealthWrapMessage.m"), 141, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("configuration != nil"));

  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "messageUUID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "subjectUUID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "studyUUID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "channel"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "payloadType"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "startDate"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "endDate"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "payloadIdentifier"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "applicationData"));
  v13 = -[CSHealthWrapMessage initWithUUID:senderUUID:studyUUID:channel:payloadType:startDate:endDate:payloadIdentifier:applicationData:certificate:](self, "initWithUUID:senderUUID:studyUUID:channel:payloadType:startDate:endDate:payloadIdentifier:applicationData:certificate:", v19, v5, v6, v7, v8, v9, v10, v11, v12, objc_msgSend(v4, "certificate"));

  if (v13)
  {
    objc_storeStrong((id *)&v13->_configuration, a3);
    if (-[CSHealthWrapMessageConfiguration disableCompression](v13->_configuration, "disableCompression"))
      v13->_compressionEnabled = 0;
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "keyValuePairs"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[CSHealthWrapMessage _codableKeyValuePairsFromDictionary:](v13, "_codableKeyValuePairsFromDictionary:", v14));
    -[CSHWProtoPayloadHeader setKeyValuePairsArray:](v13->_payloadHeader, "setKeyValuePairsArray:", v15);

  }
  return v13;
}

- (void)dealloc
{
  __SecCertificate *certificate;
  NSOutputStream *outputStream;
  NSURL *outputURL;
  objc_super v6;

  certificate = self->_certificate;
  if (certificate)
  {
    CFRelease(certificate);
    self->_certificate = 0;
  }
  outputStream = self->_outputStream;
  if (outputStream)
  {
    CFWriteStreamSetDispatchQueue((CFWriteStreamRef)outputStream, 0);
    outputStream = self->_outputStream;
  }
  if (self->_shouldCloseStream)
  {
    -[NSOutputStream close](outputStream, "close");
    outputURL = self->_outputURL;
    self->_outputURL = 0;

    outputStream = self->_outputStream;
  }
  self->_outputStream = 0;

  v6.receiver = self;
  v6.super_class = (Class)CSHealthWrapMessage;
  -[CSHealthWrapMessage dealloc](&v6, "dealloc");
}

- (id)_codableKeyValuePairsFromDictionary:(id)a3
{
  id v3;
  id v4;
  _QWORD v6[4];
  id v7;

  if (!a3)
    return 0;
  v3 = a3;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000191D8;
  v6[3] = &unk_100346EE8;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v3, "count")));
  v7 = v4;
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v6);

  return v4;
}

- (BOOL)startWithError:(id *)a3
{
  id v5;

  v5 = objc_msgSend((id)objc_opt_class(self), "newOutputFileURL");
  LOBYTE(a3) = -[CSHealthWrapMessage startWithOutputFileURL:error:](self, "startWithOutputFileURL:error:", v5, a3);

  return (char)a3;
}

+ (id)newOutputFileURL
{
  NSString *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = NSTemporaryDirectory();
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v4));
  v6 = objc_msgSend(a1, "newOutputFileURLInDirectory:", v5);

  return v6;
}

+ (id)newOutputFileURLInDirectory:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "UUIDString"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-%@"), CFSTR("HealthWrap-"), v5));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "URLByAppendingPathComponent:", v6));
  return v7;
}

- (BOOL)_startWithOutputStream:(id)a3 error:(id *)a4
{
  __CFWriteStream *v7;
  CSHealthWrapEncryptor *v8;
  CSHealthWrapEncryptor *v9;
  CSHealthWrapEncryptor *encryptor;
  BOOL v11;
  _CSCompressionEngine *v12;
  _CSCompressionEngine *compressionEngine;
  uint64_t v15;
  _QWORD v16[5];

  v7 = (__CFWriteStream *)a3;
  *(_WORD *)&self->_started = 257;
  objc_storeStrong((id *)&self->_outputStream, a3);
  CFWriteStreamSetDispatchQueue(v7, (dispatch_queue_t)self->_encryptQueue);
  v8 = [CSHealthWrapEncryptor alloc];
  LOBYTE(v15) = self->_compressionEnabled;
  v9 = -[CSHealthWrapEncryptor initWithOutputStream:certificate:algorithm:options:keySize:uuid:studyUUID:compressionEnabled:](v8, "initWithOutputStream:certificate:algorithm:options:keySize:uuid:studyUUID:compressionEnabled:", v7, self->_certificate, 0, 1, 32, self->_uuid, self->_studyUUID, v15);
  encryptor = self->_encryptor;
  self->_encryptor = v9;

  v11 = 0;
  if (-[CSHealthWrapEncryptor startWithError:](self->_encryptor, "startWithError:", a4))
  {
    if (self->_compressionEnabled)
    {
      v12 = -[_CSCompressionEngine initWithFunction:algorithm:destination:]([_CSCompressionEngine alloc], "initWithFunction:algorithm:destination:", 0, 1, self);
      compressionEngine = self->_compressionEngine;
      self->_compressionEngine = v12;

    }
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100019604;
    v16[3] = &unk_100346F10;
    v16[4] = self;
    v11 = -[CSHealthWrapMessage _run:error:](self, "_run:error:", v16, a4);
  }

  return v11;
}

- (BOOL)startWithOutputStream:(id)a3 shouldClose:(BOOL)a4 error:(id *)a5
{
  id v9;
  NSURL *outputURL;
  BOOL v11;
  void *v13;

  v9 = a3;
  if (self->_started)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CSHealthWrapMessage.m"), 265, CFSTR("Started twice without a reset"));

  }
  outputURL = self->_outputURL;
  self->_outputURL = 0;

  self->_startedWithStream = 1;
  self->_shouldCloseStream = a4;
  v11 = -[CSHealthWrapMessage _startWithOutputStream:error:](self, "_startWithOutputStream:error:", v9, a5);

  return v11;
}

- (BOOL)startWithOutputFileURL:(id)a3 error:(id *)a4
{
  NSURL *v7;
  NSURL *outputURL;
  NSURL *v9;
  id v10;
  BOOL v11;
  void *v13;

  v7 = (NSURL *)a3;
  if (self->_started)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CSHealthWrapMessage.m"), 273, CFSTR("Started twice without a reset"));

  }
  outputURL = self->_outputURL;
  self->_outputURL = v7;
  v9 = v7;

  *(_WORD *)&self->_shouldCloseStream = 1;
  v10 = objc_msgSend(objc_alloc((Class)NSOutputStream), "initWithURL:append:", v9, 0);

  objc_msgSend(v10, "open");
  v11 = -[CSHealthWrapMessage _startWithOutputStream:error:](self, "_startWithOutputStream:error:", v10, a4);

  return v11;
}

- (BOOL)appendDataFromFileURL:(id)a3 error:(id *)a4
{
  id v6;
  int v7;
  int v8;
  void *v9;
  void *v10;
  NSErrorDomain v11;
  uint64_t v12;
  void *v13;
  void *v14;
  BOOL v15;
  void *v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  stat v23;
  NSErrorUserInfoKey v24;
  void *v25;
  NSErrorUserInfoKey v26;
  void *v27;
  NSErrorUserInfoKey v28;
  void *v29;
  NSErrorUserInfoKey v30;
  void *v31;

  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "path")));
  v7 = open((const char *)objc_msgSend(v6, "UTF8String"), 0);
  if (v7 == -1)
  {
    v30 = NSLocalizedDescriptionKey;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Unable to open file %@"), v6));
    v31 = v13;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1));
    *a4 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 22, v14));

    goto LABEL_6;
  }
  v8 = v7;
  memset(&v23, 0, sizeof(v23));
  if (fstat(v7, &v23))
  {
    v28 = NSLocalizedDescriptionKey;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Unable to stat file %@"), v6));
    v29 = v9;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1));
    v11 = NSPOSIXErrorDomain;
    v12 = 2;
LABEL_4:
    *a4 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v11, v12, v10));

    close(v8);
LABEL_6:
    v15 = 0;
    goto LABEL_7;
  }
  v17 = mmap(0, v23.st_size, 1, 2, v8, 0);
  if (v17 == (void *)-1)
  {
    v26 = NSLocalizedDescriptionKey;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("mmap failed for file %@"), v6));
    v27 = v9;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1));
    v11 = NSPOSIXErrorDomain;
    v12 = 12;
    goto LABEL_4;
  }
  v18 = v17;
  v19 = objc_alloc((Class)NSData);
  v20 = objc_msgSend(v19, "initWithBytesNoCopy:length:deallocator:", v18, v23.st_size, NSDataDeallocatorUnmap);
  close(v8);
  if (v20)
  {
    v15 = -[CSHealthWrapMessage appendData:error:](self, "appendData:error:", v20, a4);
  }
  else
  {
    v24 = NSLocalizedDescriptionKey;
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("data alloc failed for file %@"), v6));
    v25 = v21;
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1));
    *a4 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 12, v22));

    v15 = 0;
  }

LABEL_7:
  return v15;
}

- (BOOL)appendData:(id)a3 error:(id *)a4
{
  id v5;
  _QWORD v7[4];
  CSHealthWrapMessage *v8;
  id v9;

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100019C44;
  v7[3] = &unk_100346F38;
  v8 = self;
  v9 = a3;
  v5 = v9;
  LOBYTE(a4) = -[CSHealthWrapMessage _run:error:](v8, "_run:error:", v7, a4);

  return (char)a4;
}

- (void)_finalize
{
  CSHealthWrapEncryptor *encryptor;
  unsigned __int8 v4;
  id v5;
  NSOutputStream *outputStream;
  NSOutputStream *v7;
  id obj;

  if (self->_compressionEnabled)
  {
    -[_CSCompressionEngine sourceContentFinished](self->_compressionEngine, "sourceContentFinished");
  }
  else
  {
    encryptor = self->_encryptor;
    obj = 0;
    v4 = -[CSHealthWrapEncryptor finalizeWithError:](encryptor, "finalizeWithError:", &obj);
    v5 = obj;
    self->_lastSuccess = v4;
    objc_storeStrong((id *)&self->_lastError, v5);
  }
  if (self->_startedWithStream)
  {
    outputStream = self->_outputStream;
    if (outputStream)
    {
      CFWriteStreamSetDispatchQueue((CFWriteStreamRef)outputStream, 0);
      if (self->_shouldCloseStream)
        -[NSOutputStream close](self->_outputStream, "close");
      v7 = self->_outputStream;
      self->_outputStream = 0;

    }
  }
}

- (BOOL)finalizeWithError:(id *)a3
{
  _QWORD v4[5];

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100019D30;
  v4[3] = &unk_100346F10;
  v4[4] = self;
  return -[CSHealthWrapMessage _run:error:](self, "_run:error:", v4, a3);
}

- (BOOL)_run:(id)a3 error:(id *)a4
{
  _BOOL4 lastSuccess;

  self->_lastSuccess = 1;
  (*((void (**)(id, SEL))a3 + 2))(a3, a2);
  lastSuccess = self->_lastSuccess;
  if (!self->_lastSuccess)
  {
    -[CSHealthWrapMessage _cleanup](self, "_cleanup");
    *a4 = objc_retainAutorelease(self->_lastError);
  }
  return lastSuccess;
}

- (void)_writeDataToCompressor:(id)a3
{
  NSError *lastError;
  void *v5;
  CSHealthWrapEncryptor *encryptor;
  unsigned __int8 v7;
  id v8;
  CSHealthWrapEncryptor *v9;
  unsigned __int8 v10;
  NSError *v11;
  id v12;
  id v13;
  unint64_t v14;

  lastError = (NSError *)a3;
  v14 = bswap64((unint64_t)-[NSError length](lastError, "length"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", &v14, 8));
  if (self->_compressionEnabled)
  {
    -[_CSCompressionEngine writeSourceContent:](self->_compressionEngine, "writeSourceContent:", v5);
    -[_CSCompressionEngine writeSourceContent:](self->_compressionEngine, "writeSourceContent:", lastError);
  }
  else
  {
    encryptor = self->_encryptor;
    v13 = 0;
    v7 = -[CSHealthWrapEncryptor appendData:error:](encryptor, "appendData:error:", v5, &v13);
    v8 = v13;
    self->_lastSuccess = v7;
    v9 = self->_encryptor;
    v12 = v8;
    v10 = -[CSHealthWrapEncryptor appendData:error:](v9, "appendData:error:", lastError, &v12);

    v11 = (NSError *)v12;
    self->_lastSuccess = v10;
    lastError = self->_lastError;
    self->_lastError = v11;
  }

}

- (void)_cleanup
{
  _CSCompressionEngine *compressionEngine;
  CSHealthWrapEncryptor *encryptor;
  NSOutputStream *outputStream;
  void *v6;
  NSURL *outputURL;

  compressionEngine = self->_compressionEngine;
  self->_compressionEngine = 0;

  -[CSHealthWrapEncryptor finalizeWithError:](self->_encryptor, "finalizeWithError:", 0);
  encryptor = self->_encryptor;
  self->_encryptor = 0;

  if (self->_shouldCloseStream)
    -[NSOutputStream close](self->_outputStream, "close");
  outputStream = self->_outputStream;
  self->_outputStream = 0;

  self->_startedWithStream = 0;
  if (self->_outputURL)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    objc_msgSend(v6, "removeItemAtURL:error:", self->_outputURL, 0);

    outputURL = self->_outputURL;
    self->_outputURL = 0;

  }
  self->_started = 0;
}

- (NSURL)outputURL
{
  return self->_outputURL;
}

- (void)receiveSinkContent:(id)a3
{
  id v4;
  NSObject *encryptQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  encryptQueue = self->_encryptQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100019FAC;
  block[3] = &unk_100346F38;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(encryptQueue, block);

}

- (void)sinkContentFinished
{
  NSObject *encryptQueue;
  _QWORD block[5];

  encryptQueue = self->_encryptQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001A054;
  block[3] = &unk_100346F10;
  block[4] = self;
  dispatch_sync(encryptQueue, block);
}

- (CSHealthWrapMessageConfiguration)configuration
{
  return self->_configuration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_lastError, 0);
  objc_storeStrong((id *)&self->_encryptQueue, 0);
  objc_storeStrong((id *)&self->_outputStream, 0);
  objc_storeStrong((id *)&self->_outputURL, 0);
  objc_storeStrong((id *)&self->_encryptor, 0);
  objc_storeStrong((id *)&self->_compressionEngine, 0);
  objc_storeStrong((id *)&self->_studyUUID, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_payloadHeader, 0);
}

@end
