@implementation STSTapToProvisionParameters

- (STSTapToProvisionParameters)initWithAmount:(id *)a3 currencyCode:(int64_t)a4 countryCode:(int64_t)a5 provisionReadTimeout:(int64_t)a6 transactionId:(id)a7 unpredictableNumber:(id)a8
{
  id v15;
  id v16;
  STSTapToProvisionParameters *v17;
  STSTapToProvisionParameters *v18;
  __int128 v19;
  objc_super v21;

  v15 = a7;
  v16 = a8;
  v21.receiver = self;
  v21.super_class = (Class)STSTapToProvisionParameters;
  v17 = -[STSTapToProvisionParameters init](&v21, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_unpredictableNumber, a8);
    objc_storeStrong((id *)&v18->_transactionId, a7);
    v19 = *(_OWORD *)a3;
    *(_DWORD *)&v18->_amount._mantissa[6] = *(_DWORD *)&a3->var5[6];
    *(_OWORD *)&v18->_amount = v19;
    v18->_currencyCode = a4;
    v18->_countryCode = a5;
    v18->_provisionReadTimeout = a6;
  }

  return v18;
}

- (id)toOR
{
  id v3;
  int64_t currencyCode;
  int64_t countryCode;
  int64_t provisionReadTimeout;
  NSData *transactionId;
  NSData *unpredictableNumber;
  $FCF7D23349B6810E0BB445A99467135A amount;

  v3 = objc_alloc(MEMORY[0x24BEAE690]);
  currencyCode = self->_currencyCode;
  countryCode = self->_countryCode;
  provisionReadTimeout = self->_provisionReadTimeout;
  unpredictableNumber = self->_unpredictableNumber;
  transactionId = self->_transactionId;
  amount = self->_amount;
  return (id)objc_msgSend(v3, "initWithAmount:currencyCode:countryCode:provisionReadTimeout:transactionId:unpredictableNumber:", &amount, currencyCode, countryCode, provisionReadTimeout, transactionId, unpredictableNumber);
}

- (NSData)unpredictableNumber
{
  return self->_unpredictableNumber;
}

- (NSData)transactionId
{
  return self->_transactionId;
}

- ($2F068FC02377E22BA03580A8162C781E)amount
{
  *($FCF7D23349B6810E0BB445A99467135A *)retstr = *($FCF7D23349B6810E0BB445A99467135A *)((char *)self + 48);
  return self;
}

- (int64_t)currencyCode
{
  return self->_currencyCode;
}

- (int64_t)countryCode
{
  return self->_countryCode;
}

- (int64_t)provisionReadTimeout
{
  return self->_provisionReadTimeout;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transactionId, 0);
  objc_storeStrong((id *)&self->_unpredictableNumber, 0);
}

@end
