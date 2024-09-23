@implementation UIGestureGraphElement

- (BOOL)hasProperties:(id)a3
{
  unint64_t v5;
  BOOL v6;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  v5 = objc_msgSend(a3, "count");
  if (v5 > -[NSMutableDictionary count](self->_properties, "count"))
    return 0;
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 1;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __39__UIGestureGraphElement_hasProperties___block_invoke;
  v8[3] = &unk_1E16BCBE0;
  v8[4] = self;
  v8[5] = &v9;
  objc_msgSend(a3, "enumerateKeysAndObjectsUsingBlock:", v8);
  v6 = *((_BYTE *)v10 + 24) != 0;
  _Block_object_dispose(&v9, 8);
  return v6;
}

- (void)setProperties:(id)a3
{
  NSMutableDictionary *properties;
  NSMutableDictionary *v6;
  NSMutableDictionary *v7;

  properties = self->_properties;
  if (!properties)
  {
    v6 = (NSMutableDictionary *)objc_opt_new();
    v7 = self->_properties;
    self->_properties = v6;

    properties = self->_properties;
  }
  -[NSMutableDictionary setDictionary:](properties, "setDictionary:", a3);
}

- (UIGestureGraphElement)initWithLabel:(id)a3
{
  UIGestureGraphElement *v5;
  uint64_t v6;
  NSString *label;
  void *v10;
  objc_super v11;

  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIGestureGraphElement.m"), 22, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("label"));

  }
  v11.receiver = self;
  v11.super_class = (Class)UIGestureGraphElement;
  v5 = -[UIGestureGraphElement init](&v11, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(a3, "copy");
    label = v5->_label;
    v5->_label = (NSString *)v6;

  }
  return v5;
}

- (NSString)label
{
  return self->_label;
}

- (void)removePropertyForKey:(id)a3
{
  -[NSMutableDictionary removeObjectForKey:](self->_properties, "removeObjectForKey:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_properties, 0);
}

- (id)propertyForKey:(id)a3
{
  return (id)-[NSMutableDictionary objectForKey:](self->_properties, "objectForKey:", a3);
}

void __39__UIGestureGraphElement_hasProperties___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  void *v7;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "objectForKeyedSubscript:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = objc_msgSend(v7, "isEqual:", a3);

  if ((a3 & 1) == 0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    *a4 = 1;
  }
}

- (void)enumeratePropertiesUsingBlock:(id)a3
{
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](self->_properties, "enumerateKeysAndObjectsUsingBlock:", a3);
}

- (void)removeAllProperties
{
  -[NSMutableDictionary removeAllObjects](self->_properties, "removeAllObjects");
}

- (void)setProperty:(id)a3 forKey:(id)a4
{
  NSMutableDictionary *properties;
  NSMutableDictionary *v8;
  NSMutableDictionary *v9;

  properties = self->_properties;
  if (!properties)
  {
    v8 = (NSMutableDictionary *)objc_opt_new();
    v9 = self->_properties;
    self->_properties = v8;

    properties = self->_properties;
  }
  -[NSMutableDictionary setObject:forKey:](properties, "setObject:forKey:", a3, a4);
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", CFSTR("{"));
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[NSMutableDictionary keyEnumerator](self->_properties, "keyEnumerator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v19 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
        -[UIGestureGraphElement propertyForKey:](self, "propertyForKey:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v12 = v11;
          }
          else
          {
            if ((objc_opt_respondsToSelector() & 1) != 0)
              objc_msgSend(v11, "stringValue");
            else
              objc_msgSend(v11, "description");
            v12 = (id)objc_claimAutoreleasedReturnValue();
          }
          v13 = v12;
          objc_msgSend(v3, "appendFormat:", CFSTR("%@:'%@'; "), v10, v12);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v7);
  }

  if ((unint64_t)objc_msgSend(v3, "length") >= 2)
    objc_msgSend(v3, "deleteCharactersInRange:", objc_msgSend(v3, "length") - 2, 2);
  objc_msgSend(v3, "appendString:", CFSTR("}"));
  v14 = (void *)MEMORY[0x1E0CB3940];
  -[UIGestureGraphElement label](self, "label");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringWithFormat:", CFSTR("(%@ %@)"), v15, v3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

@end
