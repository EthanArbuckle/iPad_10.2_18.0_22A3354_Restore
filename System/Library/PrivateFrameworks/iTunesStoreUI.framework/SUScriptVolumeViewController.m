@implementation SUScriptVolumeViewController

- (id)newNativeViewController
{
  void *v3;

  v3 = (void *)objc_msgSend(-[SUScriptObject viewControllerFactory](self, "viewControllerFactory"), "newVolumeViewController");
  objc_msgSend(v3, "setClientInterface:", -[SUScriptObject clientInterface](self, "clientInterface"));
  return v3;
}

@end
