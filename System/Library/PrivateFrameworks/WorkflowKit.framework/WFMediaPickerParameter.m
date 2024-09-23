@implementation WFMediaPickerParameter

- (void)setAction:(id)a3
{
  WFAction **p_action;
  id WeakRetained;
  void *v6;
  id obj;

  obj = a3;
  p_action = &self->_action;
  WeakRetained = objc_loadWeakRetained((id *)p_action);

  v6 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)p_action, obj);
    v6 = obj;
  }

}

- (Class)singleStateClass
{
  return (Class)objc_opt_class();
}

- (id)localizedLabelForState:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "itemName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)parameterStateIsValid:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  objc_super v8;

  v4 = a3;
  objc_msgSend(v4, "variable");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v8.receiver = self;
    v8.super_class = (Class)WFMediaPickerParameter;
    v6 = -[WFParameter parameterStateIsValid:](&v8, sel_parameterStateIsValid_, v4);
  }
  else
  {
    v6 = 1;
  }

  return v6;
}

- (WFAction)action
{
  return (WFAction *)objc_loadWeakRetained((id *)&self->_action);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_action);
}

@end
