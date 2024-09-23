@implementation _UITraitChangeRegistry

- (void)updateAuxiliaryChildrenTraitsIfNeeded
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (a1 && objc_msgSend(*(id *)(a1 + 16), "count"))
  {
    v2 = (void *)objc_msgSend(*(id *)(a1 + 16), "copy");
    v7 = 0u;
    v8 = 0u;
    v9 = 0u;
    v10 = 0u;
    v3 = v2;
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    if (v4)
    {
      v5 = *(_QWORD *)v8;
      do
      {
        v6 = 0;
        do
        {
          if (*(_QWORD *)v8 != v5)
            objc_enumerationMutation(v3);
          objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "_updateAuxiliaryChildTraitsIfNeeded", (_QWORD)v7);
        }
        while (v4 != v6);
        v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      }
      while (v4);
    }

  }
}

- (void)traitsDidChange:(void *)a3 forTraitEnvironment:(void *)a4 withPreviousTraitCollection:
{
  id v7;
  id v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  unint64_t v30;
  NSObject *v31;
  void *v32;
  unint64_t v33;
  NSObject *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  void (*v47[6])(_QWORD, _QWORD, _QWORD);
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _BYTE buf[24];
  void *v61;
  _BYTE v62[20];
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (!a1)
    goto LABEL_37;
  if (a2)
  {
    if (v7)
      goto LABEL_4;
LABEL_39:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", sel_traitsDidChange_forTraitEnvironment_withPreviousTraitCollection_, a1, CFSTR("_UITraitChangeRegistry.mm"), 205, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("traitEnvironment != nil"));

    if (v8)
      goto LABEL_5;
LABEL_40:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", sel_traitsDidChange_forTraitEnvironment_withPreviousTraitCollection_, a1, CFSTR("_UITraitChangeRegistry.mm"), 206, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("previousTraitCollection != nil"));

    goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", sel_traitsDidChange_forTraitEnvironment_withPreviousTraitCollection_, a1, CFSTR("_UITraitChangeRegistry.mm"), 204, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("traitTokens != NULL"));

  if (!v7)
    goto LABEL_39;
LABEL_4:
  if (!v8)
    goto LABEL_40;
LABEL_5:
  if (_UITraitTokenSetCount((uint64_t)a2)
    && (objc_msgSend(*(id *)(a1 + 8), "count") || objc_msgSend(*(id *)(a1 + 16), "count") || *(_QWORD *)(a1 + 48)))
  {
    v54 = 0u;
    v55 = 0u;
    v52 = 0u;
    v53 = 0u;
    v50 = 0u;
    v51 = 0u;
    v48 = 0u;
    v49 = 0u;
    v9 = MEMORY[0x1E0C809B0];
    v47[0] = (void (*)(_QWORD, _QWORD, _QWORD))MEMORY[0x1E0C809B0];
    v47[1] = (void (*)(_QWORD, _QWORD, _QWORD))3221225472;
    v47[2] = (void (*)(_QWORD, _QWORD, _QWORD))__90___UITraitChangeRegistry_traitsDidChange_forTraitEnvironment_withPreviousTraitCollection___block_invoke;
    v47[3] = (void (*)(_QWORD, _QWORD, _QWORD))&unk_1E16CD398;
    v47[4] = (void (*)(_QWORD, _QWORD, _QWORD))a1;
    v47[5] = (void (*)(_QWORD, _QWORD, _QWORD))&v48;
    _UITraitTokenSetEnumerate(a2, v47);
    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    if (*(_QWORD *)(a1 + 48))
    {
      v10 = *(_QWORD **)(a1 + 40);
      if (v10)
      {
        do
        {
          if (_UITraitTokenSetIntersectsSet((uint64_t)(v10 + 4), (uint64_t)a2))
            __UIInlinePointerSetInsertElement((uint64_t *)&v39, v10[3], 0);
          v10 = (_QWORD *)*v10;
        }
        while (v10);
        v11 = v39;
        if ((_QWORD)v39)
        {
          v12 = v7;
          v13 = v8;
          if (qword_1ECD7EB40 != -1)
            dispatch_once(&qword_1ECD7EB40, &__block_literal_global_308);
          if (_MergedGlobals_1109)
            v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v11);
          else
            v14 = 0;
          *(_QWORD *)&v56 = v9;
          *((_QWORD *)&v56 + 1) = 3221225472;
          *(_QWORD *)&v57 = __108___UITraitChangeRegistry__performTrackedTraitInvalidations_forTraitEnvironment_withPreviousTraitCollection___block_invoke;
          *((_QWORD *)&v57 + 1) = &unk_1E16CD3C0;
          v15 = v12;
          *(_QWORD *)&v58 = v15;
          v16 = v14;
          *((_QWORD *)&v58 + 1) = v16;
          _UIInlinePointerSetEnumerate(&v39, &v56);
          if (v16)
          {
            objc_msgSend(v15, "traitCollection");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            v33 = qword_1ECD7EB30;
            if (!qword_1ECD7EB30)
            {
              v33 = __UILogCategoryGetNode("TraitCollectionChange", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
              atomic_store(v33, (unint64_t *)&qword_1ECD7EB30);
            }
            v34 = *(id *)(v33 + 8);
            if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend(v16, "componentsJoinedByString:", CFSTR(", "));
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              +[UITraitCollection _descriptionForChangeFromTraitCollection:toTraitCollection:](UITraitCollection, "_descriptionForChangeFromTraitCollection:toTraitCollection:", v13, v38);
              v35 = objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138413314;
              *(_QWORD *)&buf[4] = v15;
              *(_WORD *)&buf[12] = 2112;
              *(_QWORD *)&buf[14] = v37;
              *(_WORD *)&buf[22] = 2112;
              v36 = (void *)v35;
              v61 = (void *)v35;
              *(_WORD *)v62 = 2112;
              *(_QWORD *)&v62[2] = v13;
              *(_WORD *)&v62[10] = 2112;
              *(_QWORD *)&v62[12] = v38;
              _os_log_impl(&dword_185066000, v34, OS_LOG_TYPE_ERROR, "Traits with tracked usage changed for %@\n\t► performed invalidation selectors: [ %@ ]\n\t► trait changes: %@\n\t► previous: %@\n\t► current: %@", buf, 0x34u);

            }
          }

        }
      }
    }
    if ((_QWORD)v48)
    {
      v17 = v7;
      v18 = v8;
      if (_UIShouldLogTraitRegistryChange())
      {
        objc_msgSend(v17, "traitCollection");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = qword_1ECD7EB38;
        if (!qword_1ECD7EB38)
        {
          v30 = __UILogCategoryGetNode("TraitCollectionChange", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v30, (unint64_t *)&qword_1ECD7EB38);
        }
        v31 = *(id *)(v30 + 8);
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          +[UITraitCollection _descriptionForChangeFromTraitCollection:toTraitCollection:](UITraitCollection, "_descriptionForChangeFromTraitCollection:toTraitCollection:", v18, v29);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138413058;
          *(_QWORD *)&buf[4] = v17;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v32;
          *(_WORD *)&buf[22] = 2112;
          v61 = v18;
          *(_WORD *)v62 = 2112;
          *(_QWORD *)&v62[2] = v29;
          _os_log_impl(&dword_185066000, v31, OS_LOG_TYPE_ERROR, "Traits changed for %@\n\t► trait changes: %@\n\t► previous: %@\n\t► current: %@", buf, 0x2Au);

        }
      }
      *(_QWORD *)buf = v9;
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __103___UITraitChangeRegistry__performTraitChangeCallbacks_forTraitEnvironment_withPreviousTraitCollection___block_invoke;
      v61 = &unk_1E16CD3C0;
      v19 = v17;
      *(_QWORD *)v62 = v19;
      v20 = v18;
      *(_QWORD *)&v62[8] = v20;
      _UIInlinePointerSetEnumerate(&v48, buf);

    }
    if (objc_msgSend(*(id *)(a1 + 16), "count"))
    {
      v21 = (void *)objc_msgSend(*(id *)(a1 + 16), "copy");
      v58 = 0u;
      v59 = 0u;
      v56 = 0u;
      v57 = 0u;
      v22 = v21;
      v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v56, buf, 16);
      if (v23)
      {
        v24 = *(_QWORD *)v57;
        do
        {
          for (i = 0; i != v23; ++i)
          {
            if (*(_QWORD *)v57 != v24)
              objc_enumerationMutation(v22);
            objc_msgSend(*(id *)(*((_QWORD *)&v56 + 1) + 8 * i), "_invalidateAuxiliaryChildTraits");
          }
          v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v56, buf, 16);
        }
        while (v23);
      }

    }
    if ((_QWORD)v40)

    _UIInlinePointerSetEnumerate(&v48, &__block_literal_global_137_0);
    if ((_QWORD)v49)

  }
