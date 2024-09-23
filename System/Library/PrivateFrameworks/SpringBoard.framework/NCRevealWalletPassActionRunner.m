@implementation NCRevealWalletPassActionRunner

- (id)initWithCardItem:(id *)a1
{
  id v4;
  id *v5;
  objc_super v7;

  v4 = a2;
  if (a1)
  {
    v7.receiver = a1;
    v7.super_class = (Class)NCRevealWalletPassActionRunner;
    v5 = (id *)objc_msgSendSuper2(&v7, sel_init);
    a1 = v5;
    if (v5)
      objc_storeStrong(v5 + 2, a2);
  }

  return a1;
}

- (void)executeAction:(id)a3 fromOrigin:(id)a4 endpoint:(id)a5 withParameters:(id)a6 completion:(id)a7
{
  SBSCardItem *cardItem;
  SBSCardItem *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char *newValue;

  newValue = (char *)a7;
  if (self)
    cardItem = self->_cardItem;
  else
    cardItem = 0;
  v9 = cardItem;
  -[SBSCardItem userInfo](v9, "userInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x1E0DAC230];
  -[SBSCardItem bundleName](v9, "bundleName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "contextWithName:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "setUserInfo:", v10);
  objc_msgSend(v13, "setObserver:", self);
  if (self && newValue)
    objc_setProperty_nonatomic_copy(self, newValue, newValue, 24);
  +[SBLockScreenManager sharedInstance](SBLockScreenManager, "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "lockScreenEnvironment");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "pluginPresenter");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "enableLockScreenPluginWithContext:", v13);

}

- (void)setPluginCompletionBlock:(void *)a1
{
  if (a1)
    objc_setProperty_nonatomic_copy(a1, newValue, newValue, 24);
}

- (void)didPresentLockScreenPlugin:(id)a3
{
  SEL v4;

  if (self)
  {
    if (self->_pluginCompletionBlock)
    {
      (*((void (**)(void))self->_pluginCompletionBlock + 2))();
      objc_setProperty_nonatomic_copy(self, v4, 0, 24);
    }
  }
}

- (BOOL)shouldForwardAction
{
  return self->_shouldForwardAction;
}

- (void)setShouldForwardAction:(BOOL)a3
{
  self->_shouldForwardAction = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_pluginCompletionBlock, 0);
  objc_storeStrong((id *)&self->_cardItem, 0);
}

@end
