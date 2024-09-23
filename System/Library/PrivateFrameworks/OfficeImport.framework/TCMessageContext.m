@implementation TCMessageContext

+ (void)initialize
{
  if ((id)objc_opt_class() == a1 && (initAllMessages(void)::alreadyDone & 1) == 0)
  {
    initAllMessages(void)::alreadyDone = 1;
    objc_opt_class();
  }
}

- (TCMessageContext)init
{
  TCMessageContext *v2;
  NSMutableSet *v3;
  NSMutableSet *m_warnings;
  NSMutableSet *v5;
  NSMutableSet *m_errors;
  NSMutableArray *v7;
  NSMutableArray *m_affectedObjectStack;
  NSMutableDictionary *v9;
  NSMutableDictionary *m_placeholderToObjectMap;
  dispatch_queue_t v11;
  OS_dispatch_queue *mMessageSyncQueue;
  TCMessageContext *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)TCMessageContext;
  v2 = -[TCMessageContext init](&v15, sel_init);
  if (!v2)
    goto LABEL_6;
  v3 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
  m_warnings = v2->m_warnings;
  v2->m_warnings = v3;

  v5 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
  m_errors = v2->m_errors;
  v2->m_errors = v5;

  v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
  m_affectedObjectStack = v2->m_affectedObjectStack;
  v2->m_affectedObjectStack = v7;

  v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
  m_placeholderToObjectMap = v2->m_placeholderToObjectMap;
  v2->m_placeholderToObjectMap = v9;

  m_importedFileIsSS = 1;
  v11 = dispatch_queue_create("com.apple.iWork.TCMessageContext", 0);
  mMessageSyncQueue = v2->mMessageSyncQueue;
  v2->mMessageSyncQueue = (OS_dispatch_queue *)v11;

  if (!v2->m_warnings)
    goto LABEL_6;
  if (v2->m_errors && v2->m_affectedObjectStack)
    v13 = v2;
  else
LABEL_6:
    v13 = 0;

  return v13;
}

- (void)dealloc
{
  OS_dispatch_queue *mMessageSyncQueue;
  objc_super v4;

  mMessageSyncQueue = self->mMessageSyncQueue;
  if (mMessageSyncQueue)
  {
    self->mMessageSyncQueue = 0;

  }
  v4.receiver = self;
  v4.super_class = (Class)TCMessageContext;
  -[TCMessageContext dealloc](&v4, sel_dealloc);
}

+ (void)reportObjectOrPlaceholder:(id)a3 withWarning:(id)a4 parameters:(char *)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v7 = a4;
  if (v7)
  {
    objc_msgSend(MEMORY[0x24BDD17F0], "currentThread");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "threadDictionary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKey:", CFSTR("TCMessageContext Instance"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
      objc_msgSend(v10, "reportWarningForObject:warning:parameterList:", v11, v7, a5);

  }
}

+ (id)currentObjectOrPlaceholder
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDD17F0], "currentThread");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "threadDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("TCMessageContext Instance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "currentObjectOrPlaceholder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (void)reportObject:(id)a3 withWarning:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;

  v6 = a3;
  v7 = a4;
  if (v7)
    objc_msgSend(a1, "reportObjectOrPlaceholder:withWarning:parameters:", v6, v7, &v8);

}

+ (void)reportWarning:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;

  v4 = a3;
  if (v4)
  {
    objc_msgSend(a1, "currentObjectOrPlaceholder");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "reportObjectOrPlaceholder:withWarning:parameters:", v5, v4, &v6);

  }
}

+ (void)reportError:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  TCMessageEntry *v7;
  uint64_t v8;
  void *v9;
  TCMessageEntry *v10;
  uint64_t v11;

  v3 = a3;
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDD17F0], "currentThread");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "threadDictionary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", CFSTR("TCMessageContext Instance"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = [TCMessageEntry alloc];
      v8 = objc_msgSend(v3, "messageTag");
      objc_msgSend(v3, "messageText");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[TCMessageEntry initWithTag:affectedObject:text:parameters:](v7, "initWithTag:affectedObject:text:parameters:", v8, 0, v9, &v11);

      objc_msgSend(v6, "addErrorMessageEntry:", v10);
    }

  }
}

