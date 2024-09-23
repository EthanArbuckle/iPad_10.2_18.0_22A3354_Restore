@implementation PKSubcredentialProvisioningPairingOperation

- (void)session:(id)a3 didChangeState:(unint64_t)a4
{
  if (a4 == 3)
    -[PKSubcredentialProvisioningOperation failWithErrorCode:description:](self, "failWithErrorCode:description:", 1, CFSTR("Session was invalidated unexpectedly"));
}

- (void)appletSubcredentialPairingSessionDidBeginPairing:(id)a3
{
  NSObject *v3;
  uint8_t v4[16];

  PKLogFacilityTypeGetObject(0x16uLL);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_18FC92000, v3, OS_LOG_TYPE_DEFAULT, "Entered pairing state without having started pairing...", v4, 2u);
  }

}

- (void)appletSubcredentialPairingSession:(id)a3 didEndPairingWithSubcredential:(id)a4 registrationData:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v7 = a5;
  v8 = a4;
  -[PKSubcredentialProvisioningOperation context](self, "context");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAddedCredential:", v8);

  -[PKSubcredentialProvisioningOperation context](self, "context");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setRegistrationData:", v7);

  -[PKSubcredentialProvisioningOperation delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "operation:addedCredential:", self, v8);

  -[PKSubcredentialProvisioningOperation advanceToState:](self, "advanceToState:", 9);
}

- (void)appletSubcredentialPairingSession:(id)a3 didEndPairingWithError:(id)a4
{
  id v5;

  PKConvertDAErrorToSubcredentialProvisioningErrorDomain(a4, CFSTR("Pairing failed"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[PKSubcredentialProvisioningOperation failWithError:](self, "failWithError:", v5);

}

@end
