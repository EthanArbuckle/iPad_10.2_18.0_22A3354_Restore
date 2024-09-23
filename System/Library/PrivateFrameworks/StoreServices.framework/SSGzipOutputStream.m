@implementation SSGzipOutputStream

- (BOOL)_initializeOutputStream
{
  z_stream_s *p_stream;
  int v4;
  void *v5;
  int v6;
  int v7;
  NSObject *v8;
  void *v9;
  id v10;
  int v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v21;
  int v22;
  void *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  int v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  self->_streamContentLength = 0;
  p_stream = &self->_stream;
  self->_stream.zfree = 0;
  self->_stream.opaque = 0;
  self->_stream.zalloc = 0;
  v4 = deflateInit2_(&self->_stream, -1, 8, 31, 8, 0, "1.2.12", 112);
  if (!v4)
  {
    self->_streamOutBufferSize = 4096;
    v19 = (char *)malloc_type_malloc(0x1000uLL, 0xC9854348uLL);
    self->_streamOutBuffer = v19;
    p_stream->next_out = (Bytef *)v19;
    p_stream->avail_out = self->_streamOutBufferSize;
    return v4 == 0;
  }
  +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v6 = objc_msgSend(v5, "shouldLog");
  if (objc_msgSend(v5, "shouldLogToDisk"))
    v7 = v6 | 2;
  else
    v7 = v6;
  objc_msgSend(v5, "OSLogObject");
  v8 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    v7 &= 2u;
  if (!v7)
    goto LABEL_12;
  v9 = (void *)objc_opt_class();
  v10 = v9;
  v11 = *__error();
  v22 = 138543874;
  v23 = v9;
  v24 = 1026;
  v25 = v4;
  v26 = 1026;
  v27 = v11;
  LODWORD(v21) = 24;
  v12 = (void *)_os_log_send_and_compose_impl();

  if (v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v12, 4, &v22, v21);
    v8 = objc_claimAutoreleasedReturnValue();
    free(v12);
    SSFileLog(v5, CFSTR("%@"), v13, v14, v15, v16, v17, v18, (uint64_t)v8);
LABEL_12:

  }
  return v4 == 0;
}

- (id)initToFileAtPath:(id)a3 append:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  _QWORD *v7;
  uint64_t v8;
  void *v9;
  _QWORD *v10;
  void *v11;
  int v12;
  int v13;
  NSObject *v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v26;
  objc_super v27;
  int v28;
  void *v29;
  uint64_t v30;

  v4 = a4;
  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v27.receiver = self;
  v27.super_class = (Class)SSGzipOutputStream;
  v7 = -[SSGzipOutputStream initToMemory](&v27, sel_initToMemory);
  if (v7)
  {
    v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E48]), "initToFileAtPath:append:", v6, v4);
    v9 = (void *)v7[17];
    v7[17] = v8;

    if (!objc_msgSend(v7, "_initializeOutputStream") || !v7[17])
    {
      +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v11)
      {
        +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v12 = objc_msgSend(v11, "shouldLog");
      if (objc_msgSend(v11, "shouldLogToDisk"))
        v13 = v12 | 2;
      else
        v13 = v12;
      objc_msgSend(v11, "OSLogObject");
      v14 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        v13 &= 2u;
      if (v13)
      {
        v15 = (void *)objc_opt_class();
        v28 = 138543362;
        v29 = v15;
        v16 = v15;
        LODWORD(v26) = 12;
        v17 = (void *)_os_log_send_and_compose_impl();

        if (!v17)
        {
LABEL_16:

          v24 = (void *)v7[17];
          v7[17] = 0;

          v10 = 0;
          goto LABEL_17;
        }
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v17, 4, &v28, v26);
        v14 = objc_claimAutoreleasedReturnValue();
        free(v17);
        SSFileLog(v11, CFSTR("%@"), v18, v19, v20, v21, v22, v23, (uint64_t)v14);
      }

      goto LABEL_16;
    }
  }
  v10 = v7;
