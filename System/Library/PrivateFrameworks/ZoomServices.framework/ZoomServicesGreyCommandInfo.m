@implementation ZoomServicesGreyCommandInfo

+ (id)defaultCustomizeGestures
{
  _QWORD v3[4];
  _QWORD v4[5];

  v4[4] = *MEMORY[0x24BDAC8D0];
  v3[0] = &unk_24D477040;
  v3[1] = &unk_24D477070;
  v4[0] = &unk_24D477058;
  v4[1] = &unk_24D477088;
  v3[2] = &unk_24D4770A0;
  v3[3] = &unk_24D4770B8;
  v4[2] = &unk_24D477058;
  v4[3] = &unk_24D477058;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v4, v3, 4);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)defaultActions
{
  return &unk_24D477100;
}

+ (id)nameForAction:(unint64_t)a3
{
  if (a3 > 3)
    return 0;
  else
    return off_24D475900[a3];
}

+ (id)symbolNameForAction:(unint64_t)a3
{
  if (a3 > 3)
    return 0;
  else
    return off_24D475920[a3];
}

+ (BOOL)isZoomGreyFeatureOn
{
  char v2;
  void *v3;
  void *v4;
  char v5;

  v2 = _os_feature_enabled_impl();
  objc_msgSend((id)objc_opt_class(), "_pairedDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", CFSTR("1FD8E157-2B7C-45B6-B939-FFB8BE14E27F"));
  v5 = objc_msgSend(v3, "supportsCapability:", v4);

  return v2 & v5;
}

+ (id)_pairedDevice
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(MEMORY[0x24BE6B4E0], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE6B4E0], "activePairedDeviceSelectorBlock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getAllDevicesWithArchivedAltAccountDevicesMatching:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "valueForProperty:", *MEMORY[0x24BE6B348]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "BOOLValue"))
    v7 = 0;
  else
    v7 = v5;
  v8 = v7;

  return v8;
}

@end
