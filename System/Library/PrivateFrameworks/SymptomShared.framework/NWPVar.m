@implementation NWPVar

+ (void)setLogHandle:(id)a3
{
  objc_storeStrong((id *)&nwpvarHandle, a3);
}

- (NWPVar)init
{

  return 0;
}

- (id)initInValueSpace:(id)a3 withLabel:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  NWPVar *v9;
  NWPVar *v10;
  uint64_t v11;
  NSArray *referenceValues;
  NWPVar *v13;
  NSObject *v14;
  objc_super v16;
  uint8_t buf[4];
  id v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (v6 && (v8 = objc_msgSend(v6, "count"), v7) && v8)
  {
    v16.receiver = self;
    v16.super_class = (Class)NWPVar;
    v9 = -[NWPVar init](&v16, sel_init);
    v10 = v9;
    if (v9)
    {
      objc_storeStrong((id *)&v9->_label, a4);
      v11 = objc_msgSend(v6, "copy");
      referenceValues = v10->_referenceValues;
      v10->_referenceValues = (NSArray *)v11;

      -[NWPVar _setToCleanSlate](v10, "_setToCleanSlate");
    }
    self = v10;
    v13 = self;
  }
  else
  {
    nwpvarLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v18 = v6;
      v19 = 2112;
      v20 = v7;
      _os_log_impl(&dword_247C4A000, v14, OS_LOG_TYPE_ERROR, "wrong argument: allValues %@, label %@", buf, 0x16u);
    }

    v13 = 0;
  }

  return v13;
}

- (id)initFromCheckpoint:(id)a3 forLabel:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  NWPVar *v13;
  NWPVar *v14;
  NWPVar *v15;
  NSObject *v16;
  objc_super v18;
  uint8_t buf[4];
  id v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6 && v7)
  {
    v9 = objc_alloc(MEMORY[0x24BDD17C8]);
    objc_msgSend(v6, "UUIDString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "initWithFormat:", CFSTR("%s-%@-%@"), "NWPVar", v8, v10);

    +[NWPVar _fetchCheckpoint:isPrefix:](NWPVar, "_fetchCheckpoint:isPrefix:", v11, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v18.receiver = self;
      v18.super_class = (Class)NWPVar;
      v13 = -[NWPVar init](&v18, sel_init);
      v14 = v13;
      if (v13)
        -[NWPVar _mirrorFrom:](v13, "_mirrorFrom:", v12);
      self = v14;
      v15 = self;
    }
    else
    {
      nwpvarLogHandle();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v20 = v6;
        v21 = 2112;
        v22 = v8;
        _os_log_impl(&dword_247C4A000, v16, OS_LOG_TYPE_ERROR, "identifier failed to recover valid object for: %@ and label: %@", buf, 0x16u);
      }

      v15 = 0;
    }

  }
  else
  {
    nwpvarLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v20 = v6;
      v21 = 2112;
      v22 = v8;
      _os_log_impl(&dword_247C4A000, v11, OS_LOG_TYPE_ERROR, "wrong identifier: %@ or label: %@", buf, 0x16u);
    }
    v15 = 0;
  }

  return v15;
}

- (id)initFromLastCheckpointForLabel:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NWPVar *v7;
  NWPVar *v8;
  NWPVar *v9;
  NSObject *v10;
  objc_super v12;
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4)
  {
    v5 = objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("%s-%@"), "NWPVar", v4);
    +[NWPVar _fetchCheckpoint:isPrefix:](NWPVar, "_fetchCheckpoint:isPrefix:", v5, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v12.receiver = self;
      v12.super_class = (Class)NWPVar;
      v7 = -[NWPVar init](&v12, sel_init);
      v8 = v7;
      if (v7)
        -[NWPVar _mirrorFrom:](v7, "_mirrorFrom:", v6);
      self = v8;
      v9 = self;
    }
    else
    {
      nwpvarLogHandle();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v14 = v4;
        _os_log_impl(&dword_247C4A000, v10, OS_LOG_TYPE_ERROR, "identifier failed to recover last valid object for label: %@", buf, 0xCu);
      }

      v9 = 0;
    }

  }
  else
  {
    nwpvarLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v14 = 0;
      _os_log_impl(&dword_247C4A000, v5, OS_LOG_TYPE_ERROR, "wrong label: %@", buf, 0xCu);
    }
    v9 = 0;
  }

  return v9;
}

