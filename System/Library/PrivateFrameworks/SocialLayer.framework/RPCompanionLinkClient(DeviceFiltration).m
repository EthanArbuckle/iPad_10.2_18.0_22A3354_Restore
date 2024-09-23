@implementation RPCompanionLinkClient(DeviceFiltration)

- (id)sl_phoneAndPadDevices
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id obj;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  objc_msgSend(a1, "activeDevices");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v15 != v5)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v7, "model");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v8, "rangeOfString:", CFSTR("iPad")) != 0x7FFFFFFFFFFFFFFFLL)
        {

LABEL_10:
          objc_msgSend(v2, "addObject:", v7);
          continue;
        }
        objc_msgSend(v7, "model");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "rangeOfString:", CFSTR("iPhone"));

        if (v10 != 0x7FFFFFFFFFFFFFFFLL)
          goto LABEL_10;
      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v4);
  }

  v11 = (void *)objc_msgSend(v2, "copy");
  return v11;
}

@end
