@implementation PASLanguageDetection

void __113___PASLanguageDetection__dominantLanguageTagFromTextWithMaxLength_maxLength_minimumProbability_hints_hintsCount___block_invoke_178(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  void *v8;

  v3 = a2;
  v4 = (void *)MEMORY[0x1A1AFDC98]();
  if (*(_QWORD *)(a1 + 48) && *(_QWORD *)(a1 + 56))
    NLLanguageIdentifierSetLanguageHints();
  CFStringGetLength(*(CFStringRef *)(a1 + 32));
  NLLanguageIdentifierConsumeString();
  NLLanguageIdentifierGetTopHypotheses();
  NLLanguageIdentifierReset();
  if (*(double *)(a1 + 72) > 0.0 || 0.0 + 0.1 >= 0.0)
  {
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v8 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = 0;
  }
  else
  {
    objc_opt_self();
    v6 = 0;
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;
  }

  objc_autoreleasePoolPop(v4);
}

void __113___PASLanguageDetection__dominantLanguageTagFromTextWithMaxLength_maxLength_minimumProbability_hints_hintsCount___block_invoke()
{
  void *v0;
  _PASLazyPurgeableResult *v1;
  void *v2;

  v0 = (void *)MEMORY[0x1A1AFDC98]();
  v1 = -[_PASLazyPurgeableResult initWithBlock:]([_PASLazyPurgeableResult alloc], "initWithBlock:", &__block_literal_global_175);
  v2 = (void *)_dominantLanguageTagFromTextWithMaxLength_maxLength_minimumProbability_hints_hintsCount___pasExprOnceResult;
  _dominantLanguageTagFromTextWithMaxLength_maxLength_minimumProbability_hints_hintsCount___pasExprOnceResult = (uint64_t)v1;

  objc_autoreleasePoolPop(v0);
}

_PASLock *__113___PASLanguageDetection__dominantLanguageTagFromTextWithMaxLength_maxLength_minimumProbability_hints_hintsCount___block_invoke_2()
{
  _QWORD *v0;
  _PASLock *v1;

  v0 = (_QWORD *)objc_opt_new();
  v0[1] = NLLanguageIdentifierCreate();
  v1 = -[_PASLock initWithGuardedData:]([_PASLock alloc], "initWithGuardedData:", v0);

  return v1;
}

uint64_t __100___PASLanguageDetection_detectLanguageFromTextHeuristicallyWithLanguages_languages_defaultLanguage___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", +[_PASLanguageDetection languageIdForLanguageString:](_PASLanguageDetection, "languageIdForLanguageString:", a2));
}

@end
