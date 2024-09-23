@implementation SBSUIRemoteAlertSceneClientComponent

- (void)scene:(id)a3 didUpdateClientSettings:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v5 = a4;
  objc_msgSend(v5, "transitionContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "remoteAlertActivationContext");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "transitionContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "remoteAlertConfigurationContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    -[SBSUIRemoteAlertSceneClientComponent setActivationContext:](self, "setActivationContext:", v9);
  if (v8)
    -[SBSUIRemoteAlertSceneClientComponent setConfigurationContext:](self, "setConfigurationContext:", v8);

}

- (SBSRemoteAlertConfigurationContext)configurationContext
{
  return (SBSRemoteAlertConfigurationContext *)objc_getProperty(self, a2, 24, 1);
}

- (void)setConfigurationContext:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (SBSRemoteAlertActivationContext)activationContext
{
  return (SBSRemoteAlertActivationContext *)objc_getProperty(self, a2, 32, 1);
}

- (void)setActivationContext:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activationContext, 0);
  objc_storeStrong((id *)&self->_configurationContext, 0);
}

@end
