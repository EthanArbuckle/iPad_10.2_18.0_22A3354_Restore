@implementation ISHashedDownloadProvider

- (ISHashedDownloadProvider)init
{
  ISHashedDownloadProvider *v2;
  ISHashedDownloadProvider *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ISHashedDownloadProvider;
  v2 = -[ISDataProvider init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    CC_MD5_Init(&v2->_md5Context);
    v3->_fileDescriptor = -1;
    v3->_shouldResumeFromLocalBytes = 1;
  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  -[ISHashedDownloadProvider _closeFile](self, "_closeFile");

  v3.receiver = self;
  v3.super_class = (Class)ISHashedDownloadProvider;
  -[ISHashedDownloadProvider dealloc](&v3, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ISHashedDownloadProvider;
  v5 = -[ISDataProvider copyWithZone:](&v7, sel_copyWithZone_);
  v5[15] = -[NSArray copyWithZone:](-[ISHashedDownloadProvider hashes](self, "hashes"), "copyWithZone:", a3);
  v5[17] = -[NSString copyWithZone:](-[ISHashedDownloadProvider localFilePath](self, "localFilePath"), "copyWithZone:", a3);
  v5[30] = -[ISHashedDownloadProvider numberOfBytesToHash](self, "numberOfBytesToHash");
  return v5;
}

- (BOOL)canStreamContentLength:(int64_t)a3 error:(id *)a4
{
  uint64_t v7;
  NSObject *v8;
  ISDevice *v9;
  id v10;
  char v11;
  _QWORD v13[9];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  void (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  uint64_t v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;

  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 1;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3052000000;
  v17 = __Block_byref_object_copy__5;
  v18 = __Block_byref_object_dispose__5;
  v19 = 0;
  if ((a3 & 0x8000000000000000) == 0)
  {
    v7 = objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", self->_localFilePath);
    v8 = dispatch_semaphore_create(0);
    v9 = +[ISDevice sharedInstance](ISDevice, "sharedInstance");
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __57__ISHashedDownloadProvider_canStreamContentLength_error___block_invoke;
    v13[3] = &unk_24C43C7D8;
    v13[5] = v8;
    v13[6] = &v14;
    v13[7] = &v20;
    v13[8] = a3;
    v13[4] = self;
    -[ISDevice requestFreeSpace:atPath:withOptions:completionBlock:](v9, "requestFreeSpace:atPath:withOptions:completionBlock:", a3, v7, 0, v13);
    dispatch_semaphore_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
    dispatch_release(v8);
    v10 = (id)v15[5];
  }
  if (a4)
    *a4 = (id)v15[5];
  v11 = *((_BYTE *)v21 + 24);
  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v20, 8);
  return v11;
}

intptr_t __57__ISHashedDownloadProvider_canStreamContentLength_error___block_invoke(uint64_t a1, int a2, uint64_t a3, uint64_t a4)
{
  void *v8;
  int v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v16;
  int v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  if (!a2)
  {
    v8 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
    if (!v8)
      v8 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v9 = objc_msgSend(v8, "shouldLog");
    if (objc_msgSend(v8, "shouldLogToDisk"))
      v10 = v9 | 2;
    else
      v10 = v9;
    if (!os_log_type_enabled((os_log_t)objc_msgSend(v8, "OSLogObject"), OS_LOG_TYPE_ERROR))
      v10 &= 2u;
    if (v10)
    {
      v11 = objc_opt_class();
      v12 = *(_QWORD *)(a1 + 64);
      v17 = 138413058;
      v18 = v11;
      v19 = 2048;
      v20 = v12;
      v21 = 2048;
      v22 = a3;
      v23 = 2112;
      v24 = a4;
      LODWORD(v16) = 42;
      v13 = _os_log_send_and_compose_impl();
      if (v13)
      {
        v14 = (void *)v13;
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v13, 4, &v17, v16);
        free(v14);
        SSFileLog();
      }
    }
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = SSGetNotEnoughDiskSpaceErrorWithCount();
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = (id)SSErrorBySettingUserInfoValue();
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = a2 != 0;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (id)closeStream
{
  objc_super v4;

  -[ISHashedDownloadProvider _closeFile](self, "_closeFile");
  v4.receiver = self;
  v4.super_class = (Class)ISHashedDownloadProvider;
  return -[ISDataProvider closeStream](&v4, sel_closeStream);
}

- (BOOL)isStream
{
  return 1;
}

- (BOOL)parseData:(id)a3 returningError:(id *)a4
{
  BOOL result;
  void *v8;
  int v9;
  int v10;
  uint64_t v11;
  int fileDescriptor;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  int v18;
  uint64_t v19;
  __int16 v20;
  int v21;
  __int16 v22;
  NSString *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v17 = 0;
  if ((self->_fileDescriptor & 0x80000000) == 0)
  {
    if (-[ISHashedDownloadProvider numberOfBytesToHash](self, "numberOfBytesToHash"))
    {
      result = -[ISHashedDownloadProvider _writeDataWithHashing:returningError:](self, "_writeDataWithHashing:returningError:", a3, &v17);
      if (!a4)
        return result;
    }
    else
    {
      result = -[ISHashedDownloadProvider _writeDataWithoutHashing:returningError:](self, "_writeDataWithoutHashing:returningError:", a3, &v17);
      if (!a4)
        return result;
    }
    goto LABEL_16;
  }
  v8 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig", a3);
  if (!v8)
    v8 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
  v9 = objc_msgSend(v8, "shouldLog");
  if (objc_msgSend(v8, "shouldLogToDisk"))
    v10 = v9 | 2;
  else
    v10 = v9;
  if (!os_log_type_enabled((os_log_t)objc_msgSend(v8, "OSLogObject"), OS_LOG_TYPE_ERROR))
    v10 &= 2u;
  if (v10)
  {
    v11 = objc_opt_class();
    fileDescriptor = self->_fileDescriptor;
    v18 = 138412802;
    v19 = v11;
    v20 = 1024;
    v21 = fileDescriptor;
    v22 = 2112;
    v23 = -[ISHashedDownloadProvider localFilePath](self, "localFilePath");
    LODWORD(v16) = 28;
    v13 = _os_log_send_and_compose_impl();
    if (v13)
    {
      v14 = (void *)v13;
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v13, 4, &v18, v16);
      free(v14);
      SSFileLog();
    }
  }
  v15 = ISError();
  result = 0;
  v17 = (void *)v15;
  if (a4)
LABEL_16:
    *a4 = v17;
  return result;
}

- (void)resetStream
{
  objc_super v3;

  if (-[ISHashedDownloadProvider _openFile](self, "_openFile"))
    -[ISHashedDownloadProvider _truncateToSize:](self, "_truncateToSize:", 0);
  v3.receiver = self;
  v3.super_class = (Class)ISHashedDownloadProvider;
  -[ISDataProvider resetStream](&v3, sel_resetStream);
}

- (void)setup
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  int v6;
  int v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  int v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  int *v18;
  int *v19;
  uint64_t v20;
  objc_super v21;
  int v22;
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  -[ISHashedDownloadProvider _openFile](self, "_openFile");
  v3 = -[ISHashedDownloadProvider streamedBytes](self, "streamedBytes");
  if (v3 >= 1)
  {
    v4 = v3;
    v5 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
    if (!v5)
      v5 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v6 = objc_msgSend(v5, "shouldLog");
    if (objc_msgSend(v5, "shouldLogToDisk"))
      v7 = v6 | 2;
    else
      v7 = v6;
    if (!os_log_type_enabled((os_log_t)objc_msgSend(v5, "OSLogObject"), OS_LOG_TYPE_INFO))
      v7 &= 2u;
    if (v7)
    {
      v22 = 138412546;
      v23 = objc_opt_class();
      v24 = 2048;
      v25 = v4;
      LODWORD(v20) = 22;
      v18 = &v22;
      v8 = _os_log_send_and_compose_impl();
      if (v8)
      {
        v9 = (void *)v8;
        v10 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v8, 4, &v22, v20);
        free(v9);
        v18 = (int *)v10;
        SSFileLog();
      }
    }
    if (-[ISHashedDownloadProvider shouldResumeFromLocalBytes](self, "shouldResumeFromLocalBytes", v18))
    {
      if (-[ISHashedDownloadProvider numberOfBytesToHash](self, "numberOfBytesToHash") >= 1
        && !-[ISHashedDownloadProvider validatedBytes](self, "validatedBytes"))
      {
        -[ISHashedDownloadProvider setValidatedBytes:](self, "setValidatedBytes:", -[ISHashedDownloadProvider _verifiedBytesByInitializingHashForFileSize:](self, "_verifiedBytesByInitializingHashForFileSize:", v4));
      }
    }
    else
    {
      v11 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
      if (!v11)
        v11 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v12 = objc_msgSend(v11, "shouldLog");
      if (objc_msgSend(v11, "shouldLogToDisk"))
        v13 = v12 | 2;
      else
        v13 = v12;
      if (!os_log_type_enabled((os_log_t)objc_msgSend(v11, "OSLogObject"), OS_LOG_TYPE_ERROR))
        v13 &= 2u;
      if (v13)
      {
        v14 = objc_opt_class();
        v22 = 138412290;
        v23 = v14;
        LODWORD(v20) = 12;
        v19 = &v22;
        v15 = _os_log_send_and_compose_impl();
        if (v15)
        {
          v16 = (void *)v15;
          v17 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v15, 4, &v22, v20);
          free(v16);
          v19 = (int *)v17;
          SSFileLog();
        }
      }
      -[ISHashedDownloadProvider _truncateToSize:](self, "_truncateToSize:", 0, v19);
    }
  }
  v21.receiver = self;
  v21.super_class = (Class)ISHashedDownloadProvider;
  -[ISDataProvider setup](&v21, sel_setup);
}

