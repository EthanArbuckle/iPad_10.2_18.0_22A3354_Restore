@implementation PKSTSTapToProvisionParameters

- (id)stsParameters
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];
  int v11;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v12[0] = 0;
  v12[1] = 0;
  v3 = objc_alloc_init(MEMORY[0x1E0CB3A28]);
  objc_msgSend(v3, "getUUIDBytes:", v12);

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", v12, 16);
  v5 = objc_alloc((Class)getSTSTapToProvisionParametersClass[0]());
  objc_msgSend(MEMORY[0x1E0CB3598], "zero");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "decimalValue");
  }
  else
  {
    v10[0] = 0;
    v10[1] = 0;
    v11 = 0;
  }
  v8 = (void *)objc_msgSend(v5, "initWithAmount:currencyCode:countryCode:provisionReadTimeout:transactionId:unpredictableNumber:", v10, self->_currencyCode, self->_countryCode, self->_timeout, v4, self->_nonce);

  return v8;
}

- (NSString)sid
{
  return self->_sid;
}

- (void)setSid:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSData)nonce
{
  return self->_nonce;
}

- (void)setNonce:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (int64_t)currencyCode
{
  return self->_currencyCode;
}

- (void)setCurrencyCode:(int64_t)a3
{
  self->_currencyCode = a3;
}

- (int64_t)countryCode
{
  return self->_countryCode;
}

- (void)setCountryCode:(int64_t)a3
{
  self->_countryCode = a3;
}

- (int64_t)timeout
{
  return self->_timeout;
}

- (void)setTimeout:(int64_t)a3
{
  self->_timeout = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nonce, 0);
  objc_storeStrong((id *)&self->_sid, 0);
}

@end
