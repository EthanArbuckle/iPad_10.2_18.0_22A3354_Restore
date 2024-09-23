@implementation AVMediaSelection(TVPAdditions)

- (id)tvp_description
{
  void *v2;
  uint64_t v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  id v14;
  id obj;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  id v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "asset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0;
  v3 = objc_msgSend(v2, "statusOfValueForKey:error:", CFSTR("availableMediaCharacteristicsWithMediaSelectionOptions"), &v20);
  v4 = v20;
  if (v3 == 2
    || (v5 = 0, v3 == 3)
    && (v5 = 0,
        objc_msgSend(MEMORY[0x24BDB2378], "tvp_shouldIgnoreLoadFailureForKey:error:logObject:", CFSTR("availableMediaCharacteristicsWithMediaSelectionOptions"), v4, 0)))
  {
    v14 = v4;
    v5 = objc_alloc_init(MEMORY[0x24BDD16A8]);
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    objc_msgSend(v2, "availableMediaCharacteristicsWithMediaSelectionOptions");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v17 != v8)
            objc_enumerationMutation(obj);
          v10 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
          objc_msgSend(v2, "tvp_mediaSelectionGroupForMediaCharacteristic:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1, "selectedMediaOptionInMediaSelectionGroup:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "appendFormat:", CFSTR("%@: %@ "), v10, v12);

        }
        v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
      }
      while (v7);
    }

    v4 = v14;
  }

  return v5;
}

@end
