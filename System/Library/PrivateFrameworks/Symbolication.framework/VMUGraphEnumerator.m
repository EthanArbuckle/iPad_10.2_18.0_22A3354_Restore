@implementation VMUGraphEnumerator

- (VMUGraphEnumerator)initWithGraph:(id)a3
{
  VMUProcessObjectGraph *v4;
  VMUGraphEnumerator *v5;
  VMUProcessObjectGraph *graph;

  v4 = (VMUProcessObjectGraph *)a3;
  v5 = -[VMUGraphEnumerator init](self, "init");
  graph = v5->_graph;
  v5->_graph = v4;

  return v5;
}

- (void)enumerateEdgesOfNode:(unsigned int)a3 withBlock:(id)a4
{
  -[VMUDirectedGraph enumerateEdgesOfNode:withBlock:](self->_graph, "enumerateEdgesOfNode:withBlock:", *(_QWORD *)&a3, a4);
}

- (void)enumerateDestinationsOfNode:(unsigned int)a3 groupedBy:(id)a4 withBlock:(id)a5
{
  uint64_t v6;
  VMUProcessObjectGraph *graph;
  id v9;
  id v10;
  _DWORD *v11;
  uint64_t v12;
  _QWORD v13[5];

  v6 = *(_QWORD *)&a3;
  graph = self->_graph;
  v9 = a5;
  v10 = a4;
  LODWORD(graph) = -[VMUDirectedGraph nodeNamespaceSize](graph, "nodeNamespaceSize");
  v11 = malloc_type_calloc(1uLL, (((_DWORD)graph + 7) >> 3) + 4, 0xFF42C4F3uLL);
  v12 = MEMORY[0x1E0C809B0];
  *v11 = (_DWORD)graph;
  v13[0] = v12;
  v13[1] = 3221225472;
  v13[2] = __70__VMUGraphEnumerator_enumerateDestinationsOfNode_groupedBy_withBlock___block_invoke;
  v13[3] = &__block_descriptor_40_e18_v28__0I8I12I16_B20l;
  v13[4] = v11;
  -[VMUGraphEnumerator enumerateEdgesOfNode:withBlock:](self, "enumerateEdgesOfNode:withBlock:", v6, v13);
  objc_msgSend(v10, "enumerateGroups:withBlock:", v11, v9);

  free(v11);
}

uint64_t __70__VMUGraphEnumerator_enumerateDestinationsOfNode_groupedBy_withBlock___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, unsigned int a4)
{
  unsigned int *v4;

  v4 = *(unsigned int **)(result + 32);
  if (*v4 > a4)
    *((_BYTE *)v4 + (a4 >> 3) + 4) |= 1 << (a4 & 7);
  return result;
}

- (void)enumerateDestinationsOfNodes:(void *)a3 groupedBy:(id)a4 withBlock:(id)a5
{
  id v8;
  id v9;
  void *v10;

  v8 = a5;
  v9 = a4;
  v10 = -[VMUGraphEnumerator destinationsOfNodes:](self, "destinationsOfNodes:", a3);
  objc_msgSend(v9, "enumerateGroups:withBlock:", v10, v8);

  free(v10);
}

- (void)enumerateDestinationsOfGroup:(id)a3 groupedBy:(id)a4 withBlock:(id)a5
{
  id v8;
  id v9;
  void *v10;

  v8 = a5;
  v9 = a4;
  v10 = -[VMUGraphEnumerator destinationsOfGroup:](self, "destinationsOfGroup:", a3);
  objc_msgSend(v9, "enumerateGroups:withBlock:", v10, v8);

  free(v10);
}

