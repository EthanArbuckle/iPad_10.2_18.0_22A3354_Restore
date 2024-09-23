@implementation NSURL(ICQUIAdditions)

+ (id)icqURLForIndex:()ICQUIAdditions
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v0 = (void *)MEMORY[0x24BDBCF48];
  v1 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringWithFormat:", CFSTR("%@://%@"), CFSTR("icq"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "URLWithString:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (uint64_t)icqIndex
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;

  objc_msgSend(a1, "scheme");
  v2 = objc_claimAutoreleasedReturnValue();
  if (!v2)
    return 0x7FFFFFFFFFFFFFFFLL;
  v3 = (void *)v2;
  objc_msgSend(a1, "scheme");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("icq")) & 1) == 0)
  {

    return 0x7FFFFFFFFFFFFFFFLL;
  }
  objc_msgSend(a1, "host");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    return 0x7FFFFFFFFFFFFFFFLL;
  objc_msgSend(a1, "host");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  objc_msgSend(MEMORY[0x24BDD17A8], "scannerWithString:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0x7FFFFFFFFFFFFFFFLL;
  if (objc_msgSend(v7, "scanInteger:", &v11))
  {
    v9 = objc_msgSend(v7, "scanLocation");
    if (v9 == objc_msgSend(v6, "length"))
      v8 = v11;
  }

  return v8;
}

- (uint64_t)icqui_isStopFamilySharingURL
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v1 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1808]), "initWithURL:resolvingAgainstBaseURL:", a1, 1);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(v1, "queryItems", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v14 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v7, "name");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v8, "isEqualToString:", CFSTR("action")) & 1) != 0)
        {
          objc_msgSend(v7, "value");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("STOP_FAMILY_SHARING"));

          if ((v10 & 1) != 0)
          {
            v11 = 1;
            goto LABEL_13;
          }
        }
        else
        {

        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v4);
  }
  v11 = 0;
LABEL_13:

  return v11;
}

- (uint64_t)icqui_isJoinOrLeaveFamilySharingURL
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  uint64_t v11;
  void *v13;
  id obj;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v1 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1808]), "initWithURL:resolvingAgainstBaseURL:", a1, 1);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(v1, "queryItems");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v2)
  {
    v3 = v2;
    v13 = v1;
    v4 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v16 != v4)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v6, "name", v13);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v7, "isEqualToString:", CFSTR("action")) & 1) != 0)
        {
          objc_msgSend(v6, "value");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v8, "isEqualToString:", CFSTR("JOIN_FAMILY")))
          {

LABEL_16:
            v11 = 1;
            goto LABEL_17;
          }
          objc_msgSend(v6, "value");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("LEAVE_FAMILY_SHARING"));

          if ((v10 & 1) != 0)
            goto LABEL_16;
        }
        else
        {

        }
      }
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v3)
        continue;
      break;
    }
    v11 = 0;
LABEL_17:
    v1 = v13;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

@end
