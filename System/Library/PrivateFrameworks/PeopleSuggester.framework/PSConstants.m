@implementation PSConstants

void __41___PSConstants_eligibleShareSheetTargets__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v2 = (void *)MEMORY[0x1A1AFCA24]();
  v3 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(*(id *)(a1 + 32), "mobileMailBundleId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "mobileMessagesBundleId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithObjects:", v4, v5, 0);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)eligibleShareSheetTargets__pasExprOnceResult;
  eligibleShareSheetTargets__pasExprOnceResult = v6;

  objc_autoreleasePoolPop(v2);
}

void __33___PSConstants_messagesBundleIds__block_invoke()
{
  void *v0;
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;

  v0 = (void *)MEMORY[0x1A1AFCA24]();
  v1 = objc_alloc(MEMORY[0x1E0C99E60]);
  +[_PSConstants mobileMessagesBundleId](_PSConstants, "mobileMessagesBundleId");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[_PSConstants shareSheetTargetBundleIdMessages](_PSConstants, "shareSheetTargetBundleIdMessages");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v1, "initWithObjects:", v2, v3, 0);
  v5 = (void *)messagesBundleIds__pasExprOnceResult;
  messagesBundleIds__pasExprOnceResult = v4;

  objc_autoreleasePoolPop(v0);
}

void __29___PSConstants_mailBundleIds__block_invoke()
{
  void *v0;
  id v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v0 = (void *)MEMORY[0x1A1AFCA24]();
  v1 = objc_alloc(MEMORY[0x1E0C99E60]);
  +[_PSConstants mobileMailBundleId](_PSConstants, "mobileMailBundleId");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[_PSConstants shareSheetTargetBundleIdMail](_PSConstants, "shareSheetTargetBundleIdMail");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[_PSConstants macMailBundleId](_PSConstants, "macMailBundleId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v1, "initWithObjects:", v2, v3, v4, 0);
  v6 = (void *)mailBundleIds__pasExprOnceResult;
  mailBundleIds__pasExprOnceResult = v5;

  objc_autoreleasePoolPop(v0);
}

void __34___PSConstants_shareplayBundleIds__block_invoke()
{
  void *v0;
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;

  v0 = (void *)MEMORY[0x1A1AFCA24]();
  v1 = objc_alloc(MEMORY[0x1E0C99E60]);
  +[_PSConstants sharePlayBundleId](_PSConstants, "sharePlayBundleId");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[_PSConstants collaborationSuggestionBundleId](_PSConstants, "collaborationSuggestionBundleId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v1, "initWithObjects:", v2, v3, 0);
  v5 = (void *)shareplayBundleIds__pasExprOnceResult;
  shareplayBundleIds__pasExprOnceResult = v4;

  objc_autoreleasePoolPop(v0);
}

void __31___PSConstants_systemBundleIds__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  +[_PSConstants messagesBundleIds](_PSConstants, "messagesBundleIds");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  +[_PSConstants mailBundleIds](_PSConstants, "mailBundleIds");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  +[_PSConstants shareplayBundleIds](_PSConstants, "shareplayBundleIds");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "unionSet:", v0);
  objc_msgSend(v2, "unionSet:", v5);
  objc_msgSend(v2, "unionSet:", v1);
  v3 = objc_msgSend(v2, "copy");
  v4 = (void *)systemBundleIds_systemBundleIds;
  systemBundleIds_systemBundleIds = v3;

}

@end
