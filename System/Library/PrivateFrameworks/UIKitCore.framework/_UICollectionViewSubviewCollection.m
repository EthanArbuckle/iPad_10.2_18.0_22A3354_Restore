@implementation _UICollectionViewSubviewCollection

- (void)removeViewForSupplementaryOfKind:(uint64_t)a3 atIndexPath:
{
  id v4;

  if (a1)
  {
    objc_msgSend(*(id *)(a1 + 16), "objectForKeyedSubscript:", a2);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObjectForKey:", a3);

  }
}

- (void)removeViewForDecorationOfKind:(uint64_t)a3 atIndexPath:
{
  id v4;

  if (a1)
  {
    objc_msgSend(*(id *)(a1 + 24), "objectForKeyedSubscript:", a2);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObjectForKey:", a3);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_decorations, 0);
  objc_storeStrong((id *)&self->_supplementaries, 0);
  objc_storeStrong((id *)&self->_cells, 0);
}

- (void)enumerateAllViewsWithEnumerator:(_QWORD *)a1
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[6];
  _QWORD v10[6];
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  _QWORD *v20;

  if (a1)
  {
    if (!a2)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", sel_enumerateAllViewsWithEnumerator_, a1, CFSTR("_UICollectionViewSubviewCollection.m"), 298, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("enumerator != nil"));

    }
    v12 = 0;
    v13 = &v12;
    v14 = 0x2020000000;
    v4 = MEMORY[0x1E0C809B0];
    v15 = 0;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __70___UICollectionViewSubviewCollection_enumerateAllViewsWithEnumerator___block_invoke;
    v11[3] = &unk_1E16C3348;
    v11[4] = a2;
    v11[5] = &v12;
    v5 = (void *)a1[1];
    v16 = MEMORY[0x1E0C809B0];
    v17 = 3221225472;
    v18 = __67___UICollectionViewSubviewCollection_enumerateCellsWithEnumerator___block_invoke;
    v19 = &unk_1E16BDC70;
    v20 = v11;
    objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", &v16);
    if (!*((_BYTE *)v13 + 24))
    {
      v10[0] = v4;
      v10[1] = 3221225472;
      v10[2] = __70___UICollectionViewSubviewCollection_enumerateAllViewsWithEnumerator___block_invoke_2;
      v10[3] = &unk_1E16C32F8;
      v10[4] = a2;
      v10[5] = &v12;
      v6 = (void *)a1[2];
      v16 = v4;
      v17 = 3221225472;
      v18 = __77___UICollectionViewSubviewCollection_enumerateSupplementariesWithEnumerator___block_invoke;
      v19 = &unk_1E16BDCE8;
      v20 = v10;
      objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", &v16);
      if (!*((_BYTE *)v13 + 24))
      {
        v9[0] = v4;
        v9[1] = 3221225472;
        v9[2] = __70___UICollectionViewSubviewCollection_enumerateAllViewsWithEnumerator___block_invoke_3;
        v9[3] = &unk_1E16C32F8;
        v9[4] = a2;
        v9[5] = &v12;
        v7 = (void *)a1[3];
        v16 = v4;
        v17 = 3221225472;
        v18 = __73___UICollectionViewSubviewCollection_enumerateDecorationsWithEnumerator___block_invoke;
        v19 = &unk_1E16BDCE8;
        v20 = v9;
        objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", &v16);
      }
    }
    _Block_object_dispose(&v12, 8);
  }
}

- (_UICollectionViewSubviewCollection)init
{
  _UICollectionViewSubviewCollection *v2;
  uint64_t v3;
  NSMutableDictionary *cells;
  uint64_t v5;
  NSMutableDictionary *supplementaries;
  uint64_t v7;
  NSMutableDictionary *decorations;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)_UICollectionViewSubviewCollection;
  v2 = -[_UICollectionViewSubviewCollection init](&v10, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    cells = v2->_cells;
    v2->_cells = (NSMutableDictionary *)v3;

    v5 = objc_opt_new();
    supplementaries = v2->_supplementaries;
    v2->_supplementaries = (NSMutableDictionary *)v5;

    v7 = objc_opt_new();
    decorations = v2->_decorations;
    v2->_decorations = (NSMutableDictionary *)v7;

  }
  return v2;
}

