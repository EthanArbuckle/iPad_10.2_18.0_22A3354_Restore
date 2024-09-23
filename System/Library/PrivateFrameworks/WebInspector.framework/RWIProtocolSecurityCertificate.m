@implementation RWIProtocolSecurityCertificate

- (void)setSubject:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolSecurityCertificate;
  -[RWIProtocolJSONObject setString:forKey:](&v3, sel_setString_forKey_, a3, CFSTR("subject"));
}

- (NSString)subject
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolSecurityCertificate;
  -[RWIProtocolJSONObject stringForKey:](&v3, sel_stringForKey_, CFSTR("subject"));
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setValidFrom:(double)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolSecurityCertificate;
  -[RWIProtocolJSONObject setDouble:forKey:](&v3, sel_setDouble_forKey_, CFSTR("validFrom"), a3);
}

- (double)validFrom
{
  double result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolSecurityCertificate;
  -[RWIProtocolJSONObject doubleForKey:](&v3, sel_doubleForKey_, CFSTR("validFrom"));
  return result;
}

- (void)setValidUntil:(double)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolSecurityCertificate;
  -[RWIProtocolJSONObject setDouble:forKey:](&v3, sel_setDouble_forKey_, CFSTR("validUntil"), a3);
}

- (double)validUntil
{
  double result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolSecurityCertificate;
  -[RWIProtocolJSONObject doubleForKey:](&v3, sel_doubleForKey_, CFSTR("validUntil"));
  return result;
}

- (void)setDnsNames:(id)a3
{
  _DWORD *v4;
  objc_super v5;
  _DWORD *v6;

  Inspector::toJSONStringArray((Inspector *)a3, (uint64_t *)&v6);
  v5.receiver = self;
  v5.super_class = (Class)RWIProtocolSecurityCertificate;
  -[RWIProtocolJSONObject setJSONArray:forKey:](&v5, sel_setJSONArray_forKey_, &v6, CFSTR("dnsNames"));
  v4 = v6;
  v6 = 0;
  if (v4)
  {
    if (*v4 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*v4;
  }
}

- (NSArray)dnsNames
{
  void *v2;
  WTF::JSONImpl::ArrayBase *v3;
  objc_super v5;
  WTF::JSONImpl::ArrayBase *v6;

  v5.receiver = self;
  v5.super_class = (Class)RWIProtocolSecurityCertificate;
  -[RWIProtocolJSONObject JSONArrayForKey:](&v5, sel_JSONArrayForKey_, CFSTR("dnsNames"));
  Inspector::toObjCStringArray(&v6);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v6;
  v6 = 0;
  if (v3)
  {
    if (*(_DWORD *)v3 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*(_DWORD *)v3;
  }
  return (NSArray *)v2;
}

- (void)setIpAddresses:(id)a3
{
  _DWORD *v4;
  objc_super v5;
  _DWORD *v6;

  Inspector::toJSONStringArray((Inspector *)a3, (uint64_t *)&v6);
  v5.receiver = self;
  v5.super_class = (Class)RWIProtocolSecurityCertificate;
  -[RWIProtocolJSONObject setJSONArray:forKey:](&v5, sel_setJSONArray_forKey_, &v6, CFSTR("ipAddresses"));
  v4 = v6;
  v6 = 0;
  if (v4)
  {
    if (*v4 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*v4;
  }
}

- (NSArray)ipAddresses
{
  void *v2;
  WTF::JSONImpl::ArrayBase *v3;
  objc_super v5;
  WTF::JSONImpl::ArrayBase *v6;

  v5.receiver = self;
  v5.super_class = (Class)RWIProtocolSecurityCertificate;
  -[RWIProtocolJSONObject JSONArrayForKey:](&v5, sel_JSONArrayForKey_, CFSTR("ipAddresses"));
  Inspector::toObjCStringArray(&v6);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v6;
  v6 = 0;
  if (v3)
  {
    if (*(_DWORD *)v3 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*(_DWORD *)v3;
  }
  return (NSArray *)v2;
}

@end
