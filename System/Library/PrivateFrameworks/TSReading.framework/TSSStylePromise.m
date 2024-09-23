@implementation TSSStylePromise

+ (id)promiseForStyle:(id)a3
{
  return -[TSSStylePromise initWithStyle:]([TSSStylePromise alloc], "initWithStyle:", a3);
}

- (TSSStylePromise)initWithStyle:(id)a3
{
  TSSStylePromise *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TSSStylePromise;
  v4 = -[TSSStylePromise init](&v6, sel_init);
  if (v4)
    v4->_sourceStyle = (TSSStyle *)a3;
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSSStylePromise;
  -[TSSStylePromise dealloc](&v3, sel_dealloc);
}

- (void)addPromisee:(id)a3
{
  NSMutableArray *promisees;

  promisees = self->_promisees;
  if (!promisees)
  {
    promisees = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    self->_promisees = promisees;
  }
  -[NSMutableArray addObject:](promisees, "addObject:", a3);
}

- (void)fulfillWithStyle:(id)a3
{
  NSMutableArray *promisees;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  _QWORD v12[6];
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  promisees = self->_promisees;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](promisees, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    v9 = MEMORY[0x24BDAC760];
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(promisees);
        v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        v12[0] = v9;
        v12[1] = 3221225472;
        v12[2] = __36__TSSStylePromise_fulfillWithStyle___block_invoke;
        v12[3] = &unk_24D82B1B8;
        v12[4] = self;
        v12[5] = a3;
        objc_msgSend(v11, "replaceReferencedStylesUsingBlock:", v12);
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](promisees, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }
}

uint64_t __36__TSSStylePromise_fulfillWithStyle___block_invoke(uint64_t a1, uint64_t a2)
{
  if (*(_QWORD *)(a1 + 32) == a2)
    return *(_QWORD *)(a1 + 40);
  return a2;
}

@end
