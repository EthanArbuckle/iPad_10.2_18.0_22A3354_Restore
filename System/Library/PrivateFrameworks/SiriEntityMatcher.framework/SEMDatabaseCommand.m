@implementation SEMDatabaseCommand

- (SEMDatabaseCommand)initWithCommandString:(id)a3 parameters:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  SEMDatabaseCommand *v10;
  uint64_t v11;
  NSString *commandString;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  NSArray *parameters;
  objc_super v18;

  v6 = a3;
  v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)SEMDatabaseCommand;
  v10 = -[SEMDatabaseCommand init](&v18, sel_init);
  if (v10)
  {
    v11 = objc_msgSend_copy(v6, v8, v9);
    commandString = v10->_commandString;
    v10->_commandString = (NSString *)v11;

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
  v7.super_class = (Class)SEMDatabaseCommand;
  -[SEMDatabaseCommand description](&v7, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringByAppendingFormat_(v3, v4, (uint64_t)CFSTR(" commandString: %@, parameters: %@"), self->_commandString, self->_parameters);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (SEMDatabaseCommand)init
{
  id v2;

  objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x24BDBCE88], a2, *MEMORY[0x24BDBCAB0], CFSTR("You must use +builderWithTableName"), MEMORY[0x24BDBD1B8]);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (BOOL)isEqual:(id)a3
{
  SEMDatabaseCommand *v4;
  SEMDatabaseCommand *v5;
  const char *v6;
  char isEqualToCommand;

  v4 = (SEMDatabaseCommand *)a3;
  v5 = v4;
  if (v4 == self)
  {
    isEqualToCommand = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    isEqualToCommand = objc_msgSend_isEqualToCommand_(self, v6, (uint64_t)v5);
  }
  else
  {
    isEqualToCommand = 0;
  }

  return isEqualToCommand;
}

- (BOOL)isEqualToCommand:(id)a3
{
  void *v3;
  void *v4;
  id v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  NSString *commandString;
  void *v11;
  const char *v12;
  int v13;
  char isEqual;
  NSArray *parameters;
  NSArray *v16;
  void *v17;
  const char *v18;

  v6 = a3;
  v9 = v6;
  if (!v6)
  {
    isEqual = 0;
    goto LABEL_18;
  }
  commandString = self->_commandString;
  v11 = commandString;
  if (!commandString)
  {
    objc_msgSend_commandString(v6, v7, v8);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      v13 = 0;
      goto LABEL_10;
    }
    v11 = self->_commandString;
  }
  objc_msgSend_commandString(v9, v7, v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend_isEqual_(v11, v12, (uint64_t)v4) & 1) == 0)
  {

    isEqual = 0;
    goto LABEL_16;
  }
  v13 = 1;
LABEL_10:
  parameters = self->_parameters;
  v16 = parameters;
  if (!parameters)
  {
    objc_msgSend_parameters(v9, v7, v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
      isEqual = 1;
      goto LABEL_20;
    }
    v16 = self->_parameters;
  }
  objc_msgSend_parameters(v9, v7, v8);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  isEqual = objc_msgSend_isEqual_(v16, v18, (uint64_t)v17);

  if (parameters)
  {
    if (!v13)
      goto LABEL_16;
    goto LABEL_15;
  }
LABEL_20:

  if ((v13 & 1) != 0)
LABEL_15:

LABEL_16:
  if (!commandString)

LABEL_18:
  return isEqual;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  unint64_t v10;

  v4 = objc_msgSend_hash(self->_commandString, a2, v2);
  objc_msgSend_description(self->_parameters, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend_hash(v7, v8, v9) ^ v4;

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  const char *v6;
  _QWORD *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;

  v5 = (void *)objc_opt_class();
  v7 = (_QWORD *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  v9 = objc_msgSend_copyWithZone_(self->_commandString, v8, (uint64_t)a3);
  v10 = (void *)v7[1];
  v7[1] = v9;

  v12 = objc_msgSend_copyWithZone_(self->_parameters, v11, (uint64_t)a3);
  v13 = (void *)v7[2];
  v7[2] = v12;

  return v7;
}

- (void)replaceParameters:(id)a3
{
  NSArray *v4;
  NSArray *parameters;

  v4 = (NSArray *)objc_msgSend_copy(a3, a2, (uint64_t)a3);
  parameters = self->_parameters;
  self->_parameters = v4;

}

- (BOOL)updateParameters:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  NSArray *v13;
  NSArray *parameters;

  v4 = a3;
  v7 = objc_msgSend_count(self->_parameters, v5, v6);
  v12 = objc_msgSend_count(v4, v8, v9);
  if (v7 == v12)
  {
    v13 = (NSArray *)objc_msgSend_copy(v4, v10, v11);
    parameters = self->_parameters;
    self->_parameters = v13;

  }
  return v7 == v12;
}

- (BOOL)updateCommandString:(id)a3
{
  NSString *v4;
  NSString *commandString;

  v4 = (NSString *)objc_msgSend_copy(a3, a2, (uint64_t)a3);
  commandString = self->_commandString;
  self->_commandString = v4;

  return 1;
}

- (NSString)commandString
{
  return self->_commandString;
}

- (NSArray)parameters
{
  return self->_parameters;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_commandString, 0);
}

@end
