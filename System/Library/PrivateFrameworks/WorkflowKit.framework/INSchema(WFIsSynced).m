@implementation INSchema(WFIsSynced)

- (uint64_t)isSyncedFromOtherDevice
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  NSSelectorFromString(CFSTR("_definitionFileURLs"));
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(a1, "valueForKey:", CFSTR("_definitionFileURLs"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  if (objc_msgSend(v2, "count"))
  {
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v3 = v2;
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v11;
      while (2)
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v11 != v6)
            objc_enumerationMutation(v3);
          if (!WFIsSyncedIntentDefinitionURL(*(void **)(*((_QWORD *)&v10 + 1) + 8 * v7)))
          {
            v8 = 0;
            goto LABEL_15;
          }
          ++v7;
        }
        while (v5 != v7);
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
        if (v5)
          continue;
        break;
      }
    }
    v8 = 1;
LABEL_15:

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

@end
