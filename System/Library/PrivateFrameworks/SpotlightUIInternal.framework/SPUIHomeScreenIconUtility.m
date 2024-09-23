@implementation SPUIHomeScreenIconUtility

+ (void)addMenusToBuilder:(id)a3 forFocusEnvironment:(id)a4
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "system");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD760], "mainSystem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 == v6)
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    objc_msgSend(MEMORY[0x24BEB0960], "applicationIconMultitaskingMenus", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v14;
      v11 = *MEMORY[0x24BEBE5D0];
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v14 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(v4, "insertChildMenu:atEndOfMenuForIdentifier:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v12++), v11);
        }
        while (v9 != v12);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v9);
    }

  }
}

@end