LABEL_37:

}

- (_UITraitRegistration)registerForTraitTokenChanges:(void *)a3 withHandler:
{
  id v5;
  id v6;
  void *v7;
  _UITraitRegistration *v8;
  const char *v9;
  _UITraitRegistration *v10;
  void *v12;
  unint64_t v13;
  NSObject *v14;
  __int16 v15[8];

  v5 = a2;
  v6 = a3;
  if (a1)
  {
    if (dyld_program_sdk_at_least())
    {
      if (!objc_msgSend(v5, "count"))
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", sel_registerForTraitTokenChanges_withHandler_, a1, CFSTR("_UITraitChangeRegistry.mm"), 136, CFSTR("Must pass one or more traits to register for"));

      }
    }
    else if (!objc_msgSend(v5, "count"))
    {
      v13 = -[_UITraitChangeRegistry registerForTraitTokenChanges:withHandler:]::__s_category;
      if (!-[_UITraitChangeRegistry registerForTraitTokenChanges:withHandler:]::__s_category)
      {
        v13 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v13, (unint64_t *)&-[_UITraitChangeRegistry registerForTraitTokenChanges:withHandler:]::__s_category);
      }
      v14 = *(NSObject **)(v13 + 8);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        v15[0] = 0;
        _os_log_impl(&dword_185066000, v14, OS_LOG_TYPE_ERROR, "Must pass one or more traits to register for", (uint8_t *)v15, 2u);
      }
    }
    if (!v6)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", sel_registerForTraitTokenChanges_withHandler_, a1, CFSTR("_UITraitChangeRegistry.mm"), 137, CFSTR("Must pass a non-nil trait change handler to register"));

    }
    v8 = objc_alloc_init(_UITraitRegistration);
    v10 = v8;
    if (v8)
      objc_setProperty_nonatomic_copy(v8, v9, v6, 16);
    -[_UITraitChangeRegistry _addRegistration:forTraitTokens:](a1, v10, v5);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (_UITraitRegistration)registerForTraitTokenChanges:(void *)a3 withTarget:(const char *)a4 action:(int)a5 targetIsSender:
{
  id v9;
  id v10;
  void *v11;
  _UITraitRegistration *v12;
  _UITraitRegistration *v13;
  void *v15;
  void *v16;
  unint64_t v17;
  NSObject *v18;
  __int16 v19[8];

  v9 = a2;
  v10 = a3;
  if (!a1)
  {
    v13 = 0;
    goto LABEL_15;
  }
  if (dyld_program_sdk_at_least())
  {
    if (!objc_msgSend(v9, "count"))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", sel_registerForTraitTokenChanges_withTarget_action_targetIsSender_, a1, CFSTR("_UITraitChangeRegistry.mm"), 145, CFSTR("Must pass one or more traits to register for"));

    }
  }
  else if (!objc_msgSend(v9, "count"))
  {
    v17 = -[_UITraitChangeRegistry registerForTraitTokenChanges:withTarget:action:targetIsSender:]::__s_category;
    if (!-[_UITraitChangeRegistry registerForTraitTokenChanges:withTarget:action:targetIsSender:]::__s_category)
    {
      v17 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v17, (unint64_t *)&-[_UITraitChangeRegistry registerForTraitTokenChanges:withTarget:action:targetIsSender:]::__s_category);
    }
    v18 = *(NSObject **)(v17 + 8);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v19[0] = 0;
      _os_log_impl(&dword_185066000, v18, OS_LOG_TYPE_ERROR, "Must pass one or more traits to register for", (uint8_t *)v19, 2u);
    }
  }
  if (v10)
  {
    if (a4)
      goto LABEL_8;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", sel_registerForTraitTokenChanges_withTarget_action_targetIsSender_, a1, CFSTR("_UITraitChangeRegistry.mm"), 146, CFSTR("Must pass a non-nil target to register for trait changes"));

    if (a4)
      goto LABEL_8;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", sel_registerForTraitTokenChanges_withTarget_action_targetIsSender_, a1, CFSTR("_UITraitChangeRegistry.mm"), 147, CFSTR("Must pass a nonnull action selector to register for trait changes"));

LABEL_8:
  v12 = objc_alloc_init(_UITraitRegistration);
  v13 = v12;
  if (a5)
  {
    if (v12)
    {
      v12->_targetIsSender = 1;
LABEL_13:
      v13->_action = a4;
    }
  }
  else if (v12)
  {
    objc_storeWeak(&v12->_target, v10);
    goto LABEL_13;
  }
  -[_UITraitChangeRegistry _addRegistration:forTraitTokens:](a1, v13, v9);
LABEL_15:

  return v13;
}

