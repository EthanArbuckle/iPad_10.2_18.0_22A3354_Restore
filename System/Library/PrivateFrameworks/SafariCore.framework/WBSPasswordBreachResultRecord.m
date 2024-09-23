@implementation WBSPasswordBreachResultRecord

- (WBSPasswordBreachResultRecord)initWithPersistentIdentifier:(id)a3 result:(unint64_t)a4 dateLastModified:(id)a5
{
  id v9;
  id v10;
  WBSPasswordBreachResultRecord *v11;
  WBSPasswordBreachResultRecord *v12;
  WBSPasswordBreachResultRecord *v13;
  objc_super v15;

  v9 = a3;
  v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)WBSPasswordBreachResultRecord;
  v11 = -[WBSPasswordBreachResultRecord init](&v15, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_persistentIdentifier, a3);
    v12->_result = a4;
    objc_storeStrong((id *)&v12->_dateLastModified, a5);
    v13 = v12;
  }

  return v12;
}

- (WBSPasswordBreachResultRecord)initWithDictionaryRepresentation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  WBSPasswordBreachResultRecord *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;

  v4 = a3;
  objc_msgSend(v4, "safari_dataForKey:", CFSTR("PersistentIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "safari_numberForKey:", CFSTR("Result"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      v8 = objc_msgSend(v6, "unsignedIntegerValue");
      objc_msgSend(v4, "safari_dateForKey:", CFSTR("DateLastModified"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        self = -[WBSPasswordBreachResultRecord initWithPersistentIdentifier:result:dateLastModified:](self, "initWithPersistentIdentifier:result:dateLastModified:", v5, v8, v9);
        v10 = self;
      }
      else
      {
        v27 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          -[WBSPasswordBreachResultRecord initWithDictionaryRepresentation:].cold.3(v27, v28, v29, v30, v31, v32, v33, v34);
        v10 = 0;
      }

    }
    else
    {
      v19 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        -[WBSPasswordBreachResultRecord initWithDictionaryRepresentation:].cold.2(v19, v20, v21, v22, v23, v24, v25, v26);
      v10 = 0;
    }

  }
  else
  {
    v11 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[WBSPasswordBreachResultRecord initWithDictionaryRepresentation:].cold.1(v11, v12, v13, v14, v15, v16, v17, v18);
    v10 = 0;
  }

  return v10;
}

- (NSDictionary)dictionaryRepresentation
{
  unint64_t v3;
  void *v4;
  NSDate *dateLastModified;
  void *v6;
  _QWORD v8[3];
  _QWORD v9[4];

  v9[3] = *MEMORY[0x1E0C80C00];
  v3 = self->_result;
  v9[0] = self->_persistentIdentifier;
  v8[0] = CFSTR("PersistentIdentifier");
  v8[1] = CFSTR("Result");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[2] = CFSTR("DateLastModified");
  dateLastModified = self->_dateLastModified;
  v9[1] = v4;
  v9[2] = dateLastModified;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v6;
}

+ (id)resultRecordsFromDictionaryRepresentations:(id)a3
{
  return (id)objc_msgSend(a3, "safari_mapAndFilterObjectsUsingBlock:", &__block_literal_global_36);
}

WBSPasswordBreachResultRecord *__76__WBSPasswordBreachResultRecord_resultRecordsFromDictionaryRepresentations___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  WBSPasswordBreachResultRecord *v3;

  v2 = a2;
  v3 = -[WBSPasswordBreachResultRecord initWithDictionaryRepresentation:]([WBSPasswordBreachResultRecord alloc], "initWithDictionaryRepresentation:", v2);

  return v3;
}

+ (id)dictionaryRepresentationsForResultRecords:(id)a3
{
  return (id)objc_msgSend(a3, "safari_mapAndFilterObjectsUsingBlock:", &__block_literal_global_9_0);
}

uint64_t __75__WBSPasswordBreachResultRecord_dictionaryRepresentationsForResultRecords___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "dictionaryRepresentation");
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p, persistentIdentifier: %@, result: %lu, dateLastModified: %@>"), objc_opt_class(), self, self->_persistentIdentifier, self->_result, self->_dateLastModified);
}

- (NSData)persistentIdentifier
{
  return self->_persistentIdentifier;
}

- (unint64_t)result
{
  return self->_result;
}

- (NSDate)dateLastModified
{
  return self->_dateLastModified;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateLastModified, 0);
  objc_storeStrong((id *)&self->_persistentIdentifier, 0);
}

- (void)initWithDictionaryRepresentation:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4_0(&dword_1B2621000, a1, a3, "Missing persistent identifier from result record.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_5();
}

- (void)initWithDictionaryRepresentation:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4_0(&dword_1B2621000, a1, a3, "Missing result number from result record.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_5();
}

- (void)initWithDictionaryRepresentation:(uint64_t)a3 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4_0(&dword_1B2621000, a1, a3, "Missing date last modified from result record.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_5();
}

@end
