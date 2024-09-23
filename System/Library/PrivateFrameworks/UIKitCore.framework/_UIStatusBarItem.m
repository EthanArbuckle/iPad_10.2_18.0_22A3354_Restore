@implementation _UIStatusBarItem

+ (id)itemIdentifierFromString:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  +[_UIStatusBarIdentifier identifierForObject:string:](_UIStatusBarIdentifier, "identifierForObject:string:", objc_opt_class(), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)displayItemIdentifierFromString:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "displayItemIdentifierFromIdentifier:string:", v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)displayItemIdentifierFromIdentifier:(id)a3 string:(id)a4
{
  return +[_UIStatusBarIdentifier identifierForObject:string:](_UIStatusBarIdentifier, "identifierForObject:string:", a3, a4);
}

+ (id)itemIdentifierForDisplayItemIdentifier:(id)a3
{
  return (id)objc_msgSend(a3, "object");
}

+ (_UIStatusBarIdentifier)identifier
{
  return (_UIStatusBarIdentifier *)objc_msgSend(a1, "itemIdentifierFromString:", 0);
}

+ (_UIStatusBarIdentifier)defaultDisplayIdentifier
{
  return (_UIStatusBarIdentifier *)objc_msgSend(a1, "displayItemIdentifierFromString:", 0);
}

+ (Class)itemClassForIdentifier:(id)a3
{
  return (Class)objc_msgSend(a3, "object");
}

+ (id)createItemForIdentifier:(id)a3 statusBar:(id)a4
{
  id v7;
  id v8;
  objc_class *v9;
  void *v10;
  void *v12;

  v7 = a3;
  v8 = a4;
  v9 = (objc_class *)objc_msgSend(a1, "itemClassForIdentifier:", v7);
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_UIStatusBarItem.m"), 63, CFSTR("No class found for item with identifier %@"), v7);

  }
  v10 = (void *)objc_msgSend([v9 alloc], "initWithIdentifier:statusBar:", v7, v8);

  return v10;
}

- (_UIStatusBarItem)initWithIdentifier:(id)a3 statusBar:(id)a4
{
  _UIStatusBarIdentifier *v6;
  id v7;
  _UIStatusBarItem *v8;
  _UIStatusBarIdentifier *identifier;
  _UIStatusBarIdentifier *v10;
  uint64_t v11;
  NSMutableDictionary *displayItems;
  objc_super v14;

  v6 = (_UIStatusBarIdentifier *)a3;
  v14.receiver = self;
  v14.super_class = (Class)_UIStatusBarItem;
  v7 = a4;
  v8 = -[_UIStatusBarItem init](&v14, sel_init);
  identifier = v8->_identifier;
  v8->_identifier = v6;
  v10 = v6;

  objc_storeWeak((id *)&v8->_statusBar, v7);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary", v14.receiver, v14.super_class);
  v11 = objc_claimAutoreleasedReturnValue();
  displayItems = v8->_displayItems;
  v8->_displayItems = (NSMutableDictionary *)v11;

  return v8;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  NSStringFromSelector(sel_identifier);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIDescriptionBuilder descriptionForObject:keys:](UIDescriptionBuilder, "descriptionForObject:keys:", self, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSSet)dependentEntryKeys
{
  return (NSSet *)objc_msgSend(MEMORY[0x1E0C99E60], "set");
}

- (void)setNeedsUpdate
{
  self->_needsUpdate = 1;
}

- (BOOL)canEnableDisplayItem:(id)a3 fromData:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  char v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[_UIStatusBarItem dependentEntryKeys](self, "dependentEntryKeys", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v6);
        objc_msgSend(v5, "valueForKey:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEnabled");

        if ((v11 & 1) != 0)
        {
          LOBYTE(v7) = 1;
          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

  return v7;
}

- (id)overriddenStyleAttributesForData:(id)a3 identifier:(id)a4
{
  return 0;
}

- (id)_applyUpdate:(id)a3 toDisplayItem:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "enabilityChanged"))
    objc_msgSend(v7, "setEnabled:", objc_msgSend(v6, "enabled"));
  -[_UIStatusBarItem applyUpdate:toDisplayItem:](self, "applyUpdate:toDisplayItem:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "styleAttributesChanged") && objc_msgSend(v7, "isEnabled"))
  {
    objc_msgSend(v6, "styleAttributes");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIStatusBarItem applyStyleAttributes:toDisplayItem:](self, "applyStyleAttributes:toDisplayItem:", v9, v7);

  }
  if (objc_msgSend(v6, "enabilityChanged") && (objc_msgSend(v6, "enabled") & 1) == 0)
    objc_msgSend(v7, "setEnabled:", 0);

  return v8;
}

- (id)applyUpdate:(id)a3 toDisplayItem:(id)a4
{
  return 0;
}

- (void)applyStyleAttributes:(id)a3 toDisplayItem:(id)a4
{
  objc_msgSend(a4, "applyStyleAttributes:", a3);
}

- (void)updatedDisplayItemsWithData:(id)a3
{
  self->_needsUpdate = 0;
}

- (id)additionAnimationForDisplayItemWithIdentifier:(id)a3
{
  return 0;
}

- (id)removalAnimationForDisplayItemWithIdentifier:(id)a3
{
  return 0;
}

- (id)createDisplayItemForIdentifier:(id)a3
{
  id v4;
  _UIStatusBarDisplayItem *v5;

  v4 = a3;
  v5 = -[_UIStatusBarDisplayItem initWithIdentifier:item:]([_UIStatusBarDisplayItem alloc], "initWithIdentifier:item:", v4, self);

  return v5;
}

- (id)displayItemForIdentifier:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_displayItems, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    -[_UIStatusBarItem createDisplayItemForIdentifier:](self, "createDisplayItemForIdentifier:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_displayItems, "setObject:forKeyedSubscript:", v5, v4);
  }

  return v5;
}

- (id)viewForIdentifier:(id)a3
{
  void *v5;
  id v6;
  void *v7;

  v5 = (void *)MEMORY[0x1E0CB3488];
  v6 = a3;
  objc_msgSend(v5, "currentHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIStatusBarItem.m"), 189, CFSTR("%@ has no view for identifier %@"), self, v6);

  return 0;
}

- (_UIStatusBarIdentifier)identifier
{
  return self->_identifier;
}

- (BOOL)needsUpdate
{
  return self->_needsUpdate;
}

- (NSMutableDictionary)displayItems
{
  return self->_displayItems;
}

- (void)setDisplayItems:(id)a3
{
  objc_storeStrong((id *)&self->_displayItems, a3);
}

- (_UIStatusBar)statusBar
{
  return (_UIStatusBar *)objc_loadWeakRetained((id *)&self->_statusBar);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_statusBar);
  objc_storeStrong((id *)&self->_displayItems, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
