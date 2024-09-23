@implementation SiriCoreSQLiteQueryOrder

- (SiriCoreSQLiteQueryOrder)initWithColumnNames:(id)a3 mode:(int64_t)a4
{
  id v6;
  SiriCoreSQLiteQueryOrder *v7;
  SiriCoreSQLiteQueryOrder *v8;
  uint64_t v9;
  NSArray *columnNames;
  objc_super v12;

  v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SiriCoreSQLiteQueryOrder;
  v7 = -[SiriCoreSQLiteQueryOrder init](&v12, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_mode = a4;
    v9 = objc_msgSend(v6, "copy");
    columnNames = v8->_columnNames;
    v8->_columnNames = (NSArray *)v9;

  }
  return v8;
}

- (int64_t)mode
{
  return self->_mode;
}

- (NSArray)columnNames
{
  return self->_columnNames;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_columnNames, 0);
}

@end
