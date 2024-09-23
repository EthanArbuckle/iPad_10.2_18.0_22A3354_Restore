@implementation OISFUZipInflateInputStream

- (OISFUZipInflateInputStream)initWithOffset:(int64_t)a3 end:(int64_t)a4 uncompressedSize:(unint64_t)a5 crc:(unint64_t)a6 dataRepresentation:(id)a7
{
  OISFUZipInflateInputStream *v12;
  OISFUZipInflateInputStream *v13;
  unint64_t v14;

  v12 = -[OISFUZipInflateInputStream init](self, "init");
  v13 = v12;
  if (v12)
  {
    *(_WORD *)&v12->mReachedEnd = 256;
    v12->mOffset = a3;
    v12->mCheckCrc = a6;
    v12->mCalculatedCrc = crc32(0, 0, 0);
    v13->mInput = (OISFUBufferedInputStream *)(id)objc_msgSend(a7, "bufferedInputStreamWithOffset:length:", a3, a4 - a3);
    v14 = 0x40000;
    if (a5 < 0x40000)
      v14 = a5;
    v13->mOutBufferSize = v14;
    -[OISFUZipInflateInputStream setupInflateStream](v13, "setupInflateStream");
  }
  return v13;
}

- (OISFUZipInflateInputStream)initWithInput:(id)a3
{
  OISFUZipInflateInputStream *v4;
  OISFUZipInflateInputStream *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)OISFUZipInflateInputStream;
  v4 = -[OISFUZipInflateInputStream init](&v7, sel_init);
  v5 = v4;
  if (v4)
  {
    *(_WORD *)&v4->mReachedEnd = 0;
    v4->mOffset = 0;
    v4->mInput = -[OISFUBufferedInputStream initWithStream:]([OISFUBufferedInputStream alloc], "initWithStream:", a3);
    v5->mOutBufferSize = 0x40000;
    -[OISFUZipInflateInputStream setupInflateStream](v5, "setupInflateStream");
  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  inflateEnd(&self->mStream);

  free(self->mOutBuffer);
  v3.receiver = self;
  v3.super_class = (Class)OISFUZipInflateInputStream;
  -[OISFUZipInflateInputStream dealloc](&v3, sel_dealloc);
}

- (unint64_t)readToOwnBuffer:(const char *)a3 size:(unint64_t)a4
{
  char *mOutBuffer;
  unint64_t mOutBufferSize;

  mOutBuffer = self->mOutBuffer;
  if (!mOutBuffer)
  {
    mOutBuffer = (char *)malloc_type_malloc(self->mOutBufferSize, 0x8B2E508uLL);
    self->mOutBuffer = mOutBuffer;
    if (!mOutBuffer)
    {
      +[OISFUZipException raise:format:](OISFUZipException, "raise:format:", CFSTR("SFUZipInflateError"), CFSTR("Could not create inflate buffer"));
      mOutBuffer = self->mOutBuffer;
    }
  }
  *a3 = mOutBuffer;
  if (a4 - 1 >= self->mOutBufferSize)
    mOutBufferSize = self->mOutBufferSize;
  else
    mOutBufferSize = a4;
  return -[OISFUZipInflateInputStream readToBuffer:size:](self, "readToBuffer:size:", self->mOutBuffer, mOutBufferSize);
}

- (unint64_t)readToBuffer:(char *)a3 size:(unint64_t)a4
{
  uInt v4;
  uint64_t v7;
  char *next_out;
  uint64_t v9;
  unint64_t v10;
  uInt v11;
  uint64_t v12;
  uint64_t v13;

  v4 = a4;
  if (a4 >= 0xFFFFFFFF)
  {
    v7 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[OISFUZipInflateInputStream readToBuffer:size:]");
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/sf/SFUZipInflateInputStream.m"), 117, 0, "overflow in readToBuffer:");
    +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
  }
  self->mStream.avail_out = v4;
  self->mStream.next_out = (Bytef *)a3;
  next_out = a3;
  if (v4)
  {
    LODWORD(v9) = 0;
    do
    {
      if (self->mStream.avail_in)
      {
        if ((_DWORD)v9)
          break;
      }
      else
      {
        if ((_DWORD)v9 || self->mReachedEnd)
          break;
        v10 = -[OISFUBufferedInputStream readToOwnBuffer:size:](self->mInput, "readToOwnBuffer:size:", &self->mStream, 0xFFFFFFFFLL);
        v11 = v10;
        if (v10 >= 0xFFFFFFFF)
        {
          v12 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[OISFUZipInflateInputStream readToBuffer:size:]");
          +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v12, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/sf/SFUZipInflateInputStream.m"), 129, 0, "overflow in readToBuffer:size:");
          +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
        }
        self->mStream.avail_in = v11;
        self->mOffset += v11;
      }
      v9 = inflate(&self->mStream, 0);
      if ((v9 + 5) > 6 || ((1 << (v9 + 5)) & 0x61) == 0)
        +[OISFUZipException raise:format:](OISFUZipException, "raise:format:", CFSTR("SFUZipInflateError"), CFSTR("inflate() failed: %d"), v9);
    }
    while (self->mStream.avail_out);
    next_out = (char *)self->mStream.next_out;
  }
  if ((unint64_t)(next_out - a3) >= 0xFFFFFFFF)
  {
    v13 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[OISFUZipInflateInputStream readToBuffer:size:]");
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v13, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/sf/SFUZipInflateInputStream.m"), 141, 0, "overflow in readToBuffer:");
    +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
  }
  if (next_out == a3)
    self->mReachedEnd = 1;
  return next_out - a3;
}

- (void)seekToOffset:(int64_t)a3
{
  uint64_t v3;

  v3 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[OISFUZipInflateInputStream seekToOffset:]");
  +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v3, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/sf/SFUZipInflateInputStream.m"), 150, 0, "Not implemented.");
  +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
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
  -[OISFUBufferedInputStream disableSystemCaching](self->mInput, "disableSystemCaching");
}

- (void)enableSystemCaching
{
  -[OISFUBufferedInputStream enableSystemCaching](self->mInput, "enableSystemCaching");
}

- (void)close
{
  -[OISFUZipInflateInputStream closeLocalStream](self, "closeLocalStream");
  -[OISFUBufferedInputStream close](self->mInput, "close");
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
    +[OISFUZipException raise:format:](OISFUZipException, "raise:format:", CFSTR("SFUZipInflateError"), CFSTR("inflateInit2() failed: %d"), v3);
}

@end
