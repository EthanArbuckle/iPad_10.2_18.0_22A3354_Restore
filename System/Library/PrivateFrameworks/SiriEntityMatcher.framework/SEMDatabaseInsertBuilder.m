@implementation SEMDatabaseInsertBuilder

- (SEMDatabaseInsertBuilder)initWithTableName:(id)a3 columnNames:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  SEMDatabaseInsertBuilder *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  NSArray *columnNames;
  SEMDatabaseInsertBuilder *v15;
  NSObject *v16;
  objc_super v18;
  uint8_t buf[4];
  const char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v18.receiver = self;
  v18.super_class = (Class)SEMDatabaseInsertBuilder;
  v9 = -[SEMDatabaseCommandBuilder initWithTableName:](&v18, sel_initWithTableName_, a3);
  if (!v9)
    goto LABEL_4;
  v10 = objc_msgSend_count(v6, v7, v8);
  v9->_numberOfColumns = v10;
  if (v10)
  {
    v13 = objc_msgSend_copy(v6, v11, v12);
    columnNames = v9->_columnNames;
    v9->_columnNames = (NSArray *)v13;

LABEL_4:
    v15 = v9;
    goto LABEL_8;
  }
  v16 = qword_25441F970;
  if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    v20 = "-[SEMDatabaseInsertBuilder initWithTableName:columnNames:]";
    _os_log_error_impl(&dword_2462C4000, v16, OS_LOG_TYPE_ERROR, "%s Cannot construct DatabaseInsertBuilder with empty columnNames array", buf, 0xCu);
  }
  v15 = 0;
LABEL_8:

  return v15;
}

- (id)buildWithError:(id *)a3
{
  unint64_t numberOfColumns;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  void *v10;
  SEMDatabaseInsert *v11;
  const char *v12;
  void *v13;
  NSObject *v14;
  int v16;
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  numberOfColumns = self->_numberOfColumns;
  if (numberOfColumns == objc_msgSend_count(self->_columnValues, a2, (uint64_t)a3))
  {
    objc_msgSend_tableName(self, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_insertCommandStringWithTableName_columnNames_returningColumns_(SEMSQLCommandGenerator, v9, (uint64_t)v8, self->_columnNames, self->_returningColumns);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = [SEMDatabaseInsert alloc];
    v13 = (void *)objc_msgSend_initWithCommandString_parameters_(v11, v12, (uint64_t)v10, self->_columnValues);

  }
  else
  {
    objc_msgSend__setError_withCode_(self, v6, (uint64_t)a3, 1);
    v14 = qword_25441F970;
    if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_ERROR))
    {
      v16 = 136315138;
      v17 = "-[SEMDatabaseInsertBuilder buildWithError:]";
      _os_log_error_impl(&dword_2462C4000, v14, OS_LOG_TYPE_ERROR, "%s columnValues array size does not match columnNames array size", (uint8_t *)&v16, 0xCu);
    }
    v13 = 0;
  }
  return v13;
}

- (void)setColumnValues:(id)a3
{
  NSArray *v4;
  NSArray *columnValues;

  v4 = (NSArray *)objc_msgSend_copy(a3, a2, (uint64_t)a3);
  columnValues = self->_columnValues;
  self->_columnValues = v4;

}

- (void)setReturningColumns:(id)a3
{
  NSArray *v4;
  NSArray *returningColumns;

  v4 = (NSArray *)objc_msgSend_copy(a3, a2, (uint64_t)a3);
  returningColumns = self->_returningColumns;
  self->_returningColumns = v4;

}

- (BOOL)_setError:(id *)a3 withCode:(int64_t)a4
{
  if (a3)
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], a2, (uint64_t)CFSTR("com.apple.siri.vocabulary.database.insert"), a4, 0);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return a3 != 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_returningColumns, 0);
  objc_storeStrong((id *)&self->_columnValues, 0);
  objc_storeStrong((id *)&self->_columnNames, 0);
}

@end
