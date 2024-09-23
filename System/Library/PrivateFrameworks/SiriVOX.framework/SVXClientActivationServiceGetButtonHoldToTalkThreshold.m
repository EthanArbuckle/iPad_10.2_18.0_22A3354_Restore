@implementation SVXClientActivationServiceGetButtonHoldToTalkThreshold

void ___SVXClientActivationServiceGetButtonHoldToTalkThreshold_block_invoke()
{
  void *v0;
  uint64_t v1;
  id v2;

  objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "manualEndpointingThreshold");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "doubleValue");
  _SVXClientActivationServiceGetButtonHoldToTalkThreshold_threshold = v1;

}

@end