- (uint64_t)setCell:(uint64_t)a3 atIndexPath:
{
  uint64_t v5;
  NSObject *v6;
  NSObject *v7;
  unint64_t v8;
  NSObject *v9;
  unint64_t v10;
  NSObject *v11;
  uint8_t v12[16];
  uint8_t v13[16];
  uint8_t buf[16];
  uint8_t v15[16];

  if (result)
  {
    v5 = result;
    if (os_variant_has_internal_diagnostics())
    {
      if (!a2)
      {
        __UIFaultDebugAssertLog();
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)v15 = 0;
          _os_log_fault_impl(&dword_185066000, v6, OS_LOG_TYPE_FAULT, "Cell cannot be nil", v15, 2u);
        }

      }
    }
    else if (!a2)
    {
      v8 = _MergedGlobals_1010;
      if (!_MergedGlobals_1010)
      {
        v8 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v8, (unint64_t *)&_MergedGlobals_1010);
      }
      v9 = *(NSObject **)(v8 + 8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_185066000, v9, OS_LOG_TYPE_ERROR, "Cell cannot be nil", buf, 2u);
      }
    }
    if (os_variant_has_internal_diagnostics())
    {
      if (!a3)
      {
        __UIFaultDebugAssertLog();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)v13 = 0;
          _os_log_fault_impl(&dword_185066000, v7, OS_LOG_TYPE_FAULT, "Index path cannot be nil", v13, 2u);
        }

      }
    }
    else if (!a3)
    {
      v10 = qword_1ECD7D668;
      if (!qword_1ECD7D668)
      {
        v10 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v10, (unint64_t *)&qword_1ECD7D668);
      }
      v11 = *(NSObject **)(v10 + 8);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v12 = 0;
        _os_log_impl(&dword_185066000, v11, OS_LOG_TYPE_ERROR, "Index path cannot be nil", v12, 2u);
      }
    }
    return objc_msgSend(*(id *)(v5 + 8), "setObject:forKeyedSubscript:", a2, a3);
  }
  return result;
}

- (void)setView:(uint64_t)a3 forSupplementaryOfKind:(uint64_t)a4 atIndexPath:
{
  void *v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  unint64_t v12;
  NSObject *v13;
  unint64_t v14;
  NSObject *v15;
  unint64_t v16;
  NSObject *v17;
  uint8_t v18[16];
  uint8_t v19[16];
  uint8_t v20[16];
  uint8_t v21[16];
  uint8_t buf[16];
  uint8_t v23[16];

  if (a1)
  {
    if (os_variant_has_internal_diagnostics())
    {
      if (!a2)
      {
        __UIFaultDebugAssertLog();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)v23 = 0;
          _os_log_fault_impl(&dword_185066000, v9, OS_LOG_TYPE_FAULT, "View cannot be nil", v23, 2u);
        }

      }
    }
    else if (!a2)
    {
      v12 = qword_1ECD7D670;
      if (!qword_1ECD7D670)
      {
        v12 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v12, (unint64_t *)&qword_1ECD7D670);
      }
      v13 = *(NSObject **)(v12 + 8);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_185066000, v13, OS_LOG_TYPE_ERROR, "View cannot be nil", buf, 2u);
      }
    }
    if (os_variant_has_internal_diagnostics())
    {
      if (!a3)
      {
        __UIFaultDebugAssertLog();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)v21 = 0;
          _os_log_fault_impl(&dword_185066000, v10, OS_LOG_TYPE_FAULT, "Element kind cannot be nil", v21, 2u);
        }

      }
    }
    else if (!a3)
    {
      v14 = qword_1ECD7D678;
      if (!qword_1ECD7D678)
      {
        v14 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v14, (unint64_t *)&qword_1ECD7D678);
      }
      v15 = *(NSObject **)(v14 + 8);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v20 = 0;
        _os_log_impl(&dword_185066000, v15, OS_LOG_TYPE_ERROR, "Element kind cannot be nil", v20, 2u);
      }
    }
    if (os_variant_has_internal_diagnostics())
    {
      if (!a4)
      {
        __UIFaultDebugAssertLog();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)v19 = 0;
          _os_log_fault_impl(&dword_185066000, v11, OS_LOG_TYPE_FAULT, "Index path cannot be nil", v19, 2u);
        }

      }
    }
    else if (!a4)
    {
      v16 = qword_1ECD7D680;
      if (!qword_1ECD7D680)
      {
        v16 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v16, (unint64_t *)&qword_1ECD7D680);
      }
      v17 = *(NSObject **)(v16 + 8);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v18 = 0;
        _os_log_impl(&dword_185066000, v17, OS_LOG_TYPE_ERROR, "Index path cannot be nil", v18, 2u);
      }
    }
    objc_msgSend(*(id *)(a1 + 16), "objectForKeyedSubscript:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      v8 = (void *)objc_opt_new();
      objc_msgSend(*(id *)(a1 + 16), "setObject:forKeyedSubscript:", v8, a3);
    }
    objc_msgSend(v8, "setObject:forKeyedSubscript:", a2, a4);

  }
}

