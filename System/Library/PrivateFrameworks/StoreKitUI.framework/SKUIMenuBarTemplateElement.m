@implementation SKUIMenuBarTemplateElement

- (SKUIMenuBarViewElement)menuBar
{
  _BOOL8 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v3 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v3)
        -[SKUIMenuBarTemplateElement menuBar].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  -[SKUIMenuBarTemplateElement _menuBarChildOfElement:](self, "_menuBarChildOfElement:", self);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    -[SKUIMenuBarTemplateElement navigationBarElement](self, "navigationBarElement");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIMenuBarTemplateElement _menuBarChildOfElement:](self, "_menuBarChildOfElement:", v12);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (SKUIMenuBarViewElement *)v11;
}

- (id)_menuBarChildOfElement:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  void *i;
  void *v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "children");
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v7, "conformsToProtocol:", &unk_1EF44DCC8, (_QWORD)v9))
        {
          v4 = v7;
          goto LABEL_11;
        }
      }
      v4 = (id)objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

  return v4;
}

- (SKUINavigationBarViewElement)navigationBarElement
{
  _BOOL8 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v3 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v3)
        -[SKUIMenuBarTemplateElement navigationBarElement].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  -[SKUIViewElement firstChildForElementType:](self, "firstChildForElementType:", 74);
  return (SKUINavigationBarViewElement *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)menuBar
{
}

- (void)navigationBarElement
{
}

@end
