@implementation SEMDatabaseInsert

+ (id)builderWithTableName:(id)a3 columnNames:(id)a4
{
  id v5;
  id v6;
  SEMDatabaseInsertBuilder *v7;
  const char *v8;
  void *v9;

  v5 = a4;
  v6 = a3;
  v7 = [SEMDatabaseInsertBuilder alloc];
  v9 = (void *)objc_msgSend_initWithTableName_columnNames_(v7, v8, (uint64_t)v6, v5);

  return v9;
}

@end
