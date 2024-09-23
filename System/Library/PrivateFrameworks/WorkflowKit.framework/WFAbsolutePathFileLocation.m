@implementation WFAbsolutePathFileLocation

- (BOOL)isSupportedOnCurrentPlatform
{
  return 0;
}

- (BOOL)shouldShowUsersDuringDisplay:(id)a3
{
  return 0;
}

- (id)resolveLocationWithError:(id *)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99E98];
  -[WFFileLocation relativeSubpath](self, "relativeSubpath", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fileURLWithPath:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (BOOL)canRepresentURL:(id)a3
{
  return 1;
}

+ (id)subpathFromURL:(id)a3
{
  return (id)objc_msgSend(a3, "path");
}

@end
