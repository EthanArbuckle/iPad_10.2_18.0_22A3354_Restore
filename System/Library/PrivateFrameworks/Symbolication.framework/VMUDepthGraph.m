@implementation VMUDepthGraph

- (VMUDepthGraph)initWithGraph:(id)a3
{
  objc_storeStrong((id *)&self->_graph, a3);
  -[VMUDepthGraph _buildDepthMap](self, "_buildDepthMap");
  return self;
}

- (void)dealloc
{
  objc_super v3;

  free(self->_depthMap);
  v3.receiver = self;
  v3.super_class = (Class)VMUDepthGraph;
  -[VMUDepthGraph dealloc](&v3, sel_dealloc);
}

- (unsigned)depthOfNode:(unsigned int)a3
{
  return self->_depthMap[a3];
}

- (int64_t)markNodes:(void *)a3 atDepth:(unsigned int)a4
{
  int v7;
  int v8;
  unint64_t v9;
  int64_t result;

  v7 = -[VMUDirectedGraph nodeNamespaceSize](self->_graph, "nodeNamespaceSize");
  if (v7 < 1)
    return 0;
  v8 = v7;
  v9 = 0;
  result = 0;
  do
  {
    if (self->_depthMap[v9] == a4)
    {
      ++result;
      if (v9 < *(unsigned int *)a3)
        *((_BYTE *)a3 + (v9 >> 3) + 4) |= 1 << (v9 & 7);
    }
    ++v9;
  }
  while (v8 != v9);
  return result;
}

- (void)_processNodes:(void *)a3 withDepth:(unsigned int)a4
{
  _QWORD *v5;
  unsigned int v6;
  uint64_t v7;
  char *v8;
  unsigned int v9;
  uint64_t v10;
  _QWORD v11[2];
  uint64_t (*v12)(uint64_t, unsigned int);
  void *v13;
  VMUDepthGraph *v14;
  unsigned int v15;

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v12 = __41__VMUDepthGraph__processNodes_withDepth___block_invoke;
  v13 = &unk_1E4E023A0;
  v14 = self;
  v15 = a4;
  v5 = v11;
  v6 = *(_DWORD *)a3;
  if (*(_DWORD *)a3)
  {
    v7 = 0;
    do
    {
      v8 = (char *)a3 + (v7 >> 3);
      v9 = v8[4];
      v10 = v7;
      if (v8[4])
      {
        do
        {
          if ((v9 & 1) != 0)
            v12((uint64_t)v5, v10);
          if (v9 < 2)
            break;
          v10 = (v10 + 1);
          v9 >>= 1;
        }
        while (v10 < v6);
      }
      v7 = (v7 + 8);
    }
    while (v7 < v6);
  }

}

uint64_t __41__VMUDepthGraph__processNodes_withDepth___block_invoke(uint64_t result, unsigned int a2)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 16) + 4 * a2) = *(_DWORD *)(result + 40);
  return result;
}

- (void)_buildNextDepth:(id)a3 into:(id)a4 depth:(unsigned int)a5
{
  id v8;
  id v9;
  VMUProcessObjectGraph *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id obj;
  _QWORD v17[5];
  id v18;
  unsigned int v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = self->_graph;
  objc_msgSend(v9, "removeAllObjects");
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  obj = v8;
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v21;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v21 != v13)
          objc_enumerationMutation(obj);
        v15 = objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v14), "intValue");
        v17[0] = MEMORY[0x1E0C809B0];
        v17[1] = 3221225472;
        v17[2] = __44__VMUDepthGraph__buildNextDepth_into_depth___block_invoke;
        v17[3] = &unk_1E4E023C8;
        v17[4] = self;
        v19 = a5;
        v18 = v9;
        -[VMUDirectedGraph enumerateEdgesOfNode:withBlock:](v10, "enumerateEdgesOfNode:withBlock:", v15, v17);

        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v12);
  }

}

void __44__VMUDepthGraph__buildNextDepth_into_depth___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  void *v5;
  id v6;

  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
  if (*(_DWORD *)(v4 + 4 * a4) == -1)
  {
    *(_DWORD *)(v4 + 4 * a4) = *(_DWORD *)(a1 + 48);
    v5 = *(void **)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a4);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v6);

  }
}

- (void)_buildDepthMap
{
  VMUProcessObjectGraph *v3;
  size_t v4;
  void *v5;
  unsigned int *v6;
  id v7;
  id v8;
  id v9;
  _QWORD *v10;
  unsigned int v11;
  uint64_t v12;
  char *v13;
  unsigned int v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  id v18;
  _QWORD v19[2];
  void (*v20)(uint64_t, uint64_t);
  void *v21;
  id v22;
  VMUDepthGraph *v23;
  int __pattern4;

  v3 = self->_graph;
  v4 = 4 * -[VMUDirectedGraph nodeNamespaceSize](v3, "nodeNamespaceSize");
  v5 = malloc_type_malloc(v4, 0x100004052888210uLL);
  __pattern4 = -1;
  memset_pattern4(v5, &__pattern4, v4);
  self->_depthMap = (unsigned int *)v5;
  LODWORD(v4) = -[VMUDirectedGraph nodeNamespaceSize](v3, "nodeNamespaceSize");
  v6 = (unsigned int *)malloc_type_calloc(1uLL, ((v4 + 7) >> 3) + 4, 0xFF42C4F3uLL);
  *v6 = v4;
  -[VMUProcessObjectGraph markRootNodes:](v3, "markRootNodes:", v6);
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v20 = __31__VMUDepthGraph__buildDepthMap__block_invoke;
  v21 = &unk_1E4E023F0;
  v9 = v7;
  v22 = v9;
  v23 = self;
  v10 = v19;
  v11 = *v6;
  if (*v6)
  {
    v12 = 0;
    do
    {
      v13 = (char *)v6 + (v12 >> 3);
      v14 = v13[4];
      v15 = v12;
      if (v13[4])
      {
        do
        {
          if ((v14 & 1) != 0)
            v20((uint64_t)v10, v15);
          if (v14 < 2)
            break;
          v15 = (v15 + 1);
          v14 >>= 1;
        }
        while (v15 < v11);
      }
      v12 = (v12 + 8);
    }
    while (v12 < v11);
  }

  free(v6);
  v16 = 1;
  do
  {
    if ((v16 & 1) != 0)
    {
      v17 = v9;
      v18 = v8;
    }
    else
    {
      v17 = v8;
      v18 = v9;
    }
    -[VMUDepthGraph _buildNextDepth:into:depth:](self, "_buildNextDepth:into:depth:", v17, v18, v16);
    v16 = (v16 + 1);
  }
  while (objc_msgSend(v9, "count"));

}

void __31__VMUDepthGraph__buildDepthMap__block_invoke(uint64_t a1, uint64_t a2)
{
  unsigned int v2;
  void *v4;
  void *v5;

  v2 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v5);

  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 16) + 4 * v2) = 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_graph, 0);
}

@end
