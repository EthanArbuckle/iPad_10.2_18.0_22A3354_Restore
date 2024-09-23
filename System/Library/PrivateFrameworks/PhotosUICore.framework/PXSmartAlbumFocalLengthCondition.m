@implementation PXSmartAlbumFocalLengthCondition

+ (id)defaultSingleQueryForEditingContext:(id)a3
{
  id v3;

  v3 = objc_alloc_init(MEMORY[0x1E0D732E8]);
  objc_msgSend(v3, "setKey:", 303);
  objc_msgSend(v3, "setDoubleValue:", 24.0);
  objc_msgSend(v3, "setComparator:", 5);
  return v3;
}

+ (id)formatter
{
  void *v2;
  PXFocalDistanceFormatter *v3;
  void *v4;

  v2 = (void *)formatter__formatter_48;
  if (!formatter__formatter_48)
  {
    v3 = objc_alloc_init(PXFocalDistanceFormatter);
    v4 = (void *)formatter__formatter_48;
    formatter__formatter_48 = (uint64_t)v3;

    v2 = (void *)formatter__formatter_48;
  }
  return v2;
}

- (NSArray)focalLengthValues
{
  NSArray *focalLengthValues;
  void *v4;
  void *v5;
  NSArray *v6;
  NSArray *v7;

  focalLengthValues = self->_focalLengthValues;
  if (!focalLengthValues)
  {
    objc_msgSend((id)objc_opt_class(), "formatter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXSmartAlbumCondition editingContext](self, "editingContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "focalLengthValuesWithFormatter:", v4);
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_focalLengthValues;
    self->_focalLengthValues = v6;

    focalLengthValues = self->_focalLengthValues;
  }
  return focalLengthValues;
}

- (PXLabeledValue)focalLengthValue
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  PXLabeledValue *v7;

  -[PXSmartAlbumCondition singleQuery](self, "singleQuery");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v2, "doubleValue");
  objc_msgSend(v3, "numberWithDouble:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "formatter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringFromNumber:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[PXLabeledValue initWithValue:localizedLabel:]([PXLabeledValue alloc], "initWithValue:localizedLabel:", v4, v6);
  return v7;
}

- (void)setFocalLengthValue:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  objc_class *v11;
  void *v12;
  objc_class *v13;
  void *v14;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_3;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "px_descriptionForAssertionMessage");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSmartAlbumEXIFCondition.m"), 165, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("focalLengthValue.value"), v12, v14);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSmartAlbumEXIFCondition.m"), 165, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("focalLengthValue.value"), v12);
  }

LABEL_3:
  -[PXSmartAlbumCondition singleQuery](self, "singleQuery");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "doubleValue");
  objc_msgSend(v7, "setDoubleValue:");
  PLUIGetLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v16 = v5;
    _os_log_impl(&dword_1A6789000, v8, OS_LOG_TYPE_DEBUG, "PXSmartAlbums: focal length value set to: %@", buf, 0xCu);
  }

  -[PXSmartAlbumCondition delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "conditionDidChange:", self);

}

- (PXLabeledValue)secondFocalLengthValue
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  PXLabeledValue *v7;

  -[PXSmartAlbumCondition singleQuery](self, "singleQuery");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v2, "secondDoubleValue");
  objc_msgSend(v3, "numberWithDouble:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "formatter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringFromNumber:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[PXLabeledValue initWithValue:localizedLabel:]([PXLabeledValue alloc], "initWithValue:localizedLabel:", v4, v6);
  return v7;
}

- (void)setSecondFocalLengthValue:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  objc_class *v11;
  void *v12;
  objc_class *v13;
  void *v14;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_3;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "px_descriptionForAssertionMessage");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSmartAlbumEXIFCondition.m"), 183, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("focalLengthValue.value"), v12, v14);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSmartAlbumEXIFCondition.m"), 183, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("focalLengthValue.value"), v12);
  }

LABEL_3:
  -[PXSmartAlbumCondition singleQuery](self, "singleQuery");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "doubleValue");
  objc_msgSend(v7, "setSecondDoubleValue:");
  PLUIGetLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v16 = v5;
    _os_log_impl(&dword_1A6789000, v8, OS_LOG_TYPE_DEBUG, "PXSmartAlbums: second focal length value set to: %@", buf, 0xCu);
  }

  -[PXSmartAlbumCondition delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "conditionDidChange:", self);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_focalLengthValues, 0);
}

@end
