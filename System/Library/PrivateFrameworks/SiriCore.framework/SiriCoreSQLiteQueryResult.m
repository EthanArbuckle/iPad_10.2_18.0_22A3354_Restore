@implementation SiriCoreSQLiteQueryResult

- (SiriCoreSQLiteQueryResult)initWithQuery:(id)a3 beginMachTime:(unint64_t)a4 endMachTime:(unint64_t)a5 statement:(id)a6 columnNameTuple:(id)a7 columnValueTuples:(id)a8 columnValuesMap:(id)a9 rowValueTuples:(id)a10 rowValueMaps:(id)a11 records:(id)a12 error:(id)a13
{
  id v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  id v25;
  SiriCoreSQLiteQueryResult *v26;
  SiriCoreSQLiteQueryResult *v27;
  uint64_t v28;
  NSArray *columnNameTuple;
  uint64_t v30;
  NSArray *columnValueTuples;
  uint64_t v32;
  NSDictionary *columnValuesMap;
  uint64_t v34;
  NSArray *rowValueTuples;
  uint64_t v36;
  NSArray *rowValueMaps;
  uint64_t v38;
  NSArray *records;
  uint64_t v40;
  NSError *error;
  id v45;
  id v46;
  objc_super v47;

  v46 = a3;
  v45 = a6;
  v18 = a7;
  v19 = a8;
  v20 = a9;
  v21 = v18;
  v22 = a10;
  v23 = a11;
  v24 = a12;
  v25 = a13;
  v47.receiver = self;
  v47.super_class = (Class)SiriCoreSQLiteQueryResult;
  v26 = -[SiriCoreSQLiteQueryResult init](&v47, sel_init);
  v27 = v26;
  if (v26)
  {
    objc_storeStrong((id *)&v26->_query, a3);
    v27->_beginMachTime = a4;
    v27->_endMachTime = a5;
    objc_storeStrong((id *)&v27->_statement, a6);
    v28 = objc_msgSend(v21, "copy");
    columnNameTuple = v27->_columnNameTuple;
    v27->_columnNameTuple = (NSArray *)v28;

    v30 = objc_msgSend(v19, "copy");
    columnValueTuples = v27->_columnValueTuples;
    v27->_columnValueTuples = (NSArray *)v30;

    v32 = objc_msgSend(v20, "copy");
    columnValuesMap = v27->_columnValuesMap;
    v27->_columnValuesMap = (NSDictionary *)v32;

    v34 = objc_msgSend(v22, "copy");
    rowValueTuples = v27->_rowValueTuples;
    v27->_rowValueTuples = (NSArray *)v34;

    v36 = objc_msgSend(v23, "copy");
    rowValueMaps = v27->_rowValueMaps;
    v27->_rowValueMaps = (NSArray *)v36;

    v38 = objc_msgSend(v24, "copy");
    records = v27->_records;
    v27->_records = (NSArray *)v38;

    v40 = objc_msgSend(v25, "copy");
    error = v27->_error;
    v27->_error = (NSError *)v40;

  }
  return v27;
}

- (NSError)error
{
  return self->_error;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x24BDD16A8];
  v7.receiver = self;
  v7.super_class = (Class)SiriCoreSQLiteQueryResult;
  -[SiriCoreSQLiteQueryResult description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ {query = %@, beginMachTime = %llu, endMachTime = %llu"), v4, self->_query, self->_beginMachTime, self->_endMachTime);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (self->_columnNameTuple)
    objc_msgSend(v5, "appendFormat:", CFSTR(", columnNameTuple = %@"), self->_columnNameTuple);
  if (self->_columnValueTuples)
    objc_msgSend(v5, "appendFormat:", CFSTR(", columnValueTuples = %@"), self->_columnValueTuples);
  if (self->_columnValuesMap)
    objc_msgSend(v5, "appendFormat:", CFSTR(", columnValuesMap = %@"), self->_columnValuesMap);
  if (self->_rowValueTuples)
    objc_msgSend(v5, "appendFormat:", CFSTR(", rowValueTuples = %@"), self->_rowValueTuples);
  if (self->_rowValueMaps)
    objc_msgSend(v5, "appendFormat:", CFSTR(", rowValueMaps = %@"), self->_rowValueMaps);
  if (self->_records)
    objc_msgSend(v5, "appendFormat:", CFSTR(", records = %@"), self->_records);
  if (self->_error)
    objc_msgSend(v5, "appendFormat:", CFSTR(", error = %@"), self->_error);
  objc_msgSend(v5, "appendString:", CFSTR("}"));
  return v5;
}

- (SiriCoreSQLiteQuery)query
{
  return self->_query;
}

- (unint64_t)beginMachTime
{
  return self->_beginMachTime;
}

- (unint64_t)endMachTime
{
  return self->_endMachTime;
}

- (SiriCoreSQLiteStatement)statement
{
  return self->_statement;
}

- (NSArray)columnNameTuple
{
  return self->_columnNameTuple;
}

- (NSArray)columnValueTuples
{
  return self->_columnValueTuples;
}

- (NSDictionary)columnValuesMap
{
  return self->_columnValuesMap;
}

- (NSArray)rowValueTuples
{
  return self->_rowValueTuples;
}

- (NSArray)rowValueMaps
{
  return self->_rowValueMaps;
}

- (NSArray)records
{
  return self->_records;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_records, 0);
  objc_storeStrong((id *)&self->_rowValueMaps, 0);
  objc_storeStrong((id *)&self->_rowValueTuples, 0);
  objc_storeStrong((id *)&self->_columnValuesMap, 0);
  objc_storeStrong((id *)&self->_columnValueTuples, 0);
  objc_storeStrong((id *)&self->_columnNameTuple, 0);
  objc_storeStrong((id *)&self->_statement, 0);
  objc_storeStrong((id *)&self->_query, 0);
}

@end
