@implementation WebHighlightLayer

- (WebHighlightLayer)initWithHighlightView:(id)a3 webView:(id)a4
{
  WebHighlightLayer *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WebHighlightLayer;
  result = -[WebHighlightLayer init](&v7, sel_init);
  if (result)
  {
    result->_view = (WebNodeHighlightView *)a3;
    result->_webView = (WebView *)a4;
  }
  return result;
}

- (void)layoutSublayers
{
  float v3;
  CATransform3D v4;

  objc_msgSend(-[WebFrame documentView](-[WebView mainFrame](self->_webView, "mainFrame"), "documentView"), "scale");
  CATransform3DMakeScale(&v4, v3, v3, 1.0);
  -[WebHighlightLayer setTransform:](self, "setTransform:", &v4);
  -[WebNodeHighlightView layoutSublayers:](self->_view, "layoutSublayers:", self);
}

- (id)actionForKey:(id)a3
{
  return 0;
}

@end