+ (void)reportWarningException:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSException *v9;

  v9 = (NSException *)a3;
  objc_msgSend(MEMORY[0x24BDD17F0], "currentThread");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "threadDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("TCMessageContext Instance"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    createEntryForException(v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "currentObjectOrPlaceholder");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addAffectedObject:", v8);

    objc_msgSend(v6, "addWarningMessageEntry:", v7);
  }

}

+ (void)reportErrorException:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSException *v7;

  v7 = (NSException *)a3;
  objc_msgSend(MEMORY[0x24BDD17F0], "currentThread");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "threadDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("TCMessageContext Instance"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    createEntryForException(v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addErrorMessageEntry:", v6);

  }
}

+ (void)createContextForCurrentThread
{
  void *v2;
  void *v3;
  TCMessageContext *v4;

  v4 = objc_alloc_init(TCMessageContext);
  objc_msgSend(MEMORY[0x24BDD17F0], "currentThread");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "threadDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("TCMessageContext Instance"));

}

+ (void)removeContextForCurrentThread
{
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x24BDD17F0], "currentThread");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "threadDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObjectForKey:", CFSTR("TCMessageContext Instance"));

}

+ (id)getWarningArray
{
  void *v2;
  void *v3;
  id *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDD17F0], "currentThread");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "threadDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("TCMessageContext Instance"));
  v4 = (id *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v4[1], "allObjects");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sortedArrayUsingSelector:", sel_timeStampCompare_);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)getErrorArray
{
  void *v2;
  void *v3;
  id *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDD17F0], "currentThread");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "threadDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("TCMessageContext Instance"));
  v4 = (id *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v4[2], "allObjects");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sortedArrayUsingSelector:", sel_timeStampCompare_);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (unint64_t)getErrorCount
{
  void *v2;
  void *v3;
  id *v4;
  unint64_t v5;

  objc_msgSend(MEMORY[0x24BDD17F0], "currentThread");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "threadDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("TCMessageContext Instance"));
  v4 = (id *)objc_claimAutoreleasedReturnValue();

  if (v4)
    v5 = objc_msgSend(v4[2], "count");
  else
    v5 = 0;

  return v5;
}

+ (void)setIsFileStructuredStorage:(BOOL)a3
{
  m_importedFileIsSS = a3;
}

+ (BOOL)isFileStructuredStorage
{
  return m_importedFileIsSS;
}

+ (void)pushAffectedObject:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(MEMORY[0x24BDD17F0], "currentThread");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "threadDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("TCMessageContext Instance"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "pushAffectedObject:", v6);
}

+ (void)popAffectedObject
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x24BDD17F0], "currentThread");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "threadDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("TCMessageContext Instance"));
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "popAffectedObject");
}

+ (void)pushAffectedObjectPlaceholder
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x24BDD17F0], "currentThread");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "threadDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("TCMessageContext Instance"));
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "pushAffectedObjectPlaceholder");
}

+ (void)popAffectedObjectPlaceholder:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(MEMORY[0x24BDD17F0], "currentThread");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "threadDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("TCMessageContext Instance"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "popAffectedObjectPlaceholder:", v6);
}

+ (unint64_t)saveAffectedObjectStack
{
  void *v2;
  void *v3;
  void *v4;
  unint64_t v5;

  objc_msgSend(MEMORY[0x24BDD17F0], "currentThread");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "threadDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("TCMessageContext Instance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "saveAffectedObjectStack");
  return v5;
}

+ (void)restoreAffectedObjectStack:(unint64_t)a3
{
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x24BDD17F0], "currentThread");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "threadDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("TCMessageContext Instance"));
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "restoreAffectedObjectStack:", a3);
}

+ (void)reportWarningsToDelegate
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x24BDD17F0], "currentThread");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "threadDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("TCMessageContext Instance"));
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "reportWarningsToDelegate");
}

- (void)reportWarningForObject:(id)a3 warning:(id)a4 parameterList:(char *)a5
{
  id v8;
  void *v9;
  NSObject *mMessageSyncQueue;
  id v11;
  _QWORD block[4];
  id v13;
  id v14;
  TCMessageContext *v15;
  char *v16;

  v11 = a3;
  v8 = a4;
  v9 = v8;
  if (v8)
  {
    mMessageSyncQueue = self->mMessageSyncQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __65__TCMessageContext_reportWarningForObject_warning_parameterList___block_invoke;
    block[3] = &unk_24F39CC70;
    v13 = v8;
    v15 = self;
    v16 = a5;
    v14 = v11;
    dispatch_sync(mMessageSyncQueue, block);

  }
}

