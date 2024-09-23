@implementation STSupportedConfigurations

void __STSupportedConfigurations_block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[22];
  _QWORD v3[23];

  v3[22] = *MEMORY[0x24BDAC8D0];
  v2[0] = CFSTR("STCustomRestrictionConfiguration");
  v3[0] = objc_opt_class();
  v2[1] = CFSTR("STMCFeatureConfiguration");
  v3[1] = objc_opt_class();
  v2[2] = CFSTR("STSBCapabilityConfiguration");
  v3[2] = objc_opt_class();
  v2[3] = CFSTR("account.settings");
  v3[3] = objc_opt_class();
  v2[4] = CFSTR("application.settings");
  v3[4] = objc_opt_class();
  v2[5] = CFSTR("application.store");
  v3[5] = objc_opt_class();
  v2[6] = CFSTR("legacy.restrictions.apps");
  v3[6] = objc_opt_class();
  v2[7] = CFSTR("media.settings");
  v3[7] = objc_opt_class();
  v2[8] = CFSTR("network.cellular.settings");
  v3[8] = objc_opt_class();
  v2[9] = CFSTR("passcode.settings");
  v3[9] = objc_opt_class();
  v2[10] = CFSTR("system.airdrop");
  v3[10] = objc_opt_class();
  v2[11] = CFSTR("system.camera");
  v3[11] = objc_opt_class();
  v2[12] = CFSTR("system.carplay");
  v3[12] = objc_opt_class();
  v2[13] = CFSTR("system.donotdisturb");
  v3[13] = objc_opt_class();
  v2[14] = CFSTR("system.gamecenter");
  v3[14] = objc_opt_class();
  v2[15] = CFSTR("system.icloud");
  v3[15] = objc_opt_class();
  v2[16] = CFSTR("system.music");
  v3[16] = objc_opt_class();
  v2[17] = CFSTR("system.ratings");
  v3[17] = objc_opt_class();
  v2[18] = CFSTR("system.siri");
  v3[18] = objc_opt_class();
  v2[19] = CFSTR("system.tvprovider");
  v3[19] = objc_opt_class();
  v2[20] = CFSTR("system.webcontentfilter.basic");
  v3[20] = objc_opt_class();
  v2[21] = CFSTR("system.web.tracking");
  v3[21] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v3, v2, 22);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)STSupportedConfigurations_knownConfigurationNames;
  STSupportedConfigurations_knownConfigurationNames = v0;

}

@end
