@implementation OISFUGZipFileOutputStream

+ (id)gzipExtension
{
  return CFSTR("gz");
}

- (OISFUGZipFileOutputStream)initWithPath:(id)a3
{
  OISFUGZipFileOutputStream *v4;
  int v5;
  gzFile v6;

  v4 = -[OISFUGZipFileOutputStream init](self, "init");
  if (v4)
  {
    unlink((const char *)objc_msgSend(a3, "fileSystemRepresentation"));
    v5 = SFUOpen(a3, 1537, 0x1B6u);
    v6 = gzdopen(v5, "w");
    v4->_file = v6;
    if (!v6)
    {
      close(v5);
      objc_msgSend(MEMORY[0x24BDBCE88], "sfu_errnoRaise:format:", CFSTR("SFUFileOpenError"), CFSTR("Could not gzdopen %@"), a3);
    }
    v4->_path = (NSString *)objc_msgSend(a3, "copy");
  }
  return v4;
}

- (void)dealloc
{
  gzFile_s *file;
  objc_super v4;

  file = self->_file;
  if (file)
    gzclose(file);

  v4.receiver = self;
  v4.super_class = (Class)OISFUGZipFileOutputStream;
  -[OISFUGZipFileOutputStream dealloc](&v4, sel_dealloc);
}

- (id)path
{
  return self->_path;
}

- (void)writeBuffer:(const char *)a3 size:(unint64_t)a4
{
  gzFile_s *file;
  uint64_t v8;
  unint64_t v9;
  int v10;

  file = self->_file;
  if (!file)
  {
    v8 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[OISFUGZipFileOutputStream writeBuffer:size:]");
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v8, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/sf/SFUGZipFileOutputStream.m"), 64, 0, "Using a closed stream");
    +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
    file = self->_file;
  }
  if (a4 && file)
  {
    do
    {
      if (a4 >= 0xFFFFFFFF)
        v9 = 0xFFFFFFFFLL;
      else
        v9 = a4;
      v10 = gzwrite(self->_file, a3, v9);
      if (v9 != v10)
        objc_msgSend(MEMORY[0x24BDBCE88], "sfu_errnoRaise:format:", CFSTR("SFUFileWriteError"), CFSTR("Could not gzwrite"));
      self->_offset += v10;
      a3 += v10;
      a4 -= v10;
    }
    while (a4);
  }
}

- (int64_t)offset
{
  uint64_t v3;

  if (!self->_file)
  {
    v3 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[OISFUGZipFileOutputStream offset]");
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v3, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/sf/SFUGZipFileOutputStream.m"), 80, 0, "Using a closed stream");
    +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
  }
  return self->_offset;
}

- (BOOL)canSeek
{
  return 0;
}

- (void)seekToOffset:(int64_t)a3 whence:(int)a4
{
  objc_msgSend(MEMORY[0x24BDBCE88], "sfu_errnoRaise:format:", CFSTR("SFUSeekError"), CFSTR("Can't seek an unseekable stream"));
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
  gzFile_s *file;

  file = self->_file;
  if (file)
  {
    gzclose(file);
    self->_file = 0;
  }
}

- (id)closeLocalStream
{
  -[OISFUGZipFileOutputStream close](self, "close");
  return 0;
}

@end
