@implementation UISApplicationInitializationContext(SpringBoard)

+ (id)sb_embeddedDisplayDefaultContext
{
  void *v2;
  _BOOL8 v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0D01800], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "deviceClass") == 2;
  v4 = [a1 alloc];
  objc_msgSend(MEMORY[0x1E0DC5BB0], "sb_embeddedDisplayDefaultContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC5BA8], "sb_defaultContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithMainDisplayContext:launchDisplayContext:deviceContext:persistedSceneIdentifiers:supportAppSceneRequests:", v5, 0, v6, 0, v3);

  return v7;
}

+ (id)sb_embeddedDisplayDefaultContextForSystemUIScenes
{
  id v1;
  void *v2;
  void *v3;
  void *v4;

  v1 = [a1 alloc];
  objc_msgSend(MEMORY[0x1E0DC5BB0], "sb_mainThreadFree_embeddedDisplayDefaultContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC5BA8], "sb_defaultContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v1, "initWithMainDisplayContext:launchDisplayContext:deviceContext:persistedSceneIdentifiers:supportAppSceneRequests:", v2, 0, v3, 0, 1);

  return v4;
}

@end
