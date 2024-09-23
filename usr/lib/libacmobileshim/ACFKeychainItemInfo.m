@implementation ACFKeychainItemInfo

+ (id)keychainItemInfo
{
  return (id)objc_opt_new();
}

+ (id)keychainItemInfoWithAttributes:(id)a3
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithAttributes:", a3);
}

- (ACFKeychainItemInfo)init
{
  ACFKeychainItemInfo *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ACFKeychainItemInfo;
  v2 = -[ACFKeychainItemInfo init](&v4, sel_init);
  if (v2)
    -[ACFKeychainItemInfo setAttributeDictionary:](v2, "setAttributeDictionary:", objc_msgSend(MEMORY[0x24BDBCED8], "dictionary"));
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;

  v5 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  objc_msgSend(v5, "setAttributeDictionary:", (id)-[NSMutableDictionary mutableCopyWithZone:](-[ACFKeychainItemInfo attributeDictionary](self, "attributeDictionary"), "mutableCopyWithZone:", a3));
  return v5;
}

- (ACFKeychainItemInfo)initWithAttributes:(id)a3
{
  ACFKeychainItemInfo *v4;
  objc_super v6;
  objc_super v7;

  if (a3)
  {
    v6.receiver = self;
    v6.super_class = (Class)ACFKeychainItemInfo;
    v4 = -[ACFKeychainItemInfo init](&v6, sel_init);
    if (v4)
      -[ACFKeychainItemInfo setAttributeDictionary:](v4, "setAttributeDictionary:", objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithDictionary:", a3));
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)ACFKeychainItemInfo;
    -[ACFKeychainItemInfo dealloc](&v7, sel_dealloc);
    return 0;
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  -[ACFKeychainItemInfo setAttributeDictionary:](self, "setAttributeDictionary:", 0);
  v3.receiver = self;
  v3.super_class = (Class)ACFKeychainItemInfo;
  -[ACFKeychainItemInfo dealloc](&v3, sel_dealloc);
}

- (NSDictionary)attributes
{
  return (NSDictionary *)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", -[ACFKeychainItemInfo attributeDictionary](self, "attributeDictionary"));
}

- (void)setClassCode:(id)a3
{
  NSMutableDictionary *v4;

  if (a3)
  {
    v4 = -[ACFKeychainItemInfo attributeDictionary](self, "attributeDictionary");
    -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", a3, *MEMORY[0x24BDE9220]);
  }
}

- (id)classCode
{
  NSMutableDictionary *v2;

  v2 = -[ACFKeychainItemInfo attributeDictionary](self, "attributeDictionary");
  return (id)-[NSMutableDictionary objectForKey:](v2, "objectForKey:", *MEMORY[0x24BDE9220]);
}

- (void)setAccessGroup:(id)a3
{
  NSMutableDictionary *v4;

  v4 = -[ACFKeychainItemInfo attributeDictionary](self, "attributeDictionary");
  if (a3)
    -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", a3, *MEMORY[0x24BDE8F50]);
  else
    -[NSMutableDictionary removeObjectForKey:](v4, "removeObjectForKey:", *MEMORY[0x24BDE8F50]);
}

- (NSString)accessGroup
{
  NSMutableDictionary *v2;

  v2 = -[ACFKeychainItemInfo attributeDictionary](self, "attributeDictionary");
  return (NSString *)-[NSMutableDictionary objectForKey:](v2, "objectForKey:", *MEMORY[0x24BDE8F50]);
}

- (void)setCreationDate:(id)a3
{
  NSMutableDictionary *v4;

  if (a3)
  {
    v4 = -[ACFKeychainItemInfo attributeDictionary](self, "attributeDictionary");
    -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", a3, *MEMORY[0x24BDE8FE0]);
  }
}

- (NSDate)creationDate
{
  NSMutableDictionary *v2;

  v2 = -[ACFKeychainItemInfo attributeDictionary](self, "attributeDictionary");
  return (NSDate *)-[NSMutableDictionary objectForKey:](v2, "objectForKey:", *MEMORY[0x24BDE8FE0]);
}

- (void)setModificationDate:(id)a3
{
  NSMutableDictionary *v4;

  if (a3)
  {
    v4 = -[ACFKeychainItemInfo attributeDictionary](self, "attributeDictionary");
    -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", a3, *MEMORY[0x24BDE90A8]);
  }
}

- (NSDate)modificationDate
{
  NSMutableDictionary *v2;

  v2 = -[ACFKeychainItemInfo attributeDictionary](self, "attributeDictionary");
  return (NSDate *)-[NSMutableDictionary objectForKey:](v2, "objectForKey:", *MEMORY[0x24BDE90A8]);
}

- (void)setDescription:(id)a3
{
  NSMutableDictionary *v4;

  if (a3)
  {
    v4 = -[ACFKeychainItemInfo attributeDictionary](self, "attributeDictionary");
    -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", a3, *MEMORY[0x24BDE8FF0]);
  }
}

- (NSString)description
{
  NSMutableDictionary *v2;

  v2 = -[ACFKeychainItemInfo attributeDictionary](self, "attributeDictionary");
  return (NSString *)-[NSMutableDictionary objectForKey:](v2, "objectForKey:", *MEMORY[0x24BDE8FF0]);
}

- (void)setComment:(id)a3
{
  NSMutableDictionary *v4;

  if (a3)
  {
    v4 = -[ACFKeychainItemInfo attributeDictionary](self, "attributeDictionary");
    -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", a3, *MEMORY[0x24BDE8FD8]);
  }
}

- (NSString)comment
{
  NSMutableDictionary *v2;

  v2 = -[ACFKeychainItemInfo attributeDictionary](self, "attributeDictionary");
  return (NSString *)-[NSMutableDictionary objectForKey:](v2, "objectForKey:", *MEMORY[0x24BDE8FD8]);
}

- (void)setCreator:(unint64_t)a3
{
  NSMutableDictionary *v4;
  uint64_t v5;

  v4 = -[ACFKeychainItemInfo attributeDictionary](self, "attributeDictionary");
  v5 = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
  -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v5, *MEMORY[0x24BDE8FE8]);
}

