@implementation ICAuthorizeMachineResponse

- (ICAuthorizeMachineResponse)initWithResponseDictionary:(id)a3
{
  id v4;
  ICAuthorizeMachineResponse *v5;
  uint64_t v6;
  NSDictionary *responseDictionary;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICAuthorizeMachineResponse;
  v5 = -[ICAuthorizeMachineResponse init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    responseDictionary = v5->_responseDictionary;
    v5->_responseDictionary = (NSDictionary *)v6;

  }
  return v5;
}

- (NSData)keybagData
{
  void *v2;
  id v3;
  void *v4;

  -[NSDictionary objectForKey:](self->_responseDictionary, "objectForKey:", CFSTR("keybag"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSData())
  {
    v3 = v2;
  }
  else
  {
    if (!_NSIsNSString())
    {
      v4 = 0;
      goto LABEL_7;
    }
    v3 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v2, 0);
  }
  v4 = v3;
LABEL_7:

  return (NSData *)v4;
}

- (NSData)tokenData
{
  void *v2;
  id v3;
  void *v4;

  -[NSDictionary objectForKey:](self->_responseDictionary, "objectForKey:", CFSTR("token"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSData())
  {
    v3 = v2;
  }
  else
  {
    if (!_NSIsNSString())
    {
      v4 = 0;
      goto LABEL_7;
    }
    v3 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v2, 0);
  }
  v4 = v3;
LABEL_7:

  return (NSData *)v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responseDictionary, 0);
}

@end
