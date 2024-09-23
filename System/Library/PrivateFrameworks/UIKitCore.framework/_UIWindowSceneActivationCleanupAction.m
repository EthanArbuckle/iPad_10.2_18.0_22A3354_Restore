@implementation _UIWindowSceneActivationCleanupAction

+ (id)actionWithInteractionIdentifier:(id)a3 responseHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_opt_new();
  objc_msgSend(v8, "setObject:forSetting:", v7, 1);

  v9 = objc_alloc((Class)a1);
  objc_msgSend(MEMORY[0x1E0D016A0], "responderWithHandler:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)objc_msgSend(v9, "initWithInfo:responder:", v8, v10);
  return v11;
}

- (NSString)interactionIdentifier
{
  void *v2;
  void *v3;

  -[_UIWindowSceneActivationCleanupAction info](self, "info");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (int64_t)UIActionType
{
  return 41;
}

@end