- (void)_addRegistration:(void *)a3 forTraitTokens:
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  const __CFNumber *v10;
  unint64_t v11;
  __n128 v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _OWORD v21[2];
  uint64_t v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v22 = 0;
  memset(v21, 0, sizeof(v21));
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v6 = a3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(v6);
        v10 = *(const __CFNumber **)(*((_QWORD *)&v17 + 1) + 8 * i);
        v11 = _UIGetTraitTokenValue(v10);
        if ((_UITraitTokenSetContains((uint16x8_t **)v21, v11) & 1) == 0)
        {
          _UITraitTokenSetInsert((uint64_t *)v21, v11, v12);
          objc_msgSend(*(id *)(a1 + 8), "objectForKey:", v10);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = v13;
          if (v13)
          {
            objc_msgSend(v13, "addObject:", v5);
          }
          else
          {
            v15 = *(void **)(a1 + 8);
            v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithObjects:", v5, 0);
            objc_msgSend(v15, "setObject:forKey:", v16, v10);

          }
        }
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
    }
    while (v7);
  }

  if (*(_QWORD *)&v21[0])
}

- (_UITraitChangeRegistry)init
{
  _UITraitChangeRegistry *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *registrations;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UITraitChangeRegistry;
  v2 = -[_UITraitChangeRegistry init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    registrations = v2->_registrations;
    v2->_registrations = v3;

  }
  return v2;
}

