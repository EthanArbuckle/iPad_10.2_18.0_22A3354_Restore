@implementation UNCBulletinDefaults

+ (id)standardDefaults
{
  if (standardDefaults___once[0] != -1)
    dispatch_once(standardDefaults___once, &__block_literal_global_25);
  return (id)standardDefaults___instance;
}

void __39__UNCBulletinDefaults_standardDefaults__block_invoke()
{
  UNCBulletinDefaults *v0;
  void *v1;

  v0 = objc_alloc_init(UNCBulletinDefaults);
  v1 = (void *)standardDefaults___instance;
  standardDefaults___instance = (uint64_t)v0;

}

- (UNCBulletinDefaults)init
{
  return (UNCBulletinDefaults *)-[BSAbstractDefaultDomain _initWithDomain:](self, "_initWithDomain:", CFSTR("com.apple.bulletinboard"));
}

- (void)_bindAndRegisterDefaults
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "globalContentPreviewSetting");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v3, CFSTR("BBContentPreviewsSetting"), &unk_251B127E8, 1);

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "globalAnnounceSetting");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v4, CFSTR("BBAnnounceSetting"), &unk_251B127E8, 1);

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "globalAnnounceHeadphonesSetting");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v5, CFSTR("BBAnnounceHeadphonesSetting"), &unk_251B127E8, 1);

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "globalAnnounceCarPlaySetting");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v6, CFSTR("BBAnnounceCarPlaySetting"), &unk_251B127E8, 1);

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "announceSupportedForHeadphones");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x24BDBD1C0];
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v7, CFSTR("BBAnnounceSupportedForHeadPhones"), MEMORY[0x24BDBD1C0], 1);

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "announceSupportedForCarPlay");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v9, CFSTR("BBAnnounceSupportedForCarPlay"), v8, 1);

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "pairedVehiclesForCarPlay");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v10, CFSTR("BBPairedVehiclesForCarPlay"), v8, 1);

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "globalScheduledDeliverySetting");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v11, CFSTR("BBScheduledDeliverySetting"), &unk_251B127E8, 1);

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "globalScheduledDeliveryTimes");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v12, CFSTR("BBScheduledDeliveryTimes"), 0, 1);

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "globalScheduledDeliveryShowNextSummarySetting");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v13, CFSTR("BBScheduledDeliveryShowNextSummary"), &unk_251B127E8, 1);

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "globalNotificationListDisplayStyleSetting");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v14, CFSTR("BBNotificationListDisplayStyleSetting"), &unk_251B127E8, 1);

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "globalSpokenNotificationSetting_deprecated");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v15, CFSTR("BBSpokenNotificationSetting"), &unk_251B127E8, 1);

}

@end
