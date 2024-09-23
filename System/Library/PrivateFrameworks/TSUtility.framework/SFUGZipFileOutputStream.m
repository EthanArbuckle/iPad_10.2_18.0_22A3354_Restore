@implementation SFUGZipFileOutputStream

+ (id)gzipExtension
{
  return CFSTR("gz");
}

- (SFUGZipFileOutputStream)initWithPath:(id)a3
{
  SFUGZipFileOutputStream *v4;
  int v5;
  gzFile v6;

  v4 = -[SFUGZipFileOutputStream init](self, "init");
  if (v4)
  {
    unlink((const char *)objc_msgSend(a3, "fileSystemRepresentation"));
    v5 = TSUOpen(a3, 1537, 0x1B6u);
    v6 = gzdopen(v5, "w");
    v4->_file = v6;
    if (!v6)
    {
      close(v5);
      objc_msgSend(MEMORY[0x24BDBCE88], "errnoRaise:format:", CFSTR("SFUFileOpenError"), CFSTR("Could not gzdopen %@"), a3);
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
  v4.super_class = (Class)SFUGZipFileOutputStream;
  -[SFUGZipFileOutputStream dealloc](&v4, sel_dealloc);
}

- (id)path
{
  return self->_path;
}

- (void)writeBuffer:(const char *)a3 size:(unint64_t)a4
{
  gzFile_s *file;
  id v8;
  uint64_t v9;
  unint64_t v10;
  int v11;

  file = self->_file;
  if (!file)
  {
    v8 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
    v9 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[SFUGZipFileOutputStream writeBuffer:size:]");
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/sf/SFUGZipFileOutputStream.m"), 72, CFSTR("Using a closed stream"));
    file = self->_file;
  }
  if (a4 && file)
  {
    do
    {
      if (a4 >= 0xFFFFFFFF)
        v10 = 0xFFFFFFFFLL;
      else
        v10 = a4;
      v11 = gzwrite(self->_file, a3, v10);
      if (v10 != v11)
        objc_msgSend(MEMORY[0x24BDBCE88], "errnoRaise:format:", CFSTR("SFUFileWriteError"), CFSTR("Could not gzwrite"));
      self->_offset += v11;
      a3 += v11;
      a4 -= v11;
    }
    while (a4);
  }
}

- (int64_t)offset
{
  id v3;
  uint64_t v4;

  if (!self->_file)
  {
    v3 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
    v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[SFUGZipFileOutputStream offset]");
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/sf/SFUGZipFileOutputStream.m"), 92, CFSTR("Using a closed stream"));
  }
  return self->_offset;
}

- (BOOL)canSeek
{
  return 0;
}

- (void)seekToOffset:(int64_t)a3 whence:(int)a4
{
  objc_msgSend(MEMORY[0x24BDBCE88], "errnoRaise:format:", CFSTR("SFUSeekError"), CFSTR("Can't seek an unseekable stream"));
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
  -[SFUGZipFileOutputStream close](self, "close");
  return 0;
}

@end
