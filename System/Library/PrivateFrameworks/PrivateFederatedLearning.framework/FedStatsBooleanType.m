@implementation FedStatsBooleanType

- (FedStatsBooleanType)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FedStatsBooleanType;
  return -[FedStatsBooleanType init](&v3, sel_init);
}

+ (id)createFromDict:(id)a3 possibleError:(id *)a4
{
  return objc_alloc_init((Class)a1);
}

- (id)encodeToIndex:(id)a3 possibleError:(id *)a4
{
  id v5;
  void *v6;
  char v7;
  void *v8;

  v5 = a3;
  objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqual:", v6);

  if ((v7 & 1) != 0)
  {
    v8 = &unk_24D0E0BA0;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(v5, "BOOLValue"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else if (a4)
    {
      +[FedStatsError errorWithCode:description:](FedStatsError, "errorWithCode:description:", 401, CFSTR("The encoder can only work with a number type"));
      v8 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (id)decodeFromIndex:(id)a3 possibleError:(id *)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a3;
  v6 = v5;
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v5, "BOOLValue"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (a4)
  {
    +[FedStatsError errorWithCode:description:](FedStatsError, "errorWithCode:description:", 500, CFSTR("The encoder can only work with a number type"));
    v7 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)encodeToOneHotVector:(id)a3 possibleError:(id *)a4
{
  void *v4;
  void *v5;
  void *v6;
  __int16 v8;

  -[FedStatsBooleanType encodeToIndex:possibleError:](self, "encodeToIndex:possibleError:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v8 = 0;
    *((_BYTE *)&v8 + objc_msgSend(v4, "unsignedIntValue")) = 1;
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", &v8, 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)decodeFromOneHotVector:(id)a3 possibleError:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  __int16 v11;

  v6 = a3;
  v7 = v6;
  if (v6)
  {
    v11 = 0;
    objc_msgSend(v6, "getBytes:range:", &v11, 0, 2);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", HIBYTE(v11) == 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[FedStatsBooleanType decodeFromIndex:possibleError:](self, "decodeFromIndex:possibleError:", v8, a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else if (a4)
  {
    +[FedStatsError errorWithCode:description:](FedStatsError, "errorWithCode:description:", 500, CFSTR("The decoder can only work with a valid one-hot vector"));
    v9 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (int64_t)dataType
{
  return 0;
}

- (unint64_t)classCount
{
  return 2;
}

- (id)sampleForIndex:(unint64_t)a3
{
  return (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3 == 1);
}

@end
