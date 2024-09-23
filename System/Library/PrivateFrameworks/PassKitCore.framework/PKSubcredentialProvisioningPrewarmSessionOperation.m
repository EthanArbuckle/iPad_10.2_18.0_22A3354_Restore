@implementation PKSubcredentialProvisioningPrewarmSessionOperation

- (void)performOperation
{
  void *v3;
  void *v4;
  uint64_t v5;
  const __CFString *v6;
  PKSubcredentialProvisioningPrewarmSessionOperation *v7;
  uint64_t v8;
  NSObject *v9;
  uint8_t v10[16];
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PKSubcredentialProvisioningPrewarmSessionOperation;
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
    -[PKSubcredentialProvisioningPrewarmSessionOperation startPrewarming](self, "startPrewarming");
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

- (void)startPrewarming
{
  void *v3;
  NSObject *v4;
  void *v5;
  id v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  -[PKSubcredentialProvisioningPrewarmSessionOperation _manufacturerIdentifier](self, "_manufacturerIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  PKLogFacilityTypeGetObject(0x16uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = v3;
    _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "Prewarming pairing session with manufacturer: %@", (uint8_t *)&v7, 0xCu);
  }

  -[PKSubcredentialProvisioningPairingSessionOperation pairingSession](self, "pairingSession");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "prewarmWithManufacturerIdentifier:", v3);

}

- (BOOL)canCancelOperation
{
  return 1;
}

- (void)cancelOperation
{
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  PKLogFacilityTypeGetObject(0x16uLL);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_18FC92000, v3, OS_LOG_TYPE_DEFAULT, "Cancelling prewarm operation by ending session", v5, 2u);
  }

  self->_operationWasCancelled = 1;
  -[PKSubcredentialProvisioningPairingSessionOperation pairingSession](self, "pairingSession");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "endSession");

}

- (id)_manufacturerIdentifier
{
  void *v2;
  void *v3;
  void *v4;

  -[PKSubcredentialProvisioningOperation configuration](self, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ownerConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v3, "manufacturerIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      objc_msgSend(v3, "issuerIdentifier");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)session:(id)a3 didChangeState:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  _BOOL4 v9;
  _BOOL4 v10;
  id v11;

  v6 = a3;
  v7 = v6;
  if (a4 == 2)
  {
    v11 = v6;
    v9 = -[PKSubcredentialProvisioningOperation isInProgress](self, "isInProgress");
    v7 = v11;
    if (v9)
    {
      -[PKSubcredentialProvisioningPrewarmSessionOperation startPrewarming](self, "startPrewarming");
      goto LABEL_9;
    }
  }
  else if (a4 == 3)
  {
    v11 = v6;
    if (self->_operationWasCancelled)
    {
      -[PKSubcredentialProvisioningOperation delegate](self, "delegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "operationWasCanceled:", self);

LABEL_9:
      v7 = v11;
      goto LABEL_10;
    }
    v10 = -[PKSubcredentialProvisioningOperation isInProgress](self, "isInProgress");
    v7 = v11;
    if (v10)
    {
      -[PKSubcredentialProvisioningOperation failWithErrorCode:description:](self, "failWithErrorCode:description:", 1, CFSTR("Session was invalidated unexpectedly"));
      goto LABEL_9;
    }
  }
LABEL_10:

}

- (void)appletSubcredentialPairingSession:(id)a3 didFinishPreWarmWithResult:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint8_t v12[16];

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (self->_operationWasCancelled)
  {
    -[PKSubcredentialProvisioningOperation delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "operationWasCanceled:", self);

  }
  else if (v7)
  {
    PKConvertDAErrorToSubcredentialProvisioningErrorDomain(v7, CFSTR("Prewarming failed"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[PKSubcredentialProvisioningOperation failWithError:](self, "failWithError:", v10);
  }
  else
  {
    PKLogFacilityTypeGetObject(0x16uLL);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_18FC92000, v11, OS_LOG_TYPE_DEFAULT, "Prewarming completed successfully", v12, 2u);
    }

    -[PKSubcredentialProvisioningOperation advanceToState:](self, "advanceToState:", 6);
  }

}

@end
