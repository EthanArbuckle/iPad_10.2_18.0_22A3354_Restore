@implementation SEMDatabaseValueRow

- (SEMDatabaseValueRow)initWithDatabaseValueArray:(id)a3
{
  id v5;
  SEMDatabaseValueRow *v6;
  SEMDatabaseValueRow *v7;
  const char *v8;
  uint64_t v9;
  NSArray *databaseValueArray;
  SEMDatabaseValueRow *v11;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SEMDatabaseValueRow;
  v6 = -[SEMDatabaseValueRow init](&v13, sel_init);
  v7 = v6;
  if (!v6
    || (objc_storeStrong((id *)&v6->_databaseValueArray, a3), (databaseValueArray = v7->_databaseValueArray) != 0)
    && objc_msgSend_count(databaseValueArray, v8, v9))
  {
    v11 = v7;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (SEMDatabaseValueRow)init
{
  id v2;

  objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x24BDBCE88], a2, *MEMORY[0x24BDBCAB0], CFSTR("You must use -initWithDatabaseValueArray"), MEMORY[0x24BDBD1B8]);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (id)description
{
  uint64_t v2;

  return (id)objc_msgSend_description(self->_databaseValueArray, a2, v2);
}

- (unint64_t)count
{
  uint64_t v2;

  return objc_msgSend_count(self->_databaseValueArray, a2, v2);
}

- (id)stringValueAtColumnIndex:(unint64_t)a3
{
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;

  objc_msgSend_objectAtIndex_(self->_databaseValueArray, a2, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_databaseValue_toString(v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)numberValueAtColumnIndex:(unint64_t)a3
{
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;

  objc_msgSend_objectAtIndex_(self->_databaseValueArray, a2, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_databaseValue_toNumber(v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dataValueAtColumnIndex:(unint64_t)a3
{
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;

  objc_msgSend_objectAtIndex_(self->_databaseValueArray, a2, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_databaseValue_toData(v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_databaseValueArray, 0);
}

@end
