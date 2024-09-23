@implementation BRCLRUDictionary

- (BRCLRUDictionary)initWithMaximumCapacity:(unint64_t)a3
{
  BRCLRUDictionary *v4;
  uint64_t v5;
  NSMutableDictionary *dictionary;
  BRCLRUDictionaryNode *v7;
  BRCLRUDictionaryNode *head;
  BRCLRUDictionaryNode *v9;
  BRCLRUDictionaryNode *tail;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)BRCLRUDictionary;
  v4 = -[BRCLRUDictionary init](&v12, sel_init);
  if (v4)
  {
    v5 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", a3);
    dictionary = v4->_dictionary;
    v4->_dictionary = (NSMutableDictionary *)v5;

    v4->_maximumCapacity = a3;
    v7 = -[BRCLRUDictionaryNode initWithKey:object:]([BRCLRUDictionaryNode alloc], "initWithKey:object:", 0, 0);
    head = v4->_head;
    v4->_head = v7;

    v9 = -[BRCLRUDictionaryNode initWithKey:object:]([BRCLRUDictionaryNode alloc], "initWithKey:object:", 0, 0);
    tail = v4->_tail;
    v4->_tail = v9;

    -[BRCLRUDictionaryNode setNext:](v4->_head, "setNext:", v4->_tail);
    -[BRCLRUDictionaryNode setPrev:](v4->_tail, "setPrev:", v4->_head);
  }
  return v4;
}

- (unint64_t)count
{
  return -[NSMutableDictionary count](self->_dictionary, "count");
}

- (id)allKeys
{
  return (id)-[NSMutableDictionary allKeys](self->_dictionary, "allKeys");
}

- (id)allValues
{
  void *v3;
  void *v4;
  BRCLRUDictionaryNode *v5;
  void *v6;
  BRCLRUDictionaryNode *v7;

  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", -[NSMutableDictionary count](self->_dictionary, "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCLRUDictionary head](self, "head");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "next");
  v5 = (BRCLRUDictionaryNode *)objc_claimAutoreleasedReturnValue();

  if (v5 == self->_tail)
  {
    v7 = v5;
  }
  else
  {
    do
    {
      -[BRCLRUDictionaryNode object](v5, "object");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:", v6);

      -[BRCLRUDictionaryNode next](v5, "next");
      v7 = (BRCLRUDictionaryNode *)objc_claimAutoreleasedReturnValue();

      v5 = v7;
    }
    while (v7 != self->_tail);
  }

  return v3;
}

- (void)setMaximumCapacity:(unint64_t)a3
{
  self->_maximumCapacity = a3;
  -[BRCLRUDictionary _shrinkToCapacity](self, "_shrinkToCapacity");
}

- (id)objectForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v4 = a3;
  if (!v4)
  {
    brc_bread_crumbs();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      -[BRCLRUDictionary objectForKey:].cold.1((uint64_t)v9, v10, v11, v12, v13, v14, v15, v16);

  }
  -[BRCLRUDictionary dictionary](self, "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[BRCLRUDictionary _moveNodeToFront:](self, "_moveNodeToFront:", v6);
    objc_msgSend(v6, "object");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  void *v8;
  BRCLRUDictionaryNode *v9;
  void *v10;
  uint64_t v11;
  unint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v6 = a3;
  v7 = a4;
  if (!v7)
  {
    brc_bread_crumbs();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
      -[BRCLRUDictionary objectForKey:].cold.1((uint64_t)v16, v17, v18, v19, v20, v21, v22, v23);

  }
  -[BRCLRUDictionary dictionary](self, "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v7);
  v9 = (BRCLRUDictionaryNode *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[BRCLRUDictionary _moveNodeToFront:](self, "_moveNodeToFront:", v9);
    -[BRCLRUDictionaryNode setObject:](v9, "setObject:", v6);
  }
  else
  {
    -[BRCLRUDictionary dictionary](self, "dictionary");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "count");
    v12 = -[BRCLRUDictionary maximumCapacity](self, "maximumCapacity");

    if (v11 == v12)
    {
      -[BRCLRUDictionary tail](self, "tail");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "prev");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[BRCLRUDictionary _removeNode:](self, "_removeNode:", v14);

    }
    v9 = -[BRCLRUDictionaryNode initWithKey:object:]([BRCLRUDictionaryNode alloc], "initWithKey:object:", v7, v6);
    -[BRCLRUDictionary dictionary](self, "dictionary");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v9, v7);

    -[BRCLRUDictionary _addNodeToFront:](self, "_addNodeToFront:", v9);
  }

}

- (void)removeObjectForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[BRCLRUDictionary dictionary](self, "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  v6 = v7;
  if (v7)
  {
    -[BRCLRUDictionary _removeNode:](self, "_removeNode:", v7);
    v6 = v7;
  }

}

- (void)removeAllObjects
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[BRCLRUDictionary dictionary](self, "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllObjects");

  -[BRCLRUDictionary tail](self, "tail");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCLRUDictionary head](self, "head");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setNext:", v4);

  -[BRCLRUDictionary head](self, "head");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[BRCLRUDictionary tail](self, "tail");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPrev:", v7);

}