- (void)setView:(uint64_t)a3 forDecorationOfKind:(uint64_t)a4 atIndexPath:
{
  void *v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  unint64_t v12;
  NSObject *v13;
  unint64_t v14;
  NSObject *v15;
  unint64_t v16;
  NSObject *v17;
  uint8_t v18[16];
  uint8_t v19[16];
  uint8_t v20[16];
  uint8_t v21[16];
  uint8_t buf[16];
  uint8_t v23[16];

  if (a1)
  {
    if (os_variant_has_internal_diagnostics())
    {
      if (!a2)
      {
        __UIFaultDebugAssertLog();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)v23 = 0;
          _os_log_fault_impl(&dword_185066000, v9, OS_LOG_TYPE_FAULT, "View cannot be nil", v23, 2u);
        }

      }
    }
    else if (!a2)
    {
      v12 = qword_1ECD7D688;
      if (!qword_1ECD7D688)
      {
        v12 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v12, (unint64_t *)&qword_1ECD7D688);
      }
      v13 = *(NSObject **)(v12 + 8);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_185066000, v13, OS_LOG_TYPE_ERROR, "View cannot be nil", buf, 2u);
      }
    }
    if (os_variant_has_internal_diagnostics())
    {
      if (!a3)
      {
        __UIFaultDebugAssertLog();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)v21 = 0;
          _os_log_fault_impl(&dword_185066000, v10, OS_LOG_TYPE_FAULT, "Element kind cannot be nil", v21, 2u);
        }

      }
    }
    else if (!a3)
    {
      v14 = qword_1ECD7D690;
      if (!qword_1ECD7D690)
      {
        v14 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v14, (unint64_t *)&qword_1ECD7D690);
      }
      v15 = *(NSObject **)(v14 + 8);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v20 = 0;
        _os_log_impl(&dword_185066000, v15, OS_LOG_TYPE_ERROR, "Element kind cannot be nil", v20, 2u);
      }
    }
    if (os_variant_has_internal_diagnostics())
    {
      if (!a4)
      {
        __UIFaultDebugAssertLog();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)v19 = 0;
          _os_log_fault_impl(&dword_185066000, v11, OS_LOG_TYPE_FAULT, "Index path cannot be nil", v19, 2u);
        }

      }
    }
    else if (!a4)
    {
      v16 = qword_1ECD7D698;
      if (!qword_1ECD7D698)
      {
        v16 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v16, (unint64_t *)&qword_1ECD7D698);
      }
      v17 = *(NSObject **)(v16 + 8);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v18 = 0;
        _os_log_impl(&dword_185066000, v17, OS_LOG_TYPE_ERROR, "Index path cannot be nil", v18, 2u);
      }
    }
    objc_msgSend(*(id *)(a1 + 24), "objectForKeyedSubscript:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      v8 = (void *)objc_opt_new();
      objc_msgSend(*(id *)(a1 + 24), "setObject:forKeyedSubscript:", v8, a3);
    }
    objc_msgSend(v8, "setObject:forKeyedSubscript:", a2, a4);

  }
}

