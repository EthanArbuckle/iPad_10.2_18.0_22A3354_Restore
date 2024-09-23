@implementation LSApplicationRecord(SBHSimpleApplicationDataSource)

- (uint64_t)sbh_isValidType
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "typeForInstallMachinery");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0CA5830]) & 1) != 0)
    v2 = 1;
  else
    v2 = objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0CA5820]);

  return v2;
}

@end
