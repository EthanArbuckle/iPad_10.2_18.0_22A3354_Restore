@implementation OISFUMemoryInputStream

- (OISFUMemoryInputStream)initWithData:(id)a3
{
  return -[OISFUMemoryInputStream initWithData:offset:length:](self, "initWithData:offset:length:", a3, 0, objc_msgSend(a3, "length"));
}

- (OISFUMemoryInputStream)initWithData:(id)a3 offset:(unint64_t)a4 length:(unint64_t)a5
{
  OISFUMemoryInputStream *v8;
  OISFUMemoryInputStream *v9;
  unint64_t v10;
  NSData *v11;
  uint64_t v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)OISFUMemoryInputStream;
  v8 = -[OISFUMemoryInputStream init](&v14, sel_init);
  v9 = v8;
  if (v8)
  {
    if (a3)
    {
      v10 = objc_msgSend(a3, "length");
      if (v10 < a5 || v10 - a5 < a4)
      {

        objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("Bad data range."));
      }
      v11 = (NSData *)a3;
      v9->mData = v11;
      v12 = -[NSData bytes](v11, "bytes");
      v9->mStart = (const char *)(v12 + a4);
      v9->mCurrent = (const char *)(v12 + a4);
      v9->mEnd = (const char *)(v12 + a4 + a5);
    }
    else
    {

      return 0;
    }
  }
  return v9;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)OISFUMemoryInputStream;
  -[OISFUMemoryInputStream dealloc](&v3, sel_dealloc);
}

- (int64_t)offset
{
  return self->mCurrent - self->mStart;
}

- (unint64_t)readToBuffer:(char *)a3 size:(unint64_t)a4
{
  const char *mCurrent;
  size_t v6;

  mCurrent = self->mCurrent;
  if (self->mEnd - mCurrent >= a4)
    v6 = a4;
  else
    v6 = self->mEnd - mCurrent;
  memcpy(a3, mCurrent, v6);
  self->mCurrent += v6;
  return v6;
}

- (BOOL)canSeek
{
  return 1;
}

- (void)seekToOffset:(int64_t)a3
{
  const char *mEnd;
  const char *mStart;
  int64_t v5;
  const char *v6;

  mEnd = self->mEnd;
  mStart = self->mStart;
  v5 = mEnd - mStart;
  v6 = &mStart[a3];
  if (v5 >= a3)
    mEnd = v6;
  self->mCurrent = mEnd;
}

- (unint64_t)readToOwnBuffer:(const char *)a3 size:(unint64_t)a4
{
  const char *mCurrent;
  unint64_t v5;

  mCurrent = self->mCurrent;
  v5 = self->mEnd - mCurrent;
  if (v5 >= a4)
    v5 = a4;
  *a3 = mCurrent;
  self->mCurrent += v5;
  return v5;
}

- (BOOL)seekWithinBufferToOffset:(int64_t)a3
{
  int64_t v4;

  v4 = self->mEnd - self->mStart;
  if (v4 >= a3)
    -[OISFUMemoryInputStream seekToOffset:](self, "seekToOffset:", a3);
  return v4 >= a3;
}

- (id)closeLocalStream
{
  return 0;
}

@end
