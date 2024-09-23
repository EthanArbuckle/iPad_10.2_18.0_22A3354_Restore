@implementation SSAppPurchaseHistoryTransaction

- (SSAppPurchaseHistoryTransaction)initWithDatabase:(id)a3
{
  SSAppPurchaseHistoryTransaction *v4;

  v4 = -[SSAppPurchaseHistoryTransaction init](self, "init");
  if (v4)
    v4->_database = (SSSQLiteDatabase *)a3;
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SSAppPurchaseHistoryTransaction;
  -[SSAppPurchaseHistoryTransaction dealloc](&v3, sel_dealloc);
}

- (SSSQLiteDatabase)database
{
  return self->_database;
}

@end
