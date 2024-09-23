@implementation OISFUOffsetOutputStream

- (OISFUOffsetOutputStream)initWithOutputStream:(id)a3
{
  OISFUOffsetOutputStream *v4;

  v4 = -[OISFUOffsetOutputStream init](self, "init");
  if (v4)
  {
    v4->mOutputStream = (SFUOutputStream *)a3;
    v4->mInitialOffset = objc_msgSend(a3, "offset");
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)OISFUOffsetOutputStream;
  -[OISFUOffsetOutputStream dealloc](&v3, sel_dealloc);
}

- (void)writeBuffer:(const char *)a3 size:(unint64_t)a4
{
  -[SFUOutputStream writeBuffer:size:](self->mOutputStream, "writeBuffer:size:", a3, a4);
}

- (BOOL)canSeek
{
  return -[SFUOutputStream canSeek](self->mOutputStream, "canSeek");
}

- (void)seekToOffset:(int64_t)a3 whence:(int)a4
{
  if (!a4)
    a3 += self->mInitialOffset;
  -[SFUOutputStream seekToOffset:whence:](self->mOutputStream, "seekToOffset:whence:", a3);
}

- (int64_t)offset
{
  uint64_t v3;
  int64_t mInitialOffset;
  uint64_t v5;

  v3 = -[SFUOutputStream offset](self->mOutputStream, "offset");
  mInitialOffset = self->mInitialOffset;
  if (v3 < mInitialOffset)
  {
    v5 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[OISFUOffsetOutputStream offset]");
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v5, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/sf/SFUOffsetOutputStream.m"), 54, 0, "SFUOffsetOutputStream points before its offset");
    +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
    mInitialOffset = self->mInitialOffset;
  }
  return v3 - mInitialOffset;
}

- (BOOL)canCreateInputStream
{
  return -[SFUOutputStream canCreateInputStream](self->mOutputStream, "canCreateInputStream");
}

- (id)inputStream
{
  if (-[OISFUOffsetOutputStream canCreateInputStream](self, "canCreateInputStream"))
    return -[OISFUOffsetInputStream initWithInputStream:initialOffset:]([OISFUOffsetInputStream alloc], "initWithInputStream:initialOffset:", -[SFUOutputStream inputStream](self->mOutputStream, "inputStream"), self->mInitialOffset);
  else
    return 0;
}

- (void)close
{
  -[SFUOutputStream close](self->mOutputStream, "close");
}

- (id)closeLocalStream
{
  return self->mOutputStream;
}

@end
