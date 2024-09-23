@implementation NSSet(WiFiKit)

- (id)hs20Networks
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("isHotspot20 == YES"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "filteredSetUsingPredicate:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)scanRecordWithSSID:()WiFiKit
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("ssid == %@"), a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "filteredSetUsingPredicate:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v5, "anyObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)hiddenNetworkProfiles
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("isHidden == YES"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "filteredSetUsingPredicate:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)logStringWithScanRecords
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  __CFString *v12;
  uint64_t v13;
  void *v14;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v16 = a1;
  objc_msgSend(a1, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v18;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v18 != v7)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v8);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v10 = v9;
          objc_msgSend(v10, "ssid");
          v11 = objc_claimAutoreleasedReturnValue();
          if (v11)
            v12 = (__CFString *)v11;
          else
            v12 = CFSTR("NULL");
          objc_msgSend(v10, "channel");
          v13 = objc_claimAutoreleasedReturnValue();

          if (v13)
            v14 = (void *)v13;
          else
            v14 = &unk_24DC5D948;
          objc_msgSend(v2, "appendFormat:", CFSTR("%@ (%d)"), v12, objc_msgSend(v14, "intValue"));
          if (++v6 < (unint64_t)objc_msgSend(v16, "count"))
            objc_msgSend(v2, "appendString:", CFSTR(", "));

        }
        ++v8;
      }
      while (v5 != v8);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v5);
  }

  return v2;
}

@end
