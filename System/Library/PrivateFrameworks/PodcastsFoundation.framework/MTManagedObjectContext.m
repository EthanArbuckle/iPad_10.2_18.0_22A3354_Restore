@implementation MTManagedObjectContext

- (void)performBlock:(id)a3
{
  id v3;
  objc_super v4;
  _QWORD v5[4];
  MTManagedObjectContext *v6;
  id v7;

  v5[1] = 3221225472;
  v5[2] = __39__MTManagedObjectContext_performBlock___block_invoke;
  v5[3] = &unk_1E54D1018;
  v6 = self;
  v7 = a3;
  v4.receiver = v6;
  v4.super_class = (Class)MTManagedObjectContext;
  v5[0] = MEMORY[0x1E0C809B0];
  v3 = v7;
  -[MTManagedObjectContext performBlock:](&v4, sel_performBlock_, v5);

}

- (id)objectWithID:(id)a3
{
  id v4;
  void *v5;
  objc_super v7;

  v4 = a3;
  -[MTManagedObjectContext validateConcurencyType](self, "validateConcurencyType");
  v7.receiver = self;
  v7.super_class = (Class)MTManagedObjectContext;
  -[MTManagedObjectContext objectWithID:](&v7, sel_objectWithID_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)existingObjectWithID:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;
  MTManagedObjectContext *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v6 = a3;
  -[MTManagedObjectContext validateConcurencyType](self, "validateConcurencyType");
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy_;
  v18 = __Block_byref_object_dispose_;
  v19 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __53__MTManagedObjectContext_existingObjectWithID_error___block_invoke;
  v10[3] = &unk_1E54D0FC8;
  v13 = &v14;
  v7 = v6;
  v11 = v7;
  v12 = self;
  -[MTManagedObjectContext handleError:withCallback:](self, "handleError:withCallback:", a4, v10);
  v8 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  return v8;
}

- (id)objectRegisteredForID:(id)a3
{
  id v4;
  void *v5;
  objc_super v7;

  v4 = a3;
  -[MTManagedObjectContext validateConcurencyType](self, "validateConcurencyType");
  v7.receiver = self;
  v7.super_class = (Class)MTManagedObjectContext;
  -[MTManagedObjectContext objectRegisteredForID:](&v7, sel_objectRegisteredForID_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)executeFetchRequest:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;
  MTManagedObjectContext *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v6 = a3;
  -[MTManagedObjectContext validateConcurencyType](self, "validateConcurencyType");
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy_;
  v18 = __Block_byref_object_dispose_;
  v19 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __52__MTManagedObjectContext_executeFetchRequest_error___block_invoke;
  v10[3] = &unk_1E54D0FC8;
  v13 = &v14;
  v7 = v6;
  v11 = v7;
  v12 = self;
  -[MTManagedObjectContext handleError:withCallback:](self, "handleError:withCallback:", a4, v10);
  v8 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  return v8;
}

- (void)validateConcurencyType
{
  id v3;
  char v4;
  NSObject *v5;
  uint8_t v6[16];

  if (-[MTManagedObjectContext concurrencyType](self, "concurrencyType") == 1)
  {
    if (!-[MTManagedObjectContext _isInternalCoreDataQueue](self, "_isInternalCoreDataQueue"))
    {
      objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("Fetch request is not being run within a performBlock!"), 0);
      v3 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v3);
    }
  }
  else
  {
    v4 = objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
    if (!+[PFClientUtil isRunningOnHomepod](PFClientUtil, "isRunningOnHomepod") || (v4 & 1) != 0)
    {
      if ((v4 & 1) != 0)
        return;
    }
    else if (-[MTManagedObjectContext _isInternalCoreDataQueue](self, "_isInternalCoreDataQueue"))
    {
      return;
    }
    _MTLogCategoryDefault();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1A904E000, v5, OS_LOG_TYPE_ERROR, "NSMainQueueConcurrencyType should be run on main thread", v6, 2u);
    }

  }
}

- (BOOL)_isInternalCoreDataQueue
{
  void *v3;
  BOOL v4;
  NSObject *v5;
  MTManagedObjectContext *v6;
  MTManagedObjectContext *v7;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", dispatch_queue_get_label(0));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "hasPrefix:", CFSTR("SQLQueue")) & 1) != 0
    || (objc_msgSend(v3, "hasPrefix:", CFSTR("NSSQLiteConnection")) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    dispatch_get_current_queue();
    v5 = objc_claimAutoreleasedReturnValue();
    dispatch_get_context(v5);
    v6 = (MTManagedObjectContext *)objc_claimAutoreleasedReturnValue();

    if (v6 == self)
    {
      v4 = 1;
    }
    else
    {
      -[MTManagedObjectContext persistentStoreCoordinator](self, "persistentStoreCoordinator");
      v7 = (MTManagedObjectContext *)objc_claimAutoreleasedReturnValue();
      v4 = v6 == v7;

    }
  }

  return v4;
}

