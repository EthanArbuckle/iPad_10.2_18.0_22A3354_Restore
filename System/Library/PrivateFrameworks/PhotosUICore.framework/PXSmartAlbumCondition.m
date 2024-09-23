@implementation PXSmartAlbumCondition

- (PXSmartAlbumCondition)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSmartAlbumCondition.m"), 40, CFSTR("%s is not available as initializer"), "-[PXSmartAlbumCondition init]");

  abort();
}

- (id)_initWithConditionType:(int64_t)a3 singleQuery:(id)a4 editingContext:(id)a5
{
  id v8;
  id v9;
  PXSmartAlbumCondition *v10;
  PXSmartAlbumCondition *v11;
  PLSingleQuery *v12;
  PLSingleQuery *singleQuery;
  objc_super v15;

  v8 = a4;
  v9 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PXSmartAlbumCondition;
  v10 = -[PXSmartAlbumCondition init](&v15, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_conditionType = a3;
    objc_storeStrong((id *)&v10->_editingContext, a5);
    if (v8)
    {
      v12 = (PLSingleQuery *)v8;
    }
    else
    {
      objc_msgSend((id)objc_opt_class(), "defaultSingleQueryForEditingContext:", v9);
      v12 = (PLSingleQuery *)objc_claimAutoreleasedReturnValue();
    }
    singleQuery = v11->_singleQuery;
    v11->_singleQuery = v12;

  }
  return v11;
}

- (NSArray)comparatorValues
{
  NSArray *comparatorValues;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NSArray *v10;
  NSArray *v11;
  void *v13;

  comparatorValues = self->_comparatorValues;
  if (!comparatorValues)
  {
    -[PXSmartAlbumCondition singleQuery](self, "singleQuery");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "key");
    v7 = -[PXSmartAlbumCondition comparatorMode](self, "comparatorMode");
    objc_msgSend(MEMORY[0x1E0D732A8], "validComparatorsForQueryKey:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    PXSmartAlbumLocalizedStringsForComparatorValues(v8, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PXLabeledValuesWithValuesAndLocalizedLabels(v8, v9);
    v10 = (NSArray *)objc_claimAutoreleasedReturnValue();

    v11 = self->_comparatorValues;
    self->_comparatorValues = v10;

    if (!-[NSArray count](self->_comparatorValues, "count"))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSmartAlbumCondition.m"), 109, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_comparatorValues.count"));

    }
    comparatorValues = self->_comparatorValues;
  }
  return comparatorValues;
}

- (PXLabeledValue)comparatorValue
{
  uint64_t v3;
  void *v4;
  PXLabeledValue *v5;
  void *v6;
  PXLabeledValue *v7;

  v3 = -[PXSmartAlbumCondition _comparatorType](self, "_comparatorType");
  PXSmartAlbumLocalizedStringForComparator(v3, -[PXSmartAlbumCondition comparatorMode](self, "comparatorMode"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = [PXLabeledValue alloc];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PXLabeledValue initWithValue:localizedLabel:](v5, "initWithValue:localizedLabel:", v6, v4);

  return v7;
}

- (void)setComparatorValue:(id)a3
{
  id v5;
  void *v6;
  char v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSmartAlbumCondition.m"), 122, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("comparatorValue"));

  }
  -[PXSmartAlbumCondition comparatorValues](self, "comparatorValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "containsObject:", v5);

  if ((v7 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSmartAlbumCondition.m"), 123, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[self.comparatorValues containsObject:comparatorValue]"));

  }
  objc_msgSend(v5, "value");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "integerValue");
  -[PXSmartAlbumCondition singleQuery](self, "singleQuery");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setComparator:", v9);
  PLUIGetLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    PLStringFromPLQueryComparatorType();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v17 = v12;
    _os_log_impl(&dword_1A6789000, v11, OS_LOG_TYPE_DEBUG, "PXSmartAlbums: comparator set to: \"%@\", buf, 0xCu);

  }
  -[PXSmartAlbumCondition delegate](self, "delegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "conditionDidChange:", self);

}

- (int64_t)comparatorParameterType
{
  int v2;
  void *v4;
  void *v5;

  v2 = -[PXSmartAlbumCondition _comparatorType](self, "_comparatorType");
  if ((v2 - 50) < 2)
    return 2;
  if (v2 == 30)
    return 1;
  if (!v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "PXSmartAlbumComparatorParameterType _PXSmartAlbumComparatorParameterTypeForComparator(PLQueryComparatorType)");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("PXSmartAlbumCondition.m"), 235, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  return 0;
}

- (int64_t)comparatorMode
{
  return 1;
}

- (int)_comparatorType
{
  void *v2;
  int v3;

  -[PXSmartAlbumCondition singleQuery](self, "singleQuery");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "migratedComparator");

  return v3;
}

