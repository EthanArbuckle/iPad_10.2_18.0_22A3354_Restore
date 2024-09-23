@implementation WBSSQLiteRowEnumerator

- (WBSSQLiteRowEnumerator)initWithResultsOfStatement:(id)a3
{
  id v5;
  WBSSQLiteRowEnumerator *v6;
  WBSSQLiteRowEnumerator *v7;
  WBSSQLiteRowEnumerator *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WBSSQLiteRowEnumerator;
  v6 = -[WBSSQLiteRowEnumerator init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_statement, a3);
    v8 = v7;
  }

  return v7;
}

- (id)nextObject
{
  int v3;
  WBSSQLiteRow *v4;
  WBSSQLiteRow *row;
  WBSSQLiteRow *v6;
  WBSSQLiteRow *v7;
  void *v8;

  v3 = sqlite3_step(-[WBSSQLiteStatement handle](self->_statement, "handle"));
  v4 = 0;
  self->_lastResultCode = v3;
  if (v3 && v3 != 101)
  {
    if (v3 == 100)
    {
      row = self->_row;
      if (!row)
      {
        v6 = -[WBSSQLiteRow initWithCurrentRowOfEnumerator:]([WBSSQLiteRow alloc], "initWithCurrentRowOfEnumerator:", self);
        v7 = self->_row;
        self->_row = v6;

        row = self->_row;
      }
      v4 = row;
    }
    else
    {
      -[WBSSQLiteStatement database](self->_statement, "database");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "reportErrorWithCode:statement:error:", self->_lastResultCode, -[WBSSQLiteStatement handle](self->_statement, "handle"), 0);

      v4 = 0;
    }
  }
  return v4;
}

- (WBSSQLiteStatement)statement
{
  return self->_statement;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_row, 0);
  objc_storeStrong((id *)&self->_statement, 0);
}

- (int)lastResultCode
{
  return self->_lastResultCode;
}

@end
