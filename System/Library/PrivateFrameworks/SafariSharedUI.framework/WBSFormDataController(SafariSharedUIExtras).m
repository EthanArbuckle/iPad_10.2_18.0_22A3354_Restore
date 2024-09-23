@implementation WBSFormDataController(SafariSharedUIExtras)

- (void)bestUsernameSuggestionForUsernamePromptOnURL:()SafariSharedUIExtras inContext:completionHandler:
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  +[WBSHideMyEmailManager sharedManager](WBSHideMyEmailManager, "sharedManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __120__WBSFormDataController_SafariSharedUIExtras__bestUsernameSuggestionForUsernamePromptOnURL_inContext_completionHandler___block_invoke;
  v15[3] = &unk_1E5443660;
  v15[4] = a1;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  objc_msgSend(v11, "getRecordForURL:completionHandler:", v14, v15);

}

@end