- (int64_t)conditionType
{
  return self->_conditionType;
}

- (PXSmartAlbumEditingContext)editingContext
{
  return self->_editingContext;
}

- (PLSingleQuery)singleQuery
{
  return self->_singleQuery;
}

- (PXSmartAlbumConditionDelegate)delegate
{
  return (PXSmartAlbumConditionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_singleQuery, 0);
  objc_storeStrong((id *)&self->_editingContext, 0);
  objc_storeStrong((id *)&self->_comparatorValues, 0);
}

+ (id)conditionWithConditionType:(int64_t)a3 editingContext:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v11;
  void *v12;

  v7 = a4;
  v8 = v7;
  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXSmartAlbumCondition.m"), 55, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("conditionType != PXSmartAlbumConditionTypeInvalid"));

    if (v8)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXSmartAlbumCondition.m"), 56, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("editingContext"));

    goto LABEL_3;
  }
  if (!v7)
    goto LABEL_5;
LABEL_3:
  v9 = (void *)objc_msgSend(objc_alloc((Class)_PXSmartAlbumConditionClassForConditionType(a3)), "_initWithConditionType:singleQuery:editingContext:", a3, 0, v8);

  return v9;
}

+ (id)_conditionWithSingleQuery:(id)a3 editingContext:(id)a4
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v13;
  void *v14;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXSmartAlbumCondition.m"), 64, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("singleQuery"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXSmartAlbumCondition.m"), 65, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("editingContext"));

LABEL_3:
  v10 = PXSmartAlbumConditionTypeForSingleQuery(v7);
  v11 = (void *)v10;
  if (v10)
    v11 = (void *)objc_msgSend(objc_alloc((Class)_PXSmartAlbumConditionClassForConditionType(v10)), "_initWithConditionType:singleQuery:editingContext:", v10, v7, v9);

  return v11;
}

+ (id)conditionsForQuery:(id)a3 editingContext:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  void *v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  uint64_t *v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  uint8_t buf[4];
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  if (v9)
  {
    if (a5)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXSmartAlbumCondition.m"), 77, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("query"));

    if (a5)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXSmartAlbumCondition.m"), 78, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("error"));

LABEL_3:
  v33 = 0;
  v34 = &v33;
  v35 = 0x3032000000;
  v36 = __Block_byref_object_copy__188589;
  v37 = __Block_byref_object_dispose__188590;
  v38 = 0;
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__188589;
  v31 = __Block_byref_object_dispose__188590;
  v32 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v9, "singleQueries");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "count"))
  {
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __65__PXSmartAlbumCondition_conditionsForQuery_editingContext_error___block_invoke;
    v23[3] = &unk_1E51339B8;
    v24 = v10;
    v25 = &v27;
    v26 = &v33;
    objc_msgSend(v11, "enumerateObjectsUsingBlock:", v23);
    v12 = v24;
  }
  else
  {
    PLUIGetLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v9, "logDescription");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v40 = v14;
      _os_log_impl(&dword_1A6789000, v13, OS_LOG_TYPE_ERROR, "PXSmartAlbums: Failed to create conditions for query with no single queries: %@", buf, 0xCu);

    }
    v15 = (void *)MEMORY[0x1E0CB35C8];
    objc_msgSend(v9, "logDescription");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "px_errorWithDomain:code:debugDescription:", CFSTR("PXSmartAlbumErrorDomain"), -1001, CFSTR("Failed to create conditions for query with no single queries: \"%@\"), v12);
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = (void *)v34[5];
    v34[5] = v16;

  }
  if (v34[5])
  {
    v18 = (void *)v28[5];
    v28[5] = 0;

    *a5 = objc_retainAutorelease((id)v34[5]);
  }
  v19 = (id)v28[5];

  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v33, 8);

  return v19;
}

+ (id)defaultSingleQueryForEditingContext:(id)a3
{
  id v5;
  void *v6;
  objc_class *v7;
  void *v8;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXSmartAlbumCondition.m"), 144, CFSTR("Method %s is a responsibility of subclass %@"), "+[PXSmartAlbumCondition defaultSingleQueryForEditingContext:]", v8);

  abort();
}

void __65__PXSmartAlbumCondition_conditionsForQuery_editingContext_error___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;

  v12 = a2;
  +[PXSmartAlbumCondition _conditionWithSingleQuery:editingContext:](PXSmartAlbumCondition, "_conditionWithSingleQuery:editingContext:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:", v6);
  }
  else
  {
    v7 = (void *)MEMORY[0x1E0CB35C8];
    objc_msgSend(v12, "logDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "px_errorWithDomain:code:debugDescription:", CFSTR("PXSmartAlbumErrorDomain"), -1001, CFSTR("Failed to create condition for single query: \"%@\"), v8);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;

    *a4 = 1;
  }

}

@end