- (void)unregisterForTraitChanges:(uint64_t)a1
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[5];
  _QWORD v9[4];
  id v10;
  __int128 *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    if (!v3)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", sel_unregisterForTraitChanges_, a1, CFSTR("_UITraitChangeRegistry.mm"), 160, CFSTR("Must pass a non-nil registration to unregister"));

    }
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v15 = 0u;
    v13 = 0u;
    v14 = 0u;
    v12 = 0u;
    v5 = *(void **)(a1 + 8);
    v6 = MEMORY[0x1E0C809B0];
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __52___UITraitChangeRegistry_unregisterForTraitChanges___block_invoke;
    v9[3] = &unk_1E16CD348;
    v10 = v4;
    v11 = &v12;
    objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v9);
    v8[0] = v6;
    v8[1] = 3221225472;
    v8[2] = __52___UITraitChangeRegistry_unregisterForTraitChanges___block_invoke_2;
    v8[3] = &unk_1E16CD370;
    v8[4] = a1;
    _UIInlinePointerSetEnumerate(&v12, v8);
    if ((_QWORD)v13)

  }
}

- (void).cxx_destruct
{
  _QWORD *next;
  _QWORD *v4;
  void **value;

  next = self->_traitUsageRecordsByMethodIMP.__table_.__p1_.__value_.__next_;
  if (next)
  {
    do
    {
      v4 = (_QWORD *)*next;
      operator delete(next);
      next = v4;
    }
    while (v4);
  }
  value = self->_traitUsageRecordsByMethodIMP.__table_.__bucket_list_.__ptr_.__value_;
  self->_traitUsageRecordsByMethodIMP.__table_.__bucket_list_.__ptr_.__value_ = 0;
  if (value)
    operator delete(value);
  objc_storeStrong((id *)&self->_auxiliaryChildTraitEnvironments, 0);
  objc_storeStrong((id *)&self->_registrations, 0);
}

- (void)dealloc
{
  _QWORD *i;
  void *v4;
  objc_super v5;

  for (i = self->_traitUsageRecordsByMethodIMP.__table_.__p1_.__value_.__next_; i; i = (_QWORD *)*i)
  {
    v4 = (void *)i[4];
    if (v4)

  }
  v5.receiver = self;
  v5.super_class = (Class)_UITraitChangeRegistry;
  -[_UITraitChangeRegistry dealloc](&v5, sel_dealloc);
}

