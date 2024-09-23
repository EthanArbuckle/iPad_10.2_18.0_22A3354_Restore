@implementation _UINavigationBarNSToolbarProxy

+ (BOOL)_supportsNSToolbarNavigationHosting
{
  return 0;
}

- (_UINavigationBarNSToolbarProxy)initWithTitlebar:(id)a3
{
  id v4;
  _UINavigationBarNSToolbarProxy *v5;
  _UINavigationBarNSToolbarProxy *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_UINavigationBarNSToolbarProxy;
  v5 = -[_UINavigationBarNSToolbarProxy init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_owningTitlebar, v4);

  return v6;
}

- (NSToolbar)toolbar
{
  -[_UINavigationBarNSToolbarProxy _updateIfNecessary](self, "_updateIfNecessary");
  return 0;
}

- (NSString)title
{
  -[_UINavigationBarNSToolbarProxy _updateIfNecessary](self, "_updateIfNecessary");
  return self->_title;
}

- (NSURL)representedURL
{
  -[_UINavigationBarNSToolbarProxy _updateIfNecessary](self, "_updateIfNecessary");
  return self->_representedURL;
}

- (id)representedDragItemsProvider
{
  -[_UINavigationBarNSToolbarProxy _updateIfNecessary](self, "_updateIfNecessary");
  return _Block_copy(self->_representedDragItemsProvider);
}

- (id)description
{
  void *v3;
  void *v4;
  NSMutableSet *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  objc_super v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v17.receiver = self;
  v17.super_class = (Class)_UINavigationBarNSToolbarProxy;
  -[_UINavigationBarNSToolbarProxy description](&v17, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  if ((*(_BYTE *)&self->_flags & 1) != 0)
    objc_msgSend(v4, "appendString:", CFSTR(" updatePending. call -_updateIfNecessary to force."));
  if (self->_title)
    objc_msgSend(v4, "appendFormat:", CFSTR(" title='%@'"), self->_title);
  if (self->_representedURL)
    objc_msgSend(v4, "appendFormat:", CFSTR(" representedURL='%@'"), self->_representedURL);
  objc_msgSend(v4, "appendString:", CFSTR(" participants = {"));
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = self->_registeredParticipants;
  v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v10, "layoutForNSToolbar:", self);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "appendFormat:", CFSTR("\n\t%p : %@\n"), v10, v11, (_QWORD)v13);

      }
      v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
    }
    while (v7);
  }

  objc_msgSend(v4, "appendString:", CFSTR("}\n"));
  return v4;
}

- (UITitlebar)owningTitlebar
{
  return (UITitlebar *)objc_loadWeakRetained((id *)&self->_owningTitlebar);
}

- (_UITabBarControllerVisualStyle_Mac)tabBarVisualStyle
{
  return self->_tabBarVisualStyle;
}

- (void)setTabBarVisualStyle:(id)a3
{
  objc_storeStrong((id *)&self->_tabBarVisualStyle, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tabBarVisualStyle, 0);
  objc_destroyWeak((id *)&self->_owningTitlebar);
  objc_storeStrong((id *)&self->_registeredParticipants, 0);
  objc_storeStrong(&self->_representedDragItemsProvider, 0);
  objc_storeStrong((id *)&self->_representedURL, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
