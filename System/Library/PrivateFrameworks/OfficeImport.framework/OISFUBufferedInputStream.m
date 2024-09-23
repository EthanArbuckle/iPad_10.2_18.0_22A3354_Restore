@implementation OISFUBufferedInputStream

- (OISFUBufferedInputStream)initWithStream:(id)a3
{
  return -[OISFUBufferedInputStream initWithStream:bufferSize:](self, "initWithStream:bufferSize:", a3, 0x40000);
}

- (OISFUBufferedInputStream)initWithStream:(id)a3 bufferSize:(unint64_t)a4
{
  OISFUBufferedInputStream *v6;
  OISFUBufferedInputStream *v7;
  char *v8;
  uint64_t v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)OISFUBufferedInputStream;
  v6 = -[OISFUBufferedInputStream init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    if (a3)
    {
      v6->mStream = (SFUInputStream *)a3;
      v7->mBufferSize = a4;
      v8 = (char *)malloc_type_malloc(a4, 0x22AE73CEuLL);
      v7->mBuffer = v8;
      if (!v8)
      {

        objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("SFUBufferedInputStreamError"), CFSTR("Could not create read buffer"));
      }
      v9 = -[SFUInputStream offset](v7->mStream, "offset");
      v7->mBufferStart = v9;
      v7->mBufferEnd = v9;
    }
    else
    {

      return 0;
    }
  }
  return v7;
}

- (OISFUBufferedInputStream)initWithStream:(id)a3 dataLength:(int64_t)a4
{
  if ((unint64_t)a4 >= 0x40000)
    a4 = 0x40000;
  return -[OISFUBufferedInputStream initWithStream:bufferSize:](self, "initWithStream:bufferSize:", a3, a4);
}

- (void)dealloc
{
  objc_super v3;

  free(self->mBuffer);

  v3.receiver = self;
  v3.super_class = (Class)OISFUBufferedInputStream;
  -[OISFUBufferedInputStream dealloc](&v3, sel_dealloc);
}

- (int64_t)offset
{
  return self->mBufferOffset + self->mBufferStart;
}

- (unint64_t)readToBuffer:(char *)a3 size:(unint64_t)a4
{
  size_t v5;
  void *__src;

  __src = 0;
  v5 = -[OISFUBufferedInputStream readToOwnBuffer:size:](self, "readToOwnBuffer:size:", &__src, a4);
  memcpy(a3, __src, v5);
  return v5;
}

- (unint64_t)readToOwnBuffer:(const char *)a3 size:(unint64_t)a4
{
  uint64_t v7;
  int64_t mBufferStart;
  int64_t mBufferEnd;
  uint64_t v10;
  unint64_t mBufferSize;
  uint64_t v12;
  unint64_t v13;
  int64_t mBufferOffset;
  int64_t v15;
  unint64_t v16;
  int64_t v17;
  uint64_t v18;
  uint64_t v19;
  int64_t v20;
  int64_t v21;
  unint64_t result;

  if (!a3)
  {
    v7 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[OISFUBufferedInputStream readToOwnBuffer:size:]");
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/sf/SFUBufferedInputStream.m"), 81, 0, "No buffer parameter");
    +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
  }
  mBufferStart = self->mBufferStart;
  mBufferEnd = self->mBufferEnd;
  if (self->mBufferOffset + mBufferStart > mBufferEnd)
  {
    v10 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[OISFUBufferedInputStream readToOwnBuffer:size:]");
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v10, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/sf/SFUBufferedInputStream.m"), 82, 0, "Bad invariant");
    +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
    mBufferStart = self->mBufferStart;
    mBufferEnd = self->mBufferEnd;
  }
  mBufferSize = self->mBufferSize;
  if (mBufferEnd - mBufferStart > (uint64_t)mBufferSize)
  {
    v12 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[OISFUBufferedInputStream readToOwnBuffer:size:]");
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v12, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/sf/SFUBufferedInputStream.m"), 83, 0, "Bad invariant");
    +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
    mBufferSize = self->mBufferSize;
    mBufferStart = self->mBufferStart;
    mBufferEnd = self->mBufferEnd;
  }
  if (mBufferSize >= a4)
    v13 = a4;
  else
    v13 = mBufferSize;
  mBufferOffset = self->mBufferOffset;
  v15 = mBufferEnd - mBufferStart;
  v16 = v15 - mBufferOffset;
  if (v13 > v15 - mBufferOffset)
  {
    memmove(self->mBuffer, &self->mBuffer[mBufferOffset], v15 - mBufferOffset);
    v17 = self->mBufferStart + self->mBufferOffset;
    self->mBufferOffset = 0;
    self->mBufferStart = v17;
    if (-[SFUInputStream offset](self->mStream, "offset") != self->mBufferEnd)
    {
      if (-[SFUInputStream canSeek](self->mStream, "canSeek"))
      {
        -[SFUInputStream seekToOffset:](self->mStream, "seekToOffset:", self->mBufferEnd);
      }
      else
      {
        v18 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[OISFUBufferedInputStream readToOwnBuffer:size:]");
        +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v18, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/sf/SFUBufferedInputStream.m"), 104, 0, "Detected a read from the stream beneath a buffered stream.");
        +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
      }
    }
    v19 = -[SFUInputStream readToBuffer:size:](self->mStream, "readToBuffer:size:", &self->mBuffer[v16], self->mBufferSize - v16);
    v20 = self->mBufferStart;
    v21 = self->mBufferEnd + v19;
    self->mBufferEnd = v21;
    mBufferOffset = self->mBufferOffset;
    v16 = v21 - (v20 + mBufferOffset);
  }
  if (v13 >= v16)
    result = v16;
  else
    result = v13;
  *a3 = &self->mBuffer[mBufferOffset];
  self->mBufferOffset = result + mBufferOffset;
  return result;
}

- (BOOL)seekWithinBufferToOffset:(int64_t)a3
{
  int64_t mBufferStart;
  BOOL v4;
  int64_t v5;

  mBufferStart = self->mBufferStart;
  v4 = __OFSUB__(a3, mBufferStart);
  v5 = a3 - mBufferStart;
  if (v5 < 0 != v4 || self->mBufferEnd < a3)
    return 0;
  self->mBufferOffset = v5;
  return 1;
}

- (BOOL)canSeek
{
  return -[SFUInputStream canSeek](self->mStream, "canSeek");
}

- (void)seekToOffset:(int64_t)a3
{
  int64_t mBufferStart;
  BOOL v6;
  int64_t v7;
  uint64_t v8;

  if (!-[OISFUBufferedInputStream canSeek](self, "canSeek"))
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("SFUBufferedInputStreamError"), CFSTR("Can't seek"));
  mBufferStart = self->mBufferStart;
  v6 = __OFSUB__(a3, mBufferStart);
  v7 = a3 - mBufferStart;
  if (v7 < 0 != v6 || self->mBufferEnd < a3)
  {
    self->mBufferOffset = 0;
    self->mBufferStart = a3;
    v8 = 48;
  }
  else
  {
    v8 = 32;
    a3 = v7;
  }
  *(Class *)((char *)&self->super.isa + v8) = (Class)a3;
}

- (void)disableSystemCaching
{
  -[SFUInputStream disableSystemCaching](self->mStream, "disableSystemCaching");
}

- (void)enableSystemCaching
{
  -[SFUInputStream enableSystemCaching](self->mStream, "enableSystemCaching");
}

- (void)close
{
  -[SFUInputStream close](self->mStream, "close");
}

- (id)closeLocalStream
{
  return self->mStream;
}

@end
