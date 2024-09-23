@implementation _TUIPinningEntry

- (TUIPinningLiveTransform)pinningLiveTransform
{
  return self->_pinningLiveTransform;
}

- (void)setPinningLiveTransform:(id)a3
{
  objc_storeStrong((id *)&self->_pinningLiveTransform, a3);
}

- (CGPoint)currentOffset
{
  double x;
  double y;
  CGPoint result;

  x = self->_currentOffset.x;
  y = self->_currentOffset.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setCurrentOffset:(CGPoint)a3
{
  self->_currentOffset = a3;
}

- (CGPoint)sectionOffset
{
  double x;
  double y;
  CGPoint result;

  x = self->_sectionOffset.x;
  y = self->_sectionOffset.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setSectionOffset:(CGPoint)a3
{
  self->_sectionOffset = a3;
}

- (CGPoint)defaultPosition
{
  double x;
  double y;
  CGPoint result;

  x = self->_defaultPosition.x;
  y = self->_defaultPosition.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setDefaultPosition:(CGPoint)a3
{
  self->_defaultPosition = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pinningLiveTransform, 0);
}

@end
