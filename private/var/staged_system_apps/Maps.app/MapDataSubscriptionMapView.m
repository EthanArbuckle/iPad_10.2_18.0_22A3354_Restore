@implementation MapDataSubscriptionMapView

- (UIContentConfiguration)configuration
{
  return self->configuration;
}

- (void)setConfiguration:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->configuration, 0);
}

@end
