@implementation CKKSSQLWhereValue

- (CKKSSQLWhereValue)initWithOperation:(unint64_t)a3 value:(id)a4
{
  id v7;
  CKKSSQLWhereValue *v8;
  CKKSSQLWhereValue *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)CKKSSQLWhereValue;
  v8 = -[CKKSSQLWhereValue init](&v11, "init");
  v9 = v8;
  if (v8)
  {
    v8->_sqlOp = a3;
    objc_storeStrong((id *)&v8->_value, a4);
  }

  return v9;
}

- (unint64_t)sqlOp
{
  return self->_sqlOp;
}

- (void)setSqlOp:(unint64_t)a3
{
  self->_sqlOp = a3;
}

- (NSString)value
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setValue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
}

+ (id)op:(unint64_t)a3 value:(id)a4
{
  id v5;
  CKKSSQLWhereValue *v6;

  v5 = a4;
  v6 = -[CKKSSQLWhereValue initWithOperation:value:]([CKKSSQLWhereValue alloc], "initWithOperation:value:", a3, v5);

  return v6;
}

@end
