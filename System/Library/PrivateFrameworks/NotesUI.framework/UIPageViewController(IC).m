@implementation UIPageViewController(IC)

- (id)ic_internalScrollView
{
  void *v1;
  void *v2;
  id v3;
  uint64_t v4;
  void *i;
  void *v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  objc_msgSend(a1, "view", 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "subviews");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = (id)objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v9;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(_QWORD *)v9 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v3 = v6;
          goto LABEL_11;
        }
      }
      v3 = (id)objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (void)ic_setAutoscrollEnabled:()IC
{
  id v4;

  objc_msgSend(a1, "ic_internalScrollView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_setAutoScrollEnabled:", a3);

}

@end
