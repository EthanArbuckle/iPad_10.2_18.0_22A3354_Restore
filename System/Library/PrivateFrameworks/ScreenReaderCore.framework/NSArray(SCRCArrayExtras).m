@implementation NSArray(SCRCArrayExtras)

- (void)scrc_deepMutableCopyWithZone:()SCRCArrayExtras
{
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  int v13;
  uint64_t v14;
  id v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v5 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCEB8], "allocWithZone:"), "initWithCapacity:", objc_msgSend(a1, "count"));
  if (v5)
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v6 = a1;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v18;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v18 != v9)
            objc_enumerationMutation(v6);
          v11 = *(id *)(*((_QWORD *)&v17 + 1) + 8 * v10);
          SCRCDeepMutableCopyClasses();
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "containsObjectClass:", v11, (_QWORD)v17);

          if (v13)
          {
            v14 = objc_msgSend(v11, "scrc_deepMutableCopyWithZone:", a3);

            v11 = (id)v14;
          }
          objc_msgSend(v5, "addObject:", v11);

          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v8);
    }

    v15 = v5;
  }

  return v5;
}

@end
