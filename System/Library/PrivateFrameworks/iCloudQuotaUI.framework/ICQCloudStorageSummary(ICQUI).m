@implementation ICQCloudStorageSummary(ICQUI)

- (id)icqui_AAUIiCloudMediaUsageInfo
{
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v2 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  objc_msgSend(a1, "mediaStorage", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v23;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v23 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v7);
        objc_msgSend(MEMORY[0x24BEBDAB0], "currentTraitCollection");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v9, "userInterfaceStyle") == 2)
        {
          objc_msgSend(v8, "displayColorDark");
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          if (v10)
          {
            v11 = (void *)MEMORY[0x24BEBD4B8];
            objc_msgSend(v8, "displayColorDark");
            v12 = objc_claimAutoreleasedReturnValue();
            goto LABEL_11;
          }
        }
        else
        {

        }
        v11 = (void *)MEMORY[0x24BEBD4B8];
        objc_msgSend(v8, "displayColor");
        v12 = objc_claimAutoreleasedReturnValue();
LABEL_11:
        v13 = (void *)v12;
        objc_msgSend(v11, "icqui_colorWithHexString:", v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        v15 = objc_alloc(MEMORY[0x24BE04DB8]);
        objc_msgSend(v8, "mediaType");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "storageUsed");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "floatValue");
        v18 = (void *)objc_msgSend(v15, "initWithMediaType:representativeColor:bytesUsed:", v16, v14);

        objc_msgSend(v8, "displayLabel");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setDisplayLabel:", v19);

        objc_msgSend(v2, "addObject:", v18);
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v5);
  }

  v20 = (void *)objc_msgSend(v2, "copy");
  return v20;
}

@end
