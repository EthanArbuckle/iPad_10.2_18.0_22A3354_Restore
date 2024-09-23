@implementation WebNodeHighlighter

- (WebNodeHighlighter)initWithInspectedWebView:(id)a3
{
  WebNodeHighlighter *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WebNodeHighlighter;
  result = -[WebNodeHighlighter init](&v5, sel_init);
  if (result)
    result->_inspectedWebView = (WebView *)a3;
  return result;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)WebNodeHighlighter;
  -[WebNodeHighlighter dealloc](&v2, sel_dealloc);
}

- (void)highlight
{
  WebView *inspectedWebView;
  WebNodeHighlight *currentHighlight;
  WebNodeHighlight *v5;
  WebNodeHighlight *v6;
  uint64_t v7;
  uint64_t v8;

  inspectedWebView = self->_inspectedWebView;
  if (-[WebView window](inspectedWebView, "window"))
  {
    currentHighlight = self->_currentHighlight;
    if (currentHighlight)
    {
      -[WebNodeHighlight setNeedsDisplay](currentHighlight, "setNeedsDisplay");
    }
    else
    {
      v5 = [WebNodeHighlight alloc];
      -[WebView page](self->_inspectedWebView, "page");
      v8 = *(_QWORD *)(v7 + 80);
      v6 = -[WebNodeHighlight initWithTargetView:inspectorController:](v5, "initWithTargetView:inspectorController:", inspectedWebView, &v8);
      self->_currentHighlight = v6;
      -[WebNodeHighlight setDelegate:](v6, "setDelegate:", self);
      -[WebNodeHighlight attach](self->_currentHighlight, "attach");
    }
  }
}

- (void)hideHighlight
{
  -[WebNodeHighlight detach](self->_currentHighlight, "detach");
  -[WebNodeHighlight setDelegate:](self->_currentHighlight, "setDelegate:", 0);

  self->_currentHighlight = 0;
}

- (void)didAttachWebNodeHighlight:(id)a3
{
  -[WebView setCurrentNodeHighlight:](self->_inspectedWebView, "setCurrentNodeHighlight:", a3);
}

- (void)willDetachWebNodeHighlight:(id)a3
{
  -[WebView setCurrentNodeHighlight:](self->_inspectedWebView, "setCurrentNodeHighlight:", 0);
}

@end
