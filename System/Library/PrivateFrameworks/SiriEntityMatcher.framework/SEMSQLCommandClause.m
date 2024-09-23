@implementation SEMSQLCommandClause

- (SEMSQLCommandClause)initWithClause:(id)a3 parameters:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  SEMSQLCommandClause *v10;
  uint64_t v11;
  NSString *clause;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  NSArray *parameters;
  objc_super v18;

  v6 = a3;
  v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)SEMSQLCommandClause;
  v10 = -[SEMSQLCommandClause init](&v18, sel_init);
  if (v10)
  {
    v11 = objc_msgSend_copy(v6, v8, v9);
    clause = v10->_clause;
    v10->_clause = (NSString *)v11;

    v15 = objc_msgSend_copy(v7, v13, v14);
    parameters = v10->_parameters;
    v10->_parameters = (NSArray *)v15;

  }
  return v10;
}

- (id)description
{
  void *v3;
  const char *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SEMSQLCommandClause;
  -[SEMSQLCommandClause description](&v7, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringByAppendingFormat_(v3, v4, (uint64_t)CFSTR(" clause: %@, parameters: %@"), self->_clause, self->_parameters);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (SEMSQLCommandClause)init
{
  id v2;

  objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x24BDBCE88], a2, *MEMORY[0x24BDBCAB0], CFSTR("You must use -initWithClause:parameters"), MEMORY[0x24BDBD1B8]);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (NSString)clause
{
  return self->_clause;
}

- (NSArray)parameters
{
  return self->_parameters;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_clause, 0);
}

@end
