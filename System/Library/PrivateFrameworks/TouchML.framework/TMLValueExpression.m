@implementation TMLValueExpression

- (TMLValueExpression)initWithExpressionText:(id)a3 bindings:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  TMLValueExpression *v9;
  double v10;
  uint64_t v11;
  NSString *expressionText;
  const char *v13;
  double v14;
  uint64_t v15;
  NSArray *bindings;
  objc_super v18;

  v6 = a3;
  v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)TMLValueExpression;
  v9 = -[TMLValueExpression init](&v18, sel_init);
  if (v9)
  {
    v11 = objc_msgSend_copy(v6, v8, v10);
    expressionText = v9->_expressionText;
    v9->_expressionText = (NSString *)v11;

    v15 = objc_msgSend_copy(v7, v13, v14);
    bindings = v9->_bindings;
    v9->_bindings = (NSArray *)v15;

  }
  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  const char *v5;
  double v6;
  NSString *expressionText;
  void *v8;
  const char *v9;
  double v10;
  const char *v11;
  double v12;
  NSArray *bindings;
  void *v14;
  const char *v15;
  double v16;
  const char *v17;
  double v18;
  BOOL v19;
  NSArray *v20;
  NSArray *v21;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    expressionText = self->_expressionText;
    objc_msgSend_expressionText(v4, v5, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_isEqualToString_(expressionText, v9, v10, v8))
    {
      bindings = self->_bindings;
      objc_msgSend_bindings(v4, v11, v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend_isEqualToArray_(bindings, v15, v16, v14) & 1) != 0)
      {
        v19 = 1;
      }
      else
      {
        v20 = self->_bindings;
        objc_msgSend_bindings(v4, v17, v18);
        v21 = (NSArray *)objc_claimAutoreleasedReturnValue();
        v19 = v20 == v21;

      }
    }
    else
    {
      v19 = 0;
    }

  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (void)encode:(ProtobufCMessage *)a3
{
  double v5;
  const char *v6;
  const char *v7;
  const char *v8;
  double v9;
  uint64_t v10;
  const char *v11;
  NSArray *bindings;
  _QWORD v13[5];

  v5 = sub_22AD3CAC8(a3);
  v7 = (const char *)objc_msgSend_UTF8String(self->_expressionText, v6, v5);
  a3[1].var0 = (ProtobufCMessageDescriptor *)strdup(v7);
  v10 = objc_msgSend_count(self->_bindings, v8, v9);
  *(_QWORD *)&a3[1].var1 = v10;
  if (v10)
    v10 = (uint64_t)malloc_type_malloc(8 * v10, 0x80040B8603338uLL);
  a3[1].var2 = (ProtobufCMessageUnknownField *)v10;
  bindings = self->_bindings;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = sub_22AD72D08;
  v13[3] = &unk_24F500948;
  v13[4] = a3;
  objc_msgSend_enumerateObjectsUsingBlock_(bindings, v11, COERCE_DOUBLE(3221225472), v13);
}

+ (id)decode:(const ProtobufCMessage *)a3
{
  double v3;
  const char *v6;
  void *v7;
  double v8;
  id v9;
  const char *v10;
  double v11;
  void *v12;
  unint64_t v13;
  void *v14;
  const char *v15;
  double v16;
  id v17;
  const char *v18;
  double v19;
  void *v20;

  objc_msgSend_stringWithUTF8String_(MEMORY[0x24BDD17C8], a2, v3, a3[1].var0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (*(_QWORD *)&a3[1].var1)
  {
    v9 = objc_alloc(MEMORY[0x24BDBCEB8]);
    v12 = (void *)objc_msgSend_initWithCapacity_(v9, v10, v11, *(_QWORD *)&a3[1].var1);
  }
  else
  {
    v12 = 0;
  }
  if (*(_QWORD *)&a3[1].var1)
  {
    v13 = 0;
    do
    {
      objc_msgSend_stringWithUTF8String_(MEMORY[0x24BDD17C8], v6, v8, *((_QWORD *)a3[1].var2 + v13));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_addObject_(v12, v15, v16, v14);

      ++v13;
    }
    while (v13 < *(_QWORD *)&a3[1].var1);
  }
  v17 = objc_alloc((Class)a1);
  v20 = (void *)objc_msgSend_initWithExpressionText_bindings_(v17, v18, v19, v7, v12);

  return v20;
}

- (NSString)expressionText
{
  return self->_expressionText;
}

- (NSArray)bindings
{
  return self->_bindings;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bindings, 0);
  objc_storeStrong((id *)&self->_expressionText, 0);
}

@end
