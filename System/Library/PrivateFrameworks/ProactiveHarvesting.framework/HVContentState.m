@implementation HVContentState

- (id)consumers
{
  return self->_consumers;
}

- (unsigned)levelOfService
{
  return self->_levelOfService;
}

- (id)_initWithConsumers:(id)a3 levelOfService:(unsigned __int8)a4
{
  id v6;
  HVContentState *v7;
  void *v8;
  uint64_t v9;
  NSSet *consumers;
  objc_super v12;

  v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HVContentState;
  v7 = -[HVContentState init](&v12, sel_init);
  if (v7)
  {
    v8 = (void *)MEMORY[0x22074FDF0]();
    v9 = objc_msgSend(v6, "copy");
    consumers = v7->_consumers;
    v7->_consumers = (NSSet *)v9;

    v7->_levelOfService = a4;
    objc_autoreleasePoolPop(v8);
  }

  return v7;
}

- (HVContentState)initWithConsumers:(id)a3 levelOfService:(unsigned __int8)a4
{
  uint64_t v4;
  id v7;
  id v8;
  HVImmutableContentState *v9;
  HVContentState *v10;
  void *v12;

  v4 = a4;
  v7 = a3;
  if (initWithConsumers_levelOfService___pasOnceToken2 != -1)
    dispatch_once(&initWithConsumers_levelOfService___pasOnceToken2, &__block_literal_global_1740);
  v8 = (id)initWithConsumers_levelOfService___pasExprOnceResult;
  v9 = -[HVImmutableContentState initWithConsumers:levelOfService:]([HVImmutableContentState alloc], "initWithConsumers:levelOfService:", v7, v4);
  objc_msgSend(v8, "intern:", v9);
  v10 = (HVContentState *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HVDataSourceContentState.m"), 68, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("instance != nil"));

  }
  return v10;
}

- (unint64_t)hash
{
  NSSet *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSUInteger v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = self->_consumers;
  v4 = -[NSSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = 0;
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        v5 += objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v7++), "hash", (_QWORD)v10);
      }
      while (v4 != v7);
      v4 = -[NSSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
    v4 = 31 * v5;
  }

  v8 = -[NSSet count](self->_consumers, "count");
  return self->_levelOfService - (v8 + v4) + 32 * (v8 + v4);
}

- (BOOL)isEqual:(id)a3
{
  HVContentState *v4;
  char v5;

  v4 = (HVContentState *)a3;
  if (v4 == self)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && self->_levelOfService == v4->_levelOfService)
      v5 = -[NSSet isEqual:](self->_consumers, "isEqual:", v4->_consumers);
    else
      v5 = 0;
  }

  return v5;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[HVMutableContentState initWithConsumers:levelOfService:]([HVMutableContentState alloc], "initWithConsumers:levelOfService:", self->_consumers, self->_levelOfService);
}

- (id)description
{
  id v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x24BDD17C8]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@ LoS:%hhu consumers:%@>"), v5, self->_levelOfService, self->_consumers);

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_consumers, 0);
}

void __51__HVContentState_initWithConsumers_levelOfService___block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x22074FDF0]();
  v1 = objc_opt_new();
  v2 = (void *)initWithConsumers_levelOfService___pasExprOnceResult;
  initWithConsumers_levelOfService___pasExprOnceResult = v1;

  objc_autoreleasePoolPop(v0);
}

@end
