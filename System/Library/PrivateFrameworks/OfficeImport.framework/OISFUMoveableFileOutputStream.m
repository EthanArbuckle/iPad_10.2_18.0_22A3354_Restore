@implementation OISFUMoveableFileOutputStream

- (OISFUMoveableFileOutputStream)initWithTemporaryFile:(id)a3
{
  OISFUMoveableFileOutputStream *v4;
  OISFUMoveableFileOutputStream *v5;
  uint64_t v6;
  const char *v7;
  char *v8;
  int v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)OISFUMoveableFileOutputStream;
  v4 = -[OISFUMoveableFileOutputStream init](&v11, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->mFd = -1;
    v6 = objc_msgSend(a3, "stringByAppendingString:", CFSTR("XXXXXXXX"));
    v7 = -[NSString UTF8String](-[NSString stringByAppendingPathComponent:](NSTemporaryDirectory(), "stringByAppendingPathComponent:", v6), "UTF8String");
    v8 = strdup(v7);
    v9 = mkstemp(v8);
    v5->mFd = v9;
    if (v9 == -1)
      objc_msgSend(MEMORY[0x24BDBCE88], "sfu_errnoRaise:format:", CFSTR("SFUMkstempError"), CFSTR("Cannot create temporary file with template %@"), v6);
    v5->mPath = (NSString *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", v8);
    free(v8);
  }
  return v5;
}

- (OISFUMoveableFileOutputStream)initWithPath:(id)a3
{
  OISFUMoveableFileOutputStream *v4;
  OISFUMoveableFileOutputStream *v5;

  v4 = -[OISFUMoveableFileOutputStream init](self, "init");
  v5 = v4;
  if (v4)
  {
    v4->mFd = -1;
    unlink((const char *)objc_msgSend(a3, "fileSystemRepresentation"));
    v5->mFd = SFUOpen(a3, 1537, 0x1B6u);
    v5->mPath = (NSString *)objc_msgSend(a3, "copy");
  }
  return v5;
}

- (void)dealloc
{
  int mFd;
  objc_super v4;

  mFd = self->mFd;
  if (mFd != -1)
    close(mFd);

  v4.receiver = self;
  v4.super_class = (Class)OISFUMoveableFileOutputStream;
  -[OISFUMoveableFileOutputStream dealloc](&v4, sel_dealloc);
}

- (id)path
{
  return self->mPath;
}

- (void)writeBuffer:(const char *)a3 size:(unint64_t)a4
{
  int mFd;
  ssize_t v7;

  mFd = self->mFd;
  do
  {
    v7 = write(mFd, a3, a4);
    if (v7 < 0)
      objc_msgSend(MEMORY[0x24BDBCE88], "sfu_errnoRaise:format:", CFSTR("SFUWriteError"), CFSTR("Could not write"));
    a3 += v7;
    a4 -= v7;
  }
  while (a4);
}

- (int64_t)offset
{
  off_t v2;

  v2 = lseek(self->mFd, 0, 1);
  if (v2 == -1)
    objc_msgSend(MEMORY[0x24BDBCE88], "sfu_errnoRaise:format:", CFSTR("SFUTellError"), CFSTR("Could not tell"));
  return v2;
}

- (BOOL)canSeek
{
  return 1;
}

- (void)seekToOffset:(int64_t)a3 whence:(int)a4
{
  if (lseek(self->mFd, a3, a4) == -1)
    objc_msgSend(MEMORY[0x24BDBCE88], "sfu_errnoRaise:format:", CFSTR("SFUSeekError"), CFSTR("Could not seek"));
}

- (BOOL)moveToPath:(id)a3
{
  int mFd;
  int v6;
  NSString *v7;
  int v8;

  mFd = self->mFd;
  if ((mFd & 0x80000000) == 0)
  {
    close(mFd);
    self->mFd = -1;
  }
  v6 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1580], "defaultManager"), "moveItemAtPath:toPath:error:", self->mPath, a3, 0);
  if (v6)
  {
    v7 = (NSString *)objc_msgSend(a3, "copy");

    self->mPath = v7;
    v8 = SFUOpen(v7, 1, 0);
    self->mFd = v8;
    if (lseek(v8, 0, 2) == -1)
      objc_msgSend(MEMORY[0x24BDBCE88], "sfu_errnoRaise:format:", CFSTR("SFUSeekError"), CFSTR("Could not seek"));
  }
  return v6;
}

- (void)truncateToLength:(int64_t)a3
{
  -[OISFUMoveableFileOutputStream seekToOffset:whence:](self, "seekToOffset:whence:", 0, 2);
  if (-[OISFUMoveableFileOutputStream offset](self, "offset") < a3)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCA98], CFSTR("-[SFUMoveableFileOutputStream truncateToOffset:] does not allow expanding the file"));
  -[OISFUMoveableFileOutputStream seekToOffset:whence:](self, "seekToOffset:whence:", a3, 0);
  if (ftruncate(self->mFd, a3))
    objc_msgSend(MEMORY[0x24BDBCE88], "sfu_errnoRaise:format:", CFSTR("SFUTruncateError"), CFSTR("Could not ftruncate."));
}

- (void)flush
{
  if (fsync(self->mFd))
    objc_msgSend(MEMORY[0x24BDBCE88], "sfu_errnoRaise:format:", CFSTR("SFUFlushError"), CFSTR("Could not fsync."));
}

- (BOOL)canCreateInputStream
{
  return 1;
}

- (id)inputStream
{
  int64_t v3;
  int64_t v4;

  -[OISFUMoveableFileOutputStream flush](self, "flush");
  v3 = -[OISFUMoveableFileOutputStream offset](self, "offset");
  -[OISFUMoveableFileOutputStream seekToOffset:whence:](self, "seekToOffset:whence:", 0, 2);
  v4 = -[OISFUMoveableFileOutputStream offset](self, "offset");
  -[OISFUMoveableFileOutputStream seekToOffset:whence:](self, "seekToOffset:whence:", v3, 0);
  return -[OISFUFileInputStream initWithPath:offset:length:]([OISFUFileInputStream alloc], "initWithPath:offset:length:", self->mPath, 0, v4);
}

- (void)close
{
  int mFd;

  mFd = self->mFd;
  if (mFd != -1)
  {
    close(mFd);
    self->mFd = -1;
  }
}

- (id)closeLocalStream
{
  -[OISFUMoveableFileOutputStream close](self, "close");
  return 0;
}

@end
