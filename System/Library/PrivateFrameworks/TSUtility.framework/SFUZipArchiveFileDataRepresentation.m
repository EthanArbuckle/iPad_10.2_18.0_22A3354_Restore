@implementation SFUZipArchiveFileDataRepresentation

- (SFUZipArchiveFileDataRepresentation)initWithPath:(id)a3
{
  SFUZipArchiveFileDataRepresentation *v4;
  SFUZipArchiveFileDataRepresentation *v5;
  int v6;
  SFUFileDataRepresentation *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SFUZipArchiveFileDataRepresentation;
  v4 = -[SFUZipArchiveFileDataRepresentation init](&v9, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->mFd = -1;
    v6 = SFUOpen(a3, 0, 0);
    v5->mFd = v6;
    if (v6 == -1 || pread(v6, 0, 0, 0) == -1)
      v7 = -[SFUFileDataRepresentation initWithPath:]([SFUFileDataRepresentation alloc], "initWithPath:", a3);
    else
      v7 = -[SFUFileDataRepresentation initWithPath:sharedFileDescriptor:]([SFUFileDataRepresentation alloc], "initWithPath:sharedFileDescriptor:", a3, v5->mFd);
    v5->mFileRepresentation = v7;
  }
  return v5;
}

- (void)dealloc
{
  int mFd;
  id v4;
  uint64_t v5;
  objc_super v6;

  mFd = self->mFd;
  if (mFd != -1 && close(mFd))
  {
    v4 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
    v5 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[SFUZipArchiveFileDataRepresentation dealloc]");
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/sf/SFUZipArchiveFileDataRepresentation.m"), 56, CFSTR("close failed on fd = %d with errorno = %d"), self->mFd, *__error());
  }
  v6.receiver = self;
  v6.super_class = (Class)SFUZipArchiveFileDataRepresentation;
  -[SFUZipArchiveFileDataRepresentation dealloc](&v6, sel_dealloc);
}

- (BOOL)isReadable
{
  return -[SFUFileDataRepresentation isReadable](self->mFileRepresentation, "isReadable");
}

- (int64_t)dataLength
{
  return -[SFUFileDataRepresentation dataLength](self->mFileRepresentation, "dataLength");
}

- (BOOL)isEncrypted
{
  return 0;
}

- (id)inputStream
{
  return -[SFUFileDataRepresentation inputStream](self->mFileRepresentation, "inputStream");
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
    return objc_msgSend(-[SFUFileDataRepresentation path](self->mFileRepresentation, "path"), "isEqualToString:", objc_msgSend(a3, "path"));
  return 0;
}

- (id)path
{
  return -[SFUFileDataRepresentation path](self->mFileRepresentation, "path");
}

- (id)inputStreamWithOffset:(int64_t)a3 length:(int64_t)a4
{
  int64_t v7;
  BOOL v8;
  int mFd;
  SFUFileInputStream *v10;

  v7 = -[SFUFileDataRepresentation dataLength](self->mFileRepresentation, "dataLength");
  if ((a4 | a3) < 0 || (v7 >= a4 ? (v8 = v7 - a4 < a3) : (v8 = 1), v8))
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("Bad input stream range."));
  mFd = self->mFd;
  if (mFd == -1 || pread(mFd, 0, 0, 0) == -1)
    v10 = -[SFUFileInputStream initWithPath:offset:length:]([SFUFileInputStream alloc], "initWithPath:offset:length:", -[SFUFileDataRepresentation path](self->mFileRepresentation, "path"), a3, a4);
  else
    v10 = -[SFUFileInputStream initWithFileDescriptor:offset:length:]([SFUFileInputStream alloc], "initWithFileDescriptor:offset:length:", SFUDup(self->mFd), a3, a4);
  return v10;
}

- (id)bufferedInputStreamWithOffset:(int64_t)a3 length:(int64_t)a4
{
  return -[SFUBufferedInputStream initWithStream:dataLength:]([SFUBufferedInputStream alloc], "initWithStream:dataLength:", -[SFUZipArchiveFileDataRepresentation inputStreamWithOffset:length:](self, "inputStreamWithOffset:length:", a3), a4);
}

@end
