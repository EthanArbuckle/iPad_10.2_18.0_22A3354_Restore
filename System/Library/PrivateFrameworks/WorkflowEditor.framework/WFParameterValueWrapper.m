@implementation WFParameterValueWrapper

- (WFParameterValueWrapper)initWithValue:(id)a3 parameter:(id)a4
{
  id v8;
  id v9;
  void *v10;
  WFParameterValueWrapper *v11;
  WFParameterValueWrapper *v12;
  WFParameterValueWrapper *v13;
  void *v15;
  void *v16;
  objc_super v17;

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
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFParameterValuePickerDataSource.m"), 29, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("value"));

    if (v10)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFParameterValuePickerDataSource.m"), 30, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("parameter"));

LABEL_3:
  v17.receiver = self;
  v17.super_class = (Class)WFParameterValueWrapper;
  v11 = -[WFParameterValueWrapper init](&v17, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_value, a3);
    objc_storeStrong((id *)&v12->_parameter, a4);
    v13 = v12;
  }

  return v12;
}

- (NSString)readableTitle
{
  void *v3;
  void *v4;
  void *v5;

  -[WFParameterValueWrapper parameter](self, "parameter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFParameterValueWrapper value](self, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "wf_pickerLocalizedTitleForState:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (WFParameterState)value
{
  return self->_value;
}

- (WFParameterValuePickable)parameter
{
  return self->_parameter;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameter, 0);
  objc_storeStrong((id *)&self->_value, 0);
}

@end
