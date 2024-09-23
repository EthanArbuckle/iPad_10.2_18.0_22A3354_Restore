@implementation PKPaymentInformationEventExtensionContext

- (void)handleInformationRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  uint8_t v10[8];
  _QWORD v11[4];
  id v12;

  v6 = a3;
  v7 = a4;
  -[PKPaymentInformationEventExtensionContext _principalObject](self, "_principalObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "conformsToProtocol:", &unk_1EE296808))
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __81__PKPaymentInformationEventExtensionContext_handleInformationRequest_completion___block_invoke;
    v11[3] = &unk_1E2ACDB00;
    v12 = v7;
    objc_msgSend(v8, "handleInformationRequest:completion:", v6, v11);

  }
  else
  {
    PKLogFacilityTypeGetObject(6uLL);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_18FC92000, v9, OS_LOG_TYPE_DEFAULT, "handleInformationRequest: principalObject does not conform to PKPaymentInformationRequestHandling", v10, 2u);
    }

    if (v7)
      (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);
  }

}

uint64_t __81__PKPaymentInformationEventExtensionContext_handleInformationRequest_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)handleSignatureRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  uint8_t v10[8];
  _QWORD v11[4];
  id v12;

  v6 = a3;
  v7 = a4;
  -[PKPaymentInformationEventExtensionContext _principalObject](self, "_principalObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "conformsToProtocol:", &unk_1EE296808))
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __79__PKPaymentInformationEventExtensionContext_handleSignatureRequest_completion___block_invoke;
    v11[3] = &unk_1E2ACDB28;
    v12 = v7;
    objc_msgSend(v8, "handleSignatureRequest:completion:", v6, v11);

  }
  else
  {
    PKLogFacilityTypeGetObject(6uLL);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_18FC92000, v9, OS_LOG_TYPE_DEFAULT, "handleSignatureRequest: principalObject does not conform to PKPaymentInformationRequestHandling", v10, 2u);
    }

    if (v7)
      (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);
  }

}

uint64_t __79__PKPaymentInformationEventExtensionContext_handleSignatureRequest_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)handleConfigurationRequest:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  void *v8;
  NSObject *v9;
  uint8_t v10[8];
  _QWORD v11[4];
  void (**v12)(_QWORD);

  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  -[PKPaymentInformationEventExtensionContext _principalObject](self, "_principalObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "conformsToProtocol:", &unk_1EE296808))
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __83__PKPaymentInformationEventExtensionContext_handleConfigurationRequest_completion___block_invoke;
    v11[3] = &unk_1E2ABD9A0;
    v12 = v7;
    objc_msgSend(v8, "handleConfigurationRequest:completion:", v6, v11);

  }
  else
  {
    PKLogFacilityTypeGetObject(6uLL);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_18FC92000, v9, OS_LOG_TYPE_DEFAULT, "handleConfigurationRequest: principalObject does not conform to PKPaymentInformationRequestHandling", v10, 2u);
    }

    if (v7)
      v7[2](v7);
  }

}

uint64_t __83__PKPaymentInformationEventExtensionContext_handleConfigurationRequest_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

@end
