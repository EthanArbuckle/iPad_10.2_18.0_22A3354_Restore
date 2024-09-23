@implementation MissedKeyFailure

- (BOOL)doesMatchResult:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(v3, "corrected");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "componentsJoinedByString:", &stru_24FD49B78);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "intended");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "componentsJoinedByString:", &stru_24FD49B78);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v5, "isEqualToString:", v7) & 1) != 0)
  {
    v8 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD16A8], "string");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    objc_msgSend(v3, "touched", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v18 != v13)
            objc_enumerationMutation(v10);
          objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * i), "componentsJoinedByString:", &stru_24FD49B78);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "appendString:", v15);

        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v12);
    }

    v8 = objc_msgSend(v9, "rangeOfString:", CFSTR("<NoKey>")) != 0x7FFFFFFFFFFFFFFFLL;
  }

  return v8;
}

@end
