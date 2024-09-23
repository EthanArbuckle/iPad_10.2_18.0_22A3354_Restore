@implementation SignpostCAStallAggregation

- (void)_addSystemDuration:(unint64_t)a3 ofType:(unsigned __int8)a4
{
  uint64_t v4;
  id v6;

  v4 = a4;
  -[SignpostCAStallAggregation systemAggregation](self, "systemAggregation");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_addDuration:ofType:", a3, v4);

}

- (id)copyWithZone:(_NSZone *)a3
{
  SignpostCAStallAggregation *v4;
  void *v5;
  uint64_t v6;
  SignpostCAProcessStallAggregation *systemAggregation;
  void *v8;
  uint64_t v9;
  NSDictionary *executablePathToStallAggregation;

  v4 = -[SignpostCAStallAggregation init](+[SignpostCAStallAggregation allocWithZone:](SignpostCAStallAggregation, "allocWithZone:", a3), "init");
  -[SignpostCAStallAggregation systemAggregation](self, "systemAggregation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "copy");
  systemAggregation = v4->_systemAggregation;
  v4->_systemAggregation = (SignpostCAProcessStallAggregation *)v6;

  -[SignpostCAStallAggregation executablePathToStallAggregation](self, "executablePathToStallAggregation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "copy");
  executablePathToStallAggregation = v4->_executablePathToStallAggregation;
  v4->_executablePathToStallAggregation = (NSDictionary *)v9;

  return v4;
}

- (SignpostCAStallAggregation)init
{
  SignpostCAStallAggregation *v2;
  SignpostCAProcessStallAggregation *v3;
  SignpostCAProcessStallAggregation *systemAggregation;
  uint64_t v5;
  NSDictionary *executablePathToStallAggregation;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SignpostCAStallAggregation;
  v2 = -[SignpostCAStallAggregation init](&v8, sel_init);
  if (v2)
  {
    v3 = -[SignpostCAProcessStallAggregation _initAsSystemAggregation]([SignpostCAProcessStallAggregation alloc], "_initAsSystemAggregation");
    systemAggregation = v2->_systemAggregation;
    v2->_systemAggregation = v3;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v5 = objc_claimAutoreleasedReturnValue();
    executablePathToStallAggregation = v2->_executablePathToStallAggregation;
    v2->_executablePathToStallAggregation = (NSDictionary *)v5;

  }
  return v2;
}

- (void)_addDuration:(unint64_t)a3 ofType:(unsigned __int8)a4 procExecutablePath:(id)a5 responsiblePID:(int)a6 aggregateForSystem:(BOOL)a7
{
  _BOOL4 v7;
  uint64_t v8;
  uint64_t v9;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v7 = a7;
  v8 = *(_QWORD *)&a6;
  v9 = a4;
  v18 = a5;
  -[SignpostCAStallAggregation executablePathToStallAggregation](self, "executablePathToStallAggregation");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", v18);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    v13 = -[SignpostCAProcessStallAggregation _initWithProcessExecutablePath:pid:]([SignpostCAProcessStallAggregation alloc], "_initWithProcessExecutablePath:pid:", v18, v8);
    -[SignpostCAStallAggregation executablePathToStallAggregation](self, "executablePathToStallAggregation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v13, v18);

  }
  objc_msgSend(v13, "_addDuration:ofType:", a3, v9);
  objc_msgSend(v13, "pids");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v8);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addObject:", v16);

  if (v7)
  {
    -[SignpostCAStallAggregation systemAggregation](self, "systemAggregation");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "_addDuration:ofType:", a3, v9);

  }
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SignpostCAStallAggregation executablePathToStallAggregation](self, "executablePathToStallAggregation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  objc_msgSend(v6, "sortUsingComparator:", &__block_literal_global_24);
  -[SignpostCAStallAggregation systemAggregation](self, "systemAggregation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "insertObject:atIndex:", v7, 0);

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
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
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v12), "description");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "appendFormat:", CFSTR("%@\n"), v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }

  return v3;
}

uint64_t __41__SignpostCAStallAggregation_description__block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  v5 = a3;
  objc_msgSend(v4, "numberWithUnsignedLongLong:", objc_msgSend(a2, "_totalStallDurationNs"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB37E8];
  v8 = objc_msgSend(v5, "_totalStallDurationNs");

  objc_msgSend(v7, "numberWithUnsignedLongLong:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "compare:", v6);

  return v10;
}

- (SignpostCAProcessStallAggregation)systemAggregation
{
  return self->_systemAggregation;
}

- (NSDictionary)executablePathToStallAggregation
{
  return self->_executablePathToStallAggregation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_executablePathToStallAggregation, 0);
  objc_storeStrong((id *)&self->_systemAggregation, 0);
}

@end
