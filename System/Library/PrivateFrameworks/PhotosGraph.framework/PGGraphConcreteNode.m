@implementation PGGraphConcreteNode

- (PGGraphConcreteNode)initWithLabel:(id)a3 domain:(unsigned __int16)a4 properties:(id)a5
{
  id v8;
  id v9;
  PGGraphConcreteNode *v10;
  uint64_t v11;
  NSString *label;
  uint64_t v13;
  NSMutableDictionary *properties;
  objc_super v16;

  v8 = a3;
  v9 = a5;
  v16.receiver = self;
  v16.super_class = (Class)PGGraphConcreteNode;
  v10 = -[PGGraphNode init](&v16, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v8, "copy");
    label = v10->_label;
    v10->_label = (NSString *)v11;

    v10->_domain = a4;
    v13 = objc_msgSend(v9, "mutableCopy");
    properties = v10->_properties;
    v10->_properties = (NSMutableDictionary *)v13;

  }
  return v10;
}

- (id)name
{
  return -[PGGraphConcreteNode _stringValueForPropertyWithKey:](self, "_stringValueForPropertyWithKey:", CFSTR("name"));
}

- (id)UUID
{
  return -[PGGraphConcreteNode _stringValueForPropertyWithKey:](self, "_stringValueForPropertyWithKey:", CFSTR("id"));
}

- (id)_stringValueForPropertyWithKey:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v9;
  NSObject *v10;
  int v11;
  id v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PGGraphConcreteNode propertyForKey:](self, "propertyForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
LABEL_4:
    v7 = v6;
    goto LABEL_5;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    ((void (*)(void *, char *))objc_msgSend(v5, "methodForSelector:", sel_stringValue))(v5, sel_stringValue);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_4;
  }
  +[PGLogging sharedLogging](PGLogging, "sharedLogging");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "loggingConnection");
  v10 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = 138412546;
    v12 = v4;
    v13 = 2112;
    v14 = v5;
    _os_log_impl(&dword_1CA237000, v10, OS_LOG_TYPE_INFO, "Unsupported type for property \"%@\": \"%@\". Returning nil.", (uint8_t *)&v11, 0x16u);
  }

  v7 = 0;
LABEL_5:

  return v7;
}

- (id)propertyForKey:(id)a3
{
  id v4;
  PGGraphConcreteNode *v5;
  NSMutableDictionary *properties;
  void *v7;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  properties = v5->_properties;
  if (properties)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](properties, "objectForKeyedSubscript:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  objc_sync_exit(v5);

  return v7;
}

- (BOOL)hasProperties
{
  PGGraphConcreteNode *v2;
  BOOL v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = -[NSMutableDictionary count](v2->_properties, "count") != 0;
  objc_sync_exit(v2);

  return v3;
}

- (unint64_t)propertiesCount
{
  PGGraphConcreteNode *v2;
  unint64_t v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = -[NSMutableDictionary count](v2->_properties, "count");
  objc_sync_exit(v2);

  return v3;
}

- (id)propertyKeys
{
  PGGraphConcreteNode *v2;
  NSMutableDictionary *properties;
  void *v4;
  void *v5;
  void *v6;

  v2 = self;
  objc_sync_enter(v2);
  properties = v2->_properties;
  if (properties && -[NSMutableDictionary count](properties, "count"))
  {
    v4 = (void *)MEMORY[0x1E0C99E60];
    -[NSMutableDictionary allKeys](v2->_properties, "allKeys");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setWithArray:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_sync_exit(v2);

  return v6;
}

- (id)propertyDictionary
{
  PGGraphConcreteNode *v2;
  void *v3;

  v2 = self;
  objc_sync_enter(v2);
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithDictionary:", v2->_properties);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v2);

  return v3;
}

- (void)enumeratePropertiesUsingBlock:(id)a3
{
  void (**v4)(id, uint64_t, void *, char *);
  PGGraphConcreteNode *v5;
  NSMutableDictionary *properties;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  char v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, uint64_t, void *, char *))a3;
  v5 = self;
  objc_sync_enter(v5);
  properties = v5->_properties;
  if (properties)
  {
    v17 = 0;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    -[NSMutableDictionary keyEnumerator](properties, "keyEnumerator", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v14;
LABEL_4:
      v10 = 0;
      while (1)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v7);
        v11 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10);
        -[NSMutableDictionary objectForKeyedSubscript:](v5->_properties, "objectForKeyedSubscript:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v4[2](v4, v11, v12, &v17);

        if (v17)
          break;
        if (v8 == ++v10)
        {
          v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
          if (v8)
            goto LABEL_4;
          break;
        }
      }
    }

  }
  objc_sync_exit(v5);

}

- (unsigned)domain
{
  return self->_domain;
}

- (id)label
{
  return self->_label;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_properties, 0);
}

@end
