@implementation _PASSqlReadTransaction

- (_PASSqlReadTransaction)initWithHandle:(id)a3
{
  id v6;
  _PASSqlReadTransaction *v7;
  _PASSqlReadTransaction *v8;
  void *v10;
  objc_super v11;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_PASSqliteTransaction.m"), 25, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("handle"));

  }
  v11.receiver = self;
  v11.super_class = (Class)_PASSqlReadTransaction;
  v7 = -[_PASSqlReadTransaction init](&v11, sel_init);
  v8 = v7;
  if (v7)
    objc_storeStrong((id *)&v7->_db, a3);

  return v8;
}

- (_PASSqliteDatabase)db
{
  return self->_db;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_db, 0);
}

@end
