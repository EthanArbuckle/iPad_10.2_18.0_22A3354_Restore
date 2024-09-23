@implementation MakeConversionHandler

id __MakeConversionHandler_block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  float v13;
  float v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id obj;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(a2, "mutableCopy");
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  obj = *(id *)(a1 + 32);
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v24;
    v7 = *(_QWORD *)off_1E1678D90;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v24 != v6)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("_UITextFormattingSizeAttributeName"));
        v11 = *(void **)(a1 + 32);
        if (v10)
        {
          objc_msgSend(v11, "valueForKey:", CFSTR("_UITextFormattingSizeAttributeName"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "floatValue");
          v14 = v13;

          objc_msgSend(v3, "valueForKey:", v7);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = v15;
          if (v15)
          {
            objc_msgSend(v15, "fontWithSize:", v14);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v3, "setValue:forKey:", v17, v7);

          }
        }
        else
        {
          objc_msgSend(v11, "valueForKey:", v9);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0C99E38], "null");
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          if (v18 == v19)
          {
            objc_msgSend(v3, "removeObjectForKey:", v9);
          }
          else
          {
            objc_msgSend(*(id *)(a1 + 32), "valueForKey:", v9);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v3, "setValue:forKey:", v20, v9);

          }
        }
      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v5);
  }

  return v3;
}

@end
