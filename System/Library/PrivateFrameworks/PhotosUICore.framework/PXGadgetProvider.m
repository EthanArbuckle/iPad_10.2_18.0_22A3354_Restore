@implementation PXGadgetProvider

- (PXGadgetProvider)init
{
  PXGadgetProvider *v2;
  objc_class *v3;
  uint64_t v4;
  NSString *identifier;
  NSArray *v6;
  NSArray *gadgets;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PXGadgetProvider;
  v2 = -[PXGadgetProvider init](&v9, sel_init);
  if (v2)
  {
    v3 = (objc_class *)objc_opt_class();
    NSStringFromClass(v3);
    v4 = objc_claimAutoreleasedReturnValue();
    identifier = v2->_identifier;
    v2->_identifier = (NSString *)v4;

    v6 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99D20]);
    gadgets = v2->_gadgets;
    v2->_gadgets = v6;

  }
  return v2;
}

- (PXGadgetProvider)initWithIdentifier:(id)a3
{
  id v6;
  PXGadgetProvider *v7;
  PXGadgetProvider *v8;
  NSArray *v9;
  NSArray *gadgets;
  void *v12;
  objc_super v13;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGadgetProvider.m"), 39, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifier"));

  }
  v13.receiver = self;
  v13.super_class = (Class)PXGadgetProvider;
  v7 = -[PXGadgetProvider init](&v13, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_identifier, a3);
    v9 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99D20]);
    gadgets = v8->_gadgets;
    v8->_gadgets = v9;

  }
  return v8;
}

- (unint64_t)estimatedNumberOfGadgets
{
  void *v4;
  objc_class *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGadgetProvider.m"), 66, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXGadgetProvider estimatedNumberOfGadgets]", v6);

  abort();
}

- (void)generateGadgets
{
  void *v4;
  objc_class *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGadgetProvider.m"), 70, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXGadgetProvider generateGadgets]", v6);

  abort();
}

- (void)performChanges:(id)a3
{
  _BOOL8 v4;
  void (**v5)(id, PXGadgetProvider *);

  v5 = (void (**)(id, PXGadgetProvider *))a3;
  v4 = -[PXGadgetProvider isPerformingChanges](self, "isPerformingChanges");
  -[PXGadgetProvider setIsPerformingChanges:](self, "setIsPerformingChanges:", 1);
  if (v5)
    v5[2](v5, self);
  -[PXGadgetProvider setIsPerformingChanges:](self, "setIsPerformingChanges:", v4);
  if (!-[PXGadgetProvider isPerformingChanges](self, "isPerformingChanges"))
    -[PXGadgetProvider _updateIfNeeded](self, "_updateIfNeeded");

}

- (void)addGadgets:(id)a3
{
  NSObject *v5;
  uint64_t v6;
  NSObject *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t v30[128];
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  NSObject *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!-[PXGadgetProvider isPerformingChanges](self, "isPerformingChanges"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGadgetProvider.m"), 87, CFSTR("[%@] %@ must be called from a performChanges block."), self, v25);

  }
  v6 = -[NSObject count](v5, "count");
  PLUIGetLog();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
  if (v6)
  {
    if (v8)
    {
      NSStringFromSelector(a2);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v32 = v9;
      v33 = 2112;
      v34 = v5;
      _os_log_impl(&dword_1A6789000, v7, OS_LOG_TYPE_DEBUG, "%@: Adding Gadgets %@", buf, 0x16u);

    }
    v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSObject count](v5, "count"));
    -[PXGadgetProvider gadgets](self, "gadgets");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v11 = v5;
    v12 = -[NSObject countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v27 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
          if ((objc_msgSend(v10, "containsObject:", v16) & 1) == 0)
          {
            -[NSObject addObject:](v7, "addObject:", v16);
            objc_msgSend(v16, "setDelegate:", self);
          }
        }
        v13 = -[NSObject countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      }
      while (v13);
    }

    if (-[NSObject count](v7, "count"))
    {
      -[PXGadgetProvider gadgets](self, "gadgets");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "arrayByAddingObjectsFromArray:", v7);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXGadgetProvider setGadgets:](self, "setGadgets:", v18);

      PLUIGetLog();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        NSStringFromSelector(a2);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v32 = v20;
        v33 = 2112;
        v34 = v7;
        _os_log_impl(&dword_1A6789000, v19, OS_LOG_TYPE_DEBUG, "%@: Added Gadgets %@", buf, 0x16u);

      }
      -[PXGadgetProvider setInvalidGadgets:](self, "setInvalidGadgets:", 1);
    }
    else
    {
      PLUIGetLog();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      {
        NSStringFromSelector(a2);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v32 = v23;
        _os_log_impl(&dword_1A6789000, v22, OS_LOG_TYPE_DEBUG, "%@: No Gadgets added", buf, 0xCu);

      }
    }

  }
  else if (v8)
  {
    NSStringFromSelector(a2);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v32 = v21;
    _os_log_impl(&dword_1A6789000, v7, OS_LOG_TYPE_DEBUG, "%@: Ignoring attempt to add zero gadgets", buf, 0xCu);

  }
}