- (BOOL)_checkHashForByteCount:(int64_t)a3
{
  void *v5;
  uint64_t v6;
  float v7;
  uint64_t v8;
  id v9;
  char v10;
  void *v11;
  int v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  ISHashError *v17;
  uint64_t v19;
  int v20;
  uint64_t v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  int64_t v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  id v29;
  unsigned __int8 md[16];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  CC_MD5_Final(md, &self->_md5Context);
  v5 = ISStringFromDigest(md, 0x10u);
  v6 = -[ISHashedDownloadProvider numberOfBytesToHash](self, "numberOfBytesToHash");
  v7 = (double)a3 / (double)v6;
  v8 = (uint64_t)(float)(ceilf(v7) + -1.0);
  v9 = -[NSArray objectAtIndex:](-[ISHashedDownloadProvider hashes](self, "hashes"), "objectAtIndex:", v8);
  v10 = objc_msgSend(v5, "isEqualToString:", v9);
  if ((v10 & 1) == 0)
  {
    v11 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
    if (!v11)
      v11 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v12 = objc_msgSend(v11, "shouldLog");
    if (objc_msgSend(v11, "shouldLogToDisk"))
      v13 = v12 | 2;
    else
      v13 = v12;
    if (!os_log_type_enabled((os_log_t)objc_msgSend(v11, "OSLogObject"), OS_LOG_TYPE_ERROR))
      v13 &= 2u;
    if (v13)
    {
      v20 = 138413314;
      v14 = v6 * v8;
      v21 = objc_opt_class();
      v22 = 2048;
      v23 = v14;
      v24 = 2048;
      v25 = a3;
      v26 = 2112;
      v27 = v5;
      v28 = 2112;
      v29 = v9;
      LODWORD(v19) = 52;
      v15 = _os_log_send_and_compose_impl();
      if (v15)
      {
        v16 = (void *)v15;
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v15, 4, &v20, v19);
        free(v16);
        SSFileLog();
      }
    }
    else
    {
      v14 = v6 * v8;
    }
    v17 = objc_alloc_init(ISHashError);
    -[ISHashError setActualHashString:](v17, "setActualHashString:", v5);
    -[ISHashError setExpectedHashString:](v17, "setExpectedHashString:", v9);
    -[ISHashError setRangeEnd:](v17, "setRangeEnd:", a3);
    -[ISHashError setRangeStart:](v17, "setRangeStart:", v14);
    -[ISHashedDownloadProvider setLastHashError:](self, "setLastHashError:", v17);

  }
  return v10;
}