- (BOOL)handleError:(id *)a3 withCallback:(id)a4
{
  void (**v5)(id, id *);
  id v6;
  id v7;
  id v9;

  v5 = (void (**)(id, id *))a4;
  v9 = 0;
  v5[2](v5, &v9);
  v6 = v9;
  if (v9)
  {
    v7 = v9;
    if (a3)
    {
      *a3 = objc_retainAutorelease(v9);
      v7 = v9;
    }
    if (objc_msgSend(v7, "code") == 259)
    {
      if (+[PFClientUtil isPodcastsApp](PFClientUtil, "isPodcastsApp"))
      {
        +[IMMetrics recordUserAction:dataSource:](IMMetrics, "recordUserAction:dataSource:", CFSTR("corrupt_db"), v9);
        +[MTDB setCorrupt:](MTDB, "setCorrupt:", 1);
      }
      exit(0);
    }
  }

  return v6 == 0;
}

void __52__MTManagedObjectContext_executeFetchRequest_error___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  objc_super v7;

  v3 = *(_QWORD *)(a1 + 32);
  v7.receiver = *(id *)(a1 + 40);
  v7.super_class = (Class)MTManagedObjectContext;
  objc_msgSendSuper2(&v7, sel_executeFetchRequest_error_, v3, a2);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

void __39__MTManagedObjectContext_performBlock___block_invoke(uint64_t a1)
{
  NSObject *v2;
  os_signpost_id_t v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  _MTLogCategoryDatabase();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_signpost_id_generate(v2);

  _MTLogCategoryDatabase();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 216);
    v9 = 138543362;
    v10 = v6;
    _os_signpost_emit_with_name_impl(&dword_1A904E000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "performBlock", "context: %{public}@", (uint8_t *)&v9, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  _MTLogCategoryDatabase();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    LOWORD(v9) = 0;
    _os_signpost_emit_with_name_impl(&dword_1A904E000, v8, OS_SIGNPOST_INTERVAL_END, v3, "performBlock", ", (uint8_t *)&v9, 2u);
  }

}

- (void)performBlockAndWait:(id)a3
{
  id v4;
  NSObject *v5;
  NSString *v6;
  NSObject *v7;
  os_signpost_id_t v8;
  NSObject *v9;
  NSObject *v10;
  NSString *mt_immutableName;
  id v12;
  objc_super v13;
  _QWORD v14[5];
  id v15;
  os_signpost_id_t v16;
  uint8_t buf[4];
  NSString *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread")
    && -[MTManagedObjectContext type](self, "type") == 1
    && (isRunningUnitTests() & 1) == 0)
  {
    _MTLogCategoryDatabase();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v6 = (NSString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v18 = v6;
      _os_log_impl(&dword_1A904E000, v5, OS_LOG_TYPE_ERROR, "Blocking the main thread on a background queue is error prone:\n %@", buf, 0xCu);

    }
  }
  _MTLogCategoryDatabase();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_signpost_id_generate(v7);

  _MTLogCategoryDatabase();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    mt_immutableName = self->_mt_immutableName;
    *(_DWORD *)buf = 138543362;
    v18 = mt_immutableName;
    _os_signpost_emit_with_name_impl(&dword_1A904E000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "performBlockAndWait waiting", "context: %{public}@", buf, 0xCu);
  }

  v14[1] = 3221225472;
  v14[2] = __46__MTManagedObjectContext_performBlockAndWait___block_invoke;
  v14[3] = &unk_1E54D0FF0;
  v15 = v4;
  v16 = v8;
  v14[4] = self;
  v13.receiver = self;
  v13.super_class = (Class)MTManagedObjectContext;
  v14[0] = MEMORY[0x1E0C809B0];
  v12 = v4;
  -[MTManagedObjectContext performBlockAndWait:](&v13, sel_performBlockAndWait_, v14);

}

void __46__MTManagedObjectContext_performBlockAndWait___block_invoke(_QWORD *a1)
{
  NSObject *v2;
  NSObject *v3;
  os_signpost_id_t v4;
  NSObject *v5;
  os_signpost_id_t v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  int v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  _MTLogCategoryDatabase();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = v2;
  v4 = a1[6];
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    LOWORD(v12) = 0;
    _os_signpost_emit_with_name_impl(&dword_1A904E000, v3, OS_SIGNPOST_INTERVAL_END, v4, "performBlockAndWait waiting", ", (uint8_t *)&v12, 2u);
  }

  _MTLogCategoryDatabase();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_signpost_id_generate(v5);

  _MTLogCategoryDatabase();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    v9 = *(_QWORD *)(a1[4] + 216);
    v12 = 138543362;
    v13 = v9;
    _os_signpost_emit_with_name_impl(&dword_1A904E000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "performBlockAndWait performing", "context: %{public}@", (uint8_t *)&v12, 0xCu);
  }

  (*(void (**)(void))(a1[5] + 16))();
  _MTLogCategoryDatabase();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    LOWORD(v12) = 0;
    _os_signpost_emit_with_name_impl(&dword_1A904E000, v11, OS_SIGNPOST_INTERVAL_END, v6, "performBlockAndWait performing", ", (uint8_t *)&v12, 2u);
  }

}

