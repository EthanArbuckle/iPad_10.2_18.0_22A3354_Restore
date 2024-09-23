@implementation PPSocialHighlightStoreRequestKey

- (unint64_t)hash
{
  unint64_t limit;
  NSUInteger v4;
  NSUInteger v5;

  limit = self->_limit;
  v4 = -[NSString hash](self->_client, "hash") - limit + 32 * limit;
  v5 = -[NSString hash](self->_variant, "hash") - v4 + 32 * v4;
  return -[NSString hash](self->_reason, "hash") - v5 + 32 * v5;
}

- (BOOL)isEqual:(id)a3
{
  PPSocialHighlightStoreRequestKey *v4;
  PPSocialHighlightStoreRequestKey *v5;
  BOOL v6;

  v4 = (PPSocialHighlightStoreRequestKey *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PPSocialHighlightStoreRequestKey isEqualToSocialHighlightStoreRequestKey:](self, "isEqualToSocialHighlightStoreRequestKey:", v5);

  return v6;
}

- (BOOL)isEqualToSocialHighlightStoreRequestKey:(id)a3
{
  id v4;
  void *v5;
  unint64_t limit;
  int v7;
  void *v8;
  int v9;
  NSString *client;
  void *v11;
  int v12;
  int v13;
  void *v14;
  int v15;
  NSString *variant;
  void *v17;
  int v18;
  int v19;
  void *v20;
  int v21;
  NSString *reason;
  void *v23;
  char v24;

  v4 = a3;
  v5 = v4;
  if (!v4)
    goto LABEL_12;
  limit = self->_limit;
  if (limit != objc_msgSend(v4, "limit"))
    goto LABEL_12;
  v7 = self->_client != 0;
  objc_msgSend(v5, "client");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8 == 0;

  if (v7 == v9)
    goto LABEL_12;
  client = self->_client;
  if (client)
  {
    objc_msgSend(v5, "client");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[NSString isEqual:](client, "isEqual:", v11);

    if (!v12)
      goto LABEL_12;
  }
  v13 = self->_variant != 0;
  objc_msgSend(v5, "variant");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14 == 0;

  if (v13 == v15)
    goto LABEL_12;
  variant = self->_variant;
  if (variant)
  {
    objc_msgSend(v5, "variant");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[NSString isEqual:](variant, "isEqual:", v17);

    if (!v18)
      goto LABEL_12;
  }
  v19 = self->_reason != 0;
  objc_msgSend(v5, "reason");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v20 == 0;

  if (v19 == v21)
  {
LABEL_12:
    v24 = 0;
  }
  else
  {
    reason = self->_reason;
    if (reason)
    {
      objc_msgSend(v5, "reason");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = -[NSString isEqual:](reason, "isEqual:", v23);

    }
    else
    {
      v24 = 1;
    }
  }

  return v24;
}

- (NSString)variant
{
  return self->_variant;
}

- (NSString)client
{
  return self->_client;
}

- (unint64_t)limit
{
  return self->_limit;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_variant, 0);
  objc_storeStrong((id *)&self->_client, 0);
}

- (PPSocialHighlightStoreRequestKey)initWithLimit:(unint64_t)a3 client:(id)a4 variant:(id)a5 reason:(id)a6
{
  id v12;
  id v13;
  id v14;
  PPSocialHighlightStoreRequestKey *v15;
  PPSocialHighlightStoreRequestKey *v16;
  void *v18;
  void *v19;
  objc_super v20;

  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (v12)
  {
    if (v13)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PPSocialHighlightStore.m"), 56, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("client != nil"));

    if (v13)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PPSocialHighlightStore.m"), 57, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("variant != nil"));

LABEL_3:
  v20.receiver = self;
  v20.super_class = (Class)PPSocialHighlightStoreRequestKey;
  v15 = -[PPSocialHighlightStoreRequestKey init](&v20, sel_init);
  v16 = v15;
  if (v15)
  {
    v15->_limit = a3;
    objc_storeStrong((id *)&v15->_client, a4);
    objc_storeStrong((id *)&v16->_variant, a5);
    objc_storeStrong((id *)&v16->_reason, a6);
  }

  return v16;
}

- (id)copyWithReplacementLimit:(unint64_t)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithLimit:client:variant:reason:", a3, self->_client, self->_variant, self->_reason);
}

- (id)copyWithReplacementClient:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithLimit:client:variant:reason:", self->_limit, v4, self->_variant, self->_reason);

  return v5;
}

- (id)copyWithReplacementVariant:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithLimit:client:variant:reason:", self->_limit, self->_client, v4, self->_reason);

  return v5;
}

- (id)copyWithReplacementReason:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithLimit:client:variant:reason:", self->_limit, self->_client, self->_variant, v4);

  return v5;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_limit);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<PPSocialHighlightStoreRequestKey | limit:%@ client:%@ variant:%@ reason:%@>"), v4, self->_client, self->_variant, self->_reason);

  return v5;
}

- (NSString)reason
{
  return self->_reason;
}

+ (id)socialHighlightStoreRequestKeyWithLimit:(unint64_t)a3 client:(id)a4 variant:(id)a5 reason:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithLimit:client:variant:reason:", a3, v12, v11, v10);

  return v13;
}

@end
