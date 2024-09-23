@implementation _HKBehavior(SleepHealthUI)

- (id)hksp_systemImageNameForCurrentDevice
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a1, "currentDeviceProductType");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEC3F8], "_typeWithDeviceModelCode:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0D3A838];
  objc_msgSend(v2, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "symbolForTypeIdentifier:error:", v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)hksp_systemImageNameForActivePairedDevice
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a1, "hksp_activePairedDeviceProductType");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (v1)
  {
    objc_msgSend(MEMORY[0x1E0CEC3F8], "_typeWithDeviceModelCode:", v1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = (void *)MEMORY[0x1E0D3A838];
    objc_msgSend(v2, "identifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "symbolForTypeIdentifier:error:", v4, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (uint64_t)hksp_activeCompanionVariant
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "hksp_systemImageNameForActivePairedDevice");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1)
  {
    if ((objc_msgSend(v1, "isEqualToString:", CFSTR("iphone.gen1")) & 1) != 0)
    {
      v3 = 0;
    }
    else if ((objc_msgSend(v2, "isEqualToString:", CFSTR("iphone.gen2")) & 1) != 0)
    {
      v3 = 1;
    }
    else if (objc_msgSend(v2, "isEqualToString:", CFSTR("iphone.gen3")))
    {
      v3 = 2;
    }
    else
    {
      v3 = 3;
    }
  }
  else
  {
    v3 = 3;
  }

  return v3;
}

@end
