@implementation VMUDominatorCallTreeCreator

- (void)removeJunkEdges
{
  unsigned int v3;
  _DWORD *v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  VMUProcessObjectGraph *processObjectGraph;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void *v15;
  id v16;
  id v17;
  _QWORD *v18;
  _QWORD *v19;
  _QWORD v20[5];
  id v21;
  _DWORD *v22;
  _QWORD v23[7];
  _QWORD v24[3];
  int v25;
  _QWORD v26[3];
  char v27;

  v3 = -[VMUDirectedGraph edgeNamespaceSize](self->_processObjectGraph, "edgeNamespaceSize");
  v4 = malloc_type_calloc(1uLL, ((v3 + 7) >> 3) + 4, 0xFF42C4F3uLL);
  *v4 = v3;
  -[VMUDirectedGraph invertedGraph](self->_processObjectGraph, "invertedGraph");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x2020000000;
  v27 = 0;
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x2020000000;
  v25 = 0;
  v6 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __46__VMUDominatorCallTreeCreator_removeJunkEdges__block_invoke;
  v23[3] = &unk_1E4E03A50;
  v23[4] = v26;
  v23[5] = v24;
  v23[6] = v4;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __46__VMUDominatorCallTreeCreator_removeJunkEdges__block_invoke_2;
  v20[3] = &unk_1E4E03A78;
  v22 = v4;
  v20[4] = self;
  v7 = (id)MEMORY[0x1A85A995C](v23);
  v21 = v7;
  v8 = (void *)MEMORY[0x1A85A995C](v20);
  processObjectGraph = self->_processObjectGraph;
  v12 = v6;
  v13 = 3221225472;
  v14 = __46__VMUDominatorCallTreeCreator_removeJunkEdges__block_invoke_3;
  v15 = &unk_1E4E03AA0;
  v18 = v24;
  v19 = v26;
  v10 = v5;
  v16 = v10;
  v11 = v8;
  v17 = v11;
  -[VMUDirectedGraph enumerateNodesWithBlock:](processObjectGraph, "enumerateNodesWithBlock:", &v12);
  -[VMUDirectedGraph removeMarkedEdges:](self->_processObjectGraph, "removeMarkedEdges:", v4, v12, v13, v14, v15);
  free(v4);

  _Block_object_dispose(v24, 8);
  _Block_object_dispose(v26, 8);

}

uint64_t __46__VMUDominatorCallTreeCreator_removeJunkEdges__block_invoke(_QWORD *a1, int a2, unsigned int a3)
{
  int v4;
  uint64_t result;
  unsigned int *v6;

  if (*(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24))
  {
    if ((a2 - 1) > 3)
      v4 = 0;
    else
      v4 = dword_1A4E21D40[a2 - 1];
    if ((*(_DWORD *)(*(_QWORD *)(a1[5] + 8) + 24) & v4) != 0)
    {
      v6 = (unsigned int *)a1[6];
      result = 1;
      if (*v6 > a3)
        *((_BYTE *)v6 + (a3 >> 3) + 4) |= 1 << (a3 & 7);
    }
    else
    {
      return 0;
    }
  }
  else
  {
    result = 0;
    *(_DWORD *)(*(_QWORD *)(a1[5] + 8) + 24) |= a2;
  }
  return result;
}

