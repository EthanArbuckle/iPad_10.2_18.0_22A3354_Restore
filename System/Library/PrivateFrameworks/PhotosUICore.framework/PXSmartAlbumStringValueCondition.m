@implementation PXSmartAlbumStringValueCondition

- (NSString)stringValue
{
  void *v2;
  __CFString *v3;
  __CFString *v4;
  NSString *v5;

  -[PXSmartAlbumCondition singleQuery](self, "singleQuery");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringValue");
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    v3 = &stru_1E5149688;
  v5 = v3;

  return v5;
}

- (void)setStringValue:(id)a3
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
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSmartAlbumStringValueCondition.m"), 27, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("stringValue"));

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
    _os_log_impl(&dword_1A6789000, v7, OS_LOG_TYPE_DEBUG, "PXSmartAlbums: string value set to: \"%@\", buf, 0xCu);
  }

  -[PXSmartAlbumCondition delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "conditionDidChange:", self);

}

@end
