@implementation NSMutableSet(WFNetworkProfile)

- (uint64_t)replaceNetworkProfile:()WFNetworkProfile
{
  id v4;
  void *v5;
  NSObject *v7;
  os_log_type_t v8;
  int v9;
  const char *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(a1, "_equivalentExistingNetworkProfile:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(a1, "removeObject:", v5);
  }
  else
  {
    WFLogForCategory(0);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v7 && os_log_type_enabled(v7, v8))
    {
      v9 = 136315394;
      v10 = "-[NSMutableSet(WFNetworkProfile) replaceNetworkProfile:]";
      v11 = 2114;
      v12 = v4;
      _os_log_impl(&dword_219FC8000, v7, v8, "%s: no existing network matching profile %{public}@", (uint8_t *)&v9, 0x16u);
    }

  }
  objc_msgSend(a1, "addObject:", v4);

  return 1;
}

- (BOOL)removeNetworkProfile:()WFNetworkProfile
{
  id v4;
  void *v5;
  NSObject *v6;
  os_log_type_t v7;
  int v9;
  const char *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(a1, "_equivalentExistingNetworkProfile:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(a1, "removeObject:", v5);
  }
  else
  {
    WFLogForCategory(0);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v6 && os_log_type_enabled(v6, v7))
    {
      v9 = 136315394;
      v10 = "-[NSMutableSet(WFNetworkProfile) removeNetworkProfile:]";
      v11 = 2114;
      v12 = v4;
      _os_log_impl(&dword_219FC8000, v6, v7, "%s: no existing network matching profile %{public}@", (uint8_t *)&v9, 0x16u);
    }

  }
  return v5 != 0;
}

- (id)_equivalentExistingNetworkProfile:()WFNetworkProfile
{
  id v4;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__9;
  v15 = __Block_byref_object_dispose__9;
  v16 = 0;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __68__NSMutableSet_WFNetworkProfile___equivalentExistingNetworkProfile___block_invoke;
  v8[3] = &unk_24DC36040;
  v5 = v4;
  v9 = v5;
  v10 = &v11;
  objc_msgSend(a1, "enumerateObjectsUsingBlock:", v8);
  v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

@end
