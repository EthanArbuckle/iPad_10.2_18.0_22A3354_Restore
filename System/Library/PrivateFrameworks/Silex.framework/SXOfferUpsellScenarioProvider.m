@implementation SXOfferUpsellScenarioProvider

- (SXOfferUpsellScenarioProvider)init
{
  return -[SXOfferUpsellScenarioProvider initWithOfferUpsellScenario:](self, "initWithOfferUpsellScenario:", 0);
}

- (SXOfferUpsellScenarioProvider)initWithOfferUpsellScenario:(int64_t)a3
{
  SXOfferUpsellScenarioProvider *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SXOfferUpsellScenarioProvider;
  result = -[SXOfferUpsellScenarioProvider init](&v5, sel_init);
  if (result)
    result->_offerUpsellScenario = a3;
  return result;
}

- (int64_t)offerUpsellScenario
{
  return self->_offerUpsellScenario;
}

@end
