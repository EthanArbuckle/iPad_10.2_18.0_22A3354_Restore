@implementation SBSApplicationShortcutService

uint64_t __112__SBSApplicationShortcutService_fetchApplicationShortcutItemsOfTypes_forBundleIdentifier_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (id)applicationShortcutItemsOfTypes:(unint64_t)a3 forBundleIdentifier:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  -[SBSAbstractApplicationService client](self, "client");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "applicationShortcutItemsOfTypes:forBundleIdentifier:", a3, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)fetchApplicationShortcutItemsOfTypes:(unint64_t)a3 forBundleIdentifier:(id)a4 withCompletionHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;

  v8 = a5;
  if (v8)
  {
    v9 = a4;
    -[SBSAbstractFacilityService callbackQueue](self, "callbackQueue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBSAbstractApplicationService client](self, "client");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __112__SBSApplicationShortcutService_fetchApplicationShortcutItemsOfTypes_forBundleIdentifier_withCompletionHandler___block_invoke;
    v13[3] = &unk_1E288EFF8;
    v14 = v10;
    v15 = v8;
    v12 = v10;
    objc_msgSend(v11, "fetchApplicationShortcutItemsOfTypes:forBundleIdentifier:withCompletionHandler:", a3, v9, v13);

  }
}

- (void)updateDynamicApplicationShortcutItems:(id)a3 forBundleIdentifier:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[SBSAbstractApplicationService client](self, "client");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "updateDynamicApplicationShortcutItems:bundleIdentifier:", v7, v6);

}

void __112__SBSApplicationShortcutService_fetchApplicationShortcutItemsOfTypes_forBundleIdentifier_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __112__SBSApplicationShortcutService_fetchApplicationShortcutItemsOfTypes_forBundleIdentifier_withCompletionHandler___block_invoke_2;
  v7[3] = &unk_1E288D2E8;
  v4 = *(NSObject **)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  dispatch_async(v4, v7);

}

- (void)fetchDynamicApplicationShortcutItemsWithCompletionHandler:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __91__SBSApplicationShortcutService_fetchDynamicApplicationShortcutItemsWithCompletionHandler___block_invoke;
  v6[3] = &unk_1E288F020;
  v7 = v4;
  v5 = v4;
  -[SBSApplicationShortcutService fetchApplicationShortcutItemsOfTypes:forBundleIdentifier:withCompletionHandler:](self, "fetchApplicationShortcutItemsOfTypes:forBundleIdentifier:withCompletionHandler:", 2, 0, v6);

}

void __91__SBSApplicationShortcutService_fetchDynamicApplicationShortcutItemsWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(a2, "dynamicApplicationShortcutItems");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

}

- (void)updateDynamicApplicationShortcutItems:(id)a3
{
  -[SBSApplicationShortcutService updateDynamicApplicationShortcutItems:bundleIdentifier:](self, "updateDynamicApplicationShortcutItems:bundleIdentifier:", a3, 0);
}

- (void)fetchDynamicApplicationShortcutItemsForBundleIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __107__SBSApplicationShortcutService_fetchDynamicApplicationShortcutItemsForBundleIdentifier_completionHandler___block_invoke;
  v8[3] = &unk_1E288F020;
  v9 = v6;
  v7 = v6;
  -[SBSApplicationShortcutService fetchApplicationShortcutItemsOfTypes:forBundleIdentifier:withCompletionHandler:](self, "fetchApplicationShortcutItemsOfTypes:forBundleIdentifier:withCompletionHandler:", 2, a3, v8);

}

void __107__SBSApplicationShortcutService_fetchDynamicApplicationShortcutItemsForBundleIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(a2, "dynamicApplicationShortcutItems");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

}

@end
