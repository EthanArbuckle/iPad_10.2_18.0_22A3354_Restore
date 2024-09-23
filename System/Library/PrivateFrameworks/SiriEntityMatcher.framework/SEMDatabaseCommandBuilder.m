@implementation SEMDatabaseCommandBuilder

- (SEMDatabaseCommandBuilder)initWithTableName:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  SEMDatabaseCommandBuilder *v7;
  uint64_t v8;
  NSString *tableName;
  const char *v10;
  uint64_t v11;
  NSString *v12;
  SEMDatabaseCommandBuilder *v13;
  NSObject *v14;
  objc_super v16;
  uint8_t buf[4];
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)SEMDatabaseCommandBuilder;
  v7 = -[SEMDatabaseCommandBuilder init](&v16, sel_init);
  if (!v7
    || (v8 = objc_msgSend_copy(v4, v5, v6),
        tableName = v7->_tableName,
        v7->_tableName = (NSString *)v8,
        tableName,
        (v12 = v7->_tableName) != 0)
    && objc_msgSend_length(v12, v10, v11))
  {
    v13 = v7;
  }
  else
  {
    v14 = qword_25441F970;
    if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v18 = "-[SEMDatabaseCommandBuilder initWithTableName:]";
      _os_log_error_impl(&dword_2462C4000, v14, OS_LOG_TYPE_ERROR, "%s Cannot construct database command builder with nil tableName", buf, 0xCu);
    }
    v13 = 0;
  }

  return v13;
}

- (SEMDatabaseCommandBuilder)init
{
  id v2;

  objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x24BDBCE88], a2, *MEMORY[0x24BDBCAB0], CFSTR("You must use +builderWithTableName to initialize a builder"), MEMORY[0x24BDBD1B8]);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (void)setCommandCriterion:(id)a3
{
  SEMSQLCommandCriterion *v4;
  SEMSQLCommandCriterion *criterion;

  v4 = (SEMSQLCommandCriterion *)objc_msgSend_copy(a3, a2, (uint64_t)a3);
  criterion = self->_criterion;
  self->_criterion = v4;

}

- (NSString)tableName
{
  return self->_tableName;
}

- (SEMSQLCommandCriterion)criterion
{
  return self->_criterion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_criterion, 0);
  objc_storeStrong((id *)&self->_tableName, 0);
}

@end
