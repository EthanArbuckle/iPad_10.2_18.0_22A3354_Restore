@implementation SEMSQLCommandCriterion

- (SEMSQLCommandCriterion)initWithColumnName:(id)a3 columnValues:(id)a4 sqlOperator:(int64_t)a5
{
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  SEMSQLCommandCriterion *v12;
  uint64_t v13;
  NSString *columnName;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  NSArray *columnValues;
  NSArray *subCriteria;
  objc_super v21;

  v8 = a3;
  v9 = a4;
  v21.receiver = self;
  v21.super_class = (Class)SEMSQLCommandCriterion;
  v12 = -[SEMSQLCommandCriterion init](&v21, sel_init);
  if (v12)
  {
    v13 = objc_msgSend_copy(v8, v10, v11);
    columnName = v12->_columnName;
    v12->_columnName = (NSString *)v13;

    v17 = objc_msgSend_copy(v9, v15, v16);
    columnValues = v12->_columnValues;
    v12->_columnValues = (NSArray *)v17;

    subCriteria = v12->_subCriteria;
    v12->_sqlOperator = a5;
    v12->_subCriteria = 0;

  }
  return v12;
}

- (SEMSQLCommandCriterion)initWithColumnName:(id)a3 columnValue:(id)a4 sqlOperator:(int64_t)a5
{
  return (SEMSQLCommandCriterion *)objc_msgSend_initWithColumnName_tableName_columnValue_sqlOperator_(self, a2, (uint64_t)a3, 0, a4, a5);
}

- (SEMSQLCommandCriterion)initWithColumnName:(id)a3 tableName:(id)a4 columnValue:(id)a5 sqlOperator:(int64_t)a6
{
  id v10;
  id v11;
  id v12;
  const char *v13;
  uint64_t v14;
  SEMSQLCommandCriterion *v15;
  uint64_t v16;
  NSString *columnName;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  NSString *tableName;
  const char *v22;
  uint64_t v23;
  NSArray *columnValues;
  NSArray *subCriteria;
  objc_super v27;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v27.receiver = self;
  v27.super_class = (Class)SEMSQLCommandCriterion;
  v15 = -[SEMSQLCommandCriterion init](&v27, sel_init);
  if (v15)
  {
    v16 = objc_msgSend_copy(v10, v13, v14);
    columnName = v15->_columnName;
    v15->_columnName = (NSString *)v16;

    v20 = objc_msgSend_copy(v11, v18, v19);
    tableName = v15->_tableName;
    v15->_tableName = (NSString *)v20;

    objc_msgSend_arrayWithObject_(MEMORY[0x24BDBCE30], v22, (uint64_t)v12);
    v23 = objc_claimAutoreleasedReturnValue();
    columnValues = v15->_columnValues;
    v15->_columnValues = (NSArray *)v23;

    subCriteria = v15->_subCriteria;
    v15->_sqlOperator = a6;
    v15->_subCriteria = 0;

  }
  return v15;
}

- (SEMSQLCommandCriterion)initWithSubCriteria:(id)a3 sqlOperator:(int64_t)a4
{
  id v6;
  SEMSQLCommandCriterion *v7;
  SEMSQLCommandCriterion *v8;
  NSString *columnName;
  NSArray *columnValues;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  NSArray *subCriteria;
  objc_super v16;

  v6 = a3;
  v16.receiver = self;
  v16.super_class = (Class)SEMSQLCommandCriterion;
  v7 = -[SEMSQLCommandCriterion init](&v16, sel_init);
  v8 = v7;
  if (v7)
  {
    columnName = v7->_columnName;
    v7->_columnName = 0;

    columnValues = v8->_columnValues;
    v8->_columnValues = 0;

    v8->_sqlOperator = a4;
    v13 = objc_msgSend_copy(v6, v11, v12);
    subCriteria = v8->_subCriteria;
    v8->_subCriteria = (NSArray *)v13;

  }
  return v8;
}

+ (SEMSQLCommandCriterion)criterionWithColumnName:(id)a3 EQUALSColumnValue:(id)a4
{
  id v5;
  id v6;
  SEMSQLCommandCriterion *v7;
  const char *v8;
  void *v9;

  v5 = a4;
  v6 = a3;
  v7 = [SEMSQLCommandCriterion alloc];
  v9 = (void *)objc_msgSend_initWithColumnName_columnValue_sqlOperator_(v7, v8, (uint64_t)v6, v5, 1);

  return (SEMSQLCommandCriterion *)v9;
}

