@implementation ExtensionItem

+ (id)itemWithExtension:(id)a3 activationStyle:(int64_t)a4
{
  id v6;
  _QWORD *v7;
  void *v8;

  v6 = a3;
  v7 = objc_alloc_init((Class)a1);
  v8 = (void *)v7[1];
  v7[1] = v6;

  v7[4] = a4;
  return v7;
}

- (void)dealloc
{
  objc_super v3;

  -[ExtensionItem invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)ExtensionItem;
  -[ExtensionItem dealloc](&v3, sel_dealloc);
}

- (id)name
{
  void *v3;
  uint64_t v4;

  -[_EXExtensionIdentity localizedName](self->_extension, "localizedName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[ExtensionItem wasEverActivated](self, "wasEverActivated"))
  {
    objc_msgSend(v3, "stringByAppendingString:", CFSTR(" 🟢"));
    v4 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v4;
  }
  return v3;
}

- (id)activate
{
  PRSceneViewController *viewController;
  int64_t activationStyle;
  id *v5;
  PRSceneViewController *v6;
  objc_class *v7;
  id v8;
  uint64_t v9;
  BSInvalidatable *v10;
  BSInvalidatable *tmpPoster;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _EXExtensionIdentity *extension;
  void *v21;
  void *v22;
  PRSceneViewController *v23;
  PRSceneViewController *v24;

  if (MEMORY[0x1D17A3148]("-[ExtensionItem activate]", a2))
  {
    viewController = self->_viewController;
    if (viewController)
    {
LABEL_13:
      v6 = viewController;
      return v6;
    }
    activationStyle = self->_activationStyle;
    if (activationStyle)
    {
      if (activationStyle != 1)
      {
        v7 = 0;
        v8 = 0;
        goto LABEL_10;
      }
      v5 = (id *)MEMORY[0x1E0D7FD90];
    }
    else
    {
      v5 = (id *)MEMORY[0x1E0D7FD98];
    }
    v7 = (objc_class *)(id)objc_opt_self();
    v8 = *v5;
LABEL_10:
    v9 = *MEMORY[0x1E0D7FC58];
    objc_msgSend(MEMORY[0x1E0D7F8D0], "temporaryPathForRole:", *MEMORY[0x1E0D7FC58]);
    v10 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
    tmpPoster = self->_tmpPoster;
    self->_tmpPoster = v10;

    v12 = (void *)MEMORY[0x1E0D7F8E0];
    -[_EXExtensionIdentity bundleIdentifier](self->_extension, "bundleIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "configurationIdentityWithProvider:identifier:role:posterUUID:version:supplement:", v13, 0, v9, v14, 1, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = (void *)MEMORY[0x1E0D7F8E8];
    -[BSInvalidatable contentsURL](self->_tmpPoster, "contentsURL");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "pathWithContainerURL:identity:", v17, v15);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v18, "ensureContentsURLIsReachableAndReturnError:", 0);
    v19 = (void *)MEMORY[0x1E0D7F8C0];
    extension = self->_extension;
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "extensionInstanceForIdentity:instanceIdentifier:", extension, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v23 = (PRSceneViewController *)objc_msgSend([v7 alloc], "initWithProvider:contents:", v22, v18);
    v24 = self->_viewController;
    self->_viewController = v23;

    if (self->_activationStyle == 1)
      -[PRSceneViewController setModalPresentationStyle:](self->_viewController, "setModalPresentationStyle:", 0);

    viewController = self->_viewController;
    goto LABEL_13;
  }
  v6 = 0;
  return v6;
}

- (void)deactivate
{
  -[PRSceneViewController removeFromParentViewController](self->_viewController, "removeFromParentViewController");
}

- (void)invalidate
{
  PRSceneViewController *viewController;
  BSInvalidatable *tmpPoster;

  -[ExtensionItem deactivate](self, "deactivate");
  -[PRSceneViewController invalidate](self->_viewController, "invalidate");
  viewController = self->_viewController;
  self->_viewController = 0;

  -[BSInvalidatable invalidate](self->_tmpPoster, "invalidate");
  tmpPoster = self->_tmpPoster;
  self->_tmpPoster = 0;

}

- (BOOL)wasEverActivated
{
  return self->_viewController != 0;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[_EXExtensionIdentity uniqueIdentifier](self->_extension, "uniqueIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  _EXExtensionIdentity *extension;
  _QWORD *v4;
  void *v5;
  void *v6;
  void *v7;

  extension = self->_extension;
  v4 = a3;
  -[_EXExtensionIdentity uniqueIdentifier](extension, "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)v4[1];

  objc_msgSend(v6, "uniqueIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v6) = objc_msgSend(v5, "isEqual:", v7);

  return (char)v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tmpPoster, 0);
  objc_storeStrong((id *)&self->_viewController, 0);
  objc_storeStrong((id *)&self->_extension, 0);
}

@end
