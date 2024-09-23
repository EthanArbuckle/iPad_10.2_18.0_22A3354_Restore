@implementation SSPurchaseHistoryItem

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SSPurchaseHistoryItem;
  -[SSPurchaseHistoryItem dealloc](&v3, sel_dealloc);
}

- (void)setValue:(id)a3 forProperty:(id)a4
{
  uint64_t v7;
  NSMutableDictionary *properties;
  id v9;
  id v10;

  v9 = a3;
  if (objc_msgSend(a3, "conformsToProtocol:", &unk_1EE6724F0))
  {

    v7 = objc_msgSend(a3, "copy");
  }
  else
  {
    v7 = (uint64_t)v9;
  }
  properties = self->_properties;
  v10 = (id)v7;
  if (!properties)
  {
    properties = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v7 = (uint64_t)v10;
    self->_properties = properties;
    if (v10)
      goto LABEL_6;
LABEL_8:
    -[NSMutableDictionary removeObjectForKey:](properties, "removeObjectForKey:", a4);
    goto LABEL_9;
  }
  if (!v7)
    goto LABEL_8;
LABEL_6:
  -[NSMutableDictionary setObject:forKey:](properties, "setObject:forKey:", v7, a4);
LABEL_9:

}

- (id)valueForProperty:(id)a3
{
  return (id)-[NSMutableDictionary objectForKey:](self->_properties, "objectForKey:", a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5[1] = -[NSMutableDictionary mutableCopyWithZone:](self->_properties, "mutableCopyWithZone:", a3);
  return v5;
}

- (id)copyXPCEncoding
{
  xpc_object_t v3;

  v3 = xpc_dictionary_create(0, 0, 0);
  SSXPCDictionarySetCFObject(v3, "0", (__CFString *)self->_properties);
  return v3;
}

- (SSPurchaseHistoryItem)initWithXPCEncoding:(id)a3
{
  SSPurchaseHistoryItem *v5;
  CFArrayRef v7;
  objc_super v8;

  if (a3 && MEMORY[0x1A85863E4](a3, a2) == MEMORY[0x1E0C812F8])
  {
    v8.receiver = self;
    v8.super_class = (Class)SSPurchaseHistoryItem;
    v5 = -[SSPurchaseHistoryItem init](&v8, sel_init);
    if (v5)
    {
      objc_opt_class();
      v7 = SSXPCDictionaryCopyCFObjectWithClass(a3, "0");

      v5->_properties = (NSMutableDictionary *)-[__CFArray mutableCopy](v7, "mutableCopy");
    }
  }
  else
  {

    return 0;
  }
  return v5;
}

- (NSString)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SSPurchaseHistoryItem;
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %@"), -[SSPurchaseHistoryItem description](&v3, sel_description), self->_properties);
}

- (unint64_t)hash
{
  return -[NSMutableDictionary hash](self->_properties, "hash");
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5;
  NSMutableDictionary *properties;

  v5 = objc_opt_class();
  if (v5 != objc_opt_class())
    return 0;
  properties = self->_properties;
  if (properties == *((NSMutableDictionary **)a3 + 1))
    return 1;
  else
    return -[NSMutableDictionary isEqualToDictionary:](properties, "isEqualToDictionary:");
}

@end
