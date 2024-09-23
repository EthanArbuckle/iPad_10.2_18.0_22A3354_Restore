@implementation ICStoreURLRequestBuilderProperties

- (void)setURLBag:(id)a3
{
  objc_storeStrong((id *)&self->_URLBag, a3);
}

- (void)setStorefrontIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)setICloudPersonID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void)setDSID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)storefrontIdentifier
{
  return self->_storefrontIdentifier;
}

- (NSString)iCloudPersonID
{
  return self->_iCloudPersonID;
}

- (NSString)delegatedStorefrontIdentifier
{
  return self->_delegatedStorefrontIdentifier;
}

- (NSNumber)delegatedDSID
{
  return self->_delegatedDSID;
}

- (ICDelegateToken)delegateToken
{
  return self->_delegateToken;
}

- (ICURLBag)URLBag
{
  return self->_URLBag;
}

- (NSNumber)DSID
{
  return self->_DSID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegatedURLBag, 0);
  objc_storeStrong((id *)&self->_delegateToken, 0);
  objc_storeStrong((id *)&self->_delegatedStorefrontIdentifier, 0);
  objc_storeStrong((id *)&self->_delegatedDSID, 0);
  objc_storeStrong((id *)&self->_storefrontIdentifier, 0);
  objc_storeStrong((id *)&self->_DSID, 0);
  objc_storeStrong((id *)&self->_URLBag, 0);
  objc_storeStrong((id *)&self->_iCloudPersonID, 0);
}

- (void)setDelegatedDSID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void)setDelegatedStorefrontIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void)setDelegateToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (ICURLBag)delegatedURLBag
{
  return self->_delegatedURLBag;
}

- (void)setDelegatedURLBag:(id)a3
{
  objc_storeStrong((id *)&self->_delegatedURLBag, a3);
}

@end