- (void)recordTraitUsage:(void *)a3 forTraitEnvironment:(unint64_t)a4 insideMethod:(const char *)a5 withInvalidationAction:
{
  id v9;
  void *v10;
  int8x8_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint8x8_t v15;
  unint64_t v16;
  _QWORD *v17;
  _QWORD *i;
  unint64_t v19;
  void *v20;
  id v21;
  __int128 v22;
  char *v23;
  __int128 v24;
  void *v25;
  void *v26;
  void *v27;
  int8x16_t *v28;
  void *v29;
  id v30;
  __CFString *v31;
  unint64_t v32;
  NSObject *v33;
  void *v34;
  void (*v35[4])(_QWORD, _QWORD, _QWORD);
  id v36;
  __int128 v37;
  __int128 v38;
  uint64_t v39;
  unint64_t v40;
  uint8_t buf[4];
  void *v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  __CFString *v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = v9;
  v40 = a4;
  if (!a1)
    goto LABEL_29;
  if (v9)
  {
    if (a4)
      goto LABEL_4;
LABEL_31:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", sel_recordTraitUsage_forTraitEnvironment_insideMethod_withInvalidationAction_, a1, CFSTR("_UITraitChangeRegistry.mm"), 89, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("methodIMP != NULL"));

    if (a5)
      goto LABEL_5;
    goto LABEL_32;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", sel_recordTraitUsage_forTraitEnvironment_insideMethod_withInvalidationAction_, a1, CFSTR("_UITraitChangeRegistry.mm"), 88, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("traitEnvironment != nil"));

  if (!a4)
    goto LABEL_31;
LABEL_4:
  if (a5)
    goto LABEL_5;
LABEL_32:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", sel_recordTraitUsage_forTraitEnvironment_insideMethod_withInvalidationAction_, a1, CFSTR("_UITraitChangeRegistry.mm"), 90, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("invalidationAction != NULL"));

LABEL_5:
  v11 = *(int8x8_t *)(a1 + 32);
  if (v11)
  {
    v12 = 0x9DDFEA08EB382D69 * (((8 * a4) + 8) ^ HIDWORD(a4));
    v13 = 0x9DDFEA08EB382D69 * (HIDWORD(a4) ^ (v12 >> 47) ^ v12);
    v14 = 0x9DDFEA08EB382D69 * (v13 ^ (v13 >> 47));
    v15 = (uint8x8_t)vcnt_s8(v11);
    v15.i16[0] = vaddlv_u8(v15);
    if (v15.u32[0] > 1uLL)
    {
      v16 = v14;
      if (v14 >= *(_QWORD *)&v11)
        v16 = v14 % *(_QWORD *)&v11;
    }
    else
    {
      v16 = (*(_QWORD *)&v11 - 1) & v14;
    }
    v17 = *(_QWORD **)(*(_QWORD *)(a1 + 24) + 8 * v16);
    if (v17)
    {
      for (i = (_QWORD *)*v17; i; i = (_QWORD *)*i)
      {
        v19 = i[1];
        if (v14 == v19)
        {
          if (i[2] == a4)
          {
            v20 = (void *)*((_QWORD *)std::__hash_table<std::__hash_value_type<void (*)(void),_UITrackedTraitUsageRecord>,std::__unordered_map_hasher<void (*)(void),std::__hash_value_type<void (*)(void),_UITrackedTraitUsageRecord>,std::hash<void (*)(void)>,std::equal_to<void (*)(void)>,true>,std::__unordered_map_equal<void (*)(void),std::__hash_value_type<void (*)(void),_UITrackedTraitUsageRecord>,std::equal_to<void (*)(void)>,std::hash<void (*)(void)>,true>,std::allocator<std::__hash_value_type<void (*)(void),_UITrackedTraitUsageRecord>>>::__emplace_unique_key_args<void (*)(void),std::piecewise_construct_t const&,std::tuple<void (* const&)(void)>,std::tuple<>>((float *)(a1 + 24), a4, &v40)+ 4);
            if (v20)

            break;
          }
        }
        else
        {
          if (v15.u32[0] > 1uLL)
          {
            if (v19 >= *(_QWORD *)&v11)
              v19 %= *(_QWORD *)&v11;
          }
          else
          {
            v19 &= *(_QWORD *)&v11 - 1;
          }
          if (v19 != v16)
            break;
        }
      }
    }
  }
  if (*(_QWORD *)a2)
    v21 = *(id *)a2;
  v22 = *(_OWORD *)(a2 + 16);
  v37 = *(_OWORD *)a2;
  v38 = v22;
  v39 = *(_QWORD *)(a2 + 32);
  v23 = std::__hash_table<std::__hash_value_type<void (*)(void),_UITrackedTraitUsageRecord>,std::__unordered_map_hasher<void (*)(void),std::__hash_value_type<void (*)(void),_UITrackedTraitUsageRecord>,std::hash<void (*)(void)>,std::equal_to<void (*)(void)>,true>,std::__unordered_map_equal<void (*)(void),std::__hash_value_type<void (*)(void),_UITrackedTraitUsageRecord>,std::equal_to<void (*)(void)>,std::hash<void (*)(void)>,true>,std::allocator<std::__hash_value_type<void (*)(void),_UITrackedTraitUsageRecord>>>::__emplace_unique_key_args<void (*)(void),std::piecewise_construct_t const&,std::tuple<void (* const&)(void)>,std::tuple<>>((float *)(a1 + 24), a4, &v40);
  *((_QWORD *)v23 + 3) = a5;
  v24 = v38;
  *((_OWORD *)v23 + 2) = v37;
  *((_OWORD *)v23 + 3) = v24;
  *((_QWORD *)v23 + 8) = v39;
  if (qword_1ECD7EB40 != -1)
    dispatch_once(&qword_1ECD7EB40, &__block_literal_global_308);
  if (_MergedGlobals_1109)
  {
    v28 = _UITraitTokenSetCount(a2);
    if (v28)
    {
      v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v28);
      v35[0] = (void (*)(_QWORD, _QWORD, _QWORD))MEMORY[0x1E0C809B0];
      v35[1] = (void (*)(_QWORD, _QWORD, _QWORD))3221225472;
      v35[2] = (void (*)(_QWORD, _QWORD, _QWORD))__99___UITraitChangeRegistry_recordTraitUsage_forTraitEnvironment_insideMethod_withInvalidationAction___block_invoke;
      v35[3] = (void (*)(_QWORD, _QWORD, _QWORD))&unk_1E16B2AC8;
      v30 = v29;
      v36 = v30;
      _UITraitTokenSetEnumerate((uint64_t *)a2, v35);
      objc_msgSend(v30, "componentsJoinedByString:", CFSTR(", "));
      v31 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v31 = CFSTR("none");
    }
    v32 = qword_1ECD7EB28;
    if (!qword_1ECD7EB28)
    {
      v32 = __UILogCategoryGetNode("TraitUsageTracking", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v32, (unint64_t *)&qword_1ECD7EB28);
    }
    v33 = *(id *)(v32 + 8);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a5);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v42 = v34;
      v43 = 2112;
      v44 = v10;
      v45 = 2112;
      v46 = v31;
      _os_log_impl(&dword_185066000, v33, OS_LOG_TYPE_ERROR, "Tracked trait usage with invalidation action -%@ for %@\n\t► traits used: { %@ }", buf, 0x20u);

    }
  }
