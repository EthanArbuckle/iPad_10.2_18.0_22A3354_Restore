@implementation PKVehicleConnectionSession

+ (void)sessionForPass:(PKSecureElementPass *)pass delegate:(id)delegate completion:(void *)completion
{
  PKSecureElementPass *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  PKSecureElementPass *v12;
  _QWORD v13[4];
  PKSecureElementPass *v14;
  id v15;
  id v16;

  v7 = pass;
  v8 = delegate;
  v9 = completion;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __65__PKVehicleConnectionSession_sessionForPass_delegate_completion___block_invoke;
  v13[3] = &unk_1E2AC3A58;
  v14 = v7;
  v15 = v8;
  v16 = v9;
  v10 = v9;
  v11 = v8;
  v12 = v7;
  +[PKAssertion acquireAssertionOfType:withReason:completion:](PKAssertion, "acquireAssertionOfType:withReason:completion:", 8, CFSTR("PKVehicleConnectionSession opened"), v13);

}

void __65__PKVehicleConnectionSession_sessionForPass_delegate_completion___block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  uint8_t v12[16];
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  id v17;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v5 || v6)
  {
    PKLogFacilityTypeGetObject(0x16uLL);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_18FC92000, v11, OS_LOG_TYPE_DEFAULT, "Could not acquire vehicle connection assertion", v12, 2u);
    }

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), 1, 0);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(void))a1[6] + 2))();
  }
  else
  {
    +[PKPassLibrary sharedInstance](PKPassLibrary, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[4], "uniqueID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __65__PKVehicleConnectionSession_sessionForPass_delegate_completion___block_invoke_2;
    v13[3] = &unk_1E2AC3A30;
    v14 = a1[5];
    v15 = v8;
    v16 = v5;
    v17 = a1[6];
    v10 = v8;
    objc_msgSend(v10, "startVehicleConnectionSessionWithPassUniqueIdentifier:completion:", v9, v13);

  }
}

void __65__PKVehicleConnectionSession_sessionForPass_delegate_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;

  v4 = a2;
  if (v4)
  {
    v3 = -[PKVehicleConnectionSession _initWithDelegate:sessionIdentifier:passLibrary:assertion:]([PKVehicleConnectionSession alloc], "_initWithDelegate:sessionIdentifier:passLibrary:assertion:", *(_QWORD *)(a1 + 32), v4, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 48), "invalidate");
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), 1, 0);
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

- (PKVehicleConnectionSession)init
{

  return 0;
}

- (PKVehicleConnectionSession)new
{
  return 0;
}

- (id)_initWithDelegate:(id)a3 sessionIdentifier:(id)a4 passLibrary:(id)a5 assertion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  PKVehicleConnectionSession *v14;
  PKVehicleConnectionSession *v15;
  PKAssertion *assertion;
  _QWORD v18[4];
  id v19;
  id location;
  objc_super v21;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v21.receiver = self;
  v21.super_class = (Class)PKVehicleConnectionSession;
  v14 = -[PKVehicleConnectionSession init](&v21, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeWeak((id *)&v14->_delegate, v10);
    objc_storeStrong((id *)&v15->_passLibrary, a5);
    -[PKPassLibrary addDelegate:](v15->_passLibrary, "addDelegate:", v15);
    v15->_connectionStatus = 2;
    objc_storeStrong((id *)&v15->_sessionIdentifier, a4);
    objc_storeStrong((id *)&v15->_assertion, a6);
    objc_initWeak(&location, v15);
    assertion = v15->_assertion;
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __88__PKVehicleConnectionSession__initWithDelegate_sessionIdentifier_passLibrary_assertion___block_invoke;
    v18[3] = &unk_1E2AC3648;
    objc_copyWeak(&v19, &location);
    -[PKAssertion setInvalidationHandler:](assertion, "setInvalidationHandler:", v18);
    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }

  return v15;
}

void __88__PKVehicleConnectionSession__initWithDelegate_sessionIdentifier_passLibrary_assertion___block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v2;
  _QWORD *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "invalidate");
    v2 = (void *)v3[3];
    v3[3] = 0;

    WeakRetained = v3;
  }

}

- (void)dealloc
{
  PKAssertion *assertion;
  PKAssertion *v4;
  objc_super v5;

  assertion = self->_assertion;
  if (assertion)
  {
    -[PKAssertion invalidate](assertion, "invalidate");
    v4 = self->_assertion;
    self->_assertion = 0;

  }
  else
  {
    -[PKVehicleConnectionSession invalidate](self, "invalidate");
  }
  v5.receiver = self;
  v5.super_class = (Class)PKVehicleConnectionSession;
  -[PKVehicleConnectionSession dealloc](&v5, sel_dealloc);
}

- (BOOL)sendData:(NSData *)message error:(NSError *)error
{
  NSData *v6;
  NSString *sessionIdentifier;
  BOOL v8;

  v6 = message;
  sessionIdentifier = self->_sessionIdentifier;
  if (sessionIdentifier)
  {
    v8 = -[PKPassLibrary sendRKEPassThroughMessage:forSessionIdentifier:error:](self->_passLibrary, "sendRKEPassThroughMessage:forSessionIdentifier:error:", v6, sessionIdentifier, error);
  }
  else if (error)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), 2, 0);
    v8 = 0;
    *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)invalidate
{
  -[PKPassLibrary invalidateVehicleConnectionSessionIdentifier:](self->_passLibrary, "invalidateVehicleConnectionSessionIdentifier:", self->_sessionIdentifier);
}

- (void)vehicleConnectionDidRecievePassthroughData:(id)a3
{
  PKVehicleConnectionDelegate **p_delegate;
  id WeakRetained;
  char v6;
  id v7;
  id v8;

  v8 = a3;
  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    v7 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v7, "sessionDidReceiveData:", v8);

  }
}

- (void)_updateConnectionState:(int64_t)a3
{
  PKVehicleConnectionDelegate **p_delegate;
  id WeakRetained;
  char v6;
  id v7;

  self->_connectionStatus = a3;
  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    v7 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v7, "sessionDidChangeConnectionState:", a3);

  }
}

- (void)passLibraryReceivedInterruption
{
  -[PKVehicleConnectionSession _updateConnectionState:](self, "_updateConnectionState:", 3);
}

- (id)delegate
{
  return objc_loadWeakRetained((id *)&self->_delegate);
}

- (PKVehicleConnectionSessionConnectionState)connectionStatus
{
  return self->_connectionStatus;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_assertion, 0);
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
  objc_storeStrong((id *)&self->_passLibrary, 0);
}

@end