void __46__VMUDominatorCallTreeCreator_removeJunkEdges__block_invoke_2(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v7;
  _DWORD *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  char v16;
  void (*v17)(void);
  void *v18;
  int v19;
  void *v20;
  BOOL IsRoot;
  void *v22;
  uint64_t v23;
  _DWORD *v24;

  if ((_DWORD)a4 != (_DWORD)a3)
  {
    v7 = *(void **)(a1[4] + 32);
    if (v7)
      objc_msgSend(v7, "nodeDetails:", a4);
    v9 = 0;
    v10 = *(void **)(a1[4] + 32);
    if (v10)
      objc_msgSend(v10, "nodeDetails:", a3);
    v11 = 0;
    if (v9)
    {
      objc_msgSend(v9, "className");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("NSConcreteMutableData (Bytes Storage)"));

      if (v13)
        goto LABEL_25;
      objc_msgSend(v9, "className");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v14, "isEqualToString:", CFSTR("@autoreleasepool content")) & 1) != 0)
      {
        objc_msgSend(v11, "className");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "isEqualToString:", CFSTR("@autoreleasepool content"));

        if ((v16 & 1) == 0)
        {
          v17 = *(void (**)(void))(a1[5] + 16);
          goto LABEL_20;
        }
      }
      else
      {

      }
    }
    objc_msgSend(v11, "className");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "isEqualToString:", CFSTR("@autoreleasepool content"));

    if (!v19)
    {
LABEL_18:
      if (!VMUGraphNodeType_IsVMRegion(0))
      {
        v22 = *(void **)(a1[4] + 32);
        if (v22)
        {
          objc_msgSend(v22, "referenceInfoWithName:", a2);
          LOBYTE(v22) = 0;
        }
        if (VMUIsOwningReference((char)v22))
          v23 = 8;
        else
          v23 = 4;
        (*(void (**)(_QWORD, uint64_t, uint64_t))(a1[5] + 16))(a1[5], v23, a2);
        goto LABEL_29;
      }
      v17 = *(void (**)(void))(a1[5] + 16);
LABEL_20:
      v17();
LABEL_29:

      return;
    }
    objc_msgSend(v9, "className");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v20, "isEqualToString:", CFSTR("@autoreleasepool content")) & 1) != 0)
    {

      goto LABEL_18;
    }
    IsRoot = VMUGraphNodeType_IsRoot(0);

    if (IsRoot)
      goto LABEL_18;
LABEL_25:
    v24 = (_DWORD *)a1[6];
    if (*v24 > a2)
      *((_BYTE *)v24 + (a2 >> 3) + 4) |= 1 << (a2 & 7);
    goto LABEL_29;
  }
  v8 = (_DWORD *)a1[6];
  if (*v8 > a2)
    *((_BYTE *)v8 + (a2 >> 3) + 4) |= 1 << (a2 & 7);
}

uint64_t __46__VMUDominatorCallTreeCreator_removeJunkEdges__block_invoke_3(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
  objc_msgSend(*(id *)(a1 + 32), "enumerateEdgesOfNode:withBlock:", a2, *(_QWORD *)(a1 + 40));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
  return objc_msgSend(*(id *)(a1 + 32), "enumerateEdgesOfNode:withBlock:", a2, *(_QWORD *)(a1 + 40));
}

- (void)removeJunkNodes
{
  unsigned int v3;
  _DWORD *v4;
  VMUProcessObjectGraph *processObjectGraph;
  _QWORD v7[5];
  id v8;
  _DWORD *v9;

  v3 = -[VMUDirectedGraph nodeNamespaceSize](self->_processObjectGraph, "nodeNamespaceSize");
  v4 = malloc_type_calloc(1uLL, ((v3 + 7) >> 3) + 4, 0xFF42C4F3uLL);
  *v4 = v3;
  processObjectGraph = self->_processObjectGraph;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __46__VMUDominatorCallTreeCreator_removeJunkNodes__block_invoke_2;
  v7[3] = &unk_1E4E03AE8;
  v7[4] = self;
  v8 = &__block_literal_global_20;
  v9 = v4;
  -[VMUDirectedGraph enumerateNodesWithBlock:](processObjectGraph, "enumerateNodesWithBlock:", v7);
  -[VMUDirectedGraph removeMarkedNodes:](self->_processObjectGraph, "removeMarkedNodes:", v4);

  return v4;
}

BOOL __46__VMUDominatorCallTreeCreator_removeJunkNodes__block_invoke(uint64_t a1, void *a2)
{
  _DWORD *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _BOOL8 v10;
  void *v12;
  char v13;

  v2 = a2;
  if ((objc_msgSend(v2, "isSubmap") & 1) != 0)
    goto LABEL_17;
  objc_msgSend(v2, "type");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "hasSuffix:", CFSTR("Foundation")))
    goto LABEL_16;
  objc_msgSend(v2, "type");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "hasSuffix:", CFSTR("Kernel Alloc Once")))
  {
LABEL_15:

LABEL_16:
    goto LABEL_17;
  }
  objc_msgSend(v2, "type");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "hasSuffix:", CFSTR("MALLOC metadata")) & 1) != 0
    || (objc_msgSend(v2, "isOwnedUnmappedMemory") & 1) != 0)
  {
LABEL_14:

    goto LABEL_15;
  }
  objc_msgSend(v2, "type");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "hasSuffix:", CFSTR("SQLite page cache")) & 1) != 0)
  {
LABEL_13:

    goto LABEL_14;
  }
  objc_msgSend(v2, "type");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "hasSuffix:", CFSTR("__AUTH")) & 1) != 0)
  {
LABEL_12:

    goto LABEL_13;
  }
  objc_msgSend(v2, "type");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "hasSuffix:", CFSTR("__AUTH_CONST")) & 1) != 0)
  {
LABEL_11:

    goto LABEL_12;
  }
  objc_msgSend(v2, "type");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v9, "hasSuffix:", CFSTR("mapped file")) & 1) != 0)
  {

    goto LABEL_11;
  }
  objc_msgSend(v2, "type");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "hasSuffix:", CFSTR("shared memory"));

  if ((v13 & 1) == 0 && (objc_msgSend(v2, "protection") & 2) != 0)
  {
    v10 = (v2[13] - 1) < 2;
    goto LABEL_18;
  }
