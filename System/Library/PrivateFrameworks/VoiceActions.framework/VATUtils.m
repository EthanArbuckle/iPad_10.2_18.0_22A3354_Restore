@implementation VATUtils

+ (id)formatFromTokens:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x24BDD16A8]);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v6)
  {
    v7 = v6;
    LOBYTE(v8) = 0;
    v9 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        if (objc_msgSend(v4, "length", (_QWORD)v17)
          && ((v8 & 1) != 0 || objc_msgSend(v11, "hasSpaceBefore")))
        {
          objc_msgSend(v4, "appendString:", CFSTR(" "));
        }
        objc_msgSend(v11, "tokenName");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "appendString:", v12);

        v8 = objc_msgSend(v11, "hasSpaceAfter");
        objc_msgSend(v4, "appendString:", CFSTR(" Confidence: "));
        v13 = (void *)MEMORY[0x24BDD16E0];
        objc_msgSend(v11, "confidence");
        objc_msgSend(v13, "numberWithDouble:");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "stringValue");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "appendString:", v15);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v7);

    if (v8)
      objc_msgSend(v4, "appendString:", CFSTR(" "));
  }
  else
  {

  }
  return v4;
}

@end
