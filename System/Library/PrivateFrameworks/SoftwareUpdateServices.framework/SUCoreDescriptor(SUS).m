@implementation SUCoreDescriptor(SUS)

- (uint64_t)isRevokedSplat
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "softwareUpdateAssetType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isEqualToString:", *MEMORY[0x24BEAE958]))
    v3 = objc_msgSend(a1, "revoked");
  else
    v3 = 0;

  return v3;
}

- (uint64_t)isEqualToDescriptor:()SUS
{
  id v4;
  int v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v4 = a3;
  if (objc_msgSend(a1, "isEqual:", v4))
  {
    v5 = objc_msgSend(a1, "rampEnabled");
    if (v5 == objc_msgSend(v4, "rampEnabled"))
    {
      v6 = objc_msgSend(a1, "granularlyRamped");
      if (v6 == objc_msgSend(v4, "granularlyRamped"))
      {
        v14 = 1;
        goto LABEL_6;
      }
    }
    objc_msgSend(a1, "rampEnabled");
    objc_msgSend(a1, "granularlyRamped");
    objc_msgSend(v4, "rampEnabled");
    objc_msgSend(v4, "granularlyRamped");
    SULogInfo(CFSTR("%s: ramping control flags changed (%d, %d) -> (%d, %d)"), v7, v8, v9, v10, v11, v12, v13, (uint64_t)"-[SUCoreDescriptor(SUS) isEqualToDescriptor:]");
  }
  v14 = 0;
LABEL_6:

  return v14;
}

@end