LABEL_17:

  return v10;
}

- (id)initToMemory
{
  _QWORD *v2;
  uint64_t v3;
  void *v4;
  _QWORD *v5;
  void *v6;
  int v7;
  int v8;
  NSObject *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v21;
  objc_super v22;
  int v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v22.receiver = self;
  v22.super_class = (Class)SSGzipOutputStream;
  v2 = -[SSGzipOutputStream initToMemory](&v22, sel_initToMemory);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E48]), "initToMemory");
    v4 = (void *)v2[17];
    v2[17] = v3;

    if (!objc_msgSend(v2, "_initializeOutputStream") || !v2[17])
    {
      +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v6)
      {
        +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v7 = objc_msgSend(v6, "shouldLog");
      if (objc_msgSend(v6, "shouldLogToDisk"))
        v8 = v7 | 2;
      else
        v8 = v7;
      objc_msgSend(v6, "OSLogObject");
      v9 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        v8 &= 2u;
      if (v8)
      {
        v10 = (void *)objc_opt_class();
        v23 = 138543362;
        v24 = v10;
        v11 = v10;
        LODWORD(v21) = 12;
        v12 = (void *)_os_log_send_and_compose_impl();

        if (!v12)
        {
LABEL_16:

          v19 = (void *)v2[17];
          v2[17] = 0;

          v5 = 0;
          goto LABEL_17;
        }
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v12, 4, &v23, v21);
        v9 = objc_claimAutoreleasedReturnValue();
        free(v12);
        SSFileLog(v6, CFSTR("%@"), v13, v14, v15, v16, v17, v18, (uint64_t)v9);
      }

      goto LABEL_16;
    }
  }
  v5 = v2;
LABEL_17:

  return v5;
}

- (void)dealloc
{
  z_stream_s *p_stream;
  char *streamOutBuffer;
  objc_super v5;

  p_stream = &self->_stream;
  p_stream->next_out = 0;
  p_stream->avail_out = 0;
  deflateEnd(p_stream);
  streamOutBuffer = self->_streamOutBuffer;
  if (streamOutBuffer)
    free(streamOutBuffer);
  v5.receiver = self;
  v5.super_class = (Class)SSGzipOutputStream;
  -[SSGzipOutputStream dealloc](&v5, sel_dealloc);
}

- (void)open
{
  -[NSOutputStream open](self->_backingStream, "open");
}

- (void)close
{
  void *v3;
  uint64_t v4;
  int64_t v5;
  void *v6;
  int v7;
  int v8;
  NSObject *v9;
  void *v10;
  uLong total_in;
  uLong total_out;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _BYTE *v21;
  uint64_t v22;
  _BYTE v23[24];
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  -[SSGzipOutputStream streamError](self, "streamError");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    while (1)
    {
      self->_stream.next_in = 0;
      self->_stream.avail_in = 0;
      v4 = deflate(&self->_stream, 4);
      if (v4 >= 2)
        break;
      v5 = -[SSGzipOutputStream _consumeStreamOutput:](self, "_consumeStreamOutput:", 1);
      if ((_DWORD)v4 == 1 || v5 == -1)
        goto LABEL_7;
    }
    -[SSGzipOutputStream _setStreamError:context:](self, "_setStreamError:context:", v4, CFSTR("close"));
LABEL_7:
    self->_streamContentLength = self->_stream.total_out;
    +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v7 = objc_msgSend(v6, "shouldLog");
    if (objc_msgSend(v6, "shouldLogToDisk"))
      v8 = v7 | 2;
    else
      v8 = v7;
    objc_msgSend(v6, "OSLogObject");
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      v8 &= 2u;
    if (v8)
    {
      v10 = (void *)objc_opt_class();
      total_in = self->_stream.total_in;
      total_out = self->_stream.total_out;
      *(_DWORD *)v23 = 138544130;
      *(_QWORD *)&v23[4] = v10;
      *(_WORD *)&v23[12] = 1026;
      *(_DWORD *)&v23[14] = total_in;
      *(_WORD *)&v23[18] = 1026;
      *(_DWORD *)&v23[20] = total_out;
      LOWORD(v24) = 1026;
      *(_DWORD *)((char *)&v24 + 2) = v4;
      v13 = v10;
      LODWORD(v22) = 30;
      v21 = v23;
      v14 = (void *)_os_log_send_and_compose_impl();

      if (!v14)
      {
LABEL_18:

        -[SSGzipOutputStream _setStreamError:context:](self, "_setStreamError:context:", deflateEnd(&self->_stream), CFSTR("close"));
        goto LABEL_19;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v14, 4, v23, v22, *(_OWORD *)v23, *(_QWORD *)&v23[16], v24);
      v9 = objc_claimAutoreleasedReturnValue();
      free(v14);
      SSFileLog(v6, CFSTR("%@"), v15, v16, v17, v18, v19, v20, (uint64_t)v9);
    }

    goto LABEL_18;
  }
