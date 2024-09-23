@implementation NSDictionary(WLKHashingAdditions)

- (uint64_t)wlk_deepHash
{
  void *v1;
  void *v2;
  id v3;
  uint64_t v4;

  WLKSortDictionaries(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(MEMORY[0x1E0CB38B0], "propertyList:isValidForFormat:", v1, 100) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", CFSTR("WLKHashingAdditions - wlk_deepHash"), CFSTR("wlk_deepHash only supports property list object graphs"), 0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "raise");

  }
  objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v1, 100, 0, 0);
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v3, "bytes");
  objc_msgSend(v3, "length");
  v4 = CFHashBytes();

  return v4;
}

@end
