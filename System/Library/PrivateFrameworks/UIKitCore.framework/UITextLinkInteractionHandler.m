@implementation UITextLinkInteractionHandler

uint64_t __64___UITextLinkInteractionHandler__defaultMenuForInteractableItem__block_invoke(uint64_t result, uint64_t a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "addObject:", a2);
  return result;
}

void __73___UITextLinkInteractionHandler__handlerRequiringUnlockedDevice_handler___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;

  v1 = (void *)UIApp;
  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __73___UITextLinkInteractionHandler__handlerRequiringUnlockedDevice_handler___block_invoke_2;
  v2[3] = &unk_1E16B2C38;
  v3 = *(id *)(a1 + 32);
  objc_msgSend(v1, "_requestDeviceUnlockWithCompletion:", v2);

}

uint64_t __73___UITextLinkInteractionHandler__handlerRequiringUnlockedDevice_handler___block_invoke_2(uint64_t result, int a2)
{
  if (a2)
    return (*(uint64_t (**)(void))(*(_QWORD *)(result + 32) + 16))();
  return result;
}

uint64_t __73___UITextLinkInteractionHandler__handlerRequiringUnlockedDevice_handler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __48___UITextLinkInteractionHandler__openURLAction___block_invoke(uint64_t a1)
{
  return objc_msgSend((id)UIApp, "_openURL:originatingView:completionHandler:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), 0);
}

void __49___UITextLinkInteractionHandler__copyLinkAction___block_invoke(uint64_t a1)
{
  id v2;

  +[UIPasteboard generalPasteboard](UIPasteboard, "generalPasteboard");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setString:", *(_QWORD *)(a1 + 32));

}

void __50___UITextLinkInteractionHandler__shareLinkAction___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;

  objc_msgSend(*(id *)(a1 + 32), "textContentView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "textLayoutController");
  v18 = (id)objc_claimAutoreleasedReturnValue();

  v3 = objc_msgSend(*(id *)(a1 + 32), "range");
  objc_msgSend(v18, "boundingRectForCharacterRange:", v3, v4);
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v13 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "textContentView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UITextServiceSessionContext sessionContextWithText:withRect:withView:](_UITextServiceSessionContext, "sessionContextWithText:withRect:withView:", v13, v14, v6, v8, v10, v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "textContentView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (id)objc_msgSend(v16, "_showServiceForType:withContext:", 8, v15);

}

void __68___UITextLinkInteractionHandler__openAppLinkInDefaultBrowserAction___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)UIApp;
  objc_msgSend(*(id *)(a1 + 32), "URL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 40);
  v6 = CFSTR("UIApplicationOpenURLOptionIgnoreUniversalLinks");
  v7[0] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_openURL:originatingView:options:completionHandler:", v3, v4, v5, 0);

}

void __73___UITextLinkInteractionHandler__openAppLinkInExternalApplicationAction___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)UIApp;
  objc_msgSend(*(id *)(a1 + 32), "URL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 40);
  v6 = CFSTR("UIApplicationOpenURLOptionIgnoreUniversalLinks");
  v7[0] = MEMORY[0x1E0C9AAA0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_openURL:originatingView:options:completionHandler:", v3, v4, v5, 0);

}

void __61___UITextLinkInteractionHandler__addLinkToReadingListAction___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(getSSReadingListClass(), "defaultReadingList");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addReadingListItemWithURL:title:previewText:error:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), 0, 0);

}

@end
