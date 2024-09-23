@implementation SFUPackageInputBundle

- (SFUPackageInputBundle)initWithPath:(id)a3
{
  SFUPackageInputBundle *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SFUPackageInputBundle;
  v4 = -[SFUPackageInputBundle init](&v6, sel_init);
  if (v4)
    v4->_rootPath = (NSString *)objc_msgSend(a3, "copy");
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SFUPackageInputBundle;
  -[SFUPackageInputBundle dealloc](&v3, sel_dealloc);
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
  return -[SFUPackageInputBundle _existingPathForEntryName:isGz:](self, "_existingPathForEntryName:isGz:", a3, 0) != 0;
}

- (id)inputStreamForEntry:(id)a3
{
  SFUGZipFileInputStream *v3;
  char v5;

  v5 = 0;
  v3 = -[SFUPackageInputBundle _existingPathForEntryName:isGz:](self, "_existingPathForEntryName:isGz:", a3, &v5);
  if (v3)
  {
    if (v5)
      v3 = -[SFUGZipFileInputStream initWithPath:]([SFUGZipFileInputStream alloc], "initWithPath:", v3);
    else
      v3 = -[SFUFileInputStream initWithPath:offset:]([SFUFileInputStream alloc], "initWithPath:offset:", v3, 0);
  }
  return v3;
}

- (id)bufferedInputStreamForEntry:(id)a3
{
  SFUBufferedInputStream *v3;

  v3 = -[SFUPackageInputBundle inputStreamForEntry:](self, "inputStreamForEntry:", a3);
  if (v3)
    v3 = -[SFUBufferedInputStream initWithStream:]([SFUBufferedInputStream alloc], "initWithStream:", v3);
  return v3;
}

- (int64_t)lengthOfEntry:(id)a3
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  int64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v13;
  char v14;

  v14 = 0;
  v5 = -[SFUPackageInputBundle _existingPathForEntryName:isGz:](self, "_existingPathForEntryName:isGz:", a3, &v14);
  if (!v5)
    return 0;
  if (!v14)
    return objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1580], "defaultManager"), "attributesOfItemAtPath:error:", v5, 0), "fileSize");
  v6 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
  v7 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[SFUPackageInputBundle lengthOfEntry:]");
  objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/sf/SFUInputBundle.m"), 180, CFSTR("Asked for the length of gzipped entry %@. This is slow."), a3);
  v8 = -[SFUPackageInputBundle bufferedInputStreamForEntry:](self, "bufferedInputStreamForEntry:", a3);
  v9 = 0;
  v10 = v8;
  if (v8)
  {
    do
    {
      v13 = 0;
      v11 = objc_msgSend(v10, "readToOwnBuffer:size:", &v13, -1);
      v9 += v11;
    }
    while (v11);
  }
  objc_msgSend(v10, "close");
  return v9;
}

- (unsigned)crc32ForEntry:(id)a3
{
  uLong v3;
  uint64_t v4;
  id v5;
  Bytef *buf;

  v3 = 0;
  v5 = -[SFUPackageInputBundle bufferedInputStreamForEntry:](self, "bufferedInputStreamForEntry:", a3);
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
  void *v9;
  id v10;
  SFUFileOutputStream *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  char v15;

  v15 = 0;
  v7 = -[SFUPackageInputBundle _existingPathForEntryName:isGz:](self, "_existingPathForEntryName:isGz:", a3, &v15);
  if (v7)
  {
    v8 = v7;
    v9 = (void *)objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    if (v15)
    {
      v10 = -[SFUPackageInputBundle bufferedInputStreamForEntry:](self, "bufferedInputStreamForEntry:", a3);
      if (v10)
      {
        v11 = -[SFUFileOutputStream initWithPath:]([SFUFileOutputStream alloc], "initWithPath:", a4);
        if (v11)
        {
          while (1)
          {
            v14 = 0;
            v12 = objc_msgSend(v10, "readToOwnBuffer:size:", &v14, -1);
            if (!v12)
              break;
            -[SFUFileOutputStream writeBuffer:size:](v11, "writeBuffer:size:", v14, v12);
          }
        }
      }
      else
      {
        v11 = 0;
      }
      objc_msgSend(v10, "close");
      -[SFUFileOutputStream close](v11, "close");

    }
    else
    {
      v13 = v9;
      v14 = 0;
      if ((objc_msgSend(v9, "linkItemAtPath:toPath:error:", v8, a4, &v14) & 1) == 0
        && (objc_msgSend(v13, "copyItemAtPath:toPath:error:", v8, a4, &v14) & 1) == 0)
      {
        objc_msgSend(MEMORY[0x24BDBCE88], "tsu_raiseWithError:", v14);
      }
    }
  }
}

@end
