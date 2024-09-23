@implementation UIViewController(MTAdditions)

- (void)useDefaultRestorationIdentifier
{
  objc_class *v2;
  id v3;

  v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setRestorationIdentifier:", v3);

}

- (id)_recursiveDescriptionWithLevel:()MTAdditions result:
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  const __CFString *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  id v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_msgSend(CFSTR("\t|\t\t|\t\t|\t\t|\t\t|\t\t|\t\t|\t\t|\t\t|\t\t|\t\t|\t\t|\t\t|\t\t|\t\t|\t\t|\t\t|\t\t|\t\t|\t\t|\t\t|\t\t|\t\t|\t\t|\t\t|\t\t|\t\t|\t\t|\t\t|\t\t|\t\t|\t\t|\t"), "substringToIndex:", 3 * a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR("%@"), v7);

  objc_msgSend(a1, "restorationIdentifier");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v8)
    v10 = (const __CFString *)v8;
  else
    v10 = CFSTR("nil");
  v11 = (objc_class *)objc_opt_class();
  NSStringFromClass(v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR("(%p) [SRI:%@] %@\n"), a1, v10, v12);

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  objc_msgSend(a1, "childViewControllers");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v22;
    v17 = a3 + 1;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v22 != v16)
          objc_enumerationMutation(v13);
        v19 = (id)objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * i), "_recursiveDescriptionWithLevel:result:", v17, v6);
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v15);
  }

  return v6;
}

- (id)recursiveDescription
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_recursiveDescriptionWithLevel:result:", 0, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)visitChildenViewControllers:()MTAdditions
{
  uint64_t (**v4)(id, void *);
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  objc_msgSend(a1, "childViewControllers", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v12 != v8)
        objc_enumerationMutation(v5);
      v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v9);
      objc_msgSend(v10, "visitChildenViewControllers:", v4);
      if ((v4[2](v4, v10) & 1) != 0)
        break;
      if (v7 == ++v9)
      {
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
        if (v7)
          goto LABEL_3;
        break;
      }
    }
  }

}

- (uint64_t)isADescendantOfParentViewController:()MTAdditions
{
  void *v4;
  uint64_t v5;
  _OWORD v7[4];
  _BYTE v8[128];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  memset(v7, 0, sizeof(v7));
  objc_msgSend(a3, "childViewControllers", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", v7, v8, 16))
  {
    if (**((void ***)&v7[0] + 1) == a1)
      v5 = 1;
    else
      v5 = objc_msgSend(a1, "isADescendantOfParentViewController:");
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)mt_isVisible
{
  void *v2;
  void *v3;
  _BOOL8 v4;

  if (!objc_msgSend(a1, "isViewLoaded"))
    return 0;
  objc_msgSend(a1, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (id)mt_topViewController
{
  id v1;
  void *v2;
  void *v3;
  void *v4;

  v1 = a1;
  objc_msgSend(v1, "presentedViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    do
    {
      objc_msgSend(v1, "presentedViewController");
      v3 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v3, "presentedViewController");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      v1 = v3;
    }
    while (v4);
  }
  else
  {
    v3 = v1;
  }
  return v3;
}

- (id)mt_topViewControllerExcludingPopovers
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;

  v1 = a1;
  objc_msgSend(v1, "presentedViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2
    && (objc_msgSend(v2, "popoverPresentationController"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v4,
        !v4))
  {
    do
    {
      v5 = v3;

      objc_msgSend(v5, "popoverPresentationController");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      v1 = v5;
    }
    while (!v6);
  }
  else
  {
    v5 = v1;
  }

  return v5;
}

- (id)mt_topNavigationController
{
  id v1;
  id v2;
  void *v3;
  id v4;
  uint64_t v5;
  id v6;

  v1 = a1;
  objc_msgSend(MEMORY[0x1E0DC3F20], "mt_rootViewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v3 = 0;
  if (v1)
  {
    while (v1 != v2)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v4 = v1;

        v3 = v4;
      }
      objc_msgSend(v1, "parentViewController");
      v5 = objc_claimAutoreleasedReturnValue();

      v1 = (id)v5;
      if (!v5)
        goto LABEL_8;
    }
    v1 = v2;
  }
LABEL_8:
  v6 = v3;

  return v6;
}

+ (id)mt_rootViewController
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "delegate");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v1, "window");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "rootViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
