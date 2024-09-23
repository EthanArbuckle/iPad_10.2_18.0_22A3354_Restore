@implementation NSURLComponents(TVRMSAdditions)

- (id)rms_componentsByAddingQueryParameters:()TVRMSAdditions
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, uint64_t, uint64_t);
  void *v17;
  id v18;
  _QWORD v19[3];

  v19[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)objc_msgSend(a1, "copy");
  v6 = (void *)objc_opt_new();
  v14 = MEMORY[0x24BDAC760];
  v15 = 3221225472;
  v16 = __73__NSURLComponents_TVRMSAdditions__rms_componentsByAddingQueryParameters___block_invoke;
  v17 = &unk_24DCD6E28;
  v7 = v6;
  v18 = v7;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", &v14);

  objc_msgSend(v7, "componentsJoinedByString:", CFSTR("&"), v14, v15, v16, v17);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "query");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v5, "query");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v10;
    v19[1] = v8;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v19, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "componentsJoinedByString:", CFSTR("&"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setQuery:", v12);

  }
  else
  {
    objc_msgSend(v5, "setQuery:", v8);
  }

  return v5;
}

@end
