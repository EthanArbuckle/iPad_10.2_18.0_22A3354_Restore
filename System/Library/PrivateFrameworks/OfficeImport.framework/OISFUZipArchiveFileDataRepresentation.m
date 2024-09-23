@implementation OISFUZipArchiveFileDataRepresentation

- (OISFUZipArchiveFileDataRepresentation)initWithPath:(id)a3
{
  OISFUZipArchiveFileDataRepresentation *v4;
  OISFUZipArchiveFileDataRepresentation *v5;
  int v6;
  OISFUFileDataRepresentation *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)OISFUZipArchiveFileDataRepresentation;
  v4 = -[OISFUZipArchiveFileDataRepresentation init](&v9, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->mFd = -1;
    v6 = SFUOpen(a3, 0, 0);
    v5->mFd = v6;
    if (v6 == -1 || pread(v6, 0, 0, 0) == -1)
      v7 = -[OISFUFileDataRepresentation initWithPath:]([OISFUFileDataRepresentation alloc], "initWithPath:", a3);
    else
      v7 = -[OISFUFileDataRepresentation initWithPath:sharedFileDescriptor:]([OISFUFileDataRepresentation alloc], "initWithPath:sharedFileDescriptor:", a3, v5->mFd);
    v5->mFileRepresentation = v7;
  }
  return v5;
}

- (void)dealloc
{
  int mFd;
  uint64_t v4;
  objc_super v5;

  mFd = self->mFd;
  if (mFd != -1 && close(mFd))
  {
    v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[OISFUZipArchiveFileDataRepresentation dealloc]");
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/sf/SFUZipArchiveFileDataRepresentation.m"), 50, 0, "close failed on fd = %d with errorno = %d", self->mFd, *__error());
    +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
  }
  v5.receiver = self;
  v5.super_class = (Class)OISFUZipArchiveFileDataRepresentation;
  -[OISFUZipArchiveFileDataRepresentation dealloc](&v5, sel_dealloc);
}

- (BOOL)isReadable
{
  return -[OISFUFileDataRepresentation isReadable](self->mFileRepresentation, "isReadable");
}

- (int64_t)dataLength
{
  return -[OISFUFileDataRepresentation dataLength](self->mFileRepresentation, "dataLength");
}

- (BOOL)isEncrypted
{
  return 0;
}

- (id)inputStream
{
  return -[OISFUFileDataRepresentation inputStream](self->mFileRepresentation, "inputStream");
}

- (BOOL)hasSameLocationAs:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    a3 = (id)*((_QWORD *)a3 + 4);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      return 0;
  }
  if (a3)
    return objc_msgSend(-[OISFUFileDataRepresentation path](self->mFileRepresentation, "path"), "isEqualToString:", objc_msgSend(a3, "path"));
  return 0;
}

- (id)path
{
  return -[OISFUFileDataRepresentation path](self->mFileRepresentation, "path");
}

- (id)inputStreamWithOffset:(int64_t)a3 length:(int64_t)a4
{
  int64_t v7;
  BOOL v8;
  int mFd;
  OISFUFileInputStream *v10;

  v7 = -[OISFUFileDataRepresentation dataLength](self->mFileRepresentation, "dataLength");
  if ((a4 | a3) < 0 || (v7 >= a4 ? (v8 = v7 - a4 < a3) : (v8 = 1), v8))
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("Bad input stream range."));
  mFd = self->mFd;
  if (mFd == -1 || pread(mFd, 0, 0, 0) == -1)
    v10 = -[OISFUFileInputStream initWithPath:offset:length:]([OISFUFileInputStream alloc], "initWithPath:offset:length:", -[OISFUFileDataRepresentation path](self->mFileRepresentation, "path"), a3, a4);
  else
    v10 = -[OISFUFileInputStream initWithFileDescriptor:offset:length:]([OISFUFileInputStream alloc], "initWithFileDescriptor:offset:length:", SFUDup(self->mFd), a3, a4);
  return v10;
}

- (id)bufferedInputStreamWithOffset:(int64_t)a3 length:(int64_t)a4
{
  return -[OISFUBufferedInputStream initWithStream:dataLength:]([OISFUBufferedInputStream alloc], "initWithStream:dataLength:", -[OISFUZipArchiveFileDataRepresentation inputStreamWithOffset:length:](self, "inputStreamWithOffset:length:", a3), a4);
}

@end