LABEL_17:
  v10 = 1;
LABEL_18:

  return v10;
}

void __46__VMUDominatorCallTreeCreator_removeJunkNodes__block_invoke_2(_QWORD *a1, uint64_t a2)
{
  void *v4;
  void *v5;
  _DWORD *v6;
  _DWORD *v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;

  v8 = 0;
  v9 = 0;
  v10 = 0;
  v4 = *(void **)(a1[4] + 32);
  if (v4)
  {
    objc_msgSend(v4, "nodeDetails:", a2);
    v4 = (void *)(v9 >> 60);
  }
  if (VMUGraphNodeType_IsVMRegion((int)v4))
  {
    objc_msgSend(*(id *)(a1[4] + 32), "vmuVMRegionForNode:", a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5 && (*(unsigned int (**)(void))(a1[5] + 16))())
    {
      v6 = (_DWORD *)a1[6];
      if (*v6 > a2)
        *((_BYTE *)v6 + (a2 >> 3) + 4) |= 1 << (a2 & 7);
    }

  }
  else if (v9 == 0x1000000000000000)
  {
    v7 = (_DWORD *)a1[6];
    if (*v7 > a2)
      *((_BYTE *)v7 + (a2 >> 3) + 4) |= 1 << (a2 & 7);
  }
}

- (unint64_t)sizeForNodeName:(unsigned int)a3 nodeInfo:(id)a4
{
  unint64_t v5;
  uint64_t v6;
  _QWORD *v8;
  unint64_t v9;
  unint64_t v10;
  BOOL v11;
  unint64_t v12;
  unint64_t v13;

  v5 = *(_QWORD *)(a4.var0 + 8);
  if (self->_showRegionVirtualSize)
    return v5 & 0xFFFFFFFFFFFFFFFLL;
  v6 = *(_QWORD *)&a3;
  if (!VMUGraphNodeType_IsVMRegion(v5 >> 60))
    return v5 & 0xFFFFFFFFFFFFFFFLL;
  -[VMUProcessObjectGraph vmuVMRegionForNode:](self->_processObjectGraph, "vmuVMRegionForNode:", v6);
  v8 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  v9 = v8[22] + v8[23];
  v10 = v8[24];
  v11 = v9 >= v10;
  v12 = v9 - v10;
  if (v11)
    v13 = v12;
  else
    v13 = 0;

  return v13;
}

