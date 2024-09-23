@implementation NFVASRequest

+ (BOOL)validateDictionary:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  BOOL v12;

  v3 = a3;
  if (v3)
  {
    v4 = objc_opt_class(NSDictionary);
    if ((objc_opt_isKindOfClass(v3, v4) & 1) == 0)
    {
      v12 = 0;
      v5 = v3;
      goto LABEL_17;
    }
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("TerminalCap")));

  if (v5)
  {
    v6 = objc_opt_class(NSNumber);
    if ((objc_opt_isKindOfClass(v5, v6) & 1) == 0)
      goto LABEL_14;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("TerminalProtocol")));

  if (v7)
  {
    v8 = objc_opt_class(NSNumber);
    if ((objc_opt_isKindOfClass(v7, v8) & 1) == 0)
      goto LABEL_16;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("MerchantId")));

  if (v5)
  {
    v9 = objc_opt_class(NSString);
    if ((objc_opt_isKindOfClass(v5, v9) & 1) == 0)
      goto LABEL_14;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("SignupUrl")));

  if (v7)
  {
    v10 = objc_opt_class(NSURL);
    if ((objc_opt_isKindOfClass(v7, v10) & 1) == 0)
    {
LABEL_16:
      v12 = 0;
      v5 = v7;
      goto LABEL_17;
    }
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("Filter")));

  if (v5)
  {
    v11 = objc_opt_class(NSData);
    if ((objc_opt_isKindOfClass(v5, v11) & 1) == 0)
    {
LABEL_14:
      v12 = 0;
      goto LABEL_17;
    }
  }
  v12 = 1;
LABEL_17:

  return v12;
}

- (NFVASRequest)initWithDictionary:(id)a3
{
  id v4;
  NFVASRequest *v5;
  uint64_t v6;
  NSNumber *terminalCap;
  uint64_t v8;
  NSNumber *terminalProtocol;
  uint64_t v10;
  NSString *merchantId;
  uint64_t v12;
  NSURL *signupUrl;
  uint64_t v14;
  NSData *filter;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)NFVASRequest;
  v5 = -[NFVASRequest init](&v17, "init");
  if (v5)
  {
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("TerminalCap")));
    terminalCap = v5->_terminalCap;
    v5->_terminalCap = (NSNumber *)v6;

    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("TerminalProtocol")));
    terminalProtocol = v5->_terminalProtocol;
    v5->_terminalProtocol = (NSNumber *)v8;

    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("MerchantId")));
    merchantId = v5->_merchantId;
    v5->_merchantId = (NSString *)v10;

    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("SignupUrl")));
    signupUrl = v5->_signupUrl;
    v5->_signupUrl = (NSURL *)v12;

    v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Filter")));
    filter = v5->_filter;
    v5->_filter = (NSData *)v14;

  }
  return v5;
}

- (id)asDictionary
{
  NSMutableDictionary *v3;
  NSMutableDictionary *v4;
  NSNumber *terminalCap;
  NSNumber *terminalProtocol;
  NSString *merchantId;
  NSURL *signupUrl;
  NSData *filter;

  v3 = objc_opt_new(NSMutableDictionary);
  v4 = v3;
  terminalCap = self->_terminalCap;
  if (terminalCap)
    -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", terminalCap, CFSTR("TerminalCap"));
  terminalProtocol = self->_terminalProtocol;
  if (terminalProtocol)
    -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", terminalProtocol, CFSTR("TerminalProtocol"));
  merchantId = self->_merchantId;
  if (merchantId)
    -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", merchantId, CFSTR("MerchantId"));
  signupUrl = self->_signupUrl;
  if (signupUrl)
    -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", signupUrl, CFSTR("SignupUrl"));
  filter = self->_filter;
  if (filter)
    -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", filter, CFSTR("Filter"));
  return v4;
}

- (id)description
{
  id v3;
  id v4;
  void *v5;
  id v6;
  objc_super v8;

  v3 = objc_alloc((Class)NSString);
  v8.receiver = self;
  v8.super_class = (Class)NFVASRequest;
  v4 = -[NFVASRequest description](&v8, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = objc_msgSend(v3, "initWithFormat:", CFSTR("%@ protocol=0x%04x capability=0x%04x merchantId=%@ url=%@ filter=%@"), v5, -[NSNumber unsignedIntValue](self->_terminalProtocol, "unsignedIntValue"), -[NSNumber unsignedIntValue](self->_terminalCap, "unsignedIntValue"), self->_merchantId, self->_signupUrl, self->_filter);

  return v6;
}

- (NSNumber)terminalCap
{
  return self->_terminalCap;
}

- (void)setTerminalCap:(id)a3
{
  objc_storeStrong((id *)&self->_terminalCap, a3);
}

- (NSNumber)terminalProtocol
{
  return self->_terminalProtocol;
}

- (void)setTerminalProtocol:(id)a3
{
  objc_storeStrong((id *)&self->_terminalProtocol, a3);
}

- (NSString)merchantId
{
  return self->_merchantId;
}

- (void)setMerchantId:(id)a3
{
  objc_storeStrong((id *)&self->_merchantId, a3);
}

- (NSURL)signupUrl
{
  return self->_signupUrl;
}

- (void)setSignupUrl:(id)a3
{
  objc_storeStrong((id *)&self->_signupUrl, a3);
}

- (NSData)filter
{
  return self->_filter;
}

- (void)setFilter:(id)a3
{
  objc_storeStrong((id *)&self->_filter, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filter, 0);
  objc_storeStrong((id *)&self->_signupUrl, 0);
  objc_storeStrong((id *)&self->_merchantId, 0);
  objc_storeStrong((id *)&self->_terminalProtocol, 0);
  objc_storeStrong((id *)&self->_terminalCap, 0);
}

@end