void __65__TCMessageContext_reportWarningForObject_warning_parameterList___block_invoke(uint64_t a1)
{
  TCMessageEntry *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  TCMessageEntry *v6;

  v2 = [TCMessageEntry alloc];
  v3 = objc_msgSend(*(id *)(a1 + 32), "messageTag");
  v4 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "messageText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[TCMessageEntry initWithTag:affectedObject:text:parameters:](v2, "initWithTag:affectedObject:text:parameters:", v3, v4, v5, *(_QWORD *)(a1 + 56));

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 8), "tc_addMessageEntry:", v6);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mMessageSyncQueue, 0);
  objc_storeStrong((id *)&self->m_placeholderToObjectMap, 0);
  objc_storeStrong((id *)&self->m_affectedObjectStack, 0);
  objc_storeStrong((id *)&self->m_errors, 0);
  objc_storeStrong((id *)&self->m_warnings, 0);
}

- (id)currentObjectOrPlaceholder
{
  NSObject *mMessageSyncQueue;
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
  v9 = __Block_byref_object_copy__22;
  v10 = __Block_byref_object_dispose__22;
  v11 = 0;
  mMessageSyncQueue = self->mMessageSyncQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __55__TCMessageContext_Private__currentObjectOrPlaceholder__block_invoke;
  v5[3] = &unk_24F39CC98;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(mMessageSyncQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __55__TCMessageContext_Private__currentObjectOrPlaceholder__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "lastObject");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  v5 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  if (v5 == v6)
  {
    *(_QWORD *)(v7 + 40) = 0;

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v12 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
      objc_msgSend(v12, "setInUse:", 1);
      objc_msgSend(v12, "key");
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v11 = *(void **)(v10 + 40);
      *(_QWORD *)(v10 + 40) = v9;

    }
  }
}

- (void)addErrorMessageEntry:(id)a3
{
  id v4;
  NSObject *mMessageSyncQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  mMessageSyncQueue = self->mMessageSyncQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __50__TCMessageContext_Private__addErrorMessageEntry___block_invoke;
  block[3] = &unk_24F39CCC0;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(mMessageSyncQueue, block);

}

uint64_t __50__TCMessageContext_Private__addErrorMessageEntry___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "tc_addMessageEntry:", *(_QWORD *)(a1 + 40));
}

- (void)addWarningMessageEntry:(id)a3
{
  id v4;
  NSObject *mMessageSyncQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  mMessageSyncQueue = self->mMessageSyncQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __52__TCMessageContext_Private__addWarningMessageEntry___block_invoke;
  block[3] = &unk_24F39CCC0;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(mMessageSyncQueue, block);

}

uint64_t __52__TCMessageContext_Private__addWarningMessageEntry___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "tc_addMessageEntry:", *(_QWORD *)(a1 + 40));
}

- (void)pushAffectedObject:(id)a3
{
  id v4;
  NSObject *mMessageSyncQueue;
  id v6;
  _QWORD block[4];
  id v8;
  TCMessageContext *v9;

  v4 = a3;
  mMessageSyncQueue = self->mMessageSyncQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __48__TCMessageContext_Private__pushAffectedObject___block_invoke;
  block[3] = &unk_24F39CCC0;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_sync(mMessageSyncQueue, block);

}

void __48__TCMessageContext_Private__pushAffectedObject___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  id v4;
  id v5;

  v2 = *(id *)(a1 + 32);
  if (!*(_QWORD *)(a1 + 32))
  {
    v4 = v2;
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v3 = objc_claimAutoreleasedReturnValue();

    v2 = (id)v3;
  }
  v5 = v2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "addObject:", v2);

}

- (void)popAffectedObject
{
  NSObject *mMessageSyncQueue;
  _QWORD block[5];

  mMessageSyncQueue = self->mMessageSyncQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __46__TCMessageContext_Private__popAffectedObject__block_invoke;
  block[3] = &unk_24F39CCE8;
  block[4] = self;
  dispatch_sync(mMessageSyncQueue, block);
}

