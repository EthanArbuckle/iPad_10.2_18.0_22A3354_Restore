@implementation SBPrivacyPreflightController

- (BOOL)requiresPreflightForApplication:(id)a3
{
  return -[PDCPreflightManager requiresPreflightForApplication:](self->_privacyPreflightManager, "requiresPreflightForApplication:", a3);
}

- (SBPrivacyPreflightController)init
{
  SBPrivacyPreflightController *v2;
  id v3;
  uint64_t v4;
  PDCPreflightManager *privacyPreflightManager;
  NSMutableDictionary *v6;
  NSMutableDictionary *applicationPreflightControllers;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SBPrivacyPreflightController;
  v2 = -[SBPrivacyPreflightController init](&v9, sel_init);
  if (v2)
  {
    v3 = objc_alloc(MEMORY[0x1E0D80CC8]);
    v4 = objc_msgSend(v3, "initWithTargetQueue:", MEMORY[0x1E0C80D38]);
    privacyPreflightManager = v2->_privacyPreflightManager;
    v2->_privacyPreflightManager = (PDCPreflightManager *)v4;

    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    applicationPreflightControllers = v2->_applicationPreflightControllers;
    v2->_applicationPreflightControllers = v6;

  }
  return v2;
}

- (void)preflightLaunchForApplication:(id)a3 sceneIdentifier:(id)a4 withCompletionHandler:(id)a5
{
  id v9;
  id v10;
  id v11;
  id v12;
  SBApplicationPrivacyPreflightController *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v17;
  v12 = v10;
  if (v17)
  {
    if (v9)
      goto LABEL_3;
LABEL_8:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBPrivacyPreflightController.m"), 41, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sceneIdentifier"));

    v11 = v17;
    if (v12)
      goto LABEL_4;
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBPrivacyPreflightController.m"), 40, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("application"));

  v11 = 0;
  if (!v9)
    goto LABEL_8;
LABEL_3:
  if (v12)
    goto LABEL_4;
LABEL_9:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBPrivacyPreflightController.m"), 42, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler"));

  v11 = v17;
LABEL_4:
  -[NSMutableDictionary objectForKey:](self->_applicationPreflightControllers, "objectForKey:", v11);
  v13 = (SBApplicationPrivacyPreflightController *)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    v13 = -[SBApplicationPrivacyPreflightController initWithPreflightManager:applicationIdentity:]([SBApplicationPrivacyPreflightController alloc], "initWithPreflightManager:applicationIdentity:", self->_privacyPreflightManager, v17);
    -[NSMutableDictionary setObject:forKey:](self->_applicationPreflightControllers, "setObject:forKey:", v13, v17);
  }
  -[SBApplicationPrivacyPreflightController addPendingCompletion:forSceneIdentifier:](v13, "addPendingCompletion:forSceneIdentifier:", v12, v9);

}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0D01750], "descriptionForRootObject:", self);
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v3;

  v3 = (id)objc_msgSend(a3, "appendObject:withName:", self->_applicationPreflightControllers, CFSTR("applicationPreflightControllers"));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applicationPreflightControllers, 0);
  objc_storeStrong((id *)&self->_privacyPreflightManager, 0);
}

@end
