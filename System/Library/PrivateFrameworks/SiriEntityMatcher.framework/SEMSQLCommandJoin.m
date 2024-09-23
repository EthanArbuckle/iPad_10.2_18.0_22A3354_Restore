@implementation SEMSQLCommandJoin

- (SEMSQLCommandJoin)initWithTable:(id)a3 joinCriterion:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  SEMSQLCommandJoin *v10;
  uint64_t v11;
  NSString *table;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  SEMSQLCommandJoinCriterion *joinCriterion;
  objc_super v18;

  v6 = a3;
  v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)SEMSQLCommandJoin;
  v10 = -[SEMSQLCommandJoin init](&v18, sel_init);
  if (v10)
  {
    v11 = objc_msgSend_copy(v6, v8, v9);
    table = v10->_table;
    v10->_table = (NSString *)v11;

    v15 = objc_msgSend_copy(v7, v13, v14);
    joinCriterion = v10->_joinCriterion;
    v10->_joinCriterion = (SEMSQLCommandJoinCriterion *)v15;

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
  v7.super_class = (Class)SEMSQLCommandJoin;
  -[SEMSQLCommandJoin description](&v7, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringByAppendingFormat_(v3, v4, (uint64_t)CFSTR(" table: %@, criterion: %@"), self->_table, self->_joinCriterion);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (SEMSQLCommandJoin)init
{
  id v2;

  objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x24BDBCE88], a2, *MEMORY[0x24BDBCAB0], CFSTR("You must use -initWithClause:parameters"), MEMORY[0x24BDBD1B8]);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (NSString)table
{
  return self->_table;
}

- (SEMSQLCommandJoinCriterion)joinCriterion
{
  return self->_joinCriterion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_joinCriterion, 0);
  objc_storeStrong((id *)&self->_table, 0);
}

@end
