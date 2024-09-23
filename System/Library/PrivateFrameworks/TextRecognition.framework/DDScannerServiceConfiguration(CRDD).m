@implementation DDScannerServiceConfiguration(CRDD)

+ (id)_crConfigForLocale:()CRDD
{
  id v3;
  void *v4;
  uint64_t v5;
  __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;

  v3 = a3;
  v4 = v3;
  if (_MergedGlobals_29 == -1)
  {
    if (!v3)
    {
LABEL_4:
      v6 = &stru_1E98DC948;
      goto LABEL_6;
    }
  }
  else
  {
    dispatch_once(&_MergedGlobals_29, &__block_literal_global_30);
    if (!v4)
      goto LABEL_4;
  }
  v5 = objc_msgSend((id)qword_1ED0B4710, "indexOfObject:", v4);
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
    goto LABEL_4;
  v7 = (void *)MEMORY[0x1E0C99DC8];
  objc_msgSend((id)qword_1ED0B4710, "objectAtIndexedSubscript:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localeWithLocaleIdentifier:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "languageCode");
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

LABEL_6:
  v10 = (id)qword_1ED0B4708;
  objc_sync_enter(v10);
  objc_msgSend((id)qword_1ED0B4708, "objectForKeyedSubscript:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1CE78]), "initWithScannerType:passiveIntent:", 0, 1);
    if (-[__CFString length](v6, "length"))
      objc_msgSend(v11, "setValue:forKey:", v6, CFSTR("language"));
    objc_msgSend((id)qword_1ED0B4708, "setObject:forKeyedSubscript:", v11, v6);
  }
  objc_sync_exit(v10);

  return v11;
}

@end
