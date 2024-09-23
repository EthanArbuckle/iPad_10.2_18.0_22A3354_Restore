@implementation FedStatsCohortQueryURLBits

- (id)initQueryFieldWithKey:(id)a3
{
  id v5;
  FedStatsCohortQueryURLBits *v6;
  FedStatsCohortQueryURLBits *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FedStatsCohortQueryURLBits;
  v6 = -[FedStatsCohortQueryURLBits init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_cohortName, a3);

  return v7;
}

+ (id)cohortQueryFieldWithKey:(id)a3
{
  id v4;
  void *v5;

  if (a3)
  {
    v4 = a3;
    v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initQueryFieldWithKey:", v4);

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)cohortKeyForParameters:(id)a3 possibleError:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  __CFString *v15;

  v6 = a3;
  -[FedStatsCohortQueryURLBits cohortName](self, "cohortName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    if ((unint64_t)objc_msgSend(v8, "length") < 9)
    {
      v9 = v8;
    }
    else
    {
      objc_msgSend(v8, "substringToIndex:", 8);
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    if (a4)
    {
      v10 = (void *)MEMORY[0x24BDD17C8];
      -[FedStatsCohortQueryURLBits cohortName](self, "cohortName");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "stringWithFormat:", CFSTR("The data should have a String value for key \"%@\"), v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      +[FedStatsError errorWithCode:description:](FedStatsError, "errorWithCode:description:", 100, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = *a4;
      *a4 = v13;

    }
    v9 = CFSTR("<null>");
  }
  v15 = v9;

  return v15;
}

+ (id)cohortInstance
{
  return 0;
}

- (NSString)cohortName
{
  return self->_cohortName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cohortName, 0);
}

@end
