@implementation _UIKeyShortcutHUDMenu

+ (_UIKeyShortcutHUDMenu)menuWithUIMenu:(id)a3 children:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  _QWORD *v16;
  void *v17;
  objc_super v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v21;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v21 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v13), "uiMenuElement");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v14);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v11);
  }

  objc_msgSend(v6, "menuByReplacingChildren:", v8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v19.receiver = a1;
  v19.super_class = (Class)&OBJC_METACLASS____UIKeyShortcutHUDMenu;
  objc_msgSendSuper2(&v19, sel_elementWithUIMenuElement_, v15);
  v16 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)v16[2];
  v16[2] = v9;

  return (_UIKeyShortcutHUDMenu *)v16;
}

- (_UIKeyShortcutHUDMenu)init
{
  _UIKeyShortcutHUDMenu *v2;
  _UIKeyShortcutHUDMenu *v3;
  NSArray *children;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UIKeyShortcutHUDMenu;
  v2 = -[_UIKeyShortcutHUDMenu init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    children = v2->_children;
    v2->_children = (NSArray *)MEMORY[0x1E0C9AA60];

  }
  return v3;
}

- (BOOL)isEmpty
{
  void *v2;
  BOOL v3;

  -[_UIKeyShortcutHUDMenu children](self, "children");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") == 0;

  return v3;
}

- (id)menuByReplacingChildren:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[_UIKeyShortcutHUDMenu uiMenu](self, "uiMenu");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIKeyShortcutHUDMenu menuWithUIMenu:children:](_UIKeyShortcutHUDMenu, "menuWithUIMenu:children:", v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)_acceptMenuVisit:(id)a3 shortcutVisit:(id)a4
{
  if (a3)
    (*((void (**)(id, _UIKeyShortcutHUDMenu *))a3 + 2))(a3, self);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UIKeyShortcutHUDMenu;
  v4 = a3;
  -[_UIKeyShortcutHUDMenuElement encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[_UIKeyShortcutHUDMenu children](self, "children", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("children"));

}

- (_UIKeyShortcutHUDMenu)initWithCoder:(id)a3
{
  id v4;
  _UIKeyShortcutHUDMenu *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSArray *children;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_UIKeyShortcutHUDMenu;
  v5 = -[_UIKeyShortcutHUDMenuElement initWithCoder:](&v13, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    objc_opt_self();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_self();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithObjects:", v7, v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("children"));
    v10 = objc_claimAutoreleasedReturnValue();
    children = v5->_children;
    v5->_children = (NSArray *)v10;

  }
  return v5;
}

- (NSArray)children
{
  return self->_children;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_children, 0);
}

@end
