@implementation SXOfferUpsellScenarioAssembly

- (void)loadInRegistry:(id)a3
{
  id v3;
  id v4;

  objc_msgSend(a3, "publicContainer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v3 = (id)objc_msgSend(v4, "registerProtocol:factory:", &unk_254F03D40, &__block_literal_global_35);

}

SXOfferUpsellScenarioProvider *__48__SXOfferUpsellScenarioAssembly_loadInRegistry___block_invoke()
{
  return -[SXOfferUpsellScenarioProvider initWithOfferUpsellScenario:]([SXOfferUpsellScenarioProvider alloc], "initWithOfferUpsellScenario:", 0);
}

@end
