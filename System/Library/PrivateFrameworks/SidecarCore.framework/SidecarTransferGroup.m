@implementation SidecarTransferGroup

- (SidecarTransferGroup)initWithMessage:(id)a3
{
  id v4;
  SidecarTransferGroup *v5;
  unint64_t Type;
  SidecarTransferGroup *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  SidecarMutableItem *v17;
  NSArray *v18;
  NSArray *mutableItems;
  void *v21;
  id obj;
  objc_super v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)SidecarTransferGroup;
  v5 = -[SidecarTransferGroup init](&v23, sel_init);
  if (!v5)
  {
LABEL_21:
    v7 = v5;
    goto LABEL_22;
  }
  Type = SidecarMessageGetType(v4);
  v7 = 0;
  if (Type <= 4 && ((1 << Type) & 0x1A) != 0)
  {
    v5->_type = Type;
    objc_msgSend(v4, "objectForKey:", &unk_24E5E68F8);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_opt_class();
      objc_opt_class();
      objc_opt_class();
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v8, "count"));
      v24 = 0u;
      v25 = 0u;
      v26 = 0u;
      v27 = 0u;
      obj = v8;
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v25;
        v21 = v8;
        while (2)
        {
          v13 = 0;
          do
          {
            if (*(_QWORD *)v25 != v12)
              objc_enumerationMutation(obj);
            v14 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v13);
            if ((objc_opt_isKindOfClass() & 1) == 0)
              goto LABEL_18;
            objc_msgSend(v14, "objectForKey:", &unk_24E5E68C8);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "objectForKey:", &unk_24E5E68E0);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_opt_isKindOfClass() & 1) == 0 || (objc_opt_isKindOfClass() & 1) == 0)
            {

LABEL_18:
              v18 = (NSArray *)MEMORY[0x24BDBD1A8];
              v8 = v21;
              goto LABEL_19;
            }
            v17 = -[SidecarMutableItem initWithType:capacity:]([SidecarMutableItem alloc], "initWithType:capacity:", v16, objc_msgSend(v15, "unsignedIntegerValue"));
            objc_msgSend(v9, "addObject:", v17);

            ++v13;
          }
          while (v11 != v13);
          v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
          v8 = v21;
          if (v11)
            continue;
          break;
        }
      }

      v18 = v9;
LABEL_19:

    }
    else
    {
      v18 = (NSArray *)MEMORY[0x24BDBD1A8];
    }

    mutableItems = v5->_mutableItems;
    v5->_mutableItems = v18;

    goto LABEL_21;
  }
LABEL_22:

  return v7;
}

- (BOOL)isComplete
{
  return -[NSArray count](self->_mutableItems, "count") == self->_completedItems;
}

- (NSArray)items
{
  void *v3;

  if (-[SidecarTransferGroup isComplete](self, "isComplete"))
    v3 = (void *)-[NSArray copy](self->_mutableItems, "copy");
  else
    v3 = (void *)MEMORY[0x24BDBD1A8];
  return (NSArray *)v3;
}

- (int64_t)type
{
  return self->_type;
}

- (BOOL)handleMessage:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  SidecarTransferGroup *v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  id v15;
  uint64_t *v16;
  void *v17;
  BOOL v18;
  id *v20;
  _QWORD v21[5];
  id v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy_;
  v28 = __Block_byref_object_dispose_;
  v29 = 0;
  v6 = a3;
  v7 = objc_alloc_init(MEMORY[0x24BDD1698]);
  objc_msgSend(v6, "objectForKey:", &unk_24E5E68B0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    objc_msgSend(v8, "allKeys");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    v20 = a4;
    v11 = self;
    if (v10)
    {
      v12 = *(_QWORD *)v31;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v31 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
          if ((objc_opt_isKindOfClass() & 1) != 0)
            objc_msgSend(v7, "addIndex:", objc_msgSend(v14, "integerValue"));
        }
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      }
      while (v10);
    }

    self = v11;
    a4 = v20;
  }

  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __44__SidecarTransferGroup_handleMessage_error___block_invoke;
  v21[3] = &unk_24E5E0B60;
  v21[4] = self;
  v15 = v6;
  v22 = v15;
  v23 = &v24;
  objc_msgSend(v7, "enumerateIndexesUsingBlock:", v21);
  v16 = v25;
  if (a4)
  {
    v17 = (void *)v25[5];
    if (v17)
    {
      *a4 = objc_retainAutorelease(v17);
      v16 = v25;
    }
  }
  v18 = v16[5] == 0;

  _Block_object_dispose(&v24, 8);
  return v18;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mutableItems, 0);
}

void __44__SidecarTransferGroup_handleMessage_error___block_invoke(uint64_t a1, unint64_t a2, _BYTE *a3)
{
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  _BOOL4 v13;
  void *v14;
  uint64_t v15;
  void *v16;
  NSObject *log;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "count") <= a2)
  {
    v6 = 0;
  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "objectAtIndexedSubscript:", a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  SidecarMessageGetItemData(*(void **)(a1 + 40), a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 && (objc_msgSend(v6, "appendData:", v7) & 1) != 0)
  {
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) += objc_msgSend(v6, "isComplete");
  }
  else
  {
    *a3 = 1;
    v8 = *(id *)(a1 + 40);
    v9 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("SidecarErrorDomain"), -1010, 0);
    if (v9)
    {
      SidecarCoreLogSubsystem(OS_LOG_TYPE_ERROR);
      v12 = objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        log = v12;
        v13 = os_log_type_enabled(v12, OS_LOG_TYPE_ERROR);
        v12 = log;
        if (v13)
        {
          objc_msgSend(v9, "domain");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v9, "code");
          objc_msgSend(v9, "localizedDescription");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543875;
          v19 = v14;
          v20 = 2048;
          v21 = v15;
          v22 = 2113;
          v23 = v16;
          _os_log_impl(&dword_220044000, log, OS_LOG_TYPE_ERROR, "%{public}@ (%ld) %{private}@", buf, 0x20u);

          v12 = log;
        }
      }

    }
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;

  }
}

@end
