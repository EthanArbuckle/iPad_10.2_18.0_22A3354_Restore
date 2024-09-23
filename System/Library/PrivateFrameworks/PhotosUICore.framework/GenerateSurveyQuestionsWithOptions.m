@implementation GenerateSurveyQuestionsWithOptions

void ___GenerateSurveyQuestionsWithOptions_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  int v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  const char *v11;
  NSObject *v12;
  os_log_type_t v13;
  uint32_t v14;
  id v15;
  id v16;
  _QWORD block[4];
  id v18;
  id v19;
  char v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x1E0D721D0]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLValue");

  PLUIGetLog();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      PHQuestionOptionsDebugDescription();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v22 = v10;
      v11 = "Did generate some questions for options: %{public}@";
      v12 = v9;
      v13 = OS_LOG_TYPE_DEFAULT;
      v14 = 12;
LABEL_6:
      _os_log_impl(&dword_1A6789000, v12, v13, v11, buf, v14);

    }
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    PHQuestionOptionsDebugDescription();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v22 = v10;
    v23 = 2112;
    v24 = v5;
    v11 = "Failed to generate questions for options: %{public}@, error: %@";
    v12 = v9;
    v13 = OS_LOG_TYPE_ERROR;
    v14 = 22;
    goto LABEL_6;
  }

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = ___GenerateSurveyQuestionsWithOptions_block_invoke_148;
  block[3] = &unk_1E5146308;
  v15 = *(id *)(a1 + 32);
  v20 = v7;
  v18 = v5;
  v19 = v15;
  v16 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t ___GenerateSurveyQuestionsWithOptions_block_invoke_148(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

@end
