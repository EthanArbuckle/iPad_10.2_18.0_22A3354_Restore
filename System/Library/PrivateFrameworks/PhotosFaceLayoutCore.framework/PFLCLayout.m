@implementation PFLCLayout

- (PFLCLayout)initWithCropScore:(double)a3 layoutScore:(double)a4 foregroundCoverage:(double)a5 visibleRect:(CGRect)a6 usesMask:(BOOL)a7
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  PFLCLayout *result;
  objc_super v16;

  height = a6.size.height;
  width = a6.size.width;
  y = a6.origin.y;
  x = a6.origin.x;
  v16.receiver = self;
  v16.super_class = (Class)PFLCLayout;
  result = -[PFLCLayout init](&v16, sel_init);
  if (result)
  {
    result->_cropScore = a3;
    result->_layoutScore = a4;
    result->_foregroundCoverage = a5;
    result->_visibleRect.origin.x = x;
    result->_visibleRect.origin.y = y;
    result->_visibleRect.size.width = width;
    result->_visibleRect.size.height = height;
    result->_usesMask = a7;
  }
  return result;
}

- (double)cropScore
{
  return self->_cropScore;
}

- (void)setCropScore:(double)a3
{
  self->_cropScore = a3;
}

- (double)layoutScore
{
  return self->_layoutScore;
}

- (void)setLayoutScore:(double)a3
{
  self->_layoutScore = a3;
}

- (double)foregroundCoverage
{
  return self->_foregroundCoverage;
}

- (void)setForegroundCoverage:(double)a3
{
  self->_foregroundCoverage = a3;
}

- (CGRect)visibleRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_visibleRect.origin.x;
  y = self->_visibleRect.origin.y;
  width = self->_visibleRect.size.width;
  height = self->_visibleRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setVisibleRect:(CGRect)a3
{
  self->_visibleRect = a3;
}

- (BOOL)usesMask
{
  return self->_usesMask;
}

- (void)setUsesMask:(BOOL)a3
{
  self->_usesMask = a3;
}

@end