void __46__TCMessageContext_Private__popAffectedObject__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "lastObject");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_opt_class();
  TSUDynamicCast(v2, (uint64_t)v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "removeLastObject");

}

- (void)pushAffectedObjectPlaceholder
{
  NSObject *mMessageSyncQueue;
  _QWORD block[5];

  mMessageSyncQueue = self->mMessageSyncQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __58__TCMessageContext_Private__pushAffectedObjectPlaceholder__block_invoke;
  block[3] = &unk_24F39CCE8;
  block[4] = self;
  dispatch_sync(mMessageSyncQueue, block);
}

void __58__TCMessageContext_Private__pushAffectedObjectPlaceholder__block_invoke(uint64_t a1)
{
  TCMessagePlaceholderInfo *v2;

  v2 = objc_alloc_init(TCMessagePlaceholderInfo);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "addObject:");

}

- (void)resolveObjectOfCurrentAffectedObjectPlaceholder
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  NSMutableDictionary *m_placeholderToObjectMap;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  void *v15;
  BOOL v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  -[NSMutableArray lastObject](self->m_affectedObjectStack, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_class();
  TSUDynamicCast(v4, (uint64_t)v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    if (objc_msgSend(v5, "isInUse"))
    {
      m_placeholderToObjectMap = self->m_placeholderToObjectMap;
      objc_msgSend(v6, "key");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary objectForKeyedSubscript:](m_placeholderToObjectMap, "objectForKeyedSubscript:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v9)
      {
        v24 = 0u;
        v25 = 0u;
        v22 = 0u;
        v23 = 0u;
        -[NSMutableArray reverseObjectEnumerator](self->m_affectedObjectStack, "reverseObjectEnumerator", 0);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = (id)objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
        if (v11)
        {
          v12 = *(_QWORD *)v23;
          while (2)
          {
            for (i = 0; i != v11; i = (char *)i + 1)
            {
              if (*(_QWORD *)v23 != v12)
                objc_enumerationMutation(v10);
              v14 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)i);
              if (v14 != v6)
              {
                objc_msgSend(MEMORY[0x24BDBCEF8], "null");
                v15 = (void *)objc_claimAutoreleasedReturnValue();
                v16 = v14 == v15;

                if (!v16)
                {
                  v11 = v14;
                  goto LABEL_15;
                }
              }
            }
            v11 = (id)objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
            if (v11)
              continue;
            break;
          }
        }
LABEL_15:

        v17 = objc_opt_class();
        TSUDynamicCast(v17, (uint64_t)v11);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = v18;
        if (v18)
        {
          objc_msgSend(v18, "key");
          v20 = objc_claimAutoreleasedReturnValue();

          v11 = (id)v20;
          objc_msgSend(v19, "setInUse:", 1);
        }

        objc_msgSend(v6, "key");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[TCMessageContext setAffectedObject:forPlaceholderWithKey:](self, "setAffectedObject:forPlaceholderWithKey:", v11, v21);

      }
    }
  }

}

- (void)popAffectedObjectPlaceholder:(id)a3
{
  id v4;
  NSObject *mMessageSyncQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  mMessageSyncQueue = self->mMessageSyncQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __58__TCMessageContext_Private__popAffectedObjectPlaceholder___block_invoke;
  block[3] = &unk_24F39CCC0;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(mMessageSyncQueue, block);

}

void __58__TCMessageContext_Private__popAffectedObjectPlaceholder___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "lastObject");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_opt_class();
  TSUDynamicCast(v2, (uint64_t)v10);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3 && objc_msgSend(v3, "isInUse"))
  {
    v5 = *(void **)(a1 + 40);
    if (!v5
      || (objc_msgSend(MEMORY[0x24BDBCEF8], "null"),
          v6 = (void *)objc_claimAutoreleasedReturnValue(),
          v6,
          v5 == v6))
    {
      objc_msgSend(*(id *)(a1 + 32), "resolveObjectOfCurrentAffectedObjectPlaceholder");
    }
    else
    {
      v7 = *(void **)(a1 + 32);
      v8 = *(_QWORD *)(a1 + 40);
      objc_msgSend(v4, "key");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setAffectedObject:forPlaceholderWithKey:", v8, v9);

    }
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "removeLastObject");
}

