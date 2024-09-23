@implementation PBFSQLiteResultRow

- (PBFSQLiteResultRow)init
{
  void *v4;
  PBFSQLiteResultRow *result;
  objc_super v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PBFSQLiteResultRow.m"), 32, CFSTR("init is not allowed"));

  if (!self)
    return 0;
  v6.receiver = self;
  v6.super_class = (Class)PBFSQLiteResultRow;
  result = -[PBFSQLiteResultRow init](&v6, sel_init);
  if (result)
    result->_statement = 0;
  return result;
}

- (_QWORD)_initWithStatement:(_QWORD *)result
{
  objc_super v3;

  if (result)
  {
    v3.receiver = result;
    v3.super_class = (Class)PBFSQLiteResultRow;
    result = objc_msgSendSuper2(&v3, sel_init);
    if (result)
      result[1] = a2;
  }
  return result;
}

+ (_QWORD)resultRowWithStatement:(uint64_t)a1
{
  objc_class *v3;
  _QWORD *v4;
  void *v6;
  objc_super v7;

  v3 = (objc_class *)objc_opt_self();
  if (!a2)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", sel_resultRowWithStatement_, v3, CFSTR("PBFSQLiteResultRow.m"), 46, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("statement"));

  }
  v4 = [v3 alloc];
  if (v4)
  {
    v7.receiver = v4;
    v7.super_class = (Class)PBFSQLiteResultRow;
    v4 = objc_msgSendSuper2(&v7, sel_init);
    if (v4)
      v4[1] = a2;
  }
  return v4;
}

- (void)invalidate
{
  self->_statement = 0;
}

- (BOOL)isValid
{
  return self->_statement != 0;
}

- (unint64_t)count
{
  sqlite3_stmt *statement;
  void *v6;

  statement = self->_statement;
  if (!statement)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PBFSQLiteResultRow.m"), 61, CFSTR("cannot call %s after the row has become invalid"), "-[PBFSQLiteResultRow count]");

    statement = self->_statement;
  }
  return sqlite3_column_count(statement);
}

- (id)keyAtIndex:(unint64_t)a3
{
  int v3;
  sqlite3_stmt *statement;
  void *v8;

  v3 = a3;
  statement = self->_statement;
  if (!statement)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PBFSQLiteResultRow.m"), 66, CFSTR("cannot call %s after the row has become invalid"), "-[PBFSQLiteResultRow keyAtIndex:]");

    statement = self->_statement;
  }
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", sqlite3_column_name(statement, v3));
}

- (id)objectForKey:(id)a3
{
  return -[PBFSQLiteResultRow objectAtIndex:](self, "objectAtIndex:", -[PBFSQLiteResultRow _indexForKey:](self, a3));
}

- (_QWORD)_indexForKey:(_QWORD *)result
{
  _QWORD *v2;
  id v3;
  void *v4;
  uint64_t v5;

  if (result)
  {
    v2 = result;
    v3 = a2;
    -[PBFSQLiteResultRow _columnNames](v2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "indexOfObject:", v3);

    return (_QWORD *)v5;
  }
  return result;
}

- (id)objectAtIndex:(unint64_t)a3
{
  void *v5;
  void *v7;
  void *v9;

  if (!self->_statement)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PBFSQLiteResultRow.m"), 75, CFSTR("cannot call %s after the row has become invalid"), "-[PBFSQLiteResultRow objectAtIndex:]");

  }
  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_4:
    v5 = 0;
  }
  else
  {
    switch(sqlite3_column_type(self->_statement, a3))
    {
      case 1:
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[PBFSQLiteResultRow integerAtIndex:](self, "integerAtIndex:", a3));
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        break;
      case 2:
        v7 = (void *)MEMORY[0x1E0CB37E8];
        -[PBFSQLiteResultRow doubleAtIndex:](self, "doubleAtIndex:", a3);
        objc_msgSend(v7, "numberWithDouble:");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        break;
      case 3:
        -[PBFSQLiteResultRow stringAtIndex:](self, "stringAtIndex:", a3);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        break;
      case 4:
        -[PBFSQLiteResultRow dataAtIndex:](self, "dataAtIndex:", a3);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        break;
      case 5:
        objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        break;
      default:
        goto LABEL_4;
    }
  }
  return v5;
}