- (unint64_t)creator
{
  NSMutableDictionary *v2;

  v2 = -[ACFKeychainItemInfo attributeDictionary](self, "attributeDictionary");
  return objc_msgSend((id)-[NSMutableDictionary objectForKey:](v2, "objectForKey:", *MEMORY[0x24BDE8FE8]), "unsignedIntegerValue");
}

- (void)setType:(unint64_t)a3
{
  NSMutableDictionary *v4;
  uint64_t v5;

  v4 = -[ACFKeychainItemInfo attributeDictionary](self, "attributeDictionary");
  v5 = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
  -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v5, *MEMORY[0x24BDE9188]);
}

- (unint64_t)type
{
  NSMutableDictionary *v2;

  v2 = -[ACFKeychainItemInfo attributeDictionary](self, "attributeDictionary");
  return objc_msgSend((id)-[NSMutableDictionary objectForKey:](v2, "objectForKey:", *MEMORY[0x24BDE9188]), "unsignedIntegerValue");
}

- (void)setLabel:(id)a3
{
  NSMutableDictionary *v4;

  if (a3)
  {
    v4 = -[ACFKeychainItemInfo attributeDictionary](self, "attributeDictionary");
    -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", a3, *MEMORY[0x24BDE90A0]);
  }
}

- (NSString)label
{
  NSMutableDictionary *v2;

  v2 = -[ACFKeychainItemInfo attributeDictionary](self, "attributeDictionary");
  return (NSString *)-[NSMutableDictionary objectForKey:](v2, "objectForKey:", *MEMORY[0x24BDE90A0]);
}

- (void)setSubject:(id)a3
{
  NSMutableDictionary *v4;

  if (a3)
  {
    v4 = -[ACFKeychainItemInfo attributeDictionary](self, "attributeDictionary");
    -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", a3, *MEMORY[0x24BDE9130]);
  }
}

- (NSString)subject
{
  NSMutableDictionary *v2;

  v2 = -[ACFKeychainItemInfo attributeDictionary](self, "attributeDictionary");
  return (NSString *)-[NSMutableDictionary objectForKey:](v2, "objectForKey:", *MEMORY[0x24BDE9130]);
}

- (void)setIsInvisible:(BOOL)a3
{
  uint64_t *v3;
  uint64_t v4;
  NSMutableDictionary *v5;

  v3 = (uint64_t *)MEMORY[0x24BDBD270];
  if (!a3)
    v3 = (uint64_t *)MEMORY[0x24BDBD268];
  v4 = *v3;
  v5 = -[ACFKeychainItemInfo attributeDictionary](self, "attributeDictionary");
  -[NSMutableDictionary setObject:forKey:](v5, "setObject:forKey:", v4, *MEMORY[0x24BDE9008]);
}

