@implementation SFUFileInputStream

- (SFUFileInputStream)initWithFileDescriptor:(int)a3 offset:(int64_t)a4 length:(int64_t)a5
{
  SFUFileInputStream *v8;
  objc_super v10;

  v8 = self;
  self->mFd = -1;
  v10.receiver = self;
  v10.super_class = (Class)SFUFileInputStream;
  if (!-[SFUFileInputStream init](&v10, sel_init))
    return 0;
  if ((a5 | a4) < 0 || (a5 ^ 0x7FFFFFFFFFFFFFFFLL) < a4)
  {

    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("Offset and/or length invalid."));
  }
  v8->mFd = a3;
  v8->mStartOffset = a4;
  v8->mCurrentOffset = a4;
  v8->mEndOffset = a5 + a4;
  return v8;
}

- (SFUFileInputStream)initWithPath:(id)a3 offset:(int64_t)a4 length:(int64_t)a5
{
  self->mFd = -1;
  if (a3
    && (objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1580], "defaultManager"), "isReadableFileAtPath:", a3) & 1) != 0)
  {
    return -[SFUFileInputStream initWithFileDescriptor:offset:length:](self, "initWithFileDescriptor:offset:length:", SFUOpen(a3, 0, 0), a4, a5);
  }

  return 0;
}

- (SFUFileInputStream)initWithPath:(id)a3 offset:(int64_t)a4
{
  void *v7;
  void *v8;
  uint64_t v9;

  self->mFd = -1;
  v7 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1580], "defaultManager"), "attributesOfItemAtPath:error:", a3, 0);
  if (v7)
  {
    v8 = (void *)objc_msgSend(v7, "objectForKey:", *MEMORY[0x24BDD0D08]);
    if (v8)
    {
      v9 = objc_msgSend(v8, "unsignedLongLongValue");
      if (v9 >= a4)
        return -[SFUFileInputStream initWithPath:offset:length:](self, "initWithPath:offset:length:", a3, a4, v9 - a4);
    }
  }

  return 0;
}

- (void)dealloc
{
  objc_super v3;

  -[SFUFileInputStream close](self, "close");
  v3.receiver = self;
  v3.super_class = (Class)SFUFileInputStream;
  -[SFUFileInputStream dealloc](&v3, sel_dealloc);
}

- (int64_t)offset
{
  return self->mCurrentOffset - self->mStartOffset;
}

- (unint64_t)readToBuffer:(char *)a3 size:(unint64_t)a4
{
  int mFd;
  id v8;
  uint64_t v9;
  off_t mCurrentOffset;
  size_t v11;
  ssize_t v12;
  ssize_t v13;

  mFd = self->mFd;
  if (mFd == -1)
  {
    v8 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
    v9 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[SFUFileInputStream readToBuffer:size:]");
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/sf/SFUFileInputStream.m"), 111, CFSTR("Using a closed stream"));
    mFd = self->mFd;
  }
  mCurrentOffset = self->mCurrentOffset;
  if (self->mEndOffset - mCurrentOffset < a4)
    a4 = self->mEndOffset - mCurrentOffset;
  v11 = a4;
  do
  {
    v12 = pread(mFd, a3, v11, mCurrentOffset);
    v13 = v12;
    if (v12 < 0 || v11 && !v12)
      objc_msgSend(MEMORY[0x24BDBCE88], "errnoRaise:format:", CFSTR("SFUPReadError"), CFSTR("Could not pread"));
    mCurrentOffset += v13;
    a3 += v13;
    v11 -= v13;
  }
  while (v11);
  self->mCurrentOffset += a4;
  return a4;
}

- (BOOL)canSeek
{
  return 1;
}

- (void)seekToOffset:(int64_t)a3
{
  id v5;
  uint64_t v6;
  int64_t v7;
  int64_t mEndOffset;
  id v9;
  uint64_t v10;

  if (self->mFd == -1)
  {
    v5 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
    v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[SFUFileInputStream seekToOffset:]");
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/sf/SFUFileInputStream.m"), 132, CFSTR("Using a closed stream"));
  }
  v7 = self->mStartOffset + a3;
  mEndOffset = self->mEndOffset;
  if (v7 > mEndOffset)
  {
    v9 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
    v10 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[SFUFileInputStream seekToOffset:]");
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/sf/SFUFileInputStream.m"), 135, CFSTR("Offset is too large."));
    mEndOffset = self->mEndOffset;
  }
  if (v7 < mEndOffset)
    mEndOffset = v7;
  self->mCurrentOffset = mEndOffset;
}

- (void)disableSystemCaching
{
  int mFd;

  mFd = self->mFd;
  if (mFd != -1)
  {
    if (fcntl(mFd, 48, 1) == -1)
      objc_msgSend(MEMORY[0x24BDBCE88], "errnoRaise:format:", CFSTR("SFUFcntlError"), CFSTR("Could not set F_NOCACHE on read stream."));
    self->mIsCachingDisabled = 1;
  }
}

- (void)enableSystemCaching
{
  int mFd;

  mFd = self->mFd;
  if (mFd != -1)
  {
    if (fcntl(mFd, 48, 0) == -1)
      objc_msgSend(MEMORY[0x24BDBCE88], "errnoRaise:format:", CFSTR("SFUFcntlError"), CFSTR("Could not unset F_NOCACHE on read stream."));
    self->mIsCachingDisabled = 0;
  }
}

- (void)close
{
  int mFd;
  id v4;
  uint64_t v5;

  mFd = self->mFd;
  if (mFd != -1)
  {
    if (self->mIsCachingDisabled)
    {
      fcntl(mFd, 48, 0);
      self->mIsCachingDisabled = 0;
      mFd = self->mFd;
    }
    if (close(mFd))
    {
      v4 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
      v5 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[SFUFileInputStream close]");
      objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/sf/SFUFileInputStream.m"), 180, CFSTR("Failed to close SFUFileInputStream %p, fd = %d, errno = %d"), self, self->mFd, *__error());
    }
    self->mFd = -1;
  }
}

- (id)closeLocalStream
{
  -[SFUFileInputStream close](self, "close");
  return 0;
}

@end
