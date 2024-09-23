@implementation SUStructuredPage

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SUStructuredPage;
  -[SUStructuredPage dealloc](&v3, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(_BYTE *)(v5 + 8) = self->_artworkShouldFitWidth;
  *(double *)(v5 + 16) = self->_artworkWidth;
  *(_BYTE *)(v5 + 24) = self->_didShowDialog;
  *(_QWORD *)(v5 + 32) = self->_displayStyle;
  *(_QWORD *)(v5 + 40) = self->_item;
  *(_QWORD *)(v5 + 48) = -[SUItemList copyWithZone:](self->_itemList, "copyWithZone:", a3);
  *(_QWORD *)(v5 + 56) = -[SUStorePageProtocol copyWithZone:](self->_protocol, "copyWithZone:", a3);
  *(_QWORD *)(v5 + 64) = -[SUPageSectionGroup copyWithZone:](self->_sectionsGroup, "copyWithZone:", a3);
  *(_QWORD *)(v5 + 80) = -[NSString copyWithZone:](self->_title, "copyWithZone:", a3);
  *(_QWORD *)(v5 + 88) = self->_type;
  *(_BYTE *)(v5 + 96) = self->_wantsIndexBar;
  return (id)v5;
}

+ (int64_t)pageTypeForStorePageDictionary:(id)a3
{
  void *v4;

  v4 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("page-type"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return objc_msgSend(a1, "pageTypeForStorePageString:", v4);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (v4 = (void *)objc_msgSend(v4, "objectForKey:", CFSTR("template-name")),
        objc_opt_class(),
        (objc_opt_isKindOfClass() & 1) != 0))
  {
    return objc_msgSend(a1, "pageTypeForStorePageString:", v4);
  }
  else
  {
    return 0;
  }
}

+ (int64_t)pageTypeForStorePageString:(id)a3
{
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("album")) & 1) != 0
    || (objc_msgSend(a3, "isEqualToString:", CFSTR("tracks")) & 1) != 0
    || (objc_msgSend(a3, "isEqualToString:", CFSTR("mix")) & 1) != 0
    || (objc_msgSend(a3, "isEqualToString:", CFSTR("podcast")) & 1) != 0
    || (objc_msgSend(a3, "isEqualToString:", CFSTR("course")) & 1) != 0)
  {
    return 1;
  }
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("software")) & 1) != 0)
    return 3;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("split-view")) & 1) != 0)
    return 6;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("search")) & 1) != 0)
    return 7;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("software-update")) & 1) != 0)
    return 4;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("reviews")) & 1) != 0)
    return 2;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("eula")) & 1) != 0)
    return 5;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("software-updates")) & 1) != 0)
    return 8;
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("downloads")))
    return 9;
  return 0;
}

- (BOOL)loadFromDictionary:(id)a3
{
  uint64_t v5;
  SUPageSectionGroup *v6;
  uint64_t v7;
  uint64_t v8;

  -[SUStructuredPage _parseItemsFromDictionary:](self, "_parseItemsFromDictionary:");
  -[SUStructuredPage setType:](self, "setType:", objc_msgSend((id)objc_opt_class(), "pageTypeForStorePageDictionary:", a3));
  -[SUStructuredPage _parseTemplateParametersFromDictionary:](self, "_parseTemplateParametersFromDictionary:", a3);
  -[SUStructuredPage _parseProtocolFromDictionary:](self, "_parseProtocolFromDictionary:", a3);
  v5 = objc_msgSend(a3, "objectForKey:", CFSTR("tabs"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = objc_alloc_init(SUPageSectionGroup);
    if (-[SUPageSectionGroup loadFromDictionary:](v6, "loadFromDictionary:", v5))
      -[SUStructuredPage setSectionsGroup:](self, "setSectionsGroup:", v6);

  }
  else
  {
    -[SUStructuredPage setSectionsGroup:](self, "setSectionsGroup:", 0);
  }
  v7 = objc_msgSend(a3, "objectForKey:", CFSTR("title"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  -[SUStructuredPage setTitle:](self, "setTitle:", v8);
  return 1;
}

- (BOOL)hasDisplayableContent
{
  return -[SUItemList numberOfItems](self->_itemList, "numberOfItems") > 0
      || self->_item
      || -[SUStructuredPage didShowDialog](self, "didShowDialog")
      || -[SUStorePageProtocol copyright](self->_protocol, "copyright") != 0;
}

- (void)setItem:(id)a3
{
  SUItem *item;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  item = self->_item;
  if (item != a3)
  {

    self->_item = (SUItem *)a3;
    v6 = -[SUItemList copyItems](-[SUStructuredPage itemList](self, "itemList"), "copyItems");
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v12;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v12 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v10++), "setContainerItem:", self->_item);
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v8);
    }

  }
}