- (void)insertGadgets:(id)a3 atIndexes:(id)a4
{
  NSObject *v7;
  id v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t i;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  const char *aSelector;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  NSObject *v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (!-[PXGadgetProvider isPerformingChanges](self, "isPerformingChanges"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGadgetProvider.m"), 116, CFSTR("[%@] %@ must be called from a performChanges block."), self, v26);

  }
  v9 = -[NSObject count](v7, "count");
  if (-[NSObject count](v7, "count"))
  {
    if (v9 != objc_msgSend(v8, "count"))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGadgetProvider.m"), 120, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("gadgetCount == indexes.count"));

    }
    PLUIGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(a2);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v31 = v11;
      v32 = 2112;
      v33 = v7;
      v34 = 2112;
      v35 = v8;
      _os_log_impl(&dword_1A6789000, v10, OS_LOG_TYPE_DEBUG, "%@: Inserting Gadgets %@ at indexes %@", buf, 0x20u);

    }
    aSelector = a2;

    v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSObject count](v7, "count"));
    v13 = objc_msgSend(v8, "firstIndex");
    v14 = objc_alloc_init(MEMORY[0x1E0CB3788]);
    -[PXGadgetProvider gadgets](self, "gadgets");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v15, "mutableCopy");

    if (v9)
    {
      for (i = 0; i != v9; ++i)
      {
        -[NSObject objectAtIndexedSubscript:](v7, "objectAtIndexedSubscript:", i);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v16, "containsObject:", v18) & 1) == 0)
        {
          -[NSObject addObject:](v12, "addObject:", v18);
          objc_msgSend(v14, "addIndex:", v13);
          objc_msgSend(v18, "setDelegate:", self);
        }
        v13 = objc_msgSend(v8, "indexGreaterThanIndex:", v13);

      }
    }
    v19 = -[NSObject count](v12, "count");
    if (v19 != objc_msgSend(v14, "count"))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", aSelector, self, CFSTR("PXGadgetProvider.m"), 142, CFSTR("number of gadgets to insert does not match the number of indexes specified"));

    }
    if (-[NSObject count](v12, "count"))
    {
      objc_msgSend(v16, "insertObjects:atIndexes:", v12, v14);
      -[PXGadgetProvider setGadgets:](self, "setGadgets:", v16);
      PLUIGetLog();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        NSStringFromSelector(aSelector);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v31 = v21;
        v32 = 2112;
        v33 = v12;
        v34 = 2112;
        v35 = v14;
        _os_log_impl(&dword_1A6789000, v20, OS_LOG_TYPE_DEBUG, "%@: Inserted gadgets %@ at indexes %@", buf, 0x20u);

      }
      -[PXGadgetProvider setInvalidGadgets:](self, "setInvalidGadgets:", 1);
    }
    else
    {
      PLUIGetLog();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      {
        NSStringFromSelector(aSelector);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v31 = v24;
        _os_log_impl(&dword_1A6789000, v23, OS_LOG_TYPE_DEBUG, "%@: No Gadgets added", buf, 0xCu);

      }
    }

  }
  else
  {
    PLUIGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(a2);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v31 = v22;
      _os_log_impl(&dword_1A6789000, v12, OS_LOG_TYPE_DEBUG, "%@: Ignoring attempt to insert zero gadgets", buf, 0xCu);

    }
  }

}

