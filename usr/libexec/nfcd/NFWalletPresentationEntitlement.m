@implementation NFWalletPresentationEntitlement

- (id)debugDescription
{
  id v3;
  NSString *applicationIdentifier;

  v3 = objc_alloc((Class)NSString);
  if (self)
    applicationIdentifier = self->_applicationIdentifier;
  else
    applicationIdentifier = 0;
  return objc_msgSend(v3, "initWithFormat:", CFSTR("{ appId= %@}"), applicationIdentifier);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applicationIdentifier, 0);
}

@end
