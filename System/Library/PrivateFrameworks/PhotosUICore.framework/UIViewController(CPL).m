@implementation UIViewController(CPL)

- (void)px_insertFooterToolbarWithItems:()CPL
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v4 = a3;
  objc_msgSend(a1, "_px_footerToolbar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v6 = (void *)objc_opt_new();
    objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(a1, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addSubview:", v6);
    v8 = (void *)MEMORY[0x1E0CB3718];
    _NSDictionaryOfVariableBindings(CFSTR("tooolbar"), v6, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[tooolbar]|"), 0, 0, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addConstraints:", v10);

    v11 = (void *)MEMORY[0x1E0CB3718];
    _NSDictionaryOfVariableBindings(CFSTR("tooolbar"), v6, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:[tooolbar]|"), 0, 0, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addConstraints:", v13);

    objc_msgSend(a1, "_px_offersTableView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "contentInset");
    objc_msgSend(v14, "setContentInset:");
    objc_setAssociatedObject(a1, &pxFooterToolbarKey, v6, (void *)1);

  }
  objc_msgSend(a1, "_px_footerToolbar");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setItems:", v4);

}

- (void)px_removeFooterToolbar
{
  void *v2;
  id v3;

  objc_msgSend(a1, "_px_footerToolbar");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeFromSuperview");
  objc_setAssociatedObject(a1, &pxFooterToolbarKey, 0, (void *)1);
  objc_msgSend(a1, "_px_offersTableView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contentInset");
  objc_msgSend(v2, "setContentInset:");

}

- (id)_px_offersTableView
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
  objc_msgSend(a1, "view");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  objc_msgSend(v1, "subviews", 0);
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

- (id)_px_footerToolbar
{
  return objc_getAssociatedObject(a1, &pxFooterToolbarKey);
}

@end
