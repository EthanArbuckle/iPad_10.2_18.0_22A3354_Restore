@implementation SFUGZipFileInputStream

- (SFUGZipFileInputStream)initWithPath:(id)a3
{
  SFUGZipFileInputStream *v4;
  int v5;
  gzFile v6;

  self->_fd = -1;
  v4 = -[SFUGZipFileInputStream init](self, "init");
  if (v4)
  {
    v5 = SFUOpen(a3, 0, 0);
    v6 = gzdopen(v5, "r");
    v4->_file = v6;
    if (!v6)
    {
      close(v5);
      objc_msgSend(MEMORY[0x24BDBCE88], "errnoRaise:format:", CFSTR("SFUFileOpenError"), CFSTR("Could not gzdopen %@"), a3);
    }
    v4->_fd = v5;
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  -[SFUGZipFileInputStream close](self, "close");
  v3.receiver = self;
  v3.super_class = (Class)SFUGZipFileInputStream;
  -[SFUGZipFileInputStream dealloc](&v3, sel_dealloc);
}

- (int64_t)offset
{
  return self->_offset;
}

- (unint64_t)readToBuffer:(char *)a3 size:(unint64_t)a4
{
  gzFile_s *file;
  id v8;
  uint64_t v9;
  unsigned int v10;
  int v11;
  unint64_t result;

  file = self->_file;
  if (!file)
  {
    v8 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
    v9 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[SFUGZipFileInputStream readToBuffer:size:]");
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/sf/SFUGZipFileInputStream.m"), 59, CFSTR("Using a closed stream"));
    file = self->_file;
    if (!file)
    {
      objc_msgSend(MEMORY[0x24BDBCE88], "errnoRaise:format:", CFSTR("SFUGZReadError"), CFSTR("Closed stream"));
      file = self->_file;
    }
  }
  if (a4 >= 0xFFFFFFFF)
    v10 = -1;
  else
    v10 = a4;
  v11 = gzread(file, a3, v10);
  if (v11 < 0)
    objc_msgSend(MEMORY[0x24BDBCE88], "errnoRaise:format:", CFSTR("SFUGZReadError"), CFSTR("Could not gzread"));
  result = v11;
  self->_offset += v11;
  return result;
}

- (BOOL)canSeek
{
  return 0;
}

- (void)seekToOffset:(int64_t)a3
{
  objc_msgSend(MEMORY[0x24BDBCE88], "errnoRaise:format:", CFSTR("SFUSeekError"), CFSTR("Can't seek an unseekable stream"));
}

- (void)disableSystemCaching
{
  int fd;

  fd = self->_fd;
  if (fd != -1)
  {
    if (fcntl(fd, 48, 1) == -1)
      objc_msgSend(MEMORY[0x24BDBCE88], "errnoRaise:format:", CFSTR("SFUFcntlError"), CFSTR("Could not set F_NOCACHE on read stream."));
    self->_isCachingDisabled = 1;
  }
}

- (void)enableSystemCaching
{
  int fd;

  fd = self->_fd;
  if (fd != -1)
  {
    if (fcntl(fd, 48, 0) == -1)
      objc_msgSend(MEMORY[0x24BDBCE88], "errnoRaise:format:", CFSTR("SFUFcntlError"), CFSTR("Could not unset F_NOCACHE on read stream."));
    self->_isCachingDisabled = 0;
  }
}

- (void)close
{
  int fd;
  gzFile_s *file;

  fd = self->_fd;
  if (fd != -1)
  {
    if (self->_isCachingDisabled)
    {
      fcntl(fd, 48, 0);
      self->_isCachingDisabled = 0;
    }
    self->_fd = -1;
  }
  file = self->_file;
  if (file)
  {
    gzclose(file);
    self->_file = 0;
  }
}

- (id)closeLocalStream
{
  -[SFUGZipFileInputStream close](self, "close");
  return 0;
}

@end