- (id)_initToCopy
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NWPVar;
  return -[NWPVar init](&v3, sel_init);
}

- (BOOL)setInitialValue:(id)a3
{
  void *v5;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NWPVar.m"), 178, CFSTR("Subclasses must provide an impl for %s"), "-[NWPVar setInitialValue:]");

  return 0;
}

- (BOOL)selectModel:(unint64_t)a3
{
  void *v5;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NWPVar.m"), 184, CFSTR("Subclasses must provide an impl for %s"), "-[NWPVar selectModel:]");

  return 0;
}

- (void)setHyperParams:(id)a3
{
  NSDictionary *hyperParams;
  void *v5;
  NSDictionary *v6;
  NSDictionary *v7;
  NSDictionary *v8;
  NSDictionary *v9;
  id v10;
  _QWORD v11[5];
  id v12;

  v10 = a3;
  hyperParams = self->_hyperParams;
  if (hyperParams)
  {
    v5 = (void *)-[NSDictionary mutableCopy](hyperParams, "mutableCopy");
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __25__NWPVar_setHyperParams___block_invoke;
    v11[3] = &unk_251938C18;
    v11[4] = self;
    v12 = v5;
    v6 = v5;
    objc_msgSend(v10, "enumerateKeysAndObjectsUsingBlock:", v11);
    v7 = (NSDictionary *)-[NSDictionary copy](v6, "copy");
    v8 = self->_hyperParams;
    self->_hyperParams = v7;

  }
  else
  {
    v9 = (NSDictionary *)v10;
    v6 = self->_hyperParams;
    self->_hyperParams = v9;
  }

}

void __25__NWPVar_setHyperParams___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;

  v7 = a2;
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "objectForKeyedSubscript:", v7);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
        objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v5, v7);
    }
  }

}

- (id)predictValueGivenContext:(id)a3 generationId:(id *)a4
{
  void *v6;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NWPVar.m"), 209, CFSTR("Subclasses must provide an impl for %s"), "-[NWPVar predictValueGivenContext:generationId:]");

  return 0;
}

- (BOOL)setReward:(float)a3 onValue:(id)a4 forPredictionGenerationId:(id)a5
{
  void *v7;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler", a4, a5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NWPVar.m"), 215, CFSTR("Subclasses must provide an impl for %s"), "-[NWPVar setReward:onValue:forPredictionGenerationId:]");

  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = -[NWPVar _initToCopy]([NWPVar alloc], "_initToCopy");
  -[NWPVar label](self, "label");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLabel:", v5);

  -[NWPVar exportLabel](self, "exportLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setExportLabel:", v6);

  objc_msgSend(v4, "setModel:", -[NWPVar model](self, "model"));
  objc_msgSend(v4, "setPullCount:", -[NWPVar pullCount](self, "pullCount"));
  -[NWPVar hyperParams](self, "hyperParams");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHyperParams:", v7);

  -[NWPVar allState](self, "allState");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAllState:", v8);

  -[NWPVar referenceValues](self, "referenceValues");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setReferenceValues:", v9);

  -[NWPVar firstValue](self, "firstValue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFirstValue:", v10);

  -[NWPVar expectingRewardOn](self, "expectingRewardOn");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setExpectingRewardOn:", v11);

  objc_msgSend(v4, "setLogicalClock:", -[NWPVar logicalClock](self, "logicalClock"));
  -[NWPVar durableId](self, "durableId");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDurableId:", v12);

  objc_msgSend(v4, "setUseScalarRange:", -[NWPVar useScalarRange](self, "useScalarRange"));
  return v4;
}

