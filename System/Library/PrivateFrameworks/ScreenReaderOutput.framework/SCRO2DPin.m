@implementation SCRO2DPin

- (SCRO2DPin)initWithX:(unint64_t)a3 y:(unint64_t)a4 style:(unint64_t)a5
{
  SCRO2DPin *result;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SCRO2DPin;
  result = -[SCRO2DPin init](&v9, sel_init);
  if (result)
  {
    result->_x = a3;
    result->_y = a4;
    result->_style = a5;
  }
  return result;
}

- (unint64_t)x
{
  return self->_x;
}

- (unint64_t)y
{
  return self->_y;
}

- ($488472A07B2E1D1A523D39A95A553F6B)state
{
  return ($488472A07B2E1D1A523D39A95A553F6B)self->_state.detent;
}

- (void)setState:(id)a3
{
  self->_state.detent = a3.var0;
}

- (unint64_t)style
{
  return self->_style;
}

@end
