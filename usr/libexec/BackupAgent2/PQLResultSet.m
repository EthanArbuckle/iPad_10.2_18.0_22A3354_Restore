@implementation PQLResultSet

- (BOOL)checkSuccessWithError:(id *)a3
{
  void *v5;
  void *v6;
  id v7;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PQLResultSet error](self, "error"));
  if (v5)
  {
    if (sub_100081D30())
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[PQLResultSet _expandedSQL](self, "_expandedSQL"));
      v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "_errorWithSQL:", v6));

      if (!a3)
        goto LABEL_8;
      goto LABEL_7;
    }
    v7 = v5;
    if (a3)
    {
LABEL_7:
      v7 = objc_retainAutorelease(v7);
      *a3 = v7;
    }
  }
  else
  {
    v7 = 0;
  }
LABEL_8:

  return v5 == 0;
}

- (BOOL)enumerateWithError:(id *)a3 block:(id)a4
{
  uint64_t (**v6)(id, PQLResultSet *, id *);
  void *v7;
  void *v8;
  char v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  BOOL v14;
  id v16;

  v6 = (uint64_t (**)(id, PQLResultSet *, id *))a4;
  v7 = 0;
  while (-[PQLResultSet next](self, "next"))
  {
    v8 = objc_autoreleasePoolPush();
    v16 = v7;
    v9 = v6[2](v6, self, &v16);
    v10 = v16;

    objc_autoreleasePoolPop(v8);
    v7 = v10;
    if ((v9 & 1) == 0)
    {
      -[PQLResultSet close](self, "close");
      if (v10)
        goto LABEL_8;
      goto LABEL_7;
    }
  }
  v10 = v7;
  if (v7)
    goto LABEL_8;
LABEL_7:
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[PQLResultSet error](self, "error"));
  v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "excludingNotFound"));

  if (!v10)
  {
    v13 = 0;
    v14 = 1;
    goto LABEL_12;
  }
LABEL_8:
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[PQLResultSet _expandedSQL](self, "_expandedSQL"));
  v13 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "_errorWithSQL:", v12));

  if (a3)
  {
    v13 = objc_retainAutorelease(v13);
    v14 = 0;
    *a3 = v13;
  }
  else
  {
    v14 = 0;
  }
LABEL_12:

  return v14;
}

- (id)_expandedSQL
{
  sqlite3_stmt *v2;
  char *v3;
  void *v4;

  v2 = (sqlite3_stmt *)-[PQLResultSet stmt](self, "stmt");
  if (v2)
  {
    v3 = sqlite3_expanded_sql(v2);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v3));
    free(v3);
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

@end
