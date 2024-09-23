@implementation NavdPaths

+ (id)pathInCacheDirWithFilename:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;

  v3 = qword_1014D2D90;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&qword_1014D2D90, &stru_1011BFD08);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_1014D2D88, "stringByAppendingPathComponent:", v4));

  return v5;
}

@end
