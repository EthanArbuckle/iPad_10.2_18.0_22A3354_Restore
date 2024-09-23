@implementation WFChooseFromMenuItemSynonym

- (WFChooseFromMenuItemSynonym)initWithIdentity:(id)a3 synonym:(id)a4
{
  id v7;
  id v8;
  WFChooseFromMenuItemSynonym *v9;
  WFChooseFromMenuItemSynonym *v10;
  WFChooseFromMenuItemSynonym *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)WFChooseFromMenuItemSynonym;
  v9 = -[WFChooseFromMenuItemSynonym init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_identity, a3);
    objc_storeStrong((id *)&v10->_synonym, a4);
    v11 = v10;
  }

  return v10;
}

- (unint64_t)hash
{
  uint64_t v3;

  v3 = -[NSUUID hash](self->_identity, "hash");
  return -[WFVariableString hash](self->_synonym, "hash") ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSUUID *identity;
  void *v8;
  NSUUID *v9;
  WFVariableString *v10;
  WFVariableString *v11;
  int v12;
  WFVariableString *synonym;
  void *v14;
  WFVariableString *v15;
  NSUUID *v16;

  v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
  }
  else
  {
    v5 = 0;
  }
  v6 = v5;
  identity = self->_identity;
  objc_msgSend(v6, "identity");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = identity;
  v10 = v8;
  v11 = v10;
  if (v9 == (NSUUID *)v10)
  {

LABEL_12:
    synonym = self->_synonym;
    objc_msgSend(v6, "synonym");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = synonym;
    v16 = v14;
    v9 = v16;
    if (v15 == (WFVariableString *)v16)
    {
      LOBYTE(v12) = 1;
    }
    else
    {
      LOBYTE(v12) = 0;
      if (v15 && v16)
        LOBYTE(v12) = -[WFVariableString isEqual:](v15, "isEqual:", v16);
    }

    goto LABEL_19;
  }
  LOBYTE(v12) = 0;
  if (v9 && v10)
  {
    v12 = -[NSUUID isEqual:](v9, "isEqual:", v10);

    if (!v12)
      goto LABEL_20;
    goto LABEL_12;
  }
  v15 = v10;
LABEL_19:

LABEL_20:
  return v12;
}

- (NSUUID)identity
{
  return self->_identity;
}

- (WFVariableString)synonym
{
  return self->_synonym;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_synonym, 0);
  objc_storeStrong((id *)&self->_identity, 0);
}

@end
