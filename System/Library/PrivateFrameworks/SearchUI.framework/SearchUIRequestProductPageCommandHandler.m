@implementation SearchUIRequestProductPageCommandHandler

- (void)performCommand:(id)a3 triggerEvent:(unint64_t)a4 environment:(id)a5
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  v5 = a3;
  objc_msgSend(v5, "distributorBundleIdentifier");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "itemIdentifier");
  v7 = objc_msgSend(v5, "versionIdentifier");

  +[SearchUIMarketplaceKitUtilities requestProductPageWithDistributorID:itemID:versionID:completionHandler:](_TtC8SearchUI31SearchUIMarketplaceKitUtilities, "requestProductPageWithDistributorID:itemID:versionID:completionHandler:", v8, v6, v7, &__block_literal_global_24);
}

- (unint64_t)destination
{
  return 2;
}

@end
