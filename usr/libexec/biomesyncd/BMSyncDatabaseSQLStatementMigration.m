@implementation BMSyncDatabaseSQLStatementMigration

- (BMSyncDatabaseSQLStatementMigration)initWithSQLStatements:(id)a3
{
  id v5;
  BMSyncDatabaseSQLStatementMigration *v6;
  BMSyncDatabaseSQLStatementMigration *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BMSyncDatabaseSQLStatementMigration;
  v6 = -[BMSyncDatabaseSQLStatementMigration init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_sqlStatements, a3);

  return v7;
}

- (NSArray)sqlStatements
{
  return self->_sqlStatements;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sqlStatements, 0);
}

@end