- (void)removeGadgets:(id)a3
{
  NSObject *v5;
  uint64_t v6;
  NSObject *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t v29[128];
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  NSObject *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!-[PXGadgetProvider isPerformingChanges](self, "isPerformingChanges"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGadgetProvider.m"), 155, CFSTR("[%@] %@ must be called from a performChanges block."), self, v24);

  }
  v6 = -[NSObject count](v5, "count");
  PLUIGetLog();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
  if (v6)
  {
    if (v8)
    {
      NSStringFromSelector(a2);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v31 = v9;
      v32 = 2112;
      v33 = v5;
      _os_log_impl(&dword_1A6789000, v7, OS_LOG_TYPE_DEBUG, "%@: Removing gadgets %@", buf, 0x16u);

    }
    v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSObject count](v5, "count"));
    -[PXGadgetProvider gadgets](self, "gadgets");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v11 = v5;
    v12 = -[NSObject countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v26 != v14)
            objc_enumerationMutation(v11);
          v16 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i);
          if (objc_msgSend(v10, "containsObject:", v16))
          {
            -[NSObject addObject:](v7, "addObject:", v16);
            -[PXGadgetProvider _teardownGadget:](self, "_teardownGadget:", v16);
          }
        }
        v13 = -[NSObject countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      }
      while (v13);
    }

    if (-[NSObject count](v7, "count"))
    {
      -[PXGadgetProvider gadgets](self, "gadgets");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "mutableCopy");

      -[NSObject removeObjectsInArray:](v18, "removeObjectsInArray:", v7);
      -[PXGadgetProvider setGadgets:](self, "setGadgets:", v18);
      PLUIGetLog();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        NSStringFromSelector(a2);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v31 = v20;
        v32 = 2112;
        v33 = v7;
        _os_log_impl(&dword_1A6789000, v19, OS_LOG_TYPE_DEBUG, "%@: Removed gadgets %@", buf, 0x16u);

      }
      -[PXGadgetProvider setInvalidGadgets:](self, "setInvalidGadgets:", 1);
    }
    else
    {
      PLUIGetLog();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        NSStringFromSelector(a2);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v31 = v22;
        _os_log_impl(&dword_1A6789000, v18, OS_LOG_TYPE_DEBUG, "%@: No gadgets removed", buf, 0xCu);

      }
    }

  }
  else if (v8)
  {
    NSStringFromSelector(a2);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v31 = v21;
    _os_log_impl(&dword_1A6789000, v7, OS_LOG_TYPE_DEBUG, "%@: Ignoring attempt to remove zero gadgets", buf, 0xCu);

  }
}

- (void)removeGadgetsAtIndexes:(id)a3
{
  id v5;
  uint64_t v6;
  NSObject *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[5];
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!-[PXGadgetProvider isPerformingChanges](self, "isPerformingChanges"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGadgetProvider.m"), 186, CFSTR("[%@] %@ must be called from a performChanges block."), self, v15);

  }
  v6 = objc_msgSend(v5, "count");
  PLUIGetLog();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
  if (v6)
  {
    if (v8)
    {
      NSStringFromSelector(a2);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v18 = v9;
      v19 = 2112;
      v20 = v5;
      _os_log_impl(&dword_1A6789000, v7, OS_LOG_TYPE_DEBUG, "%@: Removing gadgets at indexes %@", buf, 0x16u);

    }
    -[PXGadgetProvider gadgets](self, "gadgets");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v10, "mutableCopy");

    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __43__PXGadgetProvider_removeGadgetsAtIndexes___block_invoke;
    v16[3] = &unk_1E5117888;
    v16[4] = self;
    -[NSObject enumerateObjectsAtIndexes:options:usingBlock:](v7, "enumerateObjectsAtIndexes:options:usingBlock:", v5, 0, v16);
    -[NSObject removeObjectsAtIndexes:](v7, "removeObjectsAtIndexes:", v5);
    -[PXGadgetProvider setGadgets:](self, "setGadgets:", v7);
    PLUIGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(a2);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v18 = v12;
      v19 = 2112;
      v20 = v5;
      _os_log_impl(&dword_1A6789000, v11, OS_LOG_TYPE_DEBUG, "%@: Removed gadgets at indexes %@", buf, 0x16u);

    }
    -[PXGadgetProvider setInvalidGadgets:](self, "setInvalidGadgets:", 1);
  }
  else if (v8)
  {
    NSStringFromSelector(a2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v18 = v13;
    _os_log_impl(&dword_1A6789000, v7, OS_LOG_TYPE_DEBUG, "%@: Ignoring attempt to remove gadgets at zero indexes", buf, 0xCu);

  }
}

