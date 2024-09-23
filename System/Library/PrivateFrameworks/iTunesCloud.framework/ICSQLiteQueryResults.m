@implementation ICSQLiteQueryResults

- (ICSQLiteQueryResults)initWithStatement:(id)a3
{
  id v5;
  ICSQLiteQueryResults *v6;
  ICSQLiteQueryResults *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICSQLiteQueryResults;
  v6 = -[ICSQLiteQueryResults init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_statement, a3);

  return v7;
}

- (void)enumerateRowsUsingBlock:(id)a3
{
  void (**v4)(id, ICSQLiteRow *, _QWORD, unsigned __int8 *);
  ICSQLiteRow *v5;
  sqlite3_stmt *v6;
  uint64_t v7;
  void *v8;
  unsigned int v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned __int8 v14;

  v4 = (void (**)(id, ICSQLiteRow *, _QWORD, unsigned __int8 *))a3;
  v5 = -[ICSQLiteRow initWithStatement:]([ICSQLiteRow alloc], "initWithStatement:", self->_statement);
  v6 = -[ICSQLiteStatement sqlite3_stmt](self->_statement, "sqlite3_stmt");
  v7 = 0;
  while (1)
  {
    v8 = (void *)MEMORY[0x1A1AFA708]();
    v14 = 0;
    v9 = sqlite3_step(v6);
    if (v9 <= 0x19)
    {
      switch(v9)
      {
        case 0u:
          goto LABEL_7;
        case 5u:
        case 6u:
          if (v7 > 9)
            goto LABEL_13;
          usleep(0xF4240u);
          ++v7;
          break;
        case 0xAu:
          objc_autoreleasePoolPop(v8);
          -[ICSQLiteStatement connection](self->_statement, "connection");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "resetAfterIOError");
          goto LABEL_17;
        case 0xBu:
          goto LABEL_15;
        default:
          goto LABEL_12;
      }
      goto LABEL_8;
    }
    if (v9 != 100)
      break;
LABEL_7:
    v4[2](v4, v5, 0, &v14);
LABEL_8:
    v10 = v14;
    objc_autoreleasePoolPop(v8);
    if (v10)
      goto LABEL_14;
  }
  if (v9 != 26)
  {
    if (v9 != 101)
    {
LABEL_12:
      -[ICSQLiteStatement connection](self->_statement, "connection");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "currentError");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      ((void (**)(id, ICSQLiteRow *, void *, unsigned __int8 *))v4)[2](v4, 0, v12, &v14);
    }
LABEL_13:
    objc_autoreleasePoolPop(v8);
LABEL_14:
    -[ICSQLiteStatement reset](self->_statement, "reset");
    goto LABEL_18;
  }
LABEL_15:
  objc_autoreleasePoolPop(v8);
  -[ICSQLiteStatement connection](self->_statement, "connection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "resetAfterCorruptionError");
LABEL_17:

LABEL_18:
}

- (int64_t)firstInt64Value
{
  int64_t v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __39__ICSQLiteQueryResults_firstInt64Value__block_invoke;
  v4[3] = &unk_1E438E020;
  v4[4] = &v5;
  -[ICSQLiteQueryResults enumerateRowsUsingBlock:](self, "enumerateRowsUsingBlock:", v4);
  v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (NSNumber)firstNumberValue
{
  id v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__25385;
  v9 = __Block_byref_object_dispose__25386;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __40__ICSQLiteQueryResults_firstNumberValue__block_invoke;
  v4[3] = &unk_1E438E020;
  v4[4] = &v5;
  -[ICSQLiteQueryResults enumerateRowsUsingBlock:](self, "enumerateRowsUsingBlock:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSNumber *)v2;
}

- (NSString)firstStringValue
{
  id v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__25385;
  v9 = __Block_byref_object_dispose__25386;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __40__ICSQLiteQueryResults_firstStringValue__block_invoke;
  v4[3] = &unk_1E438E020;
  v4[4] = &v5;
  -[ICSQLiteQueryResults enumerateRowsUsingBlock:](self, "enumerateRowsUsingBlock:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSString *)v2;
}

- (void)bindDouble:(double)a3 atPosition:(int)a4
{
  -[ICSQLiteStatement bindDouble:atPosition:](self->_statement, "bindDouble:atPosition:", *(_QWORD *)&a4, a3);
}

- (void)bindFloat:(float)a3 atPosition:(int)a4
{
  -[ICSQLiteStatement bindFloat:atPosition:](self->_statement, "bindFloat:atPosition:", *(_QWORD *)&a4);
}

- (void)bindInt:(int)a3 atPosition:(int)a4
{
  -[ICSQLiteStatement bindInt:atPosition:](self->_statement, "bindInt:atPosition:", *(_QWORD *)&a3, *(_QWORD *)&a4);
}

- (void)bindInt64:(int64_t)a3 atPosition:(int)a4
{
  -[ICSQLiteStatement bindInt64:atPosition:](self->_statement, "bindInt64:atPosition:", a3, *(_QWORD *)&a4);
}

- (void)bindNullAtPosition:(int)a3
{
  -[ICSQLiteStatement bindNullAtPosition:](self->_statement, "bindNullAtPosition:", *(_QWORD *)&a3);
}

- (void)bindNumber:(id)a3 atPosition:(int)a4
{
  -[ICSQLiteStatement bindNumber:atPosition:](self->_statement, "bindNumber:atPosition:", a3, *(_QWORD *)&a4);
}

- (void)bindData:(id)a3 atPosition:(int)a4
{
  -[ICSQLiteStatement bindData:atPosition:](self->_statement, "bindData:atPosition:", a3, *(_QWORD *)&a4);
}

- (void)bindDataCopy:(id)a3 atPosition:(int)a4
{
  -[ICSQLiteStatement bindDataCopy:atPosition:](self->_statement, "bindDataCopy:atPosition:", a3, *(_QWORD *)&a4);
}

- (void)bindString:(id)a3 atPosition:(int)a4
{
  -[ICSQLiteStatement bindString:atPosition:](self->_statement, "bindString:atPosition:", a3, *(_QWORD *)&a4);
}

- (void)bindStringCopy:(id)a3 atPosition:(int)a4
{
  -[ICSQLiteStatement bindStringCopy:atPosition:](self->_statement, "bindStringCopy:atPosition:", a3, *(_QWORD *)&a4);
}

- (int)clearBindings
{
  return -[ICSQLiteStatement clearBindings](self->_statement, "clearBindings");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statement, 0);
}

void __40__ICSQLiteQueryResults_firstStringValue__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;

  if (a2)
  {
    objc_msgSend(a2, "stringForColumnIndex:", 0);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

  }
  *a4 = 1;
}

void __40__ICSQLiteQueryResults_firstNumberValue__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;

  if (a2)
  {
    objc_msgSend(a2, "numberForColumnIndex:", 0);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

  }
  *a4 = 1;
}

uint64_t __39__ICSQLiteQueryResults_firstInt64Value__block_invoke(uint64_t result, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v5;

  if (a2)
  {
    v5 = result;
    result = objc_msgSend(a2, "int64ForColumnIndex:", 0);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v5 + 32) + 8) + 24) = result;
  }
  *a4 = 1;
  return result;
}

@end
