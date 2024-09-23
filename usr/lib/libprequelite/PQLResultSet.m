@implementation PQLResultSet

- (int64_t)longAtIndex:(int)a3
{
  return sqlite3_column_int64(self->_stmt->_stmt, a3);
}

- (BOOL)next
{
  return -[PQLResultSet _next:](self, "_next:", 0);
}

- (int64_t)longLongAtIndex:(int)a3
{
  return sqlite3_column_int64(self->_stmt->_stmt, a3);
}

- (unint64_t)unsignedLongAtIndex:(int)a3
{
  return sqlite3_column_int64(self->_stmt->_stmt, a3);
}

- (int64_t)integerAtIndex:(int)a3
{
  return sqlite3_column_int64(self->_stmt->_stmt, a3);
}

- (unsigned)unsignedIntAtIndex:(int)a3
{
  return sqlite3_column_int64(self->_stmt->_stmt, a3);
}

- (BOOL)BOOLAtIndex:(int)a3
{
  return sqlite3_column_int(self->_stmt->_stmt, a3) != 0;
}

- (BOOL)isNullAtIndex:(int)a3
{
  return sqlite3_column_type(self->_stmt->_stmt, a3) == 5;
}

- (BOOL)_next:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  PQLConnection *db;
  uint64_t v7;
  int v8;
  BOOL v9;
  NSError *v10;
  NSError *error;
  NSError *v12;
  NSError *v13;
  uint64_t v14;
  void *v15;

  v3 = a3;
  -[PQLConnection serialQueue](self->_db, "serialQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!self->_stmt)
    goto LABEL_18;
  db = self->_db;
  if (!db)
    goto LABEL_18;
  if (v5)
    -[PQLConnection assertOnQueue](db, "assertOnQueue");
  v7 = mach_absolute_time();
  v8 = sqlite3_step(self->_stmt->_stmt);
  self->_executionTime += mach_absolute_time() - v7;
  if (v8 == 101)
  {
    if (v3)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithSqliteCode:andMessage:", 12, CFSTR("no result found"));
      v10 = (NSError *)objc_claimAutoreleasedReturnValue();
      error = self->_error;
      self->_error = v10;
LABEL_16:

      goto LABEL_17;
    }
    goto LABEL_17;
  }
  if (v8 != 100)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorForDB:stmt:", -[PQLConnection dbHandle](self->_db, "dbHandle"), self->_stmt->_stmt);
    v12 = (NSError *)objc_claimAutoreleasedReturnValue();
    v13 = self->_error;
    self->_error = v12;

    if (self->_inTransaction && sqlite3_get_autocommit(-[PQLConnection dbHandle](self->_db, "dbHandle")))
    {
      -[PQLConnection autoRollbackHandler](self->_db, "autoRollbackHandler");
      v14 = objc_claimAutoreleasedReturnValue();
LABEL_15:
      error = (NSError *)v14;
      (*(void (**)(uint64_t, PQLConnection *, PQLStatement *, NSError *))(v14 + 16))(v14, self->_db, self->_stmt, self->_error);
      goto LABEL_16;
    }
    -[PQLConnection sqliteErrorHandler](self->_db, "sqliteErrorHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      -[PQLConnection sqliteErrorHandler](self->_db, "sqliteErrorHandler");
      v14 = objc_claimAutoreleasedReturnValue();
      goto LABEL_15;
    }
LABEL_17:
    -[PQLResultSet close](self, "close");
LABEL_18:
    v9 = 0;
    goto LABEL_19;
  }
  ++self->_rowNumber;
  v9 = 1;
LABEL_19:

  return v9;
}

- (void)dealloc
{
  NSError *error;
  objc_super v4;

  -[PQLResultSet close](self, "close");
  error = self->_error;
  self->_error = 0;

  v4.receiver = self;
  v4.super_class = (Class)PQLResultSet;
  -[PQLResultSet dealloc](&v4, sel_dealloc);
}

