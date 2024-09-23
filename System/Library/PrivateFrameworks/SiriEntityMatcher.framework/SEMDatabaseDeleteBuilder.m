@implementation SEMDatabaseDeleteBuilder

- (id)build
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  void *v9;

  objc_msgSend_tableName(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_criterion(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_deleteFromTableWithName_criterion_returningColumns_(SEMSQLCommandGenerator, v8, (uint64_t)v4, v7, self->_returningColumns);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)setCommandCriterion:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SEMDatabaseDeleteBuilder;
  -[SEMDatabaseCommandBuilder setCommandCriterion:](&v3, sel_setCommandCriterion_, a3);
}

- (void)setReturningColumns:(id)a3
{
  NSArray *v4;
  NSArray *returningColumns;

  v4 = (NSArray *)objc_msgSend_copy(a3, a2, (uint64_t)a3);
  returningColumns = self->_returningColumns;
  self->_returningColumns = v4;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_returningColumns, 0);
}

@end
