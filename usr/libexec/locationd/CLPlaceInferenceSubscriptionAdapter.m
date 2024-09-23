@implementation CLPlaceInferenceSubscriptionAdapter

- (CLPlaceInferenceSubscriptionAdapter)init
{
  CLPlaceInferenceSubscriptionAdapter *v2;
  CLPlaceInferenceSubscriptionAdapter *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CLPlaceInferenceSubscriptionAdapter;
  v2 = -[CLPlaceInferenceSubscriptionAdapter init](&v5, "init");
  v3 = v2;
  if (v2)
    -[CLPlaceInferenceSubscriptionAdapter setValid:](v2, "setValid:", 1);
  return v3;
}

- (void)invalidate
{
  -[CLPlaceInferenceSubscriptionAdapter setValid:](self, "setValid:", 0);
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
