@implementation THWWebBridgeController

- (THWWebBridgeController)initWithView:(id)a3
{
  THWWebBridgeController *v4;
  THWWebBridgeController *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)THWWebBridgeController;
  v4 = -[THWWebBridgeController init](&v7, "init");
  v5 = v4;
  if (v4)
  {
    -[THWWebBridgeController setWebView:](v4, "setWebView:", a3);
    -[THWWebBridgeController setInjectedWidgetObject:](v5, "setInjectedWidgetObject:", 0);
  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  -[THWWebBridgeController setWebView:](self, "setWebView:", 0);
  v3.receiver = self;
  v3.super_class = (Class)THWWebBridgeController;
  -[THWWebBridgeController dealloc](&v3, "dealloc");
}

- (BOOL)handleURL:(id)a3
{
  id v5;
  void *v6;
  id v7;
  unsigned int v8;

  if (objc_msgSend(objc_msgSend(a3, "scheme"), "isEqualToString:", CFSTR("apb")))
  {
    v5 = objc_msgSend(a3, "relativePath");
    if (v5)
    {
      v6 = v5;
      if (objc_msgSend(v5, "length"))
      {
        if (objc_msgSend(a3, "query"))
        {
          v7 = objc_msgSend(v6, "substringFromIndex:", 1);
          if (objc_msgSend(v7, "isEqualToString:", CFSTR("js")))
          {
            -[THWWebBridgeController callBrowserWithURLEncoding:](self, "callBrowserWithURLEncoding:", a3);
          }
          else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("getpref")) & 1) == 0
                 && (objc_msgSend(v7, "isEqualToString:", CFSTR("setpref")) & 1) == 0
                 && objc_msgSend(v7, "isEqualToString:", CFSTR("do")))
          {
            -[THWWebBridgeController pServeWidgetControllerRequest:](self, "pServeWidgetControllerRequest:", a3);
          }
        }
      }
    }
    LOBYTE(v8) = 1;
  }
  else
  {
    v8 = objc_msgSend(objc_msgSend(a3, "scheme"), "isEqualToString:", CFSTR("ibooks"));
    if (v8)
    {
      if ((objc_opt_respondsToSelector(-[THWPlatformWebViewProtocol webViewDelegate](-[THWWebBridgeController webView](self, "webView"), "webViewDelegate"), "webView:handleURL:") & 1) != 0)LOBYTE(v8) = objc_msgSend(-[THWPlatformWebViewProtocol webViewDelegate](-[THWWebBridgeController webView](self, "webView"), "webViewDelegate"), "webView:handleURL:", -[THWWebBridgeController webView](self, "webView"), a3);
      else
        LOBYTE(v8) = 0;
    }
  }
  return v8;
}

+ (id)parseQuery:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  NSNull *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v4 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", 3);
  v5 = objc_msgSend(a3, "componentsSeparatedByString:", CFSTR("&"));
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v9), "componentsSeparatedByString:", CFSTR("="));
        v11 = objc_msgSend(objc_msgSend(v10, "objectAtIndex:", 0), "stringByRemovingPercentEncoding");
        if ((unint64_t)objc_msgSend(v10, "count") < 2)
          v12 = +[NSNull null](NSNull, "null");
        else
          v12 = (NSNull *)objc_msgSend(objc_msgSend(v10, "objectAtIndex:", 1), "stringByRemovingPercentEncoding");
        objc_msgSend(v4, "setObject:forKey:", v12, v11);
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }
  return v4;
}

- (void)callBrowserWithURLEncoding:(id)a3
{
  id v5;
  uint64_t v6;
  id v7;
  id v8;
  id v9;
  NSNull *v10;

  v5 = objc_msgSend(a3, "query");
  if (v5)
  {
    v7 = objc_msgSend((id)objc_opt_class(self, v6), "parseQuery:", v5);
    if (objc_msgSend(objc_msgSend(a3, "scheme"), "isEqualToString:", CFSTR("apb")))
    {
      v8 = objc_msgSend(v7, "objectForKey:", CFSTR("o"));
      v9 = objc_msgSend(v7, "objectForKey:", CFSTR("m"));
      v10 = (NSNull *)objc_msgSend(v7, "objectForKey:", CFSTR("p"));
      if (v10 == +[NSNull null](NSNull, "null"))
        -[THWWebBridgeController callBrowserObject:methodName:parameterString:addQuoting:](self, "callBrowserObject:methodName:parameterString:addQuoting:", v8, v9, 0, 0);
      else
        -[THWWebBridgeController callBrowserObject:methodName:parameterString:addQuoting:](self, "callBrowserObject:methodName:parameterString:addQuoting:", v8, v9, v10, 0);
    }
  }
}