+ (SEMSQLCommandCriterion)criterionWithColumnName:(id)a3 ISColumnValue:(id)a4
{
  id v5;
  id v6;
  SEMSQLCommandCriterion *v7;
  const char *v8;
  void *v9;

  v5 = a4;
  v6 = a3;
  v7 = [SEMSQLCommandCriterion alloc];
  v9 = (void *)objc_msgSend_initWithColumnName_columnValue_sqlOperator_(v7, v8, (uint64_t)v6, v5, 12);

  return (SEMSQLCommandCriterion *)v9;
}

+ (SEMSQLCommandCriterion)criterionWithColumnName:(id)a3 ISNOTColumnValue:(id)a4
{
  id v5;
  id v6;
  SEMSQLCommandCriterion *v7;
  const char *v8;
  void *v9;

  v5 = a4;
  v6 = a3;
  v7 = [SEMSQLCommandCriterion alloc];
  v9 = (void *)objc_msgSend_initWithColumnName_columnValue_sqlOperator_(v7, v8, (uint64_t)v6, v5, 13);

  return (SEMSQLCommandCriterion *)v9;
}

+ (SEMSQLCommandCriterion)criterionWithColumnName:(id)a3 onTable:(id)a4 EQUALSColumnValue:(id)a5
{
  id v7;
  id v8;
  id v9;
  SEMSQLCommandCriterion *v10;
  const char *v11;
  void *v12;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = [SEMSQLCommandCriterion alloc];
  v12 = (void *)objc_msgSend_initWithColumnName_tableName_columnValue_sqlOperator_(v10, v11, (uint64_t)v9, v8, v7, 1);

  return (SEMSQLCommandCriterion *)v12;
}

+ (SEMSQLCommandCriterion)criterionWithColumnName:(id)a3 NOTEQUALSColumnValue:(id)a4
{
  id v5;
  id v6;
  SEMSQLCommandCriterion *v7;
  const char *v8;
  void *v9;

  v5 = a4;
  v6 = a3;
  v7 = [SEMSQLCommandCriterion alloc];
  v9 = (void *)objc_msgSend_initWithColumnName_columnValue_sqlOperator_(v7, v8, (uint64_t)v6, v5, 6);

  return (SEMSQLCommandCriterion *)v9;
}

+ (SEMSQLCommandCriterion)criterionWithColumnName:(id)a3 LESSTHANColumnValue:(id)a4
{
  id v5;
  id v6;
  SEMSQLCommandCriterion *v7;
  const char *v8;
  void *v9;

  v5 = a4;
  v6 = a3;
  v7 = [SEMSQLCommandCriterion alloc];
  v9 = (void *)objc_msgSend_initWithColumnName_columnValue_sqlOperator_(v7, v8, (uint64_t)v6, v5, 2);

  return (SEMSQLCommandCriterion *)v9;
}

+ (SEMSQLCommandCriterion)criterionWithColumnName:(id)a3 LESSTHANOrEqualColumnValue:(id)a4
{
  id v5;
  id v6;
  SEMSQLCommandCriterion *v7;
  const char *v8;
  void *v9;

  v5 = a4;
  v6 = a3;
  v7 = [SEMSQLCommandCriterion alloc];
  v9 = (void *)objc_msgSend_initWithColumnName_columnValue_sqlOperator_(v7, v8, (uint64_t)v6, v5, 3);

  return (SEMSQLCommandCriterion *)v9;
}

+ (SEMSQLCommandCriterion)criterionWithColumnName:(id)a3 GREATERTHANOrEqualColumnValue:(id)a4
{
  id v5;
  id v6;
  SEMSQLCommandCriterion *v7;
  const char *v8;
  void *v9;

  v5 = a4;
  v6 = a3;
  v7 = [SEMSQLCommandCriterion alloc];
  v9 = (void *)objc_msgSend_initWithColumnName_columnValue_sqlOperator_(v7, v8, (uint64_t)v6, v5, 4);

  return (SEMSQLCommandCriterion *)v9;
}

+ (SEMSQLCommandCriterion)criterionWithColumnName:(id)a3 MATCHSearchPhrase:(id)a4
{
  id v5;
  id v6;
  SEMSQLCommandCriterion *v7;
  const char *v8;
  void *v9;

  v5 = a4;
  v6 = a3;
  v7 = [SEMSQLCommandCriterion alloc];
  v9 = (void *)objc_msgSend_initWithColumnName_columnValue_sqlOperator_(v7, v8, (uint64_t)v6, v5, 5);

  return (SEMSQLCommandCriterion *)v9;
}