- (void)_mirrorFrom:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;

  v4 = a3;
  objc_msgSend(v4, "label");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NWPVar setLabel:](self, "setLabel:", v5);

  objc_msgSend(v4, "exportLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NWPVar setExportLabel:](self, "setExportLabel:", v6);

  -[NWPVar setModel:](self, "setModel:", objc_msgSend(v4, "model"));
  -[NWPVar setPullCount:](self, "setPullCount:", objc_msgSend(v4, "pullCount"));
  objc_msgSend(v4, "hyperParams");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NWPVar setHyperParams:](self, "setHyperParams:", v7);

  objc_msgSend(v4, "allState");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NWPVar setAllState:](self, "setAllState:", v8);

  objc_msgSend(v4, "referenceValues");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NWPVar setReferenceValues:](self, "setReferenceValues:", v9);

  objc_msgSend(v4, "firstValue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NWPVar setFirstValue:](self, "setFirstValue:", v10);

  objc_msgSend(v4, "expectingRewardOn");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NWPVar setExpectingRewardOn:](self, "setExpectingRewardOn:", v11);

  -[NWPVar setLogicalClock:](self, "setLogicalClock:", objc_msgSend(v4, "logicalClock"));
  objc_msgSend(v4, "durableId");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NWPVar setDurableId:](self, "setDurableId:", v12);

  v13 = objc_msgSend(v4, "useScalarRange");
  -[NWPVar setUseScalarRange:](self, "setUseScalarRange:", v13);
}

- (void)_setToCleanSlate
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NWPVarValueItem *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[NWPVar referenceValues](self, "referenceValues", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(v3, "addObject:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9));
        v10 = objc_alloc_init(NWPVarValueItem);
        objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:", v4, v3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NWPVar setAllState:](self, "setAllState:", v11);

  -[NWPVar setPullCount:](self, "setPullCount:", 0);
  -[NWPVar setExpectingRewardOn:](self, "setExpectingRewardOn:", 0);
  -[NWPVar setDurableId:](self, "setDurableId:", 0);

}

+ (id)_serviceQueue
{
  if (_serviceQueue_onceToken != -1)
    dispatch_once(&_serviceQueue_onceToken, &__block_literal_global_74);
  return (id)_serviceQueue_service_queue;
}

void __23__NWPVar__serviceQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("com.apple.symptoms.NWPVar", 0);
  v1 = (void *)_serviceQueue_service_queue;
  _serviceQueue_service_queue = (uint64_t)v0;

}

+ (id)_backgroundQueue
{
  if (_backgroundQueue_onceToken != -1)
    dispatch_once(&_backgroundQueue_onceToken, &__block_literal_global_76);
  return (id)_backgroundQueue_background_queue;
}

void __26__NWPVar__backgroundQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.symptoms.NWPVar.background", v2);
  v1 = (void *)_backgroundQueue_background_queue;
  _backgroundQueue_background_queue = (uint64_t)v0;

}

+ (void)setBackingStore:(id)a3
{
  objc_storeStrong((id *)&_backingStore, a3);
}

+ (id)_defaultBackingStore
{
  return (id)_backingStore;
}

+ (id)_fetchCheckpoint:(id)a3 isPrefix:(BOOL)a4
{
  id v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD block[4];
  id v11;
  uint64_t *v12;
  BOOL v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v5 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy_;
  v18 = __Block_byref_object_dispose_;
  v19 = 0;
  +[NWPVar _serviceQueue](NWPVar, "_serviceQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __36__NWPVar__fetchCheckpoint_isPrefix___block_invoke;
  block[3] = &unk_251938C80;
  v13 = a4;
  v11 = v5;
  v12 = &v14;
  v7 = v5;
  dispatch_sync(v6, block);

  v8 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  return v8;
}

void __36__NWPVar__fetchCheckpoint_isPrefix___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  const char *v14;
  int v15;
  uint64_t v16;
  __int16 v17;
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  +[NWPVar _defaultBackingStore](NWPVar, "_defaultBackingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    if (*(_BYTE *)(a1 + 48))
    {
      v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C0]), "initWithKey:ascending:", CFSTR("timeStamp"), 0);
      objc_msgSend(v2, "listItemsNameWithPrefix:sortDescriptor:", *(_QWORD *)(a1 + 32), v3);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4;
      if (v4 && objc_msgSend(v4, "count"))
      {
        nwpvarLogHandle();
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
        {
          v15 = 134218242;
          v16 = objc_msgSend(v5, "count");
          v17 = 2112;
          v18 = (const char *)v5;
          _os_log_impl(&dword_247C4A000, v6, OS_LOG_TYPE_DEBUG, "fetch returned %lu keys: %@", (uint8_t *)&v15, 0x16u);
        }

        objc_msgSend(v5, "firstObject");
        v7 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v7 = 0;
      }

      if (v7)
        goto LABEL_14;
    }
    else
    {
      v7 = *(id *)(a1 + 32);
      if (v7)
      {
LABEL_14:
        objc_msgSend(v2, "fetchItemUnderName:verificationBlock:", v7, 0);
        v10 = objc_claimAutoreleasedReturnValue();
        v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
        v12 = *(NSObject **)(v11 + 40);
        *(_QWORD *)(v11 + 40) = v10;
LABEL_20:

        goto LABEL_21;
      }
    }
    nwpvarLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = *(_QWORD *)(a1 + 32);
      v14 = (const char *)&unk_247C52FCE;
      if (!*(_BYTE *)(a1 + 48))
        v14 = "not ";
      v15 = 138412546;
      v16 = v13;
      v17 = 2080;
      v18 = v14;
      _os_log_impl(&dword_247C4A000, v12, OS_LOG_TYPE_ERROR, "Unable to fetch %@, %sprefixed", (uint8_t *)&v15, 0x16u);
    }
    goto LABEL_20;
  }
  nwpvarLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    v8 = *(_QWORD *)(a1 + 32);
    v9 = (const char *)&unk_247C52FCE;
    if (!*(_BYTE *)(a1 + 48))
      v9 = "not ";
    v15 = 138412546;
    v16 = v8;
    v17 = 2080;
    v18 = v9;
    _os_log_impl(&dword_247C4A000, v7, OS_LOG_TYPE_ERROR, "No backing store to fetch %@, %sprefixed", (uint8_t *)&v15, 0x16u);
  }
