@implementation MCCSigningAndEncryptionMessagesStatus

- (MCCSigningAndEncryptionMessagesStatus)initWithCoder:(id)a3
{
  id v4;
  MCCSigningAndEncryptionMessagesStatus *v5;

  v4 = a3;
  v5 = -[MCCSigningAndEncryptionMessagesStatus init](self, "init");
  if (v5)
  {
    v5->_signMessagesIsEnabled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_signMessagesIsEnabled"));
    v5->_encryptMessagesIsEnabled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_encryptMessagesIsEnabled"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  _BOOL8 signMessagesIsEnabled;
  id v5;

  signMessagesIsEnabled = self->_signMessagesIsEnabled;
  v5 = a3;
  objc_msgSend(v5, "encodeBool:forKey:", signMessagesIsEnabled, CFSTR("_signMessagesIsEnabled"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_encryptMessagesIsEnabled, CFSTR("_encryptMessagesIsEnabled"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *((_BYTE *)result + 8) = self->_signMessagesIsEnabled;
  *((_BYTE *)result + 9) = self->_encryptMessagesIsEnabled;
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)signMessagesIsEnabled
{
  return self->_signMessagesIsEnabled;
}

- (void)setSignMessagesIsEnabled:(BOOL)a3
{
  self->_signMessagesIsEnabled = a3;
}

- (BOOL)encryptMessagesIsEnabled
{
  return self->_encryptMessagesIsEnabled;
}

- (void)setEncryptMessagesIsEnabled:(BOOL)a3
{
  self->_encryptMessagesIsEnabled = a3;
}

@end