- (void)removeAllGadgets
{
  NSObject *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  id v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (!-[PXGadgetProvider isPerformingChanges](self, "isPerformingChanges"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGadgetProvider.m"), 206, CFSTR("[%@] %@ must be called from a performChanges block."), self, v17);

  }
  PLUIGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v23 = v5;
    _os_log_impl(&dword_1A6789000, v4, OS_LOG_TYPE_DEBUG, "%@: Removing all gadgets", buf, 0xCu);

  }
  -[PXGadgetProvider gadgets](self, "gadgets");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count"))
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v7 = v6;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v19;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v19 != v10)
            objc_enumerationMutation(v7);
          -[PXGadgetProvider _teardownGadget:](self, "_teardownGadget:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v11++));
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
      }
      while (v9);
    }

    -[PXGadgetProvider setGadgets:](self, "setGadgets:", MEMORY[0x1E0C9AA60]);
    PLUIGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(a2);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v23 = v13;
      v24 = 2112;
      v25 = v7;
      _os_log_impl(&dword_1A6789000, v12, OS_LOG_TYPE_DEBUG, "%@: Removed gadgets %@", buf, 0x16u);

    }
    -[PXGadgetProvider setInvalidGadgets:](self, "setInvalidGadgets:", 1);
  }
  else
  {
    PLUIGetLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(a2);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v23 = v15;
      _os_log_impl(&dword_1A6789000, v14, OS_LOG_TYPE_DEBUG, "%@: No gadgets removed", buf, 0xCu);

    }
  }

}

- (void)_updateIfNeeded
{
  uint64_t v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;

  if (-[PXGadgetProvider invalidGadgets](self, "invalidGadgets"))
  {
    -[PXGadgetProvider delegate](self, "delegate");
    v3 = objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      v4 = (void *)v3;
      -[PXGadgetProvider delegate](self, "delegate");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_opt_respondsToSelector();

      if ((v6 & 1) != 0)
      {
        -[PXGadgetProvider delegate](self, "delegate");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "invalidateGadgets");

      }
    }
    -[PXGadgetProvider setInvalidGadgets:](self, "setInvalidGadgets:", 0);
  }
}

- (void)_teardownGadget:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "setDelegate:", 0);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "gadgetWasDismissed");

}

- (id)gadgetViewControllerHostingGadget:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;

  v4 = a3;
  -[PXGadgetProvider nextGadgetResponder](self, "nextGadgetResponder");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5
    && (v6 = (void *)v5,
        -[PXGadgetProvider nextGadgetResponder](self, "nextGadgetResponder"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_opt_respondsToSelector(),
        v7,
        v6,
        (v8 & 1) != 0))
  {
    -[PXGadgetProvider nextGadgetResponder](self, "nextGadgetResponder");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "gadgetViewControllerHostingGadget:", v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)gadget:(id)a3 animateChanges:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  id v12;

  v12 = a3;
  v6 = a4;
  -[PXGadgetProvider nextGadgetResponder](self, "nextGadgetResponder");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[PXGadgetProvider nextGadgetResponder](self, "nextGadgetResponder");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_opt_respondsToSelector();

    if ((v10 & 1) != 0)
    {
      -[PXGadgetProvider nextGadgetResponder](self, "nextGadgetResponder");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "gadget:animateChanges:", v12, v6);

    }
  }

}

