@implementation UIPDFPageContentLayer

- (UIPDFPageContentLayer)init
{
  UIPDFPageContentLayer *v2;
  CATransform3D v4;
  CATransform3D v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UIPDFPageContentLayer;
  v2 = -[UIPDFPageContentLayer init](&v6, sel_init);
  if (v2)
  {
    CATransform3DMakeScale(&v5, 1.0, -1.0, 1.0);
    v4 = v5;
    -[UIPDFPageContentLayer setTransform:](v2, "setTransform:", &v4);
    -[UIPDFPageContentLayer setOpaque:](v2, "setOpaque:", 1);
    if (MGGetBoolAnswer())
      -[UIPDFPageContentLayer setContentsFormat:](v2, "setContentsFormat:", *MEMORY[0x1E0CD29E8]);
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UIPDFPageContentLayer;
  -[UIPDFPageContentLayer dealloc](&v3, sel_dealloc);
}

- (void)setSelectionNeedsDisplay
{
  CALayer *selectionLayer;

  selectionLayer = self->_selectionLayer;
  if (selectionLayer)
    -[CALayer setNeedsDisplay](selectionLayer, "setNeedsDisplay");
}

- (void)setNeedsDisplay
{
  objc_super v3;

  -[CALayer setNeedsDisplay](self->_selectionLayer, "setNeedsDisplay");
  v3.receiver = self;
  v3.super_class = (Class)UIPDFPageContentLayer;
  -[UIPDFPageContentLayer setNeedsDisplay](&v3, sel_setNeedsDisplay);
}

- (void)layoutSublayers
{
  void *v3;
  void *v4;
  int v5;
  CALayer *selectionLayer;
  CALayer *v7;

  v3 = (void *)-[UIPDFPageContentLayer delegate](self, "delegate");
  if (v3)
  {
    v4 = v3;
    objc_msgSend(v3, "computeTransform");
    v5 = objc_msgSend(v4, "pageHasSelection");
    selectionLayer = self->_selectionLayer;
    if (v5)
    {
      if (!selectionLayer)
      {
        v7 = (CALayer *)objc_alloc_init(MEMORY[0x1E0CD27A8]);
        self->_selectionLayer = v7;
        -[CALayer setDelegate:](v7, "setDelegate:", self);
        -[UIPDFPageContentLayer addSublayer:](self, "addSublayer:", self->_selectionLayer);
      }
      -[UIPDFPageContentLayer bounds](self, "bounds");
      -[CALayer setFrame:](self->_selectionLayer, "setFrame:");
      -[CALayer setNeedsDisplay](self->_selectionLayer, "setNeedsDisplay");
    }
    else if (selectionLayer)
    {
      -[CALayer removeFromSuperlayer](selectionLayer, "removeFromSuperlayer");

      self->_selectionLayer = 0;
    }
  }
}

- (void)drawLayer:(id)a3 inContext:(CGContext *)a4
{
  void *v6;

  v6 = (void *)-[UIPDFPageContentLayer delegate](self, "delegate");
  if (v6)
    objc_msgSend(v6, "drawSelectionLayer:inContext:", a3, a4);
}

@end
