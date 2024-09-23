@implementation PKAppletSubcredentialPairingSession

+ (id)createSessionWithDelegate:(id)a3
{
  id v3;
  PKAppletSubcredentialPairingSession *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  PKAppletSubcredentialPairingSession *v8;
  NSObject *v9;
  int v11;
  PKAppletSubcredentialPairingSession *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = -[PKDASession initWithDelegate:]([PKAppletSubcredentialPairingSession alloc], "initWithDelegate:", v3);

  objc_msgSend(MEMORY[0x1E0D1D388], "sharedManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "createPairingSessionWithDelegate:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[PKDASession setSession:](v4, "setSession:", v6);
    PKLogFacilityTypeGetObject(6uLL);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 134217984;
      v12 = v4;
      _os_log_impl(&dword_18FC92000, v7, OS_LOG_TYPE_DEFAULT, "Starting pairing session: %p", (uint8_t *)&v11, 0xCu);
    }

    v8 = v4;
  }
  else
  {
    PKLogFacilityTypeGetObject(0x16uLL);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v11) = 0;
      _os_log_impl(&dword_18FC92000, v9, OS_LOG_TYPE_DEFAULT, "Failed to create owner pairing session!", (uint8_t *)&v11, 2u);
    }

    v8 = 0;
  }

  return v8;
}

- (id)prewarmWithManufacturerIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[PKDASession state](self, "state") != 2)
  {
    PKLogFacilityTypeGetObject(0x16uLL);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v10) = 0;
      _os_log_impl(&dword_18FC92000, v5, OS_LOG_TYPE_DEFAULT, "Session is in invalid state for pairing operation", (uint8_t *)&v10, 2u);
    }

  }
  -[PKDASession session](self, "session");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "preWarmForManufacturer:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    PKLogFacilityTypeGetObject(0x16uLL);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 138412290;
      v11 = v7;
      _os_log_impl(&dword_18FC92000, v8, OS_LOG_TYPE_DEFAULT, "Prewarming failed with error: %@", (uint8_t *)&v10, 0xCu);
    }

  }
  return v7;
}

- (id)probeTerminalForPairingStatus
{
  NSObject *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (-[PKDASession state](self, "state") != 2)
  {
    PKLogFacilityTypeGetObject(0x16uLL);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v8) = 0;
      _os_log_impl(&dword_18FC92000, v3, OS_LOG_TYPE_DEFAULT, "Session is in invalid state for pairing operation", (uint8_t *)&v8, 2u);
    }

  }
  -[PKDASession session](self, "session");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startProbing");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    PKLogFacilityTypeGetObject(0x16uLL);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 138412290;
      v9 = v5;
      _os_log_impl(&dword_18FC92000, v6, OS_LOG_TYPE_DEFAULT, "Probing failed with error: %@", (uint8_t *)&v8, 0xCu);
    }

  }
  return v5;
}

- (id)startPairingWithKeyDisplayName:(id)a3 pairingPassword:(id)a4 radioTechnologies:(unint64_t)a5 bindingAttestation:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  int v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  if (-[PKDASession state](self, "state") != 2)
  {
    PKLogFacilityTypeGetObject(0x16uLL);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v20) = 0;
      _os_log_impl(&dword_18FC92000, v13, OS_LOG_TYPE_DEFAULT, "Session is in invalid state for pairing operation", (uint8_t *)&v20, 2u);
    }

  }
  if (a5)
  {
    if ((a5 & 2) != 0)
      v14 = 2;
    else
      v14 = 1;
    -[PKDASession session](self, "session");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "startKeyPairingWithPassword:displayName:transport:bindingAttestation:", v11, v10, v14, v12);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      PKLogFacilityTypeGetObject(0x16uLL);
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v20 = 138412290;
        v21 = v16;
        _os_log_impl(&dword_18FC92000, v17, OS_LOG_TYPE_DEFAULT, "Key pairing failed with error: %@", (uint8_t *)&v20, 0xCu);
      }

    }
  }
  else
  {
    PKLogFacilityTypeGetObject(0x16uLL);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v20) = 0;
      _os_log_impl(&dword_18FC92000, v18, OS_LOG_TYPE_DEFAULT, "Session provided invalid wireless transport type", (uint8_t *)&v20, 2u);
    }

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), -1, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v16;
}

- (id)trackSubcredential:(id)a3 encryptedContainer:(id)a4 withReceipt:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  uint8_t v17[16];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (-[PKDASession state](self, "state") == 2)
  {
    PKDAAlishaKeyEncryptedRequestFromSubcredentialEncryptedRequest(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKDASession session](self, "session");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setTrackingReceipt:vehicleMobilizationData:forKeyWithIdentifier:", v10, v11, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    PKLogFacilityTypeGetObject(0x16uLL);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v17 = 0;
      _os_log_impl(&dword_18FC92000, v15, OS_LOG_TYPE_DEFAULT, "Session is in invalid state for track operation", v17, 2u);
    }

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), -1, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v14;
}

- (void)keyPairingSession:(id)a3 didFinishPairingWithKey:(id)a4 trackingRequest:(id)a5 error:(id)a6
{
  id v10;
  id v11;
  id v12;
  PKAppletSubcredential *v13;
  PKAppletSubcredential *v14;
  PKSubcredentialEncryptedContainer *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (PKAppletSubcredential *)a6;
  v14 = v13;
  if (!v11 || v13)
  {
    if (!v13)
    {
      v17 = (void *)MEMORY[0x1E0CB35C8];
      v19 = *MEMORY[0x1E0CB2938];
      v20[0] = CFSTR("Pairing finished with no error or key");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "errorWithDomain:code:userInfo:", CFSTR("PKSubcredentialProvisioningErrorDomain"), 1, v18);
      v14 = (PKAppletSubcredential *)objc_claimAutoreleasedReturnValue();

    }
    -[PKDASession delegate](self, "delegate");
    v15 = (PKSubcredentialEncryptedContainer *)objc_claimAutoreleasedReturnValue();
    -[PKSubcredentialEncryptedContainer appletSubcredentialPairingSession:didEndPairingWithError:](v15, "appletSubcredentialPairingSession:didEndPairingWithError:", self, v14);
  }
  else
  {
    v14 = -[PKAppletSubcredential initWithKeyInformation:]([PKAppletSubcredential alloc], "initWithKeyInformation:", v11);
    v15 = -[PKSubcredentialEncryptedContainer initWithRequest:]([PKSubcredentialEncryptedContainer alloc], "initWithRequest:", v12);
    -[PKDASession delegate](self, "delegate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "appletSubcredentialPairingSession:didEndPairingWithSubcredential:registrationData:", self, v14, v15);

  }
}

- (void)didFinishFirstTransactionForSession:(id)a3 error:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[PKDASession delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appletSubcredentialPairingSessionDidFirstTransaction:withError:", self, v5);

}

- (void)didFinishPreWarmWithResult:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PKDASession delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appletSubcredentialPairingSession:didFinishPreWarmWithResult:", self, v4);

}

- (void)didFinishProbingWithBrandCode:(unint64_t)a3 error:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  -[PKDASession delegate](self, "delegate");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appletSubcredentialPairingSession:didFinishProbingTerminalWithError:brandCode:", self, v6, a3);

}

- (void)didStartPairing
{
  id v3;

  -[PKDASession delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appletSubcredentialPairingSessionDidBeginPairing:", self);

}

@end
