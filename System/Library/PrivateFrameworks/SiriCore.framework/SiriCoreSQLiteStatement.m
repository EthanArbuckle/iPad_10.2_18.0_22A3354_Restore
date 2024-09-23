@implementation SiriCoreSQLiteStatement

- (void)dealloc
{
  sqlite3_stmt *impl;
  objc_super v4;

  impl = self->_impl;
  if (impl && self->_finalizeWhenDone)
  {
    sqlite3_finalize(impl);
    self->_impl = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)SiriCoreSQLiteStatement;
  -[SiriCoreSQLiteStatement dealloc](&v4, sel_dealloc);
}

- (SiriCoreSQLiteStatement)initWithImpl:(sqlite3_stmt *)a3 finalizeWhenDone:(BOOL)a4
{
  SiriCoreSQLiteStatement *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SiriCoreSQLiteStatement;
  result = -[SiriCoreSQLiteStatement init](&v7, sel_init);
  if (result)
  {
    result->_impl = a3;
    result->_finalizeWhenDone = a4;
  }
  return result;
}

- (void)reset
{
  sqlite3_stmt *impl;

  impl = self->_impl;
  if (impl)
    sqlite3_reset(impl);
}

- (void)clearBindings
{
  sqlite3_stmt *impl;

  impl = self->_impl;
  if (impl)
    sqlite3_clear_bindings(impl);
}

- (sqlite3_stmt)impl
{
  return self->_impl;
}

@end
