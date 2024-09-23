@implementation NSFileManager(WebNSFileManagerExtras)

- (void)_webkit_pathWithUniqueFilenameForPath:()WebNSFileManagerExtras
{
  void *v3;
  void *v4;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  stat v11;

  v3 = (void *)objc_msgSend((id)objc_msgSend(a3, "stringByDeletingLastPathComponent"), "stringByAppendingPathComponent:", filenameByFixingIllegalCharacters((NSString *)objc_msgSend(a3, "lastPathComponent")));
  if (lstat((const char *)objc_msgSend(v3, "fileSystemRepresentation"), &v11))
    return v3;
  v6 = (void *)objc_msgSend(v3, "lastPathComponent");
  v7 = objc_msgSend(v6, "rangeOfString:", CFSTR("."));
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = 0;
  }
  else
  {
    v9 = v7;
    v8 = (void *)objc_msgSend(v6, "substringFromIndex:", v7 + 1);
    v3 = (void *)objc_msgSend((id)objc_msgSend(v3, "stringByDeletingLastPathComponent"), "stringByAppendingPathComponent:", objc_msgSend(v6, "substringToIndex:", v9));
  }
  v10 = 1;
  do
  {
    v4 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%d"), v3, v10);
    if (objc_msgSend(v8, "length"))
      v4 = (void *)objc_msgSend(v4, "stringByAppendingPathExtension:", v8);
    v10 = (v10 + 1);
  }
  while (!lstat((const char *)objc_msgSend(v4, "fileSystemRepresentation"), &v11));
  return v4;
}

- (uint64_t)_webkit_createTemporaryDirectoryWithTemplatePrefix:()WebNSFileManagerExtras
{
  return WTF::FileSystemImpl::createTemporaryDirectory(this, a2);
}

@end
