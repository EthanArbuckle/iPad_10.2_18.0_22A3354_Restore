@implementation PETServiceMessageCompressor

- (PETServiceMessageCompressor)init
{
  char *v2;
  NSMutableData *v3;
  void *v4;
  id v5;
  void *v6;
  NSMutableData *v7;
  PETServiceMessageCompressor *v8;
  uint8_t v10[16];
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PETServiceMessageCompressor;
  v2 = -[PETServiceMessageCompressor init](&v11, "init");
  if (!v2)
    goto LABEL_4;
  v3 = objc_opt_new(NSMutableData);
  v4 = (void *)*((_QWORD *)v2 + 1);
  *((_QWORD *)v2 + 1) = v3;

  v5 = objc_msgSend(objc_alloc((Class)NSMutableData), "initWithLength:", 0x10000);
  v6 = (void *)*((_QWORD *)v2 + 2);
  *((_QWORD *)v2 + 2) = v5;

  if (compression_stream_init((compression_stream *)(v2 + 24), COMPRESSION_STREAM_ENCODE, COMPRESSION_ZLIB) != COMPRESSION_STATUS_ERROR)
  {
    *((_QWORD *)v2 + 3) = objc_msgSend(*((id *)v2 + 2), "mutableBytes");
    *((_QWORD *)v2 + 4) = 0x10000;
    v7 = objc_opt_new(NSMutableData);
    objc_msgSend(v2, "setCompressedMessages:", v7);

    v2[64] = 0;
LABEL_4:
    v8 = v2;
    goto LABEL_8;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v10 = 0;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Failed to initialize the compressor", v10, 2u);
  }
  v8 = 0;
LABEL_8:

  return v8;
}

- (void)addMessage:(id)a3
{
  void *v4;
  id v5;

  if (!self->_closed)
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "data"));
    v4 = malloc_type_malloc(0xAuLL, 0xA811621AuLL);
    -[NSMutableData appendBytes:length:](self->_srcBuf, "appendBytes:length:", v4, PBDataWriterWriteBareVarint(v4, objc_msgSend(v5, "length")));
    -[NSMutableData appendData:](self->_srcBuf, "appendData:", v5);
    if (-[NSMutableData length](self->_srcBuf, "length") >= 0x10000)
      -[PETServiceMessageCompressor _flushBuffer](self, "_flushBuffer");
    free(v4);

  }
}

- (void)_flushBuffer
{
  NSMutableData *v3;
  NSMutableData *v4;
  NSMutableData *srcBuf;
  NSMutableData *v6;
  NSUInteger v7;
  unint64_t v8;
  void *v9;
  __int16 v10[8];

  v3 = self->_srcBuf;
  v4 = objc_opt_new(NSMutableData);
  srcBuf = self->_srcBuf;
  self->_srcBuf = v4;

  v6 = objc_retainAutorelease(v3);
  self->_stream.src_ptr = (char *)-[NSMutableData bytes](v6, "bytes");
  v7 = -[NSMutableData length](v6, "length");
  self->_stream.src_size = v7;
  if (v7)
  {
    while (compression_stream_process((compression_stream *)&self->_stream, 0) != COMPRESSION_STATUS_ERROR)
    {
      v8 = 0x10000 - self->_stream.dst_size;
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[PETServiceMessageCompressor compressedMessages](self, "compressedMessages"));
      objc_msgSend(v9, "appendBytes:length:", -[NSMutableData bytes](self->_dstBuf, "bytes"), v8);

      self->_stream.dst_ptr = (char *)-[NSMutableData mutableBytes](self->_dstBuf, "mutableBytes");
      self->_stream.dst_size = 0x10000;
      if (!self->_stream.src_size)
        goto LABEL_8;
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      v10[0] = 0;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Error while compressing the source buffer", (uint8_t *)v10, 2u);
    }
    -[PETServiceMessageCompressor _errorClose](self, "_errorClose");
  }
LABEL_8:

}

- (void)_errorClose
{
  self->_closed = 1;
  -[PETServiceMessageCompressor setCompressedMessages:](self, "setCompressedMessages:", 0);
  compression_stream_destroy((compression_stream *)&self->_stream);
}

