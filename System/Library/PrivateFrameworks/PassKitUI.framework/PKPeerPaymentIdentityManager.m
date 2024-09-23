@implementation PKPeerPaymentIdentityManager

- (PKPeerPaymentIdentityManager)init
{
  PKPeerPaymentIdentityManager *v2;
  _PKPeerPaymentIdentityManager *v3;
  _PKPeerPaymentIdentityManager *internalManager;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKPeerPaymentIdentityManager;
  v2 = -[PKPeerPaymentIdentityManager init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(_PKPeerPaymentIdentityManager);
    internalManager = v2->_internalManager;
    v2->_internalManager = v3;

    -[_PKPeerPaymentIdentityManager setDelegate:](v2->_internalManager, "setDelegate:", v2);
  }
  return v2;
}

- (void)commitUpdatesIfNeeded
{
  -[_PKPeerPaymentIdentityManager commitUpdatesIfNeeded](self->_internalManager, "commitUpdatesIfNeeded");
}

- (PKPeerPaymentProfileAppearanceData)appearanceData
{
  return -[_PKPeerPaymentIdentityManager appearanceData](self->_internalManager, "appearanceData");
}

- (NSString)firstName
{
  return -[_PKPeerPaymentIdentityManager firstName](self->_internalManager, "firstName");
}

- (NSString)lastName
{
  return -[_PKPeerPaymentIdentityManager lastName](self->_internalManager, "lastName");
}

- (BOOL)isSharingLastName
{
  return -[_PKPeerPaymentIdentityManager shareLastName](self->_internalManager, "shareLastName");
}

- (NSData)profilePictureData
{
  return -[_PKPeerPaymentIdentityManager profilePictureData](self->_internalManager, "profilePictureData");
}

- (BOOL)isSharingProfilePicture
{
  return -[_PKPeerPaymentIdentityManager shareProfilePicture](self->_internalManager, "shareProfilePicture");
}

- (NSString)displayName
{
  void *v2;
  void *v3;

  -[_PKPeerPaymentIdentityManager appearanceData](self->_internalManager, "appearanceData");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "displayName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)toggleSharingLastName
{
  -[_PKPeerPaymentIdentityManager setShareLastName:](self->_internalManager, "setShareLastName:", -[PKPeerPaymentIdentityManager isSharingLastName](self, "isSharingLastName") ^ 1);
}

- (void)toggleSharingProfilePicture
{
  -[_PKPeerPaymentIdentityManager setShareProfilePicture:](self->_internalManager, "setShareProfilePicture:", -[PKPeerPaymentIdentityManager isSharingProfilePicture](self, "isSharingProfilePicture") ^ 1);
}

- (void)peerPaymentIdentityManager:(id)a3 didUpdateProfileAppearanceData:(id)a4
{
  void *v5;
  id v6;

  -[PKPeerPaymentIdentityManager delegate](self, "delegate", a3, a4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[PKPeerPaymentIdentityManager appearanceData](self, "appearanceData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "peerPaymentIdentityManager:didUpdateAppearanceData:", self, v5);

}

- (PKPeerPaymentIdentityManagerDelegate)delegate
{
  return (PKPeerPaymentIdentityManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_internalManager, 0);
}

@end
