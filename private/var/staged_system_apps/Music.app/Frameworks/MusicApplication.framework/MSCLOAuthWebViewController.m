@implementation MSCLOAuthWebViewController

- (MSCLOAuthWebViewController)initWithAuthURL:(id)a3 redirectURL:(id)a4
{
  id v6;
  id v7;
  MSCLOAuthWebViewController *v8;
  NSURL *v9;
  NSURL *authURL;
  NSURL *v11;
  NSURL *redirectURL;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)MSCLOAuthWebViewController;
  v8 = -[MSCLOAuthWebViewController init](&v14, "init");
  if (v8)
  {
    v9 = (NSURL *)objc_msgSend(v6, "copy");
    authURL = v8->_authURL;
    v8->_authURL = v9;

    v11 = (NSURL *)objc_msgSend(v7, "copy");
    redirectURL = v8->_redirectURL;
    v8->_redirectURL = v11;

  }
  return v8;
}

- (void)cancelAuthentication
{
  id v3;

  -[WKWebView stopLoading](self->_webView, "stopLoading");
  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("MSCLOAuthErrorDomain"), 1, 0));
  -[MSCLOAuthWebViewController _endAuthenticationWithError:](self, "_endAuthenticationWithError:", v3);

}

- (void)startAuthentication
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  id v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  if (!self->_authenticating)
  {
    -[MSCLOAuthWebViewController loadViewIfNeeded](self, "loadViewIfNeeded");
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSHTTPCookieStorage sharedHTTPCookieStorage](NSHTTPCookieStorage, "sharedHTTPCookieStorage"));
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "cookiesForURL:", self->_authURL, 0));
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v12;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(_QWORD *)v12 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(v3, "deleteCookie:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i));
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v6);
    }

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLRequest requestWithURL:cachePolicy:timeoutInterval:](NSURLRequest, "requestWithURL:cachePolicy:timeoutInterval:", self->_authURL, 1, 30.0));
    v10 = -[WKWebView loadRequest:](self->_webView, "loadRequest:", v9);
    -[MSCLOAuthWebViewController setAuthenticating:](self, "setAuthenticating:", 1);

  }
}

- (void)viewDidLayoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)MSCLOAuthWebViewController;
  -[MSCLOAuthWebViewController viewDidLayoutSubviews](&v13, "viewDidLayoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSCLOAuthWebViewController view](self, "view"));
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[WKWebView setFrame:](self->_webView, "setFrame:", v5, v7, v9, v11);
  -[UIActivityIndicatorView setFrame:](self->_activityIndicator, "setFrame:", v5, v7, v9, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MSCLOAuthWebViewController view](self, "view"));
  objc_msgSend(v12, "bringSubviewToFront:", self->_activityIndicator);

}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  WKWebView *v7;
  void *v8;
  UIActivityIndicatorView *v9;
  void *v10;
  WKWebView *webView;
  WKWebView *v12;
  UIActivityIndicatorView *activityIndicator;
  UIActivityIndicatorView *v14;
  void *v15;
  id v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)MSCLOAuthWebViewController;
  -[MSCLOAuthWebViewController viewDidLoad](&v17, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSCLOAuthWebViewController view](self, "view"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
  objc_msgSend(v3, "setBackgroundColor:", v4);

  v5 = objc_alloc((Class)WKWebView);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSCLOAuthWebViewController view](self, "view"));
  objc_msgSend(v6, "bounds");
  v7 = (WKWebView *)objc_msgSend(v5, "initWithFrame:");

  -[WKWebView setNavigationDelegate:](v7, "setNavigationDelegate:", self);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MSCLOAuthWebViewController view](self, "view"));
  objc_msgSend(v8, "addSubview:", v7);

  v9 = (UIActivityIndicatorView *)objc_msgSend(objc_alloc((Class)UIActivityIndicatorView), "initWithActivityIndicatorStyle:", 100);
  -[UIActivityIndicatorView setHidesWhenStopped:](v9, "setHidesWhenStopped:", 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MSCLOAuthWebViewController view](self, "view"));
  objc_msgSend(v10, "addSubview:", v9);

  webView = self->_webView;
  self->_webView = v7;
  v12 = v7;

  activityIndicator = self->_activityIndicator;
  self->_activityIndicator = v9;
  v14 = v9;

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[MSCLOAuthWebViewController navigationItem](self, "navigationItem"));
  v16 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 1, self, "cancelAuthentication");

  objc_msgSend(v15, "setLeftBarButtonItem:", v16);
}

