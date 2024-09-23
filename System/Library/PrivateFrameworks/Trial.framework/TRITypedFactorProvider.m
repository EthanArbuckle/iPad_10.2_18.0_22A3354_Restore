@implementation TRITypedFactorProvider

- (TRITypedFactorProvider)initWithType:(unint64_t)a3 provider:(id)a4 logDesc:(id)a5
{
  id v10;
  id v11;
  void *v12;
  TRITypedFactorProvider *v13;
  TRITypedFactorProvider *v14;
  void *v16;
  void *v17;
  objc_super v18;

  v10 = a4;
  v11 = a5;
  v12 = v11;
  if (v10)
  {
    if (v11)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIClientTupleTypes.m"), 1483, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("provider != nil"));

    if (v12)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIClientTupleTypes.m"), 1484, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("logDesc != nil"));

LABEL_3:
  v18.receiver = self;
  v18.super_class = (Class)TRITypedFactorProvider;
  v13 = -[TRITypedFactorProvider init](&v18, sel_init);
  v14 = v13;
  if (v13)
  {
    v13->_type = a3;
    objc_storeStrong((id *)&v13->_provider, a4);
    objc_storeStrong((id *)&v14->_logDesc, a5);
  }

  return v14;
}

- (TRINamespaceFactorProviding)provider
{
  return self->_provider;
}

- (unint64_t)type
{
  return self->_type;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logDesc, 0);
  objc_storeStrong((id *)&self->_provider, 0);
}

+ (id)providerWithType:(unint64_t)a3 provider:(id)a4 logDesc:(id)a5
{
  id v8;
  id v9;
  void *v10;

  v8 = a5;
  v9 = a4;
  v10 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithType:provider:logDesc:", a3, v9, v8);

  return v10;
}

- (id)copyWithReplacementType:(unint64_t)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithType:provider:logDesc:", a3, self->_provider, self->_logDesc);
}

- (id)copyWithReplacementProvider:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithType:provider:logDesc:", self->_type, v4, self->_logDesc);

  return v5;
}

- (id)copyWithReplacementLogDesc:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithType:provider:logDesc:", self->_type, self->_provider, v4);

  return v5;
}

- (BOOL)isEqualToProvider:(id)a3
{
  id v4;
  void *v5;
  unint64_t type;
  int v7;
  void *v8;
  int v9;
  TRINamespaceFactorProviding *provider;
  void *v11;
  int v12;
  int v13;
  void *v14;
  int v15;
  NSString *logDesc;
  void *v17;
  char v18;

  v4 = a3;
  v5 = v4;
  if (!v4)
    goto LABEL_9;
  type = self->_type;
  if (type != objc_msgSend(v4, "type"))
    goto LABEL_9;
  v7 = self->_provider != 0;
  objc_msgSend(v5, "provider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8 == 0;

  if (v7 == v9)
    goto LABEL_9;
  provider = self->_provider;
  if (provider)
  {
    objc_msgSend(v5, "provider");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[TRINamespaceFactorProviding isEqual:](provider, "isEqual:", v11);

    if (!v12)
      goto LABEL_9;
  }
  v13 = self->_logDesc != 0;
  objc_msgSend(v5, "logDesc");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14 == 0;

  if (v13 == v15)
  {
LABEL_9:
    v18 = 0;
  }
  else
  {
    logDesc = self->_logDesc;
    if (logDesc)
    {
      objc_msgSend(v5, "logDesc");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = -[NSString isEqual:](logDesc, "isEqual:", v17);

    }
    else
    {
      v18 = 1;
    }
  }

  return v18;
}

- (BOOL)isEqual:(id)a3
{
  TRITypedFactorProvider *v4;
  TRITypedFactorProvider *v5;
  BOOL v6;

  v4 = (TRITypedFactorProvider *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[TRITypedFactorProvider isEqualToProvider:](self, "isEqualToProvider:", v5);

  return v6;
}

- (unint64_t)hash
{
  unint64_t type;
  uint64_t v4;

  type = self->_type;
  v4 = -[TRINamespaceFactorProviding hash](self->_provider, "hash") - type + 32 * type;
  return -[NSString hash](self->_logDesc, "hash") - v4 + 32 * v4;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_type);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<TRITypedFactorProvider | type:%@ provider:%@ logDesc:%@>"), v4, self->_provider, self->_logDesc);

  return v5;
}

- (NSString)logDesc
{
  return self->_logDesc;
}

@end
