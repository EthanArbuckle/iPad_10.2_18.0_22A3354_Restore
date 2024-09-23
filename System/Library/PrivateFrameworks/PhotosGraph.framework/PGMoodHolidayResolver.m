@implementation PGMoodHolidayResolver

+ (void)initialize
{
  _QWORD block[5];
  objc_super v4;

  if ((id)objc_opt_class() == a1)
  {
    v4.receiver = a1;
    v4.super_class = (Class)&OBJC_METACLASS___PGMoodHolidayResolver;
    objc_msgSendSuper2(&v4, sel_initialize);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __35__PGMoodHolidayResolver_initialize__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = a1;
    if (initialize_onceToken != -1)
      dispatch_once(&initialize_onceToken, block);
  }
}

+ (id)moodVectorForHolidayCategory:(unint64_t)a3
{
  void *v4;
  PGMoodVector *v5;
  void *v6;
  NSObject *v7;
  int v9;
  unint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (a3 > 4)
  {
    +[PGLogging sharedLogging](PGLogging, "sharedLogging");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "loggingConnection");
    v7 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v9 = 134217984;
      v10 = a3;
      _os_log_error_impl(&dword_1CA237000, v7, OS_LOG_TYPE_ERROR, "Unknown holiday category: %lu", (uint8_t *)&v9, 0xCu);
    }

    return 0;
  }
  else
  {
    objc_msgSend((id)sPGHolidayMoodDictionary, "objectForKeyedSubscript:", off_1E842AE88[a3]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
      v5 = -[PGMoodVector initWithArray:]([PGMoodVector alloc], "initWithArray:", v4);
    else
      v5 = 0;

    return v5;
  }
}

+ (id)moodVectorForMoodIdentifier:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v3 = a3;
  if (objc_msgSend(v3, "hasPrefix:", CFSTR("Holiday.")))
  {
    objc_msgSend(v3, "componentsSeparatedByString:", CFSTR("."));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "lastObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "integerValue");

    +[PGMoodHolidayResolver moodVectorForHolidayCategory:](PGMoodHolidayResolver, "moodVectorForHolidayCategory:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7 && (objc_msgSend(v3, "containsString:", CFSTR("Celebrated")) & 1) == 0)
      objc_msgSend(v7, "filterWithMoods:", objc_msgSend(v7, "moodsWithThreshold:", 1.0));
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

void __35__PGMoodHolidayResolver_initialize__block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", *(_QWORD *)(a1 + 32));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "URLForResource:withExtension:", CFSTR("MoodForHoliday"), CFSTR("plist"));
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfURL:", v4);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)sPGHolidayMoodDictionary;
  sPGHolidayMoodDictionary = v2;

}

@end
