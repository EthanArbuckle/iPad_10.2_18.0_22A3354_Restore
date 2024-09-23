@implementation NSDictionary(HKSPSleep)

- (id)hksp_dictionaryByFilteringKeys:()HKSPSleep
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __58__NSDictionary_HKSPSleep__hksp_dictionaryByFilteringKeys___block_invoke;
  v8[3] = &unk_1E4E3C800;
  v9 = v4;
  v5 = v4;
  objc_msgSend(a1, "na_filter:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)hksp_computeDiffFromDictionary:()HKSPSleep
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  objc_msgSend(v5, "allKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "allKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setByAddingObjectsFromArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "hksp_computeDiffFromDictionary:keysToDiff:", v5, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (HKSPDictionaryDiff)hksp_computeDiffFromDictionary:()HKSPSleep keysToDiff:
{
  id v6;
  id v7;
  HKSPDictionaryDiff *v8;

  v6 = a4;
  v7 = a3;
  v8 = -[HKSPDictionaryDiff initWithOriginalDictionary:updatedDictionary:keysToDiff:]([HKSPDictionaryDiff alloc], "initWithOriginalDictionary:updatedDictionary:keysToDiff:", v7, a1, v6);

  return v8;
}

- (uint64_t)hksp_hash
{
  uint64_t v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v8 = objc_msgSend(a1, "hash");
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __36__NSDictionary_HKSPSleep__hksp_hash__block_invoke;
  v4[3] = &unk_1E4E3C828;
  v4[4] = &v5;
  objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:", v4);
  v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

@end
