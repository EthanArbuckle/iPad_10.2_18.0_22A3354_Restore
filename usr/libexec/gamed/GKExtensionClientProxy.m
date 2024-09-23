@implementation GKExtensionClientProxy

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[GKUIServiceClientProxy hostClient](self, "hostClient"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[GKClientProxy bundleIdentifier](self, "bundleIdentifier"));
  objc_msgSend(v3, "setExtensionProxy:forBundleID:", 0, v4);

  v5.receiver = self;
  v5.super_class = (Class)GKExtensionClientProxy;
  -[GKUIServiceClientProxy dealloc](&v5, "dealloc");
}

- (BOOL)isExtension
{
  return 1;
}

- (BOOL)isUIService
{
  return 0;
}

- (void)setExtensionProxy:(id)a3 forBundleID:(id)a4
{
  void *v4;
  void *v5;
  id v6;
  id v7;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Invalid attempt to set extension proxy(%@) on extension(%@)"), a4, a3, self));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKExtensionClientProxy.m"));
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "lastPathComponent")));
  v7 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (NO)\n[%s (%s:%d)]"), v4, "-[GKExtensionClientProxy setExtensionProxy:forBundleID:]", objc_msgSend(v6, "UTF8String"), 30));

  +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v7);
}

- (void)handleNewHostClient:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[GKClientProxy bundleIdentifier](self, "bundleIdentifier"));
  objc_msgSend(v4, "setExtensionProxy:forBundleID:", self, v5);

}

@end
