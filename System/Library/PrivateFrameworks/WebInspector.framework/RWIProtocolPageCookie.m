@implementation RWIProtocolPageCookie

- (RWIProtocolPageCookie)initWithName:(id)a3 value:(id)a4 domain:(id)a5 path:(id)a6 expires:(double)a7 session:(BOOL)a8 httpOnly:(BOOL)a9 secure:(BOOL)a10 sameSite:(int64_t)a11
{
  _BOOL8 v11;
  _BOOL8 v12;
  id v18;
  id v19;
  id v20;
  id v21;
  RWIProtocolPageCookie *v22;
  RWIProtocolPageCookie *v23;
  objc_super v25;

  v11 = a9;
  v12 = a8;
  v18 = a3;
  v19 = a4;
  v20 = a5;
  v21 = a6;
  v25.receiver = self;
  v25.super_class = (Class)RWIProtocolPageCookie;
  v22 = -[RWIProtocolJSONObject init](&v25, sel_init);
  if (v22)
  {
    if (!v18)
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("required property '%@' cannot be nil"), CFSTR("name"));
    if (!v19)
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("required property '%@' cannot be nil"), CFSTR("value"));
    if (!v20)
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("required property '%@' cannot be nil"), CFSTR("domain"));
    if (!v21)
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("required property '%@' cannot be nil"), CFSTR("path"));
    -[RWIProtocolPageCookie setName:](v22, "setName:", v18);
    -[RWIProtocolPageCookie setValue:](v22, "setValue:", v19);
    -[RWIProtocolPageCookie setDomain:](v22, "setDomain:", v20);
    -[RWIProtocolPageCookie setPath:](v22, "setPath:", v21);
    -[RWIProtocolPageCookie setExpires:](v22, "setExpires:", a7);
    -[RWIProtocolPageCookie setSession:](v22, "setSession:", v12);
    -[RWIProtocolPageCookie setHttpOnly:](v22, "setHttpOnly:", v11);
    -[RWIProtocolPageCookie setSecure:](v22, "setSecure:", a10);
    -[RWIProtocolPageCookie setSameSite:](v22, "setSameSite:", a11);
    v23 = v22;
  }

  return v22;
}

- (void)setName:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolPageCookie;
  -[RWIProtocolJSONObject setString:forKey:](&v3, sel_setString_forKey_, a3, CFSTR("name"));
}

- (NSString)name
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolPageCookie;
  -[RWIProtocolJSONObject stringForKey:](&v3, sel_stringForKey_, CFSTR("name"));
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setValue:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolPageCookie;
  -[RWIProtocolJSONObject setString:forKey:](&v3, sel_setString_forKey_, a3, CFSTR("value"));
}

- (NSString)value
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolPageCookie;
  -[RWIProtocolJSONObject stringForKey:](&v3, sel_stringForKey_, CFSTR("value"));
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setDomain:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolPageCookie;
  -[RWIProtocolJSONObject setString:forKey:](&v3, sel_setString_forKey_, a3, CFSTR("domain"));
}

- (NSString)domain
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolPageCookie;
  -[RWIProtocolJSONObject stringForKey:](&v3, sel_stringForKey_, CFSTR("domain"));
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setPath:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolPageCookie;
  -[RWIProtocolJSONObject setString:forKey:](&v3, sel_setString_forKey_, a3, CFSTR("path"));
}

- (NSString)path
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolPageCookie;
  -[RWIProtocolJSONObject stringForKey:](&v3, sel_stringForKey_, CFSTR("path"));
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setExpires:(double)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolPageCookie;
  -[RWIProtocolJSONObject setDouble:forKey:](&v3, sel_setDouble_forKey_, CFSTR("expires"), a3);
}

- (double)expires
{
  double result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolPageCookie;
  -[RWIProtocolJSONObject doubleForKey:](&v3, sel_doubleForKey_, CFSTR("expires"));
  return result;
}

- (void)setSession:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolPageCookie;
  -[RWIProtocolJSONObject setBool:forKey:](&v3, sel_setBool_forKey_, a3, CFSTR("session"));
}

- (BOOL)session
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolPageCookie;
  return -[RWIProtocolJSONObject BOOLForKey:](&v3, sel_BOOLForKey_, CFSTR("session"));
}

- (void)setHttpOnly:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolPageCookie;
  -[RWIProtocolJSONObject setBool:forKey:](&v3, sel_setBool_forKey_, a3, CFSTR("httpOnly"));
}

- (BOOL)httpOnly
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolPageCookie;
  return -[RWIProtocolJSONObject BOOLForKey:](&v3, sel_BOOLForKey_, CFSTR("httpOnly"));
}

- (void)setSecure:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolPageCookie;
  -[RWIProtocolJSONObject setBool:forKey:](&v3, sel_setBool_forKey_, a3, CFSTR("secure"));
}

- (BOOL)secure
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolPageCookie;
  return -[RWIProtocolJSONObject BOOLForKey:](&v3, sel_BOOLForKey_, CFSTR("secure"));
}

- (void)setSameSite:(int64_t)a3
{
  _DWORD *v4;
  __CFString *v5;
  objc_super v6;
  _DWORD *v7;

  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v4 = v7;
  if (v7)
    v5 = (__CFString *)(id)WTF::StringImpl::operator NSString *();
  else
    v5 = &stru_24DE03408;
  v6.receiver = self;
  v6.super_class = (Class)RWIProtocolPageCookie;
  -[RWIProtocolJSONObject setString:forKey:](&v6, sel_setString_forKey_, v5, CFSTR("sameSite"));

  if (v4)
  {
    if (*v4 == 2)
      WTF::StringImpl::destroy();
    else
      *v4 -= 2;
  }
}

- (int64_t)sameSite
{
  id v2;
  unsigned __int8 *v3;
  unint64_t v4;
  uint64_t i;
  char *v6;
  _DWORD *v7;
  objc_super v9;
  uint64_t v10;

  v9.receiver = self;
  v9.super_class = (Class)RWIProtocolPageCookie;
  v2 = -[RWIProtocolJSONObject stringForKey:](&v9, sel_stringForKey_, CFSTR("sameSite"));
  MEMORY[0x2207574E0](&v10, v2);
  if (v10)
  {
    v3 = *(unsigned __int8 **)(v10 + 8);
    v4 = *(unsigned int *)(v10 + 4) | ((unint64_t)((*(_DWORD *)(v10 + 16) >> 2) & 1) << 32);
  }
  else
  {
    v3 = 0;
    v4 = 0x100000000;
  }
  for (i = 0; i != 9; i += 3)
  {
    if (WTF::operator==(v3, v4, (unsigned __int8 *)(&Inspector::fromProtocolString<RWIProtocolPageCookieSameSitePolicy>(WTF::String const&)::mappings)[i], (uint64_t)(&Inspector::fromProtocolString<RWIProtocolPageCookieSameSitePolicy>(WTF::String const&)::mappings)[i + 1]))
    {
      goto LABEL_8;
    }
  }
  do
  {
    std::__throw_bad_optional_access[abi:sn180100]();
    __break(1u);
LABEL_8:
    ;
  }
  while (i == 9);
  v6 = (&Inspector::fromProtocolString<RWIProtocolPageCookieSameSitePolicy>(WTF::String const&)::mappings)[i + 2];
  v7 = (_DWORD *)v10;
  v10 = 0;
  if (v7)
  {
    if (*v7 == 2)
      WTF::StringImpl::destroy();
    else
      *v7 -= 2;
  }
  return (int64_t)v6;
}

@end
