@implementation CWFInterface(WiFiKit)

- (id)supported20MHzChannels
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  id v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend(a1, "hardwareSupportedChannels", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v8, "width") == 20)
          objc_msgSend(v2, "addObject:", v8);
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }

  if (objc_msgSend(v2, "count"))
    v9 = v2;
  else
    v9 = 0;
  v10 = v9;

  return v10;
}

- (uint64_t)updateKnownNetworkProfile:()WiFiKit OSSpecificAttributes:error:
{
  id v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;

  v8 = a3;
  v9 = a4;
  if (v9)
  {
    objc_msgSend(v8, "OSSpecificAttributes");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (id)objc_msgSend(v10, "mutableCopy");

    if (!v11)
      v11 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    objc_msgSend(v11, "addEntriesFromDictionary:", v9);
    objc_msgSend(v8, "setOSSpecificAttributes:", v11);

  }
  v12 = objc_msgSend(a1, "updateKnownNetworkProfile:properties:error:", v8, 0, a5);

  return v12;
}

- (unint64_t)deviceSupports6E
{
  void *v2;
  unint64_t v3;

  objc_msgSend(a1, "capabilities");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "indexOfObject:", &unk_24DC5D690) == 0x7FFFFFFFFFFFFFFFLL)
    v3 = 0;
  else
    v3 = ((unint64_t)objc_msgSend(a1, "countryBandSupport") >> 2) & 1;

  return v3;
}

@end
