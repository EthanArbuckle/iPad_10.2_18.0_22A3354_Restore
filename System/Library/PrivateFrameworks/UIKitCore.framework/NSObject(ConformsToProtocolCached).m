@implementation NSObject(ConformsToProtocolCached)

- (uint64_t)conformsToProtocolCached:()ConformsToProtocolCached
{
  id v4;
  _ConformsToProtocolCachedKey *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v4 = a3;
  if (qword_1ECD7E838 != -1)
    dispatch_once(&qword_1ECD7E838, &__block_literal_global_291);
  v5 = -[_ConformsToProtocolCachedKey initWithObject:protocol:]([_ConformsToProtocolCachedKey alloc], "initWithObject:protocol:", a1, v4);
  objc_msgSend((id)_MergedGlobals_1095, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = objc_msgSend(v6, "BOOLValue");
  }
  else
  {
    v8 = objc_msgSend(a1, "conformsToProtocol:", v4);
    v9 = (void *)_MergedGlobals_1095;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", v10, v5);

  }
  return v8;
}

@end
