@implementation _VisionCoreE5RTEspressoIRModelSource

+ (BOOL)isModelSourceURL:(id)a3
{
  id v3;
  void *v4;
  char v5;

  v3 = a3;
  if (objc_msgSend(v3, "isFileURL"))
  {
    objc_msgSend(v3, "lastPathComponent");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "hasSuffix:", CFSTR(".espresso.net"));

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

@end
