@implementation TPSSystemVersionUpdateValidation

- (void)validateWithCompletion:(id)a3
{
  void (**v4)(id, _BOOL8, _QWORD);
  void *v5;
  uint64_t v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  _BOOL8 v13;
  NSObject *v14;

  v4 = (void (**)(id, _BOOL8, _QWORD))a3;
  -[TPSTargetingValidation value](self, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "TPSSafeIntegerForKey:", CFSTR("type"));

  -[TPSTargetingValidation value](self, "value");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "TPSSafeDoubleForKey:", CFSTR("interval"));
  v9 = v8;

  -[TPSTargetingValidation value](self, "value");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "TPSSafeIntegerForKey:", CFSTR("order"));

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0DBF3D0], "targeting");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[TPSSystemVersionUpdateValidation validateWithCompletion:].cold.2(v6);

    v13 = 0;
  }
  else
  {
    v13 = -[TPSSystemVersionUpdateValidation validateLastMajorSystemVersionUpdateSinceTimeInterval:desiredOrder:](self, "validateLastMajorSystemVersionUpdateSinceTimeInterval:desiredOrder:", v11, v9);
  }
  objc_msgSend(MEMORY[0x1E0DBF3D0], "targeting");
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    -[TPSDictationLanguageValidation validateWithCompletion:].cold.1(self, v13, v14);

  v4[2](v4, v13, 0);
}

- (BOOL)validateLastMajorSystemVersionUpdateSinceTimeInterval:(double)a3 desiredOrder:(int64_t)a4
{
  void *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  BOOL v10;
  void *v11;
  void *v12;

  objc_msgSend(MEMORY[0x1E0DBF348], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lastMajorVersionUpdateDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    if ((unint64_t)(a4 - 2) > 0xFFFFFFFFFFFFFFFCLL)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "dateByAddingTimeInterval:", a3);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v11, "compare:", v12) == a4;

      goto LABEL_11;
    }
    objc_msgSend(MEMORY[0x1E0DBF3D0], "targeting");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[TPSSystemVersionUpdateValidation validateLastMajorSystemVersionUpdateSinceTimeInterval:desiredOrder:].cold.2(a4);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DBF3D0], "targeting");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[TPSSystemVersionUpdateValidation validateLastMajorSystemVersionUpdateSinceTimeInterval:desiredOrder:].cold.1(v9);

  }
  v10 = 0;
LABEL_11:

  return v10;
}

- (void)validateWithCompletion:(uint64_t)a1 .cold.2(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_1(&dword_1DAC2F000, v2, v3, "Unsupported system version update type: %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_8();
}

- (void)validateLastMajorSystemVersionUpdateSinceTimeInterval:(os_log_t)log desiredOrder:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1DAC2F000, log, OS_LOG_TYPE_ERROR, "Unable to find last major version update date", v1, 2u);
}

- (void)validateLastMajorSystemVersionUpdateSinceTimeInterval:(uint64_t)a1 desiredOrder:.cold.2(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_1(&dword_1DAC2F000, v2, v3, "Invalid ordered parameter: %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_8();
}

@end
