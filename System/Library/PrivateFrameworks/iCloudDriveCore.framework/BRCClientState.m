@implementation BRCClientState

- (BRCClientState)init
{
  return -[BRCClientState initWithDictionary:clientStateData:](self, "initWithDictionary:clientStateData:", MEMORY[0x24BDBD1B8], 0);
}

- (BRCClientState)initWithDictionary:(id)a3 clientStateData:(id)a4
{
  id v6;
  id v7;
  BRCClientState *v8;
  uint64_t v9;
  NSMutableDictionary *dict;
  NSObject *v11;
  NSObject *v12;
  dispatch_queue_t v13;
  OS_dispatch_queue *queue;
  objc_super v16;

  v6 = a3;
  v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)BRCClientState;
  v8 = -[BRCClientState init](&v16, sel_init);
  if (v8)
  {
    if (!v6)
      v6 = (id)MEMORY[0x24BDBD1B8];
    v9 = objc_msgSend(v6, "mutableCopy");
    dict = v8->_dict;
    v8->_dict = (NSMutableDictionary *)v9;

    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UNSPECIFIED, 0);
    v11 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_autorelease_frequency(v11, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = dispatch_queue_create("client-state", v12);

    queue = v8->_queue;
    v8->_queue = (OS_dispatch_queue *)v13;

    if (!v7)
      v8->_needsSave = 1;
    objc_storeStrong((id *)&v8->_originalState, a4);
  }

  return v8;
}

- (id)dictionary
{
  NSObject *queue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__53;
  v10 = __Block_byref_object_dispose__53;
  v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __28__BRCClientState_dictionary__block_invoke;
  v5[3] = &unk_24FE429C0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __28__BRCClientState_dictionary__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)_stateToData
{
  NSMutableDictionary *dict;
  void *v4;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  const char *v9;
  id v10;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  dict = self->_dict;
  v10 = 0;
  objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", dict, 1, &v10);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    abc_report_panic_with_signature();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unexpected error while converting client state to data!"));
    v6 = objc_claimAutoreleasedReturnValue();
    brc_bread_crumbs();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      __52__BRCDaemonFPFS_listener_shouldAcceptNewConnection___block_invoke_107_cold_1(v6, (uint64_t)v7, v8);

    brc_append_system_info_to_message();
    v9 = (const char *)objc_msgSend(objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue()), "UTF8String");
    __assert_rtn("-[BRCClientState _stateToData]", "/Library/Caches/com.apple.xbs/Sources/CloudDocs_plugins/core/shared/database/BRCClientState.m", 54, v9);
  }
  return v4;
}

- (id)_prepareToSaveStateData
{
  void *originalState;
  NSData *v4;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[BRCClientState _stateToData](self, "_stateToData");
  originalState = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_needsSave || !-[NSData isEqualToData:](self->_originalState, "isEqualToData:", originalState))
  {
    v4 = originalState;
    originalState = self->_originalState;
    self->_originalState = v4;
  }
  else
  {
    v4 = 0;
  }

  self->_needsSave = 0;
  return v4;
}

- (BOOL)hasStateChangesAndClearSaveStatusWithResultingState:(id *)a3
{
  NSObject *queue;
  BOOL v6;
  void *v8;
  NSObject *v9;
  _QWORD v10[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  if (!a3)
  {
    brc_bread_crumbs();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      -[BRCClientState hasStateChangesAndClearSaveStatusWithResultingState:].cold.1((uint64_t)v8, v9);

  }
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__53;
  v15 = __Block_byref_object_dispose__53;
  v16 = 0;
  queue = self->_queue;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __70__BRCClientState_hasStateChangesAndClearSaveStatusWithResultingState___block_invoke;
  v10[3] = &unk_24FE429C0;
  v10[4] = self;
  v10[5] = &v11;
  dispatch_sync(queue, v10);
  if (a3)
    *a3 = objc_retainAutorelease((id)v12[5]);
  v6 = v12[5] != 0;
  _Block_object_dispose(&v11, 8);

  return v6;
}

void __70__BRCClientState_hasStateChangesAndClearSaveStatusWithResultingState___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_prepareToSaveStateData");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)objectForKey:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__53;
  v16 = __Block_byref_object_dispose__53;
  v17 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __31__BRCClientState_objectForKey___block_invoke;
  block[3] = &unk_24FE416D8;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(queue, block);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __31__BRCClientState_objectForKey___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 8), "objectForKeyedSubscript:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)setObject:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __35__BRCClientState_setObject_forKey___block_invoke;
  block[3] = &unk_24FE3FA88;
  block[4] = self;
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_async(queue, block);

}

uint64_t __35__BRCClientState_setObject_forKey___block_invoke(_QWORD *a1)
{
  *(_BYTE *)(a1[4] + 24) = 1;
  return objc_msgSend(*(id *)(a1[4] + 8), "setObject:forKeyedSubscript:", a1[6], a1[5]);
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  -[BRCClientState dictionary](self, "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p, %@>"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalState, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_dict, 0);
}

- (void)hasStateChangesAndClearSaveStatusWithResultingState:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_fault_impl(&dword_230455000, a2, OS_LOG_TYPE_FAULT, "[CRIT] Assertion failed: data%@", (uint8_t *)&v2, 0xCu);
}

@end
