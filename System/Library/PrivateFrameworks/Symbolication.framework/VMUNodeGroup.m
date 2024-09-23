@implementation VMUNodeGroup

- (VMUNodeGroup)initWithName:(id)a3 graph:(id)a4
{
  id v6;
  unsigned int v7;

  objc_storeStrong((id *)&self->_name, a3);
  v6 = a4;
  v7 = objc_msgSend(v6, "nodeNamespaceSize");

  self->_nodeNamespaceSize = v7;
  self->_singleNode = -1;
  return self;
}

- (void)dealloc
{
  void *group;
  objc_super v4;

  group = self->_group;
  if (group)
    free(group);
  v4.receiver = self;
  v4.super_class = (Class)VMUNodeGroup;
  -[VMUNodeGroup dealloc](&v4, sel_dealloc);
}

- (void)_createGroup
{
  unsigned int nodeNamespaceSize;
  _DWORD *v4;
  unint64_t count;
  unint64_t i;
  _DWORD *group;
  unint64_t v8;

  if (!self->_group)
  {
    nodeNamespaceSize = self->_nodeNamespaceSize;
    v4 = malloc_type_calloc(1uLL, ((nodeNamespaceSize + 7) >> 3) + 4, 0xFF42C4F3uLL);
    *v4 = nodeNamespaceSize;
    self->_group = v4;
    count = self->_count;
    if ((_DWORD)count)
    {
      for (i = 0; i < count; ++i)
      {
        group = self->_group;
        v8 = self->_inlineNodes[i];
        if (*group > v8)
        {
          *((_BYTE *)group + (v8 >> 3) + 4) |= 1 << (v8 & 7);
          count = self->_count;
        }
      }
    }
  }
}

- (void)addNode:(unsigned int)a3
{
  unsigned int count;
  unsigned int *inlineNodes;
  uint64_t v7;
  int v8;
  uint64_t v9;
  unsigned int *group;
  uint64_t v11;
  int v12;
  int v13;
  unsigned int v14;
  unsigned int *p_singleNode;

  if (!self->_group)
  {
    count = self->_count;
    if (count <= 0xF)
    {
      if (count)
      {
        inlineNodes = self->_inlineNodes;
        v7 = self->_count;
        while (1)
        {
          v8 = *inlineNodes++;
          if (v8 == a3)
            return;
          if (!--v7)
          {
            v9 = self->_count;
            goto LABEL_14;
          }
        }
      }
      v9 = 0;
LABEL_14:
      self->_count = count + 1;
      p_singleNode = &self->_inlineNodes[v9];
LABEL_15:
      *p_singleNode = a3;
      return;
    }
  }
  -[VMUNodeGroup _createGroup](self, "_createGroup");
  group = (unsigned int *)self->_group;
  if (*group > a3)
  {
    v11 = (a3 >> 3) + 4;
    v12 = *((unsigned __int8 *)group + v11);
    v13 = 1 << (a3 & 7);
    if ((v13 & v12) != 0)
      return;
    *((_BYTE *)group + v11) = v12 | v13;
  }
  v14 = self->_count;
  self->_count = v14 + 1;
  if (!v14)
  {
    p_singleNode = &self->_singleNode;
    goto LABEL_15;
  }
}

- (void)nodes
{
  -[VMUNodeGroup _createGroup](self, "_createGroup");
  return self->_group;
}

- (int64_t)count
{
  return self->_count;
}

- (void)enumerateNodesWithBlock:(id)a3
{
  id v4;
  void (**v5)(_QWORD, _QWORD, _QWORD);
  unsigned int *group;
  _QWORD *v7;
  unsigned int v8;
  uint64_t v9;
  char *v10;
  unsigned int v11;
  uint64_t v12;
  unint64_t v13;
  void *v14;
  _QWORD v15[2];
  void (*v16)(uint64_t);
  void *v17;
  id v18;
  char v19;

  v4 = a3;
  v5 = (void (**)(_QWORD, _QWORD, _QWORD))v4;
  group = (unsigned int *)self->_group;
  if (group)
  {
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v16 = __40__VMUNodeGroup_enumerateNodesWithBlock___block_invoke;
    v17 = &unk_1E4E035F0;
    v18 = v4;
    v7 = v15;
    v8 = *group;
    if (*group)
    {
      v9 = 0;
      do
      {
        v10 = (char *)group + (v9 >> 3);
        v11 = v10[4];
        v12 = v9;
        if (v10[4])
        {
          do
          {
            if ((v11 & 1) != 0)
              ((void (*)(_QWORD *, uint64_t))v16)(v7, v12);
            if (v11 < 2)
              break;
            v12 = (v12 + 1);
            v11 >>= 1;
          }
          while (v12 < v8);
        }
        v9 = (v9 + 8);
      }
      while (v9 < v8);
    }

  }
  else if (self->_count)
  {
    v13 = 0;
    do
    {
      v14 = (void *)MEMORY[0x1A85A9758]();
      v19 = 0;
      ((void (**)(_QWORD, _QWORD, char *))v5)[2](v5, self->_inlineNodes[v13], &v19);
      objc_autoreleasePoolPop(v14);
      ++v13;
    }
    while (v13 < self->_count);
  }

}

void __40__VMUNodeGroup_enumerateNodesWithBlock___block_invoke(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x1A85A9758]();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  objc_autoreleasePoolPop(v2);
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 96, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
}

@end
