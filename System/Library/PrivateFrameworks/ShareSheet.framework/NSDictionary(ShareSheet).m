@implementation NSDictionary(ShareSheet)

- (id)sh_removingUnsupportedTypes
{
  void *v2;
  unint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v16;
  void *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", a1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "objectForKey:", CFSTR("attachments"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v2, "mutableCopy");
  if (objc_msgSend(v2, "count"))
  {
    v3 = 0;
    v18 = v2;
    do
    {
      objc_msgSend(v2, "objectAtIndex:", v3);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectForKey:", CFSTR("registeredTypeIdentifiers"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 0u;
      v20 = 0u;
      v21 = 0u;
      v22 = 0u;
      v7 = v5;
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      v9 = v7;
      if (v8)
      {
        v10 = v8;
        v11 = 0;
        v12 = *(_QWORD *)v20;
        do
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v20 != v12)
              objc_enumerationMutation(v7);
            v14 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
            if (objc_msgSend(v14, "isEqualToString:", CFSTR("com.apple.group-activities.activity")))
            {
              objc_msgSend(v6, "removeObject:", v14);
              v11 = 1;
            }
          }
          v10 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        }
        while (v10);

        v2 = v18;
        if ((v11 & 1) == 0)
          goto LABEL_15;
        v9 = (void *)objc_msgSend(v4, "mutableCopy");
        objc_msgSend(v9, "setObject:forKey:", v6, CFSTR("registeredTypeIdentifiers"));
        objc_msgSend(v17, "setObject:atIndexedSubscript:", v9, v3);
      }

LABEL_15:
      ++v3;
    }
    while (v3 < objc_msgSend(v2, "count"));
  }
  objc_msgSend(v16, "setObject:forKey:", v17, CFSTR("attachments"));

  return v16;
}

@end
