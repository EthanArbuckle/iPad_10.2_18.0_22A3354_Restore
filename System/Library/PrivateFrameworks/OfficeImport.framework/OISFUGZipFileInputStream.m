@implementation OISFUGZipFileInputStream

- (OISFUGZipFileInputStream)initWithPath:(id)a3
{
  OISFUGZipFileInputStream *v4;
  int v5;
  gzFile v6;

  self->_fd = -1;
  v4 = -[OISFUGZipFileInputStream init](self, "init");
  if (v4)
  {
    v5 = SFUOpen(a3, 0, 0);
    v6 = gzdopen(v5, "r");
    v4->_file = v6;
    if (!v6)
    {
      close(v5);
      objc_msgSend(MEMORY[0x24BDBCE88], "sfu_errnoRaise:format:", CFSTR("SFUFileOpenError"), CFSTR("Could not gzdopen %@"), a3);
    }
    v4->_fd = v5;
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  -[OISFUGZipFileInputStream close](self, "close");
  v3.receiver = self;
  v3.super_class = (Class)OISFUGZipFileInputStream;
  -[OISFUGZipFileInputStream dealloc](&v3, sel_dealloc);
}

- (int64_t)offset
{
  return self->_offset;
}

- (unint64_t)readToBuffer:(char *)a3 size:(unint64_t)a4
{
  gzFile_s *file;
  uint64_t v8;
  unsigned int v9;
  int v10;
  unint64_t result;

  file = self->_file;
  if (!file)
  {
    v8 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[OISFUGZipFileInputStream readToBuffer:size:]");
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v8, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/sf/SFUGZipFileInputStream.m"), 54, 0, "Using a closed stream");
    +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
    file = self->_file;
    if (!file)
    {
      objc_msgSend(MEMORY[0x24BDBCE88], "sfu_errnoRaise:format:", CFSTR("SFUGZReadError"), CFSTR("Closed stream"));
      file = self->_file;
    }
  }
  if (a4 >= 0xFFFFFFFF)
    v9 = -1;
  else
    v9 = a4;
  v10 = gzread(file, a3, v9);
  if (v10 < 0)
    objc_msgSend(MEMORY[0x24BDBCE88], "sfu_errnoRaise:format:", CFSTR("SFUGZReadError"), CFSTR("Could not gzread"));
  result = v10;
  self->_offset += v10;
  return result;
}

- (BOOL)canSeek
{
  return 0;
}

- (void)seekToOffset:(int64_t)a3
{
  objc_msgSend(MEMORY[0x24BDBCE88], "sfu_errnoRaise:format:", CFSTR("SFUSeekError"), CFSTR("Can't seek an unseekable stream"));
}

- (void)disableSystemCaching
{
  int fd;

  fd = self->_fd;
  if (fd != -1)
  {
    if (fcntl(fd, 48, 1) == -1)
      objc_msgSend(MEMORY[0x24BDBCE88], "sfu_errnoRaise:format:", CFSTR("SFUFcntlError"), CFSTR("Could not set F_NOCACHE on read stream."));
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
      objc_msgSend(MEMORY[0x24BDBCE88], "sfu_errnoRaise:format:", CFSTR("SFUFcntlError"), CFSTR("Could not unset F_NOCACHE on read stream."));
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
  -[OISFUGZipFileInputStream close](self, "close");
  return 0;
}

@end
