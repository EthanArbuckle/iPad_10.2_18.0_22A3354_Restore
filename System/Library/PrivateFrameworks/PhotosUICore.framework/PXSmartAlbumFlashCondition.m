@implementation PXSmartAlbumFlashCondition

+ (id)defaultSingleQueryForEditingContext:(id)a3
{
  id v3;

  v3 = objc_alloc_init(MEMORY[0x1E0D732E8]);
  objc_msgSend(v3, "setKey:", 302);
  objc_msgSend(v3, "setBoolValue:", 1);
  objc_msgSend(v3, "setComparator:", 1);
  return v3;
}

- (NSArray)flashFiredValues
{
  NSArray *flashFiredValues;
  void *v4;
  NSArray *v5;
  NSArray *v6;

  flashFiredValues = self->_flashFiredValues;
  if (!flashFiredValues)
  {
    PXSmartAlbumLocalizedStringsForFlashFiredValues(&unk_1E53E8610);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    PXLabeledValuesWithValuesAndLocalizedLabels(&unk_1E53E8610, v4);
    v5 = (NSArray *)objc_claimAutoreleasedReturnValue();

    v6 = self->_flashFiredValues;
    self->_flashFiredValues = v5;

    flashFiredValues = self->_flashFiredValues;
  }
  return flashFiredValues;
}

- (PXLabeledValue)flashFiredValue
{
  void *v2;
  int v3;
  int v4;
  BOOL v5;
  _BOOL8 v6;
  __CFString *v7;
  void *v8;
  PXLabeledValue *v9;
  void *v10;
  PXLabeledValue *v11;

  -[PXSmartAlbumCondition singleQuery](self, "singleQuery");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "comparator");
  if (objc_msgSend(v2, "BOOLValue"))
    v4 = 1;
  else
    v4 = 2;
  v5 = v3 == v4;
  v6 = v3 == v4;
  if (v5)
    v7 = CFSTR("PXSmartAlbumFlashDidFire");
  else
    v7 = CFSTR("PXSmartAlbumFlashDidNotFire");
  PXLocalizedStringFromTable(v7, CFSTR("PXSmartAlbumStrings"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = [PXLabeledValue alloc];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[PXLabeledValue initWithValue:localizedLabel:](v9, "initWithValue:localizedLabel:", v10, v8);

  return v11;
}

- (void)setFlashFiredValue:(id)a3
{
  id v5;
  void *v6;
  char v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  __CFString *v13;
  __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  uint8_t buf[4];
  __CFString *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSmartAlbumFlashCondition.m"), 46, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("flashFiredValue"));

  }
  -[PXSmartAlbumFlashCondition flashFiredValues](self, "flashFiredValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "containsObject:", v5);

  if ((v7 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSmartAlbumFlashCondition.m"), 47, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[self.flashFiredValues containsObject:flashFiredValue]"));

  }
  objc_msgSend(v5, "value");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "BOOLValue");
  -[PXSmartAlbumCondition singleQuery](self, "singleQuery");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setBoolValue:", 1);
  if (v9)
    v11 = 1;
  else
    v11 = 2;
  objc_msgSend(v10, "setComparator:", v11);
  PLUIGetLog();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    v13 = CFSTR("NO");
    if (v9)
      v13 = CFSTR("YES");
    v14 = v13;
    *(_DWORD *)buf = 138412290;
    v19 = v14;
    _os_log_impl(&dword_1A6789000, v12, OS_LOG_TYPE_DEBUG, "PXSmartAlbums: flash fired value set to: \"%@\", buf, 0xCu);

  }
  -[PXSmartAlbumCondition delegate](self, "delegate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "conditionDidChange:", self);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_flashFiredValues, 0);
}

@end
