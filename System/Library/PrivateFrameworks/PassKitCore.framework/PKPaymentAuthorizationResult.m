@implementation PKPaymentAuthorizationResult

- (PKPaymentAuthorizationResult)initWithStatus:(PKPaymentAuthorizationStatus)status errors:(NSArray *)errors
{
  NSArray *v6;
  PKPaymentAuthorizationResult *v7;
  PKPaymentAuthorizationResult *v8;
  NSArray *v9;
  NSArray *v10;
  objc_super v12;

  v6 = errors;
  v12.receiver = self;
  v12.super_class = (Class)PKPaymentAuthorizationResult;
  v7 = -[PKPaymentAuthorizationResult init](&v12, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_status = status;
    if (v6)
    {
      +[PKPaymentAuthorizationResult sanitizedErrors:](PKPaymentAuthorizationResult, "sanitizedErrors:", v6);
      v9 = (NSArray *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99D20]);
    }
    v10 = v8->_errors;
    v8->_errors = v9;

  }
  return v8;
}

- (PKPaymentAuthorizationResult)initWithCoder:(id)a3
{
  id v4;
  PKPaymentAuthorizationResult *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSArray *errors;
  uint64_t v11;
  PKPeerPaymentTransactionMetadata *peerPaymentTransactionMetadata;
  uint64_t v13;
  NSString *localizedErrorMessageOverride;
  uint64_t v15;
  PKPaymentOrderDetails *orderDetails;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)PKPaymentAuthorizationResult;
  v5 = -[PKPaymentAuthorizationResult init](&v18, sel_init);
  if (v5)
  {
    v5->_status = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("status"));
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("errors"));
    v9 = objc_claimAutoreleasedReturnValue();
    errors = v5->_errors;
    v5->_errors = (NSArray *)v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("peerPaymentTransactionMetadata"));
    v11 = objc_claimAutoreleasedReturnValue();
    peerPaymentTransactionMetadata = v5->_peerPaymentTransactionMetadata;
    v5->_peerPaymentTransactionMetadata = (PKPeerPaymentTransactionMetadata *)v11;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("localizedErrorMessageOverride"));
    v13 = objc_claimAutoreleasedReturnValue();
    localizedErrorMessageOverride = v5->_localizedErrorMessageOverride;
    v5->_localizedErrorMessageOverride = (NSString *)v13;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("orderDetails"));
    v15 = objc_claimAutoreleasedReturnValue();
    orderDetails = v5->_orderDetails;
    v5->_orderDetails = (PKPaymentOrderDetails *)v15;

  }
  return v5;
}

- (PKPaymentAuthorizationResult)init
{
  return -[PKPaymentAuthorizationResult initWithStatus:errors:](self, "initWithStatus:errors:", 0, MEMORY[0x1E0C9AA60]);
}

- (void)encodeWithCoder:(id)a3
{
  int64_t status;
  id v5;

  status = self->_status;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", status, CFSTR("status"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_errors, CFSTR("errors"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_peerPaymentTransactionMetadata, CFSTR("peerPaymentTransactionMetadata"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_localizedErrorMessageOverride, CFSTR("localizedErrorMessageOverride"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_orderDetails, CFSTR("orderDetails"));

}

- (void)setErrors:(NSArray *)errors
{
  NSArray *v4;
  NSArray *v5;
  NSArray *v6;
  NSArray *v7;
  NSArray *v8;

  v4 = errors;
  v5 = v4;
  v6 = self->_errors;
  if (v6 != v4)
  {
    v8 = v4;
    if (v4)
    {
      +[PKPaymentAuthorizationResult sanitizedErrors:](PKPaymentAuthorizationResult, "sanitizedErrors:", v4);
      v7 = (NSArray *)objc_claimAutoreleasedReturnValue();
      v6 = self->_errors;
    }
    else
    {
      v7 = (NSArray *)MEMORY[0x1E0C9AA60];
    }
    self->_errors = v7;

    v5 = v8;
  }

}

+ (id)sanitizedErrors:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id obj;
  uint64_t v19;
  id v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v20 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  obj = v3;
  v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v21)
  {
    v19 = *(_QWORD *)v23;
    v4 = *MEMORY[0x1E0CB2D50];
    do
    {
      for (i = 0; i != v21; ++i)
      {
        if (*(_QWORD *)v23 != v19)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_msgSend(v6, "userInfo");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("PKPaymentErrorContactField"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, CFSTR("PKPaymentErrorContactField"));

        objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("PKDisbursementErrorContactField"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setObject:forKeyedSubscript:", v10, CFSTR("PKDisbursementErrorContactField"));

        objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("PKPaymentErrorPostalAddress"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setObject:forKeyedSubscript:", v11, CFSTR("PKPaymentErrorPostalAddress"));

        objc_msgSend(v7, "objectForKeyedSubscript:", v4);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setObject:forKeyedSubscript:", v12, v4);

        v13 = objc_alloc(MEMORY[0x1E0CB35C8]);
        objc_msgSend(v6, "domain");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = (void *)objc_msgSend(v13, "initWithDomain:code:userInfo:", v14, objc_msgSend(v6, "code"), v8);

        objc_msgSend(v20, "addObject:", v15);
      }
      v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v21);
  }

  v16 = (void *)objc_msgSend(v20, "copy");
  return v16;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPaymentAuthorizationStatus)status
{
  return self->_status;
}

- (void)setStatus:(PKPaymentAuthorizationStatus)status
{
  self->_status = status;
}

- (NSArray)errors
{
  return self->_errors;
}

- (PKPaymentOrderDetails)orderDetails
{
  return self->_orderDetails;
}

- (void)setOrderDetails:(PKPaymentOrderDetails *)orderDetails
{
  objc_storeStrong((id *)&self->_orderDetails, orderDetails);
}

- (PKPeerPaymentTransactionMetadata)peerPaymentTransactionMetadata
{
  return self->_peerPaymentTransactionMetadata;
}

- (void)setPeerPaymentTransactionMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_peerPaymentTransactionMetadata, a3);
}

- (NSString)localizedErrorMessageOverride
{
  return self->_localizedErrorMessageOverride;
}

- (void)setLocalizedErrorMessageOverride:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (int64_t)resultSource
{
  return self->_resultSource;
}

- (void)setResultSource:(int64_t)a3
{
  self->_resultSource = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedErrorMessageOverride, 0);
  objc_storeStrong((id *)&self->_peerPaymentTransactionMetadata, 0);
  objc_storeStrong((id *)&self->_orderDetails, 0);
  objc_storeStrong((id *)&self->_errors, 0);
}

@end
