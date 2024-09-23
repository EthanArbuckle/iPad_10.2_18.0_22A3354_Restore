@implementation MBKeychainItem

+ (id)keychainItemWithAttributes:(id)a3
{
  return -[MBKeychainItem initWithAttributes:]([MBKeychainItem alloc], "initWithAttributes:", a3);
}

- (MBKeychainItem)initWithAttributes:(id)a3
{
  MBKeychainItem *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MBKeychainItem;
  v4 = -[MBKeychainItem init](&v6, "init");
  if (v4)
    v4->_attributes = (NSMutableDictionary *)objc_msgSend(a3, "mutableCopy");
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MBKeychainItem;
  -[MBKeychainItem dealloc](&v3, "dealloc");
}

- (NSString)serviceName
{
  return (NSString *)-[NSMutableDictionary objectForKeyedSubscript:](self->_attributes, "objectForKeyedSubscript:", kSecAttrService);
}

- (void)setServiceName:(id)a3
{
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_attributes, "setObject:forKeyedSubscript:", a3, kSecAttrService);
}

- (NSString)accountName
{
  return (NSString *)-[NSMutableDictionary objectForKeyedSubscript:](self->_attributes, "objectForKeyedSubscript:", kSecAttrAccount);
}

- (void)setAccountName:(id)a3
{
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_attributes, "setObject:forKeyedSubscript:", a3, kSecAttrAccount);
}

- (NSString)accessGroupName
{
  return (NSString *)-[NSMutableDictionary objectForKeyedSubscript:](self->_attributes, "objectForKeyedSubscript:", kSecAttrAccessGroup);
}

- (void)setAccessGroupName:(id)a3
{
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_attributes, "setObject:forKeyedSubscript:", a3, kSecAttrAccessGroup);
}

- (NSString)accessibilityType
{
  return (NSString *)-[NSMutableDictionary objectForKeyedSubscript:](self->_attributes, "objectForKeyedSubscript:", kSecAttrAccessible);
}

- (void)setAccessibilityType:(id)a3
{
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_attributes, "setObject:forKeyedSubscript:", a3, kSecAttrAccessible);
}

- (NSData)valueData
{
  return (NSData *)-[NSMutableDictionary objectForKeyedSubscript:](self->_attributes, "objectForKeyedSubscript:", kSecValueData);
}

- (void)setValueData:(id)a3
{
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_attributes, "setObject:forKeyedSubscript:", a3, kSecValueData);
}

- (id)description
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: service=%@, account=%@, accessGroup=%@, accessibility=%@>"), objc_opt_class(self), -[MBKeychainItem serviceName](self, "serviceName"), -[MBKeychainItem accountName](self, "accountName"), -[MBKeychainItem accessGroupName](self, "accessGroupName"), -[MBKeychainItem accessibilityType](self, "accessibilityType"));
}

- (NSMutableDictionary)attributes
{
  return self->_attributes;
}

@end
