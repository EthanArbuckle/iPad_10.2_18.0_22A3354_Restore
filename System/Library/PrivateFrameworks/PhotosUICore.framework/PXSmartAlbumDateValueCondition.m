@implementation PXSmartAlbumDateValueCondition

- (void)setComparatorValue:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v14;

  v4 = a3;
  -[PXSmartAlbumCondition comparatorValue](self, "comparatorValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "integerValue");
  objc_msgSend(v4, "value");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "integerValue");
  v14.receiver = self;
  v14.super_class = (Class)PXSmartAlbumDateValueCondition;
  -[PXSmartAlbumCondition setComparatorValue:](&v14, sel_setComparatorValue_, v4);

  if (v7 != v9)
  {
    -[PXSmartAlbumCondition singleQuery](self, "singleQuery");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if ((v9 & 0xFFFFFFFE) == 0x28)
    {
      objc_msgSend(v10, "setSecondDateValue:", 0);
      objc_msgSend(v11, "setIntegerValue:", 30);
      objc_msgSend(v11, "setUnit:", 1);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setDateValue:", v12);

      if (v9 == 30)
      {
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setSecondDateValue:", v13);

      }
      else
      {
        objc_msgSend(v11, "setSecondDateValue:", 0);
      }
    }

  }
}

- (NSDate)dateValue
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[PXSmartAlbumCondition singleQuery](self, "singleQuery");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dateValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return (NSDate *)v6;
}

- (void)setDateValue:(id)a3
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSmartAlbumDateValueCondition.m"), 61, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("dateValue"));

  }
  -[PXSmartAlbumCondition singleQuery](self, "singleQuery");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDateValue:", v5);
  PLUIGetLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v11 = v5;
    _os_log_impl(&dword_1A6789000, v7, OS_LOG_TYPE_DEBUG, "PXSmartAlbums: date value set to: \"%@\", buf, 0xCu);
  }

  -[PXSmartAlbumCondition delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "conditionDidChange:", self);

}

- (NSDate)secondDateValue
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[PXSmartAlbumCondition singleQuery](self, "singleQuery");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "secondDateValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return (NSDate *)v6;
}

- (void)setSecondDateValue:(id)a3
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSmartAlbumDateValueCondition.m"), 77, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("dateValue"));

  }
  -[PXSmartAlbumCondition singleQuery](self, "singleQuery");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSecondDateValue:", v5);
  PLUIGetLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v11 = v5;
    _os_log_impl(&dword_1A6789000, v7, OS_LOG_TYPE_DEBUG, "PXSmartAlbums: second date value set to: \"%@\", buf, 0xCu);
  }

  -[PXSmartAlbumCondition delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "conditionDidChange:", self);

}

- (BOOL)hasNumberOfUnitValue
{
  void *v2;
  void *v3;

  -[PXSmartAlbumCondition comparatorValue](self, "comparatorValue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v2) = (objc_msgSend(v3, "integerValue") & 0xFFFFFFFELL) == 40;
  return (char)v2;
}

- (NSNumber)numberOfUnitValue
{
  void *v2;
  uint64_t v3;
  void *v4;

  -[PXSmartAlbumCondition singleQuery](self, "singleQuery");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "hasFirstValue"))
  {
    v3 = objc_msgSend(v2, "integerValue");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = &unk_1E53EDD70;
  }

  return (NSNumber *)v4;
}

- (void)setNumberOfUnitValue:(id)a3
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSmartAlbumDateValueCondition.m"), 115, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("numberOfUnitValue"));

  }
  -[PXSmartAlbumCondition singleQuery](self, "singleQuery");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setIntegerValue:", objc_msgSend(v5, "integerValue"));
  PLUIGetLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v11 = v5;
    _os_log_impl(&dword_1A6789000, v7, OS_LOG_TYPE_DEBUG, "PXSmartAlbums: number of units set to: \"%@\", buf, 0xCu);
  }

  -[PXSmartAlbumCondition delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "conditionDidChange:", self);

}

- (NSArray)unitValues
{
  NSArray *unitValues;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  NSArray *v9;
  NSArray *v10;
  void *v12;

  unitValues = self->_unitValues;
  if (!unitValues)
  {
    -[PXSmartAlbumCondition singleQuery](self, "singleQuery");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "key");
    objc_msgSend(MEMORY[0x1E0D732A8], "validUnitValuesForQueryKey:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PXSmartAlbumLocalizedStringsForUnitValues(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    PXLabeledValuesWithValuesAndLocalizedLabels(v7, v8);
    v9 = (NSArray *)objc_claimAutoreleasedReturnValue();

    v10 = self->_unitValues;
    self->_unitValues = v9;

    if (!-[NSArray count](self->_unitValues, "count"))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSmartAlbumDateValueCondition.m"), 129, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_unitValues.count"));

    }
    unitValues = self->_unitValues;
  }
  return unitValues;
}

- (PXLabeledValue)unitValue
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  PXLabeledValue *v8;
  void *v9;
  PXLabeledValue *v10;

  -[PXSmartAlbumCondition singleQuery](self, "singleQuery");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "hasUnit"))
  {
    v5 = objc_msgSend(v4, "unit");
    if (!(_DWORD)v5)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSmartAlbumDateValueCondition.m"), 138, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("unit != kPLQueryUnit_unused"));

      v5 = 0;
    }
  }
  else
  {
    v5 = 1;
  }
  PXSmartAlbumLocalizedStringForUnit(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = [PXLabeledValue alloc];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[PXLabeledValue initWithValue:localizedLabel:](v8, "initWithValue:localizedLabel:", v9, v7);

  return v10;
}

- (void)setUnitValue:(id)a3
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
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSmartAlbumDateValueCondition.m"), 145, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("unitValue"));

  }
  -[PXSmartAlbumDateValueCondition unitValues](self, "unitValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "containsObject:", v5);

  if ((v7 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSmartAlbumDateValueCondition.m"), 146, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[self.unitValues containsObject:unitValue]"));

  }
  objc_msgSend(v5, "value");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "integerValue");
  -[PXSmartAlbumCondition singleQuery](self, "singleQuery");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setUnit:", v9);
  PLUIGetLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    PLStringFromPLQueryUnit();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v17 = v12;
    _os_log_impl(&dword_1A6789000, v11, OS_LOG_TYPE_DEBUG, "PXSmartAlbums: unit value set to: \"%@\", buf, 0xCu);

  }
  -[PXSmartAlbumCondition delegate](self, "delegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "conditionDidChange:", self);

}

- (int64_t)comparatorMode
{
  return 2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unitValues, 0);
}

@end
