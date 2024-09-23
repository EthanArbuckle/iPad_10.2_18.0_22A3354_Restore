@implementation STMSizeCacheEntry

- (STMSizeCacheEntry)initWithContainer:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  STMSizeCacheEntry *v7;
  void *v8;

  v4 = a3;
  objc_msgSend(v4, "url");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[STMSizeCacheEntry initWithPath:](self, "initWithPath:", v6);
  if (v7)
  {
    STSharedContainerSizingQueue();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[STMSizeCacheEntry setDispatchQueue:](v7, "setDispatchQueue:", v8);

    -[STMSizeCacheEntry setItem:](v7, "setItem:", v4);
    -[STMSizeCacheEntry setSizingBlock:](v7, "setSizingBlock:", &__block_literal_global);
  }

  return v7;
}

id __50__STMSizeCacheEntry_Container__initWithContainer___block_invoke(uint64_t a1, void *a2, _QWORD *a3)
{
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  id v9;

  v9 = 0;
  v4 = objc_msgSend(a2, "diskUsageWithError:", &v9);
  v5 = v9;
  v6 = v5;
  if (v5)
  {
    v7 = 0;
    *a3 = objc_retainAutorelease(v5);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (STMSizeCacheEntry)initWithURL:(id)a3
{
  return -[STMSizeCacheEntry initWithURL:usingFastSizingIfPossible:](self, "initWithURL:usingFastSizingIfPossible:", a3, 0);
}

- (STMSizeCacheEntry)initWithURL:(id)a3 usingFastSizingIfPossible:(BOOL)a4
{
  id v6;
  void *v7;
  STMSizeCacheEntry *v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  BOOL v13;

  v6 = a3;
  objc_msgSend(v6, "path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[STMSizeCacheEntry initWithPath:](self, "initWithPath:", v7);

  if (v8)
  {
    STSharedPathSizingOpQueue();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[STMSizeCacheEntry setQueue:](v8, "setQueue:", v9);

    -[STMSizeCacheEntry setItem:](v8, "setItem:", v6);
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __64__STMSizeCacheEntry_URL__initWithURL_usingFastSizingIfPossible___block_invoke;
    v11[3] = &unk_24C75FB70;
    v12 = v6;
    v13 = a4;
    -[STMSizeCacheEntry setSizingBlock:](v8, "setSizingBlock:", v11);

  }
  return v8;
}

id __64__STMSizeCacheEntry_URL__initWithURL_usingFastSizingIfPossible___block_invoke(uint64_t a1)
{
  void *v2;
  _OWORD v4[2];
  uint64_t v5;

  v5 = 0;
  memset(v4, 0, sizeof(v4));
  objc_msgSend(*(id *)(a1 + 32), "path");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  STMSizeOfFileTree(v2, *(unsigned __int8 *)(a1 + 40), (uint64_t)v4);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", *(_QWORD *)&v4[0]);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (STMSizeCacheEntry)initWithPath:(id)a3
{
  id v4;
  STMSizeCacheEntry *v5;
  void *v6;
  BOOL v7;
  uint64_t v8;
  uint64_t v9;
  NSLock *calculateLock;
  char v12;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)STMSizeCacheEntry;
  v5 = -[STMSizeCacheEntry init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0;
    if (objc_msgSend(v6, "fileExistsAtPath:isDirectory:", v4, &v12))
      v7 = v12 == 0;
    else
      v7 = 1;
    if (!v7)
    {
      STMakeDirPath(v4);
      v8 = objc_claimAutoreleasedReturnValue();

      v4 = (id)v8;
    }
    objc_storeStrong((id *)&v5->_itemPath, v4);
    v9 = objc_opt_new();
    calculateLock = v5->_calculateLock;
    v5->_calculateLock = (NSLock *)v9;

  }
  return v5;
}

- (NSString)itemPath
{
  return self->_itemPath;
}

- (void)calculateSize
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void (**sizingBlock)(id, id, id *);
  id item;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id v22;
  id v23;

  if (-[STMSizeCacheEntry status](self, "status") == 2)
  {
    -[STMSizeCacheEntry itemPath](self, "itemPath");
    v22 = (id)objc_claimAutoreleasedReturnValue();
    STLog(0, CFSTR("-[STMSizeCacheEntry calculateSize]: Cache entry %@ will not be updated because it's valid"), v3, v4, v5, v6, v7, v8, (uint64_t)v22);

  }
  else
  {
    -[NSLock lock](self->_calculateLock, "lock");
    if (-[STMSizeCacheEntry status](self, "status") == 2)
    {
      -[NSLock unlock](self->_calculateLock, "unlock");
    }
    else
    {
      -[STMSizeCacheEntry setStatus:](self, "setStatus:", 1);
      sizingBlock = (void (**)(id, id, id *))self->_sizingBlock;
      if (sizingBlock)
      {
        item = self->_item;
        v23 = 0;
        sizingBlock[2](sizingBlock, item, &v23);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v23;
        if (!v11)
          STLog(2, CFSTR("Error sizing cache entry for path %@"), v12, v13, v14, v15, v16, v17, (uint64_t)self->_itemPath);
        -[STMSizeCacheEntry setItemSize:](self, "setItemSize:", v11);

      }
      else
      {
        -[STMSizeCacheEntry itemSize](self, "itemSize");
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v19)
          -[STMSizeCacheEntry setItemSize:](self, "setItemSize:", &unk_24C768A80);
      }
      -[STMSizeCacheEntry itemSize](self, "itemSize");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (v20)
        v21 = 2;
      else
        v21 = 5;
      -[STMSizeCacheEntry setStatus:](self, "setStatus:", v21);

      -[NSLock unlock](self->_calculateLock, "unlock");
    }
  }
}

- (id)item
{
  return objc_getProperty(self, a2, 24, 1);
}

- (void)setItem:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSNumber)itemSize
{
  return (NSNumber *)objc_getProperty(self, a2, 32, 1);
}

- (void)setItemSize:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (unint64_t)status
{
  return self->_status;
}

- (void)setStatus:(unint64_t)a3
{
  self->_status = a3;
}

- (id)sizingBlock
{
  return objc_getProperty(self, a2, 48, 1);
}

- (void)setSizingBlock:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 48);
}

- (NSOperationQueue)queue
{
  return (NSOperationQueue *)objc_getProperty(self, a2, 56, 1);
}

- (void)setQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (OS_dispatch_queue)dispatchQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 64, 1);
}

- (void)setDispatchQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong(&self->_sizingBlock, 0);
  objc_storeStrong((id *)&self->_itemSize, 0);
  objc_storeStrong(&self->_item, 0);
  objc_storeStrong((id *)&self->_calculateLock, 0);
  objc_storeStrong((id *)&self->_itemPath, 0);
}

@end