- (int64_t)integerForKey:(id)a3
{
  return -[PBFSQLiteResultRow integerAtIndex:](self, "integerAtIndex:", -[PBFSQLiteResultRow _indexForKey:](self, a3));
}

- (int64_t)integerAtIndex:(unint64_t)a3
{
  void *v7;

  if (!self->_statement)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PBFSQLiteResultRow.m"), 102, CFSTR("cannot call %s after the row has become invalid"), "-[PBFSQLiteResultRow integerAtIndex:]");

  }
  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
    return 0;
  else
    return sqlite3_column_int64(self->_statement, a3);
}

- (double)doubleForKey:(id)a3
{
  double result;

  -[PBFSQLiteResultRow doubleAtIndex:](self, "doubleAtIndex:", -[PBFSQLiteResultRow _indexForKey:](self, a3));
  return result;
}

- (double)doubleAtIndex:(unint64_t)a3
{
  void *v7;

  if (!self->_statement)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PBFSQLiteResultRow.m"), 114, CFSTR("cannot call %s after the row has become invalid"), "-[PBFSQLiteResultRow doubleAtIndex:]");

  }
  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
    return 0.0;
  else
    return sqlite3_column_double(self->_statement, a3);
}

- (id)stringForKey:(id)a3
{
  return -[PBFSQLiteResultRow stringAtIndex:](self, "stringAtIndex:", -[PBFSQLiteResultRow _indexForKey:](self, a3));
}

- (id)stringAtIndex:(unint64_t)a3
{
  void *v5;
  int v6;
  void *v9;

  if (!self->_statement)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PBFSQLiteResultRow.m"), 126, CFSTR("cannot call %s after the row has become invalid"), "-[PBFSQLiteResultRow stringAtIndex:]");

  }
  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = 0;
  }
  else
  {
    v6 = sqlite3_column_bytes(self->_statement, a3);
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", sqlite3_column_text(self->_statement, a3), v6, 4);
  }
  return v5;
}

- (id)dataForKey:(id)a3
{
  return -[PBFSQLiteResultRow dataAtIndex:](self, "dataAtIndex:", -[PBFSQLiteResultRow _indexForKey:](self, a3));
}

- (id)dataAtIndex:(unint64_t)a3
{
  void *v5;
  int v6;
  void *v9;

  if (!self->_statement)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PBFSQLiteResultRow.m"), 140, CFSTR("cannot call %s after the row has become invalid"), "-[PBFSQLiteResultRow dataAtIndex:]");

  }
  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = 0;
  }
  else
  {
    v6 = sqlite3_column_bytes(self->_statement, a3);
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", sqlite3_column_blob(self->_statement, a3), v6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[_PBFSQLiteFrozenResultRow _initWithResultRow:]((_QWORD *)+[_PBFSQLiteFrozenResultRow allocWithZone:](_PBFSQLiteFrozenResultRow, "allocWithZone:", a3), self);
}

- (_QWORD)_columnNames
{
  _QWORD *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t i;
  void *v6;
  uint64_t v7;
  void *v8;

  if (a1)
  {
    v1 = a1;
    v2 = (void *)a1[2];
    if (!v2)
    {
      v3 = objc_msgSend(a1, "count");
      v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v3);
      if (v3)
      {
        for (i = 0; i != v3; ++i)
        {
          objc_msgSend(v1, "keyAtIndex:", i);
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v6);

        }
      }
      v7 = objc_msgSend(v4, "copy");
      v8 = (void *)v1[2];
      v1[2] = v7;

      v2 = (void *)v1[2];
    }
    a1 = v2;
  }
  return a1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_columnNames, 0);
}

@end
