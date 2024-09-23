@implementation PBResponseMetadata

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PBResponseMetadata)initWithAuthorizationStartTime:(unint64_t)a3 authorizationEndTime:(unint64_t)a4 authorizationAdmonished:(BOOL)a5
{
  PBResponseMetadata *result;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PBResponseMetadata;
  result = -[PBResponseMetadata init](&v9, sel_init);
  if (result)
  {
    result->_authorizationMachAbsoluteStartTime = a3;
    result->_authorizationMachAbsoluteEndTime = a4;
    result->_authorizationAdmonished = a5;
  }
  return result;
}

- (PBResponseMetadata)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("authorizationStartTime"));
  v6 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("authorizationEndTime"));
  v7 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("authorizationAdmonished"));

  return -[PBResponseMetadata initWithAuthorizationStartTime:authorizationEndTime:authorizationAdmonished:](self, "initWithAuthorizationStartTime:authorizationEndTime:authorizationAdmonished:", v5, v6, v7);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeInt64:forKey:", -[PBResponseMetadata authorizationMachAbsoluteStartTime](self, "authorizationMachAbsoluteStartTime"), CFSTR("authorizationStartTime"));
  objc_msgSend(v4, "encodeInt64:forKey:", -[PBResponseMetadata authorizationMachAbsoluteEndTime](self, "authorizationMachAbsoluteEndTime"), CFSTR("authorizationEndTime"));
  objc_msgSend(v4, "encodeBool:forKey:", -[PBResponseMetadata isAuthorizationAdmonished](self, "isAuthorizationAdmonished"), CFSTR("authorizationAdmonished"));

}

- (unint64_t)authorizationMachAbsoluteStartTime
{
  return self->_authorizationMachAbsoluteStartTime;
}

- (unint64_t)authorizationMachAbsoluteEndTime
{
  return self->_authorizationMachAbsoluteEndTime;
}

- (BOOL)isAuthorizationAdmonished
{
  return self->_authorizationAdmonished;
}

@end