- (id)copyWithZone:(_NSZone *)a3
{
  BRCLRUDictionary *v4;
  uint64_t v5;
  NSMutableDictionary *dictionary;
  uint64_t v7;
  BRCLRUDictionaryNode *head;
  uint64_t v9;
  BRCLRUDictionaryNode *tail;

  v4 = -[BRCLRUDictionary initWithMaximumCapacity:]([BRCLRUDictionary alloc], "initWithMaximumCapacity:", -[BRCLRUDictionary maximumCapacity](self, "maximumCapacity"));
  v5 = -[NSMutableDictionary mutableCopy](self->_dictionary, "mutableCopy");
  dictionary = v4->_dictionary;
  v4->_dictionary = (NSMutableDictionary *)v5;

  v7 = -[BRCLRUDictionaryNode copy](self->_head, "copy");
  head = v4->_head;
  v4->_head = (BRCLRUDictionaryNode *)v7;

  v9 = -[BRCLRUDictionaryNode copy](self->_tail, "copy");
  tail = v4->_tail;
  v4->_tail = (BRCLRUDictionaryNode *)v9;

  return v4;
}

- (id)description
{
  void *v3;
  void *v4;
  BRCLRUDictionaryNode *v5;
  void *v6;
  void *v7;
  BRCLRUDictionaryNode *v8;

  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithFormat:", CFSTR("<%@: %p>{\n"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCLRUDictionary head](self, "head");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "next");
  v5 = (BRCLRUDictionaryNode *)objc_claimAutoreleasedReturnValue();

  if (v5 == self->_tail)
  {
    v8 = v5;
  }
  else
  {
    do
    {
      -[BRCLRUDictionaryNode key](v5, "key");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[BRCLRUDictionaryNode object](v5, "object");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "appendFormat:", CFSTR("\t%@ = %@;\n"), v6, v7);

      -[BRCLRUDictionaryNode next](v5, "next");
      v8 = (BRCLRUDictionaryNode *)objc_claimAutoreleasedReturnValue();

      v5 = v8;
    }
    while (v8 != self->_tail);
  }

  objc_msgSend(v3, "appendString:", CFSTR("}\n"));
  return v3;
}

- (void)_shrinkToCapacity
{
  BRCLRUDictionary *i;
  void *v3;
  id v4;
  id v5;

  for (i = self; -[BRCLRUDictionary count](self, "count") > i->_maximumCapacity; self = i)
  {
    -[BRCLRUDictionary tail](i, "tail");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "prev");
    v5 = (id)objc_claimAutoreleasedReturnValue();

    if (!v5
      || (-[BRCLRUDictionary head](i, "head"), v4 = (id)objc_claimAutoreleasedReturnValue(), v4, v5 == v4))
    {

      return;
    }
    -[BRCLRUDictionary _removeNode:](i, "_removeNode:", v5);

  }
}

- (void)_removeNodeFromLinkedList:(id)a3
{
  id v3;
  void *v4;
  id v5;

  v3 = a3;
  objc_msgSend(v3, "prev");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "next");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setNext:", v4);
  objc_msgSend(v4, "setPrev:", v5);

}

- (void)_removeNode:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[BRCLRUDictionary _removeNodeFromLinkedList:](self, "_removeNodeFromLinkedList:", v4);
  -[BRCLRUDictionary dictionary](self, "dictionary");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "key");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "removeObjectForKey:", v5);
}

- (void)_moveNodeToFront:(id)a3
{
  void *v4;
  id v5;
  id v6;

  v6 = a3;
  -[BRCLRUDictionary head](self, "head");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "next");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 != v6)
  {
    -[BRCLRUDictionary _removeNodeFromLinkedList:](self, "_removeNodeFromLinkedList:", v6);
    -[BRCLRUDictionary _addNodeToFront:](self, "_addNodeToFront:", v6);
  }

}

- (void)_addNodeToFront:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[BRCLRUDictionary head](self, "head");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "next");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  -[BRCLRUDictionary head](self, "head");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setNext:", v4);

  -[BRCLRUDictionary head](self, "head");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPrev:", v7);

  objc_msgSend(v4, "setNext:", v8);
  objc_msgSend(v8, "setPrev:", v4);

}

- (unint64_t)maximumCapacity
{
  return self->_maximumCapacity;
}

- (NSMutableDictionary)dictionary
{
  return self->_dictionary;
}

- (void)setDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_dictionary, a3);
}

- (BRCLRUDictionaryNode)head
{
  return self->_head;
}

- (void)setHead:(id)a3
{
  objc_storeStrong((id *)&self->_head, a3);
}

- (BRCLRUDictionaryNode)tail
{
  return self->_tail;
}

- (void)setTail:(id)a3
{
  objc_storeStrong((id *)&self->_tail, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tail, 0);
  objc_storeStrong((id *)&self->_head, 0);
  objc_storeStrong((id *)&self->_dictionary, 0);
}

- (void)objectForKey:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_230455000, a2, a3, "[CRIT] Assertion failed: key != nil%@", a5, a6, a7, a8, 2u);
}

@end
