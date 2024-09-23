@implementation SUTabBarAppearance

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SUTabBarAppearance;
  -[SUTabBarAppearance dealloc](&v3, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(_QWORD *)(v5 + 8) = self->_backgroundImage;
  *(_QWORD *)(v5 + 16) = self->_dividerImage;
  *(_QWORD *)(v5 + 24) = self->_selectedDividerImage;
  *(_QWORD *)(v5 + 32) = self->_selectionIndicatorImage;
  *(double *)(v5 + 40) = self->_tabBarButtonSpacing;
  *(double *)(v5 + 48) = self->_tabBarButtonWidth;
  *(_QWORD *)(v5 + 56) = -[NSMutableDictionary mutableCopyWithZone:](self->_titleTextAttributes, "mutableCopyWithZone:", a3);
  return (id)v5;
}

- (void)enumerateTitleTextAttributesUsingBlock:(id)a3
{
  NSMutableDictionary *titleTextAttributes;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  titleTextAttributes = self->_titleTextAttributes;
  v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](titleTextAttributes, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(titleTextAttributes);
        (*((void (**)(id, uint64_t, uint64_t))a3 + 2))(a3, objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "integerValue"), -[NSMutableDictionary objectForKey:](self->_titleTextAttributes, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i)));
      }
      v7 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](titleTextAttributes, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }
}

- (void)setTitleTextAttributes:(id)a3 forState:(unint64_t)a4
{
  uint64_t v6;
  NSMutableDictionary *titleTextAttributes;
  void *v8;
  id v9;

  v6 = objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithInteger:", a4);
  titleTextAttributes = self->_titleTextAttributes;
  v9 = (id)v6;
  if (a3)
  {
    if (!titleTextAttributes)
      self->_titleTextAttributes = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    v8 = (void *)objc_msgSend(a3, "copy");
    -[NSMutableDictionary setObject:forKey:](self->_titleTextAttributes, "setObject:forKey:", v8, v9);

  }
  else
  {
    -[NSMutableDictionary removeObjectForKey:](titleTextAttributes, "removeObjectForKey:");
  }

}

- (id)titleTextAttributesForState:(unint64_t)a3
{
  void *v4;
  id v5;

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithInteger:", a3);
  v5 = (id)objc_msgSend((id)-[NSMutableDictionary objectForKey:](self->_titleTextAttributes, "objectForKey:", v4), "copy");

  return v5;
}

- (UIImage)backgroundImage
{
  return self->_backgroundImage;
}

- (void)setBackgroundImage:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

- (UIImage)dividerImage
{
  return self->_dividerImage;
}

- (void)setDividerImage:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (UIImage)selectedDividerImage
{
  return self->_selectedDividerImage;
}

- (void)setSelectedDividerImage:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (UIImage)selectionIndicatorImage
{
  return self->_selectionIndicatorImage;
}

- (void)setSelectionIndicatorImage:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (double)tabBarButtonSpacing
{
  return self->_tabBarButtonSpacing;
}

- (void)setTabBarButtonSpacing:(double)a3
{
  self->_tabBarButtonSpacing = a3;
}

- (double)tabBarButtonWidth
{
  return self->_tabBarButtonWidth;
}

- (void)setTabBarButtonWidth:(double)a3
{
  self->_tabBarButtonWidth = a3;
}

@end
