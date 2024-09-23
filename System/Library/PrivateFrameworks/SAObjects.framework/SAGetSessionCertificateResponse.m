@implementation SAGetSessionCertificateResponse

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.system");
}

- (id)encodedClassName
{
  return CFSTR("GetSessionCertificateResponse");
}

+ (id)getSessionCertificateResponse
{
  return objc_alloc_init((Class)a1);
}

- (NSData)certificate
{
  return (NSData *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("certificate"));
}

- (void)setCertificate:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("certificate"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
