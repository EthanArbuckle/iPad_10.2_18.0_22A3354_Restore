@implementation _UICommandInternalDiff

- (void)deleteMenu:(id)a3
{
  NSMutableSet *menuDeletes;
  NSMutableSet *v5;
  NSMutableSet *v6;

  menuDeletes = self->_menuDeletes;
  if (menuDeletes)
  {
    -[NSMutableSet addObject:](menuDeletes, "addObject:", a3);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithObject:", a3);
    v5 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
    v6 = self->_menuDeletes;
    self->_menuDeletes = v5;

  }
  -[NSMutableDictionary removeObjectForKey:](self->_itemDeletes, "removeObjectForKey:", a3);
  -[NSMutableDictionary removeObjectForKey:](self->_inserts, "removeObjectForKey:", a3);

}

- (id)_deletesForMenu:(id)a3
{
  id v4;
  id v5;
  NSMutableDictionary *itemDeletes;
  NSMutableDictionary *v7;
  NSMutableDictionary *v8;

  v4 = a3;
  if ((-[NSMutableSet containsObject:](self->_menuDeletes, "containsObject:", v4) & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    itemDeletes = self->_itemDeletes;
    if (itemDeletes)
    {
      -[NSMutableDictionary objectForKeyedSubscript:](itemDeletes, "objectForKeyedSubscript:", v4);
      v5 = (id)objc_claimAutoreleasedReturnValue();
      if (!v5)
      {
        v5 = objc_alloc_init(MEMORY[0x1E0C99E20]);
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_itemDeletes, "setObject:forKeyedSubscript:", v5, v4);
      }
    }
    else
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99E20]);
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithObject:forKey:", v5, v4);
      v7 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
      v8 = self->_itemDeletes;
      self->_itemDeletes = v7;

    }
  }

  return v5;
}

- (id)_parentInsertsForMenu:(id)a3
{
  id v4;
  _UICommandParentInserts *v5;
  NSMutableDictionary *inserts;
  NSMutableDictionary *v7;
  NSMutableDictionary *v8;

  v4 = a3;
  if ((-[NSMutableSet containsObject:](self->_menuDeletes, "containsObject:", v4) & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    inserts = self->_inserts;
    if (inserts)
    {
      -[NSMutableDictionary objectForKeyedSubscript:](inserts, "objectForKeyedSubscript:", v4);
      v5 = (_UICommandParentInserts *)objc_claimAutoreleasedReturnValue();
      if (!v5)
      {
        v5 = objc_alloc_init(_UICommandParentInserts);
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_inserts, "setObject:forKeyedSubscript:", v5, v4);
      }
    }
    else
    {
      v5 = objc_alloc_init(_UICommandParentInserts);
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithObject:forKey:", v5, v4);
      v7 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
      v8 = self->_inserts;
      self->_inserts = v7;

    }
  }

  return v5;
}

- (id)_replacementsForMenu:(id)a3
{
  id v4;
  _UICommandParentReplacements *v5;
  NSMutableDictionary *replacements;
  NSMutableDictionary *v7;
  NSMutableDictionary *v8;

  v4 = a3;
  if ((-[NSMutableSet containsObject:](self->_menuDeletes, "containsObject:", v4) & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    replacements = self->_replacements;
    if (replacements)
    {
      -[NSMutableDictionary objectForKeyedSubscript:](replacements, "objectForKeyedSubscript:", v4);
      v5 = (_UICommandParentReplacements *)objc_claimAutoreleasedReturnValue();
      if (!v5)
      {
        v5 = objc_alloc_init(_UICommandParentReplacements);
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_replacements, "setObject:forKeyedSubscript:", v5, v4);
      }
    }
    else
    {
      v5 = objc_alloc_init(_UICommandParentReplacements);
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithObject:forKey:", v5, v4);
      v7 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
      v8 = self->_replacements;
      self->_replacements = v7;

    }
  }

  return v5;
}

- (void)deleteItem:(id)a3 inMenu:(id)a4
{
  id v6;
  id v7;

  v6 = a3;
  -[_UICommandInternalDiff _deletesForMenu:](self, "_deletesForMenu:", a4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v6);

}

- (void)replaceItem:(id)a3 inMenu:(id)a4 withElements:(id)a5
{
  id v8;
  id v9;
  id v10;

  v8 = a5;
  v9 = a3;
  -[_UICommandInternalDiff _replacementsForMenu:](self, "_replacementsForMenu:", a4);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_setReplacementElements:forElement:", v8, v9);

}

- (void)insertAtStartElements:(id)a3 atEndElements:(id)a4 inMenu:(id)a5
{
  id v8;
  id v9;
  id v10;

  v8 = a4;
  v9 = a3;
  -[_UICommandInternalDiff _parentInsertsForMenu:](self, "_parentInsertsForMenu:", a5);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_setAtStartElements:atEndElements:", v9, v8);

}

- (void)insertBeforeElements:(id)a3 afterElements:(id)a4 aroundElement:(id)a5 inMenu:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;

  v10 = a5;
  v11 = a4;
  v12 = a3;
  -[_UICommandInternalDiff _parentInsertsForMenu:](self, "_parentInsertsForMenu:", a6);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "_setBeforeElements:afterElements:aroundElement:", v12, v11, v10);

}

- (void)insertFallbackBeforeElements:(id)a3 fallbackAfterElements:(id)a4 inMenu:(id)a5
{
  id v8;
  id v9;
  id v10;

  v8 = a4;
  v9 = a3;
  -[_UICommandInternalDiff _parentInsertsForMenu:](self, "_parentInsertsForMenu:", a5);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_addFallbackBeforeElements:fallbackAfterElements:", v9, v8);

}

- (NSSet)menuDeletes
{
  return &self->_menuDeletes->super;
}

- (NSDictionary)itemDeletes
{
  return &self->_itemDeletes->super;
}

- (NSDictionary)inserts
{
  return &self->_inserts->super;
}

- (NSDictionary)replacements
{
  return &self->_replacements->super;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_replacements, 0);
  objc_storeStrong((id *)&self->_inserts, 0);
  objc_storeStrong((id *)&self->_itemDeletes, 0);
  objc_storeStrong((id *)&self->_menuDeletes, 0);
}

@end