- (void)close
{
  PQLStatement *stmt;
  PQLConnection *db;
  id lastEnumeratedObject;

  -[PQLStatement unbindForDB:returnedRows:executionTime:preparationTime:](self->_stmt, "unbindForDB:returnedRows:executionTime:preparationTime:", self->_db, self->_rowNumber, self->_executionTime, self->_preparationTime);
  stmt = self->_stmt;
  self->_stmt = 0;

  db = self->_db;
  self->_db = 0;

  lastEnumeratedObject = self->_lastEnumeratedObject;
  self->_lastEnumeratedObject = 0;

}

- (PQLResultSet)initWithStatement:(id)a3 usingDatabase:(id)a4 preparationTime:(unint64_t)a5
{
  id v9;
  id v10;
  PQLResultSet *v11;
  PQLResultSet *v12;
  uint64_t v13;
  NSError *error;
  objc_super v16;

  v9 = a3;
  v10 = a4;
  v16.receiver = self;
  v16.super_class = (Class)PQLResultSet;
  v11 = -[PQLResultSet init](&v16, sel_init);
  v12 = v11;
  if (v11)
  {
    if (v9)
    {
      objc_storeStrong((id *)&v11->_stmt, a3);
      v12->_columns = sqlite3_column_count(v12->_stmt->_stmt);
    }
    else
    {
      objc_msgSend(v10, "lastError");
      v13 = objc_claimAutoreleasedReturnValue();
      error = v12->_error;
      v12->_error = (NSError *)v13;

    }
    objc_storeStrong((id *)&v12->_db, a4);
    v12->_inTransaction = sqlite3_get_autocommit((sqlite3 *)objc_msgSend(v10, "dbHandle")) == 0;
    v12->_executionTime = 0;
    v12->_preparationTime = a5;
  }

  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_db, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_defaultUnarchivingAllowedClasses, 0);
  objc_storeStrong(&self->_lastEnumeratedObject, 0);
  objc_storeStrong(&self->_objectsConstructor, 0);
  objc_storeStrong((id *)&self->_stmt, 0);
}

- (id)onlyObjectOfClass:(Class)a3 initializer:(SEL)a4
{
  PQLResultSet *v7;
  id *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v13;
  uint64_t v14;
  id (*v15)(uint64_t, void *, uint64_t);
  void *v16;
  id *v17;
  SEL v18;
  Class v19;
  id v20;

  if (-[PQLResultSet _next:](self, "_next:", 1))
  {
    v7 = self;
    v13 = MEMORY[0x1E0C809B0];
    v14 = 3221225472;
    v15 = __createObjectFromResultSetWithSel_block_invoke;
    v16 = &unk_1E97F3020;
    v18 = a4;
    v8 = v7;
    v17 = v8;
    v19 = a3;
    v20 = 0;
    __createObjectFromResultSetWithSel_block_invoke((uint64_t)&v13, v8, (uint64_t)&v20);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v20;
    v11 = v20;
    if (!v9)
      objc_storeStrong(v8 + 11, v10);

  }
  else
  {
    v9 = 0;
  }
  -[PQLResultSet close](self, "close", v13, v14);
  return v9;
}

- (unint64_t)columns
{
  return self->_columns;
}

- (id)objectOfClass:(Class)a3 atIndex:(int)a4
{
  uint64_t v4;
  char v7;
  PQLStatement *stmt;
  void *v9;
  sqlite3_value *v10;
  sqlite3_value *v11;

  v4 = *(_QWORD *)&a4;
  v7 = objc_opt_respondsToSelector();
  stmt = self->_stmt;
  if ((v7 & 1) != 0)
  {
    v9 = (void *)-[objc_class newFromSqliteStatement:atIndex:](a3, "newFromSqliteStatement:atIndex:", stmt->_stmt, v4);
  }
  else
  {
    v10 = sqlite3_column_value(stmt->_stmt, v4);
    v11 = sqlite3_value_dup(v10);
    v9 = (void *)-[objc_class newFromSqliteValue:](a3, "newFromSqliteValue:", v11);
    sqlite3_value_free(v11);
  }
  return v9;
}

- (id)dateAtIndex:(int)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0C99D68], "newFromSqliteStatement:atIndex:", self->_stmt->_stmt, *(_QWORD *)&a3);
}

- (id)stringAtIndex:(int)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "newFromSqliteStatement:atIndex:", self->_stmt->_stmt, *(_QWORD *)&a3);
}

