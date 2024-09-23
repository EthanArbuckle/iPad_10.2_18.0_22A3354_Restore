@implementation NSError(HKSPSleep)

- (BOOL)hksp_isHealthDatabaseInaccessibleError
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a1, "domain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0CB4E20]))
    v3 = objc_msgSend(a1, "code") == 6;
  else
    v3 = 0;

  return v3;
}

@end
