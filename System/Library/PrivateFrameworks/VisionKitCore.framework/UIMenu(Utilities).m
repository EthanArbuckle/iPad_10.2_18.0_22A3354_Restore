@implementation UIMenu(Utilities)

+ (uint64_t)vk_menuWithItems:()Utilities title:
{
  return objc_msgSend(a1, "vk_menuWithItems:title:subtitle:image:", a3, a4, 0, 0);
}

+ (uint64_t)vk_menuWithItems:()Utilities title:subtitle:
{
  return objc_msgSend(a1, "vk_menuWithItems:title:subtitle:image:", a3, a4, a5, 0);
}

+ (id)vk_menuWithItems:()Utilities title:subtitle:image:
{
  id v9;
  __CFString *v10;
  __CFString *v11;
  id v12;
  id v13;
  void *v14;

  v9 = a5;
  v10 = &stru_1E94661A8;
  if (a4)
    v10 = a4;
  v11 = v10;
  v12 = a6;
  v13 = a3;
  objc_msgSend(MEMORY[0x1E0CEA740], "menuWithTitle:image:identifier:options:children:", v11, v12, 0, 0, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v14, "setSubtitle:", v9);

  return v14;
}

- (id)vk_addNonNilItems:()Utilities
{
  id v4;
  void *v5;
  uint64_t v6;

  v4 = a1;
  v5 = v4;
  if (a3)
  {
    objc_msgSend(v4, "vk_addItems:", a3);
    v6 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v6;
  }
  return v5;
}

- (void)vk_addNonNilItem:()Utilities
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v9 = a3;
    v4 = (void *)MEMORY[0x1E0C99D20];
    v5 = a3;
    objc_msgSend(v4, "arrayWithObjects:count:", &v9, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = (id)objc_msgSend(a1, "vk_addItems:", v6, v9, v10);
  }
  return a1;
}

- (id)vk_addItems:()Utilities
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;

  v4 = a3;
  objc_msgSend(a1, "children");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  v7 = (void *)MEMORY[0x1E0C9AA60];
  if (v5)
    v7 = (void *)v5;
  v8 = v7;

  objc_msgSend(v8, "vk_arrayByAddingObjectsFromNonNilArray:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "menuByReplacingChildren:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

@end
