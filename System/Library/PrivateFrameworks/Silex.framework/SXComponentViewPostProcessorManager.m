@implementation SXComponentViewPostProcessorManager

- (SXComponentViewPostProcessorManager)init
{
  SXComponentViewPostProcessorManager *v2;
  uint64_t v3;
  NSMutableArray *processors;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SXComponentViewPostProcessorManager;
  v2 = -[SXComponentViewPostProcessorManager init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v3 = objc_claimAutoreleasedReturnValue();
    processors = v2->_processors;
    v2->_processors = (NSMutableArray *)v3;

  }
  return v2;
}

- (void)processComponent:(id)a3 view:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[SXComponentViewPostProcessorManager processors](self, "processors", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v12++), "processComponent:view:", v6, v7);
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v10);
  }

}

- (void)addProcessor:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  if (v7)
  {
    -[SXComponentViewPostProcessorManager processors](self, "processors");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "containsObject:", v7);

    if ((v5 & 1) == 0)
    {
      -[SXComponentViewPostProcessorManager processors](self, "processors");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObject:", v7);

    }
  }

}

- (void)removeProcessor:(id)a3
{
  id v4;
  id v5;

  if (a3)
  {
    v4 = a3;
    -[SXComponentViewPostProcessorManager processors](self, "processors");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObject:", v4);

  }
}

- (NSMutableArray)processors
{
  return self->_processors;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processors, 0);
}

@end
