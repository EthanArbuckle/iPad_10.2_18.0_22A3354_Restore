@implementation IPAEditOperation

- (IPAEditOperation)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)IPAEditOperation;
  return -[IPAEditOperation init](&v3, sel_init);
}

- (IPAEditOperation)initWithSettingsDictionary:(id)a3
{
  id v3;
  objc_class *v4;
  IPAEditOperation *v5;
  SEL v6;
  _NSZone *v7;

  v3 = a3;
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  objc_claimAutoreleasedReturnValue();
  v5 = (IPAEditOperation *)_PFAssertFailHandler();
  return (IPAEditOperation *)-[IPAEditOperation copyWithZone:](v5, v6, v7);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithOperation:", self);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0 && -[IPAEditOperation isEqualToOperation:](self, "isEqualToOperation:", v4);

  return v5;
}

- (BOOL)isEqualToOperation:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  if (self == a3)
    return 1;
  v4 = a3;
  -[IPAEditOperation identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v5, "isEqualToString:", v6);
  return (char)v4;
}

- (id)identifier
{
  objc_class *v2;
  IPAEditOperation *v3;
  SEL v4;

  v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  objc_claimAutoreleasedReturnValue();
  v3 = (IPAEditOperation *)_PFAssertFailHandler();
  return -[IPAEditOperation autoIdentifier](v3, v4);
}

- (id)autoIdentifier
{
  return 0;
}

- (id)UUID
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy_;
  v11 = __Block_byref_object_dispose_;
  v12 = 0;
  +[IPAEditOperation _mapDispatchQueue](IPAEditOperation, "_mapDispatchQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __24__IPAEditOperation_UUID__block_invoke;
  v6[3] = &unk_1E986E088;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (id)settingsDictionary
{
  objc_class *v2;
  IPAEditOperation *v3;
  SEL v4;

  v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  objc_claimAutoreleasedReturnValue();
  v3 = (IPAEditOperation *)_PFAssertFailHandler();
  return -[IPAEditOperation description](v3, v4);
}

- (NSString)debugDescription
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x1E0CB37A0]);
  v4 = objc_opt_class();
  -[IPAEditOperation identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@:%p %@>"), v4, self, v5);

  return (NSString *)v6;
}

void __24__IPAEditOperation_UUID__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  +[IPAEditOperation _uuidForIdentifierMap](IPAEditOperation, "_uuidForIdentifierMap");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

    v10 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    +[IPAEditOperation _uuidForIdentifierMap](IPAEditOperation, "_uuidForIdentifierMap");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v10, v12);

    objc_msgSend(*(id *)(a1 + 32), "identifier");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    +[IPAEditOperation _identifierForUUIDMap](IPAEditOperation, "_identifierForUUIDMap");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v14, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));

  }
}

+ (id)operationIdentifierForUUID:(id)a3
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v3 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy_;
  v15 = __Block_byref_object_dispose_;
  v16 = 0;
  +[IPAEditOperation _mapDispatchQueue](IPAEditOperation, "_mapDispatchQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __47__IPAEditOperation_operationIdentifierForUUID___block_invoke;
  v8[3] = &unk_1E986E088;
  v9 = v3;
  v10 = &v11;
  v5 = v3;
  dispatch_sync(v4, v8);

  v6 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v6;
}

+ (id)operationUUIDForIdentifier:(id)a3
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD v7[4];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v3 = a3;
  if (v3)
  {
    v10 = 0;
    v11 = &v10;
    v12 = 0x3032000000;
    v13 = __Block_byref_object_copy_;
    v14 = __Block_byref_object_dispose_;
    v15 = 0;
    +[IPAEditOperation _mapDispatchQueue](IPAEditOperation, "_mapDispatchQueue");
    v4 = objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __47__IPAEditOperation_operationUUIDForIdentifier___block_invoke;
    v7[3] = &unk_1E986E088;
    v9 = &v10;
    v8 = v3;
    dispatch_sync(v4, v7);

    v5 = (id)v11[5];
    _Block_object_dispose(&v10, 8);

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)_identifierForUUIDMap
{
  if (_identifierForUUIDMap_onceToken != -1)
    dispatch_once(&_identifierForUUIDMap_onceToken, &__block_literal_global_1151);
  return (id)_identifierForUUIDMap_map;
}

+ (id)_uuidForIdentifierMap
{
  if (_uuidForIdentifierMap_onceToken != -1)
    dispatch_once(&_uuidForIdentifierMap_onceToken, &__block_literal_global_5);
  return (id)_uuidForIdentifierMap_map;
}

+ (id)_mapDispatchQueue
{
  if (_mapDispatchQueue_onceToken != -1)
    dispatch_once(&_mapDispatchQueue_onceToken, &__block_literal_global_6);
  return (id)_mapDispatchQueue_queue;
}

void __37__IPAEditOperation__mapDispatchQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("com.apple.photos.IPAEditOperation.mapDispatchQueue", 0);
  v1 = (void *)_mapDispatchQueue_queue;
  _mapDispatchQueue_queue = (uint64_t)v0;

}

void __41__IPAEditOperation__uuidForIdentifierMap__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)_uuidForIdentifierMap_map;
  _uuidForIdentifierMap_map = v0;

}

void __41__IPAEditOperation__identifierForUUIDMap__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)_identifierForUUIDMap_map;
  _identifierForUUIDMap_map = v0;

}

void __47__IPAEditOperation_operationUUIDForIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id v12;

  +[IPAEditOperation _uuidForIdentifierMap](IPAEditOperation, "_uuidForIdentifierMap");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

    v9 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    +[IPAEditOperation _uuidForIdentifierMap](IPAEditOperation, "_uuidForIdentifierMap");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v9, *(_QWORD *)(a1 + 32));

    v11 = *(_QWORD *)(a1 + 32);
    +[IPAEditOperation _identifierForUUIDMap](IPAEditOperation, "_identifierForUUIDMap");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v11, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));

  }
}

void __47__IPAEditOperation_operationIdentifierForUUID___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  +[IPAEditOperation _identifierForUUIDMap](IPAEditOperation, "_identifierForUUIDMap");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)archivalRepresentation
{
  objc_class *v2;
  void *v3;
  SEL v4;
  id v5;

  v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  objc_claimAutoreleasedReturnValue();
  v3 = (void *)_PFAssertFailHandler();
  return +[IPAEditOperation presetifyAdjustment:](v3, v4, v5);
}

+ (id)presetifyAdjustment:(id)a3
{
  id v3;
  objc_class *v4;
  IPARegion *v5;
  SEL v6;

  v3 = a3;
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  objc_claimAutoreleasedReturnValue();
  v5 = (IPARegion *)_PFAssertFailHandler();
  return -[IPARegion init](v5, v6);
}

@end
