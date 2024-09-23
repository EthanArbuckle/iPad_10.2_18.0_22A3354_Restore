@implementation STKClass0SMSSessionData

- (STKClass0SMSSessionData)initWithBody:(id)a3 address:(id)a4 showsFromAddress:(BOOL)a5
{
  id v8;
  id v9;
  STKClass0SMSSessionData *v10;
  uint64_t v11;
  NSString *body;
  uint64_t v13;
  NSString *address;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)STKClass0SMSSessionData;
  v10 = -[STKClass0SMSSessionData init](&v16, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v8, "copy");
    body = v10->_body;
    v10->_body = (NSString *)v11;

    v13 = objc_msgSend(v9, "copy");
    address = v10->_address;
    v10->_address = (NSString *)v13;

    v10->_showsFromAddress = a5;
  }

  return v10;
}

- (STKClass0SMSSessionData)initWithXPCDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _BOOL8 v7;
  STKClass0SMSSessionData *v8;

  v4 = a3;
  BSDeserializeStringFromXPCDictionaryWithKey();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  BSDeserializeStringFromXPCDictionaryWithKey();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = xpc_dictionary_get_BOOL(v4, "_showsFrom");

  v8 = -[STKClass0SMSSessionData initWithBody:address:showsFromAddress:](self, "initWithBody:address:showsFromAddress:", v5, v6, v7);
  return v8;
}

- (void)encodeWithXPCDictionary:(id)a3
{
  xpc_object_t xdict;

  xdict = a3;
  BSSerializeStringToXPCDictionaryWithKey();
  BSSerializeStringToXPCDictionaryWithKey();
  xpc_dictionary_set_BOOL(xdict, "_showsFrom", self->_showsFromAddress);

}

- (NSString)body
{
  return self->_body;
}

- (NSString)address
{
  return self->_address;
}

- (BOOL)showsFromAddress
{
  return self->_showsFromAddress;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_address, 0);
  objc_storeStrong((id *)&self->_body, 0);
}

@end
