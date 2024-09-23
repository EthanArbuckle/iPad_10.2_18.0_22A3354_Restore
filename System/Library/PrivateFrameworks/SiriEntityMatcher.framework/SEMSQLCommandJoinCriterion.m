@implementation SEMSQLCommandJoinCriterion

- (SEMSQLCommandJoinCriterion)initWithColumnName:(id)a3 onTable:(id)a4 comparingColumnName:(id)a5 comparingTableName:(id)a6 sqlOperator:(int64_t)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  SEMSQLCommandJoinCriterion *v17;
  SEMSQLCommandJoinCriterion *v18;
  objc_super v20;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v20.receiver = self;
  v20.super_class = (Class)SEMSQLCommandJoinCriterion;
  v17 = -[SEMSQLCommandJoinCriterion init](&v20, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_columnName, a3);
    objc_storeStrong((id *)&v18->_tableName, a4);
    objc_storeStrong((id *)&v18->_comparingColumnName, a5);
    objc_storeStrong((id *)&v18->_comparingTableName, a6);
    v18->_sqlOperator = a7;
  }

  return v18;
}

- (SEMSQLCommandJoinCriterion)initWithSubCriteria:(id)a3 sqlOperator:(int64_t)a4
{
  id v6;
  SEMSQLCommandJoinCriterion *v7;
  SEMSQLCommandJoinCriterion *v8;
  NSString *columnName;
  NSString *comparingColumnName;
  NSString *v11;
  NSString *comparingTableName;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  NSArray *subCriteria;
  objc_super v18;

  v6 = a3;
  v18.receiver = self;
  v18.super_class = (Class)SEMSQLCommandJoinCriterion;
  v7 = -[SEMSQLCommandJoinCriterion init](&v18, sel_init);
  v8 = v7;
  if (v7)
  {
    columnName = v7->_columnName;
    v7->_columnName = 0;

    comparingColumnName = v8->_comparingColumnName;
    v8->_comparingColumnName = 0;

    v11 = v8->_comparingColumnName;
    v8->_comparingColumnName = 0;

    comparingTableName = v8->_comparingTableName;
    v8->_comparingTableName = 0;

    v8->_sqlOperator = a4;
    v15 = objc_msgSend_copy(v6, v13, v14);
    subCriteria = v8->_subCriteria;
    v8->_subCriteria = (NSArray *)v15;

  }
  return v8;
}

+ (id)criterionWithColumnName:(id)a3 onTable:(id)a4 EQUALSColumnName:(id)a5 comparingTableName:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  SEMSQLCommandJoinCriterion *v13;
  const char *v14;
  void *v15;

  v9 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = [SEMSQLCommandJoinCriterion alloc];
  v15 = (void *)objc_msgSend_initWithColumnName_onTable_comparingColumnName_comparingTableName_sqlOperator_(v13, v14, (uint64_t)v12, v11, v10, v9, 1);

  return v15;
}

+ (id)criterionWithANDSubCriteria:(id)a3
{
  id v3;
  SEMSQLCommandJoinCriterion *v4;
  const char *v5;
  void *v6;

  v3 = a3;
  v4 = [SEMSQLCommandJoinCriterion alloc];
  v6 = (void *)objc_msgSend_initWithSubCriteria_sqlOperator_(v4, v5, (uint64_t)v3, 10);

  return v6;
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
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  void *v22;

  v5 = (void *)objc_opt_class();
  v7 = (_QWORD *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  v9 = objc_msgSend_copyWithZone_(self->_columnName, v8, (uint64_t)a3);
  v10 = (void *)v7[1];
  v7[1] = v9;

  v12 = objc_msgSend_copyWithZone_(self->_tableName, v11, (uint64_t)a3);
  v13 = (void *)v7[2];
  v7[2] = v12;

  v15 = objc_msgSend_copyWithZone_(self->_comparingColumnName, v14, (uint64_t)a3);
  v16 = (void *)v7[3];
  v7[3] = v15;

  v18 = objc_msgSend_copyWithZone_(self->_comparingTableName, v17, (uint64_t)a3);
  v19 = (void *)v7[4];
  v7[4] = v18;

  v7[5] = self->_sqlOperator;
  v21 = objc_msgSend_copyWithZone_(self->_subCriteria, v20, (uint64_t)a3);
  v22 = (void *)v7[6];
  v7[6] = v21;

  return v7;
}

- (NSString)columnName
{
  return self->_columnName;
}

- (NSString)tableName
{
  return self->_tableName;
}

- (NSString)comparingColumnName
{
  return self->_comparingColumnName;
}

- (NSString)comparingTableName
{
  return self->_comparingTableName;
}

- (int64_t)sqlOperator
{
  return self->_sqlOperator;
}

- (NSArray)subCriteria
{
  return self->_subCriteria;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subCriteria, 0);
  objc_storeStrong((id *)&self->_comparingTableName, 0);
  objc_storeStrong((id *)&self->_comparingColumnName, 0);
  objc_storeStrong((id *)&self->_tableName, 0);
  objc_storeStrong((id *)&self->_columnName, 0);
}

@end
