@implementation ICQRemotePresentationManager

- (ICQRemotePresentationManager)initWithRemoteContext:(id)a3
{
  id v5;
  ICQRemotePresentationManager *v6;
  ICQRemotePresentationManager *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICQRemotePresentationManager;
  v6 = -[ICQRemotePresentationManager init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_remoteContext, a3);

  return v7;
}

- (void)presentHiddenFreshmintFlowWithEndpoint:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  uint8_t v11[16];

  v4 = a3;
  _ICQGetLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_1CDEBD000, v5, OS_LOG_TYPE_DEFAULT, "Presenting freshmint flow with SB Remote Alert.", v11, 2u);
  }

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DAAF78]), "initWithServiceName:viewControllerClassName:", CFSTR("com.apple.RemoteiCloudQuotaUI"), CFSTR("ICQRemoteViewController"));
  v7 = objc_alloc_init(MEMORY[0x1E0DAAF70]);
  -[ICQRemoteContext toDictionary](self->_remoteContext, "toDictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setUserInfo:", v8);

  objc_msgSend(v7, "setXpcEndpoint:", v4);
  v9 = (void *)objc_msgSend(MEMORY[0x1E0DAAF88], "newHandleWithDefinition:configurationContext:", v6, v7);
  objc_msgSend(v9, "registerObserver:", self);
  v10 = objc_alloc_init(MEMORY[0x1E0DAAF58]);
  objc_msgSend(v9, "activateWithContext:", v10);

}

- (void)remoteAlertHandle:(id)a3 didInvalidateWithError:(id)a4
{
  id v5;
  NSObject *v6;
  void (**presentationWasInvalidated)(id, id);
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  _ICQGetLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412290;
    v9 = v5;
    _os_log_impl(&dword_1CDEBD000, v6, OS_LOG_TYPE_DEFAULT, "Remote alert was invalidated with error: %@", (uint8_t *)&v8, 0xCu);
  }

  presentationWasInvalidated = (void (**)(id, id))self->_presentationWasInvalidated;
  if (presentationWasInvalidated)
    presentationWasInvalidated[2](presentationWasInvalidated, v5);

}

- (ICQRemoteContext)remoteContext
{
  return self->_remoteContext;
}

- (id)presentationWasInvalidated
{
  return self->_presentationWasInvalidated;
}

- (void)setPresentationWasInvalidated:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_presentationWasInvalidated, 0);
  objc_storeStrong((id *)&self->_remoteContext, 0);
}

@end