- (id)dataAtIndex:(int)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0C99D50], "newFromSqliteStatement:atIndex:", self->_stmt->_stmt, *(_QWORD *)&a3);
}

- (NSError)error
{
  return self->_error;
}

- (int)intAtIndex:(int)a3
{
  return sqlite3_column_int(self->_stmt->_stmt, a3);
}

- (unint64_t)unsignedLongLongAtIndex:(int)a3
{
  return sqlite3_column_int64(self->_stmt->_stmt, a3);
}

- (id)nextObject
{
  id objectsConstructor;
  PQLResultSet *v4;
  void (**v5)(id, PQLResultSet *, id *);
  void *v6;
  id v7;
  id v8;
  PQLResultSet *v10;
  id v11;
  id v12;
  int8x16_t v13;
  id v14[4];
  PQLResultSet *v15;
  int8x16_t v16;
  id v17;

  if (!-[PQLResultSet _next:](self, "_next:", 0))
    return 0;
  objectsConstructor = self->_objectsConstructor;
  if (objectsConstructor)
  {
    v4 = self;
    v5 = (void (**)(id, PQLResultSet *, id *))objectsConstructor;
    v14[0] = 0;
    v5[2](v5, v4, v14);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v14[0];
    v8 = v14[0];
    if (!v6)
      objc_storeStrong((id *)&v4->_error, v7);

  }
  else
  {
    v13 = *(int8x16_t *)&self->_objectsClass;
    v10 = self;
    v14[0] = (id)MEMORY[0x1E0C809B0];
    v14[1] = (id)3221225472;
    v14[2] = __createObjectFromResultSetWithSel_block_invoke;
    v14[3] = &unk_1E97F3020;
    v4 = v10;
    v15 = v4;
    v16 = vextq_s8(v13, v13, 8uLL);
    v17 = 0;
    __createObjectFromResultSetWithSel_block_invoke((uint64_t)v14, v4, (uint64_t)&v17);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v17;
    v12 = v17;
    if (!v6)
      objc_storeStrong((id *)&v4->_error, v11);

  }
  return v6;
}

- (id)enumerateObjects:(id)a3
{
  id v4;
  void *v5;
  id objectsConstructor;

  v4 = a3;
  if (self->_objectsClass || self->_objectsConstructor)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("-%s was called twice"), sel_getName(sel_enumerateObjectsOfClass_));
  v5 = (void *)MEMORY[0x1D825FCAC](v4);
  objectsConstructor = self->_objectsConstructor;
  self->_objectsConstructor = v5;

  return self;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  id lastEnumeratedObject;
  void *v9;
  void *v10;
  id v11;
  id v12;

  lastEnumeratedObject = self->_lastEnumeratedObject;
  self->_lastEnumeratedObject = 0;

  if (!a3->var0)
    a3->var2 = (unint64_t *)&countByEnumeratingWithState_objects_count__const_mu;
  a3->var1 = a4;
  v9 = (void *)MEMORY[0x1D825FB2C]();
  -[PQLResultSet nextObject](self, "nextObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = self->_lastEnumeratedObject;
  self->_lastEnumeratedObject = v10;

  objc_autoreleasePoolPop(v9);
  v12 = self->_lastEnumeratedObject;
  if (v12)
  {
    *a4 = v12;
    ++a3->var0;
    return 1;
  }
  else
  {
    -[PQLResultSet close](self, "close");
    return 0;
  }
}

- (sqlite3_stmt)stmt
{
  PQLStatement *stmt;

  stmt = self->_stmt;
  if (stmt)
    return stmt->_stmt;
  else
    return 0;
}

- (id)onlyObjectOfClass:(Class)a3
{
  PQLResultSet *v5;
  id *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v11;
  uint64_t v12;
  id (*v13)(uint64_t, void *, uint64_t);
  void *v14;
  id *v15;
  uint64_t v16;
  Class v17;
  id v18;

  if (-[PQLResultSet _next:](self, "_next:", 1))
  {
    v5 = self;
    v11 = MEMORY[0x1E0C809B0];
    v12 = 3221225472;
    v13 = __createObjectFromResultSetWithSel_block_invoke;
    v14 = &unk_1E97F3020;
    v16 = 0;
    v6 = v5;
    v15 = v6;
    v17 = a3;
    v18 = 0;
    __createObjectFromResultSetWithSel_block_invoke((uint64_t)&v11, v6, (uint64_t)&v18);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v18;
    v9 = v18;
    if (!v7)
      objc_storeStrong(v6 + 11, v8);

  }
  else
  {
    v7 = 0;
  }
  -[PQLResultSet close](self, "close", v11, v12);
  return v7;
}