- (void)_closeFile
{
  int fileDescriptor;

  fileDescriptor = self->_fileDescriptor;
  if (fileDescriptor != -1)
  {
    close(fileDescriptor);
    self->_fileDescriptor = -1;
  }
}

- (BOOL)_openFile
{
  BOOL v2;
  const char *v4;
  off_t st_size;
  int v6;
  stat v8;

  if (self->_fileDescriptor != -1)
    return 1;
  v4 = -[NSString fileSystemRepresentation](-[ISHashedDownloadProvider localFilePath](self, "localFilePath"), "fileSystemRepresentation");
  memset(&v8, 0, sizeof(v8));
  if (stat(v4, &v8) == -1)
    st_size = 0;
  else
    st_size = v8.st_size;
  if (st_size <= 0)
    v6 = open(v4, 1538, 420);
  else
    v6 = open(v4, 522, 420);
  self->_fileDescriptor = v6;
  v2 = v6 != -1;
  if (v6 != -1)
  {
    fcntl(v6, 48, 1);
    fcntl(self->_fileDescriptor, 68, 1);
    fcntl(self->_fileDescriptor, 76, 1);
    -[ISHashedDownloadProvider setStreamedBytes:](self, "setStreamedBytes:", st_size);
  }
  return v2;
}

- (BOOL)_truncateToSize:(int64_t)a3
{
  int fileDescriptor;
  BOOL v6;

  fileDescriptor = self->_fileDescriptor;
  v6 = fileDescriptor < 0 || ftruncate(fileDescriptor, a3) == 0;
  -[ISHashedDownloadProvider setStreamedBytes:](self, "setStreamedBytes:", a3);
  CC_MD5_Init(&self->_md5Context);
  return v6;
}

