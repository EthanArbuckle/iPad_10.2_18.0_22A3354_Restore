@implementation PXActivityCoordinator

- (PXActivityCoordinator)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXActivityCoordinator.m"), 42, CFSTR("%s is not available as initializer"), "-[PXActivityCoordinator init]");

  abort();
}

- (PXActivityCoordinator)initWithActivityName:(id)a3
{
  id v4;
  PXActivityCoordinator *v5;
  uint64_t v6;
  NSString *activityName;
  NSMutableArray *v8;
  NSMutableArray *records;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PXActivityCoordinator;
  v5 = -[PXActivityCoordinator init](&v11, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    activityName = v5->_activityName;
    v5->_activityName = (NSString *)v6;

    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    records = v5->_records;
    v5->_records = v8;

  }
  return v5;
}

- (void)registerItem:(id)a3
{
  id v4;
  PXActivityCoordinatorRecord *v5;
  NSMutableArray *records;
  PXActivityCoordinatorRecord *v7;
  NSObject *v8;
  _QWORD v9[4];
  PXActivityCoordinatorRecord *v10;
  uint8_t buf[4];
  PXActivityCoordinator *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[PXActivityCoordinatorRecord initWithItem:]([PXActivityCoordinatorRecord alloc], "initWithItem:", v4);
  records = self->_records;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __38__PXActivityCoordinator_registerItem___block_invoke;
  v9[3] = &unk_1E5140418;
  v7 = v5;
  v10 = v7;
  if (-[NSMutableArray indexOfObjectPassingTest:](records, "indexOfObjectPassingTest:", v9) == 0x7FFFFFFFFFFFFFFFLL)
  {
    PLUIGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v12 = self;
      v13 = 2114;
      v14 = v4;
      _os_log_impl(&dword_1A6789000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ registering item %{public}@", buf, 0x16u);
    }

    -[NSMutableArray addObject:](self->_records, "addObject:", v7);
    -[PXActivityCoordinator _update](self, "_update");
  }

}

- (void)unregisterItem:(id)a3
{
  id v4;
  PXActivityCoordinatorRecord *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  int v9;
  PXActivityCoordinator *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[PXActivityCoordinatorRecord initWithItem:]([PXActivityCoordinatorRecord alloc], "initWithItem:", v4);
  v6 = -[NSMutableArray indexOfObject:](self->_records, "indexOfObject:", v5);
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = v6;
    PLUIGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 138543618;
      v10 = self;
      v11 = 2114;
      v12 = v4;
      _os_log_impl(&dword_1A6789000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ unregistering item %{public}@", (uint8_t *)&v9, 0x16u);
    }

    -[NSMutableArray removeObjectAtIndex:](self->_records, "removeObjectAtIndex:", v7);
    -[PXActivityCoordinator _update](self, "_update");
  }

}

- (void)_update
{
  id v4;
  NSMutableArray *records;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, void *, unint64_t);
  void *v10;
  id v11;
  PXActivityCoordinator *v12;
  uint64_t *v13;
  SEL v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;

  v4 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  records = self->_records;
  v7 = MEMORY[0x1E0C809B0];
  v8 = 3221225472;
  v9 = __32__PXActivityCoordinator__update__block_invoke;
  v10 = &unk_1E5140440;
  v13 = &v15;
  v6 = v4;
  v14 = a2;
  v11 = v6;
  v12 = self;
  -[NSMutableArray enumerateObjectsUsingBlock:](records, "enumerateObjectsUsingBlock:", &v7);
  if (v16[3] >= 1)
    -[NSMutableArray removeObjectsAtIndexes:](self->_records, "removeObjectsAtIndexes:", v6, v7, v8, v9, v10);

  _Block_object_dispose(&v15, 8);
}

- (id)description
{
  id v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@ %p: %@>"), v5, self, self->_activityName);

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityName, 0);
  objc_storeStrong((id *)&self->_records, 0);
}

void __32__PXActivityCoordinator__update__block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  int v15;
  uint64_t v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  objc_msgSend(v5, "item");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v8 = *(_QWORD *)(v7 + 24);
  if (v6)
  {
    if (v8 > a3)
    {
      PXAssertGetLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v15) = 0;
        _os_log_error_impl(&dword_1A6789000, v9, OS_LOG_TYPE_ERROR, "The number of dead records should never be greater than the enumeration index!", (uint8_t *)&v15, 2u);
      }

      v8 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
    }
    v10 = a3 - v8;
    PLUIGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = *(_QWORD *)(a1 + 40);
      objc_msgSend(v5, "item");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543874;
      v16 = v12;
      v17 = 2114;
      v18 = v13;
      v19 = 2048;
      v20 = v10;
      _os_log_impl(&dword_1A6789000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ updating item %{public}@ with queue position %ld", (uint8_t *)&v15, 0x20u);

    }
    objc_msgSend(v5, "item");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setActivityCoordinatorQueuePosition:", v10);

  }
  else
  {
    *(_QWORD *)(v7 + 24) = v8 + 1;
    objc_msgSend(*(id *)(a1 + 32), "addIndex:", a3);
  }

}

uint64_t __38__PXActivityCoordinator_registerItem___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isEqual:", *(_QWORD *)(a1 + 32));
}

+ (id)coordinatorForActivity:(id)a3
{
  id v3;
  PXActivityCoordinator *v4;

  v3 = a3;
  if (coordinatorForActivity__onceToken != -1)
    dispatch_once(&coordinatorForActivity__onceToken, &__block_literal_global_256836);
  objc_msgSend((id)coordinatorForActivity__coordinators, "objectForKeyedSubscript:", v3);
  v4 = (PXActivityCoordinator *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    v4 = -[PXActivityCoordinator initWithActivityName:]([PXActivityCoordinator alloc], "initWithActivityName:", v3);
    objc_msgSend((id)coordinatorForActivity__coordinators, "setObject:forKeyedSubscript:", v4, v3);
  }

  return v4;
}

void __48__PXActivityCoordinator_coordinatorForActivity___block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v1 = (void *)coordinatorForActivity__coordinators;
  coordinatorForActivity__coordinators = (uint64_t)v0;

}

@end
