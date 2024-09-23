@implementation TSWPTextMagnifierRanged

- (TSWPTextMagnifierRanged)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  TSWPTextMagnifierRanged *v7;
  TSWPTextMagnifierRenderer *v8;
  objc_super v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10.receiver = self;
  v10.super_class = (Class)TSWPTextMagnifierRanged;
  v7 = -[TSWPTextMagnifierRanged initWithFrame:](&v10, sel_initWithFrame_);
  if (v7)
  {
    -[TSWPTextMagnifierRanged setBackgroundColor:](v7, "setBackgroundColor:", objc_msgSend(MEMORY[0x24BDF6950], "clearColor"));
    v7->_weightedPoint = objc_alloc_init(TSWPTextMagnifierTimeWeightedPoint);
    v8 = -[TSWPTextMagnifierRenderer initWithFrame:]([TSWPTextMagnifierRenderer alloc], "initWithFrame:", x, y, width, height);
    v7->_magnifierRenderer = v8;
    -[TSWPTextMagnifierRenderer setDelegate:](v8, "setDelegate:", v7);
    -[TSWPTextMagnifierRanged addSubview:](v7, "addSubview:", v7->_magnifierRenderer);
  }
  return v7;
}

- (void)dealloc
{
  objc_super v3;

  -[TSWPTextMagnifierRenderer setDelegate:](self->_magnifierRenderer, "setDelegate:", 0);
  -[TSWPTextMagnifierRenderer tearDown](self->_magnifierRenderer, "tearDown");

  v3.receiver = self;
  v3.super_class = (Class)TSWPTextMagnifierRanged;
  -[TSWPTextMagnifierRanged dealloc](&v3, sel_dealloc);
}

- (double)horizontalMovement
{
  double result;

  -[TSWPTextMagnifierTimeWeightedPoint displacementInInterval:](self->_weightedPoint, "displacementInInterval:", 0.5);
  return result;
}

- (double)horizontalMovementAtTime:(double)a3
{
  double v4;
  double v5;
  double result;
  double v7;
  double v8;
  double v9;

  -[TSWPTextMagnifierTimeWeightedPoint distanceCoveredInInterval:](self->_weightedPoint, "distanceCoveredInInterval:", 3.40282347e38);
  v5 = v4;
  -[TSWPTextMagnifierTimeWeightedPoint displacementInInterval:](self->_weightedPoint, "displacementInInterval:", 0.5);
  v7 = fabs(result);
  v9 = fabs(v8) * 4.0;
  if (v5 > v7 * 1.5 || v9 > v7 || v7 < 16.0)
    return 0.0;
  return result;
}

- (BOOL)wasPlacedCarefullyAtTime:(double)a3
{
  double v3;

  -[TSWPTextMagnifierTimeWeightedPoint distanceCoveredInInterval:priorTo:](self->_weightedPoint, "distanceCoveredInInterval:priorTo:", 0.5, a3);
  return v3 < 10.0;
}

- (double)currentOffset
{
  void *v2;
  uint64_t v3;

  v2 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
  v3 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPTextMagnifierRanged currentOffset]");
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPTextMagnifierRanged.mm"), 97, CFSTR("Abstract method"));
  return 0.0;
}

- (void)setFrame:(CGRect)a3
{
  TSWPTextMagnifierRenderer *magnifierRenderer;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TSWPTextMagnifierRanged;
  -[TSWPTextMagnifierRanged setFrame:](&v5, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  magnifierRenderer = self->_magnifierRenderer;
  -[TSWPTextMagnifierRanged bounds](self, "bounds");
  -[TSWPTextMagnifierRenderer setFrame:](magnifierRenderer, "setFrame:");
}

- (void)setNeedsDisplay
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSWPTextMagnifierRanged;
  -[TSWPTextMagnifierRanged setNeedsDisplay](&v3, sel_setNeedsDisplay);
  -[TSWPTextMagnifierRenderer setNeedsDisplay](self->_magnifierRenderer, "setNeedsDisplay");
}

- (void)updateFrame
{
  void *v2;
  uint64_t v3;

  v2 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
  v3 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPTextMagnifierRanged updateFrame]");
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPTextMagnifierRanged.mm"), 115, CFSTR("Abstract method"));
}

- (void)beginMagnifyingTarget:(id)a3 magnificationPoint:(CGPoint)a4 offset:(CGPoint)a5 animated:(BOOL)a6
{
  void *v6;
  uint64_t v7;

  v6 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler", a3, a6, a4.x, a4.y, a5.x, a5.y);
  v7 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPTextMagnifierRanged beginMagnifyingTarget:magnificationPoint:offset:animated:]");
  objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPTextMagnifierRanged.mm"), 122, CFSTR("Abstract method"));
}

