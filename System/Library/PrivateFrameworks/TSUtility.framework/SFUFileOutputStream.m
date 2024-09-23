@implementation SFUFileOutputStream

- (SFUFileOutputStream)initWithPath:(id)a3
{
  SFUFileOutputStream *v4;

  v4 = -[SFUFileOutputStream init](self, "init");
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
  v4.super_class = (Class)SFUFileOutputStream;
  -[SFUFileOutputStream dealloc](&v4, sel_dealloc);
}

- (id)path
{
  return self->mPath;
}

- (void)writeBuffer:(const char *)a3 size:(unint64_t)a4
{
  FILE *mFile;
  id v8;
  uint64_t v9;

  mFile = self->mFile;
  if (!mFile)
  {
    v8 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
    v9 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[SFUFileOutputStream writeBuffer:size:]");
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/sf/SFUFileOutputStream.m"), 60, CFSTR("Using a closed stream"));
    mFile = self->mFile;
  }
  if (fwrite(a3, 1uLL, a4, mFile) != a4)
    objc_msgSend(MEMORY[0x24BDBCE88], "errnoRaise:format:", CFSTR("SFUFileWriteError"), CFSTR("Could not write"));
}

- (int64_t)offset
{
  FILE *mFile;
  id v4;
  uint64_t v5;
  off_t v6;

  mFile = self->mFile;
  if (!mFile)
  {
    v4 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
    v5 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[SFUFileOutputStream offset]");
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/sf/SFUFileOutputStream.m"), 66, CFSTR("Using a closed stream"));
    mFile = self->mFile;
  }
  v6 = ftello(mFile);
  if (v6 == -1)
    objc_msgSend(MEMORY[0x24BDBCE88], "errnoRaise:format:", CFSTR("SFUFileTellError"), CFSTR("Could not tell"));
  return v6;
}

- (BOOL)canSeek
{
  return 1;
}

- (void)seekToOffset:(int64_t)a3 whence:(int)a4
{
  FILE *mFile;
  id v8;
  uint64_t v9;

  mFile = self->mFile;
  if (!mFile)
  {
    v8 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
    v9 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[SFUFileOutputStream seekToOffset:whence:]");
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/sf/SFUFileOutputStream.m"), 78, CFSTR("Using a closed stream"));
    mFile = self->mFile;
  }
  if (fseeko(mFile, a3, a4))
    objc_msgSend(MEMORY[0x24BDBCE88], "errnoRaise:format:", CFSTR("SFUFileSeekError"), CFSTR("Could not seek"));
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
  -[SFUFileOutputStream close](self, "close");
  return 0;
}

@end
