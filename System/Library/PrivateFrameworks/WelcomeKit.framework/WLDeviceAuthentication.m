@implementation WLDeviceAuthentication

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (WLDeviceAuthentication)init
{
  WLDeviceAuthentication *v2;
  const __CFUUID *v3;
  CFStringRef v4;
  NSString *sessionUUID;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WLDeviceAuthentication;
  v2 = -[WLDeviceAuthentication init](&v7, sel_init);
  if (v2)
  {
    v3 = CFUUIDCreate((CFAllocatorRef)*MEMORY[0x24BDBD240]);
    v4 = CFUUIDCreateString(0, v3);
    sessionUUID = v2->_sessionUUID;
    v2->_sessionUUID = &v4->isa;

    CFRelease(v3);
  }
  return v2;
}

- (WLDeviceAuthentication)initWithCoder:(id)a3
{
  id v4;
  WLDeviceAuthentication *v5;
  uint64_t v6;
  NSString *sessionUUID;

  v4 = a3;
  v5 = -[WLDeviceAuthentication init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_sessionUUID"));
    v6 = objc_claimAutoreleasedReturnValue();
    sessionUUID = v5->_sessionUUID;
    v5->_sessionUUID = (NSString *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_sessionUUID, CFSTR("_sessionUUID"));
}

- (NSString)sessionUUID
{
  return self->_sessionUUID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionUUID, 0);
}

@end
