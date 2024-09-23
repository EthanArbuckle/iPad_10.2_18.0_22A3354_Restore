@implementation THHighlightLine

- (void)dealloc
{
  objc_super v3;

  -[THHighlightLine setContentLayer:](self, "setContentLayer:", 0);
  v3.receiver = self;
  v3.super_class = (Class)THHighlightLine;
  -[THHighlightLine dealloc](&v3, "dealloc");
}

- (CALayer)contentLayer
{
  return self->_contentLayer;
}

- (void)setContentLayer:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (CGRect)fullLineRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_fullLineRect.origin.x;
  y = self->_fullLineRect.origin.y;
  width = self->_fullLineRect.size.width;
  height = self->_fullLineRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setFullLineRect:(CGRect)a3
{
  self->_fullLineRect = a3;
}

- (CGRect)currentLineRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_currentLineRect.origin.x;
  y = self->_currentLineRect.origin.y;
  width = self->_currentLineRect.size.width;
  height = self->_currentLineRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setCurrentLineRect:(CGRect)a3
{
  self->_currentLineRect = a3;
}

- (double)baseline
{
  return self->_baseline;
}

- (void)setBaseline:(double)a3
{
  self->_baseline = a3;
}

- (double)underlineOffset
{
  return self->_underlineOffset;
}

- (void)setUnderlineOffset:(double)a3
{
  self->_underlineOffset = a3;
}

- (BOOL)includesCapSpace
{
  return self->_includesCapSpace;
}

- (void)setIncludesCapSpace:(BOOL)a3
{
  self->_includesCapSpace = a3;
}

@end
