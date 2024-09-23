@implementation UIPDFPageContentTiledLayer

- (UIPDFPageContentTiledLayer)init
{
  UIPDFPageContentTiledLayer *v2;
  CATransform3D v4;
  CATransform3D v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UIPDFPageContentTiledLayer;
  v2 = -[UIPDFPageContentTiledLayer init](&v6, sel_init);
  if (v2)
  {
    CATransform3DMakeScale(&v5, 1.0, -1.0, 1.0);
    v4 = v5;
    -[UIPDFPageContentTiledLayer setTransform:](v2, "setTransform:", &v4);
    -[UIPDFPageContentTiledLayer setOpaque:](v2, "setOpaque:", 1);
    if (MGGetBoolAnswer())
      -[UIPDFPageContentTiledLayer setContentsFormat:](v2, "setContentsFormat:", *MEMORY[0x1E0CD29E8]);
  }
  return v2;
}

- (void)dealloc
{
  CALayer *selectionLayer;
  objc_super v4;

  selectionLayer = self->_selectionLayer;
  if (selectionLayer)

  v4.receiver = self;
  v4.super_class = (Class)UIPDFPageContentTiledLayer;
  -[CATiledLayer dealloc](&v4, sel_dealloc);
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
  CALayer *selectionLayer;
  objc_super v4;

  selectionLayer = self->_selectionLayer;
  if (selectionLayer)
    -[CALayer setNeedsDisplay](selectionLayer, "setNeedsDisplay");
  v4.receiver = self;
  v4.super_class = (Class)UIPDFPageContentTiledLayer;
  -[UIPDFPageContentTiledLayer setNeedsDisplay](&v4, sel_setNeedsDisplay);
}

- (void)layoutSublayers
{
  void *v3;
  void *v4;
  int v5;
  CALayer *v6;

  v3 = (void *)-[UIPDFPageContentTiledLayer delegate](self, "delegate");
  if (v3)
  {
    v4 = v3;
    objc_msgSend(v3, "computeTransform");
    v5 = objc_msgSend(v4, "pageHasSelection");
    if (self->_selectionLayer)
    {
      if ((v5 & 1) == 0)
      {
        -[CALayer removeFromSuperlayer](self->_selectionLayer, "removeFromSuperlayer");

        self->_selectionLayer = 0;
      }
    }
    else if (v5)
    {
      v6 = (CALayer *)objc_alloc_init(MEMORY[0x1E0CD27A8]);
      self->_selectionLayer = v6;
      -[CALayer setDelegate:](v6, "setDelegate:", self);
      -[UIPDFPageContentTiledLayer bounds](self, "bounds");
      -[CALayer setFrame:](self->_selectionLayer, "setFrame:");
      -[UIPDFPageContentTiledLayer addSublayer:](self, "addSublayer:", self->_selectionLayer);
      -[CALayer setNeedsLayout](self->_selectionLayer, "setNeedsLayout");
      -[CALayer setNeedsDisplay](self->_selectionLayer, "setNeedsDisplay");
    }
  }
}

- (void)drawLayer:(id)a3 inContext:(CGContext *)a4
{
  void *v6;

  v6 = (void *)-[UIPDFPageContentTiledLayer delegate](self, "delegate");
  if (v6)
    objc_msgSend(v6, "drawSelectionLayer:inContext:", a3, a4);
}

@end
