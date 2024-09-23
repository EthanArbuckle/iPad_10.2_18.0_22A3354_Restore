@implementation HODiscoverWebViewCacheValue

+ (id)valueWithWebView:(id)a3
{
  id v3;
  HODiscoverWebViewCacheValue *v4;

  v3 = a3;
  v4 = objc_alloc_init(HODiscoverWebViewCacheValue);
  -[HODiscoverWebViewCacheValue setWebView:](v4, "setWebView:", v3);

  -[HODiscoverWebViewCacheValue setNavigationState:](v4, "setNavigationState:", 0);
  return v4;
}

- (WKWebView)webView
{
  return self->_webView;
}

- (void)setWebView:(id)a3
{
  objc_storeStrong((id *)&self->_webView, a3);
}

- (unint64_t)navigationState
{
  return self->_navigationState;
}

- (void)setNavigationState:(unint64_t)a3
{
  self->_navigationState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_webView, 0);
}

@end
