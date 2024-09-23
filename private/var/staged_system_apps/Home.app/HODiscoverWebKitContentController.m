@implementation HODiscoverWebKitContentController

- (HODiscoverWebKitContentController)initWithDelegate:(id)a3
{
  id v4;
  HODiscoverWebKitContentController *v5;
  HODiscoverWebKitContentController *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HODiscoverWebKitContentController;
  v5 = -[HODiscoverWebKitContentController init](&v8, "init");
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_delegate, v4);

  return v6;
}

- (void)userContentController:(id)a3 didReceiveScriptMessage:(id)a4
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  __CFString *v12;
  __CFString *v13;
  __CFString *v14;
  unsigned int v15;
  uint64_t v16;
  __CFString *v17;
  __CFString *v18;
  __CFString *v19;
  unsigned int v20;
  id v21;

  v21 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "name"));
  v6 = objc_opt_class(NSArray);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "body"));
  if ((objc_opt_isKindOfClass(v7, v6) & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "description"));
  NSLog(CFSTR("%@"), v10);

  v11 = objc_opt_class(NSString);
  v12 = off_1000D03D8;
  if ((objc_opt_isKindOfClass(v12, v11) & 1) != 0)
    v13 = v12;
  else
    v13 = 0;
  v14 = v13;

  v15 = objc_msgSend(v5, "isEqualToString:", v14);
  if (v15)
  {
    -[HODiscoverWebKitContentController openLink:](self, "openLink:", v21);
  }
  else
  {
    v16 = objc_opt_class(NSString);
    v17 = off_1000D03E0;
    if ((objc_opt_isKindOfClass(v17, v16) & 1) != 0)
      v18 = v17;
    else
      v18 = 0;
    v19 = v18;

    v20 = objc_msgSend(v5, "isEqualToString:", v19);
    if (v20)
      -[HODiscoverWebKitContentController contentViewed:](self, "contentViewed:", v21);
  }

}

- (void)contentViewed:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "body"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("id")));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("locale")));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v3, HFAnalyticsDiscoverTabContentViewedIDKey);
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, HFAnalyticsDiscoverTabContentViewedLocaleKey);
  +[HFAnalytics sendEvent:withData:](HFAnalytics, "sendEvent:withData:", 11, v5);

}

- (void)openLink:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v17 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "body"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("transition")));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("url")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v5));
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("push")))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverWebKitContentController delegate](self, "delegate"));

    if (v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverWebKitContentController delegate](self, "delegate"));
      objc_msgSend(v8, "pushNewDiscoverWebViewControllerWithURLString:", v5);

    }
    goto LABEL_12;
  }
  if (!objc_msgSend(v4, "isEqualToString:", CFSTR("modal")))
  {
    if (objc_msgSend(v4, "isEqualToString:", CFSTR("external")))
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverWebKitContentController delegate](self, "delegate"));

      if (v14)
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverWebKitContentController delegate](self, "delegate"));
        objc_msgSend(v15, "exitToAppleStoreAppOrSafariWithURL:", v6);

        v13 = v4;
        goto LABEL_13;
      }
    }
    goto LABEL_12;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverWebKitContentController delegate](self, "delegate"));

  if (!v9)
  {
LABEL_12:
    v13 = 0;
    goto LABEL_13;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverWebKitContentController delegate](self, "delegate"));
  objc_msgSend(v10, "presentModalDiscoverWebViewControllerWithURLString:", v5);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverWebKitContentController parseURLForThemeType:](self, "parseURLForThemeType:", v5));
  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v11, HFAnalyticsDiscoverThemeTapKey);
    +[HFAnalytics sendEvent:withData:](HFAnalytics, "sendEvent:withData:", 9, v12);

  }
  v13 = v4;

LABEL_13:
  if (v4)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v4, HFAnalyticsLearnTabInteractionLinkTypeKey);
    +[HFAnalytics sendEvent:withData:](HFAnalytics, "sendEvent:withData:", 8, v16);

  }
}

- (id)parseURLForThemeType:(id)a3
{
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  unsigned int v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  id v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  void *v23;

  v3 = a3;
  v4 = objc_msgSend(v3, "length");
  v19 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSRegularExpression regularExpressionWithPattern:options:error:](NSRegularExpression, "regularExpressionWithPattern:options:error:", CFSTR("(?<=theme=)([a-zA-Z]|_)+"), 0, &v19));
  v6 = v19;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "firstMatchInString:options:range:", v3, 0, 0, v4));
  if (v7)
  {
    v8 = objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", &off_1000BF260));
    v9 = objc_msgSend(v7, "range");
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "substringWithRange:", v9, v10));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "lowercaseString"));
    v13 = -[NSObject containsObject:](v8, "containsObject:", v12);

    if (v13)
    {
      v14 = v11;
    }
    else
    {
      v16 = HFLogForCategory(6);
      v17 = objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v21 = "-[HODiscoverWebKitContentController parseURLForThemeType:]";
        v22 = 2112;
        v23 = v11;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "(%s) resultString:%@ not contained in approved theme types for analytics gathering", buf, 0x16u);
      }

      v14 = 0;
    }

  }
  else
  {
    v15 = HFLogForCategory(6);
    v8 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_100077B5C((uint64_t)v6, v8);
    v14 = 0;
  }

  return v14;
}

- (HODiscoverWebKitContentControllerDelegate)delegate
{
  return (HODiscoverWebKitContentControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
