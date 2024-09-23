@implementation CLDaemonLocationUpdaterHistoricalAdapter

- (CLDaemonLocationUpdaterHistoricalAdapter)init
{
  CLDaemonLocationUpdaterHistoricalAdapter *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLDaemonLocationUpdaterHistoricalAdapter;
  result = -[CLDaemonLocationUpdaterHistoricalAdapter init](&v3, "init");
  if (result)
    result->_valid = 1;
  return result;
}

- (void)invalidate
{
  self->_valid = 0;
}

- (BOOL)valid
{
  return self->_valid;
}

- (void)setValid:(BOOL)a3
{
  self->_valid = a3;
}

- (void)updater
{
  return self->_updater;
}

- (void)setUpdater:(void *)a3
{
  self->_updater = a3;
}

@end
