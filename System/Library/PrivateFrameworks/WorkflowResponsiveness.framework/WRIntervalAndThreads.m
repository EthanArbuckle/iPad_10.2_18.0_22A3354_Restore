@implementation WRIntervalAndThreads

- (id)initWithStart:(void *)a3 end:
{
  id v6;
  id v7;
  id *v8;
  objc_super v10;

  v6 = a2;
  v7 = a3;
  if (a1)
  {
    v10.receiver = a1;
    v10.super_class = (Class)WRIntervalAndThreads;
    v8 = (id *)objc_msgSendSuper2(&v10, sel_init);
    a1 = v8;
    if (v8)
    {
      objc_storeStrong(v8 + 1, a2);
      objc_storeStrong(a1 + 2, a3);
    }
  }

  return a1;
}

- (id)encodedDict
{
  id v1;
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v1 = a1;
  if (a1)
  {
    v2 = objc_alloc(MEMORY[0x24BDBCE70]);
    objc_msgSend(v1, "start");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[WRTimestampAndThread encodedDict](v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "end");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[WRTimestampAndThread encodedDict](v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v1 = (id)objc_msgSend(v2, "initWithObjectsAndKeys:", v4, CFSTR("iat_start"), v6, CFSTR("iat_end"), 0);

  }
  return v1;
}

- (id)initWithEncodedDict:(uint64_t *)a3 error:
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id *v21;
  id *v22;
  id *v23;
  uint64_t v25;
  uint64_t v26;

  v5 = a2;
  v6 = v5;
  if (a1)
  {
    v26 = 0;
    if (a3)
      *a3 = 0;
    else
      a3 = &v26;
    DictGetDict(v5, CFSTR("iat_start"), a3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      DictGetDict(v6, CFSTR("iat_end"), a3);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (v20)
      {
        v21 = -[WRTimestampAndThread initWithEncodedDict:error:]((id *)[WRTimestampAndThread alloc], v13, a3);
        if (v21)
        {
          v22 = -[WRTimestampAndThread initWithEncodedDict:error:]((id *)[WRTimestampAndThread alloc], v20, a3);
          if (v22)
          {
            a1 = -[WRIntervalAndThreads initWithStart:end:](a1, v21, v22);
            v23 = a1;
          }
          else
          {
            v23 = 0;
          }

        }
        else
        {
          v23 = 0;
        }

      }
      else if (*a3)
      {
        WRMakeError(7, CFSTR("WRIntervalAndThreads: No end in dict"), v14, v15, v16, v17, v18, v19, v25);
        v23 = 0;
        *a3 = (uint64_t)(id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v23 = 0;
      }

    }
    else if (*a3)
    {
      WRMakeError(7, CFSTR("WRIntervalAndThreads: No start in dict"), v7, v8, v9, v10, v11, v12, v25);
      v23 = 0;
      *a3 = (uint64_t)(id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v23 = 0;
    }

  }
  else
  {
    v23 = 0;
  }

  return v23;
}

- (void)insertIntoSortedArray:(uint64_t)a1
{
  id v3;

  if (a1)
  {
    v3 = a2;
    objc_msgSend(v3, "insertObject:atIndex:", a1, objc_msgSend(v3, "indexOfObject:inSortedRange:options:usingComparator:", a1, 0, objc_msgSend(v3, "count"), 1024, &__block_literal_global_56));

  }
}

uint64_t __46__WRIntervalAndThreads_insertIntoSortedArray___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  unint64_t v7;
  void *v8;
  unint64_t v9;
  uint64_t v10;
  void *v11;
  unint64_t v12;
  void *v13;
  unint64_t v14;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "start");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "machContTimeNs");
  objc_msgSend(v5, "start");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "machContTimeNs");

  if (v7 <= v9)
  {
    objc_msgSend(v4, "start");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "machContTimeNs");
    objc_msgSend(v5, "start");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "machContTimeNs");

    if (v12 >= v14)
      v10 = 0;
    else
      v10 = -1;
  }
  else
  {
    v10 = 1;
  }

  return v10;
}

- (WRTimestampAndThread)start
{
  return (WRTimestampAndThread *)objc_getProperty(self, a2, 8, 1);
}

- (WRTimestampAndThread)end
{
  return (WRTimestampAndThread *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_end, 0);
  objc_storeStrong((id *)&self->_start, 0);
}

@end
