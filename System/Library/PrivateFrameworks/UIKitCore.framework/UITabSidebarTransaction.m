@implementation UITabSidebarTransaction

void __39___UITabSidebarTransaction_updateTabs___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    objc_msgSend(*(id *)(a1 + 40), "removeObject:", v4);

}

void __39___UITabSidebarTransaction_updateTabs___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    objc_msgSend(*(id *)(a1 + 40), "removeObject:", v4);

}

void __54___UITabSidebarTransaction_resetCustomizationForTabs___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  if (objc_msgSend(v7, "allowsHiding"))
    objc_msgSend(*(id *)(a1 + 32), "updateTab:toHidden:", v7, objc_msgSend(v7, "isHiddenByDefault"));
  if (objc_msgSend(v7, "_isGroup"))
  {
    v3 = *(void **)(a1 + 32);
    v4 = v7;
    objc_msgSend(v3, "_resetDisplayOrderForGroup:", v4);
    v5 = *(void **)(a1 + 32);
    objc_msgSend(v4, "children");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "resetCustomizationForTabs:", v6);
  }

}

uint64_t __34___UITabSidebarTransaction_commit__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_commit");
}

void __35___UITabSidebarTransaction__commit__block_invoke(_QWORD *a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v5 = (void *)a1[4];
  v6 = a2;
  objc_msgSend(v5, "tabsByIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v8, "_isGroup") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a1[6], a1[4], CFSTR("_UITabSidebarTransaction.m"), 266, CFSTR("Cannot change the display order for a non-group element, %@"), v8);

  }
  if (objc_msgSend(v8, "_setDisplayOrderIdentifiers:", v10))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[UITabBarController _notifyDisplayOrderChangesForGroup:](a1[5], v8);
  }

}

@end
