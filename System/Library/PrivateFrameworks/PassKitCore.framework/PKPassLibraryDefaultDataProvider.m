@implementation PKPassLibraryDefaultDataProvider

- (PKPassLibraryDefaultDataProvider)init
{
  void *v3;
  PKPassLibraryDefaultDataProvider *v4;

  +[PKPassLibrary sharedInstance](PKPassLibrary, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[PKPassLibraryDefaultDataProvider initWithPassLibrary:](self, "initWithPassLibrary:", v3);

  return v4;
}

- (PKPassLibraryDefaultDataProvider)initWithPassLibrary:(id)a3
{
  id v5;
  PKPassLibraryDefaultDataProvider *v6;
  PKPassLibraryDefaultDataProvider *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKPassLibraryDefaultDataProvider;
  v6 = -[PKPassLibraryDefaultDataProvider init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_library, a3);

  return v7;
}

- (id)passes
{
  return -[PKPassLibrary passes](self->_library, "passes");
}

- (unint64_t)countOfPasses
{
  return -[PKPassLibrary countOfPasses](self->_library, "countOfPasses");
}

- (BOOL)canAddPaymentPass
{
  return -[PKPassLibrary canAddPassOfType:](self->_library, "canAddPassOfType:", 1);
}

- (BOOL)canAddSecureElementPassWithConfiguration:(id)a3
{
  return -[PKPassLibrary canAddSecureElementPassWithConfiguration:](self->_library, "canAddSecureElementPassWithConfiguration:", a3);
}

- (id)paymentPasses
{
  return -[PKPassLibrary passesOfType:](self->_library, "passesOfType:", 1);
}

- (id)passWithPassTypeIdentifier:(id)a3 serialNumber:(id)a4
{
  return -[PKPassLibrary passWithPassTypeIdentifier:serialNumber:](self->_library, "passWithPassTypeIdentifier:serialNumber:", a3, a4);
}

- (id)passWithUniqueID:(id)a3
{
  return -[PKPassLibrary passWithUniqueID:](self->_library, "passWithUniqueID:", a3);
}

- (id)peerPaymentPassUniqueID
{
  return -[PKPassLibrary peerPaymentPassUniqueID](self->_library, "peerPaymentPassUniqueID");
}

- (id)passForProvisioningCredentialHash:(id)a3
{
  return -[PKPassLibrary passForProvisioningCredentialHash:](self->_library, "passForProvisioningCredentialHash:", a3);
}

- (void)removePass:(id)a3
{
  PKPassLibrary *library;
  id v4;

  library = self->_library;
  objc_msgSend(a3, "uniqueID");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[PKPassLibrary removePassWithUniqueID:diagnosticReason:](library, "removePassWithUniqueID:diagnosticReason:", v4, CFSTR("Removed via User Interface"));

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_library, 0);
}

@end
