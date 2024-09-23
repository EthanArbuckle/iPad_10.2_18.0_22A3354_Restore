@implementation _PICompositionControllerTransaction

- (_PICompositionControllerTransaction)init
{
  _PICompositionControllerTransaction *v2;
  NSMutableSet *v3;
  NSMutableSet *changes;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_PICompositionControllerTransaction;
  v2 = -[_PICompositionControllerTransaction init](&v6, sel_init);
  v3 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
  changes = v2->_changes;
  v2->_changes = v3;

  return v2;
}

- (void)begin
{
  ++self->_count;
}

- (BOOL)commit
{
  unint64_t count;
  unint64_t v3;
  NSObject *v5;
  void *v6;
  const void **v7;
  void *specific;
  NSObject *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  count = self->_count;
  if (!count)
  {
    NUAssertLogger_1235();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid transaction count"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138543362;
      v19 = v6;
      _os_log_error_impl(&dword_1A6382000, v5, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&v18, 0xCu);

    }
    v7 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_1235();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v10)
      {
        v13 = dispatch_get_specific(*v7);
        v14 = (void *)MEMORY[0x1E0CB3978];
        v15 = v13;
        objc_msgSend(v14, "callStackSymbols");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "componentsJoinedByString:", CFSTR("\n"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = 138543618;
        v19 = v13;
        v20 = 2114;
        v21 = v17;
        _os_log_error_impl(&dword_1A6382000, v9, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&v18, 0x16u);

      }
    }
    else if (v10)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "componentsJoinedByString:", CFSTR("\n"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138543362;
      v19 = v12;
      _os_log_error_impl(&dword_1A6382000, v9, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&v18, 0xCu);

    }
    _NUAssertFailHandler();
  }
  v3 = count - 1;
  self->_count = v3;
  return v3 == 0;
}

- (void)didAddAdjustment:(id)a3
{
  -[NSMutableSet addObject:](self->_changes, "addObject:", a3);
}

- (void)didRemoveAdjustment:(id)a3
{
  -[NSMutableSet addObject:](self->_changes, "addObject:", a3);
}

- (void)didUpdateAdjustment:(id)a3
{
  -[NSMutableSet addObject:](self->_changes, "addObject:", a3);
}

- (void)didUpdateAdjustments:(id)a3
{
  -[NSMutableSet addObjectsFromArray:](self->_changes, "addObjectsFromArray:", a3);
}

- (NSArray)changes
{
  return (NSArray *)-[NSMutableSet allObjects](self->_changes, "allObjects");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_changes, 0);
}

@end
