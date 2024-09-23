@implementation TPStringTable

- (TPStringTable)initWithIdentifier:(id)a3
{
  id v4;
  TPStringTable *v5;
  const char *v6;
  NSObject *v7;
  dispatch_queue_t v8;
  void *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TPStringTable;
  v5 = -[TPStringTable init](&v11, sel_init);
  if (v5)
  {
    v6 = (const char *)objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(MEMORY[0x1E0C80D50], DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = dispatch_queue_create(v6, v7);
    -[TPStringTable setQueue:](v5, "setQueue:", v8);

    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3690]), "initWithOptions:capacity:", 5, 0);
    -[TPStringTable setTable:](v5, "setTable:", v9);

  }
  return v5;
}

- (id)stringWithString:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  void *v8;
  NSObject *v9;
  id v10;
  _QWORD v12[5];
  id v13;
  uint64_t *v14;
  _QWORD block[5];
  id v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v4 = a3;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__2789;
  v22 = __Block_byref_object_dispose__2790;
  v23 = 0;
  -[TPStringTable queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34__TPStringTable_stringWithString___block_invoke;
  block[3] = &unk_1EA8BF760;
  v17 = &v18;
  block[4] = self;
  v7 = v4;
  v16 = v7;
  dispatch_sync(v5, block);

  v8 = (void *)v19[5];
  if (!v8)
  {
    -[TPStringTable queue](self, "queue");
    v9 = objc_claimAutoreleasedReturnValue();
    v12[0] = v6;
    v12[1] = 3221225472;
    v12[2] = __34__TPStringTable_stringWithString___block_invoke_2;
    v12[3] = &unk_1EA8BF760;
    v14 = &v18;
    v12[4] = self;
    v13 = v7;
    dispatch_barrier_sync(v9, v12);

    v8 = (void *)v19[5];
  }
  v10 = v8;

  _Block_object_dispose(&v18, 8);
  return v10;
}

- (id)setWithArray:(id)a3
{
  id v4;
  size_t v5;
  void **v6;
  uint64_t i;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void **v12;
  void *v13;

  v4 = a3;
  v5 = objc_msgSend(v4, "count");
  v6 = (void **)malloc_type_calloc(v5, 8uLL, 0x80040B8603338uLL);
  if (v5)
  {
    for (i = 0; i != v5; ++i)
    {
      objc_msgSend(v4, "objectAtIndexedSubscript:", i);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[TPStringTable stringWithString:](self, "stringWithString:", v8);
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = v6[i];
      v6[i] = (void *)v9;

    }
  }
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:count:", v6, v5);
  if (v5)
  {
    v12 = v6;
    do
    {
      v13 = *v12;
      *v12++ = 0;

      --v5;
    }
    while (v5);
  }
  free(v6);

  return v11;
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 8, 1);
}

- (void)setQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSHashTable)table
{
  return (NSHashTable *)objc_getProperty(self, a2, 16, 1);
}

- (void)setTable:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_table, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __34__TPStringTable_stringWithString___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "table");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "member:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __34__TPStringTable_stringWithString___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;

  objc_msgSend(*(id *)(a1 + 32), "table");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "member:", *(_QWORD *)(a1 + 40));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "table");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", *(_QWORD *)(a1 + 40));

    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), *(id *)(a1 + 40));
  }
}

+ (id)defaultTable
{
  if (defaultTable_once != -1)
    dispatch_once(&defaultTable_once, &__block_literal_global_2797);
  return (id)defaultTable_table;
}

void __29__TPStringTable_defaultTable__block_invoke()
{
  TPStringTable *v0;
  void *v1;

  v0 = -[TPStringTable initWithIdentifier:]([TPStringTable alloc], "initWithIdentifier:", CFSTR("TPStringTable.defaultTable"));
  v1 = (void *)defaultTable_table;
  defaultTable_table = (uint64_t)v0;

}

- (unint64_t)_count
{
  NSObject *v3;
  unint64_t v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  unint64_t v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0xAAAAAAAAAAAAAAAALL;
  -[TPStringTable queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __32__TPStringTable_Testing___count__block_invoke;
  v6[3] = &unk_1EA8BF7C8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

void __32__TPStringTable_Testing___count__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "table");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allObjects");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "count");

}

@end
