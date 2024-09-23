@implementation PKSharingIDSManagerHandlerConfiguration

- (PKSharingIDSManagerHandlerConfiguration)initWithSharingGroup:(unint64_t)a3
{
  PKSharingIDSManagerHandlerConfiguration *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKSharingIDSManagerHandlerConfiguration;
  result = -[PKSharingIDSManagerHandlerConfiguration init](&v5, sel_init);
  if (result)
    result->_sharingGroup = a3;
  return result;
}

- (id)description
{
  void *v3;
  void *v4;
  unint64_t sharingGroup;
  const __CFString *v6;
  const __CFString *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  sharingGroup = self->_sharingGroup;
  v6 = CFSTR("peerPayment");
  if (sharingGroup == 2)
    v6 = CFSTR("accountUsers");
  if (sharingGroup)
    v7 = v6;
  else
    v7 = CFSTR("unknown");
  objc_msgSend(v3, "appendFormat:", CFSTR("sharingGroup: '%@'; "), v7);
  objc_msgSend(v4, "appendFormat:", CFSTR("handle: '%@'; "), self->_handle);
  objc_msgSend(v4, "appendFormat:", CFSTR("accountIdentifier: '%@'; "), self->_accountIdentifier);
  PKAccountAccessLevelToString(self->_accessLevel);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR("accessLevel: '%@'; "), v8);

  return v4;
}

- (unint64_t)sharingGroup
{
  return self->_sharingGroup;
}

- (NSString)handle
{
  return self->_handle;
}

- (void)setHandle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)accountIdentifier
{
  return self->_accountIdentifier;
}

- (void)setAccountIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (unint64_t)accessLevel
{
  return self->_accessLevel;
}

- (void)setAccessLevel:(unint64_t)a3
{
  self->_accessLevel = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
  objc_storeStrong((id *)&self->_handle, 0);
}

@end
