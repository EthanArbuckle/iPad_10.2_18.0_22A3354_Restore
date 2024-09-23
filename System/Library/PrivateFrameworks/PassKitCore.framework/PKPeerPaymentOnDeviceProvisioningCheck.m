@implementation PKPeerPaymentOnDeviceProvisioningCheck

+ (BOOL)_hasPeerPaymentPassProvisionedForAccount:(id)a3 passLibraryDataProvider:(id)a4
{
  void *v4;
  BOOL v5;

  objc_msgSend(a1, "_peerPaymentPassForAccount:passLibraryDataProvider:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "activationState") != 4;

  return v5;
}

+ (id)_peerPaymentPassForAccount:(id)a3 passLibraryDataProvider:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = a4;
  objc_msgSend(a3, "associatedPassUniqueID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "passWithUniqueID:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "paymentPass");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (BOOL)peerPaymentPassIsProvisionedOnDeviceForAccount:(id)a3
{
  id v4;
  PKPassLibraryDefaultDataProvider *v5;

  v4 = a3;
  v5 = objc_alloc_init(PKPassLibraryDefaultDataProvider);
  LOBYTE(a1) = objc_msgSend(a1, "peerPaymentPassIsProvisionedOnDeviceForAccount:passLibraryDataProvider:", v4, v5);

  return (char)a1;
}

@end
