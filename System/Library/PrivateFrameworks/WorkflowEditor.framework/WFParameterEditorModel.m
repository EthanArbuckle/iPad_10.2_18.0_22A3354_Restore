@implementation WFParameterEditorModel

- (WFParameterEditorModel)initWithParameter:(id)a3 state:(id)a4
{
  return -[WFParameterEditorModel initWithParameter:state:widgetFamily:](self, "initWithParameter:state:widgetFamily:", a3, a4, 3);
}

- (WFParameterEditorModel)initWithParameter:(id)a3 state:(id)a4 widgetFamily:(int64_t)a5
{
  id v10;
  id v11;
  WFParameterEditorModel *v12;
  WFParameterEditorModel *v13;
  WFParameterEditorModel *v14;
  void *v16;
  objc_super v17;

  v10 = a3;
  v11 = a4;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFParameterEditorHostingCell.mm"), 22, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("parameter"));

  }
  v17.receiver = self;
  v17.super_class = (Class)WFParameterEditorModel;
  v12 = -[WFParameterEditorModel init](&v17, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_parameter, a3);
    objc_storeStrong((id *)&v13->_state, a4);
    v13->_widgetFamily = a5;
    v14 = v13;
  }

  return v13;
}

- (WFParameterEditorModel)initWithResourceError:(id)a3 buttonGradient:(id)a4
{
  id v8;
  id v9;
  WFParameterEditorModel *v10;
  WFParameterEditorModel *v11;
  WFParameterEditorModel *v12;
  void *v14;
  objc_super v15;

  v8 = a3;
  v9 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFParameterEditorHostingCell.mm"), 35, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("resourceError"));

  }
  v15.receiver = self;
  v15.super_class = (Class)WFParameterEditorModel;
  v10 = -[WFParameterEditorModel init](&v15, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_resourceError, a3);
    objc_storeStrong((id *)&v11->_buttonGradient, a4);
    v12 = v11;
  }

  return v11;
}

- (WFParameter)parameter
{
  return self->_parameter;
}

- (WFParameterState)state
{
  return self->_state;
}

- (NSError)resourceError
{
  return self->_resourceError;
}

- (WFGradient)buttonGradient
{
  return self->_buttonGradient;
}

- (int64_t)widgetFamily
{
  return self->_widgetFamily;
}

- (BOOL)becomeFirstResponder
{
  return self->_becomeFirstResponder;
}

- (void)setBecomeFirstResponder:(BOOL)a3
{
  self->_becomeFirstResponder = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buttonGradient, 0);
  objc_storeStrong((id *)&self->_resourceError, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_parameter, 0);
}

@end
