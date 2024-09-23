@implementation WebFrame(BrowserAdditions)

- (BOOL)isMainFrame
{
  void *v2;
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a1, "webView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mainFrame");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 == a1;

  return v4;
}

@end
