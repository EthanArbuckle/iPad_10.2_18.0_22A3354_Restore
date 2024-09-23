@implementation PSSpecifier(STStorageAppHeaderCell)

- (uint64_t)setVersionLabelEnabled:()STStorageAppHeaderCell
{
  if (a3)
    return objc_msgSend(a1, "removePropertyForKey:", CFSTR("stVersionDisabled"));
  else
    return objc_msgSend(a1, "setProperty:forKey:", MEMORY[0x24BDBD1C8], CFSTR("stVersionDisabled"));
}

- (uint64_t)versionLabelEnabled
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "propertyForKey:", CFSTR("stVersionDisabled"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1)
    v3 = objc_msgSend(v1, "BOOLValue") ^ 1;
  else
    v3 = 1;

  return v3;
}

@end