- (id)callTreeWithGraph:(id)a3 groupByType:(BOOL)a4 showRegionVirtualSize:(BOOL)a5 debugTimer:(id)a6
{
  id v10;
  id v11;
  void *v12;
  VMUDominatorGraph *v13;
  id v14;
  VMUDominatorGraph *dominatorGraph;
  id v16;
  VMUCallTreeRoot *v17;
  void *v18;
  void *v19;
  VMUCallTreeRoot *v20;
  _QWORD v22[4];
  id v23;

  v10 = a3;
  v11 = a6;
  v12 = (void *)MEMORY[0x1A85A9758]();
  -[VMUDominatorCallTreeCreator setProcessObjectGraph:](self, "setProcessObjectGraph:", v10);
  self->_showRegionVirtualSize = a5;
  self->_groupByType = a4;
  objc_storeStrong((id *)&self->_debugTimer, a6);
  objc_msgSend(v11, "startWithMessage:", "remove junk nodes from object graph");
  self->_visitedNodes = -[VMUDominatorCallTreeCreator removeJunkNodes](self, "removeJunkNodes");
  objc_msgSend(v11, "startWithMessage:", "remove junk edges from object graph");
  -[VMUDominatorCallTreeCreator removeJunkEdges](self, "removeJunkEdges");
  objc_msgSend(v11, "startWithMessage:", "create dominator graph");
  v13 = -[VMUDominatorGraph initWithGraph:debugTimer:]([VMUDominatorGraph alloc], "initWithGraph:debugTimer:", v10, v11);
  -[VMUDominatorCallTreeCreator setDominatorGraph:](self, "setDominatorGraph:", v13);

  -[VMUDebugTimer startWithMessage:](self->_debugTimer, "startWithMessage:", "select all dominator roots as roots of the tree");
  v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  dominatorGraph = self->_dominatorGraph;
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __94__VMUDominatorCallTreeCreator_callTreeWithGraph_groupByType_showRegionVirtualSize_debugTimer___block_invoke;
  v22[3] = &unk_1E4E03B10;
  v16 = v14;
  v23 = v16;
  -[VMUDominatorGraph enumerateDominatorRootsWithBlock:](dominatorGraph, "enumerateDominatorRootsWithBlock:", v22);
  v17 = -[VMUCallTreeRoot initWithSymbolicator:sampler:options:]([VMUCallTreeRoot alloc], "initWithSymbolicator:sampler:options:", 0, 0, 0, 0);
  -[VMUDominatorCallTreeCreator setCallTreeRoot:](self, "setCallTreeRoot:", v17);

  -[VMUDebugTimer startWithMessage:](self->_debugTimer, "startWithMessage:", "build tree from selected nodes");
  -[VMUDominatorCallTreeCreator buildCallTreeWithRootNodeNames:](self, "buildCallTreeWithRootNodeNames:", v16);
  -[VMUDominatorCallTreeCreator desiredAddress](self, "desiredAddress");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v18)
  {
    -[VMUDominatorCallTreeCreator desiredClassesPattern](self, "desiredClassesPattern");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
      goto LABEL_4;
    -[VMUDebugTimer startWithMessage:](self->_debugTimer, "startWithMessage:", "add remaining nodes to tree");
    -[VMUDominatorCallTreeCreator remainingNodeNames](self, "remainingNodeNames");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[VMUDominatorCallTreeCreator buildCallTreeWithRootNodeNames:](self, "buildCallTreeWithRootNodeNames:", v18);
  }

LABEL_4:
  free(self->_visitedNodes);
  objc_msgSend(v11, "startWithMessage:", "add child counts");
  -[VMUCallTreeRoot addChildCountsIntoNode](self->_callTreeRoot, "addChildCountsIntoNode");
  v20 = self->_callTreeRoot;

  objc_autoreleasePoolPop(v12);
  return v20;
}

void __94__VMUDominatorCallTreeCreator_callTreeWithGraph_groupByType_showRegionVirtualSize_debugTimer___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

- (void)buildCallTreeWithRootNodeNames:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _QWORD *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  VMUProcessObjectGraph *processObjectGraph;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _QWORD v21[5];
  _QWORD v22[5];
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[VMUDominatorCallTreeCreator desiredAddress](self, "desiredAddress");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[VMUDominatorCallTreeCreator desiredAddress](self, "desiredAddress");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "unsignedIntegerValue");

    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __62__VMUDominatorCallTreeCreator_buildCallTreeWithRootNodeNames___block_invoke;
    v22[3] = &__block_descriptor_40_e21_B36__0I8___Qb60b4__12l;
    v22[4] = v7;
    v8 = v22;
  }
  else
  {
    -[VMUDominatorCallTreeCreator desiredClassesPattern](self, "desiredClassesPattern");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
      goto LABEL_6;
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __62__VMUDominatorCallTreeCreator_buildCallTreeWithRootNodeNames___block_invoke_2;
    v21[3] = &unk_1E4E03B58;
    v21[4] = self;
    v8 = v21;
  }
  v9 = (void *)MEMORY[0x1A85A995C](v8);
LABEL_6:
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v10 = v4;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v18 != v13)
          objc_enumerationMutation(v10);
        v15 = objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * i), "unsignedIntValue");
        processObjectGraph = self->_processObjectGraph;
        if (processObjectGraph)
          -[VMUObjectGraph nodeDetails:](processObjectGraph, "nodeDetails:", v15);
        if (-[VMUDominatorGraph hasAnyDirectDomineesForNodeName:](self->_dominatorGraph, "hasAnyDirectDomineesForNodeName:", v15))
        {
          -[VMUDominatorCallTreeCreator buildCallTreeWithNodeName:callTreeParentNode:parentNodeName:parentNodeType:reference:rootNodeFilter:](self, "buildCallTreeWithNodeName:callTreeParentNode:parentNodeName:parentNodeType:reference:rootNodeFilter:", v15, self->_callTreeRoot, 0xFFFFFFFFLL, 0, 0, v9);
        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
    }
    while (v12);
  }

}

