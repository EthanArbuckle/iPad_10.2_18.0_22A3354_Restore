@implementation UIViewController(VSAdditions)

- (uint64_t)vs_ignoreInteractionCount
{
  void *v1;
  uint64_t v2;

  objc_getAssociatedObject(a1, "VSInteractionIgnoreCountKey");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "integerValue");

  return v2;
}

- (void)vs_setIgnoreInteractionCount:()VSAdditions
{
  id v2;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(a1, "VSInteractionIgnoreCountKey", v2, (void *)3);

}

- (void)vs_beginIgnoringInteraction
{
  uint64_t v2;
  id v3;

  v2 = objc_msgSend(a1, "vs_ignoreInteractionCount");
  objc_msgSend(a1, "vs_setIgnoreInteractionCount:", v2 + 1);
  if (!v2)
  {
    objc_msgSend(a1, "view");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setUserInteractionEnabled:", 0);

  }
}

- (void)vs_endIgnoringInteraction
{
  uint64_t v2;
  id v3;

  v2 = objc_msgSend(a1, "vs_ignoreInteractionCount") - 1;
  objc_msgSend(a1, "vs_setIgnoreInteractionCount:", v2);
  if (!v2)
  {
    objc_msgSend(a1, "view");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setUserInteractionEnabled:", 1);

  }
}

- (id)vs_addFocusGuideFromView:()VSAdditions toViews:withDirection:
{
  id v8;
  objc_class *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  NSObject *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint8_t v35[16];

  v8 = a3;
  v9 = (objc_class *)MEMORY[0x24BDF6A58];
  v10 = a4;
  v11 = objc_alloc_init(v9);
  objc_msgSend(a1, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addLayoutGuide:", v11);

  objc_msgSend(v11, "setPreferredFocusEnvironments:", v10);
  objc_msgSend(v11, "widthAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "widthAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "constraintEqualToAnchor:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setActive:", 1);

  objc_msgSend(v11, "heightAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "heightAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "constraintEqualToAnchor:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setActive:", 1);

  switch(a5)
  {
    case 1:
      objc_msgSend(v11, "bottomAnchor");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "topAnchor");
      v20 = objc_claimAutoreleasedReturnValue();
      goto LABEL_5;
    case 2:
      objc_msgSend(v11, "topAnchor");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "topAnchor");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "constraintEqualToAnchor:", v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setActive:", 1);

      objc_msgSend(v11, "rightAnchor");
      v24 = objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    case 4:
      objc_msgSend(v11, "topAnchor");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "bottomAnchor");
      v20 = objc_claimAutoreleasedReturnValue();
LABEL_5:
      v25 = (void *)v20;
      objc_msgSend(v19, "constraintEqualToAnchor:", v20);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setActive:", 1);

      objc_msgSend(v11, "leftAnchor");
      v24 = objc_claimAutoreleasedReturnValue();
LABEL_6:
      v27 = v24;
      objc_msgSend(v8, "leftAnchor");
      v28 = objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    case 8:
      objc_msgSend(v11, "topAnchor");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "topAnchor");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "constraintEqualToAnchor:", v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "setActive:", 1);

      objc_msgSend(v11, "leftAnchor");
      v27 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "rightAnchor");
      v28 = objc_claimAutoreleasedReturnValue();
LABEL_8:
      v32 = (void *)v28;
      -[NSObject constraintEqualToAnchor:](v27, "constraintEqualToAnchor:", v28);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "setActive:", 1);

      break;
    default:
      VSDefaultLogObject();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v35 = 0;
        _os_log_impl(&dword_2303C5000, v27, OS_LOG_TYPE_DEFAULT, "Tried to add a UIFocusGuide for an unsupported direction", v35, 2u);
      }
      break;
  }

  return v11;
}

- (void)vs_updateViewModel:()VSAdditions withUserInterfaceStyle:andPreferredLogoSize:
{
  id v9;

  v9 = a5;
  if (objc_msgSend(v9, "userInterfaceStyle") != a6)
  {
    if (objc_msgSend(v9, "conformsToProtocol:", &unk_255E8E790))
      objc_msgSend(v9, "setPreferredLogoSize:", a1, a2);
    objc_msgSend(v9, "setUserInterfaceStyle:", a6);
  }

}

- (uint64_t)vs_updateNavigationItemAndForceViewReloadWithSearchController:()VSAdditions
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(a1, "navigationItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSearchController:", v4);

  return objc_msgSend(a1, "_forceViewReload");
}

- (uint64_t)vs_updateNavigationItemAndForceViewReloadWithSearchController:()VSAdditions rightBarButtonItem:
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  objc_msgSend(a1, "navigationItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setRightBarButtonItem:", v6);

  objc_msgSend(a1, "navigationItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setSearchController:", v7);

  return objc_msgSend(a1, "_forceViewReload");
}

- (void)_forceViewReload
{
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "view");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "window");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  objc_msgSend(v2, "subviews", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * i);
        objc_msgSend(v8, "removeFromSuperview");
        objc_msgSend(v2, "addSubview:", v8);
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

- (void)vs_makeFrontmostAnimated:()VSAdditions completion:
{
  void (**v6)(_QWORD);
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  objc_msgSend(a1, "presentedViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    VSDefaultLogObject();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(a1, "debugDescription");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "presentedViewController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "debugDescription");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138412546;
      v14 = v9;
      v15 = 2112;
      v16 = v11;
      _os_log_impl(&dword_2303C5000, v8, OS_LOG_TYPE_DEFAULT, "Warning: %@ is already presenting %@", (uint8_t *)&v13, 0x16u);

    }
    objc_msgSend(a1, "presentedViewController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "dismissViewControllerAnimated:completion:", a3, v6);

  }
  else
  {
    v6[2](v6);
  }

}

- (void)vs_makeTopmostInNavigationStack:()VSAdditions completion:
{
  void *v6;
  void *v7;
  void (**v8)(void);

  v8 = a4;
  objc_msgSend(a1, "navigationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(a1, "navigationController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "vs_popToViewController:animated:completion:", a1, a3, v8);

  }
  else
  {
    v8[2]();
  }

}

@end
