@implementation UIMenuController(IC)

- (void)ic_addMenuItemsIfNecessary:()IC
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  _QWORD v15[5];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(a1, "menuItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
    v5 = (void *)MEMORY[0x1E0C9AA60];
  v7 = (void *)objc_msgSend(v5, "mutableCopy");

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v8 = v4;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v17;
    v12 = MEMORY[0x1E0C809B0];
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v8);
        v14 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
        v15[0] = v12;
        v15[1] = 3221225472;
        v15[2] = __51__UIMenuController_IC__ic_addMenuItemsIfNecessary___block_invoke;
        v15[3] = &unk_1E5C22BE0;
        v15[4] = v14;
        if ((objc_msgSend(v7, "ic_containsObjectPassingTest:", v15) & 1) == 0)
          objc_msgSend(v7, "addObject:", v14);
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v10);
  }

  if (!v7)
    objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((updatedMenuItems) != nil)", "-[UIMenuController(IC) ic_addMenuItemsIfNecessary:]", 1, 0, CFSTR("Expected non-nil value for '%s'"), "updatedMenuItems");
  objc_msgSend(a1, "setMenuItems:", v7);

}

@end
