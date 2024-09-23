@implementation TPSRegistrationRequestController

- (void)executeRequest:(id)a3
{
  id v4;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[TPSRegistrationRequestController executeFetchForRequest:](self, "executeFetchForRequest:", v4);

}

- (void)executeFetchForRequest:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  objc_msgSend(a3, "subscriptionContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TPSRequestController telephonyClient](self, "telephonyClient");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __59__TPSRegistrationRequestController_executeFetchForRequest___block_invoke;
  v7[3] = &unk_1EA2CD8A0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "fetchNetworkList:completion:", v6, v7);

}

uint64_t __59__TPSRegistrationRequestController_executeFetchForRequest___block_invoke(uint64_t result, uint64_t a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "respondWithSubscription:cellularNetworks:error:", *(_QWORD *)(result + 40), 0, a2);
  return result;
}

- (void)respondWithSubscription:(id)a3 cellularNetworks:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  TPSCellularNetworksResponse *v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = -[TPSCellularNetworksResponse initWithSubscriptionContext:error:cellularNetworks:]([TPSCellularNetworksResponse alloc], "initWithSubscriptionContext:error:cellularNetworks:", v10, v8, v9);

  -[TPSRequestController postResponse:](self, "postResponse:", v11);
}

- (void)networkListAvailable:(id)a3 list:(id)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(a4, "networks");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  TPSLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    -[TPSRequestController pendingRequest](self, "pendingRequest");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138412546;
    v11 = v9;
    v12 = 2112;
    v13 = v7;
    _os_log_impl(&dword_1DB4B7000, v8, OS_LOG_TYPE_DEFAULT, "Cellular network fetch request succeeded for %@; value is %@.",
      (uint8_t *)&v10,
      0x16u);

  }
  -[TPSRegistrationRequestController respondWithSubscription:cellularNetworks:error:](self, "respondWithSubscription:cellularNetworks:error:", v6, v7, 0);

}

@end
