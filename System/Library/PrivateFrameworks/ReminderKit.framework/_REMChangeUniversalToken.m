@implementation _REMChangeUniversalToken

+ (id)universalToken
{
  if (universalToken_once != -1)
    dispatch_once(&universalToken_once, &__block_literal_global_9);
  return (id)universalToken_sUniversalToken;
}

- (int64_t)compareToken:(id)a3 error:(id *)a4
{
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  +[REMLog changeTracking](REMLog, "changeTracking", a3);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    -[_REMChangeUniversalToken compareToken:error:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);

  if (a4)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithREMChangeErrorCode:", 0);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (BOOL)isEqual:(id)a3
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;

  v3 = a3;
  +[REMLog changeTracking](REMLog, "changeTracking");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    -[_REMChangeUniversalToken isEqual:].cold.1(v4, v5, v6, v7, v8, v9, v10, v11);

  v12 = objc_opt_class();
  REMSpecificCast(v12, v3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13 != 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_REMChangeUniversalToken)initWithCoder:(id)a3
{
  _REMChangeUniversalToken *v4;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  if ((objc_msgSend(a3, "decodeBoolForKey:", CFSTR("isUniversal")) & 1) == 0)
  {
    +[REMLog changeTracking](REMLog, "changeTracking");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      -[_REMChangeUniversalToken initWithCoder:].cold.1(v6, v7, v8, v9, v10, v11, v12, v13);

  }
  objc_msgSend((id)objc_opt_class(), "universalToken");
  v4 = (_REMChangeUniversalToken *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeBool:forKey:", 1, CFSTR("isUniversal"));
}

- (BOOL)isUniversal
{
  return 1;
}

- (void)compareToken:(uint64_t)a3 error:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_2(&dword_1B4A39000, a1, a3, "Should not be trying to compare with the universal token.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_7();
}

- (void)isEqual:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_2(&dword_1B4A39000, a1, a3, "Should not be trying to compare equality of the universal token. Use REMCHANGE_IS_UNIVERSAL_TOKEN() instead.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_7();
}

- (void)initWithCoder:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_2(&dword_1B4A39000, a1, a3, "rem_log_fault_if (!isUniversal) -- isUniversal == NO on decoded universal change token", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_7();
}

@end
