@implementation OISFUFileOutputStream

- (OISFUFileOutputStream)initWithPath:(id)a3
{
  OISFUFileOutputStream *v4;

  v4 = -[OISFUFileOutputStream init](self, "init");
  if (v4)
  {
    unlink((const char *)objc_msgSend(a3, "fileSystemRepresentation"));
    v4->mFile = SFUFileOpen(a3, "w");
    v4->mPath = (NSString *)objc_msgSend(a3, "copy");
  }
  return v4;
}

- (void)dealloc
{
  FILE *mFile;
  objc_super v4;

  mFile = self->mFile;
  if (mFile)
    fclose(mFile);

  v4.receiver = self;
  v4.super_class = (Class)OISFUFileOutputStream;
  -[OISFUFileOutputStream dealloc](&v4, sel_dealloc);
}

- (id)path
{
  return self->mPath;
}

- (void)writeBuffer:(const char *)a3 size:(unint64_t)a4
{
  FILE *mFile;
  uint64_t v8;

  mFile = self->mFile;
  if (!mFile)
  {
    v8 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[OISFUFileOutputStream writeBuffer:size:]");
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v8, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/sf/SFUFileOutputStream.m"), 55, 0, "Using a closed stream");
    +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
    mFile = self->mFile;
  }
  if (fwrite(a3, 1uLL, a4, mFile) != a4)
    objc_msgSend(MEMORY[0x24BDBCE88], "sfu_errnoRaise:format:", CFSTR("SFUFileWriteError"), CFSTR("Could not write"));
}

- (int64_t)offset
{
  FILE *mFile;
  uint64_t v4;
  off_t v5;

  mFile = self->mFile;
  if (!mFile)
  {
    v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[OISFUFileOutputStream offset]");
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/sf/SFUFileOutputStream.m"), 60, 0, "Using a closed stream");
    +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
    mFile = self->mFile;
  }
  v5 = ftello(mFile);
  if (v5 == -1)
    objc_msgSend(MEMORY[0x24BDBCE88], "sfu_errnoRaise:format:", CFSTR("SFUFileTellError"), CFSTR("Could not tell"));
  return v5;
}

- (BOOL)canSeek
{
  return 1;
}

- (void)seekToOffset:(int64_t)a3 whence:(int)a4
{
  FILE *mFile;
  uint64_t v8;

  mFile = self->mFile;
  if (!mFile)
  {
    v8 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[OISFUFileOutputStream seekToOffset:whence:]");
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v8, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/sf/SFUFileOutputStream.m"), 70, 0, "Using a closed stream");
    +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
    mFile = self->mFile;
  }
  if (fseeko(mFile, a3, a4))
    objc_msgSend(MEMORY[0x24BDBCE88], "sfu_errnoRaise:format:", CFSTR("SFUFileSeekError"), CFSTR("Could not seek"));
}

- (BOOL)canCreateInputStream
{
  return 0;
}

- (id)inputStream
{
  return 0;
}

- (void)close
{
  FILE *mFile;

  mFile = self->mFile;
  if (mFile)
  {
    fclose(mFile);
    self->mFile = 0;
  }
}

- (id)closeLocalStream
{
  -[OISFUFileOutputStream close](self, "close");
  return 0;
}

@end
