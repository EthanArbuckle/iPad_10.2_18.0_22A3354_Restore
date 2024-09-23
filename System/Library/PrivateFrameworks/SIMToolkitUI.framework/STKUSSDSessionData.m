@implementation STKUSSDSessionData

- (STKUSSDSessionData)initWithText:(id)a3 allowsResponse:(BOOL)a4
{
  id v6;
  STKUSSDSessionData *v7;
  uint64_t v8;
  NSString *text;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)STKUSSDSessionData;
  v7 = -[STKUSSDSessionData init](&v11, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    text = v7->_text;
    v7->_text = (NSString *)v8;

    v7->_allowsResponse = a4;
  }

  return v7;
}

- (STKUSSDSessionData)initWithXPCDictionary:(id)a3
{
  id v4;
  void *v5;
  _BOOL8 v6;
  STKUSSDSessionData *v7;

  v4 = a3;
  BSDeserializeStringFromXPCDictionaryWithKey();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = xpc_dictionary_get_BOOL(v4, "_allowsResponse");

  v7 = -[STKUSSDSessionData initWithText:allowsResponse:](self, "initWithText:allowsResponse:", v5, v6);
  return v7;
}

- (void)encodeWithXPCDictionary:(id)a3
{
  xpc_object_t xdict;

  xdict = a3;
  BSSerializeStringToXPCDictionaryWithKey();
  xpc_dictionary_set_BOOL(xdict, "_allowsResponse", self->_allowsResponse);

}

- (NSString)text
{
  return self->_text;
}

- (BOOL)allowsResponse
{
  return self->_allowsResponse;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_text, 0);
}

@end
