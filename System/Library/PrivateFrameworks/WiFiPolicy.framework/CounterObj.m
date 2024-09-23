@implementation CounterObj

- (void)increment
{
  ++self->_count;
}

- (unint64_t)count
{
  return self->_count;
}

- (void)setCount:(unint64_t)a3
{
  self->_count = a3;
}

@end
