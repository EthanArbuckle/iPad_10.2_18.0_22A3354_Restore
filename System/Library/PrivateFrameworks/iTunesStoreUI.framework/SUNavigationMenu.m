@implementation SUNavigationMenu

- (SUNavigationMenu)init
{
  return -[SUNavigationMenu initWithDictionary:](self, "initWithDictionary:", 0);
}

- (SUNavigationMenu)initWithDictionary:(id)a3
{
  SUNavigationMenu *v4;
  SUNavigationMenu *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SUNavigationMenu;
  v4 = -[SUNavigationMenu init](&v7, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_initialSelectedIndex = -1;
    -[SUNavigationMenu _loadFromDictionary:](v4, "_loadFromDictionary:", a3);
    if (!-[NSArray count](v5->_menuItems, "count")
      || !-[NSString length](v5->_closedTitle, "length") && !-[NSString length](v5->_openTitle, "length"))
    {

      return 0;
    }
  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SUNavigationMenu;
  -[SUNavigationMenu dealloc](&v3, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;

  v5 = (_QWORD *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  v5[1] = -[NSString copyWithZone:](self->_cancelTitle, "copyWithZone:", a3);
  v5[2] = -[NSString copyWithZone:](self->_closedTitle, "copyWithZone:", a3);
  v5[3] = self->_initialSelectedIndex;
  v5[4] = self->_location;
  v5[5] = -[NSArray copyWithZone:](self->_menuItems, "copyWithZone:", a3);
  v5[6] = -[NSArray copyWithZone:](self->_navigationButtons, "copyWithZone:", a3);
  v5[7] = -[NSString copyWithZone:](self->_openTitle, "copyWithZone:", a3);
  return v5;
}

- (id)navigationButtonForLocation:(id)a3
{
  NSArray *navigationButtons;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  navigationButtons = self->_navigationButtons;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](navigationButtons, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
LABEL_3:
    v8 = 0;
    while (1)
    {
      if (*(_QWORD *)v12 != v7)
        objc_enumerationMutation(navigationButtons);
      v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v8);
      if ((objc_msgSend((id)objc_msgSend(v9, "buttonLocation"), "isEqualToString:", a3) & 1) != 0)
        break;
      if (v6 == ++v8)
      {
        v6 = -[NSArray countByEnumeratingWithState:objects:count:](navigationButtons, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
        if (v6)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    v9 = 0;
  }
  return v9;
}

- (void)_loadFromDictionary:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  int64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  v5 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("cancel-text"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {

    self->_cancelTitle = (NSString *)v5;
  }
  v6 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("button-title"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {

    self->_closedTitle = (NSString *)v6;
  }
  v7 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("selected-index"));
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v8 = (int)objc_msgSend(v7, "intValue");
  else
    v8 = -1;
  self->_initialSelectedIndex = v8;
  v9 = objc_msgSend(a3, "objectForKey:", CFSTR("location"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    self->_location = -[SUNavigationMenu _locationForString:](self, "_locationForString:", v9);
  v10 = objc_msgSend(a3, "objectForKey:", CFSTR("items"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {

    self->_menuItems = (NSArray *)-[SUNavigationMenu _newMenuItemsFromArray:](self, "_newMenuItemsFromArray:", v10);
  }
  v11 = objc_msgSend(a3, "objectForKey:", CFSTR("navigation-buttons"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {

    self->_navigationButtons = (NSArray *)-[SUNavigationMenu _newNavigationButtonsFromArray:](self, "_newNavigationButtonsFromArray:", v11);
  }
  v12 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("nav-controller-title"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {

    self->_openTitle = (NSString *)v12;
  }
}

- (int64_t)_locationForString:(id)a3
{
  return objc_msgSend(a3, "isEqualToString:", CFSTR("right"));
}

- (id)_newMenuItemsFromArray:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  SUNavigationMenuItem *v9;
  SUNavigationMenuItem *v10;
  SUItemContentRating *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(a3);
        v9 = -[SUNavigationMenuItem initWithDictionary:]([SUNavigationMenuItem alloc], "initWithDictionary:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v8));
        if (v9)
        {
          v10 = v9;
          v11 = -[SUNavigationMenuItem contentRating](v9, "contentRating");
          if (!-[SUItemContentRating isRestricted](v11, "isRestricted")
            || !-[SUItemContentRating shouldHideWhenRestricted](v11, "shouldHideWhenRestricted"))
          {
            objc_msgSend(v4, "addObject:", v10);
          }

        }
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }
  if (!objc_msgSend(v4, "count"))
  {

    return 0;
  }
  return v4;
}

- (id)_newNavigationButtonsFromArray:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  SUProtocolButton *v10;
  SUProtocolButton *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(a3);
        v9 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v8);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v10 = -[SUProtocolButton initWithButtonDictionary:]([SUProtocolButton alloc], "initWithButtonDictionary:", v9);
          if (v10)
          {
            v11 = v10;
            objc_msgSend(v4, "addObject:", v10);

          }
        }
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }
  return v4;
}

- (NSString)cancelTitle
{
  return self->_cancelTitle;
}

- (NSString)closedTitle
{
  return self->_closedTitle;
}

- (int64_t)initialSelectedIndex
{
  return self->_initialSelectedIndex;
}

- (int64_t)location
{
  return self->_location;
}

- (void)setLocation:(int64_t)a3
{
  self->_location = a3;
}

- (NSArray)menuItems
{
  return self->_menuItems;
}

- (NSArray)navigationButtons
{
  return self->_navigationButtons;
}

- (NSString)openTitle
{
  return self->_openTitle;
}

@end