- (void)setView:(uint64_t)a3 ofKind:(uint64_t)a4 inCategory:(uint64_t)a5 atIndexPath:
{
  void *v9;
  void *v10;

  if (a1)
  {
    switch(a4)
    {
      case 2:
        if (!a3)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", sel_setView_ofKind_inCategory_atIndexPath_, a1, CFSTR("_UICollectionViewSubviewCollection.m"), 108, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("kind != nil"));

        }
        -[_UICollectionViewSubviewCollection setView:forDecorationOfKind:atIndexPath:](a1, a2, a3, a5);
        break;
      case 1:
        if (!a3)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", sel_setView_ofKind_inCategory_atIndexPath_, a1, CFSTR("_UICollectionViewSubviewCollection.m"), 103, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("kind != nil"));

        }
        -[_UICollectionViewSubviewCollection setView:forSupplementaryOfKind:atIndexPath:](a1, a2, a3, a5);
        break;
      case 0:
        -[_UICollectionViewSubviewCollection setCell:atIndexPath:](a1, a2, a5);
        break;
    }
  }
}

- (void)transferAllViewsWithoutCopyingToSubviewCollection:(id *)a1
{
  uint64_t v4;
  id v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  id v9;

  if (a1)
  {
    objc_storeStrong(a2 + 1, a1[1]);
    objc_storeStrong(a2 + 2, a1[2]);
    objc_storeStrong(a2 + 3, a1[3]);
    v4 = objc_opt_new();
    v5 = a1[1];
    a1[1] = (id)v4;

    v6 = objc_opt_new();
    v7 = a1[2];
    a1[2] = (id)v6;

    v8 = objc_opt_new();
    v9 = a1[3];
    a1[3] = (id)v8;

  }
}

- (void)removeViewOfKind:(uint64_t)a3 inCategory:(uint64_t)a4 atIndexPath:
{
  void *v7;
  void *v8;
  void *v9;
  id v10;

  if (a1)
  {
    if (a3 == 2)
    {
      if (!a2)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", sel_removeViewOfKind_inCategory_atIndexPath_, a1, CFSTR("_UICollectionViewSubviewCollection.m"), 151, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("kind != nil"));

      }
      v7 = *(void **)(a1 + 24);
    }
    else
    {
      if (a3 != 1)
      {
        if (!a3)
          objc_msgSend(*(id *)(a1 + 8), "removeObjectForKey:", a4);
        return;
      }
      if (!a2)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", sel_removeViewOfKind_inCategory_atIndexPath_, a1, CFSTR("_UICollectionViewSubviewCollection.m"), 146, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("kind != nil"));

      }
      v7 = *(void **)(a1 + 16);
    }
    objc_msgSend(v7, "objectForKeyedSubscript:", a2);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeObjectForKey:", a4);

  }
}

