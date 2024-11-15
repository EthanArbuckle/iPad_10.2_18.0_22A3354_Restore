@implementation CLVisitNotificationAdapter

- (CLVisitNotificationAdapter)initWithLocationController:(void *)a3
{
  CLVisitNotificationAdapter *v4;
  CLVisitNotificationAdapter *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CLVisitNotificationAdapter;
  v4 = -[CLVisitNotificationAdapter init](&v7, "init");
  v5 = v4;
  if (v4)
  {
    v4->_locationController = a3;
    -[CLVisitNotificationAdapter setValid:](v4, "setValid:", 1);
  }
  return v5;
}

- (void)onVisit:(id)a3
{
  if (self->_valid)
    sub_100697254((uint64_t)self->_locationController, a3);
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
  v2.super_class = (Class)CLVisitNotificationAdapter;
  -[CLVisitNotificationAdapter dealloc](&v2, "dealloc");
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