- (BOOL)isInvisible
{
  NSMutableDictionary *v2;
  const __CFBoolean *v3;

  v2 = -[ACFKeychainItemInfo attributeDictionary](self, "attributeDictionary");
  v3 = (const __CFBoolean *)-[NSMutableDictionary objectForKey:](v2, "objectForKey:", *MEMORY[0x24BDE9008]);
  if (v3)
    LOBYTE(v3) = CFBooleanGetValue(v3) != 0;
  return (char)v3;
}

- (void)setIsNegative:(BOOL)a3
{
  uint64_t *v3;
  uint64_t v4;
  NSMutableDictionary *v5;

  v3 = (uint64_t *)MEMORY[0x24BDBD270];
  if (!a3)
    v3 = (uint64_t *)MEMORY[0x24BDBD268];
  v4 = *v3;
  v5 = -[ACFKeychainItemInfo attributeDictionary](self, "attributeDictionary");
  -[NSMutableDictionary setObject:forKey:](v5, "setObject:forKey:", v4, *MEMORY[0x24BDE9010]);
}

- (BOOL)isNegative
{
  NSMutableDictionary *v2;
  const __CFBoolean *v3;

  v2 = -[ACFKeychainItemInfo attributeDictionary](self, "attributeDictionary");
  v3 = (const __CFBoolean *)-[NSMutableDictionary objectForKey:](v2, "objectForKey:", *MEMORY[0x24BDE9010]);
  if (v3)
    LOBYTE(v3) = CFBooleanGetValue(v3) != 0;
  return (char)v3;
}

- (void)setIsPermanent:(BOOL)a3
{
  uint64_t *v3;
  uint64_t v4;
  NSMutableDictionary *v5;

  v3 = (uint64_t *)MEMORY[0x24BDBD270];
  if (!a3)
    v3 = (uint64_t *)MEMORY[0x24BDBD268];
  v4 = *v3;
  v5 = -[ACFKeychainItemInfo attributeDictionary](self, "attributeDictionary");
  -[NSMutableDictionary setObject:forKey:](v5, "setObject:forKey:", v4, *MEMORY[0x24BDE9018]);
}

- (BOOL)isPermanent
{
  NSMutableDictionary *v2;
  const __CFBoolean *v3;

  v2 = -[ACFKeychainItemInfo attributeDictionary](self, "attributeDictionary");
  v3 = (const __CFBoolean *)-[NSMutableDictionary objectForKey:](v2, "objectForKey:", *MEMORY[0x24BDE9018]);
  if (v3)
    LOBYTE(v3) = CFBooleanGetValue(v3) != 0;
  return (char)v3;
}

- (void)setAccessibleType:(void *)a3
{
  NSMutableDictionary *v4;

  v4 = -[ACFKeychainItemInfo attributeDictionary](self, "attributeDictionary");
  -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", a3, *MEMORY[0x24BDE8F60]);
}

- (void)accessibleType
{
  NSMutableDictionary *v2;

  v2 = -[ACFKeychainItemInfo attributeDictionary](self, "attributeDictionary");
  return (void *)-[NSMutableDictionary objectForKey:](v2, "objectForKey:", *MEMORY[0x24BDE8F60]);
}

- (BOOL)isSynchronizableAttributeAvaiable
{
  return *MEMORY[0x24BDD0D50] >= 1056.0;
}

- (void)setSynchronizable:(BOOL)a3
{
  _BOOL8 v3;
  NSMutableDictionary *v5;
  uint64_t v6;

  v3 = a3;
  if (-[ACFKeychainItemInfo isSynchronizableAttributeAvaiable](self, "isSynchronizableAttributeAvaiable"))
  {
    v5 = -[ACFKeychainItemInfo attributeDictionary](self, "attributeDictionary");
    v6 = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v3);
    -[NSMutableDictionary setObject:forKey:](v5, "setObject:forKey:", v6, *MEMORY[0x24BDE9140]);
  }
}

