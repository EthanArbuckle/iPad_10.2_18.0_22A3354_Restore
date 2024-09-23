@implementation RCComposition

- (BOOL)compositionIsShareable
{
  void *v2;
  void *v3;
  void *v4;
  unsigned __int8 v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RCComposition composedAVURL](self, "composedAVURL"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "path"));
  v5 = objc_msgSend(v3, "fileExistsAtPath:", v4);

  return v5;
}

@end
