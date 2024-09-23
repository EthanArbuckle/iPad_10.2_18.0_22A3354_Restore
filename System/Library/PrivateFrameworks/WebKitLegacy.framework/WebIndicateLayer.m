@implementation WebIndicateLayer

- (WebIndicateLayer)initWithWebView:(id)a3
{
  WebIndicateLayer *v4;
  WebIndicateLayer *v5;
  CFTypeRef cf;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)WebIndicateLayer;
  v4 = -[WebIndicateLayer init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_webView = (WebView *)a3;
    -[WebIndicateLayer setCanDrawConcurrently:](v4, "setCanDrawConcurrently:", 0);
    objc_msgSend((id)-[WebView window](v5->_webView, "window"), "screenScale");
    -[WebIndicateLayer setContentsScale:](v5, "setContentsScale:");
    WebCore::cachedCGColor();
    -[WebIndicateLayer setBackgroundColor:](v5, "setBackgroundColor:", cf);
    if (cf)
      CFRelease(cf);
  }
  return v5;
}

- (void)layoutSublayers
{
  float v3;
  CATransform3D v4;

  objc_msgSend(-[WebFrame documentView](-[WebView mainFrame](self->_webView, "mainFrame"), "documentView"), "scale");
  CATransform3DMakeScale(&v4, v3, v3, 1.0);
  -[WebIndicateLayer setTransform:](self, "setTransform:", &v4);
  -[WebView frame](self->_webView, "frame");
  -[WebIndicateLayer setFrame:](self, "setFrame:");
}

- (id)actionForKey:(id)a3
{
  return 0;
}

@end
