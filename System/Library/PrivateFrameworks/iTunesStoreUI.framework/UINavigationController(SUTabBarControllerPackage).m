@implementation UINavigationController(SUTabBarControllerPackage)

- (uint64_t)_setStoreBarStyle:()SUTabBarControllerPackage clientInterface:
{
  uint64_t result;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  void *v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  result = _UIApplicationUsesLegacyUI();
  if ((result & 1) != 0)
    return result;
  v8 = (void *)objc_msgSend(a1, "navigationBar");
  v28 = a3;
  if (a3 == 1)
  {
    v9 = objc_msgSend(a4, "lightKeyColor");
    v10 = 0;
    goto LABEL_6;
  }
  if (a3 == 2)
  {
    v9 = objc_msgSend(a4, "darkKeyColor");
    v10 = 1;
LABEL_6:
    v11 = objc_msgSend(MEMORY[0x24BDF6950], "labelColor");
    objc_msgSend(v8, "setBarStyle:", v10);
    if (v9)
      objc_msgSend((id)objc_msgSend(a1, "view"), "setInteractionTintColor:", v9);
    if (v11)
    {
      v12 = objc_alloc(MEMORY[0x24BDBCE70]);
      v13 = (void *)objc_msgSend(v12, "initWithObjectsAndKeys:", v11, *MEMORY[0x24BDF6600], 0);
      objc_msgSend(v8, "setTitleTextAttributes:", v13);

    }
  }
  v14 = (void *)objc_msgSend((id)objc_msgSend(a1, "navigationBar"), "topItem");
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v15 = (void *)objc_msgSend(v14, "rightBarButtonItems");
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
  if (v16)
  {
    v17 = v16;
    v18 = 0;
    v19 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v34 != v19)
          objc_enumerationMutation(v15);
        v21 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v21, "customView");
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v18 = (void *)objc_msgSend(v21, "customView");
        }
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    }
    while (v17);
  }
  else
  {
    v18 = 0;
  }
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v22 = (void *)objc_msgSend(v14, "leftBarButtonItems");
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v30;
    do
    {
      for (j = 0; j != v24; ++j)
      {
        if (*(_QWORD *)v30 != v25)
          objc_enumerationMutation(v22);
        v27 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * j);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v27, "customView");
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v18 = (void *)objc_msgSend(v27, "customView");
        }
      }
      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
    }
    while (v24);
  }
  objc_msgSend(v14, "titleView");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v18 = (void *)objc_msgSend(v14, "titleView");
  return objc_msgSend(v18, "setBarStyle:", v28 == 2);
}

@end
