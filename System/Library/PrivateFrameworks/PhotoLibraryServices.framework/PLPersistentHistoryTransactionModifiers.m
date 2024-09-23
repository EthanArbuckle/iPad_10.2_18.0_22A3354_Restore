@implementation PLPersistentHistoryTransactionModifiers

+ (id)transactionAuthorFromChangeSource:(int)a3 syncChangeMarker:(BOOL)a4 nonCoalescing:(BOOL)a5
{
  pl_result_with_autoreleasepool();
  return (id)objc_claimAutoreleasedReturnValue();
}

id __108__PLPersistentHistoryTransactionModifiers_transactionAuthorFromChangeSource_syncChangeMarker_nonCoalescing___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[4];

  v10[3] = *MEMORY[0x1E0C80C00];
  v1 = *(unsigned __int8 *)(a1 + 36);
  v2 = *(unsigned __int8 *)(a1 + 37);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v1, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v6, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v7, 4);

  return v8;
}

- (PLPersistentHistoryTransactionModifiers)init
{
  return -[PLPersistentHistoryTransactionModifiers initWithChangeSource:syncChangeMarker:nonCoalescing:](self, "initWithChangeSource:syncChangeMarker:nonCoalescing:", 0, 0, 0);
}

- (PLPersistentHistoryTransactionModifiers)initWithChangeSource:(int)a3 syncChangeMarker:(BOOL)a4 nonCoalescing:(BOOL)a5
{
  PLPersistentHistoryTransactionModifiers *v8;
  PLPersistentHistoryTransactionModifiers *v9;
  PLPersistentHistoryTransactionModifiers *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)PLPersistentHistoryTransactionModifiers;
  v8 = -[PLPersistentHistoryTransactionModifiers init](&v12, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_changeSource = a3;
    v8->_syncChangeMarker = a4;
    v8->_nonCoalescing = a5;
    v10 = v8;
  }

  return v9;
}

- (id)encodeAsTransactionAuthor
{
  return (id)objc_msgSend((id)objc_opt_class(), "transactionAuthorFromChangeSource:syncChangeMarker:", self->_changeSource, self->_syncChangeMarker);
}

- (BOOL)updateFromTransactionAuthor:(id)a3
{
  id v4;
  id v5;
  void *v6;
  char v7;
  uint64_t v9;
  PLPersistentHistoryTransactionModifiers *v10;
  id v11;

  v4 = a3;
  v9 = MEMORY[0x1E0C809B0];
  v10 = self;
  v11 = v4;
  v5 = v4;
  pl_result_with_autoreleasepool();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLValue", v9, 3221225472, __71__PLPersistentHistoryTransactionModifiers_updateFromTransactionAuthor___block_invoke, &unk_1E3666580, v10);

  return v7;
}

- (BOOL)isSyncable
{
  return self->_syncChangeMarker && self->_changeSource != 1;
}

- (BOOL)isNonCoalescing
{
  return self->_nonCoalescing;
}

