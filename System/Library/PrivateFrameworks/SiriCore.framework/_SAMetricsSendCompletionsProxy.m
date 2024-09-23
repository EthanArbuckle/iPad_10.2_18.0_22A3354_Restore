@implementation _SAMetricsSendCompletionsProxy

- (_SAMetricsSendCompletionsProxy)init
{
  _SAMetricsSendCompletionsProxy *v2;
  NSMutableArray *v3;
  NSMutableArray *blocks;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_SAMetricsSendCompletionsProxy;
  v2 = -[_SAMetricsSendCompletionsProxy init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    blocks = v2->_blocks;
    v2->_blocks = v3;

  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[_SAMetricsSendCompletionsProxy dispatchBlocksWithResult:error:](self, "dispatchBlocksWithResult:error:", 2, 0);
  v3.receiver = self;
  v3.super_class = (Class)_SAMetricsSendCompletionsProxy;
  -[_SAMetricsSendCompletionsProxy dealloc](&v3, sel_dealloc);
}

- (void)addBlock:(id)a3
{
  NSMutableArray *blocks;
  void *v4;
  id v5;

  if (a3)
  {
    blocks = self->_blocks;
    v5 = (id)objc_msgSend(a3, "copy");
    v4 = (void *)MEMORY[0x212BE6580]();
    -[NSMutableArray addObject:](blocks, "addObject:", v4);

  }
}

- (void)dispatchBlocksWithResult:(int64_t)a3 error:(id)a4
{
  id v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  if (-[NSMutableArray count](self->_blocks, "count"))
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v6 = self->_blocks;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v12;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v12 != v9)
            objc_enumerationMutation(v6);
          (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10) + 16))(*(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10));
          ++v10;
        }
        while (v8 != v10);
        v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v8);
    }

    -[NSMutableArray removeAllObjects](self->_blocks, "removeAllObjects", (_QWORD)v11);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blocks, 0);
}

@end