- (id)callBrowserObject:(id)a3 methodName:(id)a4 parameterString:(id)a5 addQuoting:(BOOL)a6
{
  __CFString *v9;

  if (!a3 || !a4)
    return 0;
  if (a5)
    v9 = (__CFString *)a5;
  else
    v9 = &stru_43D7D8;
  if (a6)
  {
    if (-[__CFString length](v9, "length"))
      v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("\"%@\"), v9);
  }
  return -[THWPlatformWebViewProtocol stringByEvaluatingJavaScriptFromString:](-[THWWebBridgeController webView](self, "webView"), "stringByEvaluatingJavaScriptFromString:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.%@(%@);"), a3, a4, v9));
}

- (id)callBrowserObject:(id)a3 methodName:(id)a4 parameters:(id)a5 addQuoting:(BOOL)a6
{
  id v9;

  v9 = objc_msgSend((id)objc_opt_class(self, a2), "pParameterStringFromParameterArray:addQuoting:", a5, a6);
  return -[THWWebBridgeController callBrowserObject:methodName:parameterString:addQuoting:](self, "callBrowserObject:methodName:parameterString:addQuoting:", a3, a4, v9, 0);
}

- (id)stringByEvaluatingJavaScriptFromFile:(id)a3
{
  uint64_t v4;

  v4 = 0;
  return -[THWPlatformWebViewProtocol stringByEvaluatingJavaScriptFromString:](-[THWWebBridgeController webView](self, "webView"), "stringByEvaluatingJavaScriptFromString:", +[NSString stringWithContentsOfFile:usedEncoding:error:](NSString, "stringWithContentsOfFile:usedEncoding:error:", a3, &v4, 0));
}

- (BOOL)p_injectFileContents:(id)a3
{
  return objc_msgSend(-[THWWebBridgeController stringByEvaluatingJavaScriptFromFile:](self, "stringByEvaluatingJavaScriptFromFile:", a3), "isEqualToString:", CFSTR("0")) ^ 1;
}

- (void)ensureWidgetObjectInjected
{
  if (!-[THWWebBridgeController injectedWidgetObject](self, "injectedWidgetObject"))
  {
    if (-[THWWebBridgeController p_injectFileContents:](self, "p_injectFileContents:", objc_msgSend((id)THBundle(), "pathForResource:ofType:", CFSTR("AppleWidgetController"), CFSTR("js"))))
    {
      -[THWWebBridgeController setInjectedWidgetObject:](self, "setInjectedWidgetObject:", 1);
    }
  }
}

- (void)tellBrowserWillEnterWidgetMode:(int)a3
{
  uint64_t v3;

  v3 = *(_QWORD *)&a3;
  -[THWWebBridgeController ensureWidgetObjectInjected](self, "ensureWidgetObjectInjected");
  -[THWWebBridgeController callBrowserObject:methodName:parameterString:addQuoting:](self, "callBrowserObject:methodName:parameterString:addQuoting:", CFSTR("widget"), CFSTR("willEnterWidgetMode"), +[THWConstants modeStringForMode:](THWConstants, "modeStringForMode:", v3), 1);
}

- (void)tellBrowserDidEnterWidgetMode:(int)a3
{
  uint64_t v3;

  v3 = *(_QWORD *)&a3;
  -[THWWebBridgeController ensureWidgetObjectInjected](self, "ensureWidgetObjectInjected");
  -[THWWebBridgeController callBrowserObject:methodName:parameterString:addQuoting:](self, "callBrowserObject:methodName:parameterString:addQuoting:", CFSTR("widget"), CFSTR("didEnterWidgetMode"), +[THWConstants modeStringForMode:](THWConstants, "modeStringForMode:", v3), 1);
}

- (void)tellBrowserToPauseAudioVisual
{
  -[THWWebBridgeController ensureWidgetObjectInjected](self, "ensureWidgetObjectInjected");
  -[THWWebBridgeController callBrowserObject:methodName:parameterString:addQuoting:](self, "callBrowserObject:methodName:parameterString:addQuoting:", CFSTR("widget"), CFSTR("pauseAudioVisual"), 0, 1);
}

