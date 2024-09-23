@implementation NFValueAddedServiceTransaction

- (NFValueAddedServiceTransaction)initWithDictionary:(id)a3
{
  id v4;
  NFValueAddedServiceTransaction *v5;
  uint64_t v6;
  NSData *merchantId;
  uint64_t v8;
  NSString *signupUrl;
  uint64_t v10;
  NSNumber *terminalAppVersion;
  uint64_t v12;
  NSNumber *terminalMode;
  uint64_t v14;
  NSData *passData;
  uint64_t v16;
  NSData *token;
  uint64_t v18;
  NSNumber *filter;
  uint64_t v20;
  NSNumber *filterType;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  NSNumber *didSucceed;
  void *v26;
  uint64_t v27;
  objc_super v29;

  v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)NFValueAddedServiceTransaction;
  v5 = -[NFValueAddedServiceTransaction init](&v29, "init");
  if (v5)
  {
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("MerchantId")));
    merchantId = v5->_merchantId;
    v5->_merchantId = (NSData *)v6;

    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("SignupUrl")));
    signupUrl = v5->_signupUrl;
    v5->_signupUrl = (NSString *)v8;

    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("TerminalAppVersion")));
    terminalAppVersion = v5->_terminalAppVersion;
    v5->_terminalAppVersion = (NSNumber *)v10;

    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("TerminalMode")));
    terminalMode = v5->_terminalMode;
    v5->_terminalMode = (NSNumber *)v12;

    v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PassData")));
    passData = v5->_passData;
    v5->_passData = (NSData *)v14;

    v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Token")));
    token = v5->_token;
    v5->_token = (NSData *)v16;

    v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Filter")));
    filter = v5->_filter;
    v5->_filter = (NSNumber *)v18;

    v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("FilterType")));
    filterType = v5->_filterType;
    v5->_filterType = (NSNumber *)v20;

    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Error")));
    if (v22)
    {
      v23 = objc_opt_class(NSError);
      if ((objc_opt_isKindOfClass(v22, v23) & 1) != 0)
      {
        objc_storeStrong((id *)&v5->_error, v22);
        v24 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[NSError code](v5->_error, "code") == 0));
        didSucceed = v5->_didSucceed;
        v5->_didSucceed = (NSNumber *)v24;

      }
    }
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Result")));

    if (v26)
    {
      v27 = objc_opt_class(NSNumber);
      if ((objc_opt_isKindOfClass(v26, v27) & 1) != 0)
        v5->_result = objc_msgSend(v26, "unsignedIntValue");
    }

  }
  return v5;
}

