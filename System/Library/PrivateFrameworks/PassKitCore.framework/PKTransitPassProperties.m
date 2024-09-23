@implementation PKTransitPassProperties

- (PKFelicaPassProperties)felicaProperties
{
  PKTransitPassProperties *v3;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = self;
  else
    v3 = 0;
  return (PKFelicaPassProperties *)v3;
}

- (NSString)transitBalanceCurrencyCode
{
  void *v2;
  void *v3;

  -[PKStoredValuePassProperties balanceAmount](self, "balanceAmount");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currency");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

@end
