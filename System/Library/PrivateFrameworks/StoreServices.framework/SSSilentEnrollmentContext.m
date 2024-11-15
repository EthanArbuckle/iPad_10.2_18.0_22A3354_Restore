@implementation SSSilentEnrollmentContext

- (NSNumber)accountIdentifier
{
  return self->_accountIdentifier;
}

- (void)setAccountIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)headerADSID
{
  return self->_headerADSID;
}

- (void)setHeaderADSID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)headerGSToken
{
  return self->_headerGSToken;
}

- (void)setHeaderGSToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)headerGuid
{
  return self->_headerGuid;
}

- (void)setHeaderGuid:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)headerMMeClientInfo
{
  return self->_headerMMeClientInfo;
}

- (void)setHeaderMMeClientInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)headerMMeDeviceId
{
  return self->_headerMMeDeviceId;
}

- (void)setHeaderMMeDeviceId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSData)parameters
{
  return self->_parameters;
}

- (void)setParameters:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)URLString
{
  return self->_URLString;
}

- (void)setURLString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_URLString, 0);
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_headerMMeDeviceId, 0);
  objc_storeStrong((id *)&self->_headerMMeClientInfo, 0);
  objc_storeStrong((id *)&self->_headerGuid, 0);
  objc_storeStrong((id *)&self->_headerGSToken, 0);
  objc_storeStrong((id *)&self->_headerADSID, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
}

@end
