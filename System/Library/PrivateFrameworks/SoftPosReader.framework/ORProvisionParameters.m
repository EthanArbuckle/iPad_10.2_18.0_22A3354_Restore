@implementation ORProvisionParameters

- (ORProvisionParameters)initWithAmount:(id *)a3 currencyCode:(int64_t)a4 countryCode:(int64_t)a5 provisionReadTimeout:(int64_t)a6 transactionId:(id)a7 unpredictableNumber:(id)a8
{
  id v14;
  id v15;
  ORProvisionParameters *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  ORProvisionParameters *v22;
  __int128 v23;
  uint64_t v24;
  NSData *transactionId;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  NSData *unpredictableNumber;
  objc_super v34;

  v14 = a7;
  v15 = a8;
  v34.receiver = self;
  v34.super_class = (Class)ORProvisionParameters;
  v16 = -[ORProvisionParameters init](&v34, sel_init);
  v22 = v16;
  if (v16)
  {
    v23 = *(_OWORD *)a3;
    *(_DWORD *)&v16->_amount._mantissa[6] = *(_DWORD *)&a3->var5[6];
    *(_OWORD *)&v16->_amount = v23;
    v16->_currencyCode = a4;
    v16->_countryCode = a5;
    v16->_provisionReadTimeout = a6;
    v24 = objc_msgSend_copy(v14, v17, v18, v19, v20, v21);
    transactionId = v22->_transactionId;
    v22->_transactionId = (NSData *)v24;

    v31 = objc_msgSend_copy(v15, v26, v27, v28, v29, v30);
    unpredictableNumber = v22->_unpredictableNumber;
    v22->_unpredictableNumber = (NSData *)v31;

  }
  return v22;
}

- (id)description
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  void *v7;
  int64_t provisionReadTimeout;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  __int128 v27;
  $FCF7D23349B6810E0BB445A99467135A amount;

  v6 = (void *)MEMORY[0x24BDD17C8];
  amount = self->_amount;
  objc_msgSend_decimalNumberWithDecimal_(MEMORY[0x24BDD1518], a2, (uint64_t)&amount, v2, v3, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = *(_OWORD *)&self->_currencyCode;
  provisionReadTimeout = self->_provisionReadTimeout;
  objc_msgSend_asHexString(self->_transactionId, v9, v10, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_asHexString(self->_unpredictableNumber, v15, v16, v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v6, v21, (uint64_t)CFSTR("{amount=%@, currencyCode=%ld, countryCode=%ld, provisionReadTimeout=%ld, transactionId=%@, unpredictableNumber=%@}"), v22, v23, v24, v7, v27, provisionReadTimeout, v14, v20);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ORProvisionParameters)initWithCoder:(id)a3
{
  id v4;
  ORProvisionParameters *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  ORProvisionParameters *v10;
  $FCF7D23349B6810E0BB445A99467135A *p_amount;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSData *transactionId;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  NSData *unpredictableNumber;
  __int128 v33;
  int v34;
  objc_super v35;

  v4 = a3;
  v35.receiver = self;
  v35.super_class = (Class)ORProvisionParameters;
  v5 = -[ORProvisionParameters init](&v35, sel_init);
  v10 = v5;
  if (v5)
  {
    p_amount = &v5->_amount;
    if (v4)
    {
      objc_msgSend_decodeDecimalForKey_(v4, v6, (uint64_t)CFSTR("amount"), v7, v8, v9);
    }
    else
    {
      v33 = 0uLL;
      v34 = 0;
    }
    *(_OWORD *)p_amount = v33;
    *(_DWORD *)&v10->_amount._mantissa[6] = v34;
    v10->_currencyCode = objc_msgSend_decodeIntegerForKey_(v4, v6, (uint64_t)CFSTR("currencyCode"), v7, v8, v9);
    v10->_countryCode = objc_msgSend_decodeIntegerForKey_(v4, v12, (uint64_t)CFSTR("countryCode"), v13, v14, v15);
    v10->_provisionReadTimeout = objc_msgSend_decodeIntegerForKey_(v4, v16, (uint64_t)CFSTR("provisionReadTimeout"), v17, v18, v19);
    v20 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v21, v20, (uint64_t)CFSTR("transactionId"), v22, v23);
    v24 = objc_claimAutoreleasedReturnValue();
    transactionId = v10->_transactionId;
    v10->_transactionId = (NSData *)v24;

    v26 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v27, v26, (uint64_t)CFSTR("unpredictableNumber"), v28, v29);
    v30 = objc_claimAutoreleasedReturnValue();
    unpredictableNumber = v10->_unpredictableNumber;
    v10->_unpredictableNumber = (NSData *)v30;

  }
  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  __int128 amount;
  uint64_t v24;

  amount = (__int128)self->_amount;
  LODWORD(v24) = *(_DWORD *)&self->_amount._mantissa[6];
  v4 = a3;
  objc_msgSend_encodeDecimal_forKey_(v4, v5, (uint64_t)&amount, (uint64_t)CFSTR("amount"), v6, v7);
  objc_msgSend_encodeInteger_forKey_(v4, v8, self->_currencyCode, (uint64_t)CFSTR("currencyCode"), v9, v10, amount, v24);
  objc_msgSend_encodeInteger_forKey_(v4, v11, self->_countryCode, (uint64_t)CFSTR("countryCode"), v12, v13);
  objc_msgSend_encodeInteger_forKey_(v4, v14, self->_provisionReadTimeout, (uint64_t)CFSTR("provisionReadTimeout"), v15, v16);
  objc_msgSend_encodeObject_forKey_(v4, v17, (uint64_t)self->_transactionId, (uint64_t)CFSTR("transactionId"), v18, v19);
  objc_msgSend_encodeObject_forKey_(v4, v20, (uint64_t)self->_unpredictableNumber, (uint64_t)CFSTR("unpredictableNumber"), v21, v22);

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
