@implementation TRIFactorNamespaceRecord

- (TRIFactorNamespaceRecord)initWithFactorName:(id)a3 namespaceName:(id)a4
{
  id v8;
  id v9;
  void *v10;
  TRIFactorNamespaceRecord *v11;
  TRIFactorNamespaceRecord *v12;
  void *v14;
  void *v15;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (v8)
  {
    if (v9)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIServerTupleTypes.m"), 4875, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("factorName != nil"));

    if (v10)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIServerTupleTypes.m"), 4876, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("namespaceName != nil"));

LABEL_3:
  v16.receiver = self;
  v16.super_class = (Class)TRIFactorNamespaceRecord;
  v11 = -[TRIFactorNamespaceRecord init](&v16, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_factorName, a3);
    objc_storeStrong((id *)&v12->_namespaceName, a4);
  }

  return v12;
}

+ (id)factorRecordWithFactorName:(id)a3 namespaceName:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithFactorName:namespaceName:", v7, v6);

  return v8;
}

- (id)copyWithReplacementFactorName:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithFactorName:namespaceName:", v4, self->_namespaceName);

  return v5;
}

- (id)copyWithReplacementNamespaceName:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithFactorName:namespaceName:", self->_factorName, v4);

  return v5;
}

- (BOOL)isEqualToFactorRecord:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  int v8;
  NSString *factorName;
  void *v10;
  int v11;
  int v12;
  void *v13;
  int v14;
  NSString *namespaceName;
  void *v16;
  char v17;

  v4 = a3;
  v5 = v4;
  if (!v4)
    goto LABEL_8;
  v6 = self->_factorName != 0;
  objc_msgSend(v4, "factorName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7 == 0;

  if (v6 == v8)
    goto LABEL_8;
  factorName = self->_factorName;
  if (factorName)
  {
    objc_msgSend(v5, "factorName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[NSString isEqual:](factorName, "isEqual:", v10);

    if (!v11)
      goto LABEL_8;
  }
  v12 = self->_namespaceName != 0;
  objc_msgSend(v5, "namespaceName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13 == 0;

  if (v12 == v14)
  {
LABEL_8:
    v17 = 0;
  }
  else
  {
    namespaceName = self->_namespaceName;
    if (namespaceName)
    {
      objc_msgSend(v5, "namespaceName");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = -[NSString isEqual:](namespaceName, "isEqual:", v16);

    }
    else
    {
      v17 = 1;
    }
  }

  return v17;
}

- (BOOL)isEqual:(id)a3
{
  TRIFactorNamespaceRecord *v4;
  TRIFactorNamespaceRecord *v5;
  BOOL v6;

  v4 = (TRIFactorNamespaceRecord *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[TRIFactorNamespaceRecord isEqualToFactorRecord:](self, "isEqualToFactorRecord:", v5);

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3;

  v3 = -[NSString hash](self->_factorName, "hash");
  return -[NSString hash](self->_namespaceName, "hash") - v3 + 32 * v3;
}

- (id)description
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("<TRIFactorNamespaceRecord | factorName:%@ namespaceName:%@>"), self->_factorName, self->_namespaceName);
}

- (NSString)factorName
{
  return self->_factorName;
}

- (NSString)namespaceName
{
  return self->_namespaceName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_namespaceName, 0);
  objc_storeStrong((id *)&self->_factorName, 0);
}

@end
