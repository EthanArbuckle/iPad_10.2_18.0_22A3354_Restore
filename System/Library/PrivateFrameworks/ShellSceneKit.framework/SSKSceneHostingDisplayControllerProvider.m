@implementation SSKSceneHostingDisplayControllerProvider

- (SSKSceneHostingDisplayControllerProvider)initWithProfileConfiguration:(id)a3
{
  id v6;
  SSKSceneHostingDisplayControllerProvider *v7;
  SSKSceneHostingDisplayControllerProvider *v8;
  void *v10;
  objc_super v11;

  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SSKSceneHostingDisplayControllerProvider.m"), 30, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[profileConfigurationBox isKindOfClass:[SSKDisplayProfileConfiguration class]]"));

  }
  v11.receiver = self;
  v11.super_class = (Class)SSKSceneHostingDisplayControllerProvider;
  v7 = -[SSKSceneHostingDisplayControllerProvider init](&v11, sel_init);
  v8 = v7;
  if (v7)
    objc_storeStrong((id *)&v7->_profileConfigurationBox, a3);

  return v8;
}

- (id)displayControllerForDisplay:(id)a3 configuration:(id)a4
{
  id v5;
  SSKSceneHostingDisplayController *v6;

  v5 = a3;
  v6 = -[SSKSceneHostingDisplayController initWithProfileConfiguration:displayIdentity:]([SSKSceneHostingDisplayController alloc], "initWithProfileConfiguration:displayIdentity:", self->_profileConfigurationBox, v5);

  -[SSKSceneHostingDisplayController setDelegate:](v6, "setDelegate:", self);
  return v6;
}

- (id)controller:(id)a3 rootSceneWindowForDisplayConfiguration:(id)a4
{
  SSKSceneHostingDisplayControllerProviderDelegate **p_delegate;
  id v6;
  id WeakRetained;
  void *v8;

  p_delegate = &self->_delegate;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "provider:rootSceneWindowForDisplayConfiguration:", self, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)controller:(id)a3 modifyInitialSceneParameters:(id)a4
{
  SSKSceneHostingDisplayControllerProviderDelegate **p_delegate;
  id v6;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "provider:modifyInitialSceneParameters:", self, v6);

}

- (unint64_t)hash
{
  void *v3;
  id v4;
  unint64_t v5;

  objc_msgSend(MEMORY[0x24BE0BE28], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendObject:", self->_profileConfigurationBox);
  v5 = objc_msgSend(v3, "hash");

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  SSKDisplayProfileConfiguration *profileConfigurationBox;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BE0BE20], "builderWithObject:ofExpectedClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  profileConfigurationBox = self->_profileConfigurationBox;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __52__SSKSceneHostingDisplayControllerProvider_isEqual___block_invoke;
  v10[3] = &unk_25171C230;
  v11 = v4;
  v7 = v4;
  v8 = (id)objc_msgSend(v5, "appendObject:counterpart:", profileConfigurationBox, v10);
  LOBYTE(profileConfigurationBox) = objc_msgSend(v5, "isEqual");

  return (char)profileConfigurationBox;
}

id __52__SSKSceneHostingDisplayControllerProvider_isEqual___block_invoke(uint64_t a1)
{
  return *(id *)(*(_QWORD *)(a1 + 32) + 8);
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x24BE0BE10], "descriptionForRootObject:", self);
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v3;

  v3 = (id)objc_msgSend(a3, "appendObject:withName:", self->_profileConfigurationBox, CFSTR("profileConfiguration"));
}

- (SSKSceneHostingDisplayControllerProviderDelegate)delegate
{
  return (SSKSceneHostingDisplayControllerProviderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_profileConfigurationBox, 0);
}

@end
