@implementation PKPeerPaymentMessageComposeController

- (PKPeerPaymentMessageComposeController)initWithMessage:(id)a3 recipientAddress:(id)a4
{
  id v7;
  id v8;
  PKPeerPaymentMessageComposeController *v9;
  PKPeerPaymentMessageComposeController *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PKPeerPaymentMessageComposeController;
  v9 = -[PKPeerPaymentMessageComposeController init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_message, a3);
    objc_storeStrong((id *)&v10->_recipientAddress, a4);
  }

  return v10;
}

- (void)presentMessageOverController:(id)a3 presentationHandler:(id)a4
{
  id v6;
  NSObject *v7;
  id v8;
  void *v9;
  id WeakRetained;
  id v11;
  _QWORD v12[4];
  id v13;
  uint8_t buf[16];
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_storeWeak((id *)&self->_currentHostController, a3);
  PKLogFacilityTypeGetObject();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19D178000, v7, OS_LOG_TYPE_DEFAULT, "Presenting PKPeerPaymentMessageComposeController.", buf, 2u);
  }

  v8 = objc_alloc_init(MEMORY[0x1E0CC68C8]);
  objc_msgSend(v8, "setMessageComposeDelegate:", self);
  objc_msgSend(v8, "setModalInPresentation:", 1);
  objc_msgSend(v8, "_setCanEditRecipients:", 0);
  v15[0] = self->_recipientAddress;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setRecipients:", v9);

  objc_msgSend(v8, "setMessage:", self->_message);
  WeakRetained = objc_loadWeakRetained((id *)&self->_currentHostController);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __90__PKPeerPaymentMessageComposeController_presentMessageOverController_presentationHandler___block_invoke;
  v12[3] = &unk_1E3E61590;
  v13 = v6;
  v11 = v6;
  objc_msgSend(WeakRetained, "presentViewController:animated:completion:", v8, 1, v12);

}

uint64_t __90__PKPeerPaymentMessageComposeController_presentMessageOverController_presentationHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  return result;
}

- (void)messageComposeViewController:(id)a3 didFinishWithResult:(int64_t)a4
{
  id v6;
  void (**completionHandler)(id, int64_t, _QWORD);
  id v8;

  v6 = a3;
  if ((unint64_t)a4 <= 2)
  {
    completionHandler = (void (**)(id, int64_t, _QWORD))self->_completionHandler;
    if (completionHandler)
    {
      v8 = v6;
      completionHandler[2](completionHandler, a4, 0);
      v6 = v8;
    }
  }

}

- (MSMessage)message
{
  return self->_message;
}

- (NSString)recipientAddress
{
  return self->_recipientAddress;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (UIViewController)currentHostController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_currentHostController);
}

- (void)setCurrentHostController:(id)a3
{
  objc_storeWeak((id *)&self->_currentHostController, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_currentHostController);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_recipientAddress, 0);
  objc_storeStrong((id *)&self->_message, 0);
}

@end
