@implementation PETEventStringValuedProperty

- (id)_loggingKeyStringRepresentationForValue:(id)a3
{
  id v4;
  id v5;
  void *v6;

  v4 = a3;
  if (-[PETEventStringValuedProperty isValidValue:](self, "isValidValue:", v4))
  {
    if (self->_autoSanitizeValues)
    {
      +[PETEventStringValidator sanitizedString:](PETEventStringValidator, "sanitizedString:", v4);
      v5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = v4;
    }
    v6 = v5;
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
  _BOOL4 autoSanitizeValues;
  NSSet *possibleValues;
  void *v7;
  BOOL v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    autoSanitizeValues = self->_autoSanitizeValues;
    possibleValues = self->_possibleValues;
    if (autoSanitizeValues)
    {
      +[PETEventStringValidator sanitizedString:](PETEventStringValidator, "sanitizedString:", v4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = -[NSSet containsObject:](possibleValues, "containsObject:", v7);

    }
    else
    {
      v8 = -[NSSet containsObject:](possibleValues, "containsObject:", v4);
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_possibleValues, 0);
}

- (PETEventStringValuedProperty)initWithName:(id)a3 possibleValues:(id)a4 autoSanitizeValues:(BOOL)a5
{
  id v8;
  PETEventStringValuedProperty *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  NSSet *possibleValues;
  objc_super v16;

  v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)PETEventStringValuedProperty;
  v9 = -[PETEventProperty initWithName:](&v16, sel_initWithName_, a3);
  if (v9)
  {
    if (a5)
    {
      +[PETEventStringValidator sanitizedSet:](PETEventStringValidator, "sanitizedSet:", v8);
      v10 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (!+[PETEventStringValidator setContainsValidStrings:](PETEventStringValidator, "setContainsValidStrings:", v8))
      {
        v11 = (void *)MEMORY[0x1E0C99DA0];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("possibleValues may only contain [a-zA-Z0-9_] and may not be prefixed with _ -- possibleValues was: %@"), v8);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "exceptionWithName:reason:userInfo:", CFSTR("PETEventTrackingException"), v12, 0);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v13, "raise");
      }
      v10 = objc_msgSend(v8, "copy");
    }
    possibleValues = v9->_possibleValues;
    v9->_possibleValues = (NSSet *)v10;

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
  objc_msgSend(v3, "stringWithFormat:", CFSTR("StringValued: Name=%@ Values=%@"), v4, self->_possibleValues);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (unint64_t)cardinality
{
  return -[NSSet count](self->_possibleValues, "count");
}

- (id)possibleValues
{
  return self->_possibleValues;
}

- (id)longestValueString
{
  NSSet *v2;
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
  v2 = self->_possibleValues;
  v3 = -[NSSet countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
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
        v9 = objc_msgSend(v8, "length", (_QWORD)v12);
        if (v9 > -[__CFString length](v6, "length"))
        {
          v10 = v8;

          v6 = v10;
        }
      }
      v4 = -[NSSet countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v4);
  }
  else
  {
    v6 = &stru_1E2A41AA0;
  }

  return v6;
}

@end