BOOL __62__VMUDominatorCallTreeCreator_buildCallTreeWithRootNodeNames___block_invoke(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  return *a3 == *(_QWORD *)(a1 + 32);
}

uint64_t __62__VMUDominatorCallTreeCreator_buildCallTreeWithRootNodeNames___block_invoke_2(uint64_t a1, uint64_t a2, __int128 *a3)
{
  void *v5;
  void *v6;
  uint64_t v7;
  __int128 v9;
  uint64_t v10;

  if (*((_QWORD *)a3 + 1) >> 60 == 1)
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "nodeDescription:", a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(*(id *)(a1 + 32), "desiredClassesPattern");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *a3;
  v10 = *((_QWORD *)a3 + 2);
  v7 = objc_msgSend(v6, "matchesNodeDetails:orNodeDescription:", &v9, v5);

  return v7;
}

- (id)remainingNodeNames
{
  id v3;
  unsigned int *visitedNodes;
  id v5;
  _QWORD *v6;
  unsigned int v7;
  uint64_t v8;
  unsigned int v9;
  unsigned int v10;
  unsigned int v11;
  uint64_t v12;
  unsigned int v13;
  void *v15;
  id v16;
  _QWORD v18[2];
  void (*v19)(uint64_t, uint64_t);
  void *v20;
  VMUDominatorCallTreeCreator *v21;
  id v22;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  visitedNodes = (unsigned int *)self->_visitedNodes;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v19 = __49__VMUDominatorCallTreeCreator_remainingNodeNames__block_invoke;
  v20 = &unk_1E4E023F0;
  v21 = self;
  v5 = v3;
  v22 = v5;
  v6 = v18;
  v7 = *visitedNodes;
  if (*visitedNodes)
  {
    v8 = 0;
    v9 = 8;
    do
    {
      if (v7 >= v9)
        v10 = v9;
      else
        v10 = v7;
      v11 = *((unsigned __int8 *)visitedNodes + (v8 >> 3) + 4);
      v12 = (v8 + 8);
      if (v12 >= v7)
        v13 = v7;
      else
        v13 = v8 + 8;
      if (v11 != 255 && v8 < v13)
      {
        do
        {
          if ((v11 & 1) == 0)
            v19((uint64_t)v6, v8);
          v8 = (v8 + 1);
          v11 >>= 1;
        }
        while (v10 != (_DWORD)v8);
      }
      v9 += 8;
      v8 = v12;
    }
    while (v12 < v7);
  }

  v15 = v22;
  v16 = v5;

  return v16;
}

void __49__VMUDominatorCallTreeCreator_remainingNodeNames__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;

  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "isNodePresent:", a2))
  {
    if ((v7 = 0, v8 = 0, v9 = 0, (v4 = *(void **)(*(_QWORD *)(a1 + 32) + 32)) != 0)
      && (objc_msgSend(v4, "nodeDetails:", a2), v4 = (void *)(v8 >> 60), v8 >> 60 == 1)
      || VMUGraphNodeType_IsVMRegion((int)v4))
    {
      v5 = *(void **)(a1 + 40);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a2);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v6);

    }
  }
}

