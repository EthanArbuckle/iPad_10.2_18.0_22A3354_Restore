@implementation PXFocusTimelineEvent

- (PXFocusTimelineEvent)initWithTime:(id *)a3 type:(unint64_t)a4
{
  PXFocusTimelineEvent *result;
  __int128 v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PXFocusTimelineEvent;
  result = -[PXFocusTimelineEvent init](&v8, sel_init);
  if (result)
  {
    v7 = *(_OWORD *)&a3->var0;
    result->_time.epoch = a3->var3;
    *(_OWORD *)&result->_time.value = v7;
    result->_type = a4;
  }
  return result;
}

- (unint64_t)type
{
  return self->_type;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)time
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 40);
  return self;
}

- (CGPoint)location
{
  double x;
  double y;
  CGPoint result;

  x = self->_location.x;
  y = self->_location.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setLocation:(CGPoint)a3
{
  self->_location = a3;
}

- (BOOL)shouldAnimate
{
  return self->_shouldAnimate;
}

- (void)setShouldAnimate:(BOOL)a3
{
  self->_shouldAnimate = a3;
}

@end
