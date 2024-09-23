@implementation UIViewController(SUAdditions)

- (void)parentViewControllerHierarchyDidChange
{
  void *v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "childViewControllers");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_msgSend(v1, "copy");

  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v3 = v2;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * v7);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v8, "parentViewControllerHierarchyDidChange", (_QWORD)v9);
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

- (SUViewControllerContext)copyArchivableContext
{
  SUViewControllerContext *v2;
  void *v3;
  void *v4;

  v2 = objc_alloc_init(SUViewControllerContext);
  objc_msgSend(a1, "section");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUViewControllerContext setSectionIdentifier:](v2, "setSectionIdentifier:", v4);

  return v2;
}

- (void)dismissAnimated:()SUAdditions
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;

  objc_msgSend(a1, "presentingViewController");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "overlayViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_popoverController");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v5)
  {
    objc_msgSend(v5, "overlayBackgroundViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dismissOverlay:animated:", v5, a3);
  }
  else if (v14)
  {
    objc_msgSend(MEMORY[0x24BDF6F98], "transitionSafePerformer:");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dismissViewControllerAnimated:completion:", a3, 0);
  }
  else
  {
    if (v6)
    {
      objc_msgSend(MEMORY[0x24BDF6F98], "transitionSafePerformer:", v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v9, "dismissPopoverAnimated:", a3);
      v7 = v9;
      goto LABEL_6;
    }
    objc_msgSend(a1, "tabBarController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "transientViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8 && objc_msgSend(a1, "isDescendantOfViewController:", v8))
    {
      objc_msgSend(MEMORY[0x24BDF6F98], "transitionSafePerformer:", v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setTransientViewController:animated:", 0, a3);
    }
    else
    {
      v11 = (void *)MEMORY[0x24BDF6F98];
      objc_msgSend(a1, "navigationController");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "transitionSafePerformer:", v12);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v13 = (id)objc_msgSend(v10, "popViewControllerAnimated:", a3);
    }

  }
LABEL_6:

}

- (uint64_t)iTunesStoreUI_dismissAction:()SUAdditions
{
  return objc_msgSend(a1, "dismissAnimated:", 1);
}

- (BOOL)isDescendantOfViewController:()SUAdditions
{
  id v4;
  id v5;
  id v6;
  _BOOL8 i;
  void *v8;

  v4 = a3;
  v5 = a1;
  v6 = v5;
  for (i = v5 != 0; v6 != v4 && v6; i = v6 != 0)
  {
    v8 = v6;
    objc_msgSend(v6, "parentViewController");
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  return i;
}

- (BOOL)isInMoreList
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  _BOOL8 v9;

  objc_msgSend(a1, "tabBarController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    +[SUClientDispatch tabBarController](SUClientDispatch, "tabBarController");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v2)
      return 0;
  }
  objc_msgSend(v2, "moreNavigationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "navigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allViewControllers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "indexOfObjectIdenticalTo:", v3);
  v7 = objc_msgSend(v5, "indexOfObjectIdenticalTo:", v4);
  v9 = v7 >= v6 && v7 != 0x7FFFFFFFFFFFFFFFLL;

  return v9;
}

- (uint64_t)isSkLoaded
{
  return 1;
}

- (uint64_t)isSkLoading
{
  return 0;
}

- (uint64_t)isRootViewController
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  BOOL v6;
  unint64_t v7;
  void *v8;
  void *v9;
  BOOL v10;
  void *v11;
  void *v12;
  uint64_t v13;

  objc_msgSend(a1, "tabBarController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "navigationController");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v2 && v3)
  {
    objc_msgSend(v2, "moreNavigationController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5 == v4;

    v7 = v6;
  }
  else
  {
    if (!v3)
    {
      objc_msgSend(a1, "parentViewController");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_14:
      v13 = 1;
      goto LABEL_15;
    }
    v7 = 0;
  }
  objc_msgSend(v4, "viewControllers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 >= objc_msgSend(v8, "count"))
  {
    v10 = 1;
  }
  else
  {
    objc_msgSend(v8, "objectAtIndex:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9 == a1;

  }
  objc_msgSend(a1, "parentViewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v10)
    goto LABEL_14;
  v13 = 0;
  if (v11 != v4 && v11 != v2)
    v13 = objc_msgSend(v11, "isRootViewController");
LABEL_15:

  return v13;
}

- (void)keyboardDidHideWithInfo:()SUAdditions
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(a1, "childViewControllers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v11++), "keyboardDidHideWithInfo:", v4, (_QWORD)v12);
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

}

- (void)keyboardDidShowWithInfo:()SUAdditions
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(a1, "childViewControllers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v11++), "keyboardDidShowWithInfo:", v4, (_QWORD)v12);
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

}

- (void)keyboardWillHideWithInfo:()SUAdditions
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(a1, "childViewControllers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v11++), "keyboardWillHideWithInfo:", v4, (_QWORD)v12);
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

}

- (void)keyboardWillShowWithInfo:()SUAdditions
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(a1, "childViewControllers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v11++), "keyboardWillShowWithInfo:", v4, (_QWORD)v12);
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

}

- (void)resetRestoredContext
{
  id v1;

  objc_msgSend(a1, "parentViewController");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "resetRestoredContext");

}

- (id)_sectionForViewController:()SUAdditions
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "parentViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_sectionForViewController:", a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (uint64_t)section
{
  return objc_msgSend(a1, "_sectionForViewController:", 0);
}

- (void)setBadgeValue:()SUAdditions animated:blink:
{
  uint64_t v6;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;

  LODWORD(v6) = a4;
  v8 = a3;
  v19 = v8;
  if (v8)
    v9 = a5;
  else
    v9 = 0;
  if (v8)
    v6 = v6;
  else
    v6 = 0;
  objc_msgSend(a1, "tabBarItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setBadgeValue:animated:blink:", v19, v6, v9);

  objc_msgSend(a1, "tabBarController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    +[SUClientDispatch tabBarController](SUClientDispatch, "tabBarController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v11, "moreNavigationController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "tabBarItem");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(a1, "isInMoreList"))
  {
    v14 = v13;
    v15 = v19;
    v16 = v6;
    v17 = v9;
  }
  else
  {
    v14 = v13;
    v15 = 0;
    v16 = 0;
    v17 = 0;
  }
  objc_msgSend(v14, "setBadgeValue:animated:blink:", v15, v16, v17);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "postNotificationName:object:", CFSTR("SUViewControllerBadgeDidChangeNotification"), a1);

}

- (uint64_t)shouldInvalidateForMemoryPurge
{
  return 1;
}

- (id)viewControllerFactory
{
  void *v1;
  void *v2;
  SUViewControllerFactory *v3;
  void *v4;
  void *v5;

  objc_msgSend(a1, "parentViewController");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1)
  {
    objc_msgSend(v1, "viewControllerFactory");
    v3 = (SUViewControllerFactory *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[SUClientDispatch clientInterface](SUClientDispatch, "clientInterface");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "viewControllerFactory");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
      goto LABEL_5;
    v3 = objc_alloc_init(SUViewControllerFactory);
  }
  v4 = v3;
LABEL_5:

  return v4;
}

- (id)su_closestNavigationController
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a1, "navigationController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(a1, "navigationController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(a1, "parentViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "su_closestNavigationController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

@end
