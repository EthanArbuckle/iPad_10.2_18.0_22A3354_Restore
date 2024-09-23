@implementation QLCacheIndexDatabaseGenericEnumerator

- (QLCacheIndexDatabaseGenericEnumerator)initWithSqliteDatabase:(id)a3
{
  id v5;
  QLCacheIndexDatabaseGenericEnumerator *v6;
  QLCacheIndexDatabaseGenericEnumerator *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)QLCacheIndexDatabaseGenericEnumerator;
  v6 = -[QLCacheIndexDatabaseGenericEnumerator init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_sqliteDatabase, a3);

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sqliteDatabase, 0);
}

- (void)dealloc
{
  sqlite3_stmt **p_stmt;
  objc_super v4;

  p_stmt = &self->_stmt;
  if (self->_stmt)
    -[QLSqliteDatabase finalizeStatement:](self->_sqliteDatabase, "finalizeStatement:", p_stmt);
  v4.receiver = self;
  v4.super_class = (Class)QLCacheIndexDatabaseGenericEnumerator;
  -[QLCacheIndexDatabaseGenericEnumerator dealloc](&v4, sel_dealloc, p_stmt);
}

@end