- (id)cellAtIndexPath:(id *)a1
{
  if (a1)
  {
    objc_msgSend(a1[1], "objectForKeyedSubscript:", a2);
    a1 = (id *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (uint64_t)enumerateCellsWithEnumerator:(uint64_t)result
{
  uint64_t v3;
  void *v4;
  void *v5;
  _QWORD v6[5];

  if (result)
  {
    v3 = result;
    if (!a2)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", sel_enumerateCellsWithEnumerator_, v3, CFSTR("_UICollectionViewSubviewCollection.m"), 230, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("enumerator != nil"));

    }
    v4 = *(void **)(v3 + 8);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __67___UICollectionViewSubviewCollection_enumerateCellsWithEnumerator___block_invoke;
    v6[3] = &unk_1E16BDC70;
    v6[4] = a2;
    return objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v6);
  }
  return result;
}

- (id)supplementaryOfKind:(uint64_t)a3 atIndexPath:
{
  void *v4;
  void *v5;

  if (a1)
  {
    objc_msgSend(*(id *)(a1 + 16), "objectForKeyedSubscript:", a2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)decorationOfKind:(uint64_t)a3 atIndexPath:
{
  void *v4;
  void *v5;

  if (a1)
  {
    objc_msgSend(*(id *)(a1 + 24), "objectForKeyedSubscript:", a2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)viewOfKind:(uint64_t)a3 inCategory:(uint64_t)a4 atIndexPath:
{
  uint64_t v6;
  void *v8;
  void *v9;

  if (a1)
  {
    v6 = (uint64_t)a1;
    switch(a3)
    {
      case 2:
        if (!a2)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", sel_viewOfKind_inCategory_atIndexPath_, v6, CFSTR("_UICollectionViewSubviewCollection.m"), 201, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("kind != nil"));

        }
        -[_UICollectionViewSubviewCollection decorationOfKind:atIndexPath:](v6, a2, a4);
        a1 = (id *)objc_claimAutoreleasedReturnValue();
        break;
      case 1:
        if (!a2)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", sel_viewOfKind_inCategory_atIndexPath_, v6, CFSTR("_UICollectionViewSubviewCollection.m"), 197, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("kind != nil"));

        }
        -[_UICollectionViewSubviewCollection supplementaryOfKind:atIndexPath:](v6, a2, a4);
        a1 = (id *)objc_claimAutoreleasedReturnValue();
        break;
      case 0:
        objc_msgSend(a1[1], "objectForKeyedSubscript:", a4);
        a1 = (id *)objc_claimAutoreleasedReturnValue();
        break;
    }
  }
  return a1;
}

- (id)supplementariesOfKind:(uint64_t)a1
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;

  if (a1)
  {
    objc_msgSend(*(id *)(a1 + 16), "objectForKeyedSubscript:", a2);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "allValues");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)v3;
    v5 = (void *)MEMORY[0x1E0C9AA60];
    if (v3)
      v5 = (void *)v3;
    v6 = v5;

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)decorationsOfKind:(uint64_t)a1
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;

  if (a1)
  {
    objc_msgSend(*(id *)(a1 + 24), "objectForKeyedSubscript:", a2);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "allValues");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)v3;
    v5 = (void *)MEMORY[0x1E0C9AA60];
    if (v3)
      v5 = (void *)v3;
    v6 = v5;

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)indexPathsForSupplementariesOfKind:(uint64_t)a1
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;

  if (a1)
  {
    objc_msgSend(*(id *)(a1 + 16), "objectForKeyedSubscript:", a2);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "allKeys");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)v3;
    v5 = (void *)MEMORY[0x1E0C9AA60];
    if (v3)
      v5 = (void *)v3;
    v6 = v5;

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)indexPathsForDecorationsOfKind:(uint64_t)a1
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;

  if (a1)
  {
    objc_msgSend(*(id *)(a1 + 24), "objectForKeyedSubscript:", a2);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "allKeys");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)v3;
    v5 = (void *)MEMORY[0x1E0C9AA60];
    if (v3)
      v5 = (void *)v3;
    v6 = v5;

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (uint64_t)enumerateSupplementariesWithEnumerator:(uint64_t)result
{
  uint64_t v3;
  void *v4;
  void *v5;
  _QWORD v6[5];

  if (result)
  {
    v3 = result;
    if (!a2)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", sel_enumerateSupplementariesWithEnumerator_, v3, CFSTR("_UICollectionViewSubviewCollection.m"), 238, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("enumerator != nil"));

    }
    v4 = *(void **)(v3 + 16);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __77___UICollectionViewSubviewCollection_enumerateSupplementariesWithEnumerator___block_invoke;
    v6[3] = &unk_1E16BDCE8;
    v6[4] = a2;
    return objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v6);
  }
  return result;
}