- (id)onlyObject:(id)a3
{
  void (**v4)(id, PQLResultSet *, id *);
  PQLResultSet *v5;
  void *v6;
  id v7;
  id v8;
  id v10;

  v4 = (void (**)(id, PQLResultSet *, id *))a3;
  if (-[PQLResultSet _next:](self, "_next:", 1))
  {
    v5 = self;
    v10 = 0;
    v4[2](v4, v5, &v10);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v10;
    v8 = v10;
    if (!v6)
      objc_storeStrong((id *)&v5->_error, v7);

  }
  else
  {
    v6 = 0;
  }
  -[PQLResultSet close](self, "close");

  return v6;
}

- (id)objectOfClass:(Class)a3
{
  PQLResultSet *v4;
  id *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v10[4];
  id *v11;
  uint64_t v12;
  Class v13;
  id v14;

  v4 = self;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __createObjectFromResultSetWithSel_block_invoke;
  v10[3] = &unk_1E97F3020;
  v12 = 0;
  v5 = v4;
  v11 = v5;
  v13 = a3;
  v14 = 0;
  __createObjectFromResultSetWithSel_block_invoke((uint64_t)v10, v5, (uint64_t)&v14);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v14;
  v8 = v14;
  if (!v6)
    objc_storeStrong(v5 + 11, v7);

  return v6;
}

- (id)objectOfClass:(Class)a3 initializer:(SEL)a4
{
  PQLResultSet *v6;
  id *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v12[4];
  id *v13;
  SEL v14;
  Class v15;
  id v16;

  v6 = self;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __createObjectFromResultSetWithSel_block_invoke;
  v12[3] = &unk_1E97F3020;
  v14 = a4;
  v7 = v6;
  v13 = v7;
  v15 = a3;
  v16 = 0;
  __createObjectFromResultSetWithSel_block_invoke((uint64_t)v12, v7, (uint64_t)&v16);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v16;
  v10 = v16;
  if (!v8)
    objc_storeStrong(v7 + 11, v9);

  return v8;
}

- (id)object:(id)a3
{
  PQLResultSet *v4;
  void *v5;
  id v6;
  id v7;
  id v9;

  v4 = self;
  v9 = 0;
  (*((void (**)(id, PQLResultSet *, id *))a3 + 2))(a3, v4, &v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v9;
  v7 = v9;
  if (!v5)
    objc_storeStrong((id *)&v4->_error, v6);

  return v5;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  const char *v5;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  if (self->_db)
    v5 = "no";
  else
    v5 = "yes";
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p {stmt: %@; row: %ld; closed:%s}>"),
               v4,
               self,
               self->_stmt,
               self->_rowNumber,
               v5);
}

- (id)columnNameAtIndex:(int)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", sqlite3_column_name(self->_stmt->_stmt, a3));
}

- (char)charAtIndex:(int)a3
{
  return sqlite3_column_int(self->_stmt->_stmt, a3);
}

- (unsigned)unsignedCharAtIndex:(int)a3
{
  return sqlite3_column_int(self->_stmt->_stmt, a3);
}

- (signed)shortAtIndex:(int)a3
{
  return sqlite3_column_int(self->_stmt->_stmt, a3);
}

- (unsigned)unsignedShortAtIndex:(int)a3
{
  return sqlite3_column_int(self->_stmt->_stmt, a3);
}

- (unint64_t)unsignedIntegerAtIndex:(int)a3
{
  return sqlite3_column_int64(self->_stmt->_stmt, a3);
}

- (float)floatAtIndex:(int)a3
{
  return sqlite3_column_double(self->_stmt->_stmt, a3);
}

- (double)doubleAtIndex:(int)a3
{
  return sqlite3_column_double(self->_stmt->_stmt, a3);
}

