@implementation PXSmartAlbumPhotoCondition

+ (id)defaultSingleQueryForEditingContext:(id)a3
{
  id v3;

  v3 = objc_alloc_init(MEMORY[0x1E0D732E8]);
  objc_msgSend(v3, "setKey:", 1);
  objc_msgSend(v3, "setBoolValue:", 1);
  objc_msgSend(v3, "setComparator:", 1);
  return v3;
}

- (NSArray)photoTypeValues
{
  NSArray *photoTypeValues;
  void *v4;
  void *v5;
  NSArray *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSArray *v11;

  photoTypeValues = self->_photoTypeValues;
  if (!photoTypeValues)
  {
    PXSmartAlbumLocalizedStringsForPhotoTypeValues(&unk_1E53E8B68);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    PXLabeledValuesWithValuesAndLocalizedLabels(&unk_1E53E8B68, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (NSArray *)objc_msgSend(v5, "mutableCopy");

    v7 = PXSmartAlbumIndexOfValueInLabeledValues(v6, &unk_1E53EBAF0);
    +[PXLabeledValue separatorLabeledValue](PXLabeledValue, "separatorLabeledValue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray insertObject:atIndex:](v6, "insertObject:atIndex:", v8, v7);

    v9 = PXSmartAlbumIndexOfValueInLabeledValues(v6, &unk_1E53EBC40);
    +[PXLabeledValue separatorLabeledValue](PXLabeledValue, "separatorLabeledValue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray insertObject:atIndex:](v6, "insertObject:atIndex:", v10, v9);

    v11 = self->_photoTypeValues;
    self->_photoTypeValues = v6;

    photoTypeValues = self->_photoTypeValues;
  }
  return photoTypeValues;
}

- (PXLabeledValue)photoTypeValue
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  PXLabeledValue *v8;
  void *v9;
  PXLabeledValue *v10;
  void *v12;

  -[PXSmartAlbumCondition singleQuery](self, "singleQuery");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = PXSmartAlbumPhotoTypeForSingleQuery(v4);
  v6 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSmartAlbumPhotoCondition.m"), 37, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("photoType != PXSmartAlbumPhotoTypeInvalid"));

    v5 = 0;
  }
  PXSmartAlbumLocalizedStringForPhotoType(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = [PXLabeledValue alloc];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[PXLabeledValue initWithValue:localizedLabel:](v8, "initWithValue:localizedLabel:", v9, v7);

  return v10;
}

- (void)setPhotoTypeValue:(id)a3
{
  id v5;
  void *v6;
  char v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSmartAlbumPhotoCondition.m"), 44, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("photoTypeValue"));

  }
  -[PXSmartAlbumPhotoCondition photoTypeValues](self, "photoTypeValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "containsObject:", v5);

  if ((v7 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSmartAlbumPhotoCondition.m"), 45, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[self.photoTypeValues containsObject:photoTypeValue]"));

  }
  objc_msgSend(v5, "value");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "integerValue");
  switch(v9)
  {
    case 0:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXSmartAlbumPhotoCondition setPhotoTypeValue:]");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "handleFailureInFunction:file:lineNumber:description:", v20, CFSTR("PXSmartAlbumPhotoCondition.m"), 54, CFSTR("Code which should be unreachable has been reached"));

      abort();
    case 1:
      v10 = 3;
      goto LABEL_27;
    case 2:
      v10 = 5;
      v11 = 10;
      break;
    case 3:
      v10 = 5;
      v11 = 12;
      break;
    case 4:
      v11 = 1;
      v10 = 1;
      break;
    case 5:
      v10 = 5;
      v11 = 9;
      break;
    case 6:
      v10 = 2;
      goto LABEL_27;
    case 7:
      v10 = 5;
      v11 = 3;
      break;
    case 8:
      v10 = 5;
      v11 = 2;
      break;
    case 9:
      v10 = 5;
      v11 = 4;
      break;
    case 10:
      v10 = 4;
      goto LABEL_27;
    case 11:
      v10 = 6;
      goto LABEL_27;
    case 12:
      v10 = 5;
      v11 = 8;
      break;
    case 13:
      v10 = 5;
      v11 = 7;
      break;
    case 14:
      v10 = 5;
      v11 = 11;
      break;
    case 15:
      v10 = 5;
      v11 = 6;
      break;
    case 16:
      v10 = 319;
      goto LABEL_27;
    case 17:
      v11 = 5;
      v10 = 5;
      break;
    case 18:
      v10 = 1000;
      goto LABEL_27;
    case 19:
      v10 = 9;
LABEL_27:
      v11 = 1;
      break;
    case 20:
      v10 = 5;
      v11 = 14;
      break;
    case 21:
      v10 = 5;
      v11 = 15;
      break;
    case 22:
      v10 = 5;
      v11 = 16;
      break;
    case 23:
      v10 = 5;
      v11 = 17;
      break;
    default:
      v11 = 0;
      v10 = 0;
      break;
  }
  -[PXSmartAlbumCondition singleQuery](self, "singleQuery");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setKey:", v10);
  objc_msgSend(v12, "setIntegerValue:", v11);
  PLUIGetLog();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    PXSmartAlbumPhotoTypeDebugDescription(v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    PLStringFromPLQueryKey();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v22 = v14;
    v23 = 2112;
    v24 = v15;
    v25 = 2048;
    v26 = v11;
    _os_log_impl(&dword_1A6789000, v13, OS_LOG_TYPE_DEBUG, "PXSmartAlbums: photo type value set to: %@ (%@:%ld)", buf, 0x20u);

  }
  -[PXSmartAlbumCondition delegate](self, "delegate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "conditionDidChange:", self);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photoTypeValues, 0);
}

@end
