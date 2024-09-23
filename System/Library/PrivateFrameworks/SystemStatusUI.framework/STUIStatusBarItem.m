@implementation STUIStatusBarItem

- (void)updatedDisplayItemsWithData:(id)a3
{
  self->_needsUpdate = 0;
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

+ (id)itemIdentifierFromString:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  +[STUIStatusBarIdentifier identifierForObject:string:](STUIStatusBarIdentifier, "identifierForObject:string:", objc_opt_class(), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (STUIStatusBarIdentifier)identifier
{
  return (STUIStatusBarIdentifier *)objc_msgSend(a1, "itemIdentifierFromString:", 0);
}

+ (id)displayItemIdentifierFromIdentifier:(id)a3 string:(id)a4
{
  return +[STUIStatusBarIdentifier identifierForObject:string:](STUIStatusBarIdentifier, "identifierForObject:string:", a3, a4);
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
  -[STUIStatusBarItem dependentEntryKeys](self, "dependentEntryKeys", 0);
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

+ (id)itemIdentifierForDisplayItemIdentifier:(id)a3
{
  return (id)objc_msgSend(a3, "object");
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
    -[STUIStatusBarItem createDisplayItemForIdentifier:](self, "createDisplayItemForIdentifier:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_displayItems, "setObject:forKeyedSubscript:", v5, v4);
  }

  return v5;
}

- (id)createDisplayItemForIdentifier:(id)a3
{
  id v4;
  STUIStatusBarDisplayItem *v5;

  v4 = a3;
  v5 = -[STUIStatusBarDisplayItem initWithIdentifier:item:]([STUIStatusBarDisplayItem alloc], "initWithIdentifier:item:", v4, self);

  return v5;
}

- (id)_applyUpdate:(id)a3 toDisplayItem:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "enablementChanged"))
    objc_msgSend(v7, "setEnabled:", objc_msgSend(v6, "enabled"));
  -[STUIStatusBarItem applyUpdate:toDisplayItem:](self, "applyUpdate:toDisplayItem:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "styleAttributesChanged") && objc_msgSend(v7, "isEnabled"))
  {
    objc_msgSend(v6, "styleAttributes");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[STUIStatusBarItem applyStyleAttributes:toDisplayItem:](self, "applyStyleAttributes:toDisplayItem:", v9, v7);

  }
  if (objc_msgSend(v6, "enablementChanged") && (objc_msgSend(v6, "enabled") & 1) == 0)
    objc_msgSend(v7, "setEnabled:", 0);

  return v8;
}

+ (id)createItemForIdentifier:(id)a3 statusBar:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)objc_msgSend(a1, "itemClassForIdentifier:", v7)), "initWithIdentifier:statusBar:", v7, v6);

  return v8;
}

+ (Class)itemClassForIdentifier:(id)a3
{
  return (Class)objc_msgSend(a3, "object");
}

- (STUIStatusBarItem)initWithIdentifier:(id)a3 statusBar:(id)a4
{
  STUIStatusBarIdentifier *v6;
  id v7;
  STUIStatusBarItem *v8;
  STUIStatusBarIdentifier *identifier;
  STUIStatusBarIdentifier *v10;
  uint64_t v11;
  NSMutableDictionary *displayItems;
  objc_super v14;

  v6 = (STUIStatusBarIdentifier *)a3;
  v14.receiver = self;
  v14.super_class = (Class)STUIStatusBarItem;
  v7 = a4;
  v8 = -[STUIStatusBarItem init](&v14, sel_init);
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

- (id)overriddenStyleAttributesForData:(id)a3 identifier:(id)a4
{
  return 0;
}

- (BOOL)needsUpdate
{
  return self->_needsUpdate;
}

- (void)applyStyleAttributes:(id)a3 toDisplayItem:(id)a4
{
  objc_msgSend(a4, "applyStyleAttributes:", a3);
}

- (id)additionAnimationForDisplayItemWithIdentifier:(id)a3
{
  return 0;
}

- (STUIStatusBarIdentifier)identifier
{
  return self->_identifier;
}

+ (STUIStatusBarIdentifier)defaultDisplayIdentifier
{
  return (STUIStatusBarIdentifier *)objc_msgSend(a1, "displayItemIdentifierFromString:", 0);
}

- (STUIStatusBar)statusBar
{
  return (STUIStatusBar *)objc_loadWeakRetained((id *)&self->_statusBar);
}

- (id)applyUpdate:(id)a3 toDisplayItem:(id)a4
{
  return 0;
}

- (void)setNeedsUpdate
{
  self->_needsUpdate = 1;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_statusBar);
  objc_storeStrong((id *)&self->_displayItems, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (NSMutableDictionary)displayItems
{
  return self->_displayItems;
}

- (NSSet)dependentEntryKeys
{
  return (NSSet *)objc_msgSend(MEMORY[0x1E0C99E60], "set");
}

- (id)removalAnimationForDisplayItemWithIdentifier:(id)a3
{
  return 0;
}

- (id)viewForIdentifier:(id)a3
{
  return 0;
}

- (NSString)description
{
  return (NSString *)-[STUIStatusBarItem descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (NSString)debugDescription
{
  return (NSString *)-[STUIStatusBarItem debugDescriptionWithMultilinePrefix:](self, "debugDescriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[STUIStatusBarItem succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUIStatusBarItem identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendObject:withName:", v4, CFSTR("identifier"));

  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[STUIStatusBarItem descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)debugDescriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[STUIStatusBarItem _descriptionBuilderWithMultilinePrefix:forDebug:](self, "_descriptionBuilderWithMultilinePrefix:forDebug:", a3, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  return -[STUIStatusBarItem _descriptionBuilderWithMultilinePrefix:forDebug:](self, "_descriptionBuilderWithMultilinePrefix:forDebug:", a3, 0);
}

- (id)_descriptionBuilderWithMultilinePrefix:(id)a3 forDebug:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;

  v4 = a4;
  v6 = a3;
  -[STUIStatusBarItem succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setUseDebugDescription:", v4);
  objc_msgSend(v7, "setActiveMultilinePrefix:", v6);

  return v7;
}

- (void)setDisplayItems:(id)a3
{
  objc_storeStrong((id *)&self->_displayItems, a3);
}

@end
