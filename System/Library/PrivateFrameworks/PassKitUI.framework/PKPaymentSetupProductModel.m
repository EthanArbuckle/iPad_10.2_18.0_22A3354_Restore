@implementation PKPaymentSetupProductModel

uint64_t __78__PKPaymentSetupProductModel_PKUIUtilities___localCredentials_containProduct___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v3 = a2;
  if (objc_msgSend(v3, "isRemoteCredential"))
  {
    objc_msgSend(v3, "remoteCredential");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!objc_msgSend(v3, "isCarKeyTerminalPairingCredential"))
    {
      v8 = 0;
      goto LABEL_7;
    }
    objc_msgSend(v3, "carKeyTerminalPairingCredential");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;
  v6 = *(void **)(a1 + 32);
  objc_msgSend(v4, "productIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqualToString:", v7);

LABEL_7:
  return v8;
}

@end
