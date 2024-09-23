@implementation SFUOffsetOutputStream

- (SFUOffsetOutputStream)initWithOutputStream:(id)a3
{
  SFUOffsetOutputStream *v4;

  v4 = -[SFUOffsetOutputStream init](self, "init");
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
  v3.super_class = (Class)SFUOffsetOutputStream;
  -[SFUOffsetOutputStream dealloc](&v3, sel_dealloc);
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
  id v5;
  uint64_t v6;

  v3 = -[SFUOutputStream offset](self->mOutputStream, "offset");
  mInitialOffset = self->mInitialOffset;
  if (v3 < mInitialOffset)
  {
    v5 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
    v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[SFUOffsetOutputStream offset]");
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/sf/SFUOffsetOutputStream.m"), 59, CFSTR("SFUOffsetOutputStream points before its offset"));
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
  if (-[SFUOffsetOutputStream canCreateInputStream](self, "canCreateInputStream"))
    return -[SFUOffsetInputStream initWithInputStream:initialOffset:]([SFUOffsetInputStream alloc], "initWithInputStream:initialOffset:", -[SFUOutputStream inputStream](self->mOutputStream, "inputStream"), self->mInitialOffset);
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