+ (id)pParameterStringFromParameterArray:(id)a3 addQuoting:(BOOL)a4
{
  _BOOL4 v4;
  id result;
  const __CFString *v7;

  if (!a3)
    return 0;
  v4 = a4;
  result = objc_msgSend(a3, "count");
  if (result)
  {
    if (v4)
      v7 = CFSTR("\",\");
    else
      v7 = CFSTR(",");
    result = objc_msgSend(a3, "componentsJoinedByString:", v7);
    if (v4)
      return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("\"%@\"), result);
  }
  return result;
}

- (void)pServeWidgetControllerRequest:(id)a3
{
  id v5;
  uint64_t v6;
  id v7;
  id v8;
  void *v9;

  v5 = objc_msgSend(a3, "query");
  if (!v5)
    return;
  v7 = objc_msgSend((id)objc_opt_class(self, v6), "parseQuery:", v5);
  if (!objc_msgSend(objc_msgSend(a3, "scheme"), "isEqualToString:", CFSTR("apb")))
    return;
  v8 = objc_msgSend(v7, "objectForKey:", CFSTR("c"));
  if (!v8)
    goto LABEL_22;
  v9 = v8;
  if (!objc_msgSend(v8, "length") || !-[THWWebBridgeController javascriptHandler](self, "javascriptHandler"))
    goto LABEL_22;
  if (objc_msgSend(v9, "isEqualToString:", kTHApplePubBridgeWidgetControllerCommandValueLoadedKey))
  {
    if ((objc_opt_respondsToSelector(-[THWWebBridgeController javascriptHandler](self, "javascriptHandler"), "contentDidLoad") & 1) != 0)-[THWWebJSControllerDelegate contentDidLoad](-[THWWebBridgeController javascriptHandler](self, "javascriptHandler"), "contentDidLoad");
    return;
  }
  if (objc_msgSend(v9, "isEqualToString:", kTHApplePubBridgeWidgetControllerCommandValueReadyKey))
  {
    if ((objc_opt_respondsToSelector(-[THWWebBridgeController javascriptHandler](self, "javascriptHandler"), "contentIsReady") & 1) != 0)-[THWWebJSControllerDelegate contentIsReady](-[THWWebBridgeController javascriptHandler](self, "javascriptHandler"), "contentIsReady");
    return;
  }
  if (objc_msgSend(v9, "isEqualToString:", kTHApplePubBridgeWidgetControllerCommandValueExitedKey))
  {
    if ((objc_opt_respondsToSelector(-[THWWebBridgeController javascriptHandler](self, "javascriptHandler"), "contentDidExit") & 1) != 0)-[THWWebJSControllerDelegate contentDidExit](-[THWWebBridgeController javascriptHandler](self, "javascriptHandler"), "contentDidExit");
    return;
  }
  if (objc_msgSend(v9, "isEqualToString:", kTHApplePubBridgeWidgetControllerCommandValuePropertyChangedKey))
  {
    objc_msgSend(v7, "objectForKey:", kTHApplePubBridgeWidgetControllerCommandArg1Key);
    objc_msgSend(v7, "objectForKey:", kTHApplePubBridgeWidgetControllerCommandArg2Key);
    if ((objc_opt_respondsToSelector(-[THWWebBridgeController javascriptHandler](self, "javascriptHandler"), "contentProperty:didChangeTo:") & 1) != 0)-[THWWebJSControllerDelegate contentProperty:didChangeTo:](-[THWWebBridgeController javascriptHandler](self, "javascriptHandler"), "contentProperty:didChangeTo:");
  }
  else
  {
LABEL_22:
    if (-[THWWebBridgeController optionalDispatcher](self, "optionalDispatcher"))
      -[TSWNativeCommandDispatcher shouldDispatchRequestToNativeCode:](-[THWWebBridgeController optionalDispatcher](self, "optionalDispatcher"), "shouldDispatchRequestToNativeCode:");
  }
}

- (THWPlatformWebViewProtocol)webView
{
  return self->mWebView;
}

- (void)setWebView:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

- (THWWebJSControllerDelegate)javascriptHandler
{
  return self->mJavascriptHandler;
}

- (void)setJavascriptHandler:(id)a3
{
  self->mJavascriptHandler = (THWWebJSControllerDelegate *)a3;
}

- (TSWNativeCommandDispatcher)optionalDispatcher
{
  return self->mOptionalDispatcher;
}

- (void)setOptionalDispatcher:(id)a3
{
  self->mOptionalDispatcher = (TSWNativeCommandDispatcher *)a3;
}

- (BOOL)injectedWidgetObject
{
  return self->mInjectedWidgetObject;
}

- (void)setInjectedWidgetObject:(BOOL)a3
{
  self->mInjectedWidgetObject = a3;
}

@end
