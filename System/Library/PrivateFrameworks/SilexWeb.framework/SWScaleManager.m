@implementation SWScaleManager

- (SWScaleManager)initWithWebView:(id)a3 scale:(double)a4
{
  id v7;
  SWScaleManager *v8;
  SWScaleManager *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SWScaleManager;
  v8 = -[SWScaleManager init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_webView, a3);
    -[SWScaleManager setScale:](v9, "setScale:", a4);
  }

  return v9;
}

- (void)setScale:(double)a3
{
  -[WKWebView _setViewScale:](self->_webView, "_setViewScale:", a3);
}

- (double)scale
{
  double result;

  -[WKWebView _viewScale](self->_webView, "_viewScale");
  return result;
}

- (WKWebView)webView
{
  return self->_webView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_webView, 0);
}

@end
