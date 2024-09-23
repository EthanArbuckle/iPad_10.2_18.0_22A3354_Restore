@implementation SFUZipDeflateOutputStream

- (SFUZipDeflateOutputStream)initWithOutputStream:(id)a3
{
  SFUZipDeflateOutputStream *v4;
  char *mOutBuffer;

  v4 = -[SFUZipDeflateOutputStream init](self, "init");
  if (v4)
  {
    v4->mOutputStream = (SFUOutputStream *)a3;
    mOutBuffer = (char *)malloc_type_malloc(0x40000uLL, 0xEF661511uLL);
    v4->mOutBuffer = mOutBuffer;
    if (!mOutBuffer)
    {
      +[SFUZipException raise:format:](SFUZipException, "raise:format:", CFSTR("SFUZipDeflateError"), CFSTR("Could not create deflate buffer"));
      mOutBuffer = v4->mOutBuffer;
    }
    v4->mDeflateStream.next_in = 0;
    v4->mDeflateStream.avail_in = 0;
    v4->mDeflateStream.zfree = 0;
    v4->mDeflateStream.opaque = 0;
    v4->mDeflateStream.zalloc = 0;
    v4->mDeflateStream.avail_out = 0x40000;
    v4->mDeflateStream.next_out = (Bytef *)mOutBuffer;
    if (deflateInit2_(&v4->mDeflateStream, 8, 8, -15, 9, 0, "1.2.12", 112))
      +[SFUZipException raise:format:](SFUZipException, "raise:format:", CFSTR("SFUZipDeflateError"), CFSTR("deflateInit2() failed: %s"), v4->mDeflateStream.msg);
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  deflateEnd(&self->mDeflateStream);

  free(self->mOutBuffer);
  v3.receiver = self;
  v3.super_class = (Class)SFUZipDeflateOutputStream;
  -[SFUZipDeflateOutputStream dealloc](&v3, sel_dealloc);
}

- (id)closeLocalStream
{
  int v3;
  int v4;
  int v5;

  if (self->mDeflateStream.next_out)
  {
    do
    {
      v3 = deflate(&self->mDeflateStream, 4);
      if (self->mDeflateStream.next_out <= (Bytef *)self->mOutBuffer)
        v4 = -5;
      else
        v4 = 0;
      if (v3 == -5)
        v5 = v4;
      else
        v5 = v3;
      -[SFUOutputStream writeBuffer:size:](self->mOutputStream, "writeBuffer:size:");
      self->mDeflateStream.avail_out = 0x40000;
      self->mDeflateStream.next_out = (Bytef *)self->mOutBuffer;
    }
    while (!v5);
    self->mDeflateStream.avail_out = 0;
    self->mDeflateStream.next_out = 0;
    if (v5 != -5 && v5 != 1)
      +[SFUZipException raise:format:](SFUZipException, "raise:format:", CFSTR("SFUZipDeflateError"), CFSTR("deflate() failed: %s"), self->mDeflateStream.msg);
  }
  return self->mOutputStream;
}

- (void)close
{
  objc_msgSend(-[SFUZipDeflateOutputStream closeLocalStream](self, "closeLocalStream"), "close");
}

- (void)writeBuffer:(const char *)a3 size:(unint64_t)a4
{
  id v7;
  uint64_t v8;
  id v9;
  uint64_t v10;

  if (!self->mDeflateStream.next_out)
  {
    v7 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
    v8 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[SFUZipDeflateOutputStream writeBuffer:size:]");
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/sf/SFUZipDeflateOutputStream.m"), 133, CFSTR("Stream is already closed."));
  }
  if (a4 >= 0xFFFFFFFF)
  {
    v9 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
    v10 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[SFUZipDeflateOutputStream writeBuffer:size:]");
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/sf/SFUZipDeflateOutputStream.m"), 136, CFSTR("overflow in writeBuffer:size:"));
  }
  self->mDeflateStream.avail_in = a4;
  self->mDeflateStream.next_in = (Bytef *)a3;
  if ((_DWORD)a4)
  {
    while (1)
    {
      if (!self->mDeflateStream.avail_out)
      {
        -[SFUOutputStream writeBuffer:size:](self->mOutputStream, "writeBuffer:size:", self->mOutBuffer, 0x40000);
        self->mDeflateStream.avail_out = 0x40000;
        self->mDeflateStream.next_out = (Bytef *)self->mOutBuffer;
      }
      if (deflate(&self->mDeflateStream, 0))
        break;
      if (!self->mDeflateStream.avail_in)
        return;
    }
    +[SFUZipException raise:format:](SFUZipException, "raise:format:", CFSTR("SFUZipDeflateError"), CFSTR("deflate() failed: %s"), self->mDeflateStream.msg);
  }
}

- (BOOL)canSeek
{
  return 0;
}

- (void)seekToOffset:(int64_t)a3 whence:(int)a4
{
  id v4;
  uint64_t v5;

  v4 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler", a3, *(_QWORD *)&a4);
  v5 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[SFUZipDeflateOutputStream seekToOffset:whence:]");
  objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/sf/SFUZipDeflateOutputStream.m"), 169, CFSTR("Not implemented."));
}

- (int64_t)offset
{
  return self->mDeflateStream.total_in;
}

- (BOOL)canCreateInputStream
{
  return 0;
}

- (id)inputStream
{
  return 0;
}

@end
