@implementation WebNodeHighlight

- (WebNodeHighlight)initWithTargetView:(id)a3 inspectorController:(NakedPtr<WebCore::InspectorController>)a4
{
  WebNodeHighlight *v6;
  WebHighlightLayer *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)WebNodeHighlight;
  v6 = -[WebNodeHighlight init](&v9, sel_init);
  if (v6)
  {
    v6->_targetView = (WAKView *)a3;
    v6->_inspectorController.m_ptr = *(InspectorController **)a4.m_ptr;
    v6->_highlightView = -[WebNodeHighlightView initWithWebNodeHighlight:]([WebNodeHighlightView alloc], "initWithWebNodeHighlight:", v6);
    v7 = -[WebHighlightLayer initWithHighlightView:webView:]([WebHighlightLayer alloc], "initWithHighlightView:webView:", v6->_highlightView, a3);
    v6->_highlightLayer = v7;
    objc_msgSend((id)-[WAKView window](v6->_targetView, "window"), "screenScale");
    -[WebHighlightLayer setContentsScale:](v7, "setContentsScale:");
    -[WebHighlightLayer setCanDrawConcurrently:](v6->_highlightLayer, "setCanDrawConcurrently:", 0);
  }
  return v6;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)WebNodeHighlight;
  -[WebNodeHighlight dealloc](&v2, sel_dealloc);
}

- (void)attach
{
  objc_msgSend((id)objc_msgSend((id)-[WAKView window](self->_targetView, "window"), "hostLayer"), "addSublayer:", self->_highlightLayer);
  -[WebNodeHighlight setNeedsDisplay](self, "setNeedsDisplay");
  if (self->_delegate)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(self->_delegate, "didAttachWebNodeHighlight:", self);
  }
}

- (id)delegate
{
  return self->_delegate;
}

- (void)detach
{
  if (self->_highlightLayer)
  {
    if (self->_delegate)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(self->_delegate, "willDetachWebNodeHighlight:", self);
    }
    -[WebHighlightLayer removeFromSuperlayer](self->_highlightLayer, "removeFromSuperlayer");

    self->_highlightLayer = 0;
    self->_targetView = 0;
    -[WebNodeHighlightView detachFromWebNodeHighlight](self->_highlightView, "detachFromWebNodeHighlight");

    self->_highlightView = 0;
  }
}

- (id)highlightView
{
  return self->_highlightView;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = a3;
}

- (void)setNeedsDisplay
{
  -[WebHighlightLayer setNeedsLayout](self->_highlightLayer, "setNeedsLayout");
  -[WebHighlightLayer setNeedsDisplay](self->_highlightLayer, "setNeedsDisplay");
  -[WebHighlightLayer displayIfNeeded](self->_highlightLayer, "displayIfNeeded");
}

- (id)targetView
{
  return self->_targetView;
}

- (NakedPtr<WebCore::InspectorController>)inspectorController
{
  InspectorController **v2;

  *v2 = self->_inspectorController.m_ptr;
  return (NakedPtr<WebCore::InspectorController>)self;
}

- (id).cxx_construct
{
  *((_QWORD *)self + 4) = 0;
  return self;
}

@end
