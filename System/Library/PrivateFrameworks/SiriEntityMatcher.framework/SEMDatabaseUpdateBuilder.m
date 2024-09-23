@implementation SEMDatabaseUpdateBuilder

- (SEMDatabaseUpdateBuilder)initWithTableName:(id)a3
{
  SEMDatabaseUpdateBuilder *v3;
  NSMutableArray *v4;
  NSMutableArray *columnNames;
  NSMutableArray *v6;
  NSMutableArray *columnValues;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SEMDatabaseUpdateBuilder;
  v3 = -[SEMDatabaseCommandBuilder initWithTableName:](&v9, sel_initWithTableName_, a3);
  if (v3)
  {
    v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    columnNames = v3->_columnNames;
    v3->_columnNames = v4;

    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    columnValues = v3->_columnValues;
    v3->_columnValues = v6;

  }
  return v3;
}

- (id)build
{
  uint64_t v2;
  void *v4;
  NSMutableArray *columnNames;
  NSMutableArray *columnValues;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  void *v11;

  objc_msgSend_tableName(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  columnNames = self->_columnNames;
  columnValues = self->_columnValues;
  objc_msgSend_criterion(self, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_updateWithTableName_columnNames_columnValues_criterion_returningColumns_(SEMSQLCommandGenerator, v10, (uint64_t)v4, columnNames, columnValues, v9, self->_returningColumns);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)setCommandCriterion:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SEMDatabaseUpdateBuilder;
  -[SEMDatabaseCommandBuilder setCommandCriterion:](&v3, sel_setCommandCriterion_, a3);
}

- (void)setValue:(id)a3 forColumn:(id)a4
{
  NSMutableArray *columnNames;
  const char *v7;
  const char *v8;
  id v9;

  columnNames = self->_columnNames;
  v9 = a3;
  objc_msgSend_addObject_(columnNames, v7, (uint64_t)a4);
  objc_msgSend_addObject_(self->_columnValues, v8, (uint64_t)v9);

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
  objc_storeStrong((id *)&self->_columnValues, 0);
  objc_storeStrong((id *)&self->_columnNames, 0);
}

@end
