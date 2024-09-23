@implementation LNDeferredLocalizedString(Workflow)

- (void)wf_getLocalizedStringWithCompletionHandler:()Workflow
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  v5 = objc_alloc(MEMORY[0x1E0D43BF0]);
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localeIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v5, "initWithPrintedString:spokenString:localeIdentifier:", a1, 0, v7);

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __82__LNDeferredLocalizedString_Workflow__wf_getLocalizedStringWithCompletionHandler___block_invoke;
  v10[3] = &unk_1E7AF3900;
  v11 = v4;
  v9 = v4;
  objc_msgSend(v8, "getResultWithCompletionHandler:", v10);

}

@end
