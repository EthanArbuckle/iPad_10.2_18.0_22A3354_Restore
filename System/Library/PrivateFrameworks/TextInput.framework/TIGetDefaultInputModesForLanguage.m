@implementation TIGetDefaultInputModesForLanguage

uint64_t __TIGetDefaultInputModesForLanguage_block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  TIInputModeGetNormalizedIdentifier(a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "containsObject:", v3);

  return v4;
}

void __TIGetDefaultInputModesForLanguage_block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;

  v12 = objc_alloc(MEMORY[0x1E0C99E08]);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("en_US"), 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("en_US"), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("ru_RU"), CFSTR("en_US"), 0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("en_IN"), CFSTR("hi"), 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("intl"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("en_US"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("en_US"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("ru_RU"), CFSTR("en_US"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("lu_LU"), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("en_US"), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("en_US"), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v12, "initWithObjectsAndKeys:", v13, CFSTR("AM"), v11, CFSTR("AZ"), v0, CFSTR("BY"), v1, CFSTR("IN"), v2, CFSTR("intl"), v3, CFSTR("KE"), v4, CFSTR("KZ"), v5, CFSTR("KY"), v6,
         CFSTR("lu"),
         v7,
         CFSTR("TJ"),
         v8,
         CFSTR("UZ"),
         0);
  v10 = (void *)__defaultLanguageInputModes;
  __defaultLanguageInputModes = v9;

}

@end
