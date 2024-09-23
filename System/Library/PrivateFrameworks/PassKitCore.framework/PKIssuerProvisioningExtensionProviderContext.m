@implementation PKIssuerProvisioningExtensionProviderContext

- (id)remoteObjectProxyWithErrorHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[PKIssuerProvisioningExtensionProviderContext _auxiliaryConnection](self, "_auxiliaryConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)synchronousRemoteObjectProxyWithErrorHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[PKIssuerProvisioningExtensionProviderContext _auxiliaryConnection](self, "_auxiliaryConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)statusWithCompletion:(id)a3
{
  void (**v4)(id, _QWORD);
  void *v5;
  PKIssuerProvisioningExtensionHandler *handler;
  void (**v7)(id, _QWORD);

  v4 = (void (**)(id, _QWORD))a3;
  if (v4)
  {
    v7 = v4;
    v5 = (void *)MEMORY[0x19400CFE8]();
    handler = self->_handler;
    if (handler)
      -[PKIssuerProvisioningExtensionHandler statusWithCompletion:](handler, "statusWithCompletion:", v7);
    else
      v7[2](v7, 0);
    objc_autoreleasePoolPop(v5);
    v4 = v7;
  }

}

- (void)passEntriesWithCompletion:(id)a3
{
  void (**v4)(id, _QWORD);
  void *v5;
  PKIssuerProvisioningExtensionHandler *handler;
  void (**v7)(id, _QWORD);

  v4 = (void (**)(id, _QWORD))a3;
  if (v4)
  {
    v7 = v4;
    v5 = (void *)MEMORY[0x19400CFE8]();
    handler = self->_handler;
    if (handler)
      -[PKIssuerProvisioningExtensionHandler passEntriesWithCompletion:](handler, "passEntriesWithCompletion:", v7);
    else
      v7[2](v7, MEMORY[0x1E0C9AA60]);
    objc_autoreleasePoolPop(v5);
    v4 = v7;
  }

}

- (void)remotePassEntriesWithCompletion:(id)a3
{
  void (**v4)(id, _QWORD);
  void *v5;
  PKIssuerProvisioningExtensionHandler *handler;
  void (**v7)(id, _QWORD);

  v4 = (void (**)(id, _QWORD))a3;
  if (v4)
  {
    v7 = v4;
    v5 = (void *)MEMORY[0x19400CFE8]();
    handler = self->_handler;
    if (handler)
      -[PKIssuerProvisioningExtensionHandler remotePassEntriesWithCompletion:](handler, "remotePassEntriesWithCompletion:", v7);
    else
      v7[2](v7, MEMORY[0x1E0C9AA60]);
    objc_autoreleasePoolPop(v5);
    v4 = v7;
  }

}

- (void)generateRequestWithEntryIdentifier:(id)a3 configuration:(id)a4 certificateChain:(id)a5 nonce:(id)a6 nonceSignature:(id)a7 completionHandler:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  void (**v18)(id, _QWORD);
  void *v19;
  PKIssuerProvisioningExtensionHandler *handler;
  id v21;

  v21 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = (void (**)(id, _QWORD))a8;
  if (v18)
  {
    v19 = (void *)MEMORY[0x19400CFE8]();
    handler = self->_handler;
    if (handler)
      -[PKIssuerProvisioningExtensionHandler generateAddPaymentPassRequestForPassEntryWithIdentifier:configuration:certificateChain:nonce:nonceSignature:completionHandler:](handler, "generateAddPaymentPassRequestForPassEntryWithIdentifier:configuration:certificateChain:nonce:nonceSignature:completionHandler:", v21, v14, v15, v16, v17, v18);
    else
      v18[2](v18, 0);
    objc_autoreleasePoolPop(v19);
  }

}

- (void)connect
{
  id v2;

  -[PKIssuerProvisioningExtensionProviderContext synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "connectWithCompletion:", &__block_literal_global_73);

}

- (PKIssuerProvisioningExtensionHandler)handler
{
  return self->_handler;
}

- (void)setHandler:(id)a3
{
  objc_storeStrong((id *)&self->_handler, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handler, 0);
}

@end
