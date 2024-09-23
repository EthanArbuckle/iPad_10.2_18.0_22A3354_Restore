@implementation _VisionCoreE5RTCompiledMLModelSource

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
    v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("mlmodelc"));

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)E5ModelFileURL
{
  void *v2;
  void *v3;

  -[VisionCoreE5RTModelSource URL](self, "URL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:", CFSTR("model.mil"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
