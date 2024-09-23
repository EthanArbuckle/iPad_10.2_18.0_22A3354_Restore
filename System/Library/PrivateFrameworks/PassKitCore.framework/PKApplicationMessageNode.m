@implementation PKApplicationMessageNode

+ (id)createForMessages:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  __objc2_class **v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id *v12;
  id *v13;
  id *v14;
  id v15;
  id *v16;
  id *v17;
  uint64_t v18;
  uint64_t v19;
  id *v20;
  id *v21;
  id v22;
  __objc2_class **v23;
  id *v24;
  _QWORD *v25;
  id *v26;
  void *v27;
  id v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  __CFString *v34;
  id v35;
  _QWORD *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  void *v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  id v48;
  void *v50;
  id v51;
  uint64_t v52;
  uint64_t v53;
  _QWORD v54[4];
  id v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  _BYTE v64[128];
  _BYTE v65[128];
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = v3;
  if (!v3 || !objc_msgSend(v3, "count"))
  {
    v36 = 0;
    goto LABEL_48;
  }
  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  v50 = v4;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v56, v64, 16);
  v8 = off_1E2A9E000;
  if (!v7)
    goto LABEL_33;
  v9 = v7;
  v10 = *(_QWORD *)v57;
  v51 = v6;
  v52 = *(_QWORD *)v57;
  do
  {
    v11 = 0;
    v53 = v9;
    do
    {
      if (*(_QWORD *)v57 != v10)
        objc_enumerationMutation(v6);
      v12 = *(id **)(*((_QWORD *)&v56 + 1) + 8 * v11);
      if (v12)
      {
        v13 = (id *)v12[2];
        v14 = v13;
        if (v13)
        {
          v15 = v13[2];
          goto LABEL_11;
        }
      }
      else
      {
        v14 = 0;
      }
      v15 = 0;
LABEL_11:

      v16 = v12;
      objc_opt_self();
      if (v12)
      {
        +[PKApplicationMessageNode _createForType:]((uint64_t)v8[158], 0);
        v17 = (id *)objc_claimAutoreleasedReturnValue();
        objc_storeStrong(v17 + 5, v12);
      }
      else
      {
        v17 = 0;
      }

      objc_msgSend(v5, "objectForKeyedSubscript:", v15);
      v18 = objc_claimAutoreleasedReturnValue();
      if (!v18)
      {
        v21 = v17;
        objc_opt_self();
        if (v21)
        {
          v22 = v5;
          v23 = v8;
          +[PKApplicationMessageNode _createForType:]((uint64_t)v8[158], 1uLL);
          v19 = objc_claimAutoreleasedReturnValue();
          v24 = (id *)v21[5];
          if (v24)
          {
            v25 = v24[2];
            v26 = v24;
            if (v25)
            {
              v27 = (void *)v25[2];
              goto LABEL_22;
            }
            v28 = 0;
          }
          else
          {
            v27 = 0;
            v25 = 0;
LABEL_22:
            v28 = v27;
          }
          v29 = *(void **)(v19 + 48);
          *(_QWORD *)(v19 + 48) = v28;

          v30 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", v21, 0);
          v31 = *(void **)(v19 + 40);
          *(_QWORD *)(v19 + 40) = v30;

          objc_storeWeak(v21 + 3, (id)v19);
          v8 = v23;
          v5 = v22;
          v6 = v51;
          v10 = v52;
          v9 = v53;
        }
        else
        {
          v19 = 0;
        }

        objc_msgSend(v5, "setObject:forKeyedSubscript:", v19, v15);
        goto LABEL_26;
      }
      v19 = v18;
      v20 = v17;
      objc_msgSend(*(id *)(v19 + 40), "addObject:", v20);
      if (v20)
        objc_storeWeak(v20 + 3, (id)v19);

LABEL_26:
      ++v11;
    }
    while (v9 != v11);
    v32 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v56, v64, 16);
    v9 = v32;
  }
  while (v32);