- (void)close
{
  compression_status v3;
  compression_status v4;
  unint64_t v5;
  void *v6;
  uint8_t v7[16];

  if (!self->_closed)
  {
    -[PETServiceMessageCompressor _flushBuffer](self, "_flushBuffer");
    while (1)
    {
      v3 = compression_stream_process((compression_stream *)&self->_stream, 1);
      if (v3 == COMPRESSION_STATUS_ERROR)
        break;
      v4 = v3;
      v5 = 0x10000 - self->_stream.dst_size;
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[PETServiceMessageCompressor compressedMessages](self, "compressedMessages"));
      objc_msgSend(v6, "appendBytes:length:", -[NSMutableData bytes](self->_dstBuf, "bytes"), v5);

      if (v4 == COMPRESSION_STATUS_END)
      {
        self->_closed = 1;
        compression_stream_destroy((compression_stream *)&self->_stream);
        return;
      }
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v7 = 0;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Error while finializing the compression stream", v7, 2u);
    }
    -[PETServiceMessageCompressor _errorClose](self, "_errorClose");
  }
}

- (NSMutableData)compressedMessages
{
  return (NSMutableData *)objc_getProperty(self, a2, 72, 1);
}

- (void)setCompressedMessages:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_compressedMessages, 0);
  objc_storeStrong((id *)&self->_dstBuf, 0);
  objc_storeStrong((id *)&self->_srcBuf, 0);
}

+ (id)decompress:(id)a3
{
  id v3;
  uint8_t *v4;
  NSMutableData *v5;
  id v6;
  compression_status v7;
  compression_status v8;
  NSMutableArray *v9;
  unint64_t v10;
  NSMutableData *v11;
  uint64_t v12;
  NSMutableData *v13;
  char *v14;
  void *v15;
  uint64_t v17;
  uint8_t buf[16];
  compression_stream stream;

  v3 = a3;
  memset(&stream, 0, sizeof(stream));
  compression_stream_init(&stream, COMPRESSION_STREAM_DECODE, COMPRESSION_ZLIB);
  v4 = (uint8_t *)malloc_type_malloc(0x10000uLL, 0x5EAF0B59uLL);
  v5 = objc_opt_new(NSMutableData);
  v6 = objc_retainAutorelease(v3);
  stream.src_ptr = (const uint8_t *)objc_msgSend(v6, "bytes");
  stream.src_size = (size_t)objc_msgSend(v6, "length");
  stream.dst_ptr = v4;
  stream.dst_size = 0x10000;
  while (1)
  {
    v7 = compression_stream_process(&stream, 1);
    if (v7 == COMPRESSION_STATUS_ERROR)
      break;
    v8 = v7;
    -[NSMutableData appendBytes:length:](v5, "appendBytes:length:", v4, 0x10000 - stream.dst_size);
    stream.dst_ptr = v4;
    stream.dst_size = 0x10000;
    if (v8 == COMPRESSION_STATUS_END)
    {
      free(v4);
      compression_stream_destroy(&stream);
      v9 = objc_opt_new(NSMutableArray);
      if (-[NSMutableData length](v5, "length"))
      {
        v10 = 0;
        do
        {
          v17 = 0;
          *(_QWORD *)buf = 0;
          v11 = objc_retainAutorelease(v5);
          PBReaderReadVarIntBuf((char *)-[NSMutableData bytes](v11, "bytes") + v10, (char *)-[NSMutableData length](v11, "length") - v10, buf, &v17);
          v12 = v17 + v10;
          v13 = objc_retainAutorelease(v11);
          v14 = (char *)-[NSMutableData bytes](v13, "bytes");
          v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", &v14[v12], *(_QWORD *)buf));
          v10 = *(_QWORD *)buf + v12;
          -[NSMutableArray addObject:](v9, "addObject:", v15);

        }
        while (v10 < -[NSMutableData length](v13, "length"));
      }
      goto LABEL_11;
    }
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Error decompressing", buf, 2u);
  }
  v9 = 0;
LABEL_11:

  return v9;
}

@end
