@implementation NSDictionary(QueryParameterSupport)

- (__CFString)asQueryParameterString
{
  uint64_t v2;
  uint64_t v3;
  char v4;
  uint64_t i;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  id obj;
  uint64_t v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(a1, "count"))
    return &stru_1E38A53C8;
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  objc_msgSend(a1, "allKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v2)
  {
    v3 = v2;
    v17 = *(_QWORD *)v20;
    v4 = 1;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v20 != v17)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0CB3500], "URLQueryAllowedCharacterSet");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "stringByAddingPercentEncodingWithAllowedCharacters:", v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "objectForKey:", v6);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3500], "URLQueryAllowedCharacterSet");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "stringByAddingPercentEncodingWithAllowedCharacters:", v10);
        v11 = objc_claimAutoreleasedReturnValue();
        v12 = (void *)v11;
        if ((v4 & 1) != 0)
          v13 = CFSTR("?%@=%@");
        else
          v13 = CFSTR("&%@=%@");
        objc_msgSend(v18, "appendFormat:", v13, v8, v11);

        v4 = 0;
      }
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      v4 = 0;
    }
    while (v3);
  }

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithString:", v18);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return (__CFString *)v14;
}

@end