LABEL_19:
  -[NSOutputStream close](self->_backingStream, "close", v21);
}

- (unint64_t)streamContentLength
{
  return self->_streamContentLength;
}

- (unint64_t)streamStatus
{
  if (self->_streamError)
    return 7;
  else
    return -[NSOutputStream streamStatus](self->_backingStream, "streamStatus");
}

- (id)streamError
{
  NSError *streamError;

  streamError = self->_streamError;
  if (streamError)
    return streamError;
  -[NSOutputStream streamError](self->_backingStream, "streamError");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int64_t)write:(const char *)a3 maxLength:(unint64_t)a4
{
  void *v7;
  void *v8;
  int v9;
  int v10;
  NSObject *v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  int v25;
  void *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  -[SSGzipOutputStream streamError](self, "streamError");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v9 = objc_msgSend(v8, "shouldLog");
    if (objc_msgSend(v8, "shouldLogToDisk"))
      v10 = v9 | 2;
    else
      v10 = v9;
    objc_msgSend(v8, "OSLogObject");
    v11 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      v10 &= 2u;
    if (v10)
    {
      v12 = (void *)objc_opt_class();
      v13 = v12;
      -[SSGzipOutputStream streamError](self, "streamError");
      v25 = 138543618;
      v26 = v12;
      v27 = 2114;
      v28 = (id)objc_claimAutoreleasedReturnValue();
      LODWORD(v24) = 22;
      v14 = (void *)_os_log_send_and_compose_impl();

      if (!v14)
        goto LABEL_13;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v14, 4, &v25, v24);
      v11 = objc_claimAutoreleasedReturnValue();
      free(v14);
      SSFileLog(v8, CFSTR("%@"), v15, v16, v17, v18, v19, v20, (uint64_t)v11);
    }

LABEL_13:
    return -1;
  }
  self->_stream.next_in = (Bytef *)a3;
  self->_stream.avail_in = a4;
  do
  {
    self->_stream.next_out = (Bytef *)self->_streamOutBuffer;
    self->_stream.avail_out = self->_streamOutBufferSize;
    v22 = deflate(&self->_stream, 0);
    if (v22 >= 2)
    {
      -[SSGzipOutputStream _setStreamError:context:](self, "_setStreamError:context:", v22, CFSTR("write:maxLength:"));
      return -1;
    }
    if (-[SSGzipOutputStream _consumeStreamOutput:](self, "_consumeStreamOutput:", 1) == -1)
      return -1;
  }
  while (!self->_stream.avail_out);
  self->_stream.next_in = 0;
  self->_stream.avail_in = 0;
  -[SSGzipOutputStream streamError](self, "streamError");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23)
    a4 = -1;

  return a4;
}

