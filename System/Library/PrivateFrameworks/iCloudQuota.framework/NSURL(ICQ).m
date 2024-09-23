@implementation NSURL(ICQ)

- (uint64_t)icq_isICQLaunchURL
{
  void *v1;
  void *v2;
  void *v3;
  char v4;
  uint64_t v5;
  void *v6;
  char v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0CB3998], "componentsWithURL:resolvingAgainstBaseURL:", a1, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scheme");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("icq")) & 1) == 0)
  {

    goto LABEL_5;
  }
  objc_msgSend(v2, "host");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v1, "isEqualToString:", CFSTR("launch"));

  if ((v4 & 1) == 0)
  {
LABEL_5:
    objc_msgSend(v2, "host");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("icq.icloud.com"));
    if ((v7 & 1) != 0
      || (objc_msgSend(v2, "host"),
          v1 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v1, "isEqualToString:", CFSTR("icq.apple.com"))))
    {
      objc_msgSend(v2, "path");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v8, "isEqualToString:", CFSTR("/launch"));

      if ((v7 & 1) != 0)
        goto LABEL_11;
    }
    else
    {
      v5 = 0;
    }

LABEL_11:
    goto LABEL_12;
  }
  v5 = 1;
LABEL_12:

  return v5;
}

- (id)icq_URLByAppendingQueryItems:()ICQ
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = (void *)MEMORY[0x1E0CB3998];
  v5 = a3;
  objc_msgSend(v4, "componentsWithURL:resolvingAgainstBaseURL:", a1, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0C99DE8];
  objc_msgSend(v6, "queryItems");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "arrayWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "addObjectsFromArray:", v5);
  objc_msgSend(v6, "setQueryItems:", v9);
  objc_msgSend(v6, "URL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)icq_URLByAppendingQueryParamName:()ICQ value:
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v6 = (void *)MEMORY[0x1E0CB3998];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "componentsWithURL:resolvingAgainstBaseURL:", a1, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", v8, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x1E0C99DE8];
  objc_msgSend(v9, "queryItems");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "arrayWithArray:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "addObject:", v10);
  objc_msgSend(v9, "setQueryItems:", v13);
  objc_msgSend(v9, "URL");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)icq_queryItemForName:()ICQ
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  char v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3998], "componentsWithURL:resolvingAgainstBaseURL:", a1, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  objc_msgSend(v5, "queryItems", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v10, "name");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqualToString:", v4);

        if ((v12 & 1) != 0)
        {
          v7 = v10;
          goto LABEL_11;
        }
      }
      v7 = (id)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

  return v7;
}

@end
