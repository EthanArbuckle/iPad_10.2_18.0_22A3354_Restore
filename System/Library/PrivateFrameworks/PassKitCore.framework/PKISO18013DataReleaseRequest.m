@implementation PKISO18013DataReleaseRequest

- (NSString)documentType
{
  return self->_documentType;
}

- (void)setDocumentType:(id)a3
{
  objc_storeStrong((id *)&self->_documentType, a3);
}

- (PKTransactionReleasedData)dataElements
{
  return self->_dataElements;
}

- (void)setDataElements:(id)a3
{
  objc_storeStrong((id *)&self->_dataElements, a3);
}

- (NSString)rpIdentifier
{
  return self->_rpIdentifier;
}

- (void)setRpIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_rpIdentifier, a3);
}

- (NSString)organizationName
{
  return self->_organizationName;
}

- (void)setOrganizationName:(id)a3
{
  objc_storeStrong((id *)&self->_organizationName, a3);
}

- (NSString)organizationUnit
{
  return self->_organizationUnit;
}

- (void)setOrganizationUnit:(id)a3
{
  objc_storeStrong((id *)&self->_organizationUnit, a3);
}

- (NSData)iconData
{
  return self->_iconData;
}

- (void)setIconData:(id)a3
{
  objc_storeStrong((id *)&self->_iconData, a3);
}

- (NSURL)iconURL
{
  return self->_iconURL;
}

- (void)setIconURL:(id)a3
{
  objc_storeStrong((id *)&self->_iconURL, a3);
}

- (NSNumber)industryCode
{
  return self->_industryCode;
}

- (void)setIndustryCode:(id)a3
{
  objc_storeStrong((id *)&self->_industryCode, a3);
}

- (NSData)authenticationACL
{
  return self->_authenticationACL;
}

- (void)setAuthenticationACL:(id)a3
{
  objc_storeStrong((id *)&self->_authenticationACL, a3);
}

- (NSData)externalizedAuthenticationContext
{
  return self->_externalizedAuthenticationContext;
}

- (void)setExternalizedAuthenticationContext:(id)a3
{
  objc_storeStrong((id *)&self->_externalizedAuthenticationContext, a3);
}

- (BOOL)isTrustedRelyingParty
{
  return self->_trustedRelyingParty;
}

- (void)setTrustedRelyingParty:(BOOL)a3
{
  self->_trustedRelyingParty = a3;
}

- (NSString)analyticsIdentifier
{
  return self->_analyticsIdentifier;
}

- (void)setAnalyticsIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_analyticsIdentifier, a3);
}

- (NSString)analyticsOrganizationName
{
  return self->_analyticsOrganizationName;
}

- (void)setAnalyticsOrganizationName:(id)a3
{
  objc_storeStrong((id *)&self->_analyticsOrganizationName, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analyticsOrganizationName, 0);
  objc_storeStrong((id *)&self->_analyticsIdentifier, 0);
  objc_storeStrong((id *)&self->_externalizedAuthenticationContext, 0);
  objc_storeStrong((id *)&self->_authenticationACL, 0);
  objc_storeStrong((id *)&self->_industryCode, 0);
  objc_storeStrong((id *)&self->_iconURL, 0);
  objc_storeStrong((id *)&self->_iconData, 0);
  objc_storeStrong((id *)&self->_organizationUnit, 0);
  objc_storeStrong((id *)&self->_organizationName, 0);
  objc_storeStrong((id *)&self->_rpIdentifier, 0);
  objc_storeStrong((id *)&self->_dataElements, 0);
  objc_storeStrong((id *)&self->_documentType, 0);
}

@end
