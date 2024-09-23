@implementation SEMDatabaseExecutionResult

- (SEMDatabaseExecutionResult)initWithCommand:(id)a3 beginMachTime:(unint64_t)a4 endMachTime:(unint64_t)a5 rowValueTuples:(id)a6 error:(id)a7
{
  id v12;
  id v13;
  id v14;
  const char *v15;
  uint64_t v16;
  SEMDatabaseExecutionResult *v17;
  uint64_t v18;
  SEMDatabaseCommand *command;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  NSArray *rowValueTuples;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  NSError *error;
  objc_super v29;

  v12 = a3;
  v13 = a6;
  v14 = a7;
  v29.receiver = self;
  v29.super_class = (Class)SEMDatabaseExecutionResult;
  v17 = -[SEMDatabaseExecutionResult init](&v29, sel_init);
  if (v17)
  {
    v18 = objc_msgSend_copy(v12, v15, v16);
    command = v17->_command;
    v17->_command = (SEMDatabaseCommand *)v18;

    v17->_beginMachTime = a4;
    v17->_endMachTime = a5;
    v22 = objc_msgSend_copy(v13, v20, v21);
    rowValueTuples = v17->_rowValueTuples;
    v17->_rowValueTuples = (NSArray *)v22;

    v26 = objc_msgSend_copy(v14, v24, v25);
    error = v17->_error;
    v17->_error = (NSError *)v26;

  }
  return v17;
}

- (SEMDatabaseExecutionResult)init
{
  id v2;

  objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x24BDBCE88], a2, *MEMORY[0x24BDBCAB0], CFSTR("You must use initWithCommand:"), MEMORY[0x24BDBD1B8]);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (id)description
{
  void *v3;
  void *v4;
  SEMDatabaseCommand *command;
  const char *v6;
  void *v7;
  const char *v8;
  void *v9;
  const char *v10;
  void *v11;
  objc_super v13;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v13.receiver = self;
  v13.super_class = (Class)SEMDatabaseExecutionResult;
  -[SEMDatabaseExecutionResult description](&v13, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  command = self->_command;
  objc_msgSend_numberWithUnsignedLongLong_(MEMORY[0x24BDD16E0], v6, self->_beginMachTime);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_numberWithUnsignedLongLong_(MEMORY[0x24BDD16E0], v8, self->_endMachTime);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v10, (uint64_t)CFSTR("%@ {command: %@, beginMachTime: %@, endMachTime: %@, rowValueTuples: %@, error: %@}"), v4, command, v7, v9, self->_rowValueTuples, self->_error);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (SEMDatabaseCommand)command
{
  return self->_command;
}

- (unint64_t)beginMachTime
{
  return self->_beginMachTime;
}

- (unint64_t)endMachTime
{
  return self->_endMachTime;
}

- (NSArray)rowValueTuples
{
  return self->_rowValueTuples;
}

- (NSError)error
{
  return self->_error;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_rowValueTuples, 0);
  objc_storeStrong((id *)&self->_command, 0);
}

@end