- (int64_t)type
{
  return self->_type;
}

void __53__MTManagedObjectContext_existingObjectWithID_error___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  objc_super v7;

  v3 = *(_QWORD *)(a1 + 32);
  v7.receiver = *(id *)(a1 + 40);
  v7.super_class = (Class)MTManagedObjectContext;
  objc_msgSendSuper2(&v7, sel_existingObjectWithID_error_, v3, a2);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (MTManagedObjectContext)initWithConcurrencyType:(unint64_t)a3 name:(id)a4
{
  id v6;
  MTManagedObjectContext *v7;
  uint64_t v8;
  NSString *mt_immutableName;
  objc_super v11;

  v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)MTManagedObjectContext;
  v7 = -[MTManagedObjectContext initWithConcurrencyType:](&v11, sel_initWithConcurrencyType_, a3);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    mt_immutableName = v7->_mt_immutableName;
    v7->_mt_immutableName = (NSString *)v8;

    -[MTManagedObjectContext setName:](v7, "setName:", v6);
  }

  return v7;
}

id __53__MTManagedObjectContext_countForFetchRequest_error___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  id result;
  objc_super v5;

  v3 = *(_QWORD *)(a1 + 32);
  v5.receiver = *(id *)(a1 + 40);
  v5.super_class = (Class)MTManagedObjectContext;
  result = objc_msgSendSuper2(&v5, sel_countForFetchRequest_error_, v3, a2);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (unint64_t)countForFetchRequest:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  unint64_t v8;
  _QWORD v10[4];
  id v11;
  MTManagedObjectContext *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;

  v6 = a3;
  -[MTManagedObjectContext validateConcurencyType](self, "validateConcurencyType");
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __53__MTManagedObjectContext_countForFetchRequest_error___block_invoke;
  v10[3] = &unk_1E54D0FC8;
  v13 = &v14;
  v7 = v6;
  v11 = v7;
  v12 = self;
  -[MTManagedObjectContext handleError:withCallback:](self, "handleError:withCallback:", a4, v10);
  v8 = v15[3];

  _Block_object_dispose(&v14, 8);
  return v8;
}

- (MTManagedObjectContext)initWithConcurrencyType:(unint64_t)a3
{
  return -[MTManagedObjectContext initWithConcurrencyType:name:](self, "initWithConcurrencyType:name:", a3, &stru_1E5500770);
}

- (void)deleteObject:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  -[MTManagedObjectContext validateConcurencyType](self, "validateConcurencyType");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[MTManagedObjectContext validatePodcastDeletion:](self, "validatePodcastDeletion:", v4);
  if (v4)
  {
    v5.receiver = self;
    v5.super_class = (Class)MTManagedObjectContext;
    -[MTManagedObjectContext deleteObject:](&v5, sel_deleteObject_, v4);
  }

}

- (void)validatePodcastDeletion:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;

  v3 = a3;
  objc_msgSend(v3, "episodes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    _MTLogCategoryDatabase();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      -[MTManagedObjectContext validatePodcastDeletion:].cold.1(v3, v6);

  }
}

- (void)insertObject:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  -[MTManagedObjectContext validateConcurencyType](self, "validateConcurencyType");
  v5.receiver = self;
  v5.super_class = (Class)MTManagedObjectContext;
  -[MTManagedObjectContext insertObject:](&v5, sel_insertObject_, v4);

}

- (void)reset
{
  objc_super v3;

  -[MTManagedObjectContext validateConcurencyType](self, "validateConcurencyType");
  v3.receiver = self;
  v3.super_class = (Class)MTManagedObjectContext;
  -[MTManagedObjectContext reset](&v3, sel_reset);
}

- (BOOL)isResetable
{
  return self->_isResetable;
}

- (void)setIsResetable:(BOOL)a3
{
  self->_isResetable = a3;
}

- (NSString)mt_immutableName
{
  return self->_mt_immutableName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mt_immutableName, 0);
}

- (void)validatePodcastDeletion:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_fault_impl(&dword_1A904E000, a2, OS_LOG_TYPE_FAULT, "Deleting podcast %@ without deleting its episodes first will cause on exception on context save.", (uint8_t *)&v4, 0xCu);

}

@end
