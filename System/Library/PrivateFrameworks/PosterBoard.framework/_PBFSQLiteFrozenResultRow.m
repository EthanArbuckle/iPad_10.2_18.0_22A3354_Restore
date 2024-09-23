@implementation _PBFSQLiteFrozenResultRow

- (_QWORD)_initWithResultRow:(_QWORD *)a1
{
  id v3;
  void *v4;
  _QWORD *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v31;
  void *v32;
  void *v33;
  objc_super v34;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    if (!v3)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", sel__initWithResultRow_, a1, CFSTR("PBFSQLiteResultRow.m"), 192, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("resultRow"));

    }
    v34.receiver = a1;
    v34.super_class = (Class)PBFSQLiteResultRow;
    v5 = objc_msgSendSuper2(&v34, sel_init);
    a1 = v5;
    if (v5)
    {
      v5[1] = 0;
      v5[3] = objc_msgSend(v4, "count");
      v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", a1[3]);
      v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", a1[3]);
      v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", a1[3]);
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", a1[3]);
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", a1[3]);
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", a1[3]);
      if (a1[3])
      {
        v10 = 0;
        do
        {
          objc_msgSend(v4, "keyAtIndex:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "addObject:", v11);

          objc_msgSend(v4, "objectAtIndex:", v10);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "addObject:", v12);

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v4, "integerAtIndex:", v10));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v13);

          v14 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v4, "doubleAtIndex:", v10);
          objc_msgSend(v14, "numberWithDouble:");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v15);

          objc_msgSend(v4, "stringAtIndex:", v10);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObject:", v16);

          objc_msgSend(v4, "dataAtIndex:", v10);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "addObject:", v17);

          ++v10;
        }
        while (v10 < a1[3]);
      }
      v18 = objc_msgSend(v33, "copy");
      v19 = (void *)a1[4];
      a1[4] = v18;

      v20 = objc_msgSend(v32, "copy");
      v21 = (void *)a1[5];
      a1[5] = v20;

      v22 = objc_msgSend(v6, "copy");
      v23 = (void *)a1[6];
      a1[6] = v22;

      v24 = objc_msgSend(v7, "copy");
      v25 = (void *)a1[7];
      a1[7] = v24;

      v26 = objc_msgSend(v8, "copy");
      v27 = (void *)a1[8];
      a1[8] = v26;

      v28 = objc_msgSend(v9, "copy");
      v29 = (void *)a1[9];
      a1[9] = v28;

    }
  }

  return a1;
}

- (BOOL)isValid
{
  return 1;
}

- (unint64_t)count
{
  return self->_count;
}

- (id)keyAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_frozenColumnNames, "objectAtIndexedSubscript:", a3);
}

- (id)objectAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_frozenObjects, "objectAtIndexedSubscript:", a3);
}

- (int64_t)integerAtIndex:(unint64_t)a3
{
  void *v3;
  int64_t v4;

  -[NSArray objectAtIndexedSubscript:](self->_frozenIntegers, "objectAtIndexedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "longLongValue");

  return v4;
}

- (double)doubleAtIndex:(unint64_t)a3
{
  void *v3;
  double v4;
  double v5;

  -[NSArray objectAtIndexedSubscript:](self->_frozenDoubles, "objectAtIndexedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "doubleValue");
  v5 = v4;

  return v5;
}

- (id)stringAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_frozenStrings, "objectAtIndexedSubscript:", a3);
}

- (id)dataAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_frozenDatas, "objectAtIndexedSubscript:", a3);
}

- (uint64_t)_indexForKey:(uint64_t)result
{
  if (result)
    return objc_msgSend(*(id *)(result + 32), "indexOfObject:", a2);
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_frozenDatas, 0);
  objc_storeStrong((id *)&self->_frozenStrings, 0);
  objc_storeStrong((id *)&self->_frozenDoubles, 0);
  objc_storeStrong((id *)&self->_frozenIntegers, 0);
  objc_storeStrong((id *)&self->_frozenObjects, 0);
  objc_storeStrong((id *)&self->_frozenColumnNames, 0);
}

@end
