@implementation TUIWPFontMetrics

- (double)pointSize
{
  return self->_pointSize;
}

- (void)setPointSize:(double)a3
{
  self->_pointSize = a3;
}

- (double)capHeight
{
  return self->_capHeight;
}

- (void)setCapHeight:(double)a3
{
  self->_capHeight = a3;
}

- (double)ascent
{
  return self->_ascent;
}

- (void)setAscent:(double)a3
{
  self->_ascent = a3;
}

- (double)descent
{
  return self->_descent;
}

- (void)setDescent:(double)a3
{
  self->_descent = a3;
}

@end
