@implementation WFMultipleValueParameterStateEntry

- (WFMultipleValueParameterStateEntry)initWithIdentity:(id)a3 parameterState:(id)a4
{
  id v7;
  id v8;
  WFMultipleValueParameterStateEntry *v9;
  WFMultipleValueParameterStateEntry *v10;
  WFMultipleValueParameterStateEntry *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)WFMultipleValueParameterStateEntry;
  v9 = -[WFMultipleValueParameterStateEntry init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_identity, a3);
    objc_storeStrong((id *)&v10->_parameterState, a4);
    v11 = v10;
  }

  return v10;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[WFMultipleValueParameterStateEntry identity](self, "identity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[WFMultipleValueParameterStateEntry parameterState](self, "parameterState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;

  v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[WFMultipleValueParameterStateEntry identity](self, "identity");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "identity");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v5;
      v8 = v6;
      v9 = v8;
      if (v7 == v8)
      {

      }
      else
      {
        LOBYTE(v10) = 0;
        v11 = v8;
        v12 = v7;
        if (!v7 || !v8)
          goto LABEL_11;
        v10 = objc_msgSend(v7, "isEqual:", v8);

        if (!v10)
          goto LABEL_12;
      }
      -[WFMultipleValueParameterStateEntry parameterState](self, "parameterState");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "parameterState");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v10) = objc_msgSend(v12, "isEqual:", v11);
LABEL_11:

LABEL_12:
      goto LABEL_13;
    }
  }
  LOBYTE(v10) = 0;
LABEL_13:

  return v10;
}

- (NSUUID)identity
{
  return self->_identity;
}

- (WFParameterState)parameterState
{
  return self->_parameterState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameterState, 0);
  objc_storeStrong((id *)&self->_identity, 0);
}

@end