- (void)stopMagnifying:(BOOL)a3
{
  void *v3;
  uint64_t v4;

  v3 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler", a3);
  v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPTextMagnifierRanged stopMagnifying:]");
  objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPTextMagnifierRanged.mm"), 127, CFSTR("Abstract method"));
}

- (void)postAutoscrollPoint:(CGPoint)a3
{
  -[TSWPTextMagnifierTimeWeightedPoint addPoint:](self->_weightedPoint, "addPoint:", a3.x, a3.y);
}

- (void)setAutoscrollDirections:(int)a3
{
  -[TSWPTextMagnifierRenderer setAutoscrollDirections:](self->_magnifierRenderer, "setAutoscrollDirections:", *(_QWORD *)&a3);
}

- (void)autoscrollWillNotStart
{
  -[TSWPTextMagnifierRanged setAutoscrollDirections:](self, "setAutoscrollDirections:", 0);
}

- (CGPoint)terminalPoint
{
  double v2;
  double v3;
  CGPoint result;

  -[TSWPTextMagnifierTimeWeightedPoint weightedPoint](self->_weightedPoint, "weightedPoint");
  result.y = v3;
  result.x = v2;
  return result;
}

- (BOOL)terminalPointPlacedCarefully
{
  BOOL v3;
  double v4;

  v3 = -[TSWPTextMagnifierTimeWeightedPoint historyCovers:](self->_weightedPoint, "historyCovers:", 0.5);
  -[TSWPTextMagnifierTimeWeightedPoint distanceCoveredInInterval:](self->_weightedPoint, "distanceCoveredInInterval:", 0.5);
  return v4 < 10.0 && v3;
}

- (CGPoint)magnificationPoint
{
  double x;
  double y;
  CGPoint result;

  x = self->_magnificationPoint.x;
  y = self->_magnificationPoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setMagnificationPoint:(CGPoint)a3
{
  double y;
  double x;

  y = a3.y;
  x = a3.x;
  -[TSWPTextMagnifierTimeWeightedPoint addPoint:](self->_weightedPoint, "addPoint:");
  if (x != self->_magnificationPoint.x || y != self->_magnificationPoint.y)
  {
    self->_magnificationPoint.x = x;
    self->_magnificationPoint.y = y;
    -[TSWPTextMagnifierRanged updateFrame](self, "updateFrame");
    -[TSWPTextMagnifierRenderer canvasNeedsDisplay](self->_magnifierRenderer, "canvasNeedsDisplay");
  }
  -[TSWPTextMagnifierRanged setAnimationPoint:](self, "setAnimationPoint:", x, y);
}

- (NSString)underlayImageName
{
  void *v2;
  uint64_t v3;

  v2 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
  v3 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPTextMagnifierRanged underlayImageName]");
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPTextMagnifierRanged.mm"), 180, CFSTR("Abstract method"));
  return (NSString *)&stru_24D82FEB0;
}

- (NSString)overlayImageName
{
  void *v2;
  uint64_t v3;

  v2 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
  v3 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPTextMagnifierRanged overlayImageName]");
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPTextMagnifierRanged.mm"), 186, CFSTR("Abstract method"));
  return (NSString *)&stru_24D82FEB0;
}

- (NSString)maskImageName
{
  void *v2;
  uint64_t v3;

  v2 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
  v3 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPTextMagnifierRanged maskImageName]");
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPTextMagnifierRanged.mm"), 192, CFSTR("Abstract method"));
  return (NSString *)&stru_24D82FEB0;
}

- (BOOL)shouldHideCanvasLayer
{
  void *v2;
  uint64_t v3;

  v2 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
  v3 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPTextMagnifierRanged shouldHideCanvasLayer]");
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPTextMagnifierRanged.mm"), 198, CFSTR("Abstract method"));
  return 1;
}

- (void)drawMagnifierClippedCanvasLayer:(id)a3 inContext:(CGContext *)a4
{
  void *v4;
  uint64_t v5;

  v4 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler", a3, a4);
  v5 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPTextMagnifierRanged drawMagnifierClippedCanvasLayer:inContext:]");
  objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPTextMagnifierRanged.mm"), 204, CFSTR("Abstract method"));
}

- (void)canvasNeedsDisplay
{
  -[TSWPTextMagnifierRenderer canvasNeedsDisplay](self->_magnifierRenderer, "canvasNeedsDisplay");
}

- (TSWPRep)target
{
  return self->_target;
}

- (void)setTarget:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 416);
}

- (CGPoint)animationPoint
{
  double x;
  double y;
  CGPoint result;

  x = self->_animationPoint.x;
  y = self->_animationPoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setAnimationPoint:(CGPoint)a3
{
  self->_animationPoint = a3;
}

- (CGPoint)offset
{
  double x;
  double y;
  CGPoint result;

  x = self->_offset.x;
  y = self->_offset.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setOffset:(CGPoint)a3
{
  self->_offset = a3;
}

@end
