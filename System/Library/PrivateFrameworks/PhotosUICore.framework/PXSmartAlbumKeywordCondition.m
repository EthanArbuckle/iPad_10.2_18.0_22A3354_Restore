@implementation PXSmartAlbumKeywordCondition

- (NSArray)keywordValues
{
  NSArray *keywordValues;
  void *v4;
  void *v5;
  NSArray *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSArray *v11;

  keywordValues = self->_keywordValues;
  if (!keywordValues)
  {
    -[PXSmartAlbumCondition editingContext](self, "editingContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "keywordValues");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (NSArray *)objc_msgSend(v5, "mutableCopy");

    -[PXSmartAlbumKeywordCondition keywordValue](self, "keywordValue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!-[NSArray containsObject:](v6, "containsObject:", v7))
    {
      +[PXLabeledValue separatorLabeledValue](PXLabeledValue, "separatorLabeledValue");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSArray insertObject:atIndex:](v6, "insertObject:atIndex:", v8, 0);

      -[NSArray insertObject:atIndex:](v6, "insertObject:atIndex:", v7, 0);
    }
    +[PXLabeledValue separatorLabeledValue](PXLabeledValue, "separatorLabeledValue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray insertObject:atIndex:](v6, "insertObject:atIndex:", v9, 0);

    +[PXSmartAlbumKeywordCondition anyKeywordValue](PXSmartAlbumKeywordCondition, "anyKeywordValue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray insertObject:atIndex:](v6, "insertObject:atIndex:", v10, 0);

    v11 = self->_keywordValues;
    self->_keywordValues = v6;

    keywordValues = self->_keywordValues;
  }
  return keywordValues;
}

- (PXLabeledValue)keywordValue
{
  void *v2;
  void *v3;
  PXLabeledValue *v4;
  PXLabeledValue *v5;

  -[PXSmartAlbumCondition singleQuery](self, "singleQuery");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = -[PXLabeledValue initWithValue:localizedLabel:]([PXLabeledValue alloc], "initWithValue:localizedLabel:", v3, v3);
  }
  else
  {
    +[PXSmartAlbumKeywordCondition anyKeywordValue](PXSmartAlbumKeywordCondition, "anyKeywordValue");
    v4 = (PXLabeledValue *)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  return v5;
}

- (void)setKeywordValue:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  const char *v10;
  NSObject *v11;
  uint32_t v12;
  void *v13;
  void *v14;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSmartAlbumKeywordCondition.m"), 68, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("keywordValue"));

  }
  objc_msgSend(v5, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSmartAlbumCondition singleQuery](self, "singleQuery");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    objc_msgSend(v7, "setStringValue:", v6);
    PLUIGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v16 = v6;
      v10 = "PXSmartAlbums: keyword value set to: \"%@\";
      v11 = v9;
      v12 = 12;
LABEL_8:
      _os_log_impl(&dword_1A6789000, v11, OS_LOG_TYPE_DEBUG, v10, buf, v12);
    }
  }
  else
  {
    objc_msgSend(v7, "setStringValue:", 0);
    PLUIGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      v10 = "PXSmartAlbums: keyword value set to: \"Any\";
      v11 = v9;
      v12 = 2;
      goto LABEL_8;
    }
  }

  -[PXSmartAlbumCondition delegate](self, "delegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "conditionDidChange:", self);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keywordValues, 0);
}

+ (PXLabeledValue)anyKeywordValue
{
  if (anyKeywordValue_predicate != -1)
    dispatch_once(&anyKeywordValue_predicate, &__block_literal_global_72727);
  return (PXLabeledValue *)(id)anyKeywordValue__anyKeywordValue;
}

+ (id)defaultSingleQueryForEditingContext:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(a3, "keywordValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(MEMORY[0x1E0D732E8]);
  objc_msgSend(v6, "setKey:", 500);
  objc_msgSend(v6, "setStringValue:", v5);
  objc_msgSend(v6, "setComparator:", 22);

  return v6;
}

void __47__PXSmartAlbumKeywordCondition_anyKeywordValue__block_invoke()
{
  PXLabeledValue *v0;
  void *v1;
  id v2;

  PXLocalizedStringFromTable(CFSTR("PXSmartAlbumAnyKeyword"), CFSTR("PXSmartAlbumStrings"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v0 = -[PXLabeledValue initWithValue:localizedLabel:]([PXLabeledValue alloc], "initWithValue:localizedLabel:", 0, v2);
  v1 = (void *)anyKeywordValue__anyKeywordValue;
  anyKeywordValue__anyKeywordValue = (uint64_t)v0;

}

@end