+ (SEMSQLCommandCriterion)criterionWithColumnName:(id)a3 LIKEWildcardPattern:(id)a4
{
  id v5;
  id v6;
  SEMSQLCommandCriterion *v7;
  const char *v8;
  void *v9;

  v5 = a4;
  v6 = a3;
  v7 = [SEMSQLCommandCriterion alloc];
  v9 = (void *)objc_msgSend_initWithColumnName_columnValue_sqlOperator_(v7, v8, (uint64_t)v6, v5, 9);

  return (SEMSQLCommandCriterion *)v9;
}

+ (SEMSQLCommandCriterion)criterionWithColumnName:(id)a3 INColumnValues:(id)a4
{
  id v5;
  id v6;
  SEMSQLCommandCriterion *v7;
  const char *v8;
  void *v9;

  v5 = a4;
  v6 = a3;
  v7 = [SEMSQLCommandCriterion alloc];
  v9 = (void *)objc_msgSend_initWithColumnName_columnValues_sqlOperator_(v7, v8, (uint64_t)v6, v5, 8);

  return (SEMSQLCommandCriterion *)v9;
}

+ (SEMSQLCommandCriterion)criterionWithColumnName:(id)a3 BETWEENLowerColumnValue:(id)a4 ANDUpperColumnValue:(id)a5
{
  id v7;
  id v8;
  id v9;
  SEMSQLCommandCriterion *v10;
  const char *v11;
  void *v12;
  const char *v13;
  void *v14;
  _QWORD v16[3];

  v16[2] = *MEMORY[0x24BDAC8D0];
  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = [SEMSQLCommandCriterion alloc];
  v16[0] = v8;
  v16[1] = v7;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v11, (uint64_t)v16, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)objc_msgSend_initWithColumnName_columnValues_sqlOperator_(v10, v13, (uint64_t)v9, v12, 7);
  return (SEMSQLCommandCriterion *)v14;
}

+ (SEMSQLCommandCriterion)criterionWithANDSubCriteria:(id)a3
{
  id v3;
  SEMSQLCommandCriterion *v4;
  const char *v5;
  void *v6;

  v3 = a3;
  v4 = [SEMSQLCommandCriterion alloc];
  v6 = (void *)objc_msgSend_initWithSubCriteria_sqlOperator_(v4, v5, (uint64_t)v3, 10);

  return (SEMSQLCommandCriterion *)v6;
}

+ (SEMSQLCommandCriterion)criterionWithORSubCriteria:(id)a3
{
  id v3;
  SEMSQLCommandCriterion *v4;
  const char *v5;
  void *v6;

  v3 = a3;
  v4 = [SEMSQLCommandCriterion alloc];
  v6 = (void *)objc_msgSend_initWithSubCriteria_sqlOperator_(v4, v5, (uint64_t)v3, 11);

  return (SEMSQLCommandCriterion *)v6;
}

- (id)description
{
  void *v3;
  NSString *columnName;
  NSArray *columnValues;
  const char *v6;
  void *v7;
  const char *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SEMSQLCommandCriterion;
  -[SEMSQLCommandCriterion description](&v11, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  columnName = self->_columnName;
  columnValues = self->_columnValues;
  objc_msgSend_numberWithInteger_(MEMORY[0x24BDD16E0], v6, self->_sqlOperator);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringByAppendingFormat_(v3, v8, (uint64_t)CFSTR(" columnName: %@, columnValues: %@, sqlOperator: %@, subCriteria: %@"), columnName, columnValues, v7, self->_subCriteria);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (SEMSQLCommandCriterion)init
{
  id v2;

  objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x24BDBCE88], a2, *MEMORY[0x24BDBCAB0], CFSTR("You must use factory methods"), MEMORY[0x24BDBD1B8]);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
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

  v5 = (void *)objc_opt_class();
  v7 = (_QWORD *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  v9 = objc_msgSend_copyWithZone_(self->_columnName, v8, (uint64_t)a3);
  v10 = (void *)v7[1];
  v7[1] = v9;

  v12 = objc_msgSend_copyWithZone_(self->_columnValues, v11, (uint64_t)a3);
  v13 = (void *)v7[4];
  v7[4] = v12;

  v7[5] = self->_sqlOperator;
  v15 = objc_msgSend_copyWithZone_(self->_subCriteria, v14, (uint64_t)a3);
  v16 = (void *)v7[6];
  v7[6] = v15;

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

- (NSArray)columnValues
{
  return self->_columnValues;
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
  objc_storeStrong((id *)&self->_columnValues, 0);
  objc_storeStrong((id *)&self->_comparingColumnName, 0);
  objc_storeStrong((id *)&self->_tableName, 0);
  objc_storeStrong((id *)&self->_columnName, 0);
}

@end
