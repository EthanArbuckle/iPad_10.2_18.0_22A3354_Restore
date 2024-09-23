@implementation _UISceneSnapshotBSActionsHandler

- (id)_respondToActions:(id)a3 forFBSScene:(id)a4 inUIScene:(id)a5 fromTransitionContext:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  BOOL v14;
  BOOL v15;
  id v16;
  void *v17;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t);
  void *v22;
  id v23;
  id v24;
  id v25;
  BOOL v26;
  BOOL v27;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_msgSend(v9, "objectsPassingTest:", &__block_literal_global_688);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "count") && objc_msgSend(v11, "_hostsWindows"))
  {
    v13 = v11;
    v14 = -[_UISceneSnapshotBSActionsHandler wantsOwnAssertion](self, "wantsOwnAssertion");
    v15 = -[_UISceneSnapshotBSActionsHandler wantsAsyncSnapshot](self, "wantsAsyncSnapshot");
    v19 = MEMORY[0x1E0C809B0];
    v20 = 3221225472;
    v21 = __98___UISceneSnapshotBSActionsHandler__respondToActions_forFBSScene_inUIScene_fromTransitionContext___block_invoke_2;
    v22 = &unk_1E16B2950;
    v26 = v14;
    v23 = v10;
    v24 = v13;
    v25 = v12;
    v27 = v15;
    v16 = v13;
    objc_msgSend(v16, "_enqueuePostSettingsUpdateResponseBlock:inPhase:", &v19, 0x1E16F0C40);

  }
  v17 = (void *)objc_msgSend(v9, "mutableCopy", v19, v20, v21, v22);
  objc_msgSend(v17, "minusSet:", v12);

  return v17;
}

- (BOOL)wantsOwnAssertion
{
  return 0;
}

- (BOOL)wantsAsyncSnapshot
{
  return 0;
}

@end