- (void)destinationsOfNodes:(void *)a3
{
  unsigned int v5;
  _DWORD *v6;
  _QWORD *v7;
  unsigned int v8;
  uint64_t v9;
  char *v10;
  unsigned int v11;
  uint64_t v12;
  _QWORD v14[2];
  uint64_t (*v15)(uint64_t, uint64_t);
  void *v16;
  VMUGraphEnumerator *v17;
  _DWORD *v18;

  v5 = -[VMUDirectedGraph nodeNamespaceSize](self->_graph, "nodeNamespaceSize");
  v6 = malloc_type_calloc(1uLL, ((v5 + 7) >> 3) + 4, 0xFF42C4F3uLL);
  *v6 = v5;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v15 = __42__VMUGraphEnumerator_destinationsOfNodes___block_invoke;
  v16 = &unk_1E4E01BD8;
  v17 = self;
  v18 = v6;
  v7 = v14;
  v8 = *(_DWORD *)a3;
  if (*(_DWORD *)a3)
  {
    v9 = 0;
    do
    {
      v10 = (char *)a3 + (v9 >> 3);
      v11 = v10[4];
      v12 = v9;
      if (v10[4])
      {
        do
        {
          if ((v11 & 1) != 0)
            v15((uint64_t)v7, v12);
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

  return v6;
}

uint64_t __42__VMUGraphEnumerator_destinationsOfNodes___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __42__VMUGraphEnumerator_destinationsOfNodes___block_invoke_2;
  v4[3] = &__block_descriptor_40_e18_v28__0I8I12I16_B20l;
  v2 = *(void **)(a1 + 32);
  v4[4] = *(_QWORD *)(a1 + 40);
  return objc_msgSend(v2, "enumerateEdgesOfNode:withBlock:", a2, v4);
}

uint64_t __42__VMUGraphEnumerator_destinationsOfNodes___block_invoke_2(uint64_t result, uint64_t a2, uint64_t a3, unsigned int a4)
{
  unsigned int *v4;

  v4 = *(unsigned int **)(result + 32);
  if (*v4 > a4)
    *((_BYTE *)v4 + (a4 >> 3) + 4) |= 1 << (a4 & 7);
  return result;
}

- (void)destinationsOfGroup:(id)a3
{
  VMUProcessObjectGraph *graph;
  id v5;
  _DWORD *v6;
  _QWORD v8[6];

  graph = self->_graph;
  v5 = a3;
  LODWORD(graph) = -[VMUDirectedGraph nodeNamespaceSize](graph, "nodeNamespaceSize");
  v6 = malloc_type_calloc(1uLL, (((_DWORD)graph + 7) >> 3) + 4, 0xFF42C4F3uLL);
  *v6 = (_DWORD)graph;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __42__VMUGraphEnumerator_destinationsOfGroup___block_invoke;
  v8[3] = &unk_1E4E01C00;
  v8[4] = self;
  v8[5] = v6;
  objc_msgSend(v5, "enumerateNodesWithBlock:", v8);

  return v6;
}

uint64_t __42__VMUGraphEnumerator_destinationsOfGroup___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __42__VMUGraphEnumerator_destinationsOfGroup___block_invoke_2;
  v4[3] = &__block_descriptor_40_e18_v28__0I8I12I16_B20l;
  v2 = *(void **)(a1 + 32);
  v4[4] = *(_QWORD *)(a1 + 40);
  return objc_msgSend(v2, "enumerateEdgesOfNode:withBlock:", a2, v4);
}

uint64_t __42__VMUGraphEnumerator_destinationsOfGroup___block_invoke_2(uint64_t result, uint64_t a2, uint64_t a3, unsigned int a4)
{
  unsigned int *v4;

  v4 = *(unsigned int **)(result + 32);
  if (*v4 > a4)
    *((_BYTE *)v4 + (a4 >> 3) + 4) |= 1 << (a4 & 7);
  return result;
}

- (id)statusDisplayDescription
{
  return CFSTR("forward");
}

- (unsigned)buildReversePostOrderWithRoots:(void *)a3
{
  VMUProcessObjectGraph *v5;
  VMUGraphEnumerator *v6;
  unsigned int v7;
  _DWORD *v8;
  size_t v9;
  void *v10;
  size_t v11;
  void *v12;
  VMUGraphEnumerator *v13;
  _QWORD *v14;
  unsigned int v15;
  unsigned int v16;
  int v17;
  char *v18;
  unsigned int v19;
  unsigned int v20;
  void *v23;
  VMUProcessObjectGraph *v24;
  _QWORD v25[2];
  void (*v26)(uint64_t, int);
  void *v27;
  VMUGraphEnumerator *v28;
  _QWORD *v29;
  void *v30;
  _DWORD *v31;
  void *v32;
  _QWORD __pattern4[3];
  int v34;

  v5 = self->_graph;
  v6 = self;
  v7 = -[VMUDirectedGraph nodeNamespaceSize](v5, "nodeNamespaceSize");
  v8 = malloc_type_calloc(1uLL, ((v7 + 7) >> 3) + 4, 0xFF42C4F3uLL);
  *v8 = v7;
  v9 = 4 * -[VMUDirectedGraph nodeNamespaceSize](v5, "nodeNamespaceSize");
  v10 = malloc_type_malloc(v9, 0x100004052888210uLL);
  LODWORD(__pattern4[0]) = -1;
  memset_pattern4(v10, __pattern4, v9);
  v24 = v5;
  v11 = 4 * -[VMUDirectedGraph nodeNamespaceSize](v5, "nodeNamespaceSize");
  v12 = malloc_type_malloc(v11, 0x100004052888210uLL);
  LODWORD(__pattern4[0]) = -1;
  memset_pattern4(v12, __pattern4, v11);
  __pattern4[0] = 0;
  __pattern4[1] = __pattern4;
  __pattern4[2] = 0x2020000000;
  v34 = 0;
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v26 = __53__VMUGraphEnumerator_buildReversePostOrderWithRoots___block_invoke;
  v27 = &unk_1E4E01C50;
  v23 = v8;
  v31 = v8;
  v32 = v12;
  v29 = __pattern4;
  v30 = v10;
  v13 = v6;
  v28 = v13;
  v14 = v25;
  v15 = *(_DWORD *)a3;
  if (*(_DWORD *)a3)
  {
    v16 = 0;
    v17 = 1;
    do
    {
      v18 = (char *)a3 + (v16 >> 3);
      v19 = v18[4];
      v20 = v17;
      if (v18[4])
      {
        do
        {
          if ((v19 & 1) != 0)
            v26((uint64_t)v14, v20 - 1);
          if (v19 < 2)
            break;
          v19 >>= 1;
        }
        while (v20++ < v15);
      }
      v16 += 8;
      v17 += 8;
    }
    while (v16 < v15);
  }

  free(v10);
  free(v23);

  _Block_object_dispose(__pattern4, 8);
  return (unsigned int *)v12;
}

void __53__VMUGraphEnumerator_buildReversePostOrderWithRoots___block_invoke(uint64_t a1, int a2)
{
  _DWORD *v2;
  uint64_t *v3;
  int v4;
  uint64_t v6;
  uint64_t v7;
  unsigned int v8;
  unint64_t v9;
  _DWORD *v10;
  uint64_t v11;
  int v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  int v20;

  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v2 = *(_DWORD **)(a1 + 48);
  v20 = 1;
  *v2 = a2;
  v3 = v18;
  v4 = *((_DWORD *)v18 + 6);
  if (v4)
  {
    v6 = MEMORY[0x1E0C809B0];
    while (1)
    {
      v7 = *(_QWORD *)(a1 + 48);
      v8 = v4 - 1;
      *((_DWORD *)v3 + 6) = v8;
      v9 = *(unsigned int *)(v7 + 4 * v8);
      v10 = *(_DWORD **)(a1 + 56);
      if (*v10 <= v9)
        goto LABEL_6;
      v11 = (v9 >> 3) + 4;
      v12 = *((unsigned __int8 *)v10 + v11);
      v13 = 1 << (v9 & 7);
      if ((v13 & v12) == 0)
        break;
LABEL_7:
      v4 = *((_DWORD *)v3 + 6);
      if (!v4)
        goto LABEL_8;
    }
    *((_BYTE *)v10 + v11) = v12 | v13;
    v7 = *(_QWORD *)(a1 + 48);
LABEL_6:
    v14 = *(_QWORD *)(a1 + 64);
    v15 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v16 = *(unsigned int *)(v15 + 24);
    *(_DWORD *)(v15 + 24) = v16 + 1;
    *(_DWORD *)(v14 + 4 * v16) = v9;
    objc_msgSend(*(id *)(a1 + 32), "enumerateEdgesOfNode:withBlock:", v6, 3221225472, __53__VMUGraphEnumerator_buildReversePostOrderWithRoots___block_invoke_2, &unk_1E4E01C28, &v17, v7);
    v3 = v18;
    goto LABEL_7;
  }
LABEL_8:
  _Block_object_dispose(&v17, 8);
}

uint64_t __53__VMUGraphEnumerator_buildReversePostOrderWithRoots___block_invoke_2(uint64_t result, uint64_t a2, uint64_t a3, int a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = *(_QWORD *)(result + 40);
  v5 = *(_QWORD *)(*(_QWORD *)(result + 32) + 8);
  v6 = *(unsigned int *)(v5 + 24);
  *(_DWORD *)(v5 + 24) = v6 + 1;
  *(_DWORD *)(v4 + 4 * v6) = a4;
  return result;
}

- (VMUProcessObjectGraph)graph
{
  return (VMUProcessObjectGraph *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_graph, 0);
}

@end
