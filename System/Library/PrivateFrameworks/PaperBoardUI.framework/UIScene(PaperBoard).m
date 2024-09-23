@implementation UIScene(PaperBoard)

- (uint64_t)pb_activeVariant
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "_FBSScene");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "settings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "pb_activeVariant");

  return v3;
}

- (uint64_t)pb_animationSuspended
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "_FBSScene");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "settings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "pb_animationSuspended");

  return v3;
}

- (void)pb_performUpdate:()PaperBoard
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  objc_msgSend(a1, "_FBSScene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __40__UIScene_PaperBoard__pb_performUpdate___block_invoke;
  v7[3] = &unk_1E6B95140;
  v7[4] = a1;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "updateClientSettingsWithTransitionBlock:", v7);

}

- (uint64_t)pb_significantEventsCounter
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "_FBSScene");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "settings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "pb_significantEventsCounter");

  return v3;
}

@end
