@implementation _UIContextMenuLinkedList

- (_UIContextMenuNode)first
{
  void *v2;
  void *v3;

  -[_UIContextMenuLinkedList nodes](self, "nodes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (_UIContextMenuNode *)v3;
}

- (_UIContextMenuNode)current
{
  void *v2;
  void *v3;

  -[_UIContextMenuLinkedList nodes](self, "nodes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (_UIContextMenuNode *)v3;
}

- (void)addNode:(id)a3
{
  void *v4;
  void *v5;
  NSMutableArray *v6;
  NSMutableArray *nodes;
  void *v8;
  id v9;

  v9 = a3;
  -[_UIContextMenuLinkedList current](self, "current");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNext:", v9);

  -[_UIContextMenuLinkedList current](self, "current");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setPrevious:", v5);

  if (!self->_nodes)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    nodes = self->_nodes;
    self->_nodes = v6;

  }
  -[_UIContextMenuLinkedList nodes](self, "nodes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObject:", v9);

}

- (id)popNode
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[_UIContextMenuLinkedList current](self, "current");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[_UIContextMenuLinkedList nodes](self, "nodes");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIContextMenuLinkedList current](self, "current");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObject:", v5);

    -[_UIContextMenuLinkedList current](self, "current");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setNext:", 0);

  }
  return v3;
}

- (id)removeNode:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v12[4];
  id v13;
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__18;
  v20 = __Block_byref_object_dispose__18;
  v21 = 0;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __39___UIContextMenuLinkedList_removeNode___block_invoke;
  v12[3] = &unk_1E16B6560;
  v6 = v5;
  v13 = v6;
  v7 = v4;
  v14 = v7;
  v15 = &v16;
  -[_UIContextMenuLinkedList reverseEnumerateNodes:](self, "reverseEnumerateNodes:", v12);
  if (v17[5])
  {
    -[_UIContextMenuLinkedList nodes](self, "nodes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeObjectsInArray:", v6);

    -[_UIContextMenuLinkedList current](self, "current");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setNext:", 0);

    v10 = v6;
  }
  else
  {
    v10 = (id)MEMORY[0x1E0C9AA60];
  }

  _Block_object_dispose(&v16, 8);
  return v10;
}

- (id)nodeForMenu:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__18;
  v15 = __Block_byref_object_dispose__18;
  v16 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __40___UIContextMenuLinkedList_nodeForMenu___block_invoke;
  v8[3] = &unk_1E16B2628;
  v5 = v4;
  v9 = v5;
  v10 = &v11;
  -[_UIContextMenuLinkedList reverseEnumerateNodes:](self, "reverseEnumerateNodes:", v8);
  v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

- (void)enumerateNodes:(id)a3
{
  -[_UIContextMenuLinkedList _enumerateNodes:inReverse:](self, "_enumerateNodes:inReverse:", a3, 0);
}

- (void)reverseEnumerateNodes:(id)a3
{
  -[_UIContextMenuLinkedList _enumerateNodes:inReverse:](self, "_enumerateNodes:inReverse:", a3, 1);
}

- (void)_enumerateNodes:(id)a3 inReverse:(BOOL)a4
{
  void (**v6)(id, void *, _BYTE *);
  void *v7;
  void *v8;
  char v9;

  v6 = (void (**)(id, void *, _BYTE *))a3;
  if (a4)
    -[_UIContextMenuLinkedList current](self, "current");
  else
    -[_UIContextMenuLinkedList first](self, "first");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  if (v7)
  {
    do
    {
      v6[2](v6, v7, &v9);
      if (a4)
        objc_msgSend(v7, "previous");
      else
        objc_msgSend(v7, "next");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v8)
        break;
      v7 = v8;
    }
    while (!v9);

  }
}

- (id)description
{
  void *v3;
  void *v4;
  _UIContextMenuLinkedList *v5;
  objc_class *v6;
  void *v7;
  __CFString *v8;
  id v9;
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__18;
  v16 = __Block_byref_object_dispose__18;
  v3 = (void *)MEMORY[0x1E0CB37A0];
  if (self)
  {
    v4 = (void *)MEMORY[0x1E0CB3940];
    v5 = self;
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@: %p>"), v7, v5);
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = CFSTR("(nil)");
  }
  objc_msgSend(v3, "stringWithString:", v8);
  v17 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)v13[5], "appendString:", CFSTR(" [ "));
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __39___UIContextMenuLinkedList_description__block_invoke;
  v11[3] = &unk_1E16B2628;
  v11[4] = self;
  v11[5] = &v12;
  -[_UIContextMenuLinkedList enumerateNodes:](self, "enumerateNodes:", v11);
  objc_msgSend((id)v13[5], "appendString:", CFSTR(" ]"));
  v9 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v9;
}

- (NSMutableArray)nodes
{
  return self->_nodes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nodes, 0);
}

@end
