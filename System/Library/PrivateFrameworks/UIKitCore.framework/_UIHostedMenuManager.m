@implementation _UIHostedMenuManager

- (id)menuLeafForIdentifier:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[_UIHostedMenuManager _menuLeafForIdentifier:menu:](self, "_menuLeafForIdentifier:menu:", v4, self->_displayedMenu);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    -[_UIHostedMenuManager _menuLeafForIdentifier:menu:](self, "_menuLeafForIdentifier:menu:", v4, self->_rootMenu);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (id)menuForIdentifier:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[_UIHostedMenuManager _menuForIdentifier:menu:](self, "_menuForIdentifier:menu:", v4, self->_displayedMenu);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    -[_UIHostedMenuManager _menuForIdentifier:menu:](self, "_menuForIdentifier:menu:", v4, self->_rootMenu);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (id)_menuLeafForIdentifier:(id)a3 menu:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  int v14;
  id v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (a4)
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    objc_msgSend(a4, "children", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v19 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
          if (objc_msgSend(v12, "_isLeaf")
            && (objc_msgSend(v12, "_internalIdentifier"),
                v13 = (void *)objc_claimAutoreleasedReturnValue(),
                v14 = objc_msgSend(v13, "isEqualToString:", v6),
                v13,
                v14))
          {
            v15 = v12;
          }
          else
          {
            if ((objc_msgSend(v12, "_isLeaf") & 1) != 0)
              continue;
            -[_UIHostedMenuManager _menuLeafForIdentifier:menu:](self, "_menuLeafForIdentifier:menu:", v6, v12);
            v15 = (id)objc_claimAutoreleasedReturnValue();
          }
          v16 = v15;
          if (v15)
            goto LABEL_16;
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v9);
    }
    v16 = 0;
LABEL_16:

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (id)_menuForIdentifier:(id)a3 menu:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  uint64_t v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "_internalIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", v6);

  if (v9)
  {
    v10 = v7;
  }
  else if (v7)
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    objc_msgSend(v7, "children", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v20;
      while (2)
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v20 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
          if ((objc_msgSend(v16, "_isLeaf") & 1) == 0)
          {
            -[_UIHostedMenuManager _menuForIdentifier:menu:](self, "_menuForIdentifier:menu:", v6, v16);
            v17 = objc_claimAutoreleasedReturnValue();
            if (v17)
            {
              v10 = (id)v17;
              goto LABEL_16;
            }
          }
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        if (v13)
          continue;
        break;
      }
    }
    v10 = 0;
LABEL_16:

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (UIMenu)rootMenu
{
  return self->_rootMenu;
}

- (void)setRootMenu:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (UIMenu)displayedMenu
{
  return self->_displayedMenu;
}

- (void)setDisplayedMenu:(id)a3
{
  objc_storeStrong((id *)&self->_displayedMenu, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayedMenu, 0);
  objc_storeStrong((id *)&self->_rootMenu, 0);
}

@end
