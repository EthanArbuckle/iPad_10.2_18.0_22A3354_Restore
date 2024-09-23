@implementation BADeveloperDebugServerMessage

- (BADeveloperDebugServerMessage)initWithCoder:(id)a3
{
  id v4;
  BADeveloperDebugServerMessage *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)BADeveloperDebugServerMessage;
  v5 = -[BADeveloperDebugMessage initWithCoder:](&v7, "initWithCoder:", v4);
  if (v5)
    v5->_messageOperation = (int64_t)objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("BAServerMessageOperation"));

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BADeveloperDebugServerMessage;
  v4 = a3;
  -[BADeveloperDebugMessage encodeWithCoder:](&v5, "encodeWithCoder:", v4);
  objc_msgSend(v4, "encodeInteger:forKey:", -[BADeveloperDebugServerMessage messageOperation](self, "messageOperation", v5.receiver, v5.super_class), CFSTR("BAServerMessageOperation"));

}

- (BADeveloperDebugServerMessage)initWithMessageOperation:(int64_t)a3
{
  BADeveloperDebugServerMessage *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BADeveloperDebugServerMessage;
  result = -[BADeveloperDebugMessage init](&v5, "init");
  if (result)
    result->_messageOperation = a3;
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (Class)classForMessageOperation:(int64_t)a3
{
  uint64_t v3;

  if (a3 != 1)
    return (Class)0;
  v3 = objc_opt_class(BADeveloperDebugServerMessageVersionCheck, a2);
  return (Class)(id)objc_claimAutoreleasedReturnValue(v3);
}

- (int64_t)messageOperation
{
  return self->_messageOperation;
}

- (void)setMessageOperation:(int64_t)a3
{
  self->_messageOperation = a3;
}

- (BOOL)versionSupported
{
  return self->_versionSupported;
}

- (void)setVersionSupported:(BOOL)a3
{
  self->_versionSupported = a3;
}

- (NSString)unsupportedVersionFailureMessage
{
  return self->_unsupportedVersionFailureMessage;
}

- (void)setUnsupportedVersionFailureMessage:(id)a3
{
  objc_storeStrong((id *)&self->_unsupportedVersionFailureMessage, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unsupportedVersionFailureMessage, 0);
}

@end