- (NFValueAddedServiceTransaction)initWithCoder:(id)a3
{
  id v4;
  NFValueAddedServiceTransaction *v5;
  id v6;
  uint64_t v7;
  NSData *merchantId;
  id v9;
  uint64_t v10;
  NSString *signupUrl;
  id v12;
  uint64_t v13;
  NSNumber *terminalAppVersion;
  id v15;
  uint64_t v16;
  NSNumber *terminalMode;
  id v18;
  uint64_t v19;
  NSData *passData;
  id v21;
  uint64_t v22;
  NSData *token;
  id v24;
  uint64_t v25;
  NSError *error;
  id v27;
  uint64_t v28;
  NSNumber *didSucceed;
  id v30;
  uint64_t v31;
  NSNumber *filter;
  id v33;
  uint64_t v34;
  NSNumber *filterType;
  objc_super v37;

  v4 = a3;
  v37.receiver = self;
  v37.super_class = (Class)NFValueAddedServiceTransaction;
  v5 = -[NFValueAddedServiceTransaction init](&v37, "init");
  if (v5)
  {
    v6 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSData), CFSTR("MerchantId"));
    v7 = objc_claimAutoreleasedReturnValue(v6);
    merchantId = v5->_merchantId;
    v5->_merchantId = (NSData *)v7;

    v9 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("SignupUrl"));
    v10 = objc_claimAutoreleasedReturnValue(v9);
    signupUrl = v5->_signupUrl;
    v5->_signupUrl = (NSString *)v10;

    v12 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSNumber), CFSTR("TerminalAppVersion"));
    v13 = objc_claimAutoreleasedReturnValue(v12);
    terminalAppVersion = v5->_terminalAppVersion;
    v5->_terminalAppVersion = (NSNumber *)v13;

    v15 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSNumber), CFSTR("TerminalMode"));
    v16 = objc_claimAutoreleasedReturnValue(v15);
    terminalMode = v5->_terminalMode;
    v5->_terminalMode = (NSNumber *)v16;

    v18 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSData), CFSTR("PassData"));
    v19 = objc_claimAutoreleasedReturnValue(v18);
    passData = v5->_passData;
    v5->_passData = (NSData *)v19;

    v21 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSData), CFSTR("Token"));
    v22 = objc_claimAutoreleasedReturnValue(v21);
    token = v5->_token;
    v5->_token = (NSData *)v22;

    v24 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSError), CFSTR("Error"));
    v25 = objc_claimAutoreleasedReturnValue(v24);
    error = v5->_error;
    v5->_error = (NSError *)v25;

    v27 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSNumber), CFSTR("DidSucceed"));
    v28 = objc_claimAutoreleasedReturnValue(v27);
    didSucceed = v5->_didSucceed;
    v5->_didSucceed = (NSNumber *)v28;

    v30 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSNumber), CFSTR("Filter"));
    v31 = objc_claimAutoreleasedReturnValue(v30);
    filter = v5->_filter;
    v5->_filter = (NSNumber *)v31;

    v33 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSNumber), CFSTR("FilterType"));
    v34 = objc_claimAutoreleasedReturnValue(v33);
    filterType = v5->_filterType;
    v5->_filterType = (NSNumber *)v34;

    v5->_result = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("Result"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSData *merchantId;
  id v5;

  merchantId = self->_merchantId;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", merchantId, CFSTR("MerchantId"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_signupUrl, CFSTR("SignupUrl"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_terminalAppVersion, CFSTR("TerminalAppVersion"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_terminalMode, CFSTR("TerminalMode"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_passData, CFSTR("PassData"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_token, CFSTR("Token"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_error, CFSTR("Error"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_didSucceed, CFSTR("DidSucceed"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_filter, CFSTR("Filter"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_filterType, CFSTR("FilterType"));
  objc_msgSend(v5, "encodeInt32:forKey:", self->_result, CFSTR("Result"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  unsigned int v3;
  const __CFString *v4;
  uint64_t v5;
  const __CFString *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  const __CFString *v12;
  const __CFString *v13;
  objc_super v14;

  v3 = -[NSNumber intValue](self->_terminalMode, "intValue") - 1;
  if (v3 > 7)
    v4 = CFSTR("Unknown");
  else
    v4 = off_1002E7DF8[v3];
  v13 = v4;
  v5 = (int)self->_result;
  if (v5 > 4)
    v6 = CFSTR("Unknown Error");
  else
    v6 = off_1002E7E38[v5];
  v12 = v6;
  v7 = objc_alloc((Class)NSString);
  v14.receiver = self;
  v14.super_class = (Class)NFValueAddedServiceTransaction;
  v8 = -[NFValueAddedServiceTransaction description](&v14, "description");
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = objc_msgSend(v7, "initWithFormat:", CFSTR("%@ { merchantID=\"%@\" signupURL=%@ terminalAppVersion=%@ terminalModeDescription=%@ terminalMode=%@ filter=%@ filterType=%@ didSucceed=%@ passData=%@ token=%@ errorCode=0x%04x error=%@ result=0x%04x resultDescription=%@ }"), v9, self->_merchantId, self->_signupUrl, self->_terminalAppVersion, v13, self->_terminalMode, self->_filter, self->_filterType, self->_didSucceed, self->_passData, self->_token, -[NSError code](self->_error, "code"), self->_error, self->_result, v12);

  return v10;
}

- (id)asDictionary
{
  unsigned int v3;
  const __CFString *v4;
  uint64_t v5;
  const __CFString *v6;
  NSMutableDictionary *v7;
  NSMutableDictionary *v8;
  NSData *merchantId;
  NSString *signupUrl;
  NSNumber *terminalAppVersion;
  NSNumber *terminalMode;
  NSNumber *filter;
  NSNumber *filterType;
  NSNumber *didSucceed;
  NSData *passData;
  NSData *token;
  id v18;
  void *v19;
  void *v20;

  v3 = -[NSNumber intValue](self->_terminalMode, "intValue") - 1;
  if (v3 > 7)
    v4 = CFSTR("Unknown");
  else
    v4 = off_1002E7DF8[v3];
  v5 = (int)self->_result;
  if (v5 > 4)
    v6 = CFSTR("Unknown Error");
  else
    v6 = off_1002E7E38[v5];
  v7 = objc_opt_new(NSMutableDictionary);
  v8 = v7;
  merchantId = self->_merchantId;
  if (merchantId)
    -[NSMutableDictionary setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", merchantId, CFSTR("merchantID"));
  signupUrl = self->_signupUrl;
  if (signupUrl)
    -[NSMutableDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", signupUrl, CFSTR("signupURL"));
  terminalAppVersion = self->_terminalAppVersion;
  if (terminalAppVersion)
    -[NSMutableDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", terminalAppVersion, CFSTR("terminalAppVersion"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v4, CFSTR("terminalModeDescription"));
  terminalMode = self->_terminalMode;
  if (terminalMode)
    -[NSMutableDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", terminalMode, CFSTR("terminalMode"));
  filter = self->_filter;
  if (filter)
    -[NSMutableDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", filter, CFSTR("filter"));
  filterType = self->_filterType;
  if (filterType)
    -[NSMutableDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", filterType, CFSTR("filterType"));
  didSucceed = self->_didSucceed;
  if (didSucceed)
    -[NSMutableDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", didSucceed, CFSTR("didSucceed"));
  passData = self->_passData;
  if (passData)
    -[NSMutableDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", passData, CFSTR("passData"));
  token = self->_token;
  if (token)
    -[NSMutableDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", token, CFSTR("token"));
  if (self->_error)
  {
    v18 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("0x%04x"), -[NSError code](self->_error, "code"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v18, CFSTR("errorCode"));

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSError description](self->_error, "description"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v19, CFSTR("error"));

  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v6, CFSTR("resultDescription"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_result));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v20, CFSTR("result"));

  return v8;
}

- (NSData)merchantId
{
  return self->_merchantId;
}

- (NSString)signupUrl
{
  return self->_signupUrl;
}

- (NSNumber)terminalAppVersion
{
  return self->_terminalAppVersion;
}

- (NSNumber)terminalMode
{
  return self->_terminalMode;
}

- (NSNumber)didSucceed
{
  return self->_didSucceed;
}

- (NSData)passData
{
  return self->_passData;
}

- (NSData)token
{
  return self->_token;
}

- (NSError)error
{
  return self->_error;
}

- (NSNumber)filter
{
  return self->_filter;
}

- (NSNumber)filterType
{
  return self->_filterType;
}

- (unsigned)result
{
  return self->_result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filterType, 0);
  objc_storeStrong((id *)&self->_filter, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_token, 0);
  objc_storeStrong((id *)&self->_passData, 0);
  objc_storeStrong((id *)&self->_didSucceed, 0);
  objc_storeStrong((id *)&self->_terminalMode, 0);
  objc_storeStrong((id *)&self->_terminalAppVersion, 0);
  objc_storeStrong((id *)&self->_signupUrl, 0);
  objc_storeStrong((id *)&self->_merchantId, 0);
}

@end
