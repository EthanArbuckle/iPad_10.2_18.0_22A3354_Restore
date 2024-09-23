@implementation WBUCreditCardDataController

+ (id)sharedCreditCardDataController
{
  void *v3;
  id v4;
  void *v5;

  v3 = (void *)sharedCreditCardDataController_sharedInstance;
  if (!sharedCreditCardDataController_sharedInstance)
  {
    v4 = objc_alloc_init((Class)a1);
    v5 = (void *)sharedCreditCardDataController_sharedInstance;
    sharedCreditCardDataController_sharedInstance = (uint64_t)v4;

    v3 = (void *)sharedCreditCardDataController_sharedInstance;
  }
  return v3;
}

- (unint64_t)virtualCardFieldsToRequest
{
  if (MGGetBoolAnswer())
    return 3;
  else
    return 1;
}

- (BOOL)hasUsedNonVirtualCard
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x24BDBCF50], "webui_defaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", *(_QWORD *)off_24CB8CE10);

  return v3;
}

- (void)setHasUsedNonVirtualCard
{
  id v2;

  objc_msgSend(MEMORY[0x24BDBCF50], "webui_defaults");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setBool:forKey:", 1, *(_QWORD *)off_24CB8CE10);

}

- (BOOL)_shouldOfferVirtualCards
{
  return +[WBUFeatureManager shouldOfferVirtualCards](WBUFeatureManager, "shouldOfferVirtualCards");
}

@end
