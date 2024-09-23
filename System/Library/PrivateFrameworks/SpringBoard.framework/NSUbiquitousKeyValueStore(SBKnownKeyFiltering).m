@implementation NSUbiquitousKeyValueStore(SBKnownKeyFiltering)

+ (void)load
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__NSUbiquitousKeyValueStore_SBKnownKeyFiltering__load__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (load_onceToken != -1)
    dispatch_once(&load_onceToken, block);
}

- (void)sb_setObject:()SBKnownKeyFiltering forKey:
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0CB3A38], "defaultStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 == a1)
  {
    SBLogCommon();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      -[NSUbiquitousKeyValueStore(SBKnownKeyFiltering) sb_setObject:forKey:].cold.1((uint64_t)v7, v9);

  }
  objc_msgSend(a1, "sb_setObject:forKey:", v6, v7);

}

- (void)sb_setObject:()SBKnownKeyFiltering forKey:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_fault_impl(&dword_1D0540000, a2, OS_LOG_TYPE_FAULT, "NSUbiquitousKeyValueStore setObject: with invalid key: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end
