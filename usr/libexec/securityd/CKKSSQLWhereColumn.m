@implementation CKKSSQLWhereColumn

- (CKKSSQLWhereColumn)initWithOperation:(unint64_t)a3 columnName:(unint64_t)a4
{
  CKKSSQLWhereColumn *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CKKSSQLWhereColumn;
  result = -[CKKSSQLWhereColumn init](&v7, "init");
  if (result)
  {
    result->_sqlOp = a3;
    result->_columnName = a4;
  }
  return result;
}

- (unint64_t)sqlOp
{
  return self->_sqlOp;
}

- (void)setSqlOp:(unint64_t)a3
{
  self->_sqlOp = a3;
}

- (unint64_t)columnName
{
  return self->_columnName;
}

- (void)setColumnName:(unint64_t)a3
{
  self->_columnName = a3;
}

+ (id)op:(unint64_t)a3 column:(unint64_t)a4
{
  return -[CKKSSQLWhereColumn initWithOperation:columnName:]([CKKSSQLWhereColumn alloc], "initWithOperation:columnName:", a3, a4);
}

@end