- (const)UTF8StringAtIndex:(int)a3
{
  return (const char *)sqlite3_column_text(self->_stmt->_stmt, a3);
}

- (id)numberAtIndex:(int)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "newFromSqliteStatement:atIndex:", self->_stmt->_stmt, *(_QWORD *)&a3);
}

- (id)dataAtIndex:(int)a3 noCopy:(BOOL)a4
{
  void *v6;
  const void *v7;

  if (a4)
  {
    if (-[PQLResultSet isNullAtIndex:](self, "isNullAtIndex:", *(_QWORD *)&a3))
    {
      v6 = 0;
    }
    else
    {
      v7 = sqlite3_column_blob(self->_stmt->_stmt, a3);
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", v7, sqlite3_column_bytes(self->_stmt->_stmt, a3), 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    -[PQLResultSet dataAtIndex:](self, "dataAtIndex:", *(_QWORD *)&a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

- (id)uuidAtIndex:(int)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3A28], "newFromSqliteStatement:atIndex:", self->_stmt->_stmt, *(_QWORD *)&a3);
}

- (id)plistAtIndex:(int)a3
{
  uint64_t v3;
  int v5;
  id v6;
  const void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = *(_QWORD *)&a3;
  v5 = sqlite3_column_type(self->_stmt->_stmt, a3);
  if ((v5 - 1) < 2)
  {
    v10 = (void *)MEMORY[0x1E0CB37E8];
LABEL_7:
    v9 = (void *)objc_msgSend(v10, "newFromSqliteStatement:atIndex:", self->_stmt->_stmt, v3);
    return v9;
  }
  if (v5 == 3)
  {
    v10 = (void *)MEMORY[0x1E0CB3940];
    goto LABEL_7;
  }
  if (v5 == 4)
  {
    v6 = objc_alloc(MEMORY[0x1E0C99D50]);
    v7 = sqlite3_column_blob(self->_stmt->_stmt, v3);
    v8 = (void *)objc_msgSend(v6, "initWithBytesNoCopy:length:freeWhenDone:", v7, sqlite3_column_bytes(self->_stmt->_stmt, v3), 0);
    objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v8, 0, 0, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (NSSet)defaultUnarchivingAllowedClasses
{
  NSSet *defaultUnarchivingAllowedClasses;

  defaultUnarchivingAllowedClasses = self->_defaultUnarchivingAllowedClasses;
  if (!defaultUnarchivingAllowedClasses)
  {
    if (_defaultAllowedClasses_once != -1)
      dispatch_once(&_defaultAllowedClasses_once, &__block_literal_global_0);
    defaultUnarchivingAllowedClasses = (NSSet *)_defaultAllowedClasses_allowedClasses;
  }
  return defaultUnarchivingAllowedClasses;
}

- (id)unarchivedObjectOfClass:(Class)a3 atIndex:(int)a4
{
  uint64_t v4;
  int v7;
  id v8;
  const void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = *(_QWORD *)&a4;
  v7 = sqlite3_column_type(self->_stmt->_stmt, a4);
  if ((v7 - 1) < 2)
  {
    v13 = (void *)MEMORY[0x1E0CB37E8];
LABEL_7:
    v12 = (void *)objc_msgSend(v13, "newFromSqliteStatement:atIndex:", self->_stmt->_stmt, v4);
    return v12;
  }
  if (v7 == 3)
  {
    v13 = (void *)MEMORY[0x1E0CB3940];
    goto LABEL_7;
  }
  if (v7 == 4)
  {
    v8 = objc_alloc(MEMORY[0x1E0C99D50]);
    v9 = sqlite3_column_blob(self->_stmt->_stmt, v4);
    v10 = (void *)objc_msgSend(v8, "initWithBytesNoCopy:length:freeWhenDone:", v9, sqlite3_column_bytes(self->_stmt->_stmt, v4), 0);
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "initForReadingFromData:error:", v10, 0);
    objc_msgSend(v11, "decodeObjectOfClass:forKey:", a3, *MEMORY[0x1E0CB2CD0]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = 0;
  }
  return v12;
}

- (id)unarchivedObjectOfClasses:(id)a3 atIndex:(int)a4
{
  uint64_t v4;
  id v6;
  int v7;
  id v8;
  const void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  v7 = sqlite3_column_type(self->_stmt->_stmt, v4);
  if ((v7 - 1) < 2)
  {
    v13 = (void *)MEMORY[0x1E0CB37E8];
LABEL_7:
    v12 = (void *)objc_msgSend(v13, "newFromSqliteStatement:atIndex:", self->_stmt->_stmt, v4);
    goto LABEL_9;
  }
  if (v7 == 3)
  {
    v13 = (void *)MEMORY[0x1E0CB3940];
    goto LABEL_7;
  }
  if (v7 == 4)
  {
    v8 = objc_alloc(MEMORY[0x1E0C99D50]);
    v9 = sqlite3_column_blob(self->_stmt->_stmt, v4);
    v10 = (void *)objc_msgSend(v8, "initWithBytesNoCopy:length:freeWhenDone:", v9, sqlite3_column_bytes(self->_stmt->_stmt, v4), 0);
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "initForReadingFromData:error:", v10, 0);
    objc_msgSend(v11, "decodeObjectOfClasses:forKey:", v6, *MEMORY[0x1E0CB2CD0]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = 0;
  }
LABEL_9:

  return v12;
}

- (id)objectAtIndex:(int)a3
{
  uint64_t v3;
  int v5;
  id v6;
  const void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = *(_QWORD *)&a3;
  v5 = sqlite3_column_type(self->_stmt->_stmt, a3);
  if ((v5 - 1) < 2)
  {
    v12 = (void *)MEMORY[0x1E0CB37E8];
LABEL_7:
    v11 = (void *)objc_msgSend(v12, "newFromSqliteStatement:atIndex:", self->_stmt->_stmt, v3);
    return v11;
  }
  if (v5 == 3)
  {
    v12 = (void *)MEMORY[0x1E0CB3940];
    goto LABEL_7;
  }
  if (v5 == 4)
  {
    v6 = objc_alloc(MEMORY[0x1E0C99D50]);
    v7 = sqlite3_column_blob(self->_stmt->_stmt, v3);
    v8 = (void *)objc_msgSend(v6, "initWithBytesNoCopy:length:freeWhenDone:", v7, sqlite3_column_bytes(self->_stmt->_stmt, v3), 0);
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "initForReadingFromData:error:", v8, 0);
    -[PQLResultSet defaultUnarchivingAllowedClasses](self, "defaultUnarchivingAllowedClasses");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "decodeObjectOfClasses:forKey:", v10, *MEMORY[0x1E0CB2CD0]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }
  return v11;
}

- (id)enumerateObjectsOfClass:(Class)a3 initializer:(SEL)a4
{
  void *v9;

  if (self->_objectsClass || self->_objectsConstructor)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("-%s was called twice"), sel_getName(sel_enumerateObjectsOfClass_));
  if ((-[objc_class instancesRespondToSelector:](a3, "instancesRespondToSelector:", a4) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PQLResultSet.m"), 448, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[aClass instancesRespondToSelector:initializer]"));

  }
  self->_objectsClass = a3;
  self->_objectsClassInitializer = a4;
  return self;
}

- (id)enumerateObjectsOfClass:(Class)a3
{
  void *v6;

  if (self->_objectsClass || self->_objectsConstructor)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("-%s was called twice"), sel_getName(sel_enumerateObjectsOfClass_));
  if (-[objc_class conformsToProtocol:](a3, "conformsToProtocol:", &unk_1EFEAACC8))
  {
    self->_hasValuable = 1;
  }
  else if ((-[objc_class conformsToProtocol:](a3, "conformsToProtocol:", &unk_1EFEAA5B0) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PQLResultSet.m"), 462, CFSTR("%@ conforms neither to PQLValuable or PQLResultSetInitializer"), a3);

  }
  self->_objectsClass = a3;
  return self;
}

- (void)setDefaultUnarchivingAllowedClasses:(id)a3
{
  objc_storeStrong((id *)&self->_defaultUnarchivingAllowedClasses, a3);
}

- (unint64_t)rowNumber
{
  return self->_rowNumber;
}

- (PQLConnection)db
{
  return self->_db;
}

@end
