@implementation SEMSQLCommandOrder

- (SEMSQLCommandOrder)initWithOrderMode:(int64_t)a3 columnNames:(id)a4
{
  id v6;
  SEMSQLCommandOrder *v7;
  const char *v8;
  uint64_t v9;
  SEMSQLCommandOrder *v10;
  uint64_t v11;
  NSArray *columnNames;
  objc_super v14;

  v6 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SEMSQLCommandOrder;
  v7 = -[SEMSQLCommandOrder init](&v14, sel_init);
  v10 = v7;
  if (v7)
  {
    v7->_orderMode = a3;
    v11 = objc_msgSend_copy(v6, v8, v9);
    columnNames = v10->_columnNames;
    v10->_columnNames = (NSArray *)v11;

  }
  return v10;
}

- (id)description
{
  void *v3;
  const char *v4;
  void *v5;
  const char *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SEMSQLCommandOrder;
  -[SEMSQLCommandOrder description](&v9, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_numberWithInteger_(MEMORY[0x24BDD16E0], v4, self->_orderMode);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringByAppendingFormat_(v3, v6, (uint64_t)CFSTR(" orderMode: %@, columnNames: %@"), v5, self->_columnNames);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (SEMSQLCommandOrder)init
{
  id v2;

  objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x24BDBCE88], a2, *MEMORY[0x24BDBCAB0], CFSTR("You must use -initWithOrderMode:columnNames"), MEMORY[0x24BDBD1B8]);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  const char *v6;
  _QWORD *v7;
  const char *v8;
  uint64_t v9;
  void *v10;

  v5 = (void *)objc_opt_class();
  v7 = (_QWORD *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  v7[1] = self->_orderMode;
  v9 = objc_msgSend_copyWithZone_(self->_columnNames, v8, (uint64_t)a3);
  v10 = (void *)v7[2];
  v7[2] = v9;

  return v7;
}

- (int64_t)orderMode
{
  return self->_orderMode;
}

- (NSArray)columnNames
{
  return self->_columnNames;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_columnNames, 0);
}

@end
