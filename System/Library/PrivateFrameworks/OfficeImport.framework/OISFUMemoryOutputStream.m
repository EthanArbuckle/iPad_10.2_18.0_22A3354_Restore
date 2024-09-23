@implementation OISFUMemoryOutputStream

- (OISFUMemoryOutputStream)initWithData:(id)a3
{
  OISFUMemoryOutputStream *v4;

  v4 = -[OISFUMemoryOutputStream init](self, "init");
  if (v4)
    v4->mData = (NSMutableData *)a3;
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)OISFUMemoryOutputStream;
  -[OISFUMemoryOutputStream dealloc](&v3, sel_dealloc);
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
  uint64_t v4;

  v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[OISFUMemoryOutputStream seekToOffset:whence:]", *(_QWORD *)&a4);
  +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/sf/SFUMemoryOutputStream.m"), 42, 0, "Not implemented");
  +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
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
