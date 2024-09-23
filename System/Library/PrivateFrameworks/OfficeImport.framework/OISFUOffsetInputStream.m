@implementation OISFUOffsetInputStream

- (OISFUOffsetInputStream)initWithInputStream:(id)a3
{
  return -[OISFUOffsetInputStream initWithInputStream:initialOffset:](self, "initWithInputStream:initialOffset:", a3, objc_msgSend(a3, "offset"));
}

- (OISFUOffsetInputStream)initWithInputStream:(id)a3 initialOffset:(int64_t)a4
{
  OISFUOffsetInputStream *v6;
  SFUInputStream *v7;

  v6 = -[OISFUOffsetInputStream init](self, "init");
  if (v6)
  {
    v7 = (SFUInputStream *)a3;
    v6->mInputStream = v7;
    v6->mInitialOffset = a4;
    -[SFUInputStream seekToOffset:](v7, "seekToOffset:", a4);
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)OISFUOffsetInputStream;
  -[OISFUOffsetInputStream dealloc](&v3, sel_dealloc);
}

- (int64_t)offset
{
  uint64_t v3;
  int64_t mInitialOffset;
  uint64_t v5;

  v3 = -[SFUInputStream offset](self->mInputStream, "offset");
  mInitialOffset = self->mInitialOffset;
  if (v3 < mInitialOffset)
  {
    v5 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[OISFUOffsetInputStream offset]");
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v5, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/sf/SFUOffsetInputStream.m"), 42, 0, "SFUOffsetInputStream points before its offset");
    +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
    mInitialOffset = self->mInitialOffset;
  }
  return v3 - mInitialOffset;
}

- (unint64_t)readToBuffer:(char *)a3 size:(unint64_t)a4
{
  return -[SFUInputStream readToBuffer:size:](self->mInputStream, "readToBuffer:size:", a3, a4);
}

- (BOOL)canSeek
{
  return -[SFUInputStream canSeek](self->mInputStream, "canSeek");
}

- (void)seekToOffset:(int64_t)a3
{
  -[SFUInputStream seekToOffset:](self->mInputStream, "seekToOffset:", self->mInitialOffset + a3);
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

@end