LABEL_21:

}

- (int64_t)_pruneOldCheckpoints
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  int64_t v6;
  NSObject *v7;
  uint8_t buf[16];

  +[NWPVar _defaultBackingStore](NWPVar, "_defaultBackingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = (void *)MEMORY[0x24BDD1758];
    objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceNow:", -604800.0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "predicateWithFormat:", CFSTR("%K BEGINSWITH %@ AND %K < %@"), CFSTR("identifier"), CFSTR("NWPVar"), CFSTR("timeStamp"), v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = objc_msgSend(v2, "deleteItemsMatchingPredicate:", v5);
  }
  else
  {
    nwpvarLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_247C4A000, v7, OS_LOG_TYPE_ERROR, "No backing store to prune", buf, 2u);
    }

    v6 = 0;
  }

  return v6;
}

- (id)checkpoint
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
  +[NWPVar _serviceQueue](NWPVar, "_serviceQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __20__NWPVar_checkpoint__block_invoke;
  v6[3] = &unk_251938CD0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __20__NWPVar_checkpoint__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  double v18;
  NSObject *v19;
  _QWORD block[5];
  id v21;
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  +[NWPVar _defaultBackingStore](NWPVar, "_defaultBackingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "durableId");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v3)
    {
      objc_msgSend(MEMORY[0x24BDD1880], "UUID");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "setDurableId:", v4);

    }
    v5 = objc_msgSend(*(id *)(a1 + 32), "copy");
    v6 = objc_alloc(MEMORY[0x24BDD17C8]);
    objc_msgSend(*(id *)(a1 + 32), "label");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "durableId");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "UUIDString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v6, "initWithFormat:", CFSTR("%s-%@-%@"), "NWPVar", v7, v9);

    if (objc_msgSend(v2, "storeUnderName:item:", v10, v5))
    {
      objc_msgSend(*(id *)(a1 + 32), "durableId");
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v13 = *(void **)(v12 + 40);
      *(_QWORD *)(v12 + 40) = v11;

    }
    else
    {
      nwpvarLogHandle();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        v15 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 134218242;
        v23 = v15;
        v24 = 2112;
        v25 = v10;
        _os_log_impl(&dword_247C4A000, v14, OS_LOG_TYPE_ERROR, "(%p) failed to archive and import as: %@", buf, 0x16u);
      }

    }
    objc_msgSend(MEMORY[0x24BDBCE60], "now");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (!checkpointsLastPruned || (objc_msgSend(v16, "timeIntervalSinceDate:"), v18 > 604800.0))
    {
      +[NWPVar _serviceQueue](NWPVar, "_serviceQueue");
      v19 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __20__NWPVar_checkpoint__block_invoke_92;
      block[3] = &unk_251938CA8;
      block[4] = *(_QWORD *)(a1 + 32);
      v21 = v17;
      dispatch_async(v19, block);

    }
  }
  else
  {
    nwpvarLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_247C4A000, v5, OS_LOG_TYPE_ERROR, "No backing store to checkpoint to", buf, 2u);
    }
  }

}

