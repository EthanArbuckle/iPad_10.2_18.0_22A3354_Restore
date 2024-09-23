@implementation SSPersonalizeOffersResponse

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SSPersonalizeOffersResponse;
  -[SSPersonalizeOffersResponse dealloc](&v3, sel_dealloc);
}

- (id)actionDisplayNameForItemType:(id)a3
{
  return (id)-[NSMutableDictionary objectForKey:](self->_actionDisplayNames, "objectForKey:", a3);
}

- (NSArray)personalizedItems
{
  return self->_items;
}

- (id)priceDisplayForItemType:(id)a3
{
  return (id)-[NSMutableDictionary objectForKey:](self->_priceDisplayNames, "objectForKey:", a3);
}

- (id)actionParametersForItemIdentifier:(id)a3
{
  return (id)-[NSMutableDictionary objectForKey:](self->_actionParameters, "objectForKey:", a3);
}

- (void)setActionDisplayNameString:(id)a3 forItemType:(id)a4
{
  NSMutableDictionary *actionDisplayNames;

  actionDisplayNames = self->_actionDisplayNames;
  if (actionDisplayNames)
  {
    if (a3)
    {
LABEL_3:
      -[NSMutableDictionary setObject:forKey:](actionDisplayNames, "setObject:forKey:", a3, a4);
      return;
    }
  }
  else
  {
    actionDisplayNames = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    self->_actionDisplayNames = actionDisplayNames;
    if (a3)
      goto LABEL_3;
  }
  -[NSMutableDictionary removeObjectForKey:](actionDisplayNames, "removeObjectForKey:", a4);
}

- (void)setActionParameters:(id)a3 forItemIdentifier:(id)a4
{
  NSMutableDictionary *actionParameters;

  actionParameters = self->_actionParameters;
  if (actionParameters)
  {
    if (a3)
    {
LABEL_3:
      -[NSMutableDictionary setObject:forKey:](actionParameters, "setObject:forKey:", a3, a4);
      return;
    }
  }
  else
  {
    actionParameters = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    self->_actionParameters = actionParameters;
    if (a3)
      goto LABEL_3;
  }
  -[NSMutableDictionary removeObjectForKey:](actionParameters, "removeObjectForKey:", a4);
}

- (void)setPriceDisplayString:(id)a3 forItemType:(id)a4
{
  NSMutableDictionary *priceDisplayNames;

  priceDisplayNames = self->_priceDisplayNames;
  if (priceDisplayNames)
  {
    if (a3)
    {
LABEL_3:
      -[NSMutableDictionary setObject:forKey:](priceDisplayNames, "setObject:forKey:", a3, a4);
      return;
    }
  }
  else
  {
    priceDisplayNames = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    self->_priceDisplayNames = priceDisplayNames;
    if (a3)
      goto LABEL_3;
  }
  -[NSMutableDictionary removeObjectForKey:](priceDisplayNames, "removeObjectForKey:", a4);
}

- (void)_setPersonalizedItems:(id)a3
{
  NSArray *items;

  items = self->_items;
  if (items != a3)
  {

    self->_items = (NSArray *)objc_msgSend(a3, "copy");
  }
}

- (SSPersonalizeOffersResponse)initWithXPCEncoding:(id)a3
{
  SSPersonalizeOffersResponse *v5;
  CFArrayRef v7;
  CFArrayRef v8;
  CFArrayRef v9;
  objc_super v10;

  if (a3 && MEMORY[0x1A85863E4](a3, a2) == MEMORY[0x1E0C812F8])
  {
    v10.receiver = self;
    v10.super_class = (Class)SSPersonalizeOffersResponse;
    v5 = -[SSPersonalizeOffersResponse init](&v10, sel_init);
    if (v5)
    {
      objc_opt_class();
      v7 = SSXPCDictionaryCopyCFObjectWithClass(a3, "0");
      v5->_actionDisplayNames = (NSMutableDictionary *)-[__CFArray mutableCopy](v7, "mutableCopy");

      objc_opt_class();
      v8 = SSXPCDictionaryCopyCFObjectWithClass(a3, "1");
      v5->_actionParameters = (NSMutableDictionary *)-[__CFArray mutableCopy](v8, "mutableCopy");

      objc_opt_class();
      v9 = SSXPCDictionaryCopyCFObjectWithClass(a3, "2");
      v5->_priceDisplayNames = (NSMutableDictionary *)-[__CFArray mutableCopy](v9, "mutableCopy");

    }
  }
  else
  {

    return 0;
  }
  return v5;
}

- (id)copyXPCEncoding
{
  xpc_object_t v3;

  v3 = xpc_dictionary_create(0, 0, 0);
  SSXPCDictionarySetCFObject(v3, "0", (__CFString *)self->_actionDisplayNames);
  SSXPCDictionarySetCFObject(v3, "1", (__CFString *)self->_actionParameters);
  SSXPCDictionarySetCFObject(v3, "2", (__CFString *)self->_priceDisplayNames);
  return v3;
}

@end
