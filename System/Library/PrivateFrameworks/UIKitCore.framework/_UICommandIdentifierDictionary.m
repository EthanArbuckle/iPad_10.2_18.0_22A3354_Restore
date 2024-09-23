@implementation _UICommandIdentifierDictionary

- (void)setObject:(id)a3 forAction:(SEL)a4 propertyList:(id)a5
{
  NSMutableDictionary *actionPropertyListDictionary;
  id v8;
  _UISelectorDictionary *actionDictionary;
  id v10;

  if (a5)
  {
    actionPropertyListDictionary = self->_actionPropertyListDictionary;
    v8 = a3;
    +[_UICommandIdentifier identifierWithAction:propertyList:](_UICommandIdentifier, "identifierWithAction:propertyList:", a4, a5);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](actionPropertyListDictionary, "setObject:forKeyedSubscript:", v8);

  }
  else
  {
    actionDictionary = self->_actionDictionary;
    v10 = a3;
    -[_UISelectorDictionary setObject:forSelector:](actionDictionary, "setObject:forSelector:");
  }

}

- (id)objectForAction:(SEL)a3 propertyList:(id)a4
{
  NSMutableDictionary *actionPropertyListDictionary;
  void *v5;
  void *v6;

  if (a4)
  {
    actionPropertyListDictionary = self->_actionPropertyListDictionary;
    +[_UICommandIdentifier identifierWithAction:propertyList:](_UICommandIdentifier, "identifierWithAction:propertyList:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](actionPropertyListDictionary, "objectForKeyedSubscript:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[_UISelectorDictionary objectForSelector:](self->_actionDictionary, "objectForSelector:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

- (_UICommandIdentifierDictionary)init
{
  _UICommandIdentifierDictionary *v2;
  _UISelectorDictionary *v3;
  _UISelectorDictionary *actionDictionary;
  NSMutableDictionary *v5;
  NSMutableDictionary *actionPropertyListDictionary;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_UICommandIdentifierDictionary;
  v2 = -[_UICommandIdentifierDictionary init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(_UISelectorDictionary);
    actionDictionary = v2->_actionDictionary;
    v2->_actionDictionary = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    actionPropertyListDictionary = v2->_actionPropertyListDictionary;
    v2->_actionPropertyListDictionary = v5;

  }
  return v2;
}

- (_UICommandIdentifierDictionary)initWithDictionary:(id)a3
{
  id *v4;
  _UICommandIdentifierDictionary *v5;
  uint64_t v6;
  _UISelectorDictionary *actionDictionary;
  uint64_t v8;
  NSMutableDictionary *actionPropertyListDictionary;
  objc_super v11;

  v4 = (id *)a3;
  v11.receiver = self;
  v11.super_class = (Class)_UICommandIdentifierDictionary;
  v5 = -[_UICommandIdentifierDictionary init](&v11, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4[1], "copy");
    actionDictionary = v5->_actionDictionary;
    v5->_actionDictionary = (_UISelectorDictionary *)v6;

    v8 = objc_msgSend(v4[2], "mutableCopy");
    actionPropertyListDictionary = v5->_actionPropertyListDictionary;
    v5->_actionPropertyListDictionary = (NSMutableDictionary *)v8;

  }
  return v5;
}

- (void)removeObjectForAction:(SEL)a3 propertyList:(id)a4
{
  NSMutableDictionary *actionPropertyListDictionary;
  id v5;

  if (a4)
  {
    actionPropertyListDictionary = self->_actionPropertyListDictionary;
    +[_UICommandIdentifier identifierWithAction:propertyList:](_UICommandIdentifier, "identifierWithAction:propertyList:", a3);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary removeObjectForKey:](actionPropertyListDictionary, "removeObjectForKey:", v5);

  }
  else
  {
    -[_UISelectorDictionary removeObjectForSelector:](self->_actionDictionary, "removeObjectForSelector:", a3);
  }
}

- (BOOL)intersectsEntriesFromDictionary:(id)a3
{
  id *v4;
  NSMutableDictionary *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  char v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = (id *)a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = self->_actionPropertyListDictionary;
  v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(v4[2], "objectForKey:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i), (_QWORD)v14);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10)
        {
          v12 = 1;
          goto LABEL_11;
        }
      }
      v7 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v7)
        continue;
      break;
    }
  }

  -[_UISelectorDictionary allSelectors](self->_actionDictionary, "allSelectors");
  v5 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4[1], "allSelectors");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[NSMutableDictionary intersectsSet:](v5, "intersectsSet:", v11);

