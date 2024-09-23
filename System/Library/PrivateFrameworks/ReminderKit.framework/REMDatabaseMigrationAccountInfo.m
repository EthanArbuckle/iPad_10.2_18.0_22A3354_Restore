@implementation REMDatabaseMigrationAccountInfo

- (REMDatabaseMigrationAccountInfo)initWithAccountType:(int64_t)a3 identifier:(id)a4 name:(id)a5
{
  id v9;
  id v10;
  REMDatabaseMigrationAccountInfo *v11;
  REMDatabaseMigrationAccountInfo *v12;
  NSObject *v13;
  objc_super v15;

  v9 = a4;
  v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)REMDatabaseMigrationAccountInfo;
  v11 = -[REMDatabaseMigrationAccountInfo init](&v15, sel_init);
  if (!v11)
  {
LABEL_7:
    v12 = v11;
    goto LABEL_11;
  }
  if (a3 && v9)
  {
    if (!v10)
    {
      NSStringFromREMAccountType(a3);
      v10 = (id)objc_claimAutoreleasedReturnValue();
    }
    objc_storeStrong((id *)&v11->_identifier, a4);
    objc_storeStrong((id *)&v11->_name, v10);
    v11->_type = a3;
    goto LABEL_7;
  }
  +[REMLogStore write](REMLogStore, "write");
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    -[REMDatabaseMigrationAccountInfo initWithAccountType:identifier:name:].cold.1(v13);

  v12 = 0;
LABEL_11:

  return v12;
}

- (BOOL)isCloudKit
{
  int64_t v3;

  v3 = -[REMDatabaseMigrationAccountInfo type](self, "type");
  return v3 == _auto_REMAccountTypeForPrimaryCloudKit() || -[REMDatabaseMigrationAccountInfo type](self, "type") == 6;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)name
{
  return self->_name;
}

- (int64_t)type
{
  return self->_type;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)initWithAccountType:(os_log_t)log identifier:name:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B4A39000, log, OS_LOG_TYPE_ERROR, "REMDatabaseMigrationAccountInfo cannot be initialized without an account type and an identifier.", v1, 2u);
}

@end
