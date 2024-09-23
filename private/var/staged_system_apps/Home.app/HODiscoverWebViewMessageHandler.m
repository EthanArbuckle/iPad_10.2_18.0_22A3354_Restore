@implementation HODiscoverWebViewMessageHandler

- (void)userContentController:(id)a3 didReceiveScriptMessage:(id)a4
{
  void *v4;
  unsigned int v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;

  v11 = a4;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "name"));
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("preload"));

  if (v5)
  {
    v6 = objc_opt_class(NSArray);
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "body"));
    if ((objc_opt_isKindOfClass(v7, v6) & 1) != 0)
      v8 = v7;
    else
      v8 = 0;
    v9 = v8;

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[HODiscoverWebViewManager sharedInstance](HODiscoverWebViewManager, "sharedInstance"));
    objc_msgSend(v10, "preload:", v9);

  }
}

@end