LABEL_33:

  objc_msgSend(v5, "allValues");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = CFSTR("summary");
  v35 = v33;
  objc_opt_self();
  if (v35 && objc_msgSend(v35, "count"))
  {
    +[PKApplicationMessageNode _createForType:]((uint64_t)v8[158], 2uLL);
    v36 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(CFSTR("summary"), "copy");
    v38 = (void *)v36[6];
    v36[6] = v37;

    v39 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithArray:", v35);
    v40 = (void *)v36[5];
    v36[5] = v39;

    v62 = 0u;
    v63 = 0u;
    v60 = 0u;
    v61 = 0u;
    v41 = v35;
    v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v60, v65, 16);
    v4 = v50;
    if (v42)
    {
      v43 = v42;
      v44 = *(_QWORD *)v61;
      do
      {
        v45 = 0;
        do
        {
          if (*(_QWORD *)v61 != v44)
            objc_enumerationMutation(v41);
          v46 = *(_QWORD *)(*((_QWORD *)&v60 + 1) + 8 * v45);
          if (v46)
            objc_storeWeak((id *)(v46 + 24), v36);
          ++v45;
        }
        while (v43 != v45);
        v43 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v60, v65, 16);
      }
      while (v43);
    }

  }
  else
  {
    v36 = 0;
    v4 = v50;
  }

  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v54[0] = MEMORY[0x1E0C809B0];
  v54[1] = 3221225472;
  v54[2] = __46__PKApplicationMessageNode_createForMessages___block_invoke;
  v54[3] = &unk_1E2ACF510;
  v55 = v47;
  v48 = v47;
  -[PKApplicationMessageNode _visitPostOrder:]((uint64_t)v36, v54);

LABEL_48:
  return v36;
}

void __46__PKApplicationMessageNode_createForMessages___block_invoke(uint64_t a1, void *a2)
{
  _QWORD *v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;

  v3 = a2;
  v4 = v3[2];
  if (v4 == 2)
  {
    v10 = v3;
    v5 = *(id *)(a1 + 32);
    v6 = (void *)v10[5];
    v11 = MEMORY[0x1E0C809B0];
    v12 = 3221225472;
    v7 = __61__PKApplicationMessageNodeMultipleGroupBranch__sortWithDate___block_invoke;
    v8 = &unk_1E2ACF5D0;
    goto LABEL_5;
  }
  if (v4 == 1)
  {
    v10 = v3;
    v5 = *(id *)(a1 + 32);
    v6 = (void *)v10[5];
    v11 = MEMORY[0x1E0C809B0];
    v12 = 3221225472;
    v7 = __53__PKApplicationMessageNodeGroupBranch__sortWithDate___block_invoke;
    v8 = &unk_1E2ACF5A8;
LABEL_5:
    v13 = v7;
    v14 = v8;
    v9 = v5;
    v15 = v9;
    objc_msgSend(v6, "sortUsingComparator:", &v11);

    v3 = v10;
  }

}

- (void)_visitPostOrder:(uint64_t)a1
{
  void (**v3)(id, void *, _BYTE *);
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  int *v9;
  uint64_t v10;
  void *v11;
  char v12;

  v3 = a2;
  if (!a1)
    goto LABEL_14;
  v4 = (void *)MEMORY[0x19400CFE8]();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", a1, 0);
  if (!objc_msgSend(v5, "count"))
    goto LABEL_13;
  while (1)
  {
    objc_msgSend(v5, "lastObject");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    if (*(_BYTE *)(v6 + 8))
      break;
    *(_BYTE *)(v6 + 8) = 1;
    v8 = *(_QWORD *)(v6 + 16);
    if (v8 == 1)
    {
      v9 = &OBJC_IVAR___PKApplicationMessageNodeGroupBranch__children;
LABEL_10:
      v10 = objc_msgSend(*(id *)(v6 + *v9), "copy");
      if (v10)
      {
        v11 = (void *)v10;
        objc_msgSend(v5, "addObjectsFromArray:", v10);

      }
      goto LABEL_12;
    }
    if (v8 == 2)
    {
      v9 = &OBJC_IVAR___PKApplicationMessageNodeMultipleGroupBranch__children;
      goto LABEL_10;
    }
LABEL_12:

    if (!objc_msgSend(v5, "count"))
      goto LABEL_13;
  }
  objc_msgSend(v5, "removeLastObject");
  v12 = 0;
  v3[2](v3, v7, &v12);
  if (!v12)
    goto LABEL_12;

LABEL_13:
  -[PKApplicationMessageNode _visitPreOrder:](a1, &__block_literal_global_115);

  objc_autoreleasePoolPop(v4);
LABEL_14:

}

