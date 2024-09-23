@implementation DMDPayloadContext

- (NSString)organizationIdentifier
{
  return self->_organizationIdentifier;
}

- (void)setOrganizationIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSDictionary)assetProvidersByPayloadIdentifier
{
  return self->_assetProvidersByPayloadIdentifier;
}

- (void)setAssetProvidersByPayloadIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetProvidersByPayloadIdentifier, 0);
  objc_storeStrong((id *)&self->_organizationIdentifier, 0);
}

@end
