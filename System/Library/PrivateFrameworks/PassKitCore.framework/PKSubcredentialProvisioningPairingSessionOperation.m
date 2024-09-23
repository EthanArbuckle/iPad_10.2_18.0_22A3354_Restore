@implementation PKSubcredentialProvisioningPairingSessionOperation

- (PKSubcredentialProvisioningPairingSessionOperation)initWithConfiguration:(id)a3 context:(id)a4 delegate:(id)a5
{
  PKSubcredentialProvisioningPairingSessionOperation *v5;
  PKSubcredentialProvisioningPairingSessionOperation *v6;
  PKSubcredentialProvisioningPairingSessionOperation *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PKSubcredentialProvisioningPairingSessionOperation;
  v5 = -[PKSubcredentialProvisioningOperation initWithConfiguration:context:delegate:](&v9, sel_initWithConfiguration_context_delegate_, a3, a4, a5);
  v6 = v5;
  if (!v5
    || (-[PKSubcredentialProvisioningPairingSessionOperation pairingSession](v5, "pairingSession"),
        v7 = (PKSubcredentialProvisioningPairingSessionOperation *)objc_claimAutoreleasedReturnValue(),
        v7,
        v7))
  {
    v7 = v6;
  }

  return v7;
}

- (id)pairingSession
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  objc_class *v6;
  void *v7;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  -[PKSubcredentialProvisioningOperation configuration](self, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ownerConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "session");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    PKLogFacilityTypeGetObject(0x16uLL);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = (objc_class *)objc_opt_class();
      NSStringFromClass(v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138412290;
      v10 = v7;
      _os_log_impl(&dword_18FC92000, v5, OS_LOG_TYPE_DEFAULT, "Pairing operation is missing its session: %@", (uint8_t *)&v9, 0xCu);

    }
  }

  return v4;
}

- (void)appletSubcredentialPairingSession:(id)a3 didEndPairingWithError:(id)a4
{
  -[PKSubcredentialProvisioningOperation failWithErrorCode:description:](self, "failWithErrorCode:description:", 0, CFSTR("Unimplemented method didEndPairingWithError:"));
}

- (void)appletSubcredentialPairingSession:(id)a3 didEndPairingWithSubcredential:(id)a4 registrationData:(id)a5
{
  -[PKSubcredentialProvisioningOperation failWithErrorCode:description:](self, "failWithErrorCode:description:", 0, CFSTR("Unimplemented method didEndPairingWithSubcredential:"), a5);
}

- (void)appletSubcredentialPairingSessionDidBeginPairing:(id)a3
{
  -[PKSubcredentialProvisioningOperation failWithErrorCode:description:](self, "failWithErrorCode:description:", 0, CFSTR("Unimplemented method appletSubcredentialPairingSessionDidBeginPairing:"));
}

- (void)appletSubcredentialPairingSessionDidFirstTransaction:(id)a3 withError:(id)a4
{
  -[PKSubcredentialProvisioningOperation failWithErrorCode:description:](self, "failWithErrorCode:description:", 0, CFSTR("Unimplemented method appletSubcredentialPairingSessionDidFirstTransaction:"));
}

- (void)appletSubcredentialPairingSession:(id)a3 didFinishPreWarmWithResult:(id)a4
{
  -[PKSubcredentialProvisioningOperation failWithErrorCode:description:](self, "failWithErrorCode:description:", 0, CFSTR("Unimplemented method appletSubcredentialPairingSession:didFinishPreWarmWithResult:"));
}

- (void)appletSubcredentialPairingSession:(id)a3 didFinishProbingTerminalWithError:(id)a4 brandCode:(unint64_t)a5
{
  -[PKSubcredentialProvisioningOperation failWithErrorCode:description:](self, "failWithErrorCode:description:", 0, CFSTR("Unimplemented method appletSubcredentialPairingSession:didFinishProbingTerminalWithResult:"), a5);
}

@end
