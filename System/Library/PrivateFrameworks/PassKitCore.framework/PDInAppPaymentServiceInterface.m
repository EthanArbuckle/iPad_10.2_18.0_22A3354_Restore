@implementation PDInAppPaymentServiceInterface

void __PDInAppPaymentServiceInterface_block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE296868);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_MergedGlobals_241;
  _MergedGlobals_241 = v0;

  v2 = (void *)_MergedGlobals_241;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v3, sel_cardDataForMerchantIdentifier_countryCode_completion_, 0, 1);

  v4 = (void *)_MergedGlobals_241;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_validatePayLaterMerchandisingConfiguration_type_completion_, 0, 0);

}

@end