- (BOOL)hasSpaceAvailable
{
  return -[NSOutputStream hasSpaceAvailable](self->_backingStream, "hasSpaceAvailable");
}

- (id)propertyForKey:(id)a3
{
  return (id)-[NSOutputStream propertyForKey:](self->_backingStream, "propertyForKey:", a3);
}

- (BOOL)setProperty:(id)a3 forKey:(id)a4
{
  return -[NSOutputStream setProperty:forKey:](self->_backingStream, "setProperty:forKey:", a3, a4);
}

- (int64_t)_consumeStreamOutput:(BOOL)a3
{
  z_stream_s *p_stream;
  uint64_t avail_out;
  unint64_t streamOutBufferSize;
  int64_t result;

  p_stream = &self->_stream;
  avail_out = self->_stream.avail_out;
  if (!a3)
  {
    if ((_DWORD)avail_out)
      return 0;
    avail_out = 0;
  }
  streamOutBufferSize = self->_streamOutBufferSize;
  if (streamOutBufferSize == avail_out)
    return 0;
  result = -[NSOutputStream write:maxLength:](self->_backingStream, "write:maxLength:", self->_streamOutBuffer, streamOutBufferSize - avail_out);
  p_stream->next_out = (Bytef *)self->_streamOutBuffer;
  p_stream->avail_out = self->_streamOutBufferSize;
  return result;
}

- (void)_setStreamError:(int)a3 context:(id)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  int v10;
  int v11;
  NSObject *v12;
  void *v13;
  id v14;
  int v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSError *v28;
  NSError *streamError;
  uint64_t v30;
  _QWORD v31[5];
  _QWORD v32[5];
  int v33;
  void *v34;
  __int16 v35;
  int v36;
  __int16 v37;
  int v38;
  __int16 v39;
  id v40;
  uint64_t v41;

  v4 = *(_QWORD *)&a3;
  v41 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (v4 >= 2)
  {
    -[SSGzipOutputStream streamError](self, "streamError");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      v8 = *__error();
      +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v9)
      {
        +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v10 = objc_msgSend(v9, "shouldLog");
      if (objc_msgSend(v9, "shouldLogToDisk"))
        v11 = v10 | 2;
      else
        v11 = v10;
      objc_msgSend(v9, "OSLogObject");
      v12 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        v11 &= 2u;
      if (v11)
      {
        v13 = (void *)objc_opt_class();
        v14 = v13;
        v15 = *__error();
        v33 = 138544130;
        v34 = v13;
        v35 = 1026;
        v36 = v4;
        v37 = 1026;
        v38 = v15;
        v39 = 2114;
        v40 = v6;
        LODWORD(v30) = 34;
        v16 = (void *)_os_log_send_and_compose_impl();

        if (!v16)
        {
LABEL_14:

          v31[0] = CFSTR("avail_in");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_stream.avail_in);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v32[0] = v23;
          v31[1] = CFSTR("avail_out");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_stream.avail_out);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v32[1] = v24;
          v31[2] = CFSTR("error");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v4);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v32[2] = v25;
          v31[3] = CFSTR("errno");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v8);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v31[4] = CFSTR("context");
          v32[3] = v26;
          v32[4] = v6;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, v31, 5);
          v27 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("SSGzipOutputStream"), (int)v4, v27);
          v28 = (NSError *)objc_claimAutoreleasedReturnValue();
          streamError = self->_streamError;
          self->_streamError = v28;

          deflateEnd(&self->_stream);
          goto LABEL_15;
        }
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v16, 4, &v33, v30);
        v12 = objc_claimAutoreleasedReturnValue();
        free(v16);
        SSFileLog(v9, CFSTR("%@"), v17, v18, v19, v20, v21, v22, (uint64_t)v12);
      }

      goto LABEL_14;
    }
  }
LABEL_15:

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_streamError, 0);
  objc_storeStrong((id *)&self->_backingStream, 0);
}

@end
