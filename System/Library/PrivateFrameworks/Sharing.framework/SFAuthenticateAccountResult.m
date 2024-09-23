@implementation SFAuthenticateAccountResult

- (SFAuthenticateAccountResult)initWithAuthenticatedAccounts:(id)a3 knownHomeUserIdentifiers:(id)a4 isVoiceProfileAvailable:(BOOL)a5
{
  id v9;
  id v10;
  SFAuthenticateAccountResult *v11;
  SFAuthenticateAccountResult *v12;
  objc_super v14;

  v9 = a3;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SFAuthenticateAccountResult;
  v11 = -[SFAuthenticateAccountResult init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_authenticatedAccounts, a3);
    objc_storeStrong((id *)&v12->_knownHomeUserIdentifiers, a4);
    v12->_isVoiceProfileAvailable = a5;
  }

  return v12;
}

- (NSString)preferredLanguageCode
{
  return self->_preferredLanguageCode;
}

- (void)setPreferredLanguageCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)localeIdentifier
{
  return self->_localeIdentifier;
}

- (void)setLocaleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSArray)preferredLanguages
{
  return self->_preferredLanguages;
}

- (void)setPreferredLanguages:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSArray)keyboards
{
  return self->_keyboards;
}

- (void)setKeyboards:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSArray)authenticatedAccounts
{
  return self->_authenticatedAccounts;
}

- (NSArray)knownHomeUserIdentifiers
{
  return self->_knownHomeUserIdentifiers;
}

- (BOOL)isVoiceProfileAvailable
{
  return self->_isVoiceProfileAvailable;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_knownHomeUserIdentifiers, 0);
  objc_storeStrong((id *)&self->_authenticatedAccounts, 0);
  objc_storeStrong((id *)&self->_keyboards, 0);
  objc_storeStrong((id *)&self->_preferredLanguages, 0);
  objc_storeStrong((id *)&self->_localeIdentifier, 0);
  objc_storeStrong((id *)&self->_preferredLanguageCode, 0);
}

@end
