@implementation WBSPasswordBreachResultQuery

- (WBSPasswordBreachResultQuery)initWithPersistentIdentifier:(id)a3 dateLastModified:(id)a4
{
  id v7;
  id v8;
  WBSPasswordBreachResultQuery *v9;
  WBSPasswordBreachResultQuery *v10;
  WBSPasswordBreachResultQuery *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)WBSPasswordBreachResultQuery;
  v9 = -[WBSPasswordBreachResultQuery init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_persistentIdentifier, a3);
    objc_storeStrong((id *)&v10->_dateLastModified, a4);
    v11 = v10;
  }

  return v10;
}

- (WBSPasswordBreachResultQuery)initWithDictionaryRepresentation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  WBSPasswordBreachResultQuery *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v4 = a3;
  objc_msgSend(v4, "safari_dataForKey:", CFSTR("PersistentIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "safari_dateForKey:", CFSTR("DateLastModified"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      self = -[WBSPasswordBreachResultQuery initWithPersistentIdentifier:dateLastModified:](self, "initWithPersistentIdentifier:dateLastModified:", v5, v6);
      v7 = self;
    }
    else
    {
      v16 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        -[WBSPasswordBreachResultQuery initWithDictionaryRepresentation:].cold.2(v16, v17, v18, v19, v20, v21, v22, v23);
      v7 = 0;
    }

  }
  else
  {
    v8 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[WBSPasswordBreachResultQuery initWithDictionaryRepresentation:].cold.1(v8, v9, v10, v11, v12, v13, v14, v15);
    v7 = 0;
  }

  return v7;
}

- (NSDictionary)dictionaryRepresentation
{
  NSDate *dateLastModified;
  _QWORD v4[2];
  _QWORD v5[3];

  v5[2] = *MEMORY[0x1E0C80C00];
  v4[0] = CFSTR("PersistentIdentifier");
  v4[1] = CFSTR("DateLastModified");
  dateLastModified = self->_dateLastModified;
  v5[0] = self->_persistentIdentifier;
  v5[1] = dateLastModified;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, v4, 2);
  return (NSDictionary *)(id)objc_claimAutoreleasedReturnValue();
}

+ (id)resultQueriesFromDictionaryRepresentations:(id)a3
{
  return (id)objc_msgSend(a3, "safari_mapAndFilterObjectsUsingBlock:", &__block_literal_global_35);
}

WBSPasswordBreachResultQuery *__75__WBSPasswordBreachResultQuery_resultQueriesFromDictionaryRepresentations___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  WBSPasswordBreachResultQuery *v3;

  v2 = a2;
  v3 = -[WBSPasswordBreachResultQuery initWithDictionaryRepresentation:]([WBSPasswordBreachResultQuery alloc], "initWithDictionaryRepresentation:", v2);

  return v3;
}

+ (id)dictionaryRepresentationsForResultQueries:(id)a3
{
  return (id)objc_msgSend(a3, "safari_mapAndFilterObjectsUsingBlock:", &__block_literal_global_6);
}

uint64_t __74__WBSPasswordBreachResultQuery_dictionaryRepresentationsForResultQueries___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "dictionaryRepresentation");
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p; persistentIdentifier = %@; dateLastModified = %@>"),
               objc_opt_class(),
               self,
               self->_persistentIdentifier,
               self->_dateLastModified);
}

- (NSData)persistentIdentifier
{
  return self->_persistentIdentifier;
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
  OUTLINED_FUNCTION_4_0(&dword_1B2621000, a1, a3, "Missing persistent identifier from result query.", a5, a6, a7, a8, 0);
}

- (void)initWithDictionaryRepresentation:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4_0(&dword_1B2621000, a1, a3, "Missing date last modified from result query.", a5, a6, a7, a8, 0);
}

@end
