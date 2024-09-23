@implementation CACLanguageModel

- (CACLanguageModel)initWithText:(id)a3 identifier:(id)a4 attributes:(id)a5
{
  id v8;
  id v9;
  id v10;
  CACLanguageModel *v11;
  CACLanguageModel *v12;
  void *v13;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = -[CACLanguageModel init](self, "init");
  v12 = v11;
  if (v11)
  {
    -[CACLanguageModel setText:](v11, "setText:", v8);
    -[CACLanguageModel setIdentifier:](v12, "setIdentifier:", v9);
    if (objc_msgSend(v10, "count"))
    {
      -[CACLanguageModel _mutableAttributes](v12, "_mutableAttributes");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addEntriesFromDictionary:", v10);

    }
  }

  return v12;
}

- (id)_initWithLanguageModel:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  CACLanguageModel *v8;

  v4 = a3;
  objc_msgSend(v4, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "attributes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[CACLanguageModel initWithText:identifier:attributes:](self, "initWithText:identifier:attributes:", v5, v6, v7);
  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "_initWithLanguageModel:", self);
}

- (id)_mutableAttributes
{
  CACLanguageModel *v2;
  NSMutableDictionary *attributes;
  uint64_t v4;
  NSMutableDictionary *v5;
  NSMutableDictionary *v6;

  v2 = self;
  objc_sync_enter(v2);
  attributes = v2->_attributes;
  if (!attributes)
  {
    v4 = objc_opt_new();
    v5 = v2->_attributes;
    v2->_attributes = (NSMutableDictionary *)v4;

    attributes = v2->_attributes;
  }
  v6 = attributes;
  objc_sync_exit(v2);

  return v6;
}

- (id)_mutableChildren
{
  CACLanguageModel *v2;
  NSMutableArray *children;
  uint64_t v4;
  NSMutableArray *v5;
  NSMutableArray *v6;

  v2 = self;
  objc_sync_enter(v2);
  children = v2->_children;
  if (!children)
  {
    v4 = objc_opt_new();
    v5 = v2->_children;
    v2->_children = (NSMutableArray *)v4;

    children = v2->_children;
  }
  v6 = children;
  objc_sync_exit(v2);

  return v6;
}

- (void)addChildLanguageModel:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CACLanguageModel _mutableChildren](self, "_mutableChildren");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

}

- (void)removeAllChildren
{
  -[NSMutableArray removeAllObjects](self->_children, "removeAllObjects");
}

- (id)objectForAttribute:(id)a3
{
  return (id)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", a3);
}

- (void)setObject:(id)a3 forAttribute:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[CACLanguageModel _mutableAttributes](self, "_mutableAttributes");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", v7, v6);

}

- (__RXLanguageObject)createRXLanguageObjectRef
{
  void *v3;
  __RXLanguageObject *v4;

  +[CACSpeechSystem speechSystem](CACSpeechSystem, "speechSystem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (__RXLanguageObject *)objc_msgSend(v3, "createRXLanguageObjectRefFromCACLanguageModel:", self);

  return v4;
}

- (void)logTreeDescriptionWithLevel:(int)a3
{
  void *v5;
  int v6;
  NSObject *v7;
  void *v8;
  NSMutableArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t v19[128];
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v5 = (void *)objc_opt_new();
  if (a3 >= 1)
  {
    v6 = a3;
    do
    {
      objc_msgSend(v5, "appendString:", CFSTR(">"));
      --v6;
    }
    while (v6);
  }
  CACLogGeneral();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    -[CACLanguageModel description](self, "description");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v21 = v5;
    v22 = 2112;
    v23 = v8;
    _os_log_impl(&dword_229A40000, v7, OS_LOG_TYPE_DEFAULT, "%@%@", buf, 0x16u);

  }
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v9 = self->_children;
  v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v16;
    v13 = (a3 + 1);
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v16 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v14++), "logTreeDescriptionWithLevel:", v13, (_QWORD)v15);
      }
      while (v11 != v14);
      v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v11);
  }

}

- (id)description
{
  void *v3;
  NSMutableArray *v4;
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
  if (-[NSMutableArray count](self->_children, "count"))
  {
    v3 = (void *)objc_opt_new();
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v4 = self->_children;
    v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v12;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v12 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "description");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "appendFormat:", CFSTR("%@\n"), v9);

          ++v8;
        }
        while (v6 != v8);
        v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v6);
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%p '%@' ID: %@ Attributes: %@"), self, self->_text, self->_identifier, self->_attributes);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSString)text
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setText:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSMutableDictionary)attributes
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (NSArray)children
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_children, 0);
  objc_storeStrong((id *)&self->_attributes, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
