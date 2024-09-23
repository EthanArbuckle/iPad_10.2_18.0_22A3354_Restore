@implementation WFActionRequest

- (WFAction)result
{
  return self->_result;
}

- (NSDictionary)serializedParameters
{
  return self->_serializedParameters;
}

- (NSString)actionIdentifier
{
  return self->_actionIdentifier;
}

- (void)setResult:(id)a3
{
  objc_storeStrong((id *)&self->_result, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_result, 0);
  objc_storeStrong((id *)&self->_serializedParameters, 0);
  objc_storeStrong((id *)&self->_actionIdentifier, 0);
}

- (WFActionRequest)initWithActionIdentifier:(id)a3 serializedParameters:(id)a4
{
  id v6;
  id v7;
  WFActionRequest *v8;
  uint64_t v9;
  NSString *actionIdentifier;
  uint64_t v11;
  NSDictionary *serializedParameters;
  WFActionRequest *v13;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)WFActionRequest;
  v8 = -[WFActionRequest init](&v15, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    actionIdentifier = v8->_actionIdentifier;
    v8->_actionIdentifier = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    serializedParameters = v8->_serializedParameters;
    v8->_serializedParameters = (NSDictionary *)v11;

    v13 = v8;
  }

  return v8;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)WFActionRequest;
  -[WFActionRequest description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFActionRequest actionIdentifier](self, "actionIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ for %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  unsigned int v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  int v14;
  void *v15;
  id v16;
  int v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  objc_super v27;

  v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)WFActionRequest;
  v5 = -[WFActionRequest isEqual:](&v27, sel_isEqual_, v4);
  v6 = v4;
  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;
  }
  else
  {
    v7 = 0;
  }
  v8 = v7;

  if (v5)
  {
    -[WFActionRequest actionIdentifier](self, "actionIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "actionIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v9;
    v12 = v10;
    v13 = v12;
    if (v11 == v12)
    {

    }
    else
    {
      LOBYTE(v14) = 0;
      v15 = v12;
      v16 = v11;
      if (!v11 || !v12)
        goto LABEL_27;
      v17 = objc_msgSend(v11, "isEqualToString:", v12);

      if (!v17)
      {
        LOBYTE(v14) = 0;
LABEL_28:

        goto LABEL_29;
      }
    }
    -[WFActionRequest serializedParameters](self, "serializedParameters");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "serializedParameters");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v18;
    v20 = v19;
    v15 = v20;
    if (v16 == v20)
    {

    }
    else
    {
      LOBYTE(v14) = 0;
      v21 = v20;
      v22 = v16;
      if (!v16 || !v20)
      {
LABEL_26:

LABEL_27:
        goto LABEL_28;
      }
      v14 = objc_msgSend(v16, "isEqualToDictionary:", v20);

      if (!v14)
        goto LABEL_27;
    }
    -[WFActionRequest result](self, "result");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "result");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v23;
    v25 = v24;
    v21 = v25;
    if (v22 == v25)
    {
      LOBYTE(v14) = 1;
    }
    else
    {
      LOBYTE(v14) = 0;
      if (v22 && v25)
        LOBYTE(v14) = objc_msgSend(v22, "isEqual:", v25);
    }

    goto LABEL_26;
  }
  LOBYTE(v14) = 0;
LABEL_29:

  return v14;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;

  -[WFActionRequest actionIdentifier](self, "actionIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[WFActionRequest serializedParameters](self, "serializedParameters");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[WFActionRequest result](self, "result");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6 ^ objc_msgSend(v7, "hash");

  return v8;
}

@end
