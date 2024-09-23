@implementation NSString

+ (id)downloadedOnlyMessage
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Showing only music on this iPhone"), &stru_13E1990, 0));

  return v3;
}

@end
