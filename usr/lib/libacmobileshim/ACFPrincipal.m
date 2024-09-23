@implementation ACFPrincipal

+ (ACFPrincipal)principalWithUserName:(id)a3 realm:(id)a4
{
  void *v6;

  v6 = (void *)objc_opt_new();
  objc_msgSend(v6, "setUserName:", objc_msgSend((id)objc_msgSend(a3, "stringByTrimmingCharactersInSet:", objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet")), "lowercaseString"));
  objc_msgSend(v6, "setRealm:", a4);
  return (ACFPrincipal *)v6;
}

+ (ACFPrincipal)principalWithPrincipalString:(id)a3
{
  void *v4;

  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setPrincipalString:", a3);
  return (ACFPrincipal *)v4;
}

- (void)dealloc
{
  objc_super v3;

  -[ACFPrincipal setPrincipalString:](self, "setPrincipalString:", 0);
  v3.receiver = self;
  v3.super_class = (Class)ACFPrincipal;
  -[ACFPrincipal dealloc](&v3, sel_dealloc);
}

- (id)description
{
  id result;
  void *v4;
  const __CFString *v5;
  const __CFString *v6;

  result = -[ACFPrincipal principalString](self, "principalString");
  if (!result)
  {
    v4 = (void *)MEMORY[0x24BDD17C8];
    if (-[ACFPrincipal userName](self, "userName"))
      v5 = (const __CFString *)mapUserName((uint64_t)-[ACFPrincipal userName](self, "userName"));
    else
      v5 = CFSTR("<NULL>");
    if (-[ACFPrincipal realm](self, "realm"))
      v6 = -[ACFPrincipal realm](self, "realm");
    else
      v6 = CFSTR("<NULL>");
    return (id)objc_msgSend(v4, "stringWithFormat:", CFSTR("%@@%@"), v5, v6);
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setUserName:", -[ACFPrincipal userName](self, "userName"));
  objc_msgSend(v4, "setRealm:", -[ACFPrincipal realm](self, "realm"));
  return v4;
}

- (ACFPrincipal)initWithCoder:(id)a3
{
  ACFPrincipal *v4;
  uint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ACFPrincipal;
  v4 = -[ACFPrincipal init](&v7, sel_init);
  if (v4)
  {
    if (objc_msgSend(a3, "allowsKeyedCoding"))
    {
      -[ACFPrincipal setUserName:](v4, "setUserName:", objc_msgSend(a3, "decodeObjectForKey:", CFSTR("ACFPrincipalName")));
      v5 = objc_msgSend(a3, "decodeObjectForKey:", CFSTR("ACFPrincipalRealm"));
    }
    else
    {
      -[ACFPrincipal setUserName:](v4, "setUserName:", objc_msgSend(a3, "decodeObject"));
      v5 = objc_msgSend(a3, "decodeObject");
    }
    -[ACFPrincipal setRealm:](v4, "setRealm:", v5);
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  objc_sync_enter(self);
  if (objc_msgSend(a3, "allowsKeyedCoding"))
  {
    objc_msgSend(a3, "encodeObject:forKey:", -[ACFPrincipal userName](self, "userName"), CFSTR("ACFPrincipalName"));
    objc_msgSend(a3, "encodeObject:forKey:", -[ACFPrincipal realm](self, "realm"), CFSTR("ACFPrincipalRealm"));
  }
  else
  {
    objc_msgSend(a3, "encodeObject:", -[ACFPrincipal userName](self, "userName"));
    objc_msgSend(a3, "encodeObject:", -[ACFPrincipal realm](self, "realm"));
  }
  objc_sync_exit(self);
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3)
    return 1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return objc_msgSend((id)objc_msgSend(a3, "principalString"), "isEqual:", -[ACFPrincipal principalString](self, "principalString"));
  else
    return 0;
}

- (unint64_t)hash
{
  return -[NSString hash](-[ACFPrincipal principalString](self, "principalString"), "hash");
}

- (void)setUserName:(id)a3
{
  NSString *userName;

  objc_sync_enter(self);
  if (!objc_msgSend(a3, "length"))
    a3 = 0;
  userName = self->_userName;
  if (userName != a3)
  {
    if (!a3)
    {
LABEL_7:

      self->_userName = (NSString *)a3;
      -[ACFPrincipal releaseCaches](self, "releaseCaches");
      goto LABEL_8;
    }
    if (!-[NSString isEqualToString:](userName, "isEqualToString:", a3))
    {
      userName = self->_userName;
      goto LABEL_7;
    }
  }
LABEL_8:
  objc_sync_exit(self);
}

- (void)setRealm:(id)a3
{
  NSString *realm;

  objc_sync_enter(self);
  if (!objc_msgSend(a3, "length"))
    a3 = 0;
  realm = self->_realm;
  if (realm != a3)
  {
    if (!a3)
    {
LABEL_7:

      self->_realm = (NSString *)a3;
      -[ACFPrincipal releaseCaches](self, "releaseCaches");
      goto LABEL_8;
    }
    if (!-[NSString isEqualToString:](realm, "isEqualToString:", a3))
    {
      realm = self->_realm;
      goto LABEL_7;
    }
  }
LABEL_8:
  objc_sync_exit(self);
}

- (void)releaseCaches
{
  objc_sync_enter(self);
  -[ACFPrincipal willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("principalString"));

  self->_principalString = 0;
  -[ACFPrincipal didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("principalString"));
  objc_sync_exit(self);
}

- (NSString)principalString
{
  NSString *v3;

  objc_sync_enter(self);
  if (!self->_principalString
    && -[NSString length](-[ACFPrincipal userName](self, "userName"), "length")
    && -[NSString length](-[ACFPrincipal realm](self, "realm"), "length"))
  {
    self->_principalString = (NSString *)(id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@@%@"), mapUserName((uint64_t)-[ACFPrincipal userName](self, "userName")), -[ACFPrincipal realm](self, "realm"));
  }
  v3 = self->_principalString;
  objc_sync_exit(self);
  return v3;
}

- (void)setPrincipalString:(id)a3
{
  NSString *principalString;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;

  objc_sync_enter(self);
  if (a3)
  {
    principalString = self->_principalString;
    if (principalString != a3 && !-[NSString isEqualToString:](principalString, "isEqualToString:", a3))
    {
      v6 = (void *)objc_msgSend(a3, "componentsSeparatedByString:", CFSTR("@"));
      if (objc_msgSend(v6, "count") == 2)
      {
        v7 = objc_msgSend(v6, "objectAtIndex:", 0);
        v8 = (void *)objc_msgSend(MEMORY[0x24BDD16A8], "stringWithString:", v7);
        v9 = objc_msgSend(v8, "length");
        objc_msgSend(v8, "replaceOccurrencesOfString:withString:options:range:", CFSTR("#"), CFSTR(" "), 0, 0, v9);
        objc_msgSend(v8, "replaceOccurrencesOfString:withString:options:range:", CFSTR("%"), CFSTR("@"), 0, 0, v9);
        -[ACFPrincipal setUserName:](self, "setUserName:", (id)objc_msgSend(v8, "copy"));
        -[ACFPrincipal setRealm:](self, "setRealm:", objc_msgSend(v6, "objectAtIndex:", 1));
      }
    }
  }
  else
  {
    -[ACFPrincipal setUserName:](self, "setUserName:", 0);
    -[ACFPrincipal setRealm:](self, "setRealm:", 0);
  }
  objc_sync_exit(self);
}

- (NSString)userName
{
  return self->_userName;
}

- (NSString)realm
{
  return self->_realm;
}

@end
