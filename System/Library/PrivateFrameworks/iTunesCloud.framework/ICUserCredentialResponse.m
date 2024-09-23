@implementation ICUserCredentialResponse

- (void)setIdentityProperties:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void)setICloudIdentityProperties:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (ICUserIdentityProperties)identityProperties
{
  return self->_identityProperties;
}

- (ICUserIdentityProperties)iCloudIdentityProperties
{
  return self->_iCloudIdentityProperties;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iCloudIdentityProperties, 0);
  objc_storeStrong((id *)&self->_identityProperties, 0);
}

@end
