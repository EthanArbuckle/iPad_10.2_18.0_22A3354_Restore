@implementation PKRemoteAddPaymentPassViewController

+ (BOOL)shouldPropagateAppearanceCustomizations
{
  return 0;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)PKRemoteAddPaymentPassViewController;
  -[_UIRemoteViewController dealloc](&v2, sel_dealloc);
}

- (void)viewServiceDidTerminateWithError:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v8 = *MEMORY[0x1E0CB3388];
    v9[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D6A758], 2, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKRemoteAddPaymentPassViewController didFinishWithPass:error:](self, "didFinishWithPass:error:", 0, v7);

}

- (void)didFinishWithPass:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  if (!self->_finished)
  {
    self->_finished = 1;
    v6 = a4;
    v7 = a3;
    -[PKRemoteAddPaymentPassViewController delegate](self, "delegate");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    -[PKRemoteAddPaymentPassViewController _addPaymentPassVC](self, "_addPaymentPassVC");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addPaymentPassViewController:didFinishAddingPaymentPass:error:", v8, v7, v6);

  }
}

- (void)generateRequestWithCertificateChain:(id)a3 nonce:(id)a4 nonceSignature:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  void (**v12)(id, _QWORD);
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  v10 = a4;
  v11 = a5;
  v12 = (void (**)(id, _QWORD))a6;
  -[PKRemoteAddPaymentPassViewController delegate](self, "delegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    -[PKRemoteAddPaymentPassViewController _addPaymentPassVC](self, "_addPaymentPassVC");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addPaymentPassViewController:generateRequestWithCertificateChain:nonce:nonceSignature:completionHandler:", v14, v15, v10, v11, v12);

  }
  else if (v12)
  {
    v12[2](v12, 0);
  }

}

- (PKAddPaymentPassViewControllerDelegate)delegate
{
  return (PKAddPaymentPassViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
