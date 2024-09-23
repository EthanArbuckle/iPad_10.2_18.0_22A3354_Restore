@implementation CLMicroLocationIntersiloDelegate

- (CLMicroLocationIntersiloDelegate)initWithMicroLocationNotifier:(void *)a3
{
  CLMicroLocationIntersiloDelegate *result;
  objc_super v5;

  if (!a3)
    return 0;
  v5.receiver = self;
  v5.super_class = (Class)CLMicroLocationIntersiloDelegate;
  result = -[CLMicroLocationIntersiloDelegate init](&v5, "init");
  if (result)
  {
    result->_microLocationNotifier = a3;
    result->_valid = 1;
  }
  return result;
}

- (void)duetMonitor:(id)a3 foregroundAppDidLaunch:(id)a4
{
  sub_100F2104C((uint64_t)self->_microLocationNotifier, a4);
}

- (void)duetMonitor:(id)a3 nowPlayingDidChange:(id)a4
{
  sub_100F211EC((uint64_t)self->_microLocationNotifier, a4);
}

- (BOOL)valid
{
  return self->_valid;
}

- (void)setValid:(BOOL)a3
{
  self->_valid = a3;
}

@end
