@implementation DYGTMTLCaptureScopeInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DYGTMTLCaptureScopeInfo)initWithCoder:(id)a3
{
  id v4;
  DYGTMTLCaptureScopeInfo *v5;
  id v6;
  uint64_t v7;
  NSString *label;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)DYGTMTLCaptureScopeInfo;
  v5 = -[DYGTMTLCaptureScopeInfo init](&v10, "init");
  if (v5)
  {
    v5->_deviceAddress = (unint64_t)objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("deviceAddress"));
    v5->_deviceStreamRef = (unint64_t)objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("deviceStreamRef"));
    v5->_commandQueueStreamRef = (unint64_t)objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("commandQueueStreamRef"));
    v5->_scopeAddress = (unint64_t)objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("scopeAddress"));
    v5->_scopeStreamRef = (unint64_t)objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("scopeStreamRef"));
    v6 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("label"));
    v7 = objc_claimAutoreleasedReturnValue(v6);
    label = v5->_label;
    v5->_label = (NSString *)v7;

    v5->_isDefaultCapturable = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isDefaultCapturable"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t deviceAddress;
  id v5;

  deviceAddress = self->_deviceAddress;
  v5 = a3;
  objc_msgSend(v5, "encodeInt64:forKey:", deviceAddress, CFSTR("deviceAddress"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_deviceStreamRef, CFSTR("deviceStreamRef"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_commandQueueStreamRef, CFSTR("commandQueueStreamRef"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_scopeAddress, CFSTR("scopeAddress"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_scopeStreamRef, CFSTR("scopeStreamRef"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_label, CFSTR("label"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isDefaultCapturable, CFSTR("isDefaultCapturable"));

}

- (unint64_t)deviceAddress
{
  return self->_deviceAddress;
}

- (void)setDeviceAddress:(unint64_t)a3
{
  self->_deviceAddress = a3;
}

- (unint64_t)deviceStreamRef
{
  return self->_deviceStreamRef;
}

- (void)setDeviceStreamRef:(unint64_t)a3
{
  self->_deviceStreamRef = a3;
}

- (unint64_t)commandQueueStreamRef
{
  return self->_commandQueueStreamRef;
}

- (void)setCommandQueueStreamRef:(unint64_t)a3
{
  self->_commandQueueStreamRef = a3;
}

- (unint64_t)scopeAddress
{
  return self->_scopeAddress;
}

- (void)setScopeAddress:(unint64_t)a3
{
  self->_scopeAddress = a3;
}

- (unint64_t)scopeStreamRef
{
  return self->_scopeStreamRef;
}

- (void)setScopeStreamRef:(unint64_t)a3
{
  self->_scopeStreamRef = a3;
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (BOOL)isDefaultCapturable
{
  return self->_isDefaultCapturable;
}

- (void)setIsDefaultCapturable:(BOOL)a3
{
  self->_isDefaultCapturable = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
}

@end
