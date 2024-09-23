@implementation SEMDatabaseSelectBuilder

- (SEMDatabaseSelectBuilder)initWithTableName:(id)a3
{
  SEMDatabaseSelectBuilder *v3;
  SEMDatabaseSelectBuilder *v4;
  SEMSQLCommandJoin *join;
  SEMSQLCommandOrder *order;
  NSNumber *limit;
  NSNumber *offset;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SEMDatabaseSelectBuilder;
  v3 = -[SEMDatabaseCommandBuilder initWithTableName:](&v10, sel_initWithTableName_, a3);
  v4 = v3;
  if (v3)
  {
    join = v3->_join;
    v3->_join = 0;

    order = v4->_order;
    v4->_order = 0;

    v4->_count = 0;
    limit = v4->_limit;
    v4->_limit = 0;

    offset = v4->_offset;
    v4->_offset = 0;

  }
  return v4;
}

- (id)build
{
  uint64_t v2;
  void *v4;
  NSArray *columns;
  _BOOL8 count;
  SEMSQLCommandJoin *join;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  void *v12;

  objc_msgSend_tableName(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  columns = self->_columns;
  count = self->_count;
  join = self->_join;
  objc_msgSend_criterion(self, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_selectFromTableWithName_columns_count_join_criterion_order_limit_offset_(SEMSQLCommandGenerator, v11, (uint64_t)v4, columns, count, join, v10, self->_order, self->_limit, self->_offset);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (void)setCommandCriterion:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SEMDatabaseSelectBuilder;
  -[SEMDatabaseCommandBuilder setCommandCriterion:](&v3, sel_setCommandCriterion_, a3);
}

- (void)setJoinWithTable:(id)a3 joinCriterion:(id)a4
{
  id v6;
  id v7;
  SEMSQLCommandJoin *v8;
  const char *v9;
  SEMSQLCommandJoin *v10;
  SEMSQLCommandJoin *join;

  v6 = a4;
  v7 = a3;
  v8 = [SEMSQLCommandJoin alloc];
  v10 = (SEMSQLCommandJoin *)objc_msgSend_initWithTable_joinCriterion_(v8, v9, (uint64_t)v7, v6);

  join = self->_join;
  self->_join = v10;

}

- (void)setCommandOrder:(id)a3
{
  SEMSQLCommandOrder *v4;
  SEMSQLCommandOrder *order;

  v4 = (SEMSQLCommandOrder *)objc_msgSend_copy(a3, a2, (uint64_t)a3);
  order = self->_order;
  self->_order = v4;

}

- (void)setColumns:(id)a3
{
  NSArray *v4;
  NSArray *columns;

  v4 = (NSArray *)objc_msgSend_copy(a3, a2, (uint64_t)a3);
  columns = self->_columns;
  self->_columns = v4;

}

- (void)setColumns:(id)a3 withTablePrefixes:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  unint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  void *v21;
  const char *v22;
  void *v23;
  const char *v24;
  const char *v25;
  uint64_t v26;
  id v27;

  v27 = a3;
  v6 = a4;
  v7 = objc_alloc(MEMORY[0x24BDBCEB8]);
  v10 = objc_msgSend_count(v27, v8, v9);
  v12 = (void *)objc_msgSend_initWithCapacity_(v7, v11, v10);
  if (objc_msgSend_count(v27, v13, v14))
  {
    v16 = 0;
    do
    {
      objc_msgSend_objectAtIndex_(v27, v15, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend_count(v6, v18, v19) <= v16)
      {
        v21 = 0;
        objc_msgSend_prefixColumnName_withTableName_(SEMSQLCommandGenerator, v20, (uint64_t)v17, 0);
      }
      else
      {
        objc_msgSend_objectAtIndex_(v6, v20, v16);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_prefixColumnName_withTableName_(SEMSQLCommandGenerator, v22, (uint64_t)v17, v21);
      }
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_addObject_(v12, v24, (uint64_t)v23);

      ++v16;
    }
    while (v16 < objc_msgSend_count(v27, v25, v26));
  }
  objc_msgSend_setColumns_(self, v15, (uint64_t)v12);

}

- (void)setCount:(BOOL)a3
{
  self->_count = a3;
}

- (void)setLimit:(id)a3
{
  objc_storeStrong((id *)&self->_limit, a3);
}

- (void)setOffset:(id)a3
{
  objc_storeStrong((id *)&self->_offset, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_offset, 0);
  objc_storeStrong((id *)&self->_limit, 0);
  objc_storeStrong((id *)&self->_columns, 0);
  objc_storeStrong((id *)&self->_order, 0);
  objc_storeStrong((id *)&self->_join, 0);
}

@end
