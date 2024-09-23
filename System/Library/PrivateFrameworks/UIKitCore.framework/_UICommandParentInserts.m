@implementation _UICommandParentInserts

- (void)_setAtStartElements:(id)a3 atEndElements:(id)a4
{
  NSArray *v7;
  NSArray *v8;
  NSArray *atStartElements;
  NSArray *atEndElements;
  void *v11;
  void *v12;
  NSArray *v13;

  v7 = (NSArray *)a3;
  v8 = (NSArray *)a4;
  if (self->_atStartElements)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UICommandInternalDiff.m"), 36, CFSTR("at start elements already set"));

  }
  if (self->_atEndElements)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UICommandInternalDiff.m"), 37, CFSTR("at end elements already set"));

  }
  atStartElements = self->_atStartElements;
  self->_atStartElements = v7;
  v13 = v7;

  atEndElements = self->_atEndElements;
  self->_atEndElements = v8;

}

- (void)_setBeforeElements:(id)a3 afterElements:(id)a4 aroundElement:(id)a5
{
  NSMutableDictionary *childInserts;
  id v10;
  id v11;
  void *v12;
  _UICommandChildInserts *v13;
  NSMutableDictionary *v14;
  NSMutableDictionary *v15;
  NSMutableDictionary *v16;
  void *v17;
  id v18;

  v18 = a5;
  childInserts = self->_childInserts;
  v10 = a4;
  v11 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](childInserts, "objectForKeyedSubscript:", v18);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UICommandInternalDiff.m"), 45, CFSTR("child insert already set"));

  }
  v13 = objc_alloc_init(_UICommandChildInserts);
  -[_UICommandChildInserts _setBeforeElements:afterElements:](v13, "_setBeforeElements:afterElements:", v11, v10);

  v14 = self->_childInserts;
  if (v14)
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:](v14, "setObject:forKeyedSubscript:", v13, v18);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithObject:forKey:", v13, v18);
    v15 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    v16 = self->_childInserts;
    self->_childInserts = v15;

  }
}

- (void)_addFallbackBeforeElements:(id)a3 fallbackAfterElements:(id)a4
{
  id v6;
  NSMutableArray *fallbackBeforeElements;
  NSMutableArray *v8;
  NSMutableArray *v9;
  NSMutableArray *fallbackAfterElements;
  NSMutableArray *v11;
  NSMutableArray *v12;
  id v13;

  v13 = a3;
  v6 = a4;
  if (objc_msgSend(v13, "count"))
  {
    fallbackBeforeElements = self->_fallbackBeforeElements;
    if (fallbackBeforeElements)
    {
      -[NSMutableArray addObject:](fallbackBeforeElements, "addObject:", v13);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v13);
      v8 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
      v9 = self->_fallbackBeforeElements;
      self->_fallbackBeforeElements = v8;

    }
  }
  if (objc_msgSend(v6, "count"))
  {
    fallbackAfterElements = self->_fallbackAfterElements;
    if (fallbackAfterElements)
    {
      -[NSMutableArray addObject:](fallbackAfterElements, "addObject:", v6);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v6);
      v11 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
      v12 = self->_fallbackAfterElements;
      self->_fallbackAfterElements = v11;

    }
  }

}

- (NSArray)atStartElements
{
  return self->_atStartElements;
}

- (NSArray)atEndElements
{
  return self->_atEndElements;
}

- (NSDictionary)childInserts
{
  return &self->_childInserts->super;
}

- (NSArray)fallbackBeforeElements
{
  return &self->_fallbackBeforeElements->super;
}

- (NSArray)fallbackAfterElements
{
  return &self->_fallbackAfterElements->super;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_atEndElements, 0);
  objc_storeStrong((id *)&self->_atStartElements, 0);
  objc_storeStrong((id *)&self->_fallbackAfterElements, 0);
  objc_storeStrong((id *)&self->_fallbackBeforeElements, 0);
  objc_storeStrong((id *)&self->_childInserts, 0);
}

@end
