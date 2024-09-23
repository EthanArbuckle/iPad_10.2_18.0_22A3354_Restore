@implementation _UIWindowSceneActivationPrewarmAction

+ (id)actionWithMorphContainer:(id)a3 alphaSource:(id)a4 sourceIdentifier:(id)a5 interactionIdentifier:(id)a6 requestCenterSlot:(BOOL)a7 requestFullscreen:(BOOL)a8 responseHandler:(id)a9
{
  _BOOL8 v9;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t RenderId;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  _BOOL4 v38;

  v38 = a8;
  v9 = a7;
  v14 = a9;
  v15 = a6;
  v16 = a5;
  v17 = a4;
  v18 = a3;
  v19 = (void *)objc_opt_new();
  objc_msgSend(v18, "layer");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "context");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "contextId");

  objc_msgSend(v18, "layer");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  RenderId = CALayerGetRenderId();
  objc_msgSend(v17, "layer");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = CALayerGetRenderId();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v22);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setObject:forSetting:", v27, 1);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", RenderId);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setObject:forSetting:", v28, 2);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v26);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setObject:forSetting:", v29, 3);

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "bundleIdentifier");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setObject:forSetting:", v31, 4);

  objc_msgSend(v19, "setObject:forSetting:", v16, 5);
  objc_msgSend(v19, "setObject:forSetting:", v15, 6);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v9);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setObject:forSetting:", v32, 7);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v38);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setObject:forSetting:", v33, 8);

  v34 = objc_alloc((Class)a1);
  objc_msgSend(MEMORY[0x1E0D016A0], "responderWithHandler:", v14);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  v36 = (void *)objc_msgSend(v34, "initWithInfo:responder:", v19, v35);
  return v36;
}

- (unsigned)sourceLayerContextId
{
  void *v2;
  void *v3;
  unsigned int v4;

  -[_UIWindowSceneActivationPrewarmAction info](self, "info");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "unsignedIntValue");

  return v4;
}

- (unint64_t)morphContainerRenderId
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[_UIWindowSceneActivationPrewarmAction info](self, "info");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "unsignedLongLongValue");

  return v4;
}

- (unint64_t)deparentingPortalAlphaSourceLayerRenderId
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[_UIWindowSceneActivationPrewarmAction info](self, "info");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "unsignedLongLongValue");

  return v4;
}

- (NSString)sourceAppBundleIdentifier
{
  void *v2;
  void *v3;

  -[_UIWindowSceneActivationPrewarmAction info](self, "info");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)sourceSceneIdentifier
{
  void *v2;
  void *v3;

  -[_UIWindowSceneActivationPrewarmAction info](self, "info");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)interactionIdentifier
{
  void *v2;
  void *v3;

  -[_UIWindowSceneActivationPrewarmAction info](self, "info");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (BOOL)requestCenterSlot
{
  void *v2;
  void *v3;
  char v4;

  -[_UIWindowSceneActivationPrewarmAction info](self, "info");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 7);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (BOOL)requestFullscreen
{
  void *v2;
  void *v3;
  char v4;

  -[_UIWindowSceneActivationPrewarmAction info](self, "info");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (int64_t)UIActionType
{
  return 40;
}

@end
