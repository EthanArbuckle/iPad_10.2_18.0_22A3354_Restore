@implementation CLDaemonLocationUpdaterLiveAdapter

- (CLDaemonLocationUpdaterLiveAdapter)init
{
  CLDaemonLocationUpdaterLiveAdapter *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLDaemonLocationUpdaterLiveAdapter;
  result = -[CLDaemonLocationUpdaterLiveAdapter init](&v3, "init");
  if (result)
    result->_valid = 1;
  return result;
}

- (void)invalidate
{
  self->_valid = 0;
}

- (void)dealloc
{
  objc_super v2;

  self->_valid = 0;
  v2.receiver = self;
  v2.super_class = (Class)CLDaemonLocationUpdaterLiveAdapter;
  -[CLDaemonLocationUpdaterLiveAdapter dealloc](&v2, "dealloc");
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