- (int64_t)_verifiedBytesByInitializingHashForFileSize:(int64_t)a3
{
  int64_t v5;
  off_t v6;
  int64_t v7;
  size_t v8;
  void *v9;
  void *v10;
  int64_t i;
  ssize_t v12;
  ssize_t v13;

  v5 = -[ISHashedDownloadProvider numberOfBytesToHash](self, "numberOfBytesToHash");
  v6 = 0;
  if (a3)
  {
    if (v5)
    {
      v6 = a3 / v5 * v5;
      v7 = a3 % v5;
      if (a3 % v5)
      {
        if (lseek(self->_fileDescriptor, v6, 0) == -1)
          goto LABEL_17;
        v8 = v7 >= 4096 ? 4096 : v7;
        v9 = malloc_type_malloc(v8, 0x100004077774924uLL);
        if (!v9)
          goto LABEL_17;
        v10 = v9;
        CC_MD5_Init(&self->_md5Context);
        if (v7 < 1)
        {
          i = 0;
        }
        else
        {
          for (i = 0; i < v7; i += v13)
          {
            v12 = read(self->_fileDescriptor, v10, v8);
            if (!v12)
              break;
            v13 = v12;
            if (!CC_MD5_Update(&self->_md5Context, v10, v12))
              break;
          }
        }
        free(v10);
        if (i != v7)
        {
LABEL_17:
          -[ISHashedDownloadProvider _truncateToSize:](self, "_truncateToSize:", 0);
          return 0;
        }
      }
    }
  }
  return v6;
}

- (BOOL)_writeDataWithHashing:(id)a3 returningError:(id *)a4
{
  int64_t v7;
  uint64_t v8;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  ssize_t v17;
  ssize_t v18;
  void *v19;
  void *v20;
  int v21;
  int v22;
  int v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  int64_t v27;
  int *v29;
  uint64_t v30;
  id *v31;
  int64_t v32;
  int v33;
  uint64_t v34;
  __int16 v35;
  ssize_t v36;
  __int16 v37;
  uint64_t v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v7 = -[ISDataProvider contentLength](self, "contentLength");
  v8 = -[ISHashedDownloadProvider streamedBytes](self, "streamedBytes");
  v32 = -[ISHashedDownloadProvider validatedBytes](self, "validatedBytes");
  v9 = -[ISHashedDownloadProvider numberOfBytesToHash](self, "numberOfBytesToHash");
  v10 = objc_msgSend(a3, "length");
  if (v10 >= 1)
  {
    v11 = v10;
    v31 = a4;
    v12 = 0;
    v13 = v8 % v9;
    while (1)
    {
      if (v9 - v13 >= v11 - v12)
        v14 = v11 - v12;
      else
        v14 = v9 - v13;
      if (v14 >= 1)
        CC_MD5_Update(&self->_md5Context, (const void *)(objc_msgSend(a3, "bytes") + v12), v14);
      v15 = v14 + v13;
      if (v15 == v9 || v14 + v8 == v7)
      {
        if (!-[ISHashedDownloadProvider _checkHashForByteCount:](self, "_checkHashForByteCount:"))
        {
          v19 = (void *)ISError();
          v27 = v32;
          -[ISHashedDownloadProvider _truncateToSize:](self, "_truncateToSize:", v32);
          a4 = v31;
          goto LABEL_33;
        }
        CC_MD5_Init(&self->_md5Context);
        v32 += v15;
      }
      v17 = write(self->_fileDescriptor, (const void *)(objc_msgSend(a3, "bytes") + v12), v14);
      v18 = v17;
      if (v17 < v14)
      {
        v20 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
        if (!v20)
          v20 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
        v21 = objc_msgSend(v20, "shouldLog");
        if (objc_msgSend(v20, "shouldLogToDisk"))
          v22 = v21 | 2;
        else
          v22 = v21;
        if (os_log_type_enabled((os_log_t)objc_msgSend(v20, "OSLogObject"), OS_LOG_TYPE_ERROR))
          v23 = v22;
        else
          v23 = v22 & 2;
        if (v23)
        {
          v33 = 138412802;
          v34 = objc_opt_class();
          v35 = 2048;
          v36 = v18;
          v37 = 2048;
          v38 = v14;
          LODWORD(v30) = 32;
          v29 = &v33;
          v24 = _os_log_send_and_compose_impl();
          if (v24)
          {
            v25 = (void *)v24;
            v26 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v24, 4, &v33, v30);
            free(v25);
            v29 = (int *)v26;
            SSFileLog();
          }
        }
        v19 = (void *)ISError();
        goto LABEL_31;
      }
      v13 = 0;
      v12 += v14;
      v8 += v17;
      if (v12 >= v11)
      {
        v19 = 0;
LABEL_31:
        a4 = v31;
        goto LABEL_32;
      }
    }
  }
  v19 = 0;
