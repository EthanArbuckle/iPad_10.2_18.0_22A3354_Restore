@implementation NSHTMLWebDelegate

- (NSHTMLWebDelegate)init
{
  NSHTMLWebDelegate *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NSHTMLWebDelegate;
  result = -[NSHTMLWebDelegate init](&v3, sel_init);
  *(_WORD *)&result->_loadDidFinish = 0;
  return result;
}

- (NSHTMLWebDelegate)initWithBaseURL:(id)a3
{
  NSHTMLWebDelegate *v4;

  v4 = -[NSHTMLWebDelegate init](self, "init");
  v4->_baseURL = (NSURL *)a3;
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NSHTMLWebDelegate;
  -[NSHTMLWebDelegate dealloc](&v3, sel_dealloc);
}

- (BOOL)loadDidFinish
{
  return self->_loadDidFinish;
}

- (BOOL)loadDidSucceed
{
  return self->_loadDidSucceed;
}

- (void)webView:(id)a3 didFailProvisionalLoadWithError:(id)a4 forFrame:(id)a5
{
  __CFRunLoop *Current;

  if ((id)objc_msgSend(a3, "mainFrame") == a5)
    self->_loadDidFinish = 1;
  Current = CFRunLoopGetCurrent();
  CFRunLoopStop(Current);
}

- (void)webView:(id)a3 didFinishLoadForFrame:(id)a4
{
  __CFRunLoop *Current;

  if ((id)objc_msgSend(a3, "mainFrame") == a4)
    *(_WORD *)&self->_loadDidFinish = 257;
  Current = CFRunLoopGetCurrent();
  CFRunLoopStop(Current);
}

- (void)webView:(id)a3 didFailLoadWithError:(id)a4 forFrame:(id)a5
{
  __CFRunLoop *Current;

  if ((id)objc_msgSend(a3, "mainFrame") == a5)
    self->_loadDidFinish = 1;
  Current = CFRunLoopGetCurrent();
  CFRunLoopStop(Current);
}

- (id)webView:(id)a3 identifierForInitialRequest:(id)a4 fromDataSource:(id)a5
{
  return a4;
}

- (id)webView:(id)a3 resource:(id)a4 willSendRequest:(id)a5 redirectResponse:(id)a6 fromDataSource:(id)a7
{
  return a5;
}

- (void)webView:(id)a3 resource:(id)a4 didReceiveAuthenticationChallenge:(id)a5 fromDataSource:(id)a6
{
  objc_msgSend((id)objc_msgSend(a5, "sender", a3, a4), "continueWithoutCredentialForAuthenticationChallenge:", a5);
}

- (void)decidePolicyForRequest:(id)a3 decisionListener:(id)a4
{
  NSURL *v6;
  NSString *v7;
  NSString *v8;
  BOOL v9;

  v6 = (NSURL *)objc_msgSend(a3, "URL");
  v7 = -[NSURL scheme](v6, "scheme");
  if (v6
    && ((v8 = v7, v6 != self->_baseURL) ? (v9 = v7 == 0) : (v9 = 1),
        !v9
     && (-[NSString isEqualToString:](v7, "isEqualToString:", CFSTR("mailto"))
      || -[NSString isEqualToString:](v8, "isEqualToString:", CFSTR("rdar"))
      || -[NSString isEqualToString:](v8, "isEqualToString:", CFSTR("radar")))
     && (-[NSURL isEqual:](v6, "isEqual:", self->_baseURL) & 1) == 0
     && !-[NSURL isEqual:](-[NSURL absoluteURL](v6, "absoluteURL"), "isEqual:", -[NSURL absoluteURL](self->_baseURL, "absoluteURL"))))
  {
    objc_msgSend(a4, "ignore");
  }
  else
  {
    objc_msgSend(a4, "use");
  }
}

- (void)webView:(id)a3 decidePolicyForNewWindowAction:(id)a4 request:(id)a5 newFrameName:(id)a6 decisionListener:(id)a7
{
  -[NSHTMLWebDelegate decidePolicyForRequest:decisionListener:](self, "decidePolicyForRequest:decisionListener:", a5, a7);
}

- (void)webView:(id)a3 decidePolicyForNavigationAction:(id)a4 request:(id)a5 frame:(id)a6 decisionListener:(id)a7
{
  void *v10;

  if (!objc_msgSend(a6, "frameElement", a3, a4))
    goto LABEL_8;
  if (webView_decidePolicyForNavigationAction_request_frame_decisionListener__onceToken != -1)
    dispatch_once(&webView_decidePolicyForNavigationAction_request_frame_decisionListener__onceToken, &__block_literal_global_29_0);
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (v10 = (void *)objc_msgSend(a5, "URL")) != 0
    && objc_msgSend(v10, "isFileURL"))
  {
    objc_msgSend(a7, "ignore");
  }
  else
  {
LABEL_8:
    -[NSHTMLWebDelegate decidePolicyForRequest:decisionListener:](self, "decidePolicyForRequest:decisionListener:", a5, a7);
  }
}

Class __92__NSHTMLWebDelegate_webView_decidePolicyForNavigationAction_request_frame_decisionListener___block_invoke()
{
  Class result;

  result = NSClassFromString((NSString *)CFSTR("DOMHTMLIFrameElement"));
  webView_decidePolicyForNavigationAction_request_frame_decisionListener__iframeElementClass = (uint64_t)result;
  return result;
}

- (void)webView:(id)a3 decidePolicyForMIMEType:(id)a4 request:(id)a5 frame:(id)a6 decisionListener:(id)a7
{
  -[NSHTMLWebDelegate decidePolicyForRequest:decisionListener:](self, "decidePolicyForRequest:decisionListener:", a5, a7);
}

@end
