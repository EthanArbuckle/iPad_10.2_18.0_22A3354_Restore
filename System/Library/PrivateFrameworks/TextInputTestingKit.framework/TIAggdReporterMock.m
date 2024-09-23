@implementation TIAggdReporterMock

- (TIAggdReporterMock)init
{
  TIAggdReporterMock *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *scalars;
  NSMutableDictionary *v5;
  NSMutableDictionary *distributions;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TIAggdReporterMock;
  v2 = -[TIAggdReporterMock init](&v8, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    scalars = v2->_scalars;
    v2->_scalars = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    distributions = v2->_distributions;
    v2->_distributions = v5;

  }
  return v2;
}

- (void)clear
{
  void *v2;
  void *v3;
  TIAggdReporterMock *obj;

  obj = self;
  objc_sync_enter(obj);
  -[TIAggdReporterMock scalars](obj, "scalars");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAllObjects");

  -[TIAggdReporterMock distributions](obj, "distributions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllObjects");

  objc_sync_exit(obj);
}

- (id)toDictionary
{
  TIAggdReporterMock *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];
  _QWORD v8[3];

  v8[2] = *MEMORY[0x24BDAC8D0];
  v2 = self;
  objc_sync_enter(v2);
  v7[0] = CFSTR("scalars");
  -[TIAggdReporterMock scalars](v2, "scalars");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = CFSTR("distributions");
  v8[0] = v3;
  -[TIAggdReporterMock distributions](v2, "distributions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v2);
  return v5;
}

- (id)toJsonString
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v7;

  v2 = (void *)MEMORY[0x24BDD1608];
  -[TIAggdReporterMock toDictionary](self, "toDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0;
  objc_msgSend(v2, "dataWithJSONObject:options:error:", v3, 1, &v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v4, 4);
  return v5;
}

- (int)commit
{
  return 0;
}

- (int64_t)getScalar:(id)a3
{
  id v4;
  TIAggdReporterMock *v5;
  int64_t v6;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v6 = -[TIAggdReporterMock _getScalar:](v5, "_getScalar:", v4);
  objc_sync_exit(v5);

  return v6;
}

- (int64_t)_getScalar:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int64_t v9;

  v4 = a3;
  if (v4
    && (-[TIAggdReporterMock scalars](self, "scalars"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v5, "objectForKeyedSubscript:", v4),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v6,
        v5,
        v6))
  {
    -[TIAggdReporterMock scalars](self, "scalars");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "longLongValue");

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)setScalar:(id)a3 withValue:(int64_t)a4
{
  TIAggdReporterMock *v6;
  id v7;

  v7 = a3;
  v6 = self;
  objc_sync_enter(v6);
  -[TIAggdReporterMock _setScalar:withValue:](v6, "_setScalar:withValue:", v7, a4);
  objc_sync_exit(v6);

}

- (void)_setScalar:(id)a3 withValue:(int64_t)a4
{
  id v6;
  void *v7;
  id v8;

  if (a3)
  {
    v6 = a3;
    -[TIAggdReporterMock scalars](self, "scalars");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKey:", v7, v6);

  }
}

- (void)clearScalarKey:(id)a3
{
  id v4;
  TIAggdReporterMock *v5;
  void *v6;
  id v7;

  v4 = a3;
  if (v4)
  {
    v7 = v4;
    v5 = self;
    objc_sync_enter(v5);
    -[TIAggdReporterMock scalars](v5, "scalars");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObjectForKey:", v7);

    objc_sync_exit(v5);
    v4 = v7;
  }

}

- (void)setValue:(int64_t)a3 forScalarKey:(id)a4
{
  TIAggdReporterMock *v6;
  id v7;

  v7 = a4;
  v6 = self;
  objc_sync_enter(v6);
  -[TIAggdReporterMock _setScalar:withValue:](v6, "_setScalar:withValue:", v7, a3);
  objc_sync_exit(v6);

}

- (void)addValue:(int64_t)a3 forKey:(id)a4
{
  TIAggdReporterMock *v6;
  id v7;

  v7 = a4;
  v6 = self;
  objc_sync_enter(v6);
  -[TIAggdReporterMock _setScalar:withValue:](v6, "_setScalar:withValue:", v7, -[TIAggdReporterMock getScalar:](v6, "getScalar:", v7) + a3);
  objc_sync_exit(v6);

}

- (void)subtractValue:(int64_t)a3 forKey:(id)a4
{
  TIAggdReporterMock *v6;
  id v7;

  v7 = a4;
  v6 = self;
  objc_sync_enter(v6);
  -[TIAggdReporterMock _setScalar:withValue:](v6, "_setScalar:withValue:", v7, -[TIAggdReporterMock getScalar:](v6, "getScalar:", v7) - a3);
  objc_sync_exit(v6);

}

- (void)incrementKey:(id)a3
{
  TIAggdReporterMock *v4;
  id v5;

  v5 = a3;
  v4 = self;
  objc_sync_enter(v4);
  -[TIAggdReporterMock _setScalar:withValue:](v4, "_setScalar:withValue:", v5, -[TIAggdReporterMock getScalar:](v4, "getScalar:", v5) + 1);
  objc_sync_exit(v4);

}

- (void)decrementKey:(id)a3
{
  TIAggdReporterMock *v4;
  id v5;

  v5 = a3;
  v4 = self;
  objc_sync_enter(v4);
  -[TIAggdReporterMock _setScalar:withValue:](v4, "_setScalar:withValue:", v5, -[TIAggdReporterMock getScalar:](v4, "getScalar:", v5) - 1);
  objc_sync_exit(v4);

}

- (void)clearDistributionKey:(id)a3
{
  id v4;
  TIAggdReporterMock *v5;
  void *v6;
  id v7;

  v4 = a3;
  if (v4)
  {
    v7 = v4;
    v5 = self;
    objc_sync_enter(v5);
    -[TIAggdReporterMock distributions](v5, "distributions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObjectForKey:", v7);

    objc_sync_exit(v5);
    v4 = v7;
  }

}

- (void)setValue:(double)a3 forDistributionKey:(id)a4
{
  id v6;
  TIAggdReporterMock *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  if (v6)
  {
    v7 = self;
    objc_sync_enter(v7);
    -[TIAggdReporterMock distributions](v7, "distributions");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)MEMORY[0x24BDBCEB8];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v10;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "arrayWithArray:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKey:", v12, v6);

    objc_sync_exit(v7);
  }

}

- (void)pushValue:(double)a3 forKey:(id)a4
{
  TIAggdReporterMock *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a4;
  if (v11)
  {
    v6 = self;
    objc_sync_enter(v6);
    -[TIAggdReporterMock distributions](v6, "distributions");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v11);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithArray:", MEMORY[0x24BDBD1A8]);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[TIAggdReporterMock distributions](v6, "distributions");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKey:", v8, v11);

    }
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v10);

    objc_sync_exit(v6);
  }

}

- (id)getDistributionObject:(id)a3
{
  id v4;
  TIAggdReporterMock *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  -[TIAggdReporterMock distributions](v5, "distributions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v5);
  return v7;
}

- (NSMutableDictionary)scalars
{
  return self->_scalars;
}

- (NSMutableDictionary)distributions
{
  return self->_distributions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_distributions, 0);
  objc_storeStrong((id *)&self->_scalars, 0);
}

@end
