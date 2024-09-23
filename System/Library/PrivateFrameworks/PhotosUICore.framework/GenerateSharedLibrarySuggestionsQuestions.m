@implementation GenerateSharedLibrarySuggestionsQuestions

uint64_t ___GenerateSharedLibrarySuggestionsQuestions_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v3 = a3;
  +[PXViewControllerPresenter defaultPresenterWithViewController:](PXViewControllerPresenter, "defaultPresenterWithViewController:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = ___GenerateSharedLibrarySuggestionsQuestions_block_invoke_2;
  v8[3] = &unk_1E5148B78;
  v9 = v3;
  v5 = v3;
  PXGenerateSurveyQuestionsWithOptions(0x80000, 50, v4, v8);
  +[PXUserDefaults standardUserDefaults](PXUserDefaults, "standardUserDefaults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSurveyQuestionsHideDate:", 0);

  return 1;
}

void ___GenerateSharedLibrarySuggestionsQuestions_block_invoke_2(uint64_t a1, int a2)
{
  if (a2)
    _PresentAlert((uint64_t)CFSTR("Shared Library Suggestion Questions"), (uint64_t)CFSTR("Generated new Photos Challenges questions, available in the For You tab."), *(void **)(a1 + 32));
}

@end
