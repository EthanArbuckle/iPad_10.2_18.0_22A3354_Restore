@implementation ICMediaTimeFormatter

+ (id)timecodeFormatter
{
  if (timecodeFormatter_token != -1)
    dispatch_once(&timecodeFormatter_token, &__block_literal_global_75);
  return (id)timecodeFormatter_timecodeFormatter;
}

uint64_t __41__ICMediaTimeFormatter_timecodeFormatter__block_invoke()
{
  ICMediaTimeFormatter *v0;
  void *v1;

  v0 = objc_alloc_init(ICMediaTimeFormatter);
  v1 = (void *)timecodeFormatter_timecodeFormatter;
  timecodeFormatter_timecodeFormatter = (uint64_t)v0;

  return objc_msgSend((id)timecodeFormatter_timecodeFormatter, "setUnitsStyle:", 0);
}

+ (id)wordyFormatter
{
  if (wordyFormatter_token != -1)
    dispatch_once(&wordyFormatter_token, &__block_literal_global_1);
  return (id)wordyFormatter_briefFormatter;
}

uint64_t __38__ICMediaTimeFormatter_wordyFormatter__block_invoke()
{
  ICMediaTimeFormatter *v0;
  void *v1;

  v0 = objc_alloc_init(ICMediaTimeFormatter);
  v1 = (void *)wordyFormatter_briefFormatter;
  wordyFormatter_briefFormatter = (uint64_t)v0;

  objc_msgSend((id)wordyFormatter_briefFormatter, "setUnitsStyle:", 2);
  return objc_msgSend((id)wordyFormatter_briefFormatter, "setZeroFormattingBehavior:", 14);
}

- (id)stringForObjectValue:(id)a3
{
  id v4;
  double v5;
  id v6;
  double v7;
  double v8;
  double v9;
  unsigned int v10;
  uint64_t v11;
  void *v12;
  objc_super v14;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "doubleValue");
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v14.receiver = self;
      v14.super_class = (Class)ICMediaTimeFormatter;
      -[NSDateComponentsFormatter stringForObjectValue:](&v14, sel_stringForObjectValue_, v4);
      v11 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
    v6 = v4;
    v7 = (double)objc_msgSend(v6, "days");
    v8 = (double)objc_msgSend(v6, "hours") * 3600.0 + v7 * 86400.0;
    v9 = v8 + (double)objc_msgSend(v6, "minutes") * 60.0;
    v10 = objc_msgSend(v6, "seconds");

    v5 = v9 + (double)v10;
  }
  -[ICMediaTimeFormatter stringFromTimeInterval:](self, "stringFromTimeInterval:", v5);
  v11 = objc_claimAutoreleasedReturnValue();
LABEL_7:
  v12 = (void *)v11;

  return v12;
}

- (id)stringFromTimeInterval:(double)a3
{
  double v3;
  NSObject *v6;
  ICMediaTimeFormatter *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  double v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  uint64_t v16;
  objc_super v17;

  v3 = a3;
  if ((*(_QWORD *)&a3 & 0x7FFFFFFFFFFFFFFFuLL) >= 0x7FF0000000000000)
  {
    v6 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[ICMediaTimeFormatter stringFromTimeInterval:].cold.1(a2, v6, v3);

    v3 = 0.0;
  }
  v7 = self;
  objc_sync_enter(v7);
  if (-[NSDateComponentsFormatter unitsStyle](v7, "unitsStyle"))
  {
    if (v3 >= 60.0)
    {
      if (v3 >= 3600.0)
      {
        if (v3 >= 86400.0)
        {
          v15 = fmod(v3, 86400.0);
          if (v15 >= 3600.0)
            v16 = 2;
          else
            v16 = 3;
          -[NSDateComponentsFormatter setUnitsStyle:](v7, "setUnitsStyle:", v16);
          if (v15 >= 3600.0)
            v14 = 48;
          else
            v14 = 16;
        }
        else
        {
          v12 = fmod(v3, 3600.0);
          if (v12 >= 60.0)
            v13 = 2;
          else
            v13 = 3;
          -[NSDateComponentsFormatter setUnitsStyle:](v7, "setUnitsStyle:", v13);
          if (v12 >= 60.0)
            v14 = 96;
          else
            v14 = 32;
        }
        -[NSDateComponentsFormatter setAllowedUnits:](v7, "setAllowedUnits:", v14);
      }
      else
      {
        if (fmod(v3, 60.0) == 0.0)
          v8 = 3;
        else
          v8 = 2;
        -[NSDateComponentsFormatter setUnitsStyle:](v7, "setUnitsStyle:", v8);
        -[NSDateComponentsFormatter setAllowedUnits:](v7, "setAllowedUnits:", 192);
      }
    }
    else
    {
      -[NSDateComponentsFormatter setUnitsStyle:](v7, "setUnitsStyle:", 3);
      -[NSDateComponentsFormatter setAllowedUnits:](v7, "setAllowedUnits:", 128);
    }
  }
  else
  {
    if (v3 < 60.0)
    {
      -[NSDateComponentsFormatter setAllowedUnits:](v7, "setAllowedUnits:", 192);
      v9 = 0x10000;
    }
    else
    {
      -[NSDateComponentsFormatter setAllowedUnits:](v7, "setAllowedUnits:", 240);
      v9 = 1;
    }
    -[NSDateComponentsFormatter setZeroFormattingBehavior:](v7, "setZeroFormattingBehavior:", v9);
  }
  v17.receiver = v7;
  v17.super_class = (Class)ICMediaTimeFormatter;
  -[NSDateComponentsFormatter stringFromTimeInterval:](&v17, sel_stringFromTimeInterval_, v3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v7);

  return v10;
}

- (void)stringFromTimeInterval:(double)a3 .cold.1(const char *a1, NSObject *a2, double a3)
{
  void *v5;
  int v6;
  double v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  NSStringFromSelector(a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 134218242;
  v7 = a3;
  v8 = 2112;
  v9 = v5;
  _os_log_error_impl(&dword_1AC7A1000, a2, OS_LOG_TYPE_ERROR, "passed bad time interval %f to %@", (uint8_t *)&v6, 0x16u);

}

@end
