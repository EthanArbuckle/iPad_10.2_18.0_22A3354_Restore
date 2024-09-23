@implementation ICSuzeLeaseResponse

- (ICSuzeLeaseResponse)initWithResponseDictionary:(id)a3 requestDate:(id)a4
{
  id v6;
  id v7;
  ICSuzeLeaseResponse *v8;
  uint64_t v9;
  NSDate *requestDate;
  uint64_t v11;
  NSDictionary *responseDictionary;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ICSuzeLeaseResponse;
  v8 = -[ICSuzeLeaseResponse init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v7, "copy");
    requestDate = v8->_requestDate;
    v8->_requestDate = (NSDate *)v9;

    v11 = objc_msgSend(v6, "copy");
    responseDictionary = v8->_responseDictionary;
    v8->_responseDictionary = (NSDictionary *)v11;

  }
  return v8;
}

- (NSData)clientData
{
  void *v2;
  id v3;
  void *v4;

  -[NSDictionary objectForKey:](self->_responseDictionary, "objectForKey:", CFSTR("client-data"));
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

- (NSDate)leaseExpirationDate
{
  void *v3;
  char v4;
  double v5;
  void *v6;

  -[NSDictionary objectForKey:](self->_responseDictionary, "objectForKey:", CFSTR("lease-duration"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();
  v5 = 0.0;
  if ((v4 & 1) != 0)
    objc_msgSend(v3, "doubleValue", 0.0);
  if (v5 < 30.0)
    v5 = 30.0;
  -[NSDate dateByAddingTimeInterval:](self->_requestDate, "dateByAddingTimeInterval:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v6;
}

- (NSDictionary)responseDictionary
{
  return self->_responseDictionary;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responseDictionary, 0);
  objc_storeStrong((id *)&self->_requestDate, 0);
}

@end
