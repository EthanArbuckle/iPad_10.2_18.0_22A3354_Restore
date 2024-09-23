@implementation SXScrollPosition

- (SXScrollPosition)initWithJSONRepresentation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  SXScrollPosition *v16;
  __objc2_class *v17;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;

  v4 = a3;
  v5 = (void *)MEMORY[0x24BDD1608];
  objc_msgSend(v4, "dataUsingEncoding:", 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0;
  objc_msgSend(v5, "JSONObjectWithData:options:error:", v6, 0, &v26);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v26;

  if (!v8)
  {
    if (+[SXTextComponentScrollPosition jsonDictionaryRepresentationIsValid:exactly:](SXTextComponentScrollPosition, "jsonDictionaryRepresentationIsValid:exactly:", v7, 1))
    {
      v17 = SXTextComponentScrollPosition;
    }
    else
    {
      if (!+[SXComponentScrollPosition jsonDictionaryRepresentationIsValid:exactly:](SXComponentScrollPosition, "jsonDictionaryRepresentationIsValid:exactly:", v7, 1))
      {
        v19 = SXDefaultLog;
        if (os_log_type_enabled((os_log_t)SXDefaultLog, OS_LOG_TYPE_ERROR))
          -[SXScrollPosition initWithJSONRepresentation:].cold.1((uint64_t)v4, v19, v20, v21, v22, v23, v24, v25);
        goto LABEL_4;
      }
      v17 = SXComponentScrollPosition;
    }
    v16 = (SXScrollPosition *)objc_msgSend([v17 alloc], "initWithDictionaryRepresentation:exactly:", v7, 1);
    goto LABEL_10;
  }
  v9 = SXDefaultLog;
  if (os_log_type_enabled((os_log_t)SXDefaultLog, OS_LOG_TYPE_ERROR))
    -[SXScrollPosition initWithJSONRepresentation:].cold.2((uint64_t)v4, v9, v10, v11, v12, v13, v14, v15);
LABEL_4:
  v16 = 0;
LABEL_10:

  return v16;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)jsonRepresentation
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  id v11;

  -[SXScrollPosition dictionaryRepresentation](self, "dictionaryRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = v2;
    v11 = 0;
    objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", v4, 0, &v11);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v11;
    if (v5)
    {
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v5, 4);
    }
    else
    {
      v8 = SXDefaultLog;
      if (os_log_type_enabled((os_log_t)SXDefaultLog, OS_LOG_TYPE_FAULT))
        -[SXScrollPosition jsonRepresentation].cold.1((uint64_t)v6, v8, v9);
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return (NSString *)v7;
}

- (SXScrollPosition)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SXScrollPosition;
  return -[SXScrollPosition init](&v4, sel_init, a3);
}

+ (BOOL)jsonDictionaryRepresentationIsValid:(id)a3 exactly:(BOOL)a4
{
  return 0;
}

- (id)dictionaryRepresentation
{
  return 0;
}

- (void)initWithJSONRepresentation:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_217023000, a2, a3, "Failed to create scroll position from invalid JSON: %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)initWithJSONRepresentation:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_217023000, a2, a3, "Got an error creating the dictionary representation of %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)jsonRepresentation
{
  id v1;
  NSObject *v2;
  uint64_t v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v1 = objc_begin_catch(a1);
  v2 = SXDefaultLog;
  if (os_log_type_enabled((os_log_t)SXDefaultLog, OS_LOG_TYPE_FAULT))
  {
    v4 = 138543362;
    v5 = v1;
    OUTLINED_FUNCTION_1(&dword_217023000, v2, v3, "Failed to convert scroll position to JSON with exception: %{public}@", (uint8_t *)&v4);
  }

  objc_end_catch();
}

@end
