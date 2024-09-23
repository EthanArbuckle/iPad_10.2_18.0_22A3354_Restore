@implementation ICSCompressedInputStream

- (ICSCompressedInputStream)initWithData:(id)a3
{
  id v5;
  char *v6;
  char *v7;
  ICSCompressedInputStream *v8;
  void *v9;
  id v10;
  compression_status v11;
  void *v12;
  char v13;
  objc_super v15;

  v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)ICSCompressedInputStream;
  v6 = -[ICSCompressedInputStream init](&v15, sel_init);
  v7 = v6;
  if (!v6)
    goto LABEL_11;
  if (compression_stream_init((compression_stream *)(v6 + 8), COMPRESSION_STREAM_DECODE, COMPRESSION_LZFSE))
    goto LABEL_3;
  objc_storeStrong((id *)v7 + 6, a3);
  *((_QWORD *)v7 + 8) = 0;
  v9 = malloc_type_calloc(0x2000uLL, 1uLL, 0x49B45C2uLL);
  *((_QWORD *)v7 + 7) = v9;
  *((_QWORD *)v7 + 1) = v9;
  *((_QWORD *)v7 + 2) = 0x2000;
  v10 = objc_retainAutorelease(v5);
  *((_QWORD *)v7 + 3) = objc_msgSend(v10, "bytes");
  *((_QWORD *)v7 + 4) = objc_msgSend(v10, "length");
  v11 = compression_stream_process((compression_stream *)(v7 + 8), 1);
  if (v11 == COMPRESSION_STATUS_OK)
  {
    v13 = 0;
LABEL_10:
    v7[80] = v13;
    *((_QWORD *)v7 + 9) = 0x2000 - *((_QWORD *)v7 + 2);
LABEL_11:
    v8 = v7;
    goto LABEL_12;
  }
  if (v11 != COMPRESSION_STATUS_ERROR)
  {
    v13 = 1;
    goto LABEL_10;
  }
  +[ICSLogger logAtLevel:forTokenizer:message:](ICSLogger, "logAtLevel:forTokenizer:message:", 3, 0, CFSTR("Decompression failure! Got no data trying to decompress %@"), *((_QWORD *)v7 + 6));
  v12 = (void *)*((_QWORD *)v7 + 7);
  if (v12)
  {
    free(v12);
    v8 = 0;
    *((_QWORD *)v7 + 7) = 0;
    goto LABEL_12;
  }
LABEL_3:
  v8 = 0;
LABEL_12:

  return v8;
}

- (void)dealloc
{
  void *buffer;
  objc_super v4;

  compression_stream_destroy((compression_stream *)&self->underStream);
  buffer = self->buffer;
  if (buffer)
  {
    free(buffer);
    self->buffer = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)ICSCompressedInputStream;
  -[ICSCompressedInputStream dealloc](&v4, sel_dealloc);
}

- (char)read
{
  unint64_t bufLen;
  unint64_t bufPos;
  compression_status v5;
  BOOL v6;
  char v7;

  bufPos = self->bufPos;
  bufLen = self->bufLen;
  if (bufPos == bufLen)
  {
    if (self->finalBlock)
      return 0;
    self->underStream.dst_ptr = (char *)self->buffer;
    self->underStream.dst_size = 0x2000;
    v5 = compression_stream_process((compression_stream *)&self->underStream, 1);
    if (v5 == COMPRESSION_STATUS_ERROR)
    {
      +[ICSLogger logAtLevel:forTokenizer:message:](ICSLogger, "logAtLevel:forTokenizer:message:", 3, 0, CFSTR("Decompression failure! Failed at location %li in data %@"), -[NSData length](self->rawData, "length") - self->underStream.src_size, self->rawData);
      bufLen = 0;
      v6 = 1;
    }
    else
    {
      v6 = v5 == COMPRESSION_STATUS_END;
      bufLen = 0x2000 - self->underStream.dst_size;
    }
    bufPos = 0;
    self->finalBlock = v6;
    self->bufPos = 0;
    self->bufLen = bufLen;
  }
  if (bufPos != bufLen)
  {
    v7 = *((_BYTE *)self->buffer + bufPos);
    self->bufPos = bufPos + 1;
    return v7;
  }
  return 0;
}

- (BOOL)eos
{
  return self->bufPos == self->bufLen && self->finalBlock;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->rawData, 0);
}

@end
