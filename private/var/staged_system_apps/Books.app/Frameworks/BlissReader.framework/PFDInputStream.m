@implementation PFDInputStream

- (PFDInputStream)initWithInputStream:(id)a3 J00oNrNGGvbpr5VY2bUB:(id)a4
{
  PFDInputStream *v6;
  size_t v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PFDInputStream;
  v6 = -[PFDInputStream init](&v9, "init");
  if (v6)
  {
    if (a3)
    {
      if (a4)
      {
        v6->mInputStream = (SFUInputStream *)a3;
        v6->mDecryptionSession = (BuLr3rwnVU31zt9OioJ56 *)a4;
        v7 = +[BuLr3rwnVU31zt9OioJ56 dataChunkSize](BuLr3rwnVU31zt9OioJ56, "dataChunkSize");
        v6->mBufferSize = v7;
        v6->mEncryptedBuffer = (char *)malloc_type_calloc(v7, 1uLL, 0x100004077774924uLL);
        v6->mBuffer = (char *)malloc_type_calloc(v6->mBufferSize, 1uLL, 0x100004077774924uLL);
        return v6;
      }
    }
    else
    {
      objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[PFDInputStream initWithInputStream:J00oNrNGGvbpr5VY2bUB:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/compatibility/Publication/DRM/PFDInputStream.m"), 39, CFSTR("must have an input stream"));
      if (a4)
      {
LABEL_7:

        return 0;
      }
    }
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[PFDInputStream initWithInputStream:J00oNrNGGvbpr5VY2bUB:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/compatibility/Publication/DRM/PFDInputStream.m"), 40, CFSTR("must have a decryption session"));
    goto LABEL_7;
  }
  return v6;
}

- (void)dealloc
{
  char *mBuffer;
  char *mEncryptedBuffer;
  objc_super v5;

  mBuffer = self->mBuffer;
  if (mBuffer)
  {
    free(mBuffer);
    self->mBuffer = 0;
  }
  mEncryptedBuffer = self->mEncryptedBuffer;
  if (mEncryptedBuffer)
  {
    free(mEncryptedBuffer);
    self->mEncryptedBuffer = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)PFDInputStream;
  -[PFDInputStream dealloc](&v5, "dealloc");
}

- (int64_t)offset
{
  return self->mBufferOffset + self->mBufferStart;
}

- (unint64_t)readToBuffer:(char *)a3 size:(unint64_t)a4
{
  unint64_t i;
  size_t v8;
  size_t v9;
  void *__src;

  if (!a4)
    return 0;
  for (i = 0; i < a4; i += v9)
  {
    __src = 0;
    v8 = -[PFDInputStream readToOwnBuffer:size:](self, "readToOwnBuffer:size:", &__src, a4 - i);
    if (!v8)
      break;
    v9 = v8;
    memcpy(&a3[i], __src, v8);
  }
  return i;
}

- (BOOL)canSeek
{
  return -[SFUInputStream canSeek](self->mInputStream, "canSeek");
}

- (void)seekToOffset:(int64_t)a3
{
  int64_t mBufferStart;
  BOOL v4;
  int64_t v5;
  int64_t v6;

  mBufferStart = self->mBufferStart;
  v4 = __OFSUB__(a3, mBufferStart);
  v5 = a3 - mBufferStart;
  if (v5 < 0 != v4 || self->mBufferEnd < a3)
  {
    v6 = a3 / self->mBufferSize * self->mBufferSize;
    v5 = a3 % self->mBufferSize;
    self->mBufferStart = v6;
    self->mBufferEnd = v6;
  }
  self->mBufferOffset = v5;
}

- (void)disableSystemCaching
{
  -[SFUInputStream disableSystemCaching](self->mInputStream, "disableSystemCaching");
}

- (void)enableSystemCaching
{
  -[SFUInputStream enableSystemCaching](self->mInputStream, "enableSystemCaching");
}

- (void)close
{
  -[SFUInputStream close](self->mInputStream, "close");
}

- (id)closeLocalStream
{
  return self->mInputStream;
}

- (unint64_t)readToOwnBuffer:(const char *)a3 size:(unint64_t)a4
{
  int64_t mBufferEnd;
  int64_t mBufferStart;
  char *v9;
  unint64_t mBufferSize;
  char *v11;
  int64_t mBufferOffset;
  unint64_t v13;
  unint64_t result;

  mBufferEnd = self->mBufferEnd;
  mBufferStart = self->mBufferStart;
  if (self->mBufferOffset == mBufferEnd - mBufferStart)
  {
    self->mBufferOffset = 0;
    self->mBufferStart = mBufferEnd;
  }
  else if (mBufferEnd != mBufferStart)
  {
    goto LABEL_14;
  }
  v9 = (char *)-[SFUInputStream offset](self->mInputStream, "offset");
  if (v9 != (char *)self->mBufferEnd)
  {
    if ((-[SFUInputStream canSeek](self->mInputStream, "canSeek") & 1) == 0)
      objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[PFDInputStream readToOwnBuffer:size:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/compatibility/Publication/DRM/PFDInputStream.m"), 156, CFSTR("can't fix the offset if the input stream can't seek"));
    -[SFUInputStream seekToOffset:](self->mInputStream, "seekToOffset:", self->mBufferEnd);
    v9 = (char *)self->mBufferEnd;
  }
  while (1)
  {
    mBufferSize = self->mBufferSize;
    mBufferStart = self->mBufferStart;
    if (mBufferSize <= (unint64_t)&v9[-mBufferStart])
      break;
    v11 = (char *)-[SFUInputStream readToBuffer:size:](self->mInputStream, "readToBuffer:size:", &self->mEncryptedBuffer[(unint64_t)&v9[-mBufferStart]], mBufferSize - (_QWORD)&v9[-mBufferStart]);
    v9 = &v11[self->mBufferEnd];
    self->mBufferEnd = (int64_t)v9;
    if (!v11)
    {
      mBufferStart = self->mBufferStart;
      break;
    }
  }
  if (v9)
  {
    -[BuLr3rwnVU31zt9OioJ56 BaSrRpzcWCyAjSdjbc8j:withSize:into:error:](self->mDecryptionSession, "BaSrRpzcWCyAjSdjbc8j:withSize:into:error:", self->mEncryptedBuffer, &v9[-mBufferStart], self->mBuffer, 0);
    mBufferStart = self->mBufferStart;
    mBufferEnd = self->mBufferEnd;
  }
  else
  {
    mBufferEnd = 0;
  }
LABEL_14:
  mBufferOffset = self->mBufferOffset;
  v13 = mBufferEnd - (mBufferStart + mBufferOffset);
  if (v13 >= a4)
    result = a4;
  else
    result = v13;
  *a3 = &self->mBuffer[mBufferOffset];
  self->mBufferOffset = result + mBufferOffset;
  return result;
}

- (BOOL)seekWithinBufferToOffset:(int64_t)a3
{
  objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler", a3), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[PFDInputStream seekWithinBufferToOffset:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/compatibility/Publication/DRM/PFDInputStream.m"), 189, CFSTR("not implemented"));
  return 0;
}

@end
