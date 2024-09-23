@implementation UIWindowSceneSendShortcutItemCallbackForWindowScene

void ___UIWindowSceneSendShortcutItemCallbackForWindowScene_block_invoke(uint64_t a1, int a2)
{
  void *v3;
  _QWORD v4[4];
  id v5;
  char v6;

  if (a2)
  {
    v3 = (void *)UIApp;
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = ___UIWindowSceneSendShortcutItemCallbackForWindowScene_block_invoke_2;
    v4[3] = &unk_1E16B1B78;
    v6 = *(_BYTE *)(a1 + 48);
    v5 = *(id *)(a1 + 32);
    objc_msgSend(v3, "_updateStateRestorationArchiveForBackgroundEvent:saveState:exitIfCouldNotRestoreState:updateSnapshot:windowScene:", v4, 1, 1, 1, *(_QWORD *)(a1 + 40));

  }
}

void ___UIWindowSceneSendShortcutItemCallbackForWindowScene_block_invoke_2(uint64_t a1)
{
  id v1;

  if (*(_BYTE *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "anyObject");
    v1 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v1, "canSendResponse"))
      objc_msgSend(v1, "sendResponse:", 0);

  }
}

void ___UIWindowSceneSendShortcutItemCallbackForWindowScene_block_invoke_3(uint64_t a1, int a2)
{
  void *v3;
  _QWORD v4[4];
  id v5;
  char v6;

  if (a2)
  {
    v3 = (void *)UIApp;
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = ___UIWindowSceneSendShortcutItemCallbackForWindowScene_block_invoke_4;
    v4[3] = &unk_1E16B1B78;
    v6 = *(_BYTE *)(a1 + 48);
    v5 = *(id *)(a1 + 32);
    objc_msgSend(v3, "_updateStateRestorationArchiveForBackgroundEvent:saveState:exitIfCouldNotRestoreState:updateSnapshot:windowScene:", v4, 1, 1, 1, *(_QWORD *)(a1 + 40));

  }
}

void ___UIWindowSceneSendShortcutItemCallbackForWindowScene_block_invoke_4(uint64_t a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (*(_BYTE *)(a1 + 40))
  {
    v9 = 0u;
    v10 = 0u;
    v7 = 0u;
    v8 = 0u;
    v1 = *(id *)(a1 + 32);
    v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    if (v2)
    {
      v3 = v2;
      v4 = *(_QWORD *)v8;
      do
      {
        for (i = 0; i != v3; ++i)
        {
          if (*(_QWORD *)v8 != v4)
            objc_enumerationMutation(v1);
          v6 = *(void **)(*((_QWORD *)&v7 + 1) + 8 * i);
          if (objc_msgSend(v6, "canSendResponse", (_QWORD)v7))
            objc_msgSend(v6, "sendResponse:", 0);
        }
        v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      }
      while (v3);
    }

  }
}

@end
