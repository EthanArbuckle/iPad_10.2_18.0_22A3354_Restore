@implementation SEMDatabaseEmptyAccess

- (BOOL)enumerateRecordResultsOfSelect:(id)a3 recordClass:(Class)a4 error:(id *)a5 usingBlock:(id)a6
{
  NSObject *v6;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v6 = qword_25441F970;
  if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_INFO))
  {
    v8 = 136315138;
    v9 = "-[SEMDatabaseEmptyAccess enumerateRecordResultsOfSelect:recordClass:error:usingBlock:]";
    _os_log_impl(&dword_2462C4000, v6, OS_LOG_TYPE_INFO, "%s Returning empty results.", (uint8_t *)&v8, 0xCu);
  }
  return 1;
}

- (BOOL)enumerateRowResultsOfSelect:(id)a3 recordClass:(Class)a4 error:(id *)a5 usingBlock:(id)a6
{
  NSObject *v6;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v6 = qword_25441F970;
  if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_INFO))
  {
    v8 = 136315138;
    v9 = "-[SEMDatabaseEmptyAccess enumerateRowResultsOfSelect:recordClass:error:usingBlock:]";
    _os_log_impl(&dword_2462C4000, v6, OS_LOG_TYPE_INFO, "%s Returning empty results.", (uint8_t *)&v8, 0xCu);
  }
  return 1;
}

- (BOOL)enumerateRecordResultsOfSelect:(id)a3 recordClass:(Class)a4 batchSize:(unint64_t)a5 offset:(unint64_t)a6 enumerateAll:(BOOL)a7 error:(id *)a8 usingBlock:(id)a9
{
  NSObject *v9;
  int v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v9 = qword_25441F970;
  if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_INFO))
  {
    v11 = 136315138;
    v12 = "-[SEMDatabaseEmptyAccess enumerateRecordResultsOfSelect:recordClass:batchSize:offset:enumerateAll:error:usingBlock:]";
    _os_log_impl(&dword_2462C4000, v9, OS_LOG_TYPE_INFO, "%s Returning empty results", (uint8_t *)&v11, 0xCu);
  }
  return 1;
}

- (BOOL)enumerateRowResultsOfSelect:(id)a3 batchSize:(unint64_t)a4 offset:(unint64_t)a5 enumerateAll:(BOOL)a6 error:(id *)a7 usingBlock:(id)a8
{
  NSObject *v8;
  int v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v8 = qword_25441F970;
  if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_INFO))
  {
    v10 = 136315138;
    v11 = "-[SEMDatabaseEmptyAccess enumerateRowResultsOfSelect:batchSize:offset:enumerateAll:error:usingBlock:]";
    _os_log_impl(&dword_2462C4000, v8, OS_LOG_TYPE_INFO, "%s Returning empty results", (uint8_t *)&v10, 0xCu);
  }
  return 1;
}

- (BOOL)enumerateRowResultsOfSelect:(id)a3 error:(id *)a4 usingBlock:(id)a5
{
  NSObject *v5;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v5 = qword_25441F970;
  if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_INFO))
  {
    v7 = 136315138;
    v8 = "-[SEMDatabaseEmptyAccess enumerateRowResultsOfSelect:error:usingBlock:]";
    _os_log_impl(&dword_2462C4000, v5, OS_LOG_TYPE_INFO, "%s Returning empty results.", (uint8_t *)&v7, 0xCu);
  }
  return 1;
}

@end
