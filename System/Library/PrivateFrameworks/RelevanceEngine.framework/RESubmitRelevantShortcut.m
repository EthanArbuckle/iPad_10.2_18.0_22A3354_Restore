@implementation RESubmitRelevantShortcut

void __RESubmitRelevantShortcut_block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;
  __CFString *v6;
  __CFString *v7;
  int v8;
  __CFString **v9;
  uint64_t v10;
  void *v11;
  __CFString *v12;
  __CFString *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  void *v20;
  void *v21;
  __CFString *v22;
  __CFString *v23;
  void *v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  const __CFString *v30;
  uint64_t v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "generateMetrics");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(*(id *)(a1 + 32), "bundleIdentifier");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
    v6 = (__CFString *)v4;
  else
    v6 = CFSTR("unknown");
  v7 = v6;

  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("bundleID"));
  v8 = objc_msgSend(*(id *)(a1 + 32), "isLocalDonation");
  v9 = RELocal;
  if (!v8)
    v9 = RERemote;
  v22 = *v9;
  objc_msgSend(v3, "setObject:forKeyedSubscript:");
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("shortcutType"));
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (v10)
    v12 = (__CFString *)v10;
  else
    v12 = CFSTR("unknown");
  v13 = v12;

  v23 = v13;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("shortcutType"));
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("intentType"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("intentType"));
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("imageSource"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:");
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("subtitleSource"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:");
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("relevanceProvider"));
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v15 = (id)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
  if (v16)
  {
    v17 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v27 != v17)
          objc_enumerationMutation(v15);
        v19 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i);
        v30 = CFSTR("relevanceProvider");
        v31 = v19;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        AnalyticsSendEvent();

      }
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
    }
    while (v16);
  }

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v15, "count"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("relevanceProviderCount"));
  AnalyticsSendEvent();

}

@end
