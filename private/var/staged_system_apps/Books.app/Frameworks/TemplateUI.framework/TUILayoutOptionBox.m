@implementation TUILayoutOptionBox

- (Class)layoutClass
{
  return (Class)objc_opt_class(TUILayoutOptionLayout, a2);
}

- (double)minScale
{
  return self->_minScale;
}

- (void)setMinScale:(double)a3
{
  self->_minScale = a3;
}

- (double)maxScale
{
  return self->_maxScale;
}

- (void)setMaxScale:(double)a3
{
  self->_maxScale = a3;
}

@end