- (id)_addNodeWithNodeName:(unsigned int)a3 nodeInfo:(id)a4 callTreeParentNode:(id)a5 parentNodeName:parentNodeType:reference:
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v13;
  unint64_t v14;
  void *v15;
  void *v16;
  __int128 v18;
  uint64_t v19;

  v8 = v7;
  v9 = v6;
  v10 = v5;
  v11 = *(_QWORD *)&a3;
  v18 = *(_OWORD *)a4.var0;
  v19 = *(_QWORD *)(a4.var0 + 16);
  v13 = a5;
  v14 = -[VMUDominatorCallTreeCreator sizeForNodeName:nodeInfo:](self, "sizeForNodeName:nodeInfo:", v11, &v18);
  if (self->_groupByType)
  {
    -[VMUDominatorCallTreeCreator groupByTypeNameForNode:](self, "groupByTypeNameForNode:", v11, v18, v19);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[VMUCallTreeRoot addChildWithName:address:count:numBytes:toNode:](self->_callTreeRoot, "addChildWithName:address:count:numBytes:toNode:", v15, 0, 1, v14, v13);
  }
  else
  {
    -[VMUDominatorCallTreeCreator groupByNodeNameForNode:parentNodeName:parentNodeType:reference:](self, "groupByNodeNameForNode:parentNodeName:parentNodeType:reference:", v11, v10, v9, v8, v18, v19);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[VMUCallTreeRoot addUniqueChildWithName:address:count:numBytes:toNode:](self->_callTreeRoot, "addUniqueChildWithName:address:count:numBytes:toNode:", v15, 0, 1, v14, v13);
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (void)buildCallTreeWithNodeName:(unsigned int)a3 callTreeParentNode:(id)a4 parentNodeName:(unsigned int)a5 parentNodeType:(unsigned int)a6 reference:(id *)a7 rootNodeFilter:(id)a8
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v14;
  _QWORD *v15;
  void *v16;
  VMUProcessObjectGraph *processObjectGraph;
  id v18;
  _DWORD *visitedNodes;
  VMUProcessObjectGraph *v20;
  unsigned int (*v21)(_QWORD *, uint64_t, __int128 *);
  void *v22;
  id v23;
  _DWORD *v24;
  id v25;
  VMUDominatorGraph *dominatorGraph;
  uint64_t v27;
  id v28;
  VMUProcessObjectGraph *v29;
  id v30;
  id v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _QWORD v42[4];
  id v43;
  VMUDominatorCallTreeCreator *v44;
  id v45;
  id v46;
  __int128 v47;
  uint64_t v48;
  int v49;
  _QWORD v50[4];
  id v51;
  __int128 v52;
  uint64_t v53;
  __int128 v54;
  uint64_t v55;
  _BYTE v56[128];
  uint64_t v57;

  v10 = *(_QWORD *)&a6;
  v11 = *(_QWORD *)&a5;
  v12 = *(_QWORD *)&a3;
  v57 = *MEMORY[0x1E0C80C00];
  v14 = a4;
  v15 = a8;
  v16 = (void *)MEMORY[0x1A85A9758]();
  if ((_DWORD)v12 == (_DWORD)v11)
  {
    v54 = 0uLL;
    v55 = 0;
    processObjectGraph = self->_processObjectGraph;
    if (processObjectGraph)
      -[VMUObjectGraph nodeDetails:](processObjectGraph, "nodeDetails:", v12);
    v52 = v54;
    v53 = v55;
    v18 = -[VMUDominatorCallTreeCreator _addNodeWithNodeName:nodeInfo:callTreeParentNode:parentNodeName:parentNodeType:reference:](self, "_addNodeWithNodeName:nodeInfo:callTreeParentNode:parentNodeName:parentNodeType:reference:", v12, &v52, v14, v12, v10, a7);
    goto LABEL_25;
  }
  visitedNodes = self->_visitedNodes;
  if (*visitedNodes > v12
    && ((*((unsigned __int8 *)visitedNodes + (v12 >> 3) + 4) >> (v12 & 7)) & 1) != 0)
  {
    goto LABEL_25;
  }
  v54 = 0uLL;
  v55 = 0;
  v20 = self->_processObjectGraph;
  if (v20)
    -[VMUObjectGraph nodeDetails:](v20, "nodeDetails:", v12);
  if (!v15)
  {
    v52 = v54;
    v53 = v55;
    -[VMUDominatorCallTreeCreator _addNodeWithNodeName:nodeInfo:callTreeParentNode:parentNodeName:parentNodeType:reference:](self, "_addNodeWithNodeName:nodeInfo:callTreeParentNode:parentNodeName:parentNodeType:reference:", v12, &v52, v14, v11, v10, a7);
    v23 = (id)objc_claimAutoreleasedReturnValue();
LABEL_14:
    v22 = v23;
    goto LABEL_15;
  }
  v21 = (unsigned int (*)(_QWORD *, uint64_t, __int128 *))v15[2];
  v52 = v54;
  v53 = v55;
  if (!v21(v15, v12, &v52))
  {
    v23 = v14;
    goto LABEL_14;
  }

  v52 = v54;
  v53 = v55;
  -[VMUDominatorCallTreeCreator _addNodeWithNodeName:nodeInfo:callTreeParentNode:parentNodeName:parentNodeType:reference:](self, "_addNodeWithNodeName:nodeInfo:callTreeParentNode:parentNodeName:parentNodeType:reference:", v12, &v52, v14, v11, v10, a7);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
LABEL_15:
  v24 = self->_visitedNodes;
  if (*v24 > v12)
    *((_BYTE *)v24 + (v12 >> 3) + 4) |= 1 << (v12 & 7);
  v25 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  dominatorGraph = self->_dominatorGraph;
  v27 = MEMORY[0x1E0C809B0];
  v50[0] = MEMORY[0x1E0C809B0];
  v50[1] = 3221225472;
  v50[2] = __131__VMUDominatorCallTreeCreator_buildCallTreeWithNodeName_callTreeParentNode_parentNodeName_parentNodeType_reference_rootNodeFilter___block_invoke;
  v50[3] = &unk_1E4E03B10;
  v28 = v25;
  v51 = v28;
  -[VMUDominatorGraph enumerateDirectDomineesForNodeName:withBlock:](dominatorGraph, "enumerateDirectDomineesForNodeName:withBlock:", v12, v50);
  v29 = self->_processObjectGraph;
  v42[0] = v27;
  v42[1] = 3221225472;
  v42[2] = __131__VMUDominatorCallTreeCreator_buildCallTreeWithNodeName_callTreeParentNode_parentNodeName_parentNodeType_reference_rootNodeFilter___block_invoke_2;
  v42[3] = &unk_1E4E03B80;
  v30 = v28;
  v43 = v30;
  v44 = self;
  v31 = v22;
  v45 = v31;
  v49 = v12;
  v47 = v54;
  v48 = v55;
  v15 = v15;
  v46 = v15;
  -[VMUObjectGraph enumerateReferencesOfNode:withBlock:](v29, "enumerateReferencesOfNode:withBlock:", v12, v42);
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v32 = v30;
  v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v38, v56, 16);
  if (v33)
  {
    v34 = v33;
    v35 = *(_QWORD *)v39;
    do
    {
      v36 = 0;
      do
      {
        if (*(_QWORD *)v39 != v35)
          objc_enumerationMutation(v32);
        v37 = objc_msgSend(*(id *)(*((_QWORD *)&v38 + 1) + 8 * v36), "unsignedIntValue", (_QWORD)v38);
        -[VMUDominatorCallTreeCreator buildCallTreeWithNodeName:callTreeParentNode:parentNodeName:parentNodeType:reference:rootNodeFilter:](self, "buildCallTreeWithNodeName:callTreeParentNode:parentNodeName:parentNodeType:reference:rootNodeFilter:", v37, v31, v12, *((_QWORD *)&v54 + 1) >> 60, 0, v15);
        ++v36;
      }
      while (v34 != v36);
      v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v38, v56, 16);
    }
    while (v34);
  }

