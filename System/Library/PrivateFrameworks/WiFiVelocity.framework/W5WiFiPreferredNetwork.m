@implementation W5WiFiPreferredNetwork

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)W5WiFiPreferredNetwork;
  -[W5WiFiPreferredNetwork dealloc](&v3, sel_dealloc);
}

- (id)description
{
  void *v3;
  const char *v4;
  const char *v5;
  const char *v6;
  const char *v7;
  const char *v8;
  id v9;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDD16A8], "stringWithCapacity:", 0);
  objc_msgSend(v3, "appendFormat:", CFSTR("SSID: %@ (%@)\n"), -[W5WiFiPreferredNetwork ssidString](self, "ssidString"), -[W5WiFiPreferredNetwork ssid](self, "ssid"));
  objc_msgSend(v3, "appendFormat:", CFSTR("Security: %@\n"), W5DescriptionForSecurity(self->_security));
  if (self->_isPasspoint)
    v4 = "Yes";
  else
    v4 = "No";
  objc_msgSend(v3, "appendFormat:", CFSTR("isPasspoint: %s\n"), v4);
  objc_msgSend(v3, "appendFormat:", CFSTR("Domain Name: %@\n"), self->_domainName);
  if (self->_isEnabled)
    v5 = "Yes";
  else
    v5 = "No";
  objc_msgSend(v3, "appendFormat:", CFSTR("isEnabled: %s\n"), v5);
  if (self->_isCaptive)
    v6 = "Yes";
  else
    v6 = "No";
  objc_msgSend(v3, "appendFormat:", CFSTR("isCaptive: %s\n"), v6);
  if (self->_isHidden)
    v7 = "Yes";
  else
    v7 = "No";
  objc_msgSend(v3, "appendFormat:", CFSTR("isHidden: %s\n"), v7);
  if (self->_isMultiAP)
    v8 = "Yes";
  else
    v8 = "No";
  objc_msgSend(v3, "appendFormat:", CFSTR("isMultiAP: %s\n"), v8);
  v9 = objc_alloc_init(MEMORY[0x24BDD1500]);
  objc_msgSend(v9, "setDateStyle:", 0);
  objc_msgSend(v9, "setTimeStyle:", 2);
  objc_msgSend(v9, "setLocale:", objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale"));
  objc_msgSend(v3, "appendFormat:", CFSTR("Last Joined: %@\n"), objc_msgSend(v9, "stringFromDate:", self->_lastJoinedTimestamp));
  return (id)objc_msgSend(v3, "copy");
}

- (BOOL)conformsToProtocol:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)W5WiFiPreferredNetwork;
  if (-[W5WiFiPreferredNetwork conformsToProtocol:](&v5, sel_conformsToProtocol_)
    || (objc_msgSend(a3, "isEqual:", &unk_2545B0870) & 1) != 0)
  {
    return 1;
  }
  else
  {
    return objc_msgSend(a3, "isEqual:", &unk_2545B06D8);
  }
}

- (BOOL)isEqualToPreferredNetwork:(id)a3
{
  return -[NSString isEqualToString:](-[W5WiFiPreferredNetwork identifier](self, "identifier"), "isEqualToString:", objc_msgSend(a3, "identifier"));
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self)
    return 1;
  if (a3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      return -[W5WiFiPreferredNetwork isEqualToPreferredNetwork:](self, "isEqualToPreferredNetwork:", a3);
  }
  return 0;
}

- (unint64_t)hash
{
  return -[NSString hash](-[W5WiFiPreferredNetwork identifier](self, "identifier"), "hash");
}

