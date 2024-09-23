@implementation RWIProtocolSecurity

- (void)setConnection:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolSecurity;
  -[RWIProtocolJSONObject setObject:forKey:](&v3, sel_setObject_forKey_, a3, CFSTR("connection"));
}

- (RWIProtocolSecurityConnection)connection
{
  void *v3;
  RWIProtocolSecurityConnection *v4;
  void *v5;
  _DWORD *v6;
  RWIProtocolSecurityConnection *v7;
  _DWORD *v8;
  _DWORD *v9;
  objc_super v11;
  _DWORD *v12;
  _DWORD *v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)RWIProtocolSecurity;
  -[RWIProtocolJSONObject objectForKey:](&v14, sel_objectForKey_, CFSTR("connection"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = [RWIProtocolSecurityConnection alloc];
    v11.receiver = self;
    v11.super_class = (Class)RWIProtocolSecurity;
    -[RWIProtocolJSONObject objectForKey:](&v11, sel_objectForKey_, CFSTR("connection"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "toJSONObject");
    v6 = v12;
    ++*v12;
    v13 = v6;
    v7 = -[RWIProtocolJSONObject initWithJSONObject:](v4, "initWithJSONObject:", &v13);
    v8 = v13;
    v13 = 0;
    if (v8)
    {
      if (*v8 == 1)
        WTF::JSONImpl::Value::operator delete();
      else
        --*v8;
    }
    v9 = v12;
    v12 = 0;
    if (v9)
    {
      if (*v9 == 1)
        WTF::JSONImpl::Value::operator delete();
      else
        --*v9;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)setCertificate:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolSecurity;
  -[RWIProtocolJSONObject setObject:forKey:](&v3, sel_setObject_forKey_, a3, CFSTR("certificate"));
}

- (RWIProtocolSecurityCertificate)certificate
{
  void *v3;
  RWIProtocolSecurityCertificate *v4;
  void *v5;
  _DWORD *v6;
  RWIProtocolSecurityCertificate *v7;
  _DWORD *v8;
  _DWORD *v9;
  objc_super v11;
  _DWORD *v12;
  _DWORD *v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)RWIProtocolSecurity;
  -[RWIProtocolJSONObject objectForKey:](&v14, sel_objectForKey_, CFSTR("certificate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = [RWIProtocolSecurityCertificate alloc];
    v11.receiver = self;
    v11.super_class = (Class)RWIProtocolSecurity;
    -[RWIProtocolJSONObject objectForKey:](&v11, sel_objectForKey_, CFSTR("certificate"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "toJSONObject");
    v6 = v12;
    ++*v12;
    v13 = v6;
    v7 = -[RWIProtocolJSONObject initWithJSONObject:](v4, "initWithJSONObject:", &v13);
    v8 = v13;
    v13 = 0;
    if (v8)
    {
      if (*v8 == 1)
        WTF::JSONImpl::Value::operator delete();
      else
        --*v8;
    }
    v9 = v12;
    v12 = 0;
    if (v9)
    {
      if (*v9 == 1)
        WTF::JSONImpl::Value::operator delete();
      else
        --*v9;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

@end
