@implementation WFVariableEditingOptions

- (WFVariableEditingOptions)initWithAnchor:(id)a3 resultType:(unint64_t)a4 onChange:(id)a5 onFinish:(id)a6
{
  id v12;
  id v13;
  id v14;
  WFVariableEditingOptions *v15;
  WFVariableEditingOptions *v16;
  uint64_t v17;
  id onChange;
  uint64_t v19;
  id onFinish;
  WFVariableEditingOptions *v21;
  void *v23;
  void *v24;
  void *v25;
  objc_super v26;

  v12 = a3;
  v13 = a5;
  v14 = a6;
  if (v12)
  {
    if (v13)
      goto LABEL_3;
LABEL_8:
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFVariableEditingOptions.m"), 67, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("onChange"));

    if (v14)
      goto LABEL_4;
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFVariableEditingOptions.m"), 66, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("anchor"));

  if (!v13)
    goto LABEL_8;
LABEL_3:
  if (v14)
    goto LABEL_4;
LABEL_9:
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFVariableEditingOptions.m"), 68, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("onFinish"));

LABEL_4:
  v26.receiver = self;
  v26.super_class = (Class)WFVariableEditingOptions;
  v15 = -[WFVariableEditingOptions init](&v26, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_anchor, a3);
    v16->_resultType = a4;
    v17 = objc_msgSend(v13, "copy");
    onChange = v16->_onChange;
    v16->_onChange = (id)v17;

    v19 = objc_msgSend(v14, "copy");
    onFinish = v16->_onFinish;
    v16->_onFinish = (id)v19;

    v21 = v16;
  }

  return v16;
}

- (unint64_t)hash
{
  return self->_resultType ^ -[WFVariableEditingAnchor hash](self->_anchor, "hash");
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
  BOOL v11;
  unint64_t v12;

  v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[WFVariableEditingOptions anchor](self, "anchor");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "anchor");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v5;
      v8 = v6;
      v9 = v8;
      if (v7 == v8)
      {

      }
      else
      {
        if (!v7 || !v8)
        {

LABEL_12:
          v11 = 0;
          goto LABEL_13;
        }
        v10 = objc_msgSend(v7, "isEqual:", v8);

        if (!v10)
          goto LABEL_12;
      }
      v12 = -[WFVariableEditingOptions resultType](self, "resultType");
      v11 = v12 == objc_msgSend(v4, "resultType");
LABEL_13:

      goto LABEL_14;
    }
  }
  v11 = 0;
LABEL_14:

  return v11;
}

- (void)variableDidChange:(id)a3
{
  void *v4;
  void (**v5)(_QWORD, _QWORD);
  id v6;

  v6 = a3;
  -[WFVariableEditingOptions onChange](self, "onChange");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[WFVariableEditingOptions onChange](self, "onChange");
    v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v5)[2](v5, v6);

  }
}

- (void)finishEditingReturningToKeyboard:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void (**v6)(_QWORD, _QWORD);

  v3 = a3;
  -[WFVariableEditingOptions onFinish](self, "onFinish");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[WFVariableEditingOptions onFinish](self, "onFinish");
    v6 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v6[2](v6, v3);

  }
  -[WFVariableEditingOptions setOnChange:](self, "setOnChange:", 0);
  -[WFVariableEditingOptions setOnFinish:](self, "setOnFinish:", 0);
}

- (WFVariableEditingAnchor)anchor
{
  return self->_anchor;
}

- (unint64_t)resultType
{
  return self->_resultType;
}

- (id)onChange
{
  return self->_onChange;
}

- (void)setOnChange:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (id)onFinish
{
  return self->_onFinish;
}

- (void)setOnFinish:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_onFinish, 0);
  objc_storeStrong(&self->_onChange, 0);
  objc_storeStrong((id *)&self->_anchor, 0);
}

@end