- (BOOL)synchronizable
{
  int v3;
  NSMutableDictionary *v4;

  v3 = -[ACFKeychainItemInfo isSynchronizableAttributeAvaiable](self, "isSynchronizableAttributeAvaiable");
  if (v3)
  {
    v4 = -[ACFKeychainItemInfo attributeDictionary](self, "attributeDictionary");
    LOBYTE(v3) = objc_msgSend((id)-[NSMutableDictionary objectForKey:](v4, "objectForKey:", *MEMORY[0x24BDE9140]), "BOOLValue");
  }
  return v3;
}

- (void)setKeyType:(id)a3
{
  NSMutableDictionary *v4;

  if (a3)
  {
    v4 = -[ACFKeychainItemInfo attributeDictionary](self, "attributeDictionary");
    -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", a3, *MEMORY[0x24BDE9050]);
  }
}

- (id)keyType
{
  NSMutableDictionary *v2;

  v2 = -[ACFKeychainItemInfo attributeDictionary](self, "attributeDictionary");
  return (id)-[NSMutableDictionary objectForKey:](v2, "objectForKey:", *MEMORY[0x24BDE9050]);
}

- (void)setApplicationTag:(id)a3
{
  NSMutableDictionary *v4;

  if (a3)
  {
    v4 = -[ACFKeychainItemInfo attributeDictionary](self, "attributeDictionary");
    -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", a3, *MEMORY[0x24BDE8FB8]);
  }
}

- (NSData)applicationTag
{
  NSMutableDictionary *v2;

  v2 = -[ACFKeychainItemInfo attributeDictionary](self, "attributeDictionary");
  return (NSData *)-[NSMutableDictionary objectForKey:](v2, "objectForKey:", *MEMORY[0x24BDE8FB8]);
}

- (void)setApplicationTagString:(id)a3
{
  -[ACFKeychainItemInfo setApplicationTag:](self, "setApplicationTag:", objc_msgSend(a3, "dataUsingEncoding:", 4));
}

