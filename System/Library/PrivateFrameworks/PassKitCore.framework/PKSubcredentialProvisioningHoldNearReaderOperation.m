@implementation PKSubcredentialProvisioningHoldNearReaderOperation

- (void)performOperation
{
  void *v3;
  void *v4;
  uint64_t v5;
  const __CFString *v6;
  PKSubcredentialProvisioningHoldNearReaderOperation *v7;
  uint64_t v8;
  NSObject *v9;
  uint8_t v10[16];
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PKSubcredentialProvisioningHoldNearReaderOperation;
  -[PKSubcredentialProvisioningOperation performOperation](&v11, sel_performOperation);
  -[PKSubcredentialProvisioningPairingSessionOperation pairingSession](self, "pairingSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
  {
    v6 = CFSTR("Unable to get pairing session");
    v7 = self;
    v8 = 0;
LABEL_7:
    -[PKSubcredentialProvisioningOperation failWithErrorCode:description:](v7, "failWithErrorCode:description:", v8, v6);
    goto LABEL_11;
  }
  v5 = objc_msgSend(v3, "state");
  if (v5 == 3)
  {
    v6 = CFSTR("Session was invalidated");
    v7 = self;
    v8 = 1;
    goto LABEL_7;
  }
  if (v5 == 2)
  {
    -[PKSubcredentialProvisioningHoldNearReaderOperation startPairing](self, "startPairing");
  }
  else
  {
    PKLogFacilityTypeGetObject(0x16uLL);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_18FC92000, v9, OS_LOG_TYPE_DEFAULT, "Waiting for session to become active...", v10, 2u);
    }

  }
LABEL_11:

}

- (void)startPairing
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint8_t v11[16];

  PKLogFacilityTypeGetObject(0x16uLL);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_18FC92000, v3, OS_LOG_TYPE_DEFAULT, "Starting key pairing...", v11, 2u);
  }

  -[PKSubcredentialProvisioningOperation configuration](self, "configuration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ownerConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKSubcredentialProvisioningPairingSessionOperation pairingSession](self, "pairingSession");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "keyName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pairingPassword");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "startPairingWithKeyDisplayName:pairingPassword:radioTechnologies:bindingAttestation:", v7, v8, objc_msgSend(v5, "radioTechnologies"), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    PKConvertDAErrorToSubcredentialProvisioningErrorDomain(v9, CFSTR("Unable to start pairing"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[PKSubcredentialProvisioningOperation failWithError:](self, "failWithError:", v10);
  }

}

- (BOOL)canCancelOperation
{
  return 1;
}

- (void)cancelOperation
{
  id v2;

  if (!self->_operationWasCancelled)
  {
    self->_operationWasCancelled = 1;
    -[PKSubcredentialProvisioningPairingSessionOperation pairingSession](self, "pairingSession");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "endSession");

  }
}

- (void)session:(id)a3 didChangeState:(unint64_t)a4
{
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  if (a4 == 2)
  {
    if (-[PKSubcredentialProvisioningOperation isInProgress](self, "isInProgress"))
      -[PKSubcredentialProvisioningHoldNearReaderOperation startPairing](self, "startPairing");
  }
  else if (a4 == 3)
  {
    if (self->_operationWasCancelled)
    {
      -[PKSubcredentialProvisioningOperation delegate](self, "delegate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        v7 = v6;
        objc_msgSend(v6, "operationWasCanceled:", self);

      }
    }
    else if (-[PKSubcredentialProvisioningOperation isInProgress](self, "isInProgress"))
    {
      -[PKSubcredentialProvisioningOperation failWithErrorCode:description:](self, "failWithErrorCode:description:", 1, CFSTR("Session was invalidated unexpectedly"));
    }
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
  uint64_t v6;
  id v7;

  v5 = a4;
  if (!self->_operationWasCancelled)
  {
    v7 = v5;
    PKConvertDAErrorToSubcredentialProvisioningErrorDomain(v5, CFSTR("Pairing failed"));
    v6 = objc_claimAutoreleasedReturnValue();

    -[PKSubcredentialProvisioningOperation failWithError:](self, "failWithError:", v6);
    v5 = (id)v6;
  }

}

- (void)appletSubcredentialPairingSessionDidBeginPairing:(id)a3
{
  -[PKSubcredentialProvisioningOperation advanceToState:](self, "advanceToState:", 7);
}

@end
