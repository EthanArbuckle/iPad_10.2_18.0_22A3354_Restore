@implementation PXSmartAlbumLensModelCondition

+ (id)defaultSingleQueryForEditingContext:(id)a3
{
  id v3;

  v3 = objc_alloc_init(MEMORY[0x1E0D732E8]);
  objc_msgSend(v3, "setKey:", 305);
  objc_msgSend(v3, "setStringValue:", &stru_1E5149688);
  objc_msgSend(v3, "setComparator:", 20);
  return v3;
}

- (NSArray)lensModels
{
  NSArray *lensModels;
  void *v4;
  NSArray *v5;
  NSArray *v6;

  lensModels = self->_lensModels;
  if (!lensModels)
  {
    -[PXSmartAlbumCondition editingContext](self, "editingContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "lensModels");
    v5 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v6 = self->_lensModels;
    self->_lensModels = v5;

    lensModels = self->_lensModels;
  }
  return lensModels;
}

- (NSString)lensModel
{
  void *v2;
  void *v3;

  -[PXSmartAlbumCondition singleQuery](self, "singleQuery");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setLensModel:(id)a3
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
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSmartAlbumEXIFCondition.m"), 306, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("lensModel"));

  }
  -[PXSmartAlbumCondition singleQuery](self, "singleQuery");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setStringValue:", v5);
  PLUIGetLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v11 = v5;
    _os_log_impl(&dword_1A6789000, v7, OS_LOG_TYPE_DEBUG, "PXSmartAlbums: lens model set to: \"%@\", buf, 0xCu);
  }

  -[PXSmartAlbumCondition delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "conditionDidChange:", self);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lensModels, 0);
}

@end
