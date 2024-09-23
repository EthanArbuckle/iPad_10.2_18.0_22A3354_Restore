@implementation CRLStreamCompression

- (CRLStreamCompression)initWithAlgorithm:(int)a3 operation:(int)a4
{
  char *v6;
  CRLStreamCompression *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CRLStreamCompression;
  v6 = -[CRLStreamCompression init](&v9, "init");
  v7 = (CRLStreamCompression *)v6;
  if (v6)
  {
    compression_stream_init((compression_stream *)(v6 + 16), (compression_stream_operation)a4, (compression_algorithm)a3);
    v7->_stream.dst_ptr = (char *)&unk_1014152F8;
    v7->_stream.dst_size = 0;
    v7->_stream.src_ptr = (char *)&unk_1014152F8;
    v7->_stream.src_size = 0;
    v7->_operation = a4;
    v7->_status = 0;
  }
  return v7;
}

- (void)dealloc
{
  objc_super v3;

  compression_stream_destroy((compression_stream *)&self->_stream);
  v3.receiver = self;
  v3.super_class = (Class)CRLStreamCompression;
  -[CRLStreamCompression dealloc](&v3, "dealloc");
}

- (BOOL)processBytes:(char *)a3 size:(unint64_t)a4
{
  return -[CRLStreamCompression processBytes:size:flags:](self, "processBytes:size:flags:", a3, a4, 0);
}

- (BOOL)didFinishProcessing
{
  return -[CRLStreamCompression processBytes:size:flags:](self, "processBytes:size:flags:", &unk_1014152F8, 0, 1);
}

- (BOOL)processBytes:(char *)a3 size:(unint64_t)a4 flags:(int)a5
{
  int status;
  BOOL result;
  compression_stream *p_stream;
  int v11;
  uint8_t *v12;
  unint64_t dst_size;
  void *v14;
  uint8_t *dst_ptr;
  dispatch_data_t v17;
  id handler;
  id v19;
  void (**v20)(id, CRLStreamCompression *, uint64_t, _QWORD, void *);
  void *v21;
  id v22;
  id v23;
  uint64_t (**v24)(id, CRLStreamCompression *, uint64_t, void *, _QWORD);
  id v25;

  status = self->_status;
  if (status)
    return !a4 && status == 1;
  p_stream = (compression_stream *)&self->_stream;
  self->_stream.src_ptr = a3;
  self->_stream.src_size = a4;
  while (1)
  {
    if (self->_stream.dst_size)
      goto LABEL_10;
    dst_ptr = p_stream->dst_ptr;
    if (!p_stream->dst_ptr || dst_ptr == (uint8_t *)&unk_1014152F8)
      goto LABEL_46;
    v17 = dispatch_data_create(dst_ptr - 1024, 0x400uLL, 0, _dispatch_data_destructor_free);
    self->_stream.dst_ptr = (char *)&unk_1014152F8;
    self->_stream.dst_size = 0;
    handler = self->_handler;
    if (handler
      && ((*((uint64_t (**)(id, CRLStreamCompression *, _QWORD, dispatch_data_t, _QWORD))handler + 2))(handler, self, 0, v17, 0) & 1) == 0)
    {
      self->_status = -1;
      v19 = self->_handler;
      self->_handler = 0;

    }
    v11 = self->_status;
    if (!v11)
    {
LABEL_46:
      self->_stream.dst_ptr = (char *)malloc_type_malloc(0x400uLL, 0xFEC6606EuLL);
      self->_stream.dst_size = 1024;
      v11 = self->_status;
      if (!v11)
LABEL_10:
        v11 = compression_stream_process(p_stream, a5);
    }
    self->_status = v11;
    if (v11 == -1)
    {
      v20 = (void (**)(id, CRLStreamCompression *, uint64_t, _QWORD, void *))self->_handler;
      if (!v20)
        goto LABEL_42;
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSCocoaErrorDomain, 2048, 0));
      v20[2](v20, self, 1, 0, v21);

      v14 = self->_handler;
      self->_handler = 0;
    }
    else
    {
      if (v11 != 1)
        goto LABEL_36;
      v12 = p_stream->dst_ptr;
      if (!p_stream->dst_ptr || v12 == (uint8_t *)&unk_1014152F8)
      {
        v22 = &_dispatch_data_empty;
        v14 = &_dispatch_data_empty;
      }
      else
      {
        dst_size = self->_stream.dst_size;
        if (dst_size > 0x3FF)
        {
          free(v12);
          v23 = &_dispatch_data_empty;
          v14 = &_dispatch_data_empty;
        }
        else
        {
          v14 = dispatch_data_create(&v12[dst_size - 1024], 1024 - dst_size, 0, _dispatch_data_destructor_free);
        }
        self->_stream.dst_ptr = (char *)&unk_1014152F8;
        self->_stream.dst_size = 0;
      }
      v24 = (uint64_t (**)(id, CRLStreamCompression *, uint64_t, void *, _QWORD))self->_handler;
      if (v24 && (v24[2](v24, self, 1, v14, 0) & 1) == 0)
      {
        self->_status = -1;
        v25 = self->_handler;
        self->_handler = 0;

      }
    }

    v11 = self->_status;
LABEL_36:
    if (v11)
      break;
    if (a5 != 1 && !self->_stream.src_size)
    {
      result = 1;
      goto LABEL_43;
    }
  }
  if (v11 == 1)
  {
    result = self->_stream.src_size == 0;
    goto LABEL_43;
  }
LABEL_42:
  result = 0;
LABEL_43:
  self->_stream.src_ptr = (char *)&unk_1014152F8;
  self->_stream.src_size = 0;
  return result;
}

- (id)handler
{
  return self->_handler;
}

- (void)setHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handler, 0);
}

@end