LABEL_25:
  objc_autoreleasePoolPop(v16);

}

void __131__VMUDominatorCallTreeCreator_buildCallTreeWithNodeName_callTreeParentNode_parentNodeName_parentNodeType_reference_rootNodeFilter___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

uint64_t __131__VMUDominatorCallTreeCreator_buildCallTreeWithNodeName_callTreeParentNode_parentNodeName_parentNodeType_reference_rootNodeFilter___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, _BYTE *a6)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t result;

  v10 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v10) = objc_msgSend(v10, "containsObject:", v11);

  if ((_DWORD)v10)
  {
    v12 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "removeObject:", v13);

    objc_msgSend(*(id *)(a1 + 40), "buildCallTreeWithNodeName:callTreeParentNode:parentNodeName:parentNodeType:reference:rootNodeFilter:", a4, *(_QWORD *)(a1 + 48), *(unsigned int *)(a1 + 88), *(_QWORD *)(a1 + 72) >> 60, a5, *(_QWORD *)(a1 + 56));
  }
  result = objc_msgSend(*(id *)(a1 + 32), "count");
  if (!result)
    *a6 = 1;
  return result;
}

- (id)referenceDecriptionForSourceNodeAddress:(unint64_t)a3 referenceInfo:(id *)a4
{
  void *v5;
  const char *v6;
  __CFString *v7;
  void *v8;

  -[VMUProcessObjectGraph regionSymbolNameForAddress:](self->_processObjectGraph, "regionSymbolNameForAddress:", a4->var0 + a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = VMUScanTypeKeywordDescription(a4->var1);
    if (v6 && *v6)
      v7 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%s "), v6);
    else
      v7 = &stru_1E4E04720;
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@%@"), v7, v5);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)groupByTypeNameForNode:(unsigned int)a3
{
  VMUProcessObjectGraph *processObjectGraph;

  processObjectGraph = self->_processObjectGraph;
  if (processObjectGraph)
    -[VMUObjectGraph nodeDetails:](processObjectGraph, "nodeDetails:");
  return CFSTR("(unknown)");
}

- (id)groupByNodeNameForNode:(unsigned int)a3 parentNodeName:(unsigned int)a4 parentNodeType:(unsigned int)a5 reference:(id *)a6
{
  uint64_t v8;
  void *v10;
  __int128 v11;
  VMUProcessObjectGraph *processObjectGraph;
  uint64_t v13;
  _BOOL8 v14;
  uint64_t v15;
  void *v16;
  void *v17;
  _BOOL8 v18;
  __int128 v20;
  __int128 v21;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _BYTE v26[32];
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *var2;

  v8 = *(_QWORD *)&a4;
  -[VMUProcessObjectGraph nodeDescription:](self->_processObjectGraph, "nodeDescription:", *(_QWORD *)&a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (a6)
  {
    v11 = *(_OWORD *)&a6->var1.var1;
    *(_OWORD *)v26 = *(_OWORD *)&a6->var0;
    *(_OWORD *)&v26[16] = v11;
    var2 = a6->var2;
    if (VMUGraphNodeType_IsVMRegion(a5))
    {
      v23 = 0;
      v24 = 0;
      v25 = 0;
      processObjectGraph = self->_processObjectGraph;
      if (processObjectGraph)
      {
        -[VMUObjectGraph nodeDetails:](processObjectGraph, "nodeDetails:", v8);
        v13 = v23;
      }
      else
      {
        v13 = 0;
      }
      v20 = *(_OWORD *)&v26[8];
      *(_QWORD *)&v21 = *(_QWORD *)&v26[24];
      -[VMUDominatorCallTreeCreator referenceDecriptionForSourceNodeAddress:referenceInfo:](self, "referenceDecriptionForSourceNodeAddress:referenceInfo:", v13, &v20);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v16;
      if (v16)
      {
        objc_msgSend(v16, "stringByAppendingFormat:", CFSTR(" --> %@"), v10);
      }
      else
      {
        v18 = -[VMUProcessObjectGraph is64bit](self->_processObjectGraph, "is64bit");
        v20 = *(_OWORD *)v26;
        v21 = *(_OWORD *)&v26[16];
        v22 = var2;
        +[VMULeakDetector referenceDescription:dstDescription:is64bit:](VMULeakDetector, "referenceDescription:dstDescription:is64bit:", &v20, v10, v18);
      }
      v15 = objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v14 = -[VMUProcessObjectGraph is64bit](self->_processObjectGraph, "is64bit");
      v20 = *(_OWORD *)v26;
      v21 = *(_OWORD *)&v26[16];
      v22 = var2;
      +[VMULeakDetector referenceDescription:dstDescription:is64bit:](VMULeakDetector, "referenceDescription:dstDescription:is64bit:", &v20, v10, v14);
      v15 = objc_claimAutoreleasedReturnValue();

    }
    v10 = (void *)v15;
  }
  return v10;
}

- (VMUProcessObjectGraph)processObjectGraph
{
  return (VMUProcessObjectGraph *)objc_getProperty(self, a2, 32, 1);
}

- (void)setProcessObjectGraph:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (VMUDominatorGraph)dominatorGraph
{
  return (VMUDominatorGraph *)objc_getProperty(self, a2, 40, 1);
}

- (void)setDominatorGraph:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (VMUCallTreeRoot)callTreeRoot
{
  return (VMUCallTreeRoot *)objc_getProperty(self, a2, 48, 1);
}

- (void)setCallTreeRoot:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NSNumber)desiredAddress
{
  return (NSNumber *)objc_getProperty(self, a2, 56, 1);
}

- (void)setDesiredAddress:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (VMUClassPatternMatcher)desiredClassesPattern
{
  return (VMUClassPatternMatcher *)objc_getProperty(self, a2, 64, 1);
}

- (void)setDesiredClassesPattern:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_desiredClassesPattern, 0);
  objc_storeStrong((id *)&self->_desiredAddress, 0);
  objc_storeStrong((id *)&self->_callTreeRoot, 0);
  objc_storeStrong((id *)&self->_dominatorGraph, 0);
  objc_storeStrong((id *)&self->_processObjectGraph, 0);
  objc_storeStrong((id *)&self->_debugTimer, 0);
}

@end
