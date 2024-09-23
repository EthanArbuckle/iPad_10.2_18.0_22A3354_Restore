@implementation PXSmartAlbumAlbumCondition

- (PXLabeledValue)albumValue
{
  void *v3;
  void *v4;
  void *v5;
  PXLabeledValue *v6;
  uint64_t v7;
  void *v8;
  __CFString *v9;
  __CFString *v10;

  -[PXSmartAlbumCondition singleQuery](self, "singleQuery");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[PXSmartAlbumAlbumCondition _albumValues](self, "_albumValues");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PXLabeledValueForValueInLabeledValues(v5, v4);
    v6 = (PXLabeledValue *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      objc_msgSend(v3, "secondStringValue");
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = (void *)v7;
      v9 = CFSTR("<missing>");
      if (v7)
        v9 = (__CFString *)v7;
      v10 = v9;

      v6 = -[PXLabeledValue initWithValue:localizedLabel:]([PXLabeledValue alloc], "initWithValue:localizedLabel:", v4, v10);
    }

  }
  else
  {
    +[PXSmartAlbumAlbumCondition anyAlbumValue](PXSmartAlbumAlbumCondition, "anyAlbumValue");
    v6 = (PXLabeledValue *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (BOOL)albumValueIsOrphaned
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;

  -[PXSmartAlbumCondition singleQuery](self, "singleQuery");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSmartAlbumAlbumCondition _albumValues](self, "_albumValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    PXLabeledValueForValueInLabeledValues(v5, v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7 == 0;

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)setAlbumValue:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  const char *v10;
  NSObject *v11;
  uint32_t v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXSmartAlbumCondition singleQuery](self, "singleQuery");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v5)
  {
    objc_msgSend(v7, "setStringValue:", v5);
    objc_msgSend(v8, "setSecondStringValue:", v6);
    PLUIGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      v14 = 138412546;
      v15 = v5;
      v16 = 2112;
      v17 = v6;
      v10 = "PXSmartAlbums: album value set to: %@:\"%@\";
      v11 = v9;
      v12 = 22;
LABEL_6:
      _os_log_impl(&dword_1A6789000, v11, OS_LOG_TYPE_DEBUG, v10, (uint8_t *)&v14, v12);
    }
  }
  else
  {
    objc_msgSend(v7, "setSecondStringValue:", 0);
    objc_msgSend(v8, "setStringValue:", 0);
    PLUIGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v14) = 0;
      v10 = "PXSmartAlbums: album value set to: \"Any\";
      v11 = v9;
      v12 = 2;
      goto LABEL_6;
    }
  }

  -[PXSmartAlbumCondition delegate](self, "delegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "conditionDidChange:", self);

}

- (id)_albumValues
{
  NSArray *albumValues;
  void *v4;
  NSArray *v5;
  NSArray *v6;

  albumValues = self->_albumValues;
  if (!albumValues)
  {
    -[PXSmartAlbumCondition editingContext](self, "editingContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "albumValues");
    v5 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v6 = self->_albumValues;
    self->_albumValues = v5;

    albumValues = self->_albumValues;
  }
  return albumValues;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_albumValues, 0);
}

+ (PXLabeledValue)anyAlbumValue
{
  if (anyAlbumValue_predicate != -1)
    dispatch_once(&anyAlbumValue_predicate, &__block_literal_global_49877);
  return (PXLabeledValue *)(id)anyAlbumValue__anyAlbumValue;
}

+ (id)defaultSingleQueryForEditingContext:(id)a3
{
  id v3;

  v3 = objc_alloc_init(MEMORY[0x1E0D732E8]);
  objc_msgSend(v3, "setKey:", 100);
  objc_msgSend(v3, "setComparator:", 22);
  return v3;
}

void __43__PXSmartAlbumAlbumCondition_anyAlbumValue__block_invoke()
{
  PXLabeledValue *v0;
  void *v1;
  id v2;

  PXLocalizedStringFromTable(CFSTR("PXSmartAlbumAnyAlbum"), CFSTR("PXSmartAlbumStrings"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v0 = -[PXLabeledValue initWithValue:localizedLabel:]([PXLabeledValue alloc], "initWithValue:localizedLabel:", 0, v2);
  v1 = (void *)anyAlbumValue__anyAlbumValue;
  anyAlbumValue__anyAlbumValue = (uint64_t)v0;

}

@end