- (void)enumerateSupplementariesOfElementKind:(uint64_t)a3 enumerator:
{
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[5];

  if (a1)
  {
    if (a2)
    {
      if (a3)
      {
LABEL_4:
        objc_msgSend(*(id *)(a1 + 16), "objectForKeyedSubscript:", a2);
        v8 = (id)objc_claimAutoreleasedReturnValue();
        v9[0] = MEMORY[0x1E0C809B0];
        v9[1] = 3221225472;
        v9[2] = __87___UICollectionViewSubviewCollection_enumerateSupplementariesOfElementKind_enumerator___block_invoke;
        v9[3] = &unk_1E16C32D0;
        v9[4] = a3;
        objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v9);

        return;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", sel_enumerateSupplementariesOfElementKind_enumerator_, a1, CFSTR("_UICollectionViewSubviewCollection.m"), 249, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("elementKind != nil"));

      if (a3)
        goto LABEL_4;
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", sel_enumerateSupplementariesOfElementKind_enumerator_, a1, CFSTR("_UICollectionViewSubviewCollection.m"), 250, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("enumerator != nil"));

    goto LABEL_4;
  }
}

- (uint64_t)enumerateDecorationsWithEnumerator:(uint64_t)result
{
  uint64_t v3;
  void *v4;
  void *v5;
  _QWORD v6[5];

  if (result)
  {
    v3 = result;
    if (!a2)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", sel_enumerateDecorationsWithEnumerator_, v3, CFSTR("_UICollectionViewSubviewCollection.m"), 259, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("enumerator != nil"));

    }
    v4 = *(void **)(v3 + 24);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __73___UICollectionViewSubviewCollection_enumerateDecorationsWithEnumerator___block_invoke;
    v6[3] = &unk_1E16BDCE8;
    v6[4] = a2;
    return objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v6);
  }
  return result;
}

- (void)enumerateDecorationsOfElementKind:(uint64_t)a3 enumerator:
{
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[5];

  if (a1)
  {
    if (a2)
    {
      if (a3)
      {
LABEL_4:
        objc_msgSend(*(id *)(a1 + 24), "objectForKeyedSubscript:", a2);
        v8 = (id)objc_claimAutoreleasedReturnValue();
        v9[0] = MEMORY[0x1E0C809B0];
        v9[1] = 3221225472;
        v9[2] = __83___UICollectionViewSubviewCollection_enumerateDecorationsOfElementKind_enumerator___block_invoke;
        v9[3] = &unk_1E16C32D0;
        v9[4] = a3;
        objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v9);

        return;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", sel_enumerateDecorationsOfElementKind_enumerator_, a1, CFSTR("_UICollectionViewSubviewCollection.m"), 270, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("elementKind != nil"));

      if (a3)
        goto LABEL_4;
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", sel_enumerateDecorationsOfElementKind_enumerator_, a1, CFSTR("_UICollectionViewSubviewCollection.m"), 271, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("enumerator != nil"));

    goto LABEL_4;
  }
}

- (void)enumerateAuxillariesWithEnumerator:(uint64_t)a1
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t, void *, uint64_t);
  void *v17;
  _QWORD *v18;

  if (a1)
  {
    if (!a2)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", sel_enumerateAuxillariesWithEnumerator_, a1, CFSTR("_UICollectionViewSubviewCollection.m"), 280, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("enumerator != nil"));

    }
    v10 = 0;
    v11 = &v10;
    v12 = 0x2020000000;
    v4 = MEMORY[0x1E0C809B0];
    v13 = 0;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __73___UICollectionViewSubviewCollection_enumerateAuxillariesWithEnumerator___block_invoke;
    v9[3] = &unk_1E16C32F8;
    v9[4] = a2;
    v9[5] = &v10;
    v5 = *(void **)(a1 + 16);
    v14 = MEMORY[0x1E0C809B0];
    v15 = 3221225472;
    v16 = __77___UICollectionViewSubviewCollection_enumerateSupplementariesWithEnumerator___block_invoke;
    v17 = &unk_1E16BDCE8;
    v18 = v9;
    objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", &v14);
    if (!*((_BYTE *)v11 + 24))
    {
      v8[0] = v4;
      v8[1] = 3221225472;
      v8[2] = __73___UICollectionViewSubviewCollection_enumerateAuxillariesWithEnumerator___block_invoke_2;
      v8[3] = &unk_1E16C3320;
      v8[4] = a2;
      v6 = *(void **)(a1 + 24);
      v14 = v4;
      v15 = 3221225472;
      v16 = __73___UICollectionViewSubviewCollection_enumerateDecorationsWithEnumerator___block_invoke;
      v17 = &unk_1E16BDCE8;
      v18 = v8;
      objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", &v14);
    }
    _Block_object_dispose(&v10, 8);
  }
}

