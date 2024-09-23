@implementation _VisionCoreE5RTMILModelSource

+ (BOOL)isModelSourceURL:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  char v6;

  v3 = a3;
  if (objc_msgSend(v3, "isFileURL"))
  {
    objc_msgSend(v3, "lastPathComponent");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pathExtension");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("mil"));

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

@end
