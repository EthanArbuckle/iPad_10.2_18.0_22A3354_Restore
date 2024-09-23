@implementation TIContinuousPath

- (TIContinuousPath)initWithTimeStamp:(double)a3
{
  TIContinuousPath *v3;
  NSMutableArray *v4;
  NSMutableArray *samples;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TIContinuousPath;
  v3 = -[TIContinuousPath init](&v7, sel_init, a3);
  if (v3)
  {
    v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    samples = v3->_samples;
    v3->_samples = v4;

  }
  return v3;
}

- (TIContinuousPath)init
{
  TIContinuousPath *v2;
  NSMutableArray *v3;
  NSMutableArray *samples;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TIContinuousPath;
  v2 = -[TIContinuousPath init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    samples = v2->_samples;
    v2->_samples = v3;

  }
  return v2;
}

- (TIContinuousPath)initWithJsonDictionary:(id)a3
{
  id v4;
  TIContinuousPath *v5;
  NSMutableArray *v6;
  NSMutableArray *samples;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  TIContinuousPathSample *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  objc_super v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)TIContinuousPath;
  v5 = -[TIContinuousPath init](&v19, sel_init);
  if (v5)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    samples = v5->_samples;
    v5->_samples = v6;

    objc_msgSend(v4, "objectForKey:", CFSTR("samples"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v16;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v16 != v11)
            objc_enumerationMutation(v8);
          v13 = -[TIContinuousPathSample initWithJsonDictionary:]([TIContinuousPathSample alloc], "initWithJsonDictionary:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v12));
          -[TIContinuousPath addSample:](v5, "addSample:", v13);

          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
      }
      while (v10);
    }

  }
  return v5;
}

- (double)timeStamp
{
  void *v2;
  double v3;
  double v4;

  -[NSMutableArray objectAtIndexedSubscript:](self->_samples, "objectAtIndexedSubscript:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "timeStamp");
  v4 = v3;

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_samples, CFSTR("samples"));
}

- (TIContinuousPath)initWithCoder:(id)a3
{
  id v4;
  TIContinuousPath *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSMutableArray *samples;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)TIContinuousPath;
  v5 = -[TIContinuousPath init](&v13, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x24BDBCF20];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("samples"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "copy");
    samples = v5->_samples;
    v5->_samples = (NSMutableArray *)v10;

  }
  return v5;
}

- (void)addSample:(id)a3
{
  -[NSMutableArray addObject:](self->_samples, "addObject:", a3);
}

- (id)toJsonDictionary
{
  void *v3;
  void *v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = self->_samples;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9), "toJsonDictionary", (_QWORD)v12);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("samples"));
  return v3;
}

- (id)description
{
  void *v3;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16A8]), "initWithFormat:", CFSTR("<%@: %p"), objc_opt_class(), self);
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = self->_samples;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(v3, "appendFormat:", CFSTR("; sample = %@"), *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (NSArray)samples
{
  return &self->_samples->super;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_samples, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
