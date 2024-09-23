@implementation SFUBufferedInputStream

- (SFUBufferedInputStream)initWithStream:(id)a3
{
  return -[SFUBufferedInputStream initWithStream:bufferSize:](self, "initWithStream:bufferSize:", a3, 66560);
}

- (SFUBufferedInputStream)initWithStream:(id)a3 bufferSize:(unint64_t)a4
{
  SFUBufferedInputStream *v6;
  SFUBufferedInputStream *v7;
  char *v8;
  uint64_t v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SFUBufferedInputStream;
  v6 = -[SFUBufferedInputStream init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    if (a3)
    {
      v6->mStream = (SFUInputStream *)a3;
      v7->mBufferSize = a4;
      v8 = (char *)malloc_type_malloc(a4, 0x6063BF5FuLL);
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

- (SFUBufferedInputStream)initWithStream:(id)a3 dataLength:(int64_t)a4
{
  if ((unint64_t)a4 >= 0x10400)
    a4 = 66560;
  return -[SFUBufferedInputStream initWithStream:bufferSize:](self, "initWithStream:bufferSize:", a3, a4);
}

- (void)dealloc
{
  objc_super v3;

  free(self->mBuffer);

  v3.receiver = self;
  v3.super_class = (Class)SFUBufferedInputStream;
  -[SFUBufferedInputStream dealloc](&v3, sel_dealloc);
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
  v5 = -[SFUBufferedInputStream readToOwnBuffer:size:](self, "readToOwnBuffer:size:", &__src, a4);
  memcpy(a3, __src, v5);
  return v5;
}

- (unint64_t)readToOwnBuffer:(const char *)a3 size:(unint64_t)a4
{
  id v7;
  uint64_t v8;
  int64_t mBufferStart;
  int64_t mBufferEnd;
  id v11;
  uint64_t v12;
  unint64_t mBufferSize;
  id v14;
  uint64_t v15;
  unint64_t v16;
  int64_t mBufferOffset;
  int64_t v18;
  unint64_t v19;
  int64_t v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  int64_t v24;
  int64_t v25;
  unint64_t result;

  if (!a3)
  {
    v7 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
    v8 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[SFUBufferedInputStream readToOwnBuffer:size:]");
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/sf/SFUBufferedInputStream.m"), 92, CFSTR("No buffer parameter"));
  }
  mBufferStart = self->mBufferStart;
  mBufferEnd = self->mBufferEnd;
  if (self->mBufferOffset + mBufferStart > mBufferEnd)
  {
    v11 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
    v12 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[SFUBufferedInputStream readToOwnBuffer:size:]");
    objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/sf/SFUBufferedInputStream.m"), 93, CFSTR("Bad invariant"));
    mBufferStart = self->mBufferStart;
    mBufferEnd = self->mBufferEnd;
  }
  mBufferSize = self->mBufferSize;
  if (mBufferEnd - mBufferStart > (uint64_t)mBufferSize)
  {
    v14 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
    v15 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[SFUBufferedInputStream readToOwnBuffer:size:]");
    objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", v15, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/sf/SFUBufferedInputStream.m"), 94, CFSTR("Bad invariant"));
    mBufferSize = self->mBufferSize;
    mBufferStart = self->mBufferStart;
    mBufferEnd = self->mBufferEnd;
  }
  if (mBufferSize >= a4)
    v16 = a4;
  else
    v16 = mBufferSize;
  mBufferOffset = self->mBufferOffset;
  v18 = mBufferEnd - mBufferStart;
  v19 = v18 - mBufferOffset;
  if (v16 > v18 - mBufferOffset)
  {
    memmove(self->mBuffer, &self->mBuffer[mBufferOffset], v18 - mBufferOffset);
    v20 = self->mBufferStart + self->mBufferOffset;
    self->mBufferOffset = 0;
    self->mBufferStart = v20;
    if (-[SFUInputStream offset](self->mStream, "offset") != self->mBufferEnd)
    {
      if (-[SFUInputStream canSeek](self->mStream, "canSeek"))
      {
        -[SFUInputStream seekToOffset:](self->mStream, "seekToOffset:", self->mBufferEnd);
      }
      else
      {
        v21 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
        v22 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[SFUBufferedInputStream readToOwnBuffer:size:]");
        objc_msgSend(v21, "handleFailureInFunction:file:lineNumber:description:", v22, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/sf/SFUBufferedInputStream.m"), 121, CFSTR("Detected a read from the stream beneath a buffered stream."));
      }
    }
    v23 = -[SFUInputStream readToBuffer:size:](self->mStream, "readToBuffer:size:", &self->mBuffer[v19], self->mBufferSize - v19);
    v24 = self->mBufferStart;
    v25 = self->mBufferEnd + v23;
    self->mBufferEnd = v25;
    mBufferOffset = self->mBufferOffset;
    v19 = v25 - (v24 + mBufferOffset);
  }
  if (v16 >= v19)
    result = v19;
  else
    result = v16;
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

  if (!-[SFUBufferedInputStream canSeek](self, "canSeek"))
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
