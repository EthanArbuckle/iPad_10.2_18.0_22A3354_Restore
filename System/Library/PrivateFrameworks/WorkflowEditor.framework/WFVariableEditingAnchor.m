@implementation WFVariableEditingAnchor

- (WFVariableEditingAnchor)initWithVariable:(id)a3 variableProvider:(id)a4 parameter:(id)a5
{
  id v10;
  id v11;
  id v12;
  WFVariableEditingAnchor *v13;
  WFVariableEditingAnchor *v14;
  WFVariableEditingAnchor *v15;
  void *v17;
  void *v18;
  void *v19;
  objc_super v20;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (v10)
  {
    if (v11)
      goto LABEL_3;
LABEL_8:
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFVariableEditingOptions.m"), 19, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("variableProvider"));

    if (v12)
      goto LABEL_4;
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFVariableEditingOptions.m"), 18, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("variable"));

  if (!v11)
    goto LABEL_8;
LABEL_3:
  if (v12)
    goto LABEL_4;
LABEL_9:
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFVariableEditingOptions.m"), 20, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("parameter"));

LABEL_4:
  v20.receiver = self;
  v20.super_class = (Class)WFVariableEditingAnchor;
  v13 = -[WFVariableEditingAnchor init](&v20, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_variable, a3);
    objc_storeStrong((id *)&v14->_variableProvider, a4);
    objc_storeStrong((id *)&v14->_parameter, a5);
    v15 = v14;
  }

  return v14;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;

  v3 = -[WFVariable hash](self->_variable, "hash");
  v4 = -[WFVariableProvider hash](self->_variableProvider, "hash") ^ v3;
  return v4 ^ -[WFParameter hash](self->_parameter, "hash");
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    -[WFVariableEditingAnchor variable](self, "variable");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "variable");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5 == v6)
    {
      -[WFVariableEditingAnchor variableProvider](self, "variableProvider");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "variableProvider");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8 == v9)
      {
        -[WFVariableEditingAnchor parameter](self, "parameter");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "parameter");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = v10 == v11;

      }
      else
      {
        v7 = 0;
      }

    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (WFVariable)variable
{
  return self->_variable;
}

- (WFVariableProvider)variableProvider
{
  return self->_variableProvider;
}

- (WFParameter)parameter
{
  return self->_parameter;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameter, 0);
  objc_storeStrong((id *)&self->_variableProvider, 0);
  objc_storeStrong((id *)&self->_variable, 0);
}

@end
