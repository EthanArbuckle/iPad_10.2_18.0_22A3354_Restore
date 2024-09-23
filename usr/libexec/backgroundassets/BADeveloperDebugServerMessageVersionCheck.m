@implementation BADeveloperDebugServerMessageVersionCheck

- (BADeveloperDebugServerMessageVersionCheck)initWithVersionAllowed:(BOOL)a3 failureExplanation:(id)a4
{
  id v7;
  BADeveloperDebugServerMessageVersionCheck *v8;
  BADeveloperDebugServerMessageVersionCheck *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)BADeveloperDebugServerMessageVersionCheck;
  v8 = -[BADeveloperDebugServerMessage initWithMessageOperation:](&v11, "initWithMessageOperation:", 1);
  v9 = v8;
  if (v8)
  {
    v8->_versionAllowed = a3;
    objc_storeStrong((id *)&v8->_failureReason, a4);
  }

  return v9;
}

- (BADeveloperDebugServerMessageVersionCheck)initWithCoder:(id)a3
{
  id v4;
  BADeveloperDebugServerMessageVersionCheck *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  NSString *failureReason;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)BADeveloperDebugServerMessageVersionCheck;
  v5 = -[BADeveloperDebugServerMessage initWithCoder:](&v11, "initWithCoder:", v4);
  if (v5)
  {
    v5->_versionAllowed = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("BAServerVersionSupported"));
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("BAFailureReason")))
    {
      v7 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString, v6), CFSTR("BAFailureReason"));
      v8 = objc_claimAutoreleasedReturnValue(v7);
      failureReason = v5->_failureReason;
      v5->_failureReason = (NSString *)v8;

    }
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)BADeveloperDebugServerMessageVersionCheck;
  -[BADeveloperDebugServerMessage encodeWithCoder:](&v7, "encodeWithCoder:", v4);
  objc_msgSend(v4, "encodeBool:forKey:", -[BADeveloperDebugServerMessageVersionCheck versionAllowed](self, "versionAllowed"), CFSTR("BAServerVersionSupported"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BADeveloperDebugServerMessageVersionCheck failureReason](self, "failureReason"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BADeveloperDebugServerMessageVersionCheck failureReason](self, "failureReason"));
    objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("BAFailureReason"));

  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)versionAllowed
{
  return self->_versionAllowed;
}

- (NSString)failureReason
{
  return self->_failureReason;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_failureReason, 0);
}

@end