LABEL_11:
  return v12;
}

- (id)intersectingIdentifiersFromDictionary:(id)a3
{
  void *v4;
  NSMutableDictionary *actionPropertyListDictionary;
  id *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  _QWORD v17[4];
  id v18;

  v4 = (void *)MEMORY[0x1E0C99E20];
  actionPropertyListDictionary = self->_actionPropertyListDictionary;
  v6 = (id *)a3;
  -[NSMutableDictionary allKeys](actionPropertyListDictionary, "allKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v6[2], "allKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setWithArray:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "intersectSet:", v11);

  -[_UISelectorDictionary allSelectors](self->_actionDictionary, "allSelectors");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v6[1];

  objc_msgSend(v13, "allSelectors");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "intersectSet:", v14);

  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __72___UICommandIdentifierDictionary_intersectingIdentifiersFromDictionary___block_invoke;
  v17[3] = &unk_1E16C54E0;
  v15 = v8;
  v18 = v15;
  objc_msgSend(v12, "enumerateSelectorsUsingBlock:", v17);

  return v15;
}

- (void)removeEntriesFromDictionary:(id)a3
{
  NSMutableDictionary *actionPropertyListDictionary;
  void *v5;
  _QWORD *v6;
  void *v7;
  _UISelectorDictionary *actionDictionary;
  void *v9;
  id v10;

  actionPropertyListDictionary = self->_actionPropertyListDictionary;
  v5 = (void *)*((_QWORD *)a3 + 2);
  v6 = a3;
  objc_msgSend(v5, "allKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary removeObjectsForKeys:](actionPropertyListDictionary, "removeObjectsForKeys:", v7);

  actionDictionary = self->_actionDictionary;
  v9 = (void *)v6[1];

  objc_msgSend(v9, "allSelectors");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[_UISelectorDictionary removeObjectsForSelectors:](actionDictionary, "removeObjectsForSelectors:", v10);

}

- (void)addEntriesFromDictionary:(id)a3
{
  NSMutableDictionary *actionPropertyListDictionary;
  uint64_t v5;
  _QWORD *v6;
  _UISelectorDictionary *actionDictionary;
  uint64_t v8;

  actionPropertyListDictionary = self->_actionPropertyListDictionary;
  v5 = *((_QWORD *)a3 + 2);
  v6 = a3;
  -[NSMutableDictionary addEntriesFromDictionary:](actionPropertyListDictionary, "addEntriesFromDictionary:", v5);
  actionDictionary = self->_actionDictionary;
  v8 = v6[1];

  -[_UISelectorDictionary addEntriesFromDictionary:](actionDictionary, "addEntriesFromDictionary:", v8);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[_UICommandIdentifierDictionary initWithDictionary:]([_UICommandIdentifierDictionary alloc], "initWithDictionary:", self);
}

- (unint64_t)hash
{
  unint64_t v3;

  v3 = -[_UISelectorDictionary hash](self->_actionDictionary, "hash");
  return -[NSMutableDictionary hash](self->_actionPropertyListDictionary, "hash") ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  char v5;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && -[_UISelectorDictionary isEqual:](self->_actionDictionary, "isEqual:", v4[1]))
  {
    v5 = -[NSMutableDictionary isEqualToDictionary:](self->_actionPropertyListDictionary, "isEqualToDictionary:", v4[2]);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionPropertyListDictionary, 0);
  objc_storeStrong((id *)&self->_actionDictionary, 0);
}

@end
