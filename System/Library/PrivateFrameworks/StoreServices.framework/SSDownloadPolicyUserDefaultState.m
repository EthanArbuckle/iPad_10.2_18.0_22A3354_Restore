@implementation SSDownloadPolicyUserDefaultState

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;

  v3 = -[NSString hash](self->_domain, "hash");
  v4 = -[NSNumber hash](self->_fallbackNumberValue, "hash") ^ v3;
  return v4 ^ -[NSString hash](self->_key, "hash") ^ self->_shouldInvertBoolValue;
}

- (BOOL)isEqual:(id)a3
{
  SSDownloadPolicyUserDefaultState *v4;
  NSString *domain;
  NSString *key;
  NSNumber *fallbackNumberValue;
  char v8;

  v4 = (SSDownloadPolicyUserDefaultState *)a3;
  if (v4 == self)
    goto LABEL_11;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || (domain = self->_domain, domain != v4->_domain) && !-[NSString isEqualToString:](domain, "isEqualToString:")
    || self->_shouldInvertBoolValue != v4->_shouldInvertBoolValue
    || (key = self->_key, key != v4->_key) && !-[NSString isEqualToString:](key, "isEqualToString:"))
  {
    v8 = 0;
    goto LABEL_12;
  }
  fallbackNumberValue = self->_fallbackNumberValue;
  if (fallbackNumberValue == v4->_fallbackNumberValue)
  {
LABEL_11:
    v8 = 1;
    goto LABEL_12;
  }
  v8 = -[NSNumber isEqual:](fallbackNumberValue, "isEqual:");
LABEL_12:

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *domain;
  id v5;

  domain = self->_domain;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", domain, CFSTR("domain"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_fallbackNumberValue, CFSTR("fallnumval"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_key, CFSTR("key"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_shouldInvertBoolValue, CFSTR("sibv"));

}

- (SSDownloadPolicyUserDefaultState)initWithCoder:(id)a3
{
  id v4;
  SSDownloadPolicyUserDefaultState *v5;
  uint64_t v6;
  NSString *domain;
  uint64_t v8;
  NSNumber *fallbackNumberValue;
  uint64_t v10;
  NSString *key;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SSDownloadPolicyUserDefaultState;
  v5 = -[SSDownloadPolicyUserDefaultState init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("domain"));
    v6 = objc_claimAutoreleasedReturnValue();
    domain = v5->_domain;
    v5->_domain = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("fallnumval"));
    v8 = objc_claimAutoreleasedReturnValue();
    fallbackNumberValue = v5->_fallbackNumberValue;
    v5->_fallbackNumberValue = (NSNumber *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("key"));
    v10 = objc_claimAutoreleasedReturnValue();
    key = v5->_key;
    v5->_key = (NSString *)v10;

    v5->_shouldInvertBoolValue = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("sibv"));
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  uint64_t v5;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = v4;
  if (v4)
  {
    objc_storeStrong((id *)(v4 + 8), self->_domain);
    objc_storeStrong((id *)(v5 + 16), self->_fallbackNumberValue);
    objc_storeStrong((id *)(v5 + 24), self->_key);
    *(_BYTE *)(v5 + 32) = self->_shouldInvertBoolValue;
  }
  return (id)v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyXPCEncoding
{
  xpc_object_t v3;

  v3 = xpc_dictionary_create(0, 0, 0);
  SSXPCDictionarySetCFObject(v3, "0", (__CFString *)self->_domain);
  SSXPCDictionarySetCFObject(v3, "1", (__CFString *)self->_fallbackNumberValue);
  SSXPCDictionarySetCFObject(v3, "2", (__CFString *)self->_key);
  xpc_dictionary_set_BOOL(v3, "3", self->_shouldInvertBoolValue);
  return v3;
}

- (SSDownloadPolicyUserDefaultState)initWithXPCEncoding:(id)a3
{
  id v4;
  void *v5;
  SSDownloadPolicyUserDefaultState *v6;
  CFArrayRef v8;
  NSString *domain;
  CFArrayRef v10;
  NSNumber *fallbackNumberValue;
  CFArrayRef v12;
  NSString *key;
  objc_super v14;

  v4 = a3;
  v5 = v4;
  if (v4 && MEMORY[0x1A85863E4](v4) == MEMORY[0x1E0C812F8])
  {
    v14.receiver = self;
    v14.super_class = (Class)SSDownloadPolicyUserDefaultState;
    v6 = -[SSDownloadPolicyUserDefaultState init](&v14, sel_init);
    if (v6)
    {
      objc_opt_class();
      v8 = SSXPCDictionaryCopyCFObjectWithClass(v5, "0");
      domain = v6->_domain;
      v6->_domain = (NSString *)v8;

      objc_opt_class();
      v10 = SSXPCDictionaryCopyCFObjectWithClass(v5, "1");
      fallbackNumberValue = v6->_fallbackNumberValue;
      v6->_fallbackNumberValue = (NSNumber *)v10;

      objc_opt_class();
      v12 = SSXPCDictionaryCopyCFObjectWithClass(v5, "2");
      key = v6->_key;
      v6->_key = (NSString *)v12;

      v6->_shouldInvertBoolValue = xpc_dictionary_get_BOOL(v5, "3");
    }
  }
  else
  {

    v6 = 0;
  }

  return v6;
}

- (BOOL)currentBoolValue
{
  const __CFString *key;
  const __CFString *domain;
  BOOL v5;
  Boolean keyExistsAndHasValidFormat;

  keyExistsAndHasValidFormat = 0;
  key = (const __CFString *)self->_key;
  if (!key
    || (domain = (const __CFString *)self->_domain) == 0
    || (v5 = CFPreferencesGetAppBooleanValue(key, domain, &keyExistsAndHasValidFormat) != 0, !keyExistsAndHasValidFormat))
  {
    v5 = -[NSNumber BOOLValue](self->_fallbackNumberValue, "BOOLValue");
  }
  return v5 ^ self->_shouldInvertBoolValue;
}

- (NSString)domain
{
  return self->_domain;
}

- (void)setDomain:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSNumber)fallbackNumberValue
{
  return self->_fallbackNumberValue;
}

- (void)setFallbackNumberValue:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)key
{
  return self->_key;
}

- (void)setKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (BOOL)shouldInvertBoolValue
{
  return self->_shouldInvertBoolValue;
}

- (void)setShouldInvertBoolValue:(BOOL)a3
{
  self->_shouldInvertBoolValue = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_fallbackNumberValue, 0);
  objc_storeStrong((id *)&self->_domain, 0);
}

@end
