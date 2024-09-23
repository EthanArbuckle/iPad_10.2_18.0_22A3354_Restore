@implementation WBSPrivateBrowsingUserDefinedContentBlockerManager(ScribbleUtilities)

- (void)getAllPaintingAvoidanceSelectorsThatApplyToHost:()ScribbleUtilities completionHandler:
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  id v11;
  NSObject *v12;
  void *v13;
  id v14;
  NSObject *v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  NSObject *v23;
  objc_super v24;
  _QWORD v25[4];
  id v26;
  NSObject *v27;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_opt_new();
  v9 = dispatch_group_create();
  dispatch_group_enter(v9);
  v10 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __139__WBSPrivateBrowsingUserDefinedContentBlockerManager_ScribbleUtilities__getAllPaintingAvoidanceSelectorsThatApplyToHost_completionHandler___block_invoke;
  v25[3] = &unk_1E54437C8;
  v11 = v8;
  v26 = v11;
  v12 = v9;
  v27 = v12;
  v24.receiver = a1;
  v24.super_class = (Class)&off_1EE9E3F28;
  objc_msgSendSuper2(&v24, sel_getAllPaintingAvoidanceSelectorsThatApplyToHost_completionHandler_, v7, v25);
  objc_msgSend(a1, "normalBrowsingUserDefinedContentBlockerManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  dispatch_group_enter(v12);
  v21[0] = v10;
  v21[1] = 3221225472;
  v21[2] = __139__WBSPrivateBrowsingUserDefinedContentBlockerManager_ScribbleUtilities__getAllPaintingAvoidanceSelectorsThatApplyToHost_completionHandler___block_invoke_2;
  v21[3] = &unk_1E54437C8;
  v14 = v11;
  v22 = v14;
  v23 = v12;
  v15 = v12;
  objc_msgSend(v13, "getAllPaintingAvoidanceSelectorsThatApplyToHost:completionHandler:", v7, v21);

  v18[0] = v10;
  v18[1] = 3221225472;
  v18[2] = __139__WBSPrivateBrowsingUserDefinedContentBlockerManager_ScribbleUtilities__getAllPaintingAvoidanceSelectorsThatApplyToHost_completionHandler___block_invoke_3;
  v18[3] = &unk_1E5443450;
  v19 = v14;
  v20 = v6;
  v16 = v14;
  v17 = v6;
  dispatch_group_notify(v15, MEMORY[0x1E0C80D38], v18);

}

- (void)clearAllEditsForContentBlocker:()ScribbleUtilities
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  objc_super v10;

  v10.receiver = a1;
  v10.super_class = (Class)&off_1EE9E3F28;
  v4 = a3;
  objc_msgSendSuper2(&v10, sel_clearAllEditsForContentBlocker_, v4);
  objc_msgSend(a1, "normalBrowsingUserDefinedContentBlockerManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "host");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __104__WBSPrivateBrowsingUserDefinedContentBlockerManager_ScribbleUtilities__clearAllEditsForContentBlocker___block_invoke;
  v8[3] = &unk_1E5444C60;
  v9 = v5;
  v7 = v5;
  objc_msgSend(v7, "contentBlockerForHost:createIfNeeded:completionHandler:", v6, 0, v8);

}

@end
