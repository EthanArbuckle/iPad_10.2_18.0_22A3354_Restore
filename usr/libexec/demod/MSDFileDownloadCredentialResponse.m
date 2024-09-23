@implementation MSDFileDownloadCredentialResponse

- (NSDictionary)credential
{
  return (NSDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void)setCredential:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_credential, 0);
}

@end