- (BOOL)containsView:(_QWORD *)a1
{
  _BOOL8 v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  if (!a1)
    return 0;
  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __51___UICollectionViewSubviewCollection_containsView___block_invoke;
  v4[3] = &unk_1E16C3370;
  v4[4] = a2;
  v4[5] = &v5;
  -[_UICollectionViewSubviewCollection enumerateAllViewsWithEnumerator:](a1, (uint64_t)v4);
  v2 = *((_BYTE *)v6 + 24) != 0;
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (void)updateCellsUsingFilter:(uint64_t)a1
{
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  _QWORD v14[5];

  if (a1)
  {
    if (!a2)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", sel_updateCellsUsingFilter_, a1, CFSTR("_UICollectionViewSubviewCollection.m"), 339, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("filterBlock != nil"));

    }
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(*(id *)(a1 + 8), "count"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = MEMORY[0x1E0C809B0];
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __61___UICollectionViewSubviewCollection_updateCellsUsingFilter___block_invoke;
    v11[3] = &unk_1E16C3398;
    v13 = a2;
    v6 = v4;
    v12 = v6;
    v7 = *(void **)(a1 + 8);
    v14[0] = v5;
    v14[1] = 3221225472;
    v14[2] = __67___UICollectionViewSubviewCollection_enumerateCellsWithEnumerator___block_invoke;
    v14[3] = &unk_1E16BDC70;
    v14[4] = v11;
    objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v14);
    v8 = *(void **)(a1 + 8);
    *(_QWORD *)(a1 + 8) = v6;
    v9 = v6;

  }
}

- (void)updateSupplementariesUsingFilter:(uint64_t)a1
{
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  _QWORD v14[5];

  if (a1)
  {
    if (!a2)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", sel_updateSupplementariesUsingFilter_, a1, CFSTR("_UICollectionViewSubviewCollection.m"), 354, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("filterBlock != nil"));

    }
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(*(id *)(a1 + 16), "count"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = MEMORY[0x1E0C809B0];
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __71___UICollectionViewSubviewCollection_updateSupplementariesUsingFilter___block_invoke;
    v11[3] = &unk_1E16C33C0;
    v13 = a2;
    v6 = v4;
    v12 = v6;
    v7 = *(void **)(a1 + 16);
    v14[0] = v5;
    v14[1] = 3221225472;
    v14[2] = __77___UICollectionViewSubviewCollection_enumerateSupplementariesWithEnumerator___block_invoke;
    v14[3] = &unk_1E16BDCE8;
    v14[4] = v11;
    objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v14);
    v8 = *(void **)(a1 + 16);
    *(_QWORD *)(a1 + 16) = v6;
    v9 = v6;

  }
}

