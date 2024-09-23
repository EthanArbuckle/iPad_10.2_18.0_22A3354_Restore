@implementation PKIssuerProvisioningExtensionAuthorizationRemoteViewController

+ (BOOL)shouldPropagateAppearanceCustomizations
{
  return 0;
}

- (PKIssuerProvisioningExtensionAuthorizationRemoteViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  PKIssuerProvisioningExtensionAuthorizationRemoteViewController *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKIssuerProvisioningExtensionAuthorizationRemoteViewController;
  result = -[PKIssuerProvisioningExtensionAuthorizationRemoteViewController initWithNibName:bundle:](&v5, sel_initWithNibName_bundle_, a3, a4);
  if (result)
    result->_result = 0;
  return result;
}

- (void)dealloc
{
  id completionHandler;
  void *v4;
  id v5;
  objc_super v6;
  _QWORD block[4];
  id v8;

  completionHandler = self->_completionHandler;
  if (completionHandler)
  {
    v4 = _Block_copy(completionHandler);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __73__PKIssuerProvisioningExtensionAuthorizationRemoteViewController_dealloc__block_invoke;
    block[3] = &unk_1E3E61590;
    v8 = v4;
    v5 = v4;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
  v6.receiver = self;
  v6.super_class = (Class)PKIssuerProvisioningExtensionAuthorizationRemoteViewController;
  -[_UIRemoteViewController dealloc](&v6, sel_dealloc);
}

uint64_t __73__PKIssuerProvisioningExtensionAuthorizationRemoteViewController_dealloc__block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (BOOL)_isPresentationContextByDefault
{
  return 1;
}

- (void)viewServiceDidTerminateWithError:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKIssuerProvisioningExtensionAuthorizationRemoteViewController;
  -[_UIRemoteViewController viewServiceDidTerminateWithError:](&v4, sel_viewServiceDidTerminateWithError_, a3);
  -[PKIssuerProvisioningExtensionAuthorizationRemoteViewController pkui_finish](self, "pkui_finish");
}

- (void)serviceViewControllerDidCompleteWithResult:(int64_t)a3
{
  self->_result = a3;
  -[PKIssuerProvisioningExtensionAuthorizationRemoteViewController pkui_finish](self, "pkui_finish");
}

- (void)pkui_finish
{
  void (**completionHandler)(id, BOOL);
  id v4;

  if (!self->_finished)
  {
    self->_finished = 1;
    completionHandler = (void (**)(id, BOOL))self->_completionHandler;
    if (completionHandler)
    {
      completionHandler[2](completionHandler, self->_result == 1);
      v4 = self->_completionHandler;
      self->_completionHandler = 0;

    }
  }
}

- (void)pkui_setCompletionHandler:(id)a3
{
  void (**v4)(id, _QWORD);
  void (**completionHandler)(id, _QWORD);
  void *v6;
  id v7;
  void (**v8)(id, _QWORD);

  v4 = (void (**)(id, _QWORD))a3;
  completionHandler = (void (**)(id, _QWORD))self->_completionHandler;
  if (completionHandler != v4)
  {
    if (!self->_finished)
    {
      v8 = v4;
      if (completionHandler)
      {
        completionHandler[2](completionHandler, 0);
        v4 = v8;
      }
      v6 = _Block_copy(v4);
      v7 = self->_completionHandler;
      self->_completionHandler = v6;

      goto LABEL_8;
    }
    if (v4)
    {
      v8 = v4;
      ((void (**)(id, BOOL))v4)[2](v4, self->_result == 1);
LABEL_8:
      v4 = v8;
    }
  }

}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
}

@end
