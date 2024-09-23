@implementation VMUGroupByNode

- (void)enumerateGroups:(void *)a3 withBlock:(id)a4
{
  id v6;
  id v7;
  _QWORD *v8;
  unsigned int v9;
  uint64_t v10;
  char *v11;
  unsigned int v12;
  uint64_t v13;
  _QWORD v14[2];
  void (*v15)(uint64_t, uint64_t);
  void *v16;
  VMUGroupByNode *v17;
  id v18;

  v6 = a4;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v15 = __44__VMUGroupByNode_enumerateGroups_withBlock___block_invoke;
  v16 = &unk_1E4E03618;
  v17 = self;
  v7 = v6;
  v18 = v7;
  v8 = v14;
  v9 = *(_DWORD *)a3;
  if (*(_DWORD *)a3)
  {
    v10 = 0;
    do
    {
      v11 = (char *)a3 + (v10 >> 3);
      v12 = v11[4];
      v13 = v10;
      if (v11[4])
      {
        do
        {
          if ((v12 & 1) != 0)
            v15((uint64_t)v8, v13);
          if (v12 < 2)
            break;
          v13 = (v13 + 1);
          v12 >>= 1;
        }
        while (v13 < v9);
      }
      v10 = (v10 + 8);
    }
    while (v10 < v9);
  }

}

void __44__VMUGroupByNode_enumerateGroups_withBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  VMUNodeGroup *v6;
  void *v7;
  VMUNodeGroup *v8;

  v4 = (void *)MEMORY[0x1A85A9758]();
  objc_msgSend(*(id *)(a1 + 32), "typeNameForNode:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = [VMUNodeGroup alloc];
  objc_msgSend(*(id *)(a1 + 32), "graph");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[VMUNodeGroup initWithName:graph:](v6, "initWithName:graph:", v5, v7);

  -[VMUNodeGroup addNode:](v8, "addNode:", a2);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  objc_autoreleasePoolPop(v4);
}

@end