LABEL_32:
  v27 = v32;
LABEL_33:
  -[ISHashedDownloadProvider setStreamedBytes:](self, "setStreamedBytes:", v8, v29);
  -[ISHashedDownloadProvider setValidatedBytes:](self, "setValidatedBytes:", v27);
  if (a4)
    *a4 = v19;
  return v19 == 0;
}

- (BOOL)_writeDataWithoutHashing:(id)a3 returningError:(id *)a4
{
  size_t v7;
  ssize_t v8;
  void *v9;
  void *v10;
  int v11;
  int v12;
  uint64_t v13;
  void *v14;
  uint64_t v16;
  int v17;
  uint64_t v18;
  __int16 v19;
  size_t v20;
  __int16 v21;
  ssize_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v7 = objc_msgSend(a3, "length");
  v8 = write(self->_fileDescriptor, (const void *)objc_msgSend(a3, "bytes"), v7);
  if (v8 == v7)
  {
    -[ISHashedDownloadProvider setStreamedBytes:](self, "setStreamedBytes:", -[ISHashedDownloadProvider streamedBytes](self, "streamedBytes") + v7);
    -[ISHashedDownloadProvider setValidatedBytes:](self, "setValidatedBytes:", -[ISHashedDownloadProvider validatedBytes](self, "validatedBytes") + v7);
    v9 = 0;
    if (!a4)
      return v8 == v7;
    goto LABEL_15;
  }
  v10 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
  if (!v10)
    v10 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
  v11 = objc_msgSend(v10, "shouldLog");
  if (objc_msgSend(v10, "shouldLogToDisk"))
    v12 = v11 | 2;
  else
    v12 = v11;
  if (!os_log_type_enabled((os_log_t)objc_msgSend(v10, "OSLogObject"), OS_LOG_TYPE_ERROR))
    v12 &= 2u;
  if (v12)
  {
    v17 = 138412802;
    v18 = objc_opt_class();
    v19 = 2048;
    v20 = v7;
    v21 = 2048;
    v22 = v8;
    LODWORD(v16) = 32;
    v13 = _os_log_send_and_compose_impl();
    if (v13)
    {
      v14 = (void *)v13;
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v13, 4, &v17, v16);
      free(v14);
      SSFileLog();
    }
  }
  v9 = (void *)ISError();
  if (a4)
LABEL_15:
    *a4 = v9;
  return v8 == v7;
}

- (NSArray)hashes
{
  return (NSArray *)objc_getProperty(self, a2, 120, 1);
}

- (void)setHashes:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (ISHashError)lastHashError
{
  return (ISHashError *)objc_getProperty(self, a2, 128, 1);
}

- (void)setLastHashError:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 128);
}

- (NSString)localFilePath
{
  return (NSString *)objc_getProperty(self, a2, 136, 1);
}

- (void)setLocalFilePath:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 136);
}

- (int64_t)numberOfBytesToHash
{
  return self->_numberOfBytesToHash;
}

- (void)setNumberOfBytesToHash:(int64_t)a3
{
  self->_numberOfBytesToHash = a3;
}

- (BOOL)shouldResumeFromLocalBytes
{
  return self->_shouldResumeFromLocalBytes;
}

- (void)setShouldResumeFromLocalBytes:(BOOL)a3
{
  self->_shouldResumeFromLocalBytes = a3;
}

- (int64_t)streamedBytes
{
  return self->_totalBytesWritten;
}

- (void)setStreamedBytes:(int64_t)a3
{
  self->_totalBytesWritten = a3;
}

- (int64_t)validatedBytes
{
  return self->_validatedBytes;
}

- (void)setValidatedBytes:(int64_t)a3
{
  self->_validatedBytes = a3;
}

@end
