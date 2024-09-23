@implementation TPSPeopleSuggestionValidation

- (void)validateWithCompletion:(id)a3
{
  objc_class *v4;
  void (**v5)(id, BOOL, _QWORD);
  id v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;

  v4 = (objc_class *)MEMORY[0x1E0D70988];
  v5 = (void (**)(id, BOOL, _QWORD))a3;
  v6 = objc_alloc_init(v4);
  objc_msgSend(v6, "chatGuidsForMessagesPinningWithMaxSuggestions:", 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");
  objc_msgSend(MEMORY[0x1E0DBF3D0], "targeting");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    -[TPSDictationLanguageValidation validateWithCompletion:].cold.1(self, v8 == 3, v9);

  v5[2](v5, v8 == 3, 0);
}

@end
