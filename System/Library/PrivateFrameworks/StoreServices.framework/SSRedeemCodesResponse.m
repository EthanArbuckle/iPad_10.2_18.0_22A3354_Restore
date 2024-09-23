@implementation SSRedeemCodesResponse

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SSRedeemCodesResponse;
  -[SSRedeemCodesResponse dealloc](&v3, sel_dealloc);
}

- (NSArray)codeResponses
{
  return -[NSDictionary allKeys](self->_codeResponses, "allKeys");
}

- (id)dictionaryForCode:(id)a3
{
  return -[NSDictionary objectForKey:](self->_redeemedCodes, "objectForKey:", a3);
}

- (id)errorForCode:(id)a3
{
  return -[NSDictionary objectForKey:](self->_errors, "objectForKey:", a3);
}

- (NSArray)failedCodes
{
  return -[NSDictionary allKeys](self->_errors, "allKeys");
}

- (NSArray)redeemedCodes
{
  return -[NSDictionary allKeys](self->_redeemedCodes, "allKeys");
}

- (id)responseDictionaryForCode:(id)a3
{
  return -[NSDictionary objectForKey:](self->_codeResponses, "objectForKey:", a3);
}

- (void)setCodeResponses:(id)a3
{
  NSDictionary *codeResponses;

  codeResponses = self->_codeResponses;
  if (codeResponses != a3)
  {

    self->_codeResponses = (NSDictionary *)objc_msgSend(a3, "copy");
  }
}

- (void)setFailedCodes:(id)a3
{
  NSDictionary *errors;

  errors = self->_errors;
  if (errors != a3)
  {

    self->_errors = (NSDictionary *)objc_msgSend(a3, "copy");
  }
}

- (void)setRedeemedCodes:(id)a3
{
  NSDictionary *redeemedCodes;

  redeemedCodes = self->_redeemedCodes;
  if (redeemedCodes != a3)
  {

    self->_redeemedCodes = (NSDictionary *)objc_msgSend(a3, "copy");
  }
}

- (SSRedeemCodesResponse)initWithXPCEncoding:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  SSRedeemCodesResponse *v7;
  id v9;
  xpc_object_t value;
  void *v11;
  _QWORD applier[5];
  objc_super v13;

  if (a3 && (v5 = MEMORY[0x1A85863E4](a3, a2), v6 = MEMORY[0x1E0C812F8], v5 == MEMORY[0x1E0C812F8]))
  {
    v13.receiver = self;
    v13.super_class = (Class)SSRedeemCodesResponse;
    v7 = -[SSRedeemCodesResponse init](&v13, sel_init);
    if (v7)
    {
      objc_opt_class();
      v7->_codeResponses = (NSDictionary *)SSXPCDictionaryCopyCFObjectWithClass(a3, "0");
      objc_opt_class();
      v7->_redeemedCodes = (NSDictionary *)SSXPCDictionaryCopyCFObjectWithClass(a3, "2");
      v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      value = xpc_dictionary_get_value(a3, "1");
      if (value)
      {
        v11 = value;
        if (MEMORY[0x1A85863E4]() == v6)
        {
          applier[0] = MEMORY[0x1E0C809B0];
          applier[1] = 3221225472;
          applier[2] = __45__SSRedeemCodesResponse_initWithXPCEncoding___block_invoke;
          applier[3] = &unk_1E47BE4C0;
          applier[4] = v9;
          xpc_dictionary_apply(v11, applier);
        }
      }
      if (objc_msgSend(v9, "count"))
        v7->_errors = (NSDictionary *)objc_msgSend(v9, "copy");

    }
  }
  else
  {

    return 0;
  }
  return v7;
}

uint64_t __45__SSRedeemCodesResponse_initWithXPCEncoding___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  void *v6;
  void *v7;

  v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithXPCEncoding:", a3);
  if (v5)
  {
    v6 = (void *)v5;
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", a2);
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v6, v7);

  }
  return 1;
}

- (id)copyXPCEncoding
{
  xpc_object_t v3;

  v3 = xpc_dictionary_create(0, 0, 0);
  SSXPCDictionarySetCFObject(v3, "0", (__CFString *)self->_codeResponses);
  SSXPCDictionarySetCFObject(v3, "1", (__CFString *)self->_errors);
  SSXPCDictionarySetCFObject(v3, "2", (__CFString *)self->_redeemedCodes);
  return v3;
}

@end
