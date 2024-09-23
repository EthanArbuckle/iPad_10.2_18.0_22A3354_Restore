@implementation NSSet(WiFiKitUI)

- (id)instantHotspotNetworks
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("isInstantHotspot == YES"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "filteredSetUsingPredicate:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)infrastructureNetworks
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("isInstantHotspot == NO && isAdhoc == NO && isUnconfiguredAccessory == NO && isPopular == NO && isKnown == NO"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "filteredSetUsingPredicate:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)adhocNetworks
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("isAdhoc == YES"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "filteredSetUsingPredicate:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)unconfiguredNetworks
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("isUnconfiguredAccessory == YES"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "filteredSetUsingPredicate:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)popularNetworks
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("isKnown == NO && isInstantHotspot == NO && isAdhoc == NO && isUnconfiguredAccessory == NO && isPopular == YES"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "filteredSetUsingPredicate:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)knownNetworks
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("isKnown == YES || isInstantHotspot == YES"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "filteredSetUsingPredicate:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
