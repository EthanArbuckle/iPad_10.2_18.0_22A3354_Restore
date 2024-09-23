@implementation IPAAutoRegistry

- (IPAAutoRegistry)init
{
  IPAAutoRegistry *v2;
  id v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *serializer;
  uint64_t v6;
  NSMutableDictionary *entries;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)IPAAutoRegistry;
  v2 = -[IPAAutoRegistry init](&v9, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("IPAAutoRegistry.%p._serializer"), v2);
    v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v4 = dispatch_queue_create((const char *)objc_msgSend(v3, "UTF8String"), 0);
    serializer = v2->_serializer;
    v2->_serializer = (OS_dispatch_queue *)v4;

    v6 = objc_opt_new();
    entries = v2->_entries;
    v2->_entries = (NSMutableDictionary *)v6;

  }
  return v2;
}

- (void)registerAutoCalculatorSettingsClass:(Class)a3 toAutoIdentifier:(id)a4 operationIdentifier:(id)a5
{
  -[IPAAutoRegistry registerAutoCalculatorSettingsClass:toAutoIdentifier:operationIdentifier:persistable:](self, "registerAutoCalculatorSettingsClass:toAutoIdentifier:operationIdentifier:persistable:", a3, a4, a5, 1);
}

- (void)registerAutoCalculatorSettingsClass:(Class)a3 toAutoIdentifier:(id)a4 operationIdentifier:(id)a5 persistable:(BOOL)a6
{
  id v10;
  void *v11;
  void *v12;
  NSObject *serializer;
  id v14;
  IPAAutoRegistry *v15;
  SEL v16;
  id v17;
  id v18;
  id v19;
  _QWORD block[5];
  id v21;
  Class v22;
  BOOL v23;

  v19 = a4;
  v10 = a5;
  if (!a3)
  {
    _PFAssertFailHandler();
    goto LABEL_6;
  }
  if (!v19)
  {
LABEL_6:
    _PFAssertFailHandler();
    goto LABEL_7;
  }
  v11 = v10;
  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@"), v10, v19);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    serializer = self->_serializer;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __104__IPAAutoRegistry_registerAutoCalculatorSettingsClass_toAutoIdentifier_operationIdentifier_persistable___block_invoke;
    block[3] = &unk_1E986E240;
    v21 = v12;
    v22 = a3;
    v23 = a6;
    block[4] = self;
    v14 = v12;
    dispatch_sync(serializer, block);

    return;
  }
LABEL_7:
  v15 = (IPAAutoRegistry *)_PFAssertFailHandler();
  -[IPAAutoRegistry _entryForAutoIdentifier:operationIdentifier:](v15, v16, v17, v18);
}

- (id)_entryForAutoIdentifier:(id)a3 operationIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *serializer;
  id v11;
  id v12;
  _QWORD block[5];
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__1996;
  v21 = __Block_byref_object_dispose__1997;
  v22 = 0;
  if (v6 && v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@"), v7, v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    serializer = self->_serializer;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __63__IPAAutoRegistry__entryForAutoIdentifier_operationIdentifier___block_invoke;
    block[3] = &unk_1E986E268;
    v15 = v9;
    v16 = &v17;
    block[4] = self;
    v11 = v9;
    dispatch_sync(serializer, block);

  }
  else
  {
    _PFAssertContinueHandler();
  }
  v12 = (id)v18[5];
  _Block_object_dispose(&v17, 8);

  return v12;
}

- (BOOL)hasMappingForAutoIdentifier:(id)a3 operationIdentifier:(id)a4
{
  void *v4;
  BOOL v5;

  -[IPAAutoRegistry _entryForAutoIdentifier:operationIdentifier:](self, "_entryForAutoIdentifier:operationIdentifier:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 != 0;

  return v5;
}

- (Class)settingsClassForAutoIdentifier:(id)a3 operationIdentifier:(id)a4
{
  void *v4;
  void *v5;

  -[IPAAutoRegistry _entryForAutoIdentifier:operationIdentifier:](self, "_entryForAutoIdentifier:operationIdentifier:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "autoSettingsClass");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (Class)v5;
}

- (BOOL)isPersistableAutoIdentifier:(id)a3 forOperationIdentifier:(id)a4
{
  void *v4;
  char v5;

  -[IPAAutoRegistry _entryForAutoIdentifier:operationIdentifier:](self, "_entryForAutoIdentifier:operationIdentifier:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "persistable");

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entries, 0);
  objc_storeStrong((id *)&self->_serializer, 0);
}

void __63__IPAAutoRegistry__entryForAutoIdentifier_operationIdentifier___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 16), "objectForKeyedSubscript:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __104__IPAAutoRegistry_registerAutoCalculatorSettingsClass_toAutoIdentifier_operationIdentifier_persistable___block_invoke(uint64_t a1)
{
  id v2;

  v2 = (id)objc_opt_new();
  objc_msgSend(v2, "setAutoSettingsClass:", *(_QWORD *)(a1 + 48));
  objc_msgSend(v2, "setPersistable:", *(unsigned __int8 *)(a1 + 56));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setObject:forKeyedSubscript:", v2, *(_QWORD *)(a1 + 40));

}

+ (void)setSharedRegistry:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  SEL v6;

  v3 = a3;
  if (v3)
  {
    v4 = (void *)s_instance;
    s_instance = (uint64_t)v3;

  }
  else
  {
    v5 = (void *)_PFAssertFailHandler();
    +[IPAAutoRegistry sharedRegistry](v5, v6);
  }
}

+ (id)sharedRegistry
{
  return (id)s_instance;
}

@end
