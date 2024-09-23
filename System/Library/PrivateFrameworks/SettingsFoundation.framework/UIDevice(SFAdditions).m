@implementation UIDevice(SFAdditions)

- (BOOL)sf_isChinaRegionCellularDevice
{
  _BOOL8 result;

  if (sf_isChinaRegionCellularDevice___greenTeaCapabilityToken != -1)
    dispatch_once(&sf_isChinaRegionCellularDevice___greenTeaCapabilityToken, &__block_literal_global_13);
  result = (sf_isChinaRegionCellularDevice___greenTea | CFPreferencesGetAppBooleanValue(CFSTR("fakeGreenTea"), CFSTR("com.apple.preferences.cn"), 0)) != 0;
  sf_isChinaRegionCellularDevice___greenTea = result;
  return result;
}

- (BOOL)sf_isiPad
{
  void *v0;
  _BOOL8 v1;

  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "userInterfaceIdiom") == 1;

  return v1;
}

- (uint64_t)sf_isInternalInstall
{
  if (sf_isInternalInstall___onceToken != -1)
    dispatch_once(&sf_isInternalInstall___onceToken, &__block_literal_global_1);
  return sf_isInternalInstall___internalInstall;
}

- (BOOL)sf_isiPhone
{
  void *v0;
  _BOOL8 v1;

  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "userInterfaceIdiom") == 0;

  return v1;
}

- (uint64_t)sf_isAppleTV
{
  return 0;
}

- (BOOL)sf_isAudioAccessory
{
  return MGGetSInt32Answer() == 7;
}

- (BOOL)sf_isiPod
{
  return MGGetSInt32Answer() == 2;
}

- (BOOL)sf_hasHardwareHomeButton
{
  return MGGetSInt32Answer() != 2;
}

- (uint64_t)sf_isCarrierInstall
{
  if (sf_isCarrierInstall___onceToken != -1)
    dispatch_once(&sf_isCarrierInstall___onceToken, &__block_literal_global_10);
  return sf_isCarrierInstall___carrierInstall;
}

- (id)sf_serialNumber
{
  void *v0;
  void *v1;

  +[SFDeviceRegulatoryAttributes currentDeviceAttributes](SFDeviceRegulatoryAttributes, "currentDeviceAttributes");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "serialNumber");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

- (uint64_t)sf_yearOfManufacture
{
  void *v0;
  uint64_t v1;

  +[SFDeviceRegulatoryAttributes currentDeviceAttributes](SFDeviceRegulatoryAttributes, "currentDeviceAttributes");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "yearForWeekOfManufacture");

  return v1;
}

- (uint64_t)sf_weekOfManufacture
{
  void *v0;
  uint64_t v1;

  +[SFDeviceRegulatoryAttributes currentDeviceAttributes](SFDeviceRegulatoryAttributes, "currentDeviceAttributes");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "weekOfManufacture");

  return v1;
}

