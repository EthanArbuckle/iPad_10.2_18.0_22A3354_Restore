@implementation OISFUFileInputStream

- (OISFUFileInputStream)initWithFileDescriptor:(int)a3 offset:(int64_t)a4 length:(int64_t)a5
{
  OISFUFileInputStream *v8;
  objc_super v10;

  v8 = self;
  self->mFd = -1;
  v10.receiver = self;
  v10.super_class = (Class)OISFUFileInputStream;
  if (!-[OISFUFileInputStream init](&v10, sel_init))
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

- (OISFUFileInputStream)initWithPath:(id)a3 offset:(int64_t)a4 length:(int64_t)a5
{
  self->mFd = -1;
  if (a3
    && (objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1580], "defaultManager"), "isReadableFileAtPath:", a3) & 1) != 0)
  {
    return -[OISFUFileInputStream initWithFileDescriptor:offset:length:](self, "initWithFileDescriptor:offset:length:", SFUOpen(a3, 0, 0), a4, a5);
  }

  return 0;
}

- (OISFUFileInputStream)initWithPath:(id)a3 offset:(int64_t)a4
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
        return -[OISFUFileInputStream initWithPath:offset:length:](self, "initWithPath:offset:length:", a3, a4, v9 - a4);
    }
  }

  return 0;
}

- (void)dealloc
{
  objc_super v3;

  -[OISFUFileInputStream close](self, "close");
  v3.receiver = self;
  v3.super_class = (Class)OISFUFileInputStream;
  -[OISFUFileInputStream dealloc](&v3, sel_dealloc);
}

- (int64_t)offset
{
  return self->mCurrentOffset - self->mStartOffset;
}

- (unint64_t)readToBuffer:(char *)a3 size:(unint64_t)a4
{
  int mFd;
  uint64_t v8;
  off_t mCurrentOffset;
  size_t v10;
  ssize_t v11;
  ssize_t v12;

  mFd = self->mFd;
  if (mFd == -1)
  {
    v8 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[OISFUFileInputStream readToBuffer:size:]");
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v8, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/sf/SFUFileInputStream.m"), 98, 0, "Using a closed stream");
    +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
    mFd = self->mFd;
  }
  mCurrentOffset = self->mCurrentOffset;
  if (self->mEndOffset - mCurrentOffset < a4)
    a4 = self->mEndOffset - mCurrentOffset;
  v10 = a4;
  do
  {
    v11 = pread(mFd, a3, v10, mCurrentOffset);
    v12 = v11;
    if (v11 < 0 || v10 && !v11)
      objc_msgSend(MEMORY[0x24BDBCE88], "sfu_errnoRaise:format:", CFSTR("SFUPReadError"), CFSTR("Could not pread"));
    mCurrentOffset += v12;
    a3 += v12;
    v10 -= v12;
  }
  while (v10);
  self->mCurrentOffset += a4;
  return a4;
}

- (BOOL)canSeek
{
  return 1;
}

- (void)seekToOffset:(int64_t)a3
{
  uint64_t v5;
  int64_t v6;
  int64_t mEndOffset;
  uint64_t v8;

  if (self->mFd == -1)
  {
    v5 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[OISFUFileInputStream seekToOffset:]");
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v5, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/sf/SFUFileInputStream.m"), 116, 0, "Using a closed stream");
    +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
  }
  v6 = self->mStartOffset + a3;
  mEndOffset = self->mEndOffset;
  if (v6 > mEndOffset)
  {
    v8 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[OISFUFileInputStream seekToOffset:]");
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v8, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/sf/SFUFileInputStream.m"), 119, 0, "Offset is too large.");
    +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
    mEndOffset = self->mEndOffset;
  }
  if (v6 < mEndOffset)
    mEndOffset = v6;
  self->mCurrentOffset = mEndOffset;
}

- (void)disableSystemCaching
{
  int mFd;

  mFd = self->mFd;
  if (mFd != -1)
  {
    if (fcntl(mFd, 48, 1) == -1)
      objc_msgSend(MEMORY[0x24BDBCE88], "sfu_errnoRaise:format:", CFSTR("SFUFcntlError"), CFSTR("Could not set F_NOCACHE on read stream."));
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
      objc_msgSend(MEMORY[0x24BDBCE88], "sfu_errnoRaise:format:", CFSTR("SFUFcntlError"), CFSTR("Could not unset F_NOCACHE on read stream."));
    self->mIsCachingDisabled = 0;
  }
}

- (void)close
{
  int mFd;
  uint64_t v4;

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
      v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[OISFUFileInputStream close]");
      +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/sf/SFUFileInputStream.m"), 155, 0, "Failed to close SFUFileInputStream %p, fd = %d, errno = %d", self, self->mFd, *__error());
      +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
    }
    self->mFd = -1;
  }
}

- (id)closeLocalStream
{
  -[OISFUFileInputStream close](self, "close");
  return 0;
}

@end
