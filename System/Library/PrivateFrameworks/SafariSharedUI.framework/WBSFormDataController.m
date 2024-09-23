@implementation WBSFormDataController

void __120__WBSFormDataController_SafariSharedUIExtras__bestUsernameSuggestionForUsernamePromptOnURL_inContext_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD block[4];
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __120__WBSFormDataController_SafariSharedUIExtras__bestUsernameSuggestionForUsernamePromptOnURL_inContext_completionHandler___block_invoke_2;
  block[3] = &unk_1E5443638;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v8 = v3;
  v9 = v4;
  v10 = v5;
  v11 = *(id *)(a1 + 48);
  v12 = *(id *)(a1 + 56);
  v6 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __120__WBSFormDataController_SafariSharedUIExtras__bestUsernameSuggestionForUsernamePromptOnURL_inContext_completionHandler___block_invoke_2(uint64_t a1)
{
  id v2;

  if (objc_msgSend(*(id *)(a1 + 32), "state"))
    objc_msgSend(*(id *)(a1 + 40), "lastUsedUsernameWithPasswordForURL:inContext:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  else
    objc_msgSend(*(id *)(a1 + 32), "privateEmailAddress");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();

}

@end
