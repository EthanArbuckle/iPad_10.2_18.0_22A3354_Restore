@implementation SBKZipDeflateMemoryOutputStream

- (SBKZipDeflateMemoryOutputStream)initWithBufferingSize:(int)a3 compressionType:(unint64_t)a4
{
  SBKZipDeflateMemoryOutputStream *v6;
  uint64_t v7;
  NSMutableData *deflatedData;
  char *v9;
  int v10;
  int v11;
  SBKZipDeflateMemoryOutputStream *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)SBKZipDeflateMemoryOutputStream;
  v6 = -[SBKZipDeflateMemoryOutputStream init](&v14, sel_init);
  if (!v6)
    goto LABEL_10;
  objc_msgSend(MEMORY[0x24BDBCEC8], "data");
  v7 = objc_claimAutoreleasedReturnValue();
  deflatedData = v6->deflatedData;
  v6->deflatedData = (NSMutableData *)v7;

  v9 = (char *)malloc_type_malloc(a3, 0xCF0621CCuLL);
  *(_OWORD *)&v6->zstream.next_in = 0u;
  v6->_outputBuffer = v9;
  *(_OWORD *)&v6->zstream.total_in = 0u;
  *(_OWORD *)&v6->zstream.avail_out = 0u;
  *(_OWORD *)&v6->zstream.msg = 0u;
  *(_OWORD *)&v6->zstream.zalloc = 0u;
  *(_OWORD *)&v6->zstream.opaque = 0u;
  *(_OWORD *)&v6->zstream.adler = 0u;
  v6->zstream.avail_out = v6->_bufferingSize;
  v6->zstream.next_out = (Bytef *)v9;
  v10 = a4 == 1 ? 1 : -1;
  v11 = a4 == 2 ? 9 : v10;
  if (deflateInit2_(&v6->zstream, v11, 8, -15, 9, 0, "1.2.12", 112))
  {
    NSLog(CFSTR("deflateInit2() failed: %s"), v6->zstream.msg);
    v12 = 0;
  }
  else
  {
LABEL_10:
    v12 = v6;
  }

  return v12;
}

- (void)dealloc
{
  objc_super v3;

  if (deflateEnd(&self->zstream))
    NSLog(CFSTR("ERROR: deflateEnd() failed: %s"), self->zstream.msg);
  free(self->_outputBuffer);
  v3.receiver = self;
  v3.super_class = (Class)SBKZipDeflateMemoryOutputStream;
  -[SBKZipDeflateMemoryOutputStream dealloc](&v3, sel_dealloc);
}

- (id)close
{
  int v3;
  int v4;
  int v5;
  NSMutableData *deflatedData;
  NSMutableData *v8;

  if (!self->zstream.next_out)
    goto LABEL_14;
  do
  {
    v3 = deflate(&self->zstream, 4);
    if (self->zstream.next_out <= (Bytef *)self->_outputBuffer)
      v4 = -5;
    else
      v4 = 0;
    if (v3 == -5)
      v5 = v4;
    else
      v5 = v3;
    -[NSMutableData appendBytes:length:](self->deflatedData, "appendBytes:length:");
    self->zstream.avail_out = self->_bufferingSize;
    self->zstream.next_out = (Bytef *)self->_outputBuffer;
  }
  while (!v5);
  self->zstream.avail_out = 0;
  self->zstream.next_out = 0;
  if (v5 == -5 || v5 == 1)
  {
LABEL_14:
    v8 = self->deflatedData;
  }
  else
  {
    NSLog(CFSTR("deflate() failed: %s"), self->zstream.msg);
    deflatedData = self->deflatedData;
    self->deflatedData = 0;

    v8 = 0;
  }
  return v8;
}

- (BOOL)writeBuffer:(const char *)a3 size:(unint64_t)a4
{
  uInt avail_in;
  void *v10;
  void *v11;

  if (!self->zstream.next_out)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBKZipDeflateMemoryOutputStream.m"), 94, CFSTR("stream is already closed."));

  }
  if (a4 >= 0xFFFFFFFF)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBKZipDeflateMemoryOutputStream.m"), 95, CFSTR("64-bit buffer writes not supported."));

  }
  self->zstream.avail_in = a4;
  self->zstream.next_in = (Bytef *)a3;
  while (1)
  {
    avail_in = self->zstream.avail_in;
    if (!avail_in)
      break;
    if (!self->zstream.avail_out)
    {
      -[NSMutableData appendBytes:length:](self->deflatedData, "appendBytes:length:", self->_outputBuffer, self->_bufferingSize);
      self->zstream.avail_out = self->_bufferingSize;
      self->zstream.next_out = (Bytef *)self->_outputBuffer;
    }
    if (deflate(&self->zstream, 0))
    {
      NSLog(CFSTR("deflate() failed: %s"), self->zstream.msg);
      return avail_in == 0;
    }
  }
  return avail_in == 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->deflatedData, 0);
}

+ (id)dataByDeflatingData:(id)a3
{
  id v3;
  SBKZipDeflateMemoryOutputStream *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v3 = a3;
  v4 = -[SBKZipDeflateMemoryOutputStream initWithBufferingSize:compressionType:]([SBKZipDeflateMemoryOutputStream alloc], "initWithBufferingSize:compressionType:", 0x4000, 2);
  v5 = objc_retainAutorelease(v3);
  v6 = objc_msgSend(v5, "bytes");
  v7 = objc_msgSend(v5, "length");

  -[SBKZipDeflateMemoryOutputStream writeBuffer:size:](v4, "writeBuffer:size:", v6, v7);
  -[SBKZipDeflateMemoryOutputStream close](v4, "close");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

@end
