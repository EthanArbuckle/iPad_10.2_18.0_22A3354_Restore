@implementation _UIViewServiceSessionActivityRecord

+ (_UIViewServiceSessionActivityRecord)activityRecordForProvider:(uint64_t)a3 userInterfaceIdiom:
{
  uint64_t v5;
  int v6;
  BOOL v7;
  uint64_t v8;
  int IsPrimary;
  void *v10;
  void *v11;
  void *v12;
  _UIViewServiceSessionActivityRecord *v13;
  _WORD *v14;
  void *v15;
  _BYTE *v16;
  id v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id WeakRetained;
  _UIViewServiceSessionActivityRecord *v24;
  _UIViewServiceSessionActivityRecord *v25;
  void *v27;
  objc_super v28;

  v5 = objc_opt_self();
  if (_NSIsNSObject())
  {
    v6 = objc_msgSend(a2, "__isKindOfUIViewController");
    v7 = 1;
    if (a2 && v6)
      v7 = (a2[188] & 0x80) == 0;
  }
  else
  {
    v7 = 1;
  }
  if (a2 && v7)
  {
    v8 = _UIActiveViewServiceSessionEffectiveIdiomForIdiom(a3);
    IsPrimary = _UIActiveViewServiceSessionProviderIsPrimary(a2);
    objc_msgSend(a2, "_sessionIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    _UIViewServiceSessionActivityRecordsByUUID();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    _UIViewServiceSessionActivityRecordsByUUID();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKey:", v10);
    v13 = (_UIViewServiceSessionActivityRecord *)objc_claimAutoreleasedReturnValue();

    if (!v13 && IsPrimary)
    {
      v14 = a2;
      v13 = [_UIViewServiceSessionActivityRecord alloc];
      if (v13)
      {
        objc_msgSend(v14, "_primaryHostedWindow");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v15)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", sel__initWithPrimaryActivityProvider_userInterfaceIdiom_, v13, CFSTR("_UIActiveViewServiceSessionTracker.m"), 234, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("primaryHostedWindow"));

        }
        v28.receiver = v13;
        v28.super_class = (Class)_UIViewServiceSessionActivityRecord;
        v16 = objc_msgSendSuper2(&v28, sel_init);
        v17 = v16;
        if (v16)
        {
          v16[16] = 0;
          objc_msgSend(v14, "_sessionIdentifier");
          v18 = objc_claimAutoreleasedReturnValue();
          v19 = (void *)*((_QWORD *)v17 + 7);
          *((_QWORD *)v17 + 7) = v18;

          *((_QWORD *)v17 + 8) = v8;
          objc_storeWeak((id *)v17 + 9, v15);
          objc_msgSend(MEMORY[0x1E0CB3690], "hashTableWithOptions:", 517);
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = (void *)*((_QWORD *)v17 + 1);
          *((_QWORD *)v17 + 1) = v20;

          v22 = (void *)*((_QWORD *)v17 + 1);
          WeakRetained = objc_loadWeakRetained((id *)v17 + 9);
          objc_msgSend(v22, "addObject:", WeakRetained);

          objc_storeWeak((id *)v17 + 4, v14);
        }
        v13 = (_UIViewServiceSessionActivityRecord *)v17;

      }
      objc_msgSend(v11, "setObject:forKey:", v13, v10);
    }
    v24 = v13;

    v25 = v24;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (_UIViewServiceSessionActivityRecord *)objc_claimAutoreleasedReturnValue();
    -[_UIViewServiceSessionActivityRecord handleFailureInMethod:object:file:lineNumber:description:](v24, "handleFailureInMethod:object:file:lineNumber:description:", sel_activityRecordForProvider_userInterfaceIdiom_, v5, CFSTR("_UIActiveViewServiceSessionTracker.m"), 203, CFSTR("Attempting to obtain a view service session activity record with an invalid provider: %@"), a2);
    v25 = 0;
  }

  return v25;
}

- (_UIViewServiceSessionActivityRecord)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIActiveViewServiceSessionTracker.m"), 225, CFSTR("%s: init is not allowed on %@"), "-[_UIViewServiceSessionActivityRecord init]", objc_opt_class());

  return 0;
}