- (id)_copyItemFromDictionary:(id)a3
{
  uint64_t v4;

  v4 = objc_msgSend(a3, "objectForKey:", CFSTR("item-metadata"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    v4 = objc_msgSend(a3, "objectForKey:", CFSTR("album-metadata"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    v4 = objc_msgSend(a3, "objectForKey:", CFSTR("software-metadata"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    v4 = objc_msgSend(a3, "objectForKey:", CFSTR("wemix-metadata"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return (id)objc_msgSend(+[SUItemDataSource sharedDataSource](SUItemDataSource, "sharedDataSource"), "newItemWithItemDictionary:", v4);
  else
    return 0;
}

- (int64_t)_displayStyleForString:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("grouped")) & 1) != 0)
    return 1;
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("plain")))
    return 2;
  return 0;
}

- (void)_parseItemsFromDictionary:(id)a3
{
  uint64_t v5;
  SUItemList *v6;
  id v7;

  v5 = objc_msgSend(a3, "objectForKey:", CFSTR("items"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = objc_alloc_init(SUItemList);
    -[SUItemList setItemsFromPropertyList:](v6, "setItemsFromPropertyList:", v5);
    -[SUItemList setHintText:](v6, "setHintText:", objc_msgSend(a3, "objectForKey:", CFSTR("hint-text")));
    -[SUStructuredPage setItemList:](self, "setItemList:", v6);

  }
  else
  {
    -[SUStructuredPage setItemList:](self, "setItemList:", 0);
  }
  v7 = -[SUStructuredPage _copyItemFromDictionary:](self, "_copyItemFromDictionary:", a3);
  -[SUStructuredPage setItem:](self, "setItem:", v7);

}

- (void)_parseProtocolFromDictionary:(id)a3
{
  SUStorePageProtocol *v5;
  id v6;

  v5 = objc_alloc_init(SUStorePageProtocol);
  -[SUStorePageProtocol setValuesFromStorePageDictionary:](v5, "setValuesFromStorePageDictionary:", a3);
  -[SUStructuredPage setProtocol:](self, "setProtocol:", v5);

  v6 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BEB1DF0]), "initWithResponseDictionary:", a3);
  self->_didShowDialog = objc_msgSend((id)objc_msgSend(v6, "actionsWithActionType:", *MEMORY[0x24BEB2A18]), "count") != 0;

}

- (void)_parseTemplateParametersFromDictionary:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  char v13;
  double v14;
  float v15;
  void *v16;
  char v17;

  v4 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("page-type"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = objc_msgSend(v4, "objectForKey:", CFSTR("template-parameters"));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = (void *)v5;
    else
      v6 = 0;
    self->_displayStyle = -[SUStructuredPage _displayStyleForString:](self, "_displayStyleForString:", objc_msgSend(v6, "objectForKey:", CFSTR("list-display-style")));
    v7 = (void *)objc_msgSend(v6, "objectForKey:", CFSTR("hide-sign-in-button"));
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v8 = objc_msgSend(v7, "BOOLValue");
    else
      v8 = 0;
    self->_shouldHideSignInButton = v8;
    v9 = (void *)objc_msgSend(v6, "objectForKey:", CFSTR("wants-index-bar"));
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v10 = objc_msgSend(v9, "BOOLValue");
    else
      v10 = 0;
    self->_wantsIndexBar = v10;
    v11 = (void *)objc_msgSend(v6, "objectForKey:", CFSTR("artwork-display-style"));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v12 = (void *)objc_msgSend(v11, "objectForKey:", CFSTR("width"));
      v13 = objc_opt_respondsToSelector();
      v14 = -1.0;
      if ((v13 & 1) != 0)
      {
        objc_msgSend(v12, "floatValue", -1.0);
        v14 = v15;
      }
      self->_artworkWidth = v14;
      v16 = (void *)objc_msgSend(v11, "objectForKey:", CFSTR("fit-width"));
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v17 = objc_msgSend(v16, "BOOLValue");
      else
        v17 = 0;
      self->_artworkShouldFitWidth = v17;
    }
    else
    {
      self->_artworkShouldFitWidth = 0;
      self->_artworkWidth = -1.0;
    }
  }
  else
  {
    self->_artworkShouldFitWidth = 0;
    self->_artworkWidth = -1.0;
    self->_displayStyle = 0;
    self->_wantsIndexBar = 0;
  }
}

- (BOOL)artworkShouldFitWidth
{
  return self->_artworkShouldFitWidth;
}

- (double)artworkWidth
{
  return self->_artworkWidth;
}

- (BOOL)didShowDialog
{
  return self->_didShowDialog;
}

- (int64_t)displayStyle
{
  return self->_displayStyle;
}

- (SUItem)item
{
  return self->_item;
}

- (SUItemList)itemList
{
  return self->_itemList;
}

- (void)setItemList:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

- (SUStorePageProtocol)protocol
{
  return self->_protocol;
}

- (void)setProtocol:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 56);
}

- (SUPageSectionGroup)sectionsGroup
{
  return self->_sectionsGroup;
}

- (void)setSectionsGroup:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 64);
}

- (BOOL)shouldHideSignInButton
{
  return self->_shouldHideSignInButton;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (BOOL)wantsIndexBar
{
  return self->_wantsIndexBar;
}

@end
