@implementation SSMutableURLRequestProperties(RadioRequestAdditions)

+ (uint64_t)newForRadioRequestURL:()RadioRequestAdditions
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v4 = (void *)MEMORY[0x24BEB1D88];
  v5 = a3;
  objc_msgSend(v4, "defaultStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "activeAccount");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "uniqueIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(a1, "newForRadioRequestURL:accountUniqueIdentifier:", v5, v8);

  return v9;
}

+ (id)newForRadioRequestURL:()RadioRequestAdditions accountUniqueIdentifier:
{
  id v5;
  objc_class *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v5 = a4;
  v6 = (objc_class *)MEMORY[0x24BEB1F30];
  v7 = a3;
  v8 = objc_alloc_init(v6);
  objc_msgSend(v8, "setHTTPMethod:", CFSTR("POST"));
  objc_msgSend(v8, "setURL:", v7);

  objc_msgSend(v8, "setITunesStoreRequest:", 1);
  objc_msgSend(v8, "setShouldDisableCellularFallback:", CFPreferencesGetAppBooleanValue(CFSTR("RadioUseCellularData"), CFSTR("com.apple.mobileipod"), 0) == 0);
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%llu"), objc_msgSend(v5, "longLongValue"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setValue:forHTTPHeaderField:", v9, *MEMORY[0x24BEB2550]);

  }
  SSVDefaultUserAgent();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
    objc_msgSend(v8, "setValue:forHTTPHeaderField:", v10, *MEMORY[0x24BEB2518]);
  objc_msgSend(MEMORY[0x24BEB1DE8], "currentDevice");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "storeFrontIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
    objc_msgSend(v8, "setValue:forHTTPHeaderField:", v12, *MEMORY[0x24BEB2598]);
  if (newForRadioRequestURL_accountUniqueIdentifier____once != -1)
    dispatch_once(&newForRadioRequestURL_accountUniqueIdentifier____once, &__block_literal_global_81);
  if (newForRadioRequestURL_accountUniqueIdentifier____deviceGUID)
    objc_msgSend(v8, "setValue:forHTTPHeaderField:", newForRadioRequestURL_accountUniqueIdentifier____deviceGUID, CFSTR("X-Guid"));

  return v8;
}

@end
