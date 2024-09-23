@implementation OISFUPackageInputBundle

- (OISFUPackageInputBundle)initWithPath:(id)a3
{
  OISFUPackageInputBundle *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)OISFUPackageInputBundle;
  v4 = -[OISFUPackageInputBundle init](&v6, sel_init);
  if (v4)
    v4->_rootPath = (NSString *)objc_msgSend(a3, "copy");
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)OISFUPackageInputBundle;
  -[OISFUPackageInputBundle dealloc](&v3, sel_dealloc);
}

- (id)_existingPathForEntryName:(id)a3 isGz:(BOOL *)a4
{
  void *v7;
  NSString *v8;
  int v9;

  v7 = (void *)objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v8 = -[NSString stringByAppendingPathComponent:](self->_rootPath, "stringByAppendingPathComponent:", a3);
  if ((objc_msgSend(v7, "fileExistsAtPath:", v8) & 1) != 0)
  {
    LOBYTE(v9) = 0;
    if (!a4)
      return v8;
    goto LABEL_7;
  }
  v8 = -[NSString stringByAppendingPathExtension:](v8, "stringByAppendingPathExtension:", CFSTR("gz"));
  v9 = objc_msgSend(v7, "fileExistsAtPath:", v8);
  if (!v9)
    v8 = 0;
  if (a4)
LABEL_7:
    *a4 = v9;
  return v8;
}

- (BOOL)hasEntryWithName:(id)a3
{
  return -[OISFUPackageInputBundle _existingPathForEntryName:isGz:](self, "_existingPathForEntryName:isGz:", a3, 0) != 0;
}

- (id)inputStreamForEntry:(id)a3
{
  OISFUGZipFileInputStream *v3;
  char v5;

  v5 = 0;
  v3 = -[OISFUPackageInputBundle _existingPathForEntryName:isGz:](self, "_existingPathForEntryName:isGz:", a3, &v5);
  if (v3)
  {
    if (v5)
      v3 = -[OISFUGZipFileInputStream initWithPath:]([OISFUGZipFileInputStream alloc], "initWithPath:", v3);
    else
      v3 = -[OISFUFileInputStream initWithPath:offset:]([OISFUFileInputStream alloc], "initWithPath:offset:", v3, 0);
  }
  return v3;
}

- (id)bufferedInputStreamForEntry:(id)a3
{
  OISFUBufferedInputStream *v3;

  v3 = -[OISFUPackageInputBundle inputStreamForEntry:](self, "inputStreamForEntry:", a3);
  if (v3)
    v3 = -[OISFUBufferedInputStream initWithStream:]([OISFUBufferedInputStream alloc], "initWithStream:", v3);
  return v3;
}

- (int64_t)lengthOfEntry:(id)a3
{
  id v5;
  uint64_t v6;
  id v7;
  int64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v12;
  char v13;

  v13 = 0;
  v5 = -[OISFUPackageInputBundle _existingPathForEntryName:isGz:](self, "_existingPathForEntryName:isGz:", a3, &v13);
  if (!v5)
    return 0;
  if (!v13)
    return objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1580], "defaultManager"), "attributesOfItemAtPath:error:", v5, 0), "fileSize");
  v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[OISFUPackageInputBundle lengthOfEntry:]");
  +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/sf/SFUInputBundle.m"), 152, 0, "Asked for the length of gzipped entry %@. This is slow.", a3);
  +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
  v7 = -[OISFUPackageInputBundle bufferedInputStreamForEntry:](self, "bufferedInputStreamForEntry:", a3);
  v8 = 0;
  v9 = v7;
  if (v7)
  {
    do
    {
      v12 = 0;
      v10 = objc_msgSend(v9, "readToOwnBuffer:size:", &v12, -1);
      v8 += v10;
    }
    while (v10);
  }
  objc_msgSend(v9, "close");
  return v8;
}

- (unsigned)crc32ForEntry:(id)a3
{
  uLong v3;
  uint64_t v4;
  id v5;
  Bytef *buf;

  v3 = 0;
  v5 = -[OISFUPackageInputBundle bufferedInputStreamForEntry:](self, "bufferedInputStreamForEntry:", a3);
  if (v5)
  {
    while (1)
    {
      buf = 0;
      v4 = objc_msgSend(v5, "readToOwnBuffer:size:", &buf, -1);
      if (!v4)
        break;
      LODWORD(v3) = crc32(v3, buf, v4);
    }
  }
  objc_msgSend(v5, "close", v4);
  return v3;
}

- (void)copyEntry:(id)a3 toFile:(id)a4
{
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  OISFUFileOutputStream *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  char v16;

  v16 = 0;
  v7 = -[OISFUPackageInputBundle _existingPathForEntryName:isGz:](self, "_existingPathForEntryName:isGz:", a3, &v16);
  if (v7)
  {
    v8 = v7;
    v9 = objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    if (v16)
    {
      v10 = -[OISFUPackageInputBundle bufferedInputStreamForEntry:](self, "bufferedInputStreamForEntry:", a3);
      if (v10)
      {
        v11 = -[OISFUFileOutputStream initWithPath:]([OISFUFileOutputStream alloc], "initWithPath:", a4);
        if (v11)
        {
          while (1)
          {
            v15 = 0;
            v12 = objc_msgSend(v10, "readToOwnBuffer:size:", &v15, -1);
            if (!v12)
              break;
            -[OISFUFileOutputStream writeBuffer:size:](v11, "writeBuffer:size:", v15, v12);
          }
        }
      }
      else
      {
        v11 = 0;
      }
      objc_msgSend(v10, "close");
      -[OISFUFileOutputStream close](v11, "close");

    }
    else
    {
      v13 = (void *)v9;
      v15 = 0;
      v14 = objc_msgSend(MEMORY[0x24BDBCF48], "tsu_fileURLWithPath:", v8);
      if ((objc_msgSend(v13, "tsu_linkOrCopyItemAtURL:toURL:error:", v14, objc_msgSend(MEMORY[0x24BDBCF48], "tsu_fileURLWithPath:", a4), &v15) & 1) == 0)objc_msgSend(MEMORY[0x24BDBCE88], "tsu_raiseWithError:", v15);
    }
  }
}

@end