- (unint64_t)saveAffectedObjectStack
{
  NSObject *mMessageSyncQueue;
  unint64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  mMessageSyncQueue = self->mMessageSyncQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __52__TCMessageContext_Private__saveAffectedObjectStack__block_invoke;
  v5[3] = &unk_24F39CC98;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(mMessageSyncQueue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __52__TCMessageContext_Private__saveAffectedObjectStack__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "count");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)restoreAffectedObjectStack:(unint64_t)a3
{
  NSObject *mMessageSyncQueue;
  _QWORD v4[6];

  mMessageSyncQueue = self->mMessageSyncQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __56__TCMessageContext_Private__restoreAffectedObjectStack___block_invoke;
  v4[3] = &unk_24F39CD10;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(mMessageSyncQueue, v4);
}

unint64_t __56__TCMessageContext_Private__restoreAffectedObjectStack___block_invoke(uint64_t a1)
{
  unint64_t result;
  void *v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "count");
  for (result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "count");
        result > *(_QWORD *)(a1 + 40);
        result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "count"))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "lastObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(*(id *)(a1 + 32), "resolveObjectOfCurrentAffectedObjectPlaceholder");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "removeLastObject");

  }
  return result;
}

- (void)setAffectedObject:(id)a3 forPlaceholderWithKey:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;

  v6 = a3;
  v7 = a4;
  v8 = v6;
  v9 = v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  -[NSMutableDictionary setObject:forKey:](self->m_placeholderToObjectMap, "setObject:forKey:", v8, v7);

}

- (void)replacePlaceholdersWithObjects
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  __CFString *v10;
  __CFString *i;
  uint64_t v12;
  __CFString *v13;
  id v14;
  void *v15;

  if (-[NSMutableDictionary count](self->m_placeholderToObjectMap, "count"))
  {
    v14 = (id)-[NSMutableSet copy](self->m_warnings, "copy");
    objc_msgSend(v14, "objectEnumerator");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    while (1)
    {
      objc_msgSend(v15, "nextObject");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      if (!v3)
        break;
      objc_msgSend(v3, "affectedObjects");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "count");
      v7 = v6;
      if (v6)
      {
        v8 = 0;
        v9 = v6;
        do
        {
          objc_msgSend(v5, "objectAtIndex:", --v9);
          v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
          if (v10 == CFSTR("kTCMessageContext_NullObjectThatMakesWarningUnremovable"))
          {
            objc_msgSend(v5, "removeObjectAtIndex:", v9);
            v8 = 1;
          }
          else
          {
            -[NSMutableDictionary objectForKey:](self->m_placeholderToObjectMap, "objectForKey:", v10);
            for (i = (__CFString *)objc_claimAutoreleasedReturnValue(); ; i = (__CFString *)v12)
            {
              -[NSMutableDictionary objectForKey:](self->m_placeholderToObjectMap, "objectForKey:", i);
              v12 = objc_claimAutoreleasedReturnValue();
              if (!v12)
                break;

            }
            if (i)
            {
              objc_msgSend(MEMORY[0x24BDBCEF8], "null");
              v13 = (__CFString *)objc_claimAutoreleasedReturnValue();

              if (i == v13)
              {
                objc_msgSend(v5, "removeObjectAtIndex:", v9);
              }
              else if (i == CFSTR("kTCMessageContext_NullObjectThatMakesWarningUnremovable"))
              {
                objc_msgSend(v5, "removeObjectAtIndex:", v9);
                v8 = 1;
              }
              else
              {
                objc_msgSend(v5, "replaceObjectAtIndex:withObject:", v9, i);
              }
              -[NSMutableDictionary setObject:forKey:](self->m_placeholderToObjectMap, "setObject:forKey:", i, v10);
            }

          }
        }
        while (v9);
        if (v7)
        {
          if (!((objc_msgSend(v5, "count") != 0) | v8 & 1))
            -[NSMutableSet removeObject:](self->m_warnings, "removeObject:", v4);
        }
      }

    }
    -[NSMutableDictionary removeAllObjects](self->m_placeholderToObjectMap, "removeAllObjects");

  }
}

@end
