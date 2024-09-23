@implementation NSString(NSString_StringWithPositionalSpecifiersFormat)

+ (id)stringWithPositionalSpecifiersFormat:()NSString_StringWithPositionalSpecifiersFormat arguments:
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v20;
  void *v21;
  id obj;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  id v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v27 = 0;
  objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", CFSTR("%\\d\\$@"), 1, &v27);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v27;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", v5);
  v21 = v7;
  objc_msgSend(v7, "matchesInString:options:range:", v5, 0, 0, objc_msgSend(v5, "length"));
  obj = (id)objc_claimAutoreleasedReturnValue();
  v20 = v8;
  if (!v8)
  {
    if (obj)
    {
      v25 = 0u;
      v26 = 0u;
      v23 = 0u;
      v24 = 0u;
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v24;
        do
        {
          for (i = 0; i != v11; ++i)
          {
            if (*(_QWORD *)v24 != v12)
              objc_enumerationMutation(obj);
            v14 = objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * i), "range");
            objc_msgSend(v5, "substringWithRange:", v14, v15);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = (void *)objc_msgSend(v16, "mutableCopy");
            objc_msgSend(v17, "replaceOccurrencesOfString:withString:options:range:", CFSTR("%"), &stru_1E5F76FF8, 1, 0, objc_msgSend(v17, "length"));
            objc_msgSend(v17, "replaceOccurrencesOfString:withString:options:range:", CFSTR("$@"), &stru_1E5F76FF8, 1, 0, objc_msgSend(v17, "length"));
            objc_msgSend(v6, "objectAtIndexedSubscript:", (int)(objc_msgSend(v17, "intValue") - 1));
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "replaceOccurrencesOfString:withString:options:range:", v16, v18, 1, 0, objc_msgSend(v9, "length"));

          }
          v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
        }
        while (v11);
      }
    }
  }

  return v9;
}

@end