void __20__NWPVar_checkpoint__block_invoke_92(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v2 = objc_msgSend(*(id *)(a1 + 32), "_pruneOldCheckpoints");
  nwpvarLogHandle();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = 134218240;
    v6 = v4;
    v7 = 2048;
    v8 = v2;
    _os_log_impl(&dword_247C4A000, v3, OS_LOG_TYPE_DEFAULT, "(%p) removed %ld stale checkpoints", (uint8_t *)&v5, 0x16u);
  }

  objc_storeStrong((id *)&checkpointsLastPruned, *(id *)(a1 + 40));
}

- (id)migrateToValueSpace:(id)a3
{
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NWPVar)initWithCoder:(id)a3
{
  id v4;
  NWPVar *v5;
  void *v6;
  uint64_t v7;
  NSString *label;
  uint64_t v9;
  NSString *exportLabel;
  uint64_t v11;
  NSDictionary *hyperParams;
  uint64_t v13;
  NSDictionary *allState;
  uint64_t v15;
  NSArray *referenceValues;
  uint64_t v17;
  NSSecureCoding *firstValue;
  uint64_t v19;
  NSSecureCoding *expectingRewardOn;
  uint64_t v21;
  NSUUID *durableId;
  objc_super v24;

  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)NWPVar;
  v5 = -[NWPVar init](&v24, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x24958F0D4]();
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("label"));
    v7 = objc_claimAutoreleasedReturnValue();
    label = v5->_label;
    v5->_label = (NSString *)v7;

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("exportLabel"));
    v9 = objc_claimAutoreleasedReturnValue();
    exportLabel = v5->_exportLabel;
    v5->_exportLabel = (NSString *)v9;

    v5->_model = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("model"));
    v5->_pullCount = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("pullCount"));
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("hyperParams"));
    v11 = objc_claimAutoreleasedReturnValue();
    hyperParams = v5->_hyperParams;
    v5->_hyperParams = (NSDictionary *)v11;

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("allState"));
    v13 = objc_claimAutoreleasedReturnValue();
    allState = v5->_allState;
    v5->_allState = (NSDictionary *)v13;

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("referenceValues"));
    v15 = objc_claimAutoreleasedReturnValue();
    referenceValues = v5->_referenceValues;
    v5->_referenceValues = (NSArray *)v15;

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("firstValue"));
    v17 = objc_claimAutoreleasedReturnValue();
    firstValue = v5->_firstValue;
    v5->_firstValue = (NSSecureCoding *)v17;

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("expectingRewardOn"));
    v19 = objc_claimAutoreleasedReturnValue();
    expectingRewardOn = v5->_expectingRewardOn;
    v5->_expectingRewardOn = (NSSecureCoding *)v19;

    v5->_logicalClock = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("logicalClock"));
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("durableId"));
    v21 = objc_claimAutoreleasedReturnValue();
    durableId = v5->_durableId;
    v5->_durableId = (NSUUID *)v21;

    v5->_useScalarRange = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("useScalarRange"));
    objc_autoreleasePoolPop(v6);
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v4 = (void *)MEMORY[0x24958F0D4]();
  -[NWPVar label](self, "label");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "encodeObject:forKey:", v5, CFSTR("label"));

  -[NWPVar exportLabel](self, "exportLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "encodeObject:forKey:", v6, CFSTR("exportLabel"));

  objc_msgSend(v13, "encodeInteger:forKey:", -[NWPVar model](self, "model"), CFSTR("model"));
  objc_msgSend(v13, "encodeInteger:forKey:", -[NWPVar pullCount](self, "pullCount"), CFSTR("pullCount"));
  -[NWPVar hyperParams](self, "hyperParams");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "encodeObject:forKey:", v7, CFSTR("hyperParams"));

  -[NWPVar allState](self, "allState");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "encodeObject:forKey:", v8, CFSTR("allState"));

  -[NWPVar referenceValues](self, "referenceValues");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "encodeObject:forKey:", v9, CFSTR("referenceValues"));

  -[NWPVar firstValue](self, "firstValue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "encodeObject:forKey:", v10, CFSTR("firstValue"));

  -[NWPVar expectingRewardOn](self, "expectingRewardOn");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "encodeObject:forKey:", v11, CFSTR("expectingRewardOn"));

  objc_msgSend(v13, "encodeInt64:forKey:", -[NWPVar logicalClock](self, "logicalClock"), CFSTR("logicalClock"));
  -[NWPVar durableId](self, "durableId");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "encodeObject:forKey:", v12, CFSTR("durableId"));

  objc_msgSend(v13, "encodeBool:forKey:", -[NWPVar useScalarRange](self, "useScalarRange"), CFSTR("useScalarRange"));
  objc_autoreleasePoolPop(v4);

}