- (void)gadget:(id)a3 didChange:(unint64_t)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  _QWORD v13[4];
  id v14;

  v6 = a3;
  v7 = v6;
  if ((a4 & 0x20) != 0)
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __37__PXGadgetProvider_gadget_didChange___block_invoke;
    v13[3] = &unk_1E5145360;
    v14 = v6;
    -[PXGadgetProvider performChanges:](self, "performChanges:", v13);

  }
  -[PXGadgetProvider nextGadgetResponder](self, "nextGadgetResponder");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[PXGadgetProvider nextGadgetResponder](self, "nextGadgetResponder");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_opt_respondsToSelector();

    if ((v11 & 1) != 0)
    {
      -[PXGadgetProvider nextGadgetResponder](self, "nextGadgetResponder");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "gadget:didChange:", v7, a4);

    }
  }

}

- (BOOL)gadget:(id)a3 transitionToViewController:(id)a4 animated:(BOOL)a5 completion:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  char v15;

  v7 = a5;
  v10 = a3;
  v11 = a4;
  v12 = a6;
  -[PXGadgetProvider nextGadgetResponder](self, "nextGadgetResponder");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
    v15 = objc_msgSend(v13, "gadget:transitionToViewController:animated:completion:", v10, v11, v7, v12);
  else
    v15 = 0;

  return v15;
}

- (void)presentGadgetViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  id v10;

  v5 = a4;
  v8 = a5;
  v9 = a3;
  -[PXGadgetProvider nextGadgetResponder](self, "nextGadgetResponder");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "presentGadgetViewController:animated:completion:", v9, v5, v8);

}

- (void)dismissGadgetViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  id v10;

  v5 = a4;
  v8 = a5;
  v9 = a3;
  -[PXGadgetProvider nextGadgetResponder](self, "nextGadgetResponder");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dismissGadgetViewController:animated:completion:", v9, v5, v8);

}

- (id)presentationEnvironmentForGadget:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[PXGadgetProvider nextGadgetResponder](self, "nextGadgetResponder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "presentationEnvironmentForGadget:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (PXGadgetTransition)gadgetTransition
{
  void *v2;
  void *v3;

  -[PXGadgetProvider nextGadgetResponder](self, "nextGadgetResponder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "gadgetTransition");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (PXGadgetTransition *)v3;
}

- (PXGadgetNavigationHelper)rootNavigationHelper
{
  void *v2;
  void *v3;

  -[PXGadgetProvider nextGadgetResponder](self, "nextGadgetResponder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "rootNavigationHelper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (PXGadgetNavigationHelper *)v3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (PXGadgetProviderDelegate)delegate
{
  return (PXGadgetProviderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (PXGadgetDelegate)nextGadgetResponder
{
  return (PXGadgetDelegate *)objc_loadWeakRetained((id *)&self->_nextGadgetResponder);
}

- (void)setNextGadgetResponder:(id)a3
{
  objc_storeWeak((id *)&self->_nextGadgetResponder, a3);
}

- (NSArray)gadgets
{
  return (NSArray *)objc_getProperty(self, a2, 40, 1);
}

- (void)setGadgets:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 40);
}

- (BOOL)isPerformingChanges
{
  return self->_isPerformingChanges;
}

- (void)setIsPerformingChanges:(BOOL)a3
{
  self->_isPerformingChanges = a3;
}

- (BOOL)invalidGadgets
{
  return self->_invalidGadgets;
}

- (void)setInvalidGadgets:(BOOL)a3
{
  self->_invalidGadgets = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gadgets, 0);
  objc_destroyWeak((id *)&self->_nextGadgetResponder);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_identifier, 0);
}

void __37__PXGadgetProvider_gadget_didChange___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v5 = *(_QWORD *)(a1 + 32);
  v2 = (void *)MEMORY[0x1E0C99D20];
  v3 = a2;
  objc_msgSend(v2, "arrayWithObjects:count:", &v5, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeGadgets:", v4, v5, v6);

}

uint64_t __43__PXGadgetProvider_removeGadgetsAtIndexes___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_teardownGadget:", a2);
}

@end