- (void)webView:(id)a3 didFailNavigation:(id)a4 withError:(id)a5
{
  if (!self->_interceptedRedirectURL)
    -[MSCLOAuthWebViewController _endAuthenticationWithError:](self, "_endAuthenticationWithError:", a5, a4);
}

- (void)webView:(id)a3 didFinishNavigation:(id)a4
{
  -[UIActivityIndicatorView stopAnimating](self->_activityIndicator, "stopAnimating", a3, a4);
}

- (void)webView:(id)a3 didStartProvisionalNavigation:(id)a4
{
  -[UIActivityIndicatorView startAnimating](self->_activityIndicator, "startAnimating", a3, a4);
}

- (void)webView:(id)a3 decidePolicyForNavigationAction:(id)a4 decisionHandler:(id)a5
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSURL *v17;
  NSURL *interceptedRedirectURL;
  uint64_t v19;
  void (**v20)(id, uint64_t);

  v20 = (void (**)(id, uint64_t))a5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "request"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "URL"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "host"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "lowercaseString"));

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "path"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "lowercaseString"));

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL host](self->_redirectURL, "host"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "lowercaseString"));

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL path](self->_redirectURL, "path"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "lowercaseString"));

  if (objc_msgSend(v10, "isEqualToString:", v14)
    && objc_msgSend(v12, "isEqualToString:", v16))
  {
    v17 = (NSURL *)objc_msgSend(v8, "copy");
    interceptedRedirectURL = self->_interceptedRedirectURL;
    self->_interceptedRedirectURL = v17;

    v19 = 0;
  }
  else
  {
    v19 = 1;
  }
  v20[2](v20, v19);
  if (self->_interceptedRedirectURL)
    -[MSCLOAuthWebViewController _endAuthenticationWithError:](self, "_endAuthenticationWithError:", 0);

}

- (void)_endAuthenticationWithError:(id)a3
{
  void (**v4)(_QWORD, _QWORD, _QWORD);
  id v5;
  void *v6;
  id v7;
  id v8;

  v8 = a3;
  -[MSCLOAuthWebViewController setAuthenticating:](self, "setAuthenticating:", 0);
  v4 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[MSCLOAuthWebViewController completionBlock](self, "completionBlock"));
  if (v4)
  {
    v5 = v8;
    v6 = v5;
    if (!v5)
    {
      if (self->_interceptedRedirectURL)
        v6 = 0;
      else
        v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("MSCLOAuthErrorDomain"), 0, 0));
    }
    v7 = -[NSURL copy](self->_interceptedRedirectURL, "copy");
    ((void (**)(_QWORD, id, id))v4)[2](v4, v7, v5);

  }
}

- (NSURL)authURL
{
  return self->_authURL;
}

- (NSURL)redirectURL
{
  return self->_redirectURL;
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (void)setCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (BOOL)isAuthenticating
{
  return self->_authenticating;
}

- (void)setAuthenticating:(BOOL)a3
{
  self->_authenticating = a3;
}

- (WKWebView)webView
{
  return self->_webView;
}

- (void)setWebView:(id)a3
{
  objc_storeStrong((id *)&self->_webView, a3);
}

- (UIActivityIndicatorView)activityIndicator
{
  return self->_activityIndicator;
}

- (void)setActivityIndicator:(id)a3
{
  objc_storeStrong((id *)&self->_activityIndicator, a3);
}

- (NSURL)interceptedRedirectURL
{
  return self->_interceptedRedirectURL;
}

- (void)setInterceptedRedirectURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interceptedRedirectURL, 0);
  objc_storeStrong((id *)&self->_activityIndicator, 0);
  objc_storeStrong((id *)&self->_webView, 0);
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong((id *)&self->_redirectURL, 0);
  objc_storeStrong((id *)&self->_authURL, 0);
}

@end