- (void)invalidate
{
  id *v2;
  id WeakRetained;
  void *v4;
  id v5;

  if (a1)
  {
    *(_BYTE *)(a1 + 16) = 1;
    v2 = (id *)(a1 + 24);
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 24));
    -[_UIActiveViewServiceSessionTracker _removeViewServiceSessionActivityRecord:]((uint64_t)WeakRetained, (_QWORD *)a1);

    _UIViewServiceSessionActivityRecordsByUUID();
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObjectForKey:", *(_QWORD *)(a1 + 56));
    objc_storeWeak(v2, 0);
    objc_storeWeak((id *)(a1 + 72), 0);
    v4 = *(void **)(a1 + 8);
    *(_QWORD *)(a1 + 8) = 0;

    objc_storeWeak((id *)(a1 + 32), 0);
  }
}

- (void)removeActivityWindow:(uint64_t)a1
{
  unint64_t v4;
  NSObject *v5;
  void *v6;
  id v7;
  objc_class *v8;
  void *v9;
  __CFString *v10;
  uint64_t v11;
  uint8_t buf[4];
  __CFString *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (a1 && objc_msgSend(*(id *)(a1 + 8), "containsObject:", a2))
  {
    objc_msgSend(*(id *)(a1 + 8), "removeObject:", a2);
    v4 = removeActivityWindow____s_category;
    if (!removeActivityWindow____s_category)
    {
      v4 = __UILogCategoryGetNode("ViewServiceSessionActivityTracking", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v4, (unint64_t *)&removeActivityWindow____s_category);
    }
    if ((*(_BYTE *)v4 & 1) != 0)
    {
      v5 = *(id *)(v4 + 8);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        if (a2)
        {
          v6 = (void *)MEMORY[0x1E0CB3940];
          v7 = a2;
          v8 = (objc_class *)objc_opt_class();
          NSStringFromClass(v8);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "stringWithFormat:", CFSTR("<%@: %p>"), v9, v7);
          v10 = (__CFString *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v10 = CFSTR("(nil)");
        }
        v11 = *(_QWORD *)(a1 + 56);
        *(_DWORD *)buf = 138412546;
        v13 = v10;
        v14 = 2112;
        v15 = v11;
        _os_log_impl(&dword_185066000, v5, OS_LOG_TYPE_ERROR, "Removed activity window: %@; for viewServiceSession: %@",
          buf,
          0x16u);

      }
    }
  }
}

- (NSString)debugDescription
{
  return (NSString *)-[_UIViewServiceSessionActivityRecord debugDescriptionWithMultilinePrefix:](self, "debugDescriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[_UIViewServiceSessionActivityRecord succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  objc_class *v8;
  void *v9;
  __CFString *v10;
  id v11;
  id v12;
  void *v13;
  objc_class *v14;
  void *v15;
  __CFString *v16;
  id v17;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSUUID UUIDString](self->_sessionIdentifier, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendObject:withName:", v4, CFSTR("sessionIdentifier"));

  v6 = objc_loadWeakRetained((id *)&self->_tracker);
  if (v6)
  {
    v7 = (void *)MEMORY[0x1E0CB3940];
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", CFSTR("<%@: %p>"), v9, v6);
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = CFSTR("(nil)");
  }

  v11 = (id)objc_msgSend(v3, "appendObject:withName:", v10, CFSTR("tracker"));
  v12 = objc_loadWeakRetained((id *)&self->_primaryHostedWindow);
  if (v12)
  {
    v13 = (void *)MEMORY[0x1E0CB3940];
    v14 = (objc_class *)objc_opt_class();
    NSStringFromClass(v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringWithFormat:", CFSTR("<%@: %p>"), v15, v12);
    v16 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v16 = CFSTR("(nil)");
  }

  v17 = (id)objc_msgSend(v3, "appendObject:withName:", v16, CFSTR("primaryHostedWindow"));
  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[_UIViewServiceSessionActivityRecord descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)debugDescriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[_UIViewServiceSessionActivityRecord descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD v12[4];
  id v13;
  _UIViewServiceSessionActivityRecord *v14;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSUUID UUIDString](self->_sessionIdentifier, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v5, "appendObject:withName:", v6, CFSTR("sessionIdentifier"));

  objc_msgSend(v5, "setActiveMultilinePrefix:", a3);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __77___UIViewServiceSessionActivityRecord_descriptionBuilderWithMultilinePrefix___block_invoke;
  v12[3] = &unk_1E16B1B50;
  v8 = v5;
  v13 = v8;
  v14 = self;
  v9 = (id)objc_msgSend(v8, "modifyBody:", v12);
  v10 = v8;

  return v10;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_primaryHostedWindow);
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
  objc_destroyWeak((id *)&self->_lastActivityProvider);
  objc_destroyWeak((id *)&self->_tracker);
  objc_storeStrong((id *)&self->_activityWindows, 0);
}

@end
