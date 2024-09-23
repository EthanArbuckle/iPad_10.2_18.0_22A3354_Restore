@implementation SCRCStackQueue

- (void)dealloc
{
  objc_super v3;

  -[SCRCStackQueue removeAllObjects](self, "removeAllObjects");
  v3.receiver = self;
  v3.super_class = (Class)SCRCStackQueue;
  -[SCRCStackQueue dealloc](&v3, sel_dealloc);
}

- (void)removeAllObjects
{
  -[SCRCStackQueue _safeReleaseAllObjects](self, "_safeReleaseAllObjects");
  self->_count = 0;
}

- (void)_safeReleaseAllObjects
{
  _SCRCStackNode *v3;
  _SCRCStackNode *firstNode;
  _SCRCStackNode *lastNode;
  uint64_t v6;

  v3 = self->_firstNode;
  firstNode = self->_firstNode;
  self->_firstNode = 0;

  lastNode = self->_lastNode;
  self->_lastNode = 0;

  if (v3)
  {
    do
    {
      -[_SCRCStackNode next](v3, "next");
      v6 = objc_claimAutoreleasedReturnValue();

      v3 = (_SCRCStackNode *)v6;
    }
    while (v6);
  }
}

- (void)pushArray:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v11;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v11 != v8)
            objc_enumerationMutation(v5);
          -[SCRCStackQueue pushObject:](self, "pushObject:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++));
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v7);
    }
  }

}

- (void)pushObject:(id)a3
{
  id v4;
  _SCRCStackNode *v5;
  _SCRCStackNode *lastNode;

  if (a3)
  {
    v4 = a3;
    v5 = objc_alloc_init(_SCRCStackNode);
    -[_SCRCStackNode setObject:](v5, "setObject:", v4);

    if (self->_firstNode)
    {
      -[_SCRCStackNode setPrev:](v5, "setPrev:", self->_lastNode);
      -[_SCRCStackNode setNext:](self->_lastNode, "setNext:", v5);
    }
    else
    {
      objc_storeStrong((id *)&self->_firstNode, v5);
    }
    lastNode = self->_lastNode;
    self->_lastNode = v5;

    ++self->_count;
  }
}

- (id)popObject
{
  return -[SCRCStackQueue popObjectRetained](self, "popObjectRetained");
}

- (id)popObjectRetained
{
  _SCRCStackNode *v3;
  _SCRCStackNode *v4;
  void *v5;
  _SCRCStackNode *lastNode;
  _SCRCStackNode *v7;
  _SCRCStackNode *v8;
  _SCRCStackNode *firstNode;

  v3 = self->_lastNode;
  if (!v3)
    return 0;
  v4 = v3;
  -[_SCRCStackNode object](v3, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  lastNode = self->_lastNode;
  --self->_count;
  if (lastNode == self->_firstNode)
  {
    self->_lastNode = 0;

    firstNode = self->_firstNode;
    self->_firstNode = 0;

  }
  else
  {
    -[_SCRCStackNode prev](lastNode, "prev");
    v7 = (_SCRCStackNode *)objc_claimAutoreleasedReturnValue();
    v8 = self->_lastNode;
    self->_lastNode = v7;

    -[_SCRCStackNode setNext:](self->_lastNode, "setNext:", 0);
  }

  return v5;
}

- (id)topObject
{
  return -[_SCRCStackNode object](self->_lastNode, "object");
}

- (id)dequeueObjectRetained
{
  _SCRCStackNode *v3;
  _SCRCStackNode *v4;
  void *v5;
  _SCRCStackNode *firstNode;
  _SCRCStackNode *v7;
  _SCRCStackNode *v8;
  _SCRCStackNode *lastNode;

  v3 = self->_firstNode;
  if (!v3)
    return 0;
  v4 = v3;
  -[_SCRCStackNode object](v3, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  firstNode = self->_firstNode;
  if (firstNode == self->_lastNode)
  {
    self->_firstNode = 0;

    lastNode = self->_lastNode;
    self->_lastNode = 0;

  }
  else
  {
    -[_SCRCStackNode next](v4, "next");
    v7 = (_SCRCStackNode *)objc_claimAutoreleasedReturnValue();
    v8 = self->_firstNode;
    self->_firstNode = v7;

    -[_SCRCStackNode setPrev:](self->_firstNode, "setPrev:", 0);
  }
  --self->_count;

  return v5;
}

- (id)dequeueObject
{
  return -[SCRCStackQueue dequeueObjectRetained](self, "dequeueObjectRetained");
}

- (unint64_t)count
{
  return self->_count;
}

- (id)description
{
  void *v3;
  _SCRCStackNode *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;

  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithFormat:", CFSTR("Stack (%p) has %lu items\n"), self, -[SCRCStackQueue count](self, "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = self->_firstNode;
  if (v4)
  {
    v5 = v4;
    do
    {
      v6 = objc_alloc(MEMORY[0x24BDD17C8]);
      objc_msgSend(v5, "object");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)objc_msgSend(v6, "initWithFormat:", CFSTR("\t%@\n"), v7);

      objc_msgSend(v3, "appendString:", v8);
      objc_msgSend(v5, "next");
      v9 = objc_claimAutoreleasedReturnValue();

      v5 = (void *)v9;
    }
    while (v9);
  }
  return v3;
}

- (id)objectEnumerator
{
  return -[_SCRCStackQueueEnumerator initWithListMember:]([_SCRCStackQueueEnumerator alloc], "initWithListMember:", self->_firstNode);
}

- (BOOL)isEmpty
{
  return self->_firstNode == 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastNode, 0);
  objc_storeStrong((id *)&self->_firstNode, 0);
}

@end
