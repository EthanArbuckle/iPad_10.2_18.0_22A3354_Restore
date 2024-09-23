@implementation TPSDaemonCLIHandler

+ (BOOL)run
{
  void *v2;
  void *v3;
  id v4;
  BOOL v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "stringForKey:", CFSTR("listKVS")));
  v4 = objc_msgSend(v3, "length");
  v5 = v4 != 0;
  if (v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[TPSCloudController sharedInstance](TPSCloudController, "sharedInstance"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "_listDisplayContentIDs"));
    NSLog(CFSTR("%@"), v7);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "stringForKey:", CFSTR("clearKVS")));

  if (objc_msgSend(v8, "length"))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[TPSCloudController sharedInstance](TPSCloudController, "sharedInstance"));
    objc_msgSend(v9, "_clearDisplayedContentIDs");

    v5 = 1;
  }

  return v5;
}

@end
