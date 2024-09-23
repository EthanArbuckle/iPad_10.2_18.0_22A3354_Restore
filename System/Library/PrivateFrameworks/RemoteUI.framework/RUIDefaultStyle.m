@implementation RUIDefaultStyle

- (void)applyToObjectModel:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "allPages");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v8);
        -[RUIStyle backgroundColor](self, "backgroundColor");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "view");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setBackgroundColor:", v10);

        if (objc_msgSend(v9, "hasTableView"))
        {
          objc_msgSend(v9, "tableViewOM");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "tableView");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BEBD4B8], "tableBackgroundColor");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "setBackgroundColor:", v14);

          objc_msgSend(v13, "setBackgroundView:", 0);
        }
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v6);
  }

}

@end