- (id)sf_monthAndYearOfManufacture
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];
  _QWORD v9[3];

  v9[2] = *MEMORY[0x24BDAC8D0];
  v8[0] = CFSTR("year");
  v0 = (void *)MEMORY[0x24BDD16E0];
  +[SFDeviceRegulatoryAttributes currentDeviceAttributes](SFDeviceRegulatoryAttributes, "currentDeviceAttributes");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "numberWithUnsignedInteger:", objc_msgSend(v1, "yearOfManufacture"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = CFSTR("month");
  v9[0] = v2;
  v3 = (void *)MEMORY[0x24BDD16E0];
  +[SFDeviceRegulatoryAttributes currentDeviceAttributes](SFDeviceRegulatoryAttributes, "currentDeviceAttributes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberWithUnsignedInteger:", objc_msgSend(v4, "monthOfManufacture"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, v8, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)sf_configString
{
  if (sf_configString_onceToken != -1)
    dispatch_once(&sf_configString_onceToken, &__block_literal_global_29);
  return (id)sf_configString___config;
}

- (id)sf_colorCodedSerialNumber
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v2 = objc_alloc(MEMORY[0x24BDD1458]);
  objc_msgSend(a1, "sf_serialNumber");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithString:", v3);

  if (v4)
  {
    if (objc_msgSend(v4, "length") == 12)
    {
      v5 = (void *)MEMORY[0x24BDD16A8];
      objc_msgSend(v4, "string");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "stringWithString:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "insertString:atIndex:", CFSTR(" "), 3);
      objc_msgSend(v7, "insertString:atIndex:", CFSTR(" "), 6);
      objc_msgSend(v7, "insertString:atIndex:", CFSTR(" "), 10);
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1688]), "initWithString:", v7);
      v9 = *MEMORY[0x24BDF6600];
      objc_msgSend(MEMORY[0x24BDF6950], "orangeColor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addAttribute:value:range:", v9, v10, 0, 3);

      objc_msgSend(MEMORY[0x24BDF6950], "purpleColor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addAttribute:value:range:", v9, v11, 4, 1);

      objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.0, 0.5, 0.0, 1.0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addAttribute:value:range:", v9, v12, 5, 1);

      objc_msgSend(MEMORY[0x24BDF6950], "brownColor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addAttribute:value:range:", v9, v13, 7, 3);

      objc_msgSend(MEMORY[0x24BDF6950], "blueColor");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addAttribute:value:range:", v9, v14, 11, 4);

      v15 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD1458]), "initWithAttributedString:", v8);
    }
    else
    {
      v15 = v4;
    }
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (id)sf_deviceSubTypeString
{
  if (sf_deviceSubTypeString_onceToken != -1)
    dispatch_once(&sf_deviceSubTypeString_onceToken, &__block_literal_global_39);
  return (id)sf_deviceSubTypeString_deviceSubTypeString;
}

- (id)sf_screenClassString
{
  int v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  void *v8;

  v0 = MGGetSInt32Answer();
  if (sf_screenClassString_token != -1)
    dispatch_once(&sf_screenClassString_token, &__block_literal_global_72);
  v1 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend((id)sf_screenClassString_screenClass, "objectForKeyedSubscript:", CFSTR("main-screen-width"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)sf_screenClassString_screenClass, "objectForKeyedSubscript:", CFSTR("main-screen-height"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)sf_screenClassString_screenClass, "objectForKeyedSubscript:", CFSTR("main-screen-scale"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)sf_screenClassString_screenClass, "objectForKeyedSubscript:", CFSTR("main-screen-pitch"));
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  v7 = &stru_24C398458;
  if (v0 == -1)
    v7 = CFSTR(" (Invalid)");
  objc_msgSend(v1, "stringWithFormat:", CFSTR("%@x%@x%@x%@%@"), v2, v3, v4, v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)sf_regionCode
{
  if (sf_regionCode___onceToken != -1)
    dispatch_once(&sf_regionCode___onceToken, &__block_literal_global_86);
  return (id)sf_regionCode___regionCode;
}

- (id)sf_plantCode
{
  void *v0;
  void *v1;

  +[SFDeviceRegulatoryAttributes currentDeviceAttributes](SFDeviceRegulatoryAttributes, "currentDeviceAttributes");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "plantCode");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

- (id)sf_udidString
{
  return (id)MGCopyAnswer();
}

- (uint64_t)sf_deviceSupportsDisplayZoom
{
  if (sf_deviceSupportsDisplayZoom_onceToken != -1)
    dispatch_once(&sf_deviceSupportsDisplayZoom_onceToken, &__block_literal_global_91);
  return sf_deviceSupportsDisplayZoom__supportsDisplayZoom;
}

- (id)sf_productType
{
  return (id)MGCopyAnswer();
}

- (id)sf_deviceType
{
  return (id)MGCopyAnswer();
}

- (id)sf_regulatoryDeviceVariant
{
  return (id)MGCopyAnswer();
}

- (id)sf_serialNumberQRImage
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __47__UIDevice_SFAdditions__sf_serialNumberQRImage__block_invoke;
  block[3] = &unk_24C397B80;
  block[4] = a1;
  if (sf_serialNumberQRImage_onceToken != -1)
    dispatch_once(&sf_serialNumberQRImage_onceToken, block);
  return (id)sf_serialNumberQRImage_qrCodeImageByTransform;
}

- (uint64_t)sf_inRetailKioskMode
{
  return _os_feature_enabled_impl();
}

@end
