@implementation SFUMemoryOutputStream

- (SFUMemoryOutputStream)initWithData:(id)a3
{
  SFUMemoryOutputStream *v4;

  v4 = -[SFUMemoryOutputStream init](self, "init");
  if (v4)
    v4->mData = (NSMutableData *)a3;
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SFUMemoryOutputStream;
  -[SFUMemoryOutputStream dealloc](&v3, sel_dealloc);
}

- (void)writeBuffer:(const char *)a3 size:(unint64_t)a4
{
  -[NSMutableData appendBytes:length:](self->mData, "appendBytes:length:", a3, a4);
}

- (BOOL)canSeek
{
  return 0;
}

- (void)seekToOffset:(int64_t)a3 whence:(int)a4
{
  id v4;
  uint64_t v5;

  v4 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler", a3, *(_QWORD *)&a4);
  v5 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[SFUMemoryOutputStream seekToOffset:whence:]");
  objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/sf/SFUMemoryOutputStream.m"), 45, CFSTR("Not implemented"));
}

- (int64_t)offset
{
  return -[NSMutableData length](self->mData, "length");
}

- (BOOL)canCreateInputStream
{
  return 0;
}

- (id)inputStream
{
  return 0;
}

- (id)closeLocalStream
{
  return 0;
}

@end
