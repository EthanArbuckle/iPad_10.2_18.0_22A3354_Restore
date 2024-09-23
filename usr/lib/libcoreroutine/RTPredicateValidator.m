@implementation RTPredicateValidator

+ (BOOL)validatePredicate:(id)a3 allowedKeys:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a3;
  v10 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithPredicate:allowedKeys:", v9, v8);

  if (v10)
  {
    LOBYTE(a5) = objc_msgSend(v10, "validateWithError:", a5);
  }
  else if (a5)
  {
    v13 = *MEMORY[0x1E0CB2D50];
    v14[0] = CFSTR("Predicate was invalid because it was nil.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 0, v11);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

    LOBYTE(a5) = 0;
  }

  return (char)a5;
}

- (RTPredicateValidator)initWithPredicate:(id)a3 allowedKeys:(id)a4
{
  id v6;
  id v7;
  RTPredicateValidator *v8;
  uint64_t v9;
  NSPredicate *predicate;
  uint64_t v11;
  NSSet *allowedKeys;
  RTPredicateValidator *v13;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    v15.receiver = self;
    v15.super_class = (Class)RTPredicateValidator;
    v8 = -[RTPredicateValidator init](&v15, sel_init);
    if (v8)
    {
      v9 = objc_msgSend(v6, "copy");
      predicate = v8->_predicate;
      v8->_predicate = (NSPredicate *)v9;

      if (v7)
      {
        objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v7);
        v11 = objc_claimAutoreleasedReturnValue();
        allowedKeys = v8->_allowedKeys;
        v8->_allowedKeys = (NSSet *)v11;

      }
    }
    self = v8;
    v13 = self;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (BOOL)validateWithError:(id *)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[RTPredicateValidator setValidated:](self, "setValidated:", 1);
  -[RTPredicateValidator predicate](self, "predicate");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    -[RTPredicateValidator allowedKeys](self, "allowedKeys");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[RTPredicateValidator predicate](self, "predicate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "acceptVisitor:flags:", self, 3);

      if (a3)
      {
        -[RTPredicateValidator error](self, "error");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (v9)
        {
          -[RTPredicateValidator error](self, "error");
          *a3 = (id)objc_claimAutoreleasedReturnValue();
        }
      }
    }
  }
  return -[RTPredicateValidator validated](self, "validated");
}

- (void)visitPredicateExpression:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint64_t v34;
  void *v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!-[RTPredicateValidator validated](self, "validated"))
    goto LABEL_32;
  v5 = objc_alloc(MEMORY[0x1E0C99E60]);
  v29 = (void *)objc_msgSend(v5, "initWithObjects:", *MEMORY[0x1E0CB2880], *MEMORY[0x1E0CB28E0], *MEMORY[0x1E0CB2970], *MEMORY[0x1E0CB2978], *MEMORY[0x1E0CB2980], *MEMORY[0x1E0CB2DD0], *MEMORY[0x1E0CB2F68], *MEMORY[0x1E0CB3248], *MEMORY[0x1E0CB33E0], *MEMORY[0x1E0CB33E8], *MEMORY[0x1E0CB33F0], 0);
  v6 = objc_msgSend(v4, "expressionType");
  v28 = v4;
  if (v6 != 10)
  {
    if (v6 == 4)
    {
      v21 = (void *)MEMORY[0x1E0CB35D0];
      objc_msgSend(v4, "function");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "arguments");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "expressionForFunction:arguments:", v22, v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v24)
      {
        -[RTPredicateValidator setValidated:](self, "setValidated:", 0);
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 0, 0);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[RTPredicateValidator setError:](self, "setError:", v25);

        v24 = 0;
      }

      goto LABEL_31;
    }
    if (v6 != 3)
      goto LABEL_31;
  }
  objc_msgSend(v4, "keyPath");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 0, 0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTPredicateValidator setError:](self, "setError:", v26);

    -[RTPredicateValidator setValidated:](self, "setValidated:", 0);
    goto LABEL_30;
  }
  objc_msgSend(v4, "keyPath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "componentsSeparatedByString:", CFSTR("."));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v9 = v8;
  v10 = 0;
  v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
  if (!v11)
    goto LABEL_23;
  v12 = *(_QWORD *)v31;
  do
  {
    for (i = 0; i != v11; ++i)
    {
      if (*(_QWORD *)v31 != v12)
        objc_enumerationMutation(v9);
      v14 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
      if (objc_msgSend(v14, "hasPrefix:", CFSTR("@")))
      {
        if ((unint64_t)objc_msgSend(v14, "length") < 2)
          goto LABEL_20;
        objc_msgSend(v14, "substringFromIndex:", 1);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v29, "containsObject:", v15) & 1) == 0)
          -[RTPredicateValidator setValidated:](self, "setValidated:", 0);

      }
      else
      {
        -[RTPredicateValidator allowedKeys](self, "allowedKeys");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "containsObject:", v14);

        if ((v17 & 1) == 0)
        {
LABEL_20:
          -[RTPredicateValidator setValidated:](self, "setValidated:", 0);
          continue;
        }
        if (!v10)
          v10 = (void *)objc_opt_new();
        objc_msgSend(v10, "addObject:", v14);
      }
    }
    v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
  }
  while (v11);
LABEL_23:

  if (!-[RTPredicateValidator validated](self, "validated"))
  {
    v34 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Used keys: %@"), v10);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = v18;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v35, &v34, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 0, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTPredicateValidator setError:](self, "setError:", v20);

  }
LABEL_30:

LABEL_31:
  v4 = v28;
LABEL_32:

}

- (BOOL)validated
{
  return self->_validated;
}

- (void)setValidated:(BOOL)a3
{
  self->_validated = a3;
}

- (NSPredicate)predicate
{
  return self->_predicate;
}

- (void)setPredicate:(id)a3
{
  objc_storeStrong((id *)&self->_predicate, a3);
}

- (NSSet)allowedKeys
{
  return self->_allowedKeys;
}

- (void)setAllowedKeys:(id)a3
{
  objc_storeStrong((id *)&self->_allowedKeys, a3);
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_allowedKeys, 0);
  objc_storeStrong((id *)&self->_predicate, 0);
}

@end
