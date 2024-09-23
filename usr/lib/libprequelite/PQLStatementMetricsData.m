@implementation PQLStatementMetricsData

- (PQLStatementMetricsData)initWithStmt:(sqlite3_stmt *)a3 returnedRows:(unint64_t)a4 executionTime:(double)a5 preparationTime:(double)a6
{
  PQLStatementMetricsData *result;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PQLStatementMetricsData;
  result = -[PQLStatementMetricsData init](&v11, sel_init);
  if (result)
  {
    result->_stmt = a3;
    result->_returnedRows = a4;
    result->_executionTime = a5;
    result->_preparationTime = a6;
  }
  return result;
}

- (sqlite3_stmt)stmt
{
  return self->_stmt;
}

- (unint64_t)returnedRows
{
  return self->_returnedRows;
}

- (double)executionTime
{
  return self->_executionTime;
}

- (double)preparationTime
{
  return self->_preparationTime;
}

@end