+ (id)messageKeysForNode:(id)a3 localKeys:(id *)a4
{
  _QWORD *v5;
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v18[4];
  id v19;
  _QWORD aBlock[4];
  id v21;
  id v22;

  v5 = a3;
  if (v5)
  {
    v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v8 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __57__PKApplicationMessageNode_messageKeysForNode_localKeys___block_invoke;
    aBlock[3] = &unk_1E2ACF538;
    v9 = v7;
    v21 = v9;
    v10 = v6;
    v22 = v10;
    v11 = _Block_copy(aBlock);
    v12 = v11;
    v13 = v5[2];
    if ((unint64_t)(v13 - 1) >= 2)
    {
      if (!v13)
        (*((void (**)(void *, _QWORD))v11 + 2))(v11, v5[5]);
    }
    else
    {
      v18[0] = v8;
      v18[1] = 3221225472;
      v18[2] = __57__PKApplicationMessageNode_messageKeysForNode_localKeys___block_invoke_2;
      v18[3] = &unk_1E2ACF560;
      v19 = v11;
      -[PKApplicationMessageNode _visitPreOrder:]((uint64_t)v5, v18);

    }
    if (a4 && objc_msgSend(v9, "count"))
    {
      v15 = (void *)objc_msgSend(v9, "copy");
      v16 = *a4;
      *a4 = v15;

    }
    if (objc_msgSend(v10, "count"))
      v14 = (void *)objc_msgSend(v10, "copy");
    else
      v14 = 0;

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

void __57__PKApplicationMessageNode_messageKeysForNode_localKeys___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  _QWORD *v4;
  id v5;
  id *v6;
  id v7;

  if (a2)
  {
    v3 = *(_QWORD *)(a2 + 8);
    if (v3)
    {
      v4 = *(id *)(v3 + 16);
      v5 = v4;
      if (v4 && v4[1])
      {
        v6 = (id *)(a1 + 40);
LABEL_9:
        v7 = v5;
        objc_msgSend(*v6, "addObject:", v5);

        return;
      }
    }
    else
    {
      v5 = 0;
    }
    v6 = (id *)(a1 + 32);
    goto LABEL_9;
  }
}

uint64_t __57__PKApplicationMessageNode_messageKeysForNode_localKeys___block_invoke_2(uint64_t result, uint64_t a2)
{
  if (!*(_QWORD *)(a2 + 16))
    return (*(uint64_t (**)(void))(*(_QWORD *)(result + 32) + 16))();
  return result;
}

- (void)_visitPreOrder:(uint64_t)a1
{
  void (**v3)(id, _QWORD *, char *, char *);
  void *v4;
  void *v5;
  _QWORD *v6;
  uint64_t v7;
  int *v8;
  uint64_t v9;
  void *v10;
  char v11;
  char v12;

  v3 = a2;
  if (!a1)
    goto LABEL_16;
  v4 = (void *)MEMORY[0x19400CFE8]();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", a1, 0);
  if (!objc_msgSend(v5, "count"))
    goto LABEL_15;
  while (1)
  {
    objc_msgSend(v5, "lastObject");
    v6 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeLastObject");
    v12 = 1;
    v11 = 0;
    v3[2](v3, v6, &v12, &v11);
    if (v11)
      break;
    if (v12 && v6)
    {
      v7 = v6[2];
      if (v7 == 1)
      {
        v8 = &OBJC_IVAR___PKApplicationMessageNodeGroupBranch__children;
LABEL_10:
        v9 = objc_msgSend(*(id *)((char *)v6 + *v8), "copy");
        if (v9)
        {
          v10 = (void *)v9;
          objc_msgSend(v5, "addObjectsFromArray:", v9);

        }
        goto LABEL_12;
      }
      if (v7 == 2)
      {
        v8 = &OBJC_IVAR___PKApplicationMessageNodeMultipleGroupBranch__children;
        goto LABEL_10;
      }
    }
LABEL_12:

    if (!objc_msgSend(v5, "count"))
      goto LABEL_15;
  }

LABEL_15:
  objc_autoreleasePoolPop(v4);
LABEL_16:

}

+ (id)_createForType:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  objc_super v8;

  objc_opt_self();
  if (a2 >= 3)
  {
    v4 = 0;
    goto LABEL_6;
  }
  v3 = objc_alloc(*off_1E2ACF5F0[a2]);
  v4 = v3;
  if (!v3)
  {
LABEL_6:
    v6 = 0;
    goto LABEL_7;
  }
  v8.receiver = v3;
  v8.super_class = (Class)PKApplicationMessageNode;
  v5 = objc_msgSendSuper2(&v8, sel_init);
  v6 = v5;
  if (v5)
    *((_QWORD *)v5 + 2) = a2;
LABEL_7:

  return v6;
}