- (id)description
{
  pl_result_with_autoreleasepool();
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_pl_prettyDescriptionWithIndent:(int64_t)a3
{
  pl_result_with_autoreleasepool();
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_descriptionWithBuilder:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  PLStringFromXPCChangeSource();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendName:object:", CFSTR("changeSource"), v5);

  objc_msgSend(v4, "appendName:typeCode:value:", CFSTR("syncChangeMarker"), "B", &self->_syncChangeMarker);
  objc_msgSend(v4, "build");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)syncChangeMarker
{
  return self->_syncChangeMarker;
}

- (void)setSyncChangeMarker:(BOOL)a3
{
  self->_syncChangeMarker = a3;
}

- (int)changeSource
{
  return self->_changeSource;
}

- (void)setChangeSource:(int)a3
{
  self->_changeSource = a3;
}

- (BOOL)nonCoalescing
{
  return self->_nonCoalescing;
}

- (void)setNonCoalescing:(BOOL)a3
{
  self->_nonCoalescing = a3;
}

id __75__PLPersistentHistoryTransactionModifiers__pl_prettyDescriptionWithIndent___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  +[PLDescriptionBuilder prettyMultiLineDescriptionBuilderWithObject:indent:](PLDescriptionBuilder, "prettyMultiLineDescriptionBuilderWithObject:indent:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_descriptionWithBuilder:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __54__PLPersistentHistoryTransactionModifiers_description__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  +[PLDescriptionBuilder descriptionBuilderWithObject:](PLDescriptionBuilder, "descriptionBuilderWithObject:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_descriptionWithBuilder:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __71__PLPersistentHistoryTransactionModifiers_updateFromTransactionAuthor___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  char v4;
  uint64_t v5;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  const char *v13;
  NSObject *v14;
  uint32_t v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  NSObject *v21;
  NSObject *v22;
  NSObject *v23;
  id v24;
  uint8_t buf[4];
  NSObject *v26;
  __int16 v27;
  NSObject *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8) = 0;
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 12) = 0;
  v2 = *(id *)(a1 + 40);
  if (v2)
  {
    v3 = v2;
    v4 = objc_msgSend(v2, "isEqualToString:", &stru_1E36789C0);

    if ((v4 & 1) == 0 && (objc_msgSend(*(id *)(a1 + 40), "hasPrefix:", CFSTR("com.apple.coredata")) & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 40), "dataUsingEncoding:", 4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 0;
      objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v7, 0, &v24);
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = v24;
      if (v8)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v10 = v8;
          if ((unint64_t)-[NSObject count](v10, "count") < 2
            || (unint64_t)-[NSObject count](v10, "count") >= 4)
          {
            PLPersistentHistoryGetLog();
            v11 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v26 = v10;
              _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_ERROR, "Transaction author: Array count out of range: %@", buf, 0xCu);
            }
            v5 = MEMORY[0x1E0C9AAA0];
            goto LABEL_41;
          }
          -[NSObject objectAtIndexedSubscript:](v10, "objectAtIndexedSubscript:", 0);
          v11 = objc_claimAutoreleasedReturnValue();
          -[NSObject objectAtIndexedSubscript:](v10, "objectAtIndexedSubscript:", 1);
          v16 = objc_claimAutoreleasedReturnValue();
          v17 = 0;
          if ((unint64_t)-[NSObject count](v10, "count") >= 3)
          {
            -[NSObject objectAtIndexedSubscript:](v10, "objectAtIndexedSubscript:", 2);
            v17 = objc_claimAutoreleasedReturnValue();
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            PLPersistentHistoryGetLog();
            v18 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v26 = v11;
              _os_log_impl(&dword_199541000, v18, OS_LOG_TYPE_ERROR, "Transaction author: First object is not a number: %@", buf, 0xCu);
            }
            v5 = MEMORY[0x1E0C9AAA0];
            goto LABEL_40;
          }
          v18 = v11;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            PLPersistentHistoryGetLog();
            v22 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v26 = v16;
              _os_log_impl(&dword_199541000, v22, OS_LOG_TYPE_ERROR, "Transaction author: Second object is not a number: %@", buf, 0xCu);
            }
            v5 = MEMORY[0x1E0C9AAA0];
            goto LABEL_39;
          }
          v23 = v16;
          if (v17)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              PLPersistentHistoryGetLog();
              v21 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                v26 = v17;
                _os_log_impl(&dword_199541000, v21, OS_LOG_TYPE_ERROR, "Transaction author: Third object is not a number: %@", buf, 0xCu);
              }
              v5 = MEMORY[0x1E0C9AAA0];
              goto LABEL_38;
            }
            v19 = v17;
          }
          PLPersistentHistoryGetLog();
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412546;
            v26 = v18;
            v27 = 2112;
            v28 = v23;
            _os_log_impl(&dword_199541000, v20, OS_LOG_TYPE_DEBUG, "Transaction author: JSON change source: %@, JSON sync change marker: %@", buf, 0x16u);
          }

          *(_DWORD *)(*(_QWORD *)(a1 + 32) + 12) = -[NSObject intValue](v18, "intValue");
          *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8) = -[NSObject intValue](v23, "intValue") != 0;
          *(_BYTE *)(*(_QWORD *)(a1 + 32) + 9) = -[NSObject BOOLValue](v17, "BOOLValue");
          v5 = MEMORY[0x1E0C9AAB0];
          v21 = v17;
LABEL_38:

          v22 = v23;
LABEL_39:

LABEL_40:
LABEL_41:

          goto LABEL_42;
        }
        PLPersistentHistoryGetLog();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v26 = v8;
          v13 = "Transaction author: JSON object is not an array: %@";
          v14 = v10;
          v15 = 12;
          goto LABEL_17;
        }
      }
      else
      {
        PLPersistentHistoryGetLog();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          v12 = *(NSObject **)(a1 + 40);
          *(_DWORD *)buf = 138412546;
          v26 = v9;
          v27 = 2112;
          v28 = v12;
          v13 = "Transaction author: Unable to decode transaction author as JSON: %@: %@";
          v14 = v10;
          v15 = 22;
LABEL_17:
          _os_log_impl(&dword_199541000, v14, OS_LOG_TYPE_ERROR, v13, buf, v15);
        }
      }
      v5 = MEMORY[0x1E0C9AAA0];
LABEL_42:

      return v5;
    }
  }
  return MEMORY[0x1E0C9AAB0];
}

+ (id)transactionModifiersFromTransactionAuthor:(id)a3
{
  id v3;
  void *v4;
  id v6;

  v6 = a3;
  v3 = v6;
  pl_result_with_autoreleasepool();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)transactionAuthorFromChangeSource:(int)a3 syncChangeMarker:(BOOL)a4
{
  return (id)objc_msgSend(a1, "transactionAuthorFromChangeSource:syncChangeMarker:nonCoalescing:", *(_QWORD *)&a3, 0, 0);
}

+ (id)transactionAuthorFromChangeSource:(int)a3
{
  return (id)objc_msgSend(a1, "transactionAuthorFromChangeSource:syncChangeMarker:", *(_QWORD *)&a3, 0);
}

id __85__PLPersistentHistoryTransactionModifiers_transactionModifiersFromTransactionAuthor___block_invoke(uint64_t a1)
{
  id v2;

  v2 = objc_alloc_init(*(Class *)(a1 + 40));
  objc_msgSend(v2, "updateFromTransactionAuthor:", *(_QWORD *)(a1 + 32));
  return v2;
}

@end
