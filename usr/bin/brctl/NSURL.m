@implementation NSURL

+ (id)brctl_fileURLWithUserInput:(const char *)a3
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v3));

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lastPathComponent"));
  v6 = _CFURLIsPromiseName();

  if (v6)
  {
    v7 = (void *)_CFURLCopyLogicalNameOfPromiseAtURL(v4, 0);
    if (v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "URLByDeletingLastPathComponent"));
      v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "URLByAppendingPathComponent:", v7));

      v4 = (void *)v9;
    }

  }
  objc_msgSend(v4, "br_addPhysicalProperty");
  return v4;
}

@end
