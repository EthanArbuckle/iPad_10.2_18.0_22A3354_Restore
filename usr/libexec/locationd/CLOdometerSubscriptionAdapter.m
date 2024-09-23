@implementation CLOdometerSubscriptionAdapter

- (CLOdometerSubscriptionAdapter)initWithOdometerSubscription:(void *)a3
{
  CLOdometerSubscriptionAdapter *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CLOdometerSubscriptionAdapter;
  result = -[CLOdometerSubscriptionAdapter init](&v5, "init");
  if (result)
    result->_subscription = a3;
  return result;
}

- (void)onCyclingDistanceUpdate:(id)a3
{
  void *v4;
  void *__p[3];

  v4 = -[CLOdometerSubscriptionAdapter subscription](self, "subscription");
  (*((void (**)(void **__return_ptr, id))a3 + 2))(__p, a3);
  sub_10108F8C8((uint64_t)v4, (double **)__p);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
}

- (BOOL)valid
{
  return self->_valid;
}

- (void)setValid:(BOOL)a3
{
  self->_valid = a3;
}

- (void)subscription
{
  return self->_subscription;
}

- (void)setSubscription:(void *)a3
{
  self->_subscription = a3;
}

@end
