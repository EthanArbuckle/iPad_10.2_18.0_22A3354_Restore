@implementation CRRegisterMultiValue

- (CRRegisterMultiValue)initWithContents:(id)a3 document:(id)a4
{
  id v6;
  id v7;
  CRRegisterMultiValue *v8;
  CRSet *v9;
  CRSet *values;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CRRegisterMultiValue;
  v8 = -[CRRegisterMultiValue init](&v12, sel_init);
  if (v8)
  {
    v9 = -[CRSet initWithDocument:]([CRSet alloc], "initWithDocument:", v7);
    values = v8->_values;
    v8->_values = v9;

    if (v6)
      -[CRRegisterMultiValue setContents:](v8, "setContents:", v6);
  }

  return v8;
}

- (CRRegisterMultiValue)initWithValues:(id)a3
{
  id v5;
  CRRegisterMultiValue *v6;
  CRRegisterMultiValue *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CRRegisterMultiValue;
  v6 = -[CRRegisterMultiValue init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_values, a3);

  return v7;
}

- (void)encodeWithCRCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[CRRegisterMultiValue values](self, "values");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("values"));

}

- (CRRegisterMultiValue)initWithCRCoder:(id)a3
{
  id v4;
  void *v5;
  CRRegisterMultiValue *v6;
  void *v7;

  v4 = a3;
  objc_msgSend(v4, "document");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[CRRegisterMultiValue initWithContents:document:](self, "initWithContents:document:", 0, v5);

  if (v6)
  {
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("values"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_storeStrong((id *)&v6->_values, v7);

  }
  return v6;
}

- (id)allContents
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[CRRegisterMultiValue cachedValues](self, "cachedValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0C99E20]);
    -[CRRegisterMultiValue values](self, "values");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v4, "initWithCapacity:", objc_msgSend(v5, "count"));

    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    -[CRRegisterMultiValue values](self, "values", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v13;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v13 != v9)
            objc_enumerationMutation(v7);
          objc_msgSend(v6, "addObject:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v10++));
        }
        while (v8 != v10);
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v8);
    }

    -[CRRegisterMultiValue setCachedValues:](self, "setCachedValues:", v6);
  }
  -[CRRegisterMultiValue cachedValues](self, "cachedValues");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)contents
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[CRRegisterMultiValue values](self, "values", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = 0;
  v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v11;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v6);
        if (!v3 || objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v6), "compare:", v3) == 1)
        {
          v8 = v7;

          v3 = v8;
        }
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }

  return v3;
}

- (void)setContents:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[CRRegisterMultiValue values](self, "values");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:", v5);

  -[CRRegisterMultiValue setCachedValues:](self, "setCachedValues:", 0);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[CRRegisterMultiValue values](self, "values");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "values");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqual:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)mergeWith:(id)a3
{
  id v4;
  id v5;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], CFSTR("Invalid merge, classes must be equal for merge."), 0);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v4);
  }
  -[CRRegisterMultiValue mergeWithRegisterMultiValue:](self, "mergeWithRegisterMultiValue:", v5);
  -[CRRegisterMultiValue setCachedValues:](self, "setCachedValues:", 0);

}

- (void)mergeWithRegisterMultiValue:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[CRRegisterMultiValue values](self, "values");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "values");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mergeWith:", v5);

}

- (id)deltaSince:(id)a3 in:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  -[CRRegisterMultiValue values](self, "values");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "deltaSince:in:", v6, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    v10 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithValues:", v9);
  else
    v10 = 0;

  return v10;
}

- (void)walkGraph:(id)a3
{
  void *v4;
  void (**v5)(id, void *);

  v5 = (void (**)(id, void *))a3;
  -[CRRegisterMultiValue values](self, "values");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[2](v5, v4);

}

- (void)setDocument:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[CRRegisterMultiValue values](self, "values");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDocument:", v5);

}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB37A0];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p ("), v5, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[CRRegisterMultiValue values](self, "values");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v13;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v7);
        objc_msgSend(v6, "appendFormat:", CFSTR("%@, "), *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v10++));
      }
      while (v8 != v10);
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

  objc_msgSend(v6, "replaceCharactersInRange:withString:", objc_msgSend(v6, "length") - 2, 2, CFSTR(")>"));
  return v6;
}

- (CRSet)values
{
  return self->_values;
}

- (void)setValues:(id)a3
{
  objc_storeStrong((id *)&self->_values, a3);
}

- (NSSet)cachedValues
{
  return self->_cachedValues;
}

- (void)setCachedValues:(id)a3
{
  objc_storeStrong((id *)&self->_cachedValues, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedValues, 0);
  objc_storeStrong((id *)&self->_values, 0);
}

@end
