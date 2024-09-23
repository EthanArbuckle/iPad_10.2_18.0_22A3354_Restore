@implementation CKKSSQLWhereIn

- (CKKSSQLWhereIn)initWithValues:(id)a3
{
  id v5;
  CKKSSQLWhereIn *v6;
  CKKSSQLWhereIn *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CKKSSQLWhereIn;
  v6 = -[CKKSSQLWhereIn init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_values, a3);

  return v7;
}

- (NSArray)values
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (void)setValues:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_values, 0);
}

@end
