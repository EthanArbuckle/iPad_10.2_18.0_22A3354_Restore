@implementation ISURLOperationPool

- (ISURLOperationPool)init
{
  ISURLOperationPool *v3;
  objc_super v5;

  __ISRecordSPIClassUsage(self);
  v5.receiver = self;
  v5.super_class = (Class)ISURLOperationPool;
  v3 = -[ISURLOperationPool init](&v5, sel_init);
  if (v3)
    v3->_operationQueue = (ISOperationQueue *)+[ISOperationQueue mainQueue](ISOperationQueue, "mainQueue");
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ISURLOperationPool;
  -[ISURLOperationPool dealloc](&v3, sel_dealloc);
}

- (void)addOperation:(id)a3 withFlags:(int64_t)a4
{
  id v6;
  ISURLOperationPoolOperation *v7;

  v6 = -[ISURLOperationPool _poolOperationForOperation:flags:](self, "_poolOperationForOperation:flags:", a3, a4);
  if (v6)
  {
    objc_msgSend(v6, "addOperation:", a3);
  }
  else
  {
    v7 = objc_alloc_init(ISURLOperationPoolOperation);
    -[ISURLOperationPoolOperation addOperation:](v7, "addOperation:", a3);
    -[ISOperationQueue addOperation:](self->_operationQueue, "addOperation:", v7);

  }
}

- (void)cancelOperation:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = -[ISOperationQueue operations](self->_operationQueue, "operations");
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
LABEL_3:
    v8 = 0;
    while (1)
    {
      if (*(_QWORD *)v11 != v7)
        objc_enumerationMutation(v4);
      v9 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v8);
      if ((objc_msgSend(v9, "containsOperation:", a3) & 1) != 0)
        break;
      if (v6 == ++v8)
      {
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
        if (v6)
          goto LABEL_3;
        goto LABEL_12;
      }
    }
    if (!v9)
      goto LABEL_12;
    objc_msgSend(v9, "cancelOperation:", a3);
  }
  else
  {
LABEL_12:
    objc_msgSend(a3, "cancel");
  }
}

- (id)_poolOperationForOperation:(id)a3 flags:(int64_t)a4
{
  char v4;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v4 = a4;
  v23 = *MEMORY[0x24BDAC8D0];
  v7 = (void *)objc_msgSend(a3, "dataProvider");
  v8 = (void *)objc_msgSend((id)objc_msgSend(a3, "_requestProperties"), "URL");
  v9 = -[ISOperationQueue operations](self->_operationQueue, "operations");
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (!v10)
    return 0;
  v11 = v10;
  v12 = *(_QWORD *)v19;
LABEL_3:
  v13 = 0;
  while (1)
  {
    if (*(_QWORD *)v19 != v12)
      objc_enumerationMutation(v9);
    v14 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v13);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v15 = (void *)objc_msgSend(v14, "mainOperation");
      if (objc_msgSend(v8, "isEqual:", objc_msgSend((id)objc_msgSend(v15, "_requestProperties"), "URL")))
      {
        v16 = objc_msgSend(v15, "dataProvider");
        if ((v4 & 1) != 0 && (v7 == (void *)v16 || (objc_msgSend(v7, "isEqual:", v16) & 1) != 0))
          return v14;
      }
    }
    if (v11 == ++v13)
    {
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v11)
        goto LABEL_3;
      return 0;
    }
  }
}

- (ISOperationQueue)operationQueue
{
  return self->_operationQueue;
}

- (void)setOperationQueue:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

@end
