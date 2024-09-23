@implementation CLLocationSubscriptionAdapter

- (CLLocationSubscriptionAdapter)init
{
  CLLocationSubscriptionAdapter *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLLocationSubscriptionAdapter;
  result = -[CLLocationSubscriptionAdapter init](&v3, "init");
  if (result)
    result->_valid = 1;
  return result;
}

- (BOOL)valid
{
  return self->_valid;
}

- (void)setValid:(BOOL)a3
{
  self->_valid = a3;
}

- (void)dealloc
{
  objc_super v2;

  self->_valid = 0;
  v2.receiver = self;
  v2.super_class = (Class)CLLocationSubscriptionAdapter;
  -[CLLocationSubscriptionAdapter dealloc](&v2, "dealloc");
}

@end
