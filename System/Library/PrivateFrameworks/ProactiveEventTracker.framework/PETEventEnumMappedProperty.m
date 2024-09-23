@implementation PETEventEnumMappedProperty

- (id)_loggingKeyStringRepresentationForValue:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  if (-[PETEventEnumMappedProperty isValidValue:](self, "isValidValue:", v4))
  {
    if (self->_autoSanitizeValues)
    {
      -[NSDictionary objectForKeyedSubscript:](self->_enumMap, "objectForKeyedSubscript:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      +[PETEventStringValidator sanitizedString:](PETEventStringValidator, "sanitizedString:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      -[NSDictionary objectForKeyedSubscript:](self->_enumMap, "objectForKeyedSubscript:", v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)isValidValue:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[NSDictionary objectForKeyedSubscript:](self->_enumMap, "objectForKeyedSubscript:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5 != 0;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (PETEventEnumMappedProperty)initWithName:(id)a3 enumMapping:(id)a4 autoSanitizeValues:(BOOL)a5
{
  id v8;
  PETEventEnumMappedProperty *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSDictionary *enumMap;
  objc_super v16;

  v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)PETEventEnumMappedProperty;
  v9 = -[PETEventProperty initWithName:](&v16, sel_initWithName_, a3);
  if (v9)
  {
    if (!a5
      && !+[PETEventStringValidator dictionaryContainsValidStrings:](PETEventStringValidator, "dictionaryContainsValidStrings:", v8))
    {
      v10 = (void *)MEMORY[0x1E0C99DA0];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("mapping keys/values may only contain [a-zA-Z0-9_] and may not be prefixed with _: %@"), v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "exceptionWithName:reason:userInfo:", CFSTR("PETEventTrackingException"), v11, 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v12, "raise");
    }
    v13 = objc_msgSend(v8, "copy");
    enumMap = v9->_enumMap;
    v9->_enumMap = (NSDictionary *)v13;

    v9->_autoSanitizeValues = a5;
  }

  return v9;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[PETEventProperty name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("EnumMapped: Name=%@ Mapping=%@"), v4, self->_enumMap);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (_NSRange)validRange
{
  NSUInteger v2;
  NSUInteger v3;
  _NSRange result;

  v2 = 0;
  v3 = 0;
  result.length = v3;
  result.location = v2;
  return result;
}

- (id)possibleValues
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x1E0C99E60]);
  -[NSDictionary allKeys](self->_enumMap, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithArray:", v4);

  return v5;
}

- (unint64_t)cardinality
{
  return -[NSDictionary count](self->_enumMap, "count");
}

- (id)longestValueString
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __CFString *v6;
  uint64_t i;
  void *v8;
  unint64_t v9;
  __CFString *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[NSDictionary allValues](self->_enumMap, "allValues", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v13;
    v6 = &stru_1E2A41AA0;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v13 != v5)
          objc_enumerationMutation(v2);
        v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        v9 = objc_msgSend(v8, "length");
        if (v9 > -[__CFString length](v6, "length"))
        {
          v10 = v8;

          v6 = v10;
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v4);
  }
  else
  {
    v6 = &stru_1E2A41AA0;
  }

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enumMap, 0);
}

@end
