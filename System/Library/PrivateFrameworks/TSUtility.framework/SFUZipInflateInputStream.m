@implementation SFUZipInflateInputStream

- (SFUZipInflateInputStream)initWithOffset:(int64_t)a3 end:(int64_t)a4 uncompressedSize:(unint64_t)a5 crc:(unint64_t)a6 dataRepresentation:(id)a7
{
  SFUZipInflateInputStream *v12;
  SFUZipInflateInputStream *v13;
  unint64_t v14;

  v12 = -[SFUZipInflateInputStream init](self, "init");
  v13 = v12;
  if (v12)
  {
    *(_WORD *)&v12->mReachedEnd = 256;
    v12->mOffset = a3;
    v12->mCheckCrc = a6;
    v12->mCalculatedCrc = crc32(0, 0, 0);
    v13->mInput = (SFUBufferedInputStream *)(id)objc_msgSend(a7, "bufferedInputStreamWithOffset:length:", a3, a4 - a3);
    v14 = 0x40000;
    if (a5 < 0x40000)
      v14 = a5;
    v13->mOutBufferSize = v14;
    -[SFUZipInflateInputStream setupInflateStream](v13, "setupInflateStream");
  }
  return v13;
}

- (SFUZipInflateInputStream)initWithInput:(id)a3
{
  SFUZipInflateInputStream *v4;
  SFUZipInflateInputStream *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SFUZipInflateInputStream;
  v4 = -[SFUZipInflateInputStream init](&v7, sel_init);
  v5 = v4;
  if (v4)
  {
    *(_WORD *)&v4->mReachedEnd = 0;
    v4->mOffset = 0;
    v4->mInput = -[SFUBufferedInputStream initWithStream:]([SFUBufferedInputStream alloc], "initWithStream:", a3);
    v5->mOutBufferSize = 0x40000;
    -[SFUZipInflateInputStream setupInflateStream](v5, "setupInflateStream");
  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  inflateEnd(&self->mStream);

  free(self->mOutBuffer);
  v3.receiver = self;
  v3.super_class = (Class)SFUZipInflateInputStream;
  -[SFUZipInflateInputStream dealloc](&v3, sel_dealloc);
}

- (unint64_t)readToOwnBuffer:(const char *)a3 size:(unint64_t)a4
{
  char *mOutBuffer;
  unint64_t mOutBufferSize;

  mOutBuffer = self->mOutBuffer;
  if (!mOutBuffer)
  {
    mOutBuffer = (char *)malloc_type_malloc(self->mOutBufferSize, 0x36C151DFuLL);
    self->mOutBuffer = mOutBuffer;
    if (!mOutBuffer)
    {
      +[SFUZipException raise:format:](SFUZipException, "raise:format:", CFSTR("SFUZipInflateError"), CFSTR("Could not create inflate buffer"));
      mOutBuffer = self->mOutBuffer;
    }
  }
  *a3 = mOutBuffer;
  if (a4 - 1 >= self->mOutBufferSize)
    mOutBufferSize = self->mOutBufferSize;
  else
    mOutBufferSize = a4;
  return -[SFUZipInflateInputStream readToBuffer:size:](self, "readToBuffer:size:", self->mOutBuffer, mOutBufferSize);
}

- (unint64_t)readToBuffer:(char *)a3 size:(unint64_t)a4
{
  uInt v4;
  unint64_t v7;
  id v8;
  uint64_t v9;
  char *next_out;
  uint64_t v11;
  unint64_t v12;
  uInt v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;

  v4 = a4;
  v7 = 0x24D619000uLL;
  if (a4 >= 0xFFFFFFFF)
  {
    v8 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
    v9 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[SFUZipInflateInputStream readToBuffer:size:]");
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/sf/SFUZipInflateInputStream.m"), 130, CFSTR("overflow in readToBuffer:"));
  }
  self->mStream.avail_out = v4;
  self->mStream.next_out = (Bytef *)a3;
  next_out = a3;
  if (v4)
  {
    LODWORD(v11) = 0;
    do
    {
      if (self->mStream.avail_in)
      {
        if ((_DWORD)v11)
          break;
      }
      else
      {
        if ((_DWORD)v11 || self->mReachedEnd)
          break;
        v12 = -[SFUBufferedInputStream readToOwnBuffer:size:](self->mInput, "readToOwnBuffer:size:", &self->mStream, 0xFFFFFFFFLL);
        v13 = v12;
        if (v12 >= 0xFFFFFFFF)
        {
          v14 = v7;
          v15 = objc_msgSend(*(id *)(v7 + 3944), "currentHandler");
          v16 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[SFUZipInflateInputStream readToBuffer:size:]");
          v17 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/sf/SFUZipInflateInputStream.m");
          v18 = (void *)v15;
          v7 = v14;
          objc_msgSend(v18, "handleFailureInFunction:file:lineNumber:description:", v16, v17, 144, CFSTR("overflow in readToBuffer:size:"));
        }
        self->mStream.avail_in = v13;
        self->mOffset += v13;
      }
      v11 = inflate(&self->mStream, 0);
      if ((v11 + 5) > 6 || ((1 << (v11 + 5)) & 0x61) == 0)
        +[SFUZipException raise:format:](SFUZipException, "raise:format:", CFSTR("SFUZipInflateError"), CFSTR("inflate() failed: %d"), v11);
    }
    while (self->mStream.avail_out);
    next_out = (char *)self->mStream.next_out;
  }
  if ((unint64_t)(next_out - a3) >= 0xFFFFFFFF)
  {
    v19 = (void *)objc_msgSend(*(id *)(v7 + 3944), "currentHandler");
    v20 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[SFUZipInflateInputStream readToBuffer:size:]");
    objc_msgSend(v19, "handleFailureInFunction:file:lineNumber:description:", v20, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/sf/SFUZipInflateInputStream.m"), 157, CFSTR("overflow in readToBuffer:"));
  }
  if (next_out == a3)
    self->mReachedEnd = 1;
  return next_out - a3;
}

- (void)seekToOffset:(int64_t)a3
{
  id v3;
  uint64_t v4;

  v3 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler", a3);
  v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[SFUZipInflateInputStream seekToOffset:]");
  objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/sf/SFUZipInflateInputStream.m"), 182, CFSTR("Not implemented."));
}

- (BOOL)canSeek
{
  return 0;
}

- (int64_t)offset
{
  return self->mStream.total_out;
}

- (void)disableSystemCaching
{
  -[SFUBufferedInputStream disableSystemCaching](self->mInput, "disableSystemCaching");
}

- (void)enableSystemCaching
{
  -[SFUBufferedInputStream enableSystemCaching](self->mInput, "enableSystemCaching");
}

- (void)close
{
  -[SFUZipInflateInputStream closeLocalStream](self, "closeLocalStream");
  -[SFUBufferedInputStream close](self->mInput, "close");
}

- (id)closeLocalStream
{
  return self->mInput;
}

- (int64_t)totalCompressedBytesConsumed
{
  return self->mStream.total_in;
}

- (void)setupInflateStream
{
  z_stream_s *p_mStream;
  uint64_t v3;

  self->mStream.next_in = 0;
  p_mStream = &self->mStream;
  p_mStream->avail_in = 0;
  p_mStream->zfree = 0;
  p_mStream->opaque = 0;
  p_mStream->zalloc = 0;
  v3 = inflateInit2_(p_mStream, -15, "1.2.12", 112);
  if ((_DWORD)v3)
    +[SFUZipException raise:format:](SFUZipException, "raise:format:", CFSTR("SFUZipInflateError"), CFSTR("inflateInit2() failed: %d"), v3);
}

@end