- (NSString)applicationTagString
{
  return (NSString *)(id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", -[ACFKeychainItemInfo applicationTag](self, "applicationTag"), 4);
}

- (void)setAccount:(id)a3
{
  NSMutableDictionary *v4;

  if (a3)
  {
    v4 = -[ACFKeychainItemInfo attributeDictionary](self, "attributeDictionary");
    -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", a3, *MEMORY[0x24BDE8FA8]);
  }
}

- (NSString)account
{
  NSMutableDictionary *v2;

  v2 = -[ACFKeychainItemInfo attributeDictionary](self, "attributeDictionary");
  return (NSString *)-[NSMutableDictionary objectForKey:](v2, "objectForKey:", *MEMORY[0x24BDE8FA8]);
}

- (void)setService:(id)a3
{
  NSMutableDictionary *v4;

  if (a3)
  {
    v4 = -[ACFKeychainItemInfo attributeDictionary](self, "attributeDictionary");
    -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", a3, *MEMORY[0x24BDE9128]);
  }
}

- (NSString)service
{
  NSMutableDictionary *v2;

  v2 = -[ACFKeychainItemInfo attributeDictionary](self, "attributeDictionary");
  return (NSString *)-[NSMutableDictionary objectForKey:](v2, "objectForKey:", *MEMORY[0x24BDE9128]);
}

- (void)setGeneric:(id)a3
{
  NSMutableDictionary *v4;

  v4 = -[ACFKeychainItemInfo attributeDictionary](self, "attributeDictionary");
  if (a3)
    -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", a3, *MEMORY[0x24BDE9000]);
  else
    -[NSMutableDictionary removeObjectForKey:](v4, "removeObjectForKey:", *MEMORY[0x24BDE9000]);
}

- (NSData)generic
{
  NSMutableDictionary *v2;

  v2 = -[ACFKeychainItemInfo attributeDictionary](self, "attributeDictionary");
  return (NSData *)-[NSMutableDictionary objectForKey:](v2, "objectForKey:", *MEMORY[0x24BDE9000]);
}

- (void)setGenericString:(id)a3
{
  -[ACFKeychainItemInfo setGeneric:](self, "setGeneric:", objc_msgSend(a3, "dataUsingEncoding:", 4));
}

- (NSString)genericString
{
  NSString *result;

  result = -[ACFKeychainItemInfo generic](self, "generic");
  if (result)
  {
    -[ACFKeychainItemInfo generic](self, "generic");
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      return (NSString *)-[ACFKeychainItemInfo generic](self, "generic");
    else
      return (NSString *)(id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", -[ACFKeychainItemInfo generic](self, "generic"), 4);
  }
  return result;
}

- (void)setValueRef:(id)a3
{
  NSMutableDictionary *v4;

  if (a3)
  {
    v4 = -[ACFKeychainItemInfo attributeDictionary](self, "attributeDictionary");
    -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", a3, *MEMORY[0x24BDE9560]);
  }
}

- (id)valueRef
{
  NSMutableDictionary *v2;

  v2 = -[ACFKeychainItemInfo attributeDictionary](self, "attributeDictionary");
  return (id)-[NSMutableDictionary objectForKey:](v2, "objectForKey:", *MEMORY[0x24BDE9560]);
}

- (void)setValueData:(id)a3
{
  NSMutableDictionary *v4;

  if (a3)
  {
    v4 = -[ACFKeychainItemInfo attributeDictionary](self, "attributeDictionary");
    -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", a3, *MEMORY[0x24BDE9550]);
  }
}

- (id)valueData
{
  NSMutableDictionary *v2;

  v2 = -[ACFKeychainItemInfo attributeDictionary](self, "attributeDictionary");
  return (id)-[NSMutableDictionary objectForKey:](v2, "objectForKey:", *MEMORY[0x24BDE9550]);
}

- (void)setValuePersistentRef:(id)a3
{
  NSMutableDictionary *v4;

  if (a3)
  {
    v4 = -[ACFKeychainItemInfo attributeDictionary](self, "attributeDictionary");
    -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", a3, *MEMORY[0x24BDE9558]);
  }
}

- (id)valuePersistentRef
{
  NSMutableDictionary *v2;

  v2 = -[ACFKeychainItemInfo attributeDictionary](self, "attributeDictionary");
  return (id)-[NSMutableDictionary objectForKey:](v2, "objectForKey:", *MEMORY[0x24BDE9558]);
}

- (void)setReturnData:(BOOL)a3
{
  uint64_t *v3;
  uint64_t v4;
  NSMutableDictionary *v5;

  v3 = (uint64_t *)MEMORY[0x24BDBD270];
  if (!a3)
    v3 = (uint64_t *)MEMORY[0x24BDBD268];
  v4 = *v3;
  v5 = -[ACFKeychainItemInfo attributeDictionary](self, "attributeDictionary");
  -[NSMutableDictionary setObject:forKey:](v5, "setObject:forKey:", v4, *MEMORY[0x24BDE94C8]);
}

- (BOOL)returnData
{
  NSMutableDictionary *v2;
  const __CFBoolean *v3;

  v2 = -[ACFKeychainItemInfo attributeDictionary](self, "attributeDictionary");
  v3 = (const __CFBoolean *)-[NSMutableDictionary objectForKey:](v2, "objectForKey:", *MEMORY[0x24BDE94C8]);
  if (v3)
    LOBYTE(v3) = CFBooleanGetValue(v3) != 0;
  return (char)v3;
}

- (void)setReturnAttributes:(BOOL)a3
{
  uint64_t *v3;
  uint64_t v4;
  NSMutableDictionary *v5;

  v3 = (uint64_t *)MEMORY[0x24BDBD270];
  if (!a3)
    v3 = (uint64_t *)MEMORY[0x24BDBD268];
  v4 = *v3;
  v5 = -[ACFKeychainItemInfo attributeDictionary](self, "attributeDictionary");
  -[NSMutableDictionary setObject:forKey:](v5, "setObject:forKey:", v4, *MEMORY[0x24BDE94C0]);
}

- (BOOL)returnAttributes
{
  NSMutableDictionary *v2;
  const __CFBoolean *v3;

  v2 = -[ACFKeychainItemInfo attributeDictionary](self, "attributeDictionary");
  v3 = (const __CFBoolean *)-[NSMutableDictionary objectForKey:](v2, "objectForKey:", *MEMORY[0x24BDE94C0]);
  if (v3)
    LOBYTE(v3) = CFBooleanGetValue(v3) != 0;
  return (char)v3;
}

- (void)setReturnRef:(BOOL)a3
{
  uint64_t *v3;
  uint64_t v4;
  NSMutableDictionary *v5;

  v3 = (uint64_t *)MEMORY[0x24BDBD270];
  if (!a3)
    v3 = (uint64_t *)MEMORY[0x24BDBD268];
  v4 = *v3;
  v5 = -[ACFKeychainItemInfo attributeDictionary](self, "attributeDictionary");
  -[NSMutableDictionary setObject:forKey:](v5, "setObject:forKey:", v4, *MEMORY[0x24BDE94D8]);
}

- (BOOL)returnRef
{
  NSMutableDictionary *v2;
  const __CFBoolean *v3;

  v2 = -[ACFKeychainItemInfo attributeDictionary](self, "attributeDictionary");
  v3 = (const __CFBoolean *)-[NSMutableDictionary objectForKey:](v2, "objectForKey:", *MEMORY[0x24BDE94D8]);
  if (v3)
    LOBYTE(v3) = CFBooleanGetValue(v3) != 0;
  return (char)v3;
}

- (void)setReturnPersistentRef:(BOOL)a3
{
  uint64_t *v3;
  uint64_t v4;
  NSMutableDictionary *v5;

  v3 = (uint64_t *)MEMORY[0x24BDBD270];
  if (!a3)
    v3 = (uint64_t *)MEMORY[0x24BDBD268];
  v4 = *v3;
  v5 = -[ACFKeychainItemInfo attributeDictionary](self, "attributeDictionary");
  -[NSMutableDictionary setObject:forKey:](v5, "setObject:forKey:", v4, *MEMORY[0x24BDE94D0]);
}

- (BOOL)returnPersistentRef
{
  NSMutableDictionary *v2;
  const __CFBoolean *v3;

  v2 = -[ACFKeychainItemInfo attributeDictionary](self, "attributeDictionary");
  v3 = (const __CFBoolean *)-[NSMutableDictionary objectForKey:](v2, "objectForKey:", *MEMORY[0x24BDE94D0]);
  if (v3)
    LOBYTE(v3) = CFBooleanGetValue(v3) != 0;
  return (char)v3;
}

- (void)setReturnLimit:(unint64_t)a3
{
  uint64_t v4;
  NSMutableDictionary *v5;

  if (a3 == -1)
    v4 = *MEMORY[0x24BDE93B8];
  else
    v4 = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:");
  v5 = -[ACFKeychainItemInfo attributeDictionary](self, "attributeDictionary");
  -[NSMutableDictionary setObject:forKey:](v5, "setObject:forKey:", v4, *MEMORY[0x24BDE93B0]);
}

- (unint64_t)returnLimit
{
  NSMutableDictionary *v2;
  void *v3;

  v2 = -[ACFKeychainItemInfo attributeDictionary](self, "attributeDictionary");
  v3 = (void *)-[NSMutableDictionary objectForKey:](v2, "objectForKey:", *MEMORY[0x24BDE93B0]);
  if (!v3)
    return 1;
  if ((void *)*MEMORY[0x24BDE93B8] == v3)
    return -1;
  return objc_msgSend(v3, "unsignedIntValue");
}

- (void)dump
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  if ((ACFLogSettingsGetLevelMask() & 0x80) != 0)
  {
    v3 = (id)-[NSDictionary mutableCopy](-[ACFKeychainItemInfo attributes](self, "attributes"), "mutableCopy");
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<<<Generic data of size: %lu>>>"), objc_msgSend((id)objc_msgSend(v3, "objectForKey:", *MEMORY[0x24BDE9000]), "length")), *MEMORY[0x24BDE9000]);
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<<<Return data of size: %lu>>>"), objc_msgSend((id)objc_msgSend(v3, "objectForKey:", *MEMORY[0x24BDE94C8]), "length")), *MEMORY[0x24BDE94C8]);
    v4 = (void *)MEMORY[0x24BDD17C8];
    v5 = *MEMORY[0x24BDE9550];
    v9 = objc_msgSend((id)objc_msgSend(v3, "objectForKey:", *MEMORY[0x24BDE9550]), "length");
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(v4, "stringWithFormat:", CFSTR("<<<Value data of size: %lu>>>")), v5);
    if (ACFLogNS)
    {
      if ((ACFLogSettingsGetLevelMask() & 0x80) != 0)
      {
        v6 = objc_msgSend(v3, "description");
        ACFLogNS(7, (uint64_t)"-[ACFKeychainItemInfo dump]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Foundation/Sources/ACFKeychainItemInfo.m", 539, 0, v6, v7, v8, v9);
      }
    }
  }
}

- (NSMutableDictionary)attributeDictionary
{
  return self->_attributeDictionary;
}

- (void)setAttributeDictionary:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

@end
