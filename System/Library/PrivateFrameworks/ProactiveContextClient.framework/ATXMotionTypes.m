@implementation ATXMotionTypes

+ (id)stringForMotionType:(int64_t)a3
{
  NSObject *v5;

  if ((unint64_t)a3 < 5)
    return off_1E942DEB0[a3];
  __atxlog_handle_default();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    +[ATXMotionTypes stringForMotionType:].cold.1(a3, v5);

  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("stringForMotionType called with invalid ATXMotionType of %tu"), a3);
  return CFSTR("Error");
}

+ (int64_t)motionTypeForString:(id)a3 found:(BOOL *)a4
{
  id v6;
  int64_t v7;
  int64_t v8;
  void *v9;
  int v10;
  BOOL v11;

  v6 = a3;
  v7 = 0;
  while (1)
  {
    v8 = v7;
    objc_msgSend(a1, "stringForMotionType:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isEqualToString:", v6);

    if (v10)
      break;
    v7 = v8 + 1;
    if (v8 == 4)
    {
      if (!a4)
        goto LABEL_9;
      v11 = 0;
      goto LABEL_8;
    }
  }
  if (!a4)
    goto LABEL_9;
  v11 = 1;
LABEL_8:
  *a4 = v11;
LABEL_9:

  return v8;
}

+ (void)stringForMotionType:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 134217984;
  v3 = a1;
  _os_log_error_impl(&dword_1D2C00000, a2, OS_LOG_TYPE_ERROR, "stringForMotionType called with invalid ATXMotionType of %tu", (uint8_t *)&v2, 0xCu);
}

@end
