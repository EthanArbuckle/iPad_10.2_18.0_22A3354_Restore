@implementation TMLExpressionReactiveValue

- (TMLExpressionReactiveValue)initWithExpression:(id)a3 context:(id)a4 bindings:(id)a5 valueType:(unint64_t)a6
{
  id v10;
  id v11;
  id v12;
  const char *v13;
  TMLExpressionReactiveValue *v14;
  double v15;
  uint64_t v16;
  NSString *expression;
  const char *v18;
  double v19;
  uint64_t v20;
  NSArray *bindings;
  objc_super v23;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v23.receiver = self;
  v23.super_class = (Class)TMLExpressionReactiveValue;
  v14 = -[TMLReactiveValue initWithBindings:valueType:](&v23, sel_initWithBindings_valueType_, v12, a6);
  if (v14)
  {
    v16 = objc_msgSend_copy(v10, v13, v15);
    expression = v14->_expression;
    v14->_expression = (NSString *)v16;

    objc_storeWeak((id *)&v14->_context, v11);
    v20 = objc_msgSend_copy(v12, v18, v19);
    bindings = v14->_bindings;
    v14->_bindings = (NSArray *)v20;

  }
  return v14;
}

- (id)value
{
  id WeakRetained;
  NSString *expression;
  const char *v5;
  double v6;
  uint64_t v7;
  const char *v8;
  double v9;
  void *v10;

  WeakRetained = objc_loadWeakRetained((id *)&self->_context);
  expression = self->_expression;
  v7 = objc_msgSend_valueType(self, v5, v6);
  objc_msgSend_evaluateExpression_ofType_withBindings_(WeakRetained, v8, v9, expression, v7, self->_bindings);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bindings, 0);
  objc_destroyWeak((id *)&self->_context);
  objc_storeStrong((id *)&self->_expression, 0);
}

@end