- (id)copyWithZone:(_NSZone *)a3
{
  W5WiFiPreferredNetwork *v4;

  v4 = -[W5WiFiPreferredNetwork init](+[W5WiFiPreferredNetwork allocWithZone:](W5WiFiPreferredNetwork, "allocWithZone:", a3), "init");
  -[W5WiFiPreferredNetwork setIdentifier:](v4, "setIdentifier:", self->_identifier);
  -[W5WiFiPreferredNetwork setSsid:](v4, "setSsid:", self->_ssid);
  -[W5WiFiPreferredNetwork setSsidString:](v4, "setSsidString:", self->_ssidString);
  -[W5WiFiPreferredNetwork setDomainName:](v4, "setDomainName:", self->_domainName);
  -[W5WiFiPreferredNetwork setSecurity:](v4, "setSecurity:", self->_security);
  -[W5WiFiPreferredNetwork setIsEnabled:](v4, "setIsEnabled:", self->_isEnabled);
  -[W5WiFiPreferredNetwork setIsHidden:](v4, "setIsHidden:", self->_isHidden);
  -[W5WiFiPreferredNetwork setIsCaptive:](v4, "setIsCaptive:", self->_isCaptive);
  -[W5WiFiPreferredNetwork setIsPasspoint:](v4, "setIsPasspoint:", self->_isPasspoint);
  -[W5WiFiPreferredNetwork setIsMultiAP:](v4, "setIsMultiAP:", self->_isMultiAP);
  -[W5WiFiPreferredNetwork setLastJoinedTimestamp:](v4, "setLastJoinedTimestamp:", self->_lastJoinedTimestamp);
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_identifier, CFSTR("_identifier"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_ssid, CFSTR("_ssid"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_ssidString, CFSTR("_ssidString"));
  objc_msgSend(a3, "encodeInteger:forKey:", self->_security, CFSTR("_security"));
  objc_msgSend(a3, "encodeBool:forKey:", self->_isEnabled, CFSTR("_isEnabled"));
  objc_msgSend(a3, "encodeBool:forKey:", self->_isHidden, CFSTR("_isHidden"));
  objc_msgSend(a3, "encodeBool:forKey:", self->_isCaptive, CFSTR("_isCaptive"));
  objc_msgSend(a3, "encodeBool:forKey:", self->_isPasspoint, CFSTR("_isPasspoint"));
  objc_msgSend(a3, "encodeBool:forKey:", self->_isMultiAP, CFSTR("_isMultiAP"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_domainName, CFSTR("_domainName"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_lastJoinedTimestamp, CFSTR("_lastJoinedTimestamp"));
}

- (W5WiFiPreferredNetwork)initWithCoder:(id)a3
{
  W5WiFiPreferredNetwork *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)W5WiFiPreferredNetwork;
  v4 = -[W5WiFiPreferredNetwork init](&v6, sel_init);
  if (v4)
  {
    v4->_identifier = (NSString *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_identifier")), "copy");
    v4->_ssid = (NSData *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_ssid")), "copy");
    v4->_ssidString = (NSString *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_ssidString")), "copy");
    v4->_security = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("_security"));
    v4->_isEnabled = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("_isEnabled"));
    v4->_isHidden = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("_isHidden"));
    v4->_isCaptive = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("_isCaptive"));
    v4->_isPasspoint = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("_isPasspoint"));
    v4->_isMultiAP = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("_isMultiAP"));
    v4->_domainName = (NSString *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_domainName")), "copy");
    v4->_lastJoinedTimestamp = (NSDate *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_lastJoinedTimestamp")), "copy");
  }
  return v4;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)ssidString
{
  return self->_ssidString;
}

- (void)setSsidString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSData)ssid
{
  return self->_ssid;
}

- (void)setSsid:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (int64_t)security
{
  return self->_security;
}

- (void)setSecurity:(int64_t)a3
{
  self->_security = a3;
}

- (BOOL)isEnabled
{
  return self->_isEnabled;
}

- (void)setIsEnabled:(BOOL)a3
{
  self->_isEnabled = a3;
}

- (BOOL)isPasspoint
{
  return self->_isPasspoint;
}

- (void)setIsPasspoint:(BOOL)a3
{
  self->_isPasspoint = a3;
}

- (NSString)domainName
{
  return self->_domainName;
}

- (void)setDomainName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (BOOL)isCaptive
{
  return self->_isCaptive;
}

- (void)setIsCaptive:(BOOL)a3
{
  self->_isCaptive = a3;
}

- (BOOL)isHidden
{
  return self->_isHidden;
}

- (void)setIsHidden:(BOOL)a3
{
  self->_isHidden = a3;
}

- (BOOL)isMultiAP
{
  return self->_isMultiAP;
}

- (void)setIsMultiAP:(BOOL)a3
{
  self->_isMultiAP = a3;
}

- (NSDate)lastJoinedTimestamp
{
  return self->_lastJoinedTimestamp;
}

- (void)setLastJoinedTimestamp:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

@end
