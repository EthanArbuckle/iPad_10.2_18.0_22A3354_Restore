@implementation TSWPTextMagnifierRenderer

- (TSWPTextMagnifierRenderer)initWithFrame:(CGRect)a3
{
  TSWPTextMagnifierRenderer *v3;
  TSWPTextMagnifierRenderer *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TSWPTextMagnifierRenderer;
  v3 = -[TSWPTextMagnifierRenderer initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[TSWPTextMagnifierRenderer setUserInteractionEnabled:](v3, "setUserInteractionEnabled:", 0);
    -[TSWPTextMagnifierRenderer setOpaque:](v4, "setOpaque:", 0);
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  -[TSWPTextMagnifierRenderer tearDown](self, "tearDown");
  v3.receiver = self;
  v3.super_class = (Class)TSWPTextMagnifierRenderer;
  -[TSWPTextMagnifierRenderer dealloc](&v3, sel_dealloc);
}

- (void)tearDown
{
  CALayer *underlayLayer;

  underlayLayer = self->_underlayLayer;
  if (underlayLayer)
  {
    -[CALayer setDelegate:](underlayLayer, "setDelegate:", 0);
    -[CALayer removeFromSuperlayer](self->_underlayLayer, "removeFromSuperlayer");

    self->_underlayLayer = 0;
  }
  -[CALayer setDelegate:](self->_canvasLayer, "setDelegate:", 0);
  -[CALayer removeFromSuperlayer](self->_canvasLayer, "removeFromSuperlayer");

  self->_canvasLayer = 0;
  -[CALayer setDelegate:](self->_overlayLayer, "setDelegate:", 0);
  -[CALayer removeFromSuperlayer](self->_overlayLayer, "removeFromSuperlayer");

  self->_overlayLayer = 0;
}

- (void)canvasNeedsDisplay
{
  -[CALayer setNeedsDisplay](self->_canvasLayer, "setNeedsDisplay");
}

- (void)setAutoscrollDirections:(int)a3
{
  double v4;

  if (self->_autoscrollDirections != a3)
  {
    self->_autoscrollDirections = a3;
    v4 = 0.800000012;
    if (!a3)
      v4 = 1.0;
    -[TSWPTextMagnifierRenderer setAlpha:](self, "setAlpha:", v4);
    -[TSWPTextMagnifierRenderer setNeedsLayout](self, "setNeedsLayout");
    -[TSWPTextMagnifierRenderer setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (void)setNeedsDisplay
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSWPTextMagnifierRenderer;
  -[TSWPTextMagnifierRenderer setNeedsDisplay](&v3, sel_setNeedsDisplay);
  -[CALayer setNeedsDisplay](self->_canvasLayer, "setNeedsDisplay");
}

- (id)p_createChildLayer
{
  id v3;

  v3 = objc_alloc_init(MEMORY[0x24BDE56D0]);
  objc_msgSend(v3, "setDelegate:", self);
  objc_msgSend(v3, "setOpaque:", 0);
  -[TSWPTextMagnifierRenderer bounds](self, "bounds");
  objc_msgSend(v3, "setFrame:");
  TSUScreenScale();
  objc_msgSend(v3, "setContentsScale:");
  return v3;
}

- (void)layoutSubviews
{
  uint64_t v3;
  _BOOL8 v4;

  if (self->_underlayLayer
    || !-[TSWPTextMagnifierRendererDelegate underlayImageName](self->_delegate, "underlayImageName"))
  {
    v3 = 0;
  }
  else
  {
    self->_underlayLayer = (CALayer *)-[TSWPTextMagnifierRenderer p_createChildLayer](self, "p_createChildLayer");
    -[CALayer setContents:](self->_underlayLayer, "setContents:", objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6AC8], "imageNamed:inBundle:compatibleWithTraitCollection:", -[TSWPTextMagnifierRendererDelegate underlayImageName](self->_delegate, "underlayImageName"), TSWPBundle(), 0), "CGImage"));
    objc_msgSend((id)-[TSWPTextMagnifierRenderer layer](self, "layer"), "insertSublayer:atIndex:", self->_underlayLayer, 0);
    v3 = 1;
  }
  if (!self->_canvasLayer)
  {
    self->_canvasLayer = (CALayer *)-[TSWPTextMagnifierRenderer p_createChildLayer](self, "p_createChildLayer");
    -[CALayer setBackgroundColor:](self->_canvasLayer, "setBackgroundColor:", objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6950], "clearColor"), "CGColor"));
    objc_msgSend((id)-[TSWPTextMagnifierRenderer layer](self, "layer"), "insertSublayer:atIndex:", self->_canvasLayer, v3);
    v3 = (v3 + 1);
  }
  if (!self->_overlayLayer)
  {
    self->_overlayLayer = (CALayer *)-[TSWPTextMagnifierRenderer p_createChildLayer](self, "p_createChildLayer");
    -[CALayer setContents:](self->_overlayLayer, "setContents:", objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6AC8], "imageNamed:inBundle:compatibleWithTraitCollection:", -[TSWPTextMagnifierRendererDelegate overlayImageName](self->_delegate, "overlayImageName"), TSWPBundle(), 0), "CGImage"));
    objc_msgSend((id)-[TSWPTextMagnifierRenderer layer](self, "layer"), "insertSublayer:atIndex:", self->_overlayLayer, v3);
  }
  if (-[TSWPTextMagnifierRendererDelegate shouldHideCanvasLayer](self->_delegate, "shouldHideCanvasLayer"))v4 = -[TSWPTextMagnifierRenderer autoscrollDirections](self, "autoscrollDirections") != 0;
  else
    v4 = 0;
  -[CALayer setHidden:](self->_canvasLayer, "setHidden:", v4);
  -[TSWPTextMagnifierRenderer setNeedsDisplay](self, "setNeedsDisplay");
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  return 0;
}

- (id)actionForLayer:(id)a3 forKey:(id)a4
{
  return (id)objc_msgSend(MEMORY[0x24BDBCEF8], "null", a3, a4);
}

- (void)drawLayer:(id)a3 inContext:(CGContext *)a4
{
  if (self->_canvasLayer == a3 && (objc_msgSend(a3, "isHidden") & 1) == 0)
    -[TSWPTextMagnifierRendererDelegate drawMagnifierClippedCanvasLayer:inContext:](self->_delegate, "drawMagnifierClippedCanvasLayer:inContext:", a3, a4);
}

- (TSWPTextMagnifierRendererDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (TSWPTextMagnifierRendererDelegate *)a3;
}

- (int)autoscrollDirections
{
  return self->_autoscrollDirections;
}

@end
