@implementation CLInterval

- (CLInterval)initWithStart:(double)a3 end:(double)a4
{
  CLInterval *v6;
  CLInterval *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CLInterval;
  v6 = -[CLInterval init](&v9, "init");
  v7 = v6;
  if (v6)
  {
    -[CLInterval setStart:](v6, "setStart:", a3);
    -[CLInterval setEnd:](v7, "setEnd:", a4);
  }
  return v7;
}

- (double)start
{
  return self->_start;
}

- (void)setStart:(double)a3
{
  self->_start = a3;
}

- (double)end
{
  return self->_end;
}

- (void)setEnd:(double)a3
{
  self->_end = a3;
}

@end
