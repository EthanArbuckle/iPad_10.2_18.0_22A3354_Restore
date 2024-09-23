@implementation WRTimestampAndThread

- (id)initWithPID:(void *)a3 threadID:(void *)a4 machContTimeNs:(void *)a5 date:
{
  id v10;
  id *v11;
  objc_super v13;

  v10 = a5;
  if (a1)
  {
    v13.receiver = a1;
    v13.super_class = (Class)WRTimestampAndThread;
    v11 = (id *)objc_msgSendSuper2(&v13, sel_init);
    a1 = v11;
    if (v11)
    {
      *((_DWORD *)v11 + 2) = a2;
      v11[4] = a3;
      v11[2] = a4;
      objc_storeStrong(v11 + 3, a5);
    }
  }

  return a1;
}

- (id)encodedDict
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  if (a1)
  {
    objc_msgSend(a1, "date");
    v2 = (void *)objc_claimAutoreleasedReturnValue();

    v3 = objc_alloc(MEMORY[0x24BDBCE70]);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(a1, "pid"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", objc_msgSend(a1, "threadID"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", objc_msgSend(a1, "machContTimeNs"));
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    if (v2)
    {
      v8 = (void *)MEMORY[0x24BDD16E0];
      objc_msgSend(a1, "date");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "timeIntervalSinceReferenceDate");
      objc_msgSend(v8, "numberWithDouble:");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)objc_msgSend(v3, "initWithObjectsAndKeys:", v4, CFSTR("tat_pid"), v5, CFSTR("tat_threadId"), v7, CFSTR("tat_machContTimeNs"), v10, CFSTR("tat_date"), 0);

    }
    else
    {
      v11 = (void *)objc_msgSend(v3, "initWithObjectsAndKeys:", v4, CFSTR("tat_pid"), v5, CFSTR("tat_threadId"), v6, CFSTR("tat_machContTimeNs"), 0);
    }

  }
  else
  {
    v11 = 0;
  }
  return v11;
}

- (id)initWithEncodedDict:(uint64_t *)a3 error:
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  id v25;
  id *v26;
  uint64_t v28;
  uint64_t v29;

  v5 = a2;
  v6 = v5;
  if (!a1)
  {
    v26 = 0;
    goto LABEL_21;
  }
  v29 = 0;
  if (a3)
    *a3 = 0;
  else
    a3 = &v29;
  DictGetNumber(v5, CFSTR("tat_pid"), a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
    v9 = objc_msgSend(v7, "intValue");
  else
    v9 = -1;
  DictGetNumber(v6, CFSTR("tat_threadId"), a3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v16)
  {
    if (*a3)
    {
      WRMakeError(7, CFSTR("WRTimestampAndThread: No threadID in dict"), v10, v11, v12, v13, v14, v15, v28);
      v26 = 0;
      *a3 = (uint64_t)(id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v26 = 0;
    }
    goto LABEL_20;
  }
  DictGetNumber(v6, CFSTR("tat_machContTimeNs"), a3);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v23)
  {
    if (*a3)
    {
      WRMakeError(7, CFSTR("WRTimestampAndThread: No machContTimeNs in dict"), v17, v18, v19, v20, v21, v22, v28);
      v26 = 0;
      *a3 = (uint64_t)(id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v26 = 0;
    }
    goto LABEL_19;
  }
  DictGetNumber(v6, CFSTR("tat_date"), a3);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (v24)
  {
    v25 = objc_alloc(MEMORY[0x24BDBCE60]);
    objc_msgSend(v24, "doubleValue");
    v26 = (id *)objc_msgSend(v25, "initWithTimeIntervalSinceReferenceDate:");
  }
  else
  {
    v26 = 0;
    if (*a3)
      goto LABEL_18;
  }
  a1 = -[WRTimestampAndThread initWithPID:threadID:machContTimeNs:date:](a1, v9, (void *)objc_msgSend(v16, "unsignedLongLongValue"), (void *)objc_msgSend(v23, "unsignedLongLongValue"), v26);

  v26 = a1;
LABEL_18:

LABEL_19:
LABEL_20:

LABEL_21:
  return v26;
}

- (void)insertIntoSortedArray:(uint64_t)a1
{
  id v3;

  if (a1)
  {
    v3 = a2;
    objc_msgSend(v3, "insertObject:atIndex:", a1, objc_msgSend(v3, "indexOfObject:inSortedRange:options:usingComparator:", a1, 0, objc_msgSend(v3, "count"), 1024, &__block_literal_global));

  }
}

uint64_t __46__WRTimestampAndThread_insertIntoSortedArray___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;

  v4 = a2;
  v5 = a3;
  v6 = objc_msgSend(v4, "machContTimeNs");
  if (v6 <= objc_msgSend(v5, "machContTimeNs"))
  {
    v8 = objc_msgSend(v4, "machContTimeNs");
    if (v8 >= objc_msgSend(v5, "machContTimeNs"))
      v7 = 0;
    else
      v7 = -1;
  }
  else
  {
    v7 = 1;
  }

  return v7;
}

- (unint64_t)machContTimeNs
{
  return self->_machContTimeNs;
}

- (NSDate)date
{
  return (NSDate *)objc_getProperty(self, a2, 24, 1);
}

- (int)pid
{
  return self->_pid;
}

- (unint64_t)threadID
{
  return self->_threadID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);
}

@end
