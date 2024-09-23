@implementation MTDBUtil

+ (BOOL)isSupportedUrlString:(id)a3
{
  id v3;
  void *v4;
  unint64_t v5;
  void *v6;
  unint64_t v7;
  void *v8;
  unint64_t v9;
  BOOL v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  unint64_t v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (!objc_msgSend(v3, "length"))
    goto LABEL_26;
  objc_msgSend(v3, "lowercaseString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "hasPrefix:", CFSTR("https://")))
  {
    v5 = objc_msgSend(v3, "length");

    if (v5 > 8)
      goto LABEL_12;
  }
  else
  {

  }
  objc_msgSend(v3, "lowercaseString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "hasPrefix:", CFSTR("http://")))
  {
    v7 = objc_msgSend(v3, "length");

    if (v7 > 7)
      goto LABEL_12;
  }
  else
  {

  }
  objc_msgSend(v3, "lowercaseString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "hasPrefix:", CFSTR("file://")))
  {
    v9 = objc_msgSend(v3, "length");

    if (v9 > 7)
    {
LABEL_12:
      v10 = 1;
      goto LABEL_29;
    }
  }
  else
  {

  }
  if ((unint64_t)objc_msgSend(v3, "length") < 4)
  {
LABEL_26:
    v10 = 0;
    goto LABEL_29;
  }
  if (!isSupportedUrlString____url_types)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "infoDictionary");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = (void *)objc_opt_new();
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    objc_msgSend(v12, "objectForKey:", CFSTR("CFBundleURLTypes"), 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v28 != v17)
            objc_enumerationMutation(v14);
          objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * i), "objectForKey:", CFSTR("CFBundleURLSchemes"));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "addObjectsFromArray:", v19);

        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      }
      while (v16);
    }

    v20 = objc_msgSend(v13, "copy");
    v21 = (void *)isSupportedUrlString____url_types;
    isSupportedUrlString____url_types = v20;

  }
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v3);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "scheme");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "lowercaseString");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend((id)isSupportedUrlString____url_types, "containsObject:", v24))
  {
    v25 = objc_msgSend(v3, "length");
    v10 = v25 > objc_msgSend(v24, "length") + 3;
  }
  else
  {
    v10 = 0;
  }

LABEL_29:
  return v10;
}

@end
