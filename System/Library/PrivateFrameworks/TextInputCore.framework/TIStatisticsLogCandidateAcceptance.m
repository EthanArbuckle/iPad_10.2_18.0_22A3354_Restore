@implementation TIStatisticsLogCandidateAcceptance

void __TIStatisticsLogCandidateAcceptance_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = (void *)MEMORY[0x1DF0A2708]();
  objc_msgSend(*(id *)(a1 + 32), "personalizationWordAcceptanceTracker");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "trackEventWithPropertyValues:", MEMORY[0x1E0C9AA60]);

  objc_autoreleasePoolPop(v2);
}

void __TIStatisticsLogCandidateAcceptance_block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1DF0A2708]();
  objc_msgSend(*(id *)(a1 + 32), "personalizationOfferTracker");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "trackEventWithPropertyValues:", MEMORY[0x1E0C9AA60]);

  +[TITransientLexiconManager sharedInstance](TITransientLexiconManager, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "candidate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "provideFeedbackForString:type:style:", v5, 3, 2);

  objc_autoreleasePoolPop(v2);
}

void __TIStatisticsLogCandidateAcceptance_block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1DF0A2708]();
  objc_msgSend(*(id *)(a1 + 32), "personalizationEngagementTracker");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "trackEventWithPropertyValues:", MEMORY[0x1E0C9AA60]);

  +[TITransientLexiconManager sharedInstance](TITransientLexiconManager, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "candidate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "provideFeedbackForString:type:style:", v5, 1, *(unsigned __int8 *)(a1 + 48));

  objc_autoreleasePoolPop(v2);
}

void __TIStatisticsLogCandidateAcceptance_block_invoke_4(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v2 = (void *)MEMORY[0x1DF0A2708]();
  v3 = (void *)MEMORY[0x1E0D87BF8];
  v4 = *MEMORY[0x1E0D87C20];
  objc_msgSend(*(id *)(a1 + 32), "normalizedIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  TIInputModeGetBaseLanguage();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "incrementAggdKeyForCategory:forAction:withLanguageID:", 0, v4, v6);

  v7 = (void *)MEMORY[0x1E0D87BF8];
  objc_msgSend(*(id *)(a1 + 40), "responseKitCategory");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "normalizedIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  TIInputModeGetBaseLanguage();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "incrementAggdKeyForCategory:forAction:withLanguageID:", v8, v4, v10);

  objc_autoreleasePoolPop(v2);
}

void __TIStatisticsLogCandidateAcceptance_block_invoke_5(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v2 = (void *)MEMORY[0x1DF0A2708]();
  v3 = (void *)MEMORY[0x1E0D87BF8];
  v4 = *MEMORY[0x1E0D87C18];
  objc_msgSend(*(id *)(a1 + 32), "normalizedIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  TIInputModeGetBaseLanguage();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "incrementAggdKeyForCategory:forAction:withLanguageID:", 0, v4, v6);

  v7 = (void *)MEMORY[0x1E0D87BF8];
  objc_msgSend(*(id *)(a1 + 40), "responseKitCategory");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "normalizedIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  TIInputModeGetBaseLanguage();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "incrementAggdKeyForCategory:forAction:withLanguageID:", v8, v4, v10);

  objc_autoreleasePoolPop(v2);
}

@end
