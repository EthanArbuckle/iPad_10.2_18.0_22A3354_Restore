@implementation PHASharingSuggestionGenerationTask

- (NSString)name
{
  return (NSString *)CFSTR("PHASharingSuggestionGenerationTask");
}

- (double)period
{
  return -2.0;
}

- (BOOL)currentPlatformIsSupported
{
  return 1;
}

- (id)incrementalKey
{
  return 0;
}

- (id)taskClassDependencies
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)priority
{
  return -1;
}

- (BOOL)shouldRunWithGraphManager:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  char v6;
  char v7;
  NSObject *v8;
  uint8_t v10[16];

  v3 = a3;
  objc_msgSend(v3, "workingContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "photoLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isCloudPhotoLibraryEnabled");

  if ((v6 & 1) != 0)
  {
    v7 = objc_msgSend(v3, "isReady");
  }
  else
  {
    objc_msgSend(v4, "loggingConnection");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_1CAC16000, v8, OS_LOG_TYPE_INFO, "[PHASharingSuggestionGenerationTask] Not running sharing suggestion task because cloud photo library is not enabled", v10, 2u);
    }

    v7 = 0;
  }

  return v7;
}

- (BOOL)runWithGraphManager:(id)a3 progressReporter:(id)a4 error:(id *)a5
{
  void *v5;
  BOOL v6;

  -[PHASharingSuggestionGenerationTask generateSuggestionsWithGraphManager:progressReporter:error:](self, "generateSuggestionsWithGraphManager:progressReporter:error:", a3, a4, a5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5 != 0;

  return v6;
}

- (void)timeoutFatal:(BOOL)a3
{
  uint8_t v3[16];

  if (a3)
    __assert_rtn("-[PHASharingSuggestionGenerationTask timeoutFatal:]", "PHASharingSuggestionGenerationTask.m", 85, "NO");
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_fault_impl(&dword_1CAC16000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "PHASharingSuggestionGenerationTask is stuck", v3, 2u);
  }
}

- (id)generateSuggestionsWithGraphManager:(id)a3 progressReporter:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  PHASuggestionController *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void **v15;
  uint64_t *v16;
  void *v17;
  uint64_t v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, _BYTE *);
  void *v22;
  id v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a3;
  v9 = -[PHASuggestionController initWithGraphManager:]([PHASuggestionController alloc], "initWithGraphManager:", v8);

  if (self->_suggestionOptionsDictionary)
    v10 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D76250]), "initWithOptionsDictionary:", self->_suggestionOptionsDictionary);
  else
    v10 = objc_alloc_init(MEMORY[0x1E0D76250]);
  v11 = v10;
  objc_msgSend(v10, "setDefaultStartAndEndDatesIfNeeded");
  -[PHASuggestionController ingestExistingSuggestionsWithOptions:](v9, "ingestExistingSuggestionsWithOptions:", v11);
  if (!self->_suggestionOptionsDictionary)
    objc_msgSend(v11, "setAllowNotification:", 1);
  v19 = MEMORY[0x1E0C809B0];
  v20 = 3221225472;
  v21 = __97__PHASharingSuggestionGenerationTask_generateSuggestionsWithGraphManager_progressReporter_error___block_invoke;
  v22 = &unk_1E8521438;
  v12 = v7;
  v23 = v12;
  -[PHASuggestionController generateSharingSuggestionsWithOptions:progress:](v9, "generateSharingSuggestionsWithOptions:progress:", v11, &v19);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v11, "discardGeneratedSuggestions", v19, v20, v21, v22) & 1) != 0)
  {
    v24 = *MEMORY[0x1E0D722D8];
    v25 = v13;
    v14 = (void *)MEMORY[0x1E0C99D80];
    v15 = &v25;
    v16 = &v24;
  }
  else
  {
    v26 = *MEMORY[0x1E0D722E0];
    v27[0] = v13;
    v14 = (void *)MEMORY[0x1E0C99D80];
    v15 = (void **)v27;
    v16 = &v26;
  }
  objc_msgSend(v14, "dictionaryWithObjects:forKeys:count:", v15, v16, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (NSDictionary)suggestionOptionsDictionary
{
  return self->_suggestionOptionsDictionary;
}

- (void)setSuggestionOptionsDictionary:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestionOptionsDictionary, 0);
}

uint64_t __97__PHASharingSuggestionGenerationTask_generateSuggestionsWithGraphManager_progressReporter_error___block_invoke(uint64_t a1, _BYTE *a2)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isCancelledWithProgress:");
  *a2 = result;
  return result;
}

@end
