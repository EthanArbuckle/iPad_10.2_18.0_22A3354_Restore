@implementation PKIssuerProvisioningExtensionStatus

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKIssuerProvisioningExtensionStatus)init
{
  PKIssuerProvisioningExtensionStatus *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKIssuerProvisioningExtensionStatus;
  result = -[PKIssuerProvisioningExtensionStatus init](&v3, sel_init);
  if (result)
    *(_WORD *)&result->_requiresAuthentication = 0;
  return result;
}

- (PKIssuerProvisioningExtensionStatus)initWithCoder:(id)a3
{
  id v4;
  PKIssuerProvisioningExtensionStatus *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)PKIssuerProvisioningExtensionStatus;
  v5 = -[PKIssuerProvisioningExtensionStatus init](&v7, sel_init);
  if (v5)
  {
    v5->_requiresAuthentication = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("requiresAuthentication"));
    v5->_passEntriesAvailable = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("passEntriesAvailable"));
    v5->_remotePassEntriesAvailable = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("remotePassEntriesAvailable"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  _BOOL8 requiresAuthentication;
  id v5;

  requiresAuthentication = self->_requiresAuthentication;
  v5 = a3;
  objc_msgSend(v5, "encodeBool:forKey:", requiresAuthentication, CFSTR("requiresAuthentication"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_passEntriesAvailable, CFSTR("passEntriesAvailable"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_remotePassEntriesAvailable, CFSTR("remotePassEntriesAvailable"));

}

- (id)description
{
  const __CFString *v2;
  const __CFString *v3;
  const __CFString *v4;

  v2 = CFSTR("YES");
  if (self->_requiresAuthentication)
    v3 = CFSTR("YES");
  else
    v3 = CFSTR("NO");
  if (self->_passEntriesAvailable)
    v4 = CFSTR("YES");
  else
    v4 = CFSTR("NO");
  if (!self->_remotePassEntriesAvailable)
    v2 = CFSTR("NO");
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("requiresAuthentication: %@ passEntriesAvailable: %@ remotePassEntriesAvailable: %@"), v3, v4, v2);
}

- (BOOL)requiresAuthentication
{
  return self->_requiresAuthentication;
}

- (void)setRequiresAuthentication:(BOOL)requiresAuthentication
{
  self->_requiresAuthentication = requiresAuthentication;
}

- (BOOL)passEntriesAvailable
{
  return self->_passEntriesAvailable;
}

- (void)setPassEntriesAvailable:(BOOL)passEntriesAvailable
{
  self->_passEntriesAvailable = passEntriesAvailable;
}

- (BOOL)remotePassEntriesAvailable
{
  return self->_remotePassEntriesAvailable;
}

- (void)setRemotePassEntriesAvailable:(BOOL)remotePassEntriesAvailable
{
  self->_remotePassEntriesAvailable = remotePassEntriesAvailable;
}

@end
