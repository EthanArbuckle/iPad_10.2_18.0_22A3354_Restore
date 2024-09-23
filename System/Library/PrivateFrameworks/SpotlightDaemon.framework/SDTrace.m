@implementation SDTrace

- (int64_t)addLabel:(id)a3 identifier:(int64_t)a4 duration:(double)a5 string:(id)a6 data:(id)a7
{
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  id v16;
  id v17;
  id v18;
  int64_t v19;
  _QWORD block[5];
  id v22;
  id v23;
  id v24;
  uint64_t *v25;
  int64_t v26;
  double v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;

  v12 = a3;
  v13 = a6;
  v14 = a7;
  v28 = 0;
  v29 = &v28;
  v30 = 0x2020000000;
  v31 = 0;
  v15 = _trace_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __52__SDTrace_addLabel_identifier_duration_string_data___block_invoke;
  block[3] = &unk_24D0EAA78;
  v25 = &v28;
  v26 = a4;
  block[4] = self;
  v22 = v12;
  v27 = a5;
  v23 = v13;
  v24 = v14;
  v16 = v14;
  v17 = v13;
  v18 = v12;
  dispatch_sync(v15, block);
  v19 = v29[3];

  _Block_object_dispose(&v28, 8);
  return v19;
}

void __52__SDTrace_addLabel_identifier_duration_string_data___block_invoke(uint64_t a1)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_DWORD *)(v2 + 264) + 1;
  *(_DWORD *)(v2 + 264) = v3;
  v4 = v3 & 0x1F;
  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 8 * v4 + 8);
  if (!v5)
  {
    v6 = objc_opt_new();
    v7 = *(_QWORD *)(a1 + 32) + 8 * v4;
    v8 = *(void **)(v7 + 8);
    *(_QWORD *)(v7 + 8) = v6;

    v5 = *(void **)(*(_QWORD *)(a1 + 32) + 8 * v4 + 8);
  }
  v10 = v5;
  objc_msgSend(MEMORY[0x24BDBCE60], "timeIntervalSinceReferenceDate");
  objc_msgSend(v10, "setStartTime:");
  v9 = *(_QWORD *)(a1 + 72);
  if (v9 == -1)
    v9 = *(int *)(*(_QWORD *)(a1 + 32) + 264) + 1;
  objc_msgSend(v10, "setIdentifier:", v9);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = objc_msgSend(v10, "identifier");
  objc_msgSend(v10, "setLabel:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v10, "setDuration:", *(double *)(a1 + 80));
  objc_msgSend(v10, "setString:", *(_QWORD *)(a1 + 48));
  objc_msgSend(v10, "setData:", *(_QWORD *)(a1 + 56));

}

+ (void)initialize
{
  dispatch_queue_t v2;
  void *v3;
  NSObject *v4;

  if ((id)objc_opt_class() == a1)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = objc_claimAutoreleasedReturnValue();
    v2 = dispatch_queue_create("trace queue", v4);
    v3 = (void *)_trace_queue;
    _trace_queue = (uint64_t)v2;

  }
}

- (SDTrace)init
{
  return -[SDTrace initWithTitle:](self, "initWithTitle:", 0);
}

- (SDTrace)initWithTitle:(id)a3
{
  id v5;
  SDTrace *v6;
  SDTrace *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SDTrace;
  v6 = -[SDTrace init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_title, a3);
    v7->_current = -1;
    *(_OWORD *)v7->_items = 0u;
    *(_OWORD *)&v7->_items[2] = 0u;
    *(_OWORD *)&v7->_items[4] = 0u;
    *(_OWORD *)&v7->_items[6] = 0u;
    *(_OWORD *)&v7->_items[8] = 0u;
    *(_OWORD *)&v7->_items[10] = 0u;
    *(_OWORD *)&v7->_items[12] = 0u;
    *(_OWORD *)&v7->_items[14] = 0u;
    *(_OWORD *)&v7->_items[16] = 0u;
    *(_OWORD *)&v7->_items[18] = 0u;
    *(_OWORD *)&v7->_items[20] = 0u;
    *(_OWORD *)&v7->_items[22] = 0u;
    *(_OWORD *)&v7->_items[24] = 0u;
    *(_OWORD *)&v7->_items[26] = 0u;
    *(_OWORD *)&v7->_items[28] = 0u;
    *(_OWORD *)&v7->_items[30] = 0u;
  }

  return v7;
}

- (id)items
{
  void *v3;
  NSObject *v4;
  id v5;
  void *v6;
  id v7;
  _QWORD v9[5];
  id v10;

  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 32);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = _trace_queue;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __16__SDTrace_items__block_invoke;
  v9[3] = &unk_24D0EA9D8;
  v9[4] = self;
  v5 = v3;
  v10 = v5;
  dispatch_sync(v4, v9);
  v6 = v10;
  v7 = v5;

  return v7;
}

void __16__SDTrace_items__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v2 = 0;
  v3 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v3 + 8 * ((*(_DWORD *)(v3 + 264) + 1) & 0x1F) + 8))
    v4 = (*(_DWORD *)(v3 + 264) + 1) & 0x1F;
  else
    v4 = 0;
  do
  {
    v5 = *(id *)(*(_QWORD *)(a1 + 32) + 8 * ((v4 + (_BYTE)v2) & 0x1F) + 8);
    if (!v5)
      break;
    v6 = v5;
    v7 = *(void **)(a1 + 40);
    v8 = (void *)objc_msgSend(v5, "copy");
    objc_msgSend(v7, "addObject:", v8);

    ++v2;
  }
  while (v2 != 32);
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDD16A8];
  -[SDTrace title](self, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("Trace %@ (%d)\n"), v4, -[SDTrace current](self, "current") + 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[SDTrace items](self, "items");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v10), "description");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "appendFormat:", CFSTR("%@\n"), v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  return v5;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (int)current
{
  return self->_current;
}

- (void).cxx_destruct
{
  uint64_t v3;

  objc_storeStrong((id *)&self->_title, 0);
  v3 = 256;
  do
  {
    objc_storeStrong((id *)((char *)&self->super.isa + v3), 0);
    v3 -= 8;
  }
  while (v3);
}

@end