- (void)updateDecorationsUsingFilter:(uint64_t)a1
{
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  _QWORD v14[5];

  if (a1)
  {
    if (!a2)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", sel_updateDecorationsUsingFilter_, a1, CFSTR("_UICollectionViewSubviewCollection.m"), 373, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("filterBlock != nil"));

    }
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(*(id *)(a1 + 24), "count"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = MEMORY[0x1E0C809B0];
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __67___UICollectionViewSubviewCollection_updateDecorationsUsingFilter___block_invoke;
    v11[3] = &unk_1E16C33C0;
    v13 = a2;
    v6 = v4;
    v12 = v6;
    v7 = *(void **)(a1 + 24);
    v14[0] = v5;
    v14[1] = 3221225472;
    v14[2] = __73___UICollectionViewSubviewCollection_enumerateDecorationsWithEnumerator___block_invoke;
    v14[3] = &unk_1E16BDCE8;
    v14[4] = v11;
    objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v14);
    v8 = *(void **)(a1 + 24);
    *(_QWORD *)(a1 + 24) = v6;
    v9 = v6;

  }
}

- (id)cells
{
  void *v2;
  uint64_t v3;
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;
  _QWORD v9[5];

  if (a1)
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 8), "count"));
    v3 = MEMORY[0x1E0C809B0];
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __43___UICollectionViewSubviewCollection_cells__block_invoke;
    v7[3] = &unk_1E16C33E8;
    v4 = v2;
    v8 = v4;
    v9[0] = v3;
    v5 = *(void **)(a1 + 8);
    v9[1] = 3221225472;
    v9[2] = __67___UICollectionViewSubviewCollection_enumerateCellsWithEnumerator___block_invoke;
    v9[3] = &unk_1E16BDC70;
    v9[4] = v7;
    objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v9, v7[0], 3221225472, __43___UICollectionViewSubviewCollection_cells__block_invoke, &unk_1E16C33E8);

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)indexPathsForCells
{
  void *v2;
  uint64_t v3;
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;
  _QWORD v9[5];

  if (a1)
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 8), "count"));
    v3 = MEMORY[0x1E0C809B0];
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __56___UICollectionViewSubviewCollection_indexPathsForCells__block_invoke;
    v7[3] = &unk_1E16C33E8;
    v4 = v2;
    v8 = v4;
    v9[0] = v3;
    v5 = *(void **)(a1 + 8);
    v9[1] = 3221225472;
    v9[2] = __67___UICollectionViewSubviewCollection_enumerateCellsWithEnumerator___block_invoke;
    v9[3] = &unk_1E16BDC70;
    v9[4] = v7;
    objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v9, v7[0], 3221225472, __56___UICollectionViewSubviewCollection_indexPathsForCells__block_invoke, &unk_1E16C33E8);

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)allViews
{
  void *v2;
  id v3;
  _QWORD v5[4];
  id v6;

  if (!a1)
    return 0;
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 16), "count")+ objc_msgSend(*(id *)(a1 + 8), "count")+ objc_msgSend(*(id *)(a1 + 24), "count"));
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __46___UICollectionViewSubviewCollection_allViews__block_invoke;
  v5[3] = &unk_1E16BDCC0;
  v3 = v2;
  v6 = v3;
  -[_UICollectionViewSubviewCollection enumerateAllViewsWithEnumerator:]((_QWORD *)a1, (uint64_t)v5);

  return v3;
}

- (id)allViewsHashTable
{
  void *v2;
  id v3;
  _QWORD v5[4];
  id v6;

  if (!a1)
    return 0;
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3690]), "initWithOptions:capacity:", 512, objc_msgSend(*(id *)(a1 + 16), "count")+ objc_msgSend(*(id *)(a1 + 8), "count")+ objc_msgSend(*(id *)(a1 + 24), "count"));
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __55___UICollectionViewSubviewCollection_allViewsHashTable__block_invoke;
  v5[3] = &unk_1E16BDCC0;
  v3 = v2;
  v6 = v3;
  -[_UICollectionViewSubviewCollection enumerateAllViewsWithEnumerator:]((_QWORD *)a1, (uint64_t)v5);

  return v3;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  MutableReusableViewMapDescription(self->_cells);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  StringToMutableReusableViewMapMapDescription(self->_supplementaries);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  StringToMutableReusableViewMapMapDescription(self->_decorations);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p cells = %@; supplementaries = %@; decorations = %@>"),
    v4,
    self,
    v5,
    v6,
    v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

@end