- (PKApplicationMessageNode)init
{

  return 0;
}

- (NSObject)key
{
  int64_t type;
  id *isa;
  _QWORD *v4;
  id *v5;
  void *v6;
  id v7;

  if (!self)
    goto LABEL_10;
  type = self->_type;
  if (type == 2 || type == 1)
  {
    v7 = *(id *)&self[1]._visited;
    return v7;
  }
  if (type)
  {
LABEL_10:
    v7 = 0;
    return v7;
  }
  isa = (id *)self[1].super.isa;
  if (isa)
  {
    v4 = isa[1];
    v5 = isa;
    if (!v4)
    {
      v7 = 0;
      goto LABEL_9;
    }
    v6 = (void *)v4[2];
  }
  else
  {
    v6 = 0;
    v4 = 0;
  }
  v7 = v6;
LABEL_9:

  return v7;
}

- (NSArray)children
{
  int64_t type;
  int *v3;

  if (self)
  {
    type = self->_type;
    if (type == 1)
    {
      v3 = &OBJC_IVAR___PKApplicationMessageNodeGroupBranch__children;
      return (NSArray *)(id)objc_msgSend(*(id *)((char *)&self->super.isa + *v3), "copy");
    }
    if (type == 2)
    {
      v3 = &OBJC_IVAR___PKApplicationMessageNodeMultipleGroupBranch__children;
      return (NSArray *)(id)objc_msgSend(*(id *)((char *)&self->super.isa + *v3), "copy");
    }
    self = 0;
  }
  return (NSArray *)self;
}

- (unint64_t)numberOfChildren
{
  int64_t type;
  int *v3;
  void *v4;
  unint64_t v5;

  if (!self)
    goto LABEL_7;
  type = self->_type;
  if (type == 1)
  {
    v3 = &OBJC_IVAR___PKApplicationMessageNodeGroupBranch__children;
    goto LABEL_6;
  }
  if (type != 2)
  {
LABEL_7:
    v4 = 0;
    goto LABEL_8;
  }
  v3 = &OBJC_IVAR___PKApplicationMessageNodeMultipleGroupBranch__children;
LABEL_6:
  v4 = (void *)objc_msgSend(*(id *)((char *)&self->super.isa + *v3), "copy");
LABEL_8:
  v5 = objc_msgSend(v4, "count");

  return v5;
}

- (PKApplicationMessageNode)root
{
  if (self)
  {
    -[PKApplicationMessageNode _ancestorPassingTest:]((id *)&self->super.isa, 0);
    self = (PKApplicationMessageNode *)objc_claimAutoreleasedReturnValue();
  }
  return self;
}

- (id)_ancestorPassingTest:(id *)a1
{
  unsigned int (**v3)(id, id *, _BYTE *);
  id *v4;
  id *v5;
  id *WeakRetained;
  char v8;

  v3 = a2;
  if (a1)
  {
    v4 = a1;
    a1 = 0;
    while (1)
    {
      v8 = 0;
      if (!v3 || v3[2](v3, v4, &v8))
      {
        v5 = v4;

        a1 = v5;
      }
      if (v8)
        break;
      WeakRetained = (id *)objc_loadWeakRetained(v4 + 3);

      v4 = WeakRetained;
      if (!WeakRetained)
        goto LABEL_10;
    }

  }
LABEL_10:

  return a1;
}

- (id)ancestorPassingTest:(id)a3
{
  return -[PKApplicationMessageNode _ancestorPassingTest:]((id *)&self->super.isa, a3);
}

- (void)visitPreOrder:(id)a3
{
  -[PKApplicationMessageNode _visitPreOrder:]((uint64_t)self, a3);
}

- (void)visitPostOrder:(id)a3
{
  -[PKApplicationMessageNode _visitPostOrder:]((uint64_t)self, a3);
}

void __41__PKApplicationMessageNode__resetVisited__block_invoke(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)(a2 + 8) = 0;
}

- (int64_t)type
{
  return self->_type;
}

- (PKApplicationMessageNode)parent
{
  return (PKApplicationMessageNode *)objc_loadWeakRetained((id *)&self->_parent);
}

- (id)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong(&self->_context, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_context, 0);
  objc_destroyWeak((id *)&self->_parent);
}

@end
