@implementation NSDictionary(SCRCDictionaryExtras)

- (void)scrc_deepMutableCopyWithZone:()SCRCDictionaryExtras
{
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  int v14;
  uint64_t v15;
  id v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v5 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCED8], "allocWithZone:"), "initWithCapacity:", objc_msgSend(a1, "count"));
  if (v5)
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v6 = a1;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v19 != v9)
            objc_enumerationMutation(v6);
          v11 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
          objc_msgSend(v6, "objectForKey:", v11, (_QWORD)v18);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          SCRCDeepMutableCopyClasses();
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "containsObjectClass:", v12);

          if (v14)
          {
            v15 = objc_msgSend(v12, "scrc_deepMutableCopyWithZone:", a3);

            v12 = (void *)v15;
          }
          objc_msgSend(v5, "setObject:forKey:", v12, v11);

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v8);
    }

    v16 = v5;
  }

  return v5;
}

@end
