@implementation _UIViewLFLDVariableChangeRecord

- (_UIViewLFLDVariableChangeRecord)initWithVariable:(id)a3 inLayoutEngine:(id)a4
{
  id v7;
  id v8;
  _UIViewLFLDVariableChangeRecord *v9;
  _UIViewLFLDVariableChangeRecord *v10;
  double v11;
  double v12;
  uint64_t v13;
  UIView *variableDelegate;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)_UIViewLFLDVariableChangeRecord;
  v9 = -[_UIViewLFLDChangeRecord init](&v16, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_variable, a3);
    objc_msgSend(v8, "valueForVariable:", v7);
    v12 = v11;
    objc_opt_self();
    v10->_value = v12 / 360.0;
    objc_msgSend(v7, "delegate");
    v13 = objc_claimAutoreleasedReturnValue();
    variableDelegate = v10->_variableDelegate;
    v10->_variableDelegate = (UIView *)v13;

  }
  return v10;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@ = %g>"), self->_variable, *(_QWORD *)&self->_value);
}

- (NSISVariable)variable
{
  return self->_variable;
}

- (double)value
{
  return self->_value;
}

- (UIView)variableDelegate
{
  return self->_variableDelegate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_variableDelegate, 0);
  objc_storeStrong((id *)&self->_variable, 0);
}

@end