- (id)description
{
  id v3;
  const char *v4;

  v3 = objc_alloc(MEMORY[0x24BDD17C8]);
  v4 = "num";
  if (!self->_useScalarRange)
    v4 = "var";
  return (id)objc_msgSend(v3, "initWithFormat:", CFSTR("(%p) label: %@, exportLabel: %@, model: %lu, pullCount: %lu, %s-range, initVal: %@, expecting: %@, logical-clock: %llu, state: %@"), self, *(_OWORD *)&self->_label, self->_model, self->_pullCount, v4, self->_firstValue, self->_expectingRewardOn, self->_logicalClock, self->_allState);
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_storeStrong((id *)&self->_label, a3);
}

- (NSString)exportLabel
{
  return self->_exportLabel;
}

- (void)setExportLabel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (unint64_t)model
{
  return self->_model;
}

- (void)setModel:(unint64_t)a3
{
  self->_model = a3;
}

- (NSDictionary)hyperParams
{
  return self->_hyperParams;
}

- (unint64_t)pullCount
{
  return self->_pullCount;
}

- (void)setPullCount:(unint64_t)a3
{
  self->_pullCount = a3;
}

- (id)telemetryReporter
{
  return self->_telemetryReporter;
}

- (void)setTelemetryReporter:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSDictionary)allState
{
  return self->_allState;
}

- (void)setAllState:(id)a3
{
  objc_storeStrong((id *)&self->_allState, a3);
}

- (NSArray)referenceValues
{
  return self->_referenceValues;
}

- (void)setReferenceValues:(id)a3
{
  objc_storeStrong((id *)&self->_referenceValues, a3);
}

- (NSSecureCoding)firstValue
{
  return self->_firstValue;
}

- (void)setFirstValue:(id)a3
{
  objc_storeStrong((id *)&self->_firstValue, a3);
}

- (NSSecureCoding)expectingRewardOn
{
  return self->_expectingRewardOn;
}

- (void)setExpectingRewardOn:(id)a3
{
  objc_storeStrong((id *)&self->_expectingRewardOn, a3);
}

- (unint64_t)logicalClock
{
  return self->_logicalClock;
}

- (void)setLogicalClock:(unint64_t)a3
{
  self->_logicalClock = a3;
}

- (NSUUID)durableId
{
  return self->_durableId;
}

- (void)setDurableId:(id)a3
{
  objc_storeStrong((id *)&self->_durableId, a3);
}

- (BOOL)useScalarRange
{
  return self->_useScalarRange;
}

- (void)setUseScalarRange:(BOOL)a3
{
  self->_useScalarRange = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_durableId, 0);
  objc_storeStrong((id *)&self->_expectingRewardOn, 0);
  objc_storeStrong((id *)&self->_firstValue, 0);
  objc_storeStrong((id *)&self->_referenceValues, 0);
  objc_storeStrong((id *)&self->_allState, 0);
  objc_storeStrong(&self->_telemetryReporter, 0);
  objc_storeStrong((id *)&self->_hyperParams, 0);
  objc_storeStrong((id *)&self->_exportLabel, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

+ (void)_setCustomBackingStore:(id)a3
{
  objc_storeStrong((id *)&_backingStore, a3);
}

- (id)_pullCounts
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[NWPVar allState](self, "allState", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v8);
        -[NWPVar allState](self, "allState");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectForKeyedSubscript:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", objc_msgSend(v11, "armPullCount"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }

  return v3;
}

@end