LABEL_29:

}

- (void)registerAuxiliaryChildEnvironmentForTraitInvalidations:(uint64_t)a1
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  if (a1)
  {
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(sel__invalidateAuxiliaryChildTraits);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", sel_registerAuxiliaryChildEnvironmentForTraitInvalidations_, a1, CFSTR("_UITraitChangeRegistry.mm"), 181, CFSTR("Child must implement -%@ to handle trait invalidations: %@"), v7, v10);

    }
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(sel__updateAuxiliaryChildTraitsIfNeeded);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", sel_registerAuxiliaryChildEnvironmentForTraitInvalidations_, a1, CFSTR("_UITraitChangeRegistry.mm"), 183, CFSTR("Child must implement -%@ to handle trait updates: %@"), v9, v10);

    }
    v3 = *(void **)(a1 + 16);
    if (!v3)
    {
      v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3690]), "initWithOptions:capacity:", 517, 1);
      v5 = *(void **)(a1 + 16);
      *(_QWORD *)(a1 + 16) = v4;

      v3 = *(void **)(a1 + 16);
    }
    objc_msgSend(v3, "addObject:", v10);
  }

}

- (void)unregisterAuxiliaryChildEnvironmentForTraitInvalidations:(uint64_t)a1
{
  id v3;

  v3 = a2;
  if (a1)
    objc_msgSend(*(id *)(a1 + 16), "removeObject:", v3);

}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  *((_DWORD *)self + 14) = 1065353216;
  return self;
}

@end
