@implementation SSDoubleLinkedList

- (SSDoubleLinkedList)init
{
  SSDoubleLinkedList *v2;
  void *v3;
  uint64_t v4;
  NSString *listIdentifier;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SSDoubleLinkedList;
  v2 = -[SSDoubleLinkedList init](&v7, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "UUIDString");
    v4 = objc_claimAutoreleasedReturnValue();
    listIdentifier = v2->_listIdentifier;
    v2->_listIdentifier = (NSString *)v4;

  }
  return v2;
}

- (id)insertObject:(id)a3
{
  id v4;
  SSDoubleLinkedListNode *v5;

  v4 = a3;
  v5 = -[SSDoubleLinkedListNode initWithObject:]([SSDoubleLinkedListNode alloc], "initWithObject:", v4);

  -[SSDoubleLinkedList insertNode:](self, "insertNode:", v5);
  return v5;
}

- (void)insertNode:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;

  v9 = a3;
  objc_msgSend(v9, "listIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", CFSTR("SSDoubleLinkedListInvalidNode"), CFSTR("Attempting to add a node that has already been added to another list."), 0);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v8);
  }
  -[SSDoubleLinkedList head](self, "head");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSDoubleLinkedList setHead:](self, "setHead:", v9);
  -[SSDoubleLinkedList tail](self, "tail");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
    -[SSDoubleLinkedList setTail:](self, "setTail:", v9);
  objc_msgSend(v9, "setPrevious:", 0);
  objc_msgSend(v9, "setNext:", v5);
  objc_msgSend(v5, "setPrevious:", v9);
  -[SSDoubleLinkedList listIdentifier](self, "listIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setListIdentifier:", v7);

  ++self->_count;
}

- (SSDoubleLinkedListNode)tail
{
  return self->_tail;
}

- (void)setTail:(id)a3
{
  objc_storeStrong((id *)&self->_tail, a3);
}

- (void)setHead:(id)a3
{
  objc_storeStrong((id *)&self->_head, a3);
}

- (NSString)listIdentifier
{
  return self->_listIdentifier;
}

- (SSDoubleLinkedListNode)head
{
  return self->_head;
}

- (NSArray)allNodes
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[SSDoubleLinkedList head](self, "head");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    do
    {
      objc_msgSend(v3, "addObject:", v5);
      objc_msgSend(v5, "next");
      v6 = objc_claimAutoreleasedReturnValue();

      v5 = (void *)v6;
    }
    while (v6);
  }
  return (NSArray *)v3;
}

- (void)appendNode:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;

  v9 = a3;
  objc_msgSend(v9, "listIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", CFSTR("SSDoubleLinkedListInvalidNode"), CFSTR("Attempting to add a node that has already been added to another list."), 0);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v8);
  }
  -[SSDoubleLinkedList tail](self, "tail");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSDoubleLinkedList setTail:](self, "setTail:", v9);
  -[SSDoubleLinkedList head](self, "head");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
    -[SSDoubleLinkedList setHead:](self, "setHead:", v9);
  objc_msgSend(v9, "setPrevious:", v5);
  objc_msgSend(v9, "setNext:", 0);
  objc_msgSend(v5, "setNext:", v9);
  -[SSDoubleLinkedList listIdentifier](self, "listIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setListIdentifier:", v7);

  ++self->_count;
}

- (id)appendObject:(id)a3
{
  id v4;
  SSDoubleLinkedListNode *v5;

  v4 = a3;
  v5 = -[SSDoubleLinkedListNode initWithObject:]([SSDoubleLinkedListNode alloc], "initWithObject:", v4);

  -[SSDoubleLinkedList appendNode:](self, "appendNode:", v5);
  return v5;
}

- (void)removeAllNodes
{
  -[SSDoubleLinkedList setHead:](self, "setHead:", 0);
  -[SSDoubleLinkedList setTail:](self, "setTail:", 0);
  self->_count = 0;
}

- (void)removeNode:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  id v15;

  v15 = a3;
  objc_msgSend(v15, "listIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSDoubleLinkedList listIdentifier](self, "listIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 != v5)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", CFSTR("SSDoubleLinkedListInvalidNode"), CFSTR("Attempting to remove a node from a list it doesn't belong to."), 0);
    v14 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v14);
  }
  objc_msgSend(v15, "next");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "previous");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPrevious:", v7);

  objc_msgSend(v15, "previous");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "next");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setNext:", v9);

  -[SSDoubleLinkedList head](self, "head");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  if (v10 == v15)
  {
    objc_msgSend(v15, "next");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSDoubleLinkedList setHead:](self, "setHead:", v11);

  }
  -[SSDoubleLinkedList tail](self, "tail");
  v12 = (id)objc_claimAutoreleasedReturnValue();

  if (v12 == v15)
  {
    objc_msgSend(v15, "previous");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSDoubleLinkedList setTail:](self, "setTail:", v13);

  }
  objc_msgSend(v15, "setListIdentifier:", 0);
  --self->_count;

}

- (id)description
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[SSDoubleLinkedList allNodes](self, "allNodes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v9, "object");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "appendFormat:", CFSTR("%@"), v10);

        -[SSDoubleLinkedList tail](self, "tail");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v9 != v11)
          objc_msgSend(v3, "appendString:", CFSTR(",\n"));
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

  return v3;
}

- (unint64_t)count
{
  return self->_count;
}

- (void)setListIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_listIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listIdentifier, 0);
  objc_storeStrong((id *)&self->_tail, 0);
  objc_storeStrong((id *)&self->_head, 0);
}

@end
