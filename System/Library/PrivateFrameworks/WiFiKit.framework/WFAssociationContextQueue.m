@implementation WFAssociationContextQueue

- (WFAssociationContextQueue)init
{
  WFAssociationContextQueue *v2;
  NSMutableArray *v3;
  NSMutableArray *queue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WFAssociationContextQueue;
  v2 = -[WFAssociationContextQueue init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    queue = v2->_queue;
    v2->_queue = v3;

  }
  return v2;
}

- (id)peek
{
  void *v3;
  void *v4;
  void *v5;

  -[WFAssociationContextQueue queue](self, "queue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v3);
  -[WFAssociationContextQueue queue](self, "queue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v3);
  return v5;
}

- (void)push:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  os_log_type_t v7;
  void *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[WFAssociationContextQueue queue](self, "queue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v5);
  WFLogForCategory(5uLL);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = OSLogForWFLogLevel(4uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 4 && v6 && os_log_type_enabled(v6, v7))
  {
    v9 = 138412290;
    v10 = v4;
    _os_log_impl(&dword_219FC8000, v6, v7, "adding %@ to association queue", (uint8_t *)&v9, 0xCu);
  }

  -[WFAssociationContextQueue queue](self, "queue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObject:", v4);

  objc_sync_exit(v5);
}

- (id)pop
{
  char *v3;
  NSObject *v4;
  NSObject *v5;
  os_log_type_t v6;
  void *v7;
  os_log_type_t v9;
  int v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  -[WFAssociationContextQueue peek](self, "peek");
  v3 = (char *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[WFAssociationContextQueue queue](self, "queue");
    v4 = objc_claimAutoreleasedReturnValue();
    objc_sync_enter(v4);
    WFLogForCategory(5uLL);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = OSLogForWFLogLevel(4uLL);
    if ((unint64_t)WFCurrentLogLevel() >= 4 && v5 && os_log_type_enabled(v5, v6))
    {
      v10 = 138412290;
      v11 = v3;
      _os_log_impl(&dword_219FC8000, v5, v6, "removing %@ from association queue", (uint8_t *)&v10, 0xCu);
    }

    -[WFAssociationContextQueue queue](self, "queue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeObject:", v3);

    objc_sync_exit(v4);
  }
  else
  {
    WFLogForCategory(0);
    v4 = objc_claimAutoreleasedReturnValue();
    v9 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v4 && os_log_type_enabled(v4, v9))
    {
      v10 = 136315138;
      v11 = "-[WFAssociationContextQueue pop]";
      _os_log_impl(&dword_219FC8000, v4, v9, "%s: attempted to pop when queue is empty", (uint8_t *)&v10, 0xCu);
    }
  }

  return v3;
}

- (void)removeAll
{
  NSObject *v3;
  os_log_type_t v4;
  void *v5;
  void *v6;
  uint8_t v7[16];

  WFLogForCategory(5uLL);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = OSLogForWFLogLevel(4uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 4 && v3 && os_log_type_enabled(v3, v4))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_219FC8000, v3, v4, "removing all objects in association queue", v7, 2u);
  }

  -[WFAssociationContextQueue _dumpQueue](self, "_dumpQueue");
  -[WFAssociationContextQueue queue](self, "queue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v5);
  -[WFAssociationContextQueue queue](self, "queue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeAllObjects");

  objc_sync_exit(v5);
}

- (void)_dumpQueue
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint8_t buf[4];
  uint64_t v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[WFAssociationContextQueue queue](self, "queue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v16, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i);
        WFLogForCategory(5uLL);
        v8 = objc_claimAutoreleasedReturnValue();
        v9 = OSLogForWFLogLevel(1uLL);
        if (WFCurrentLogLevel() && v8 && os_log_type_enabled(v8, v9))
        {
          *(_DWORD *)buf = 138412290;
          v15 = v7;
          _os_log_impl(&dword_219FC8000, v8, v9, "%@", buf, 0xCu);
        }

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v16, 16);
    }
    while (v4);
  }

}

- (NSMutableArray)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
