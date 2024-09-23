@implementation PKAccountWebServiceTransfersResponse

- (PKAccountWebServiceTransfersResponse)initWithData:(id)a3
{
  return -[PKAccountWebServiceTransfersResponse initWithData:account:request:](self, "initWithData:account:request:", a3, 0, 0);
}

- (PKAccountWebServiceTransfersResponse)initWithData:(id)a3 account:(id)a4 request:(id)a5
{
  id v7;
  PKAccountWebServiceTransfersResponse *v8;
  PKAccountWebServiceTransfersResponse *v9;
  void *v10;
  void *v11;
  NSArray *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  objc_class *v16;
  void *v17;
  objc_class *v18;
  void *v19;
  PKAccountWebServiceTransfersResponse *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  id v27;
  PKAccountTransfer *v28;
  NSArray *transfers;
  PKAccountWebServiceTransfersResponse *v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  objc_super v37;
  uint8_t v38[128];
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v37.receiver = self;
  v37.super_class = (Class)PKAccountWebServiceTransfersResponse;
  v8 = -[PKWebServiceResponse initWithData:](&v37, sel_initWithData_, a3);
  v9 = v8;
  if (!v8)
  {
LABEL_19:
    v20 = v9;
    goto LABEL_20;
  }
  -[PKWebServiceResponse JSONObject](v8, "JSONObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v10, "PKArrayForKey:", CFSTR("transfers"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v12 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v31 = v9;
    v32 = v7;
    if (objc_msgSend(v7, "type") == 4)
    {
      objc_msgSend(v7, "savingsDetails");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "productTimeZone");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v14 = 0;
    }
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v21 = v11;
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v34;
      do
      {
        for (i = 0; i != v23; ++i)
        {
          if (*(_QWORD *)v34 != v24)
            objc_enumerationMutation(v21);
          v26 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v27 = v26;
            v28 = -[PKAccountTransfer initWithDictionary:productTimeZone:]([PKAccountTransfer alloc], "initWithDictionary:productTimeZone:", v27, v14);
            -[NSArray safelyAddObject:](v12, "safelyAddObject:", v28);

          }
        }
        v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
      }
      while (v23);
    }

    v9 = v31;
    transfers = v31->_transfers;
    v31->_transfers = v12;

    v7 = v32;
    goto LABEL_19;
  }
  PKLogFacilityTypeGetObject(0xEuLL);
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = (objc_class *)objc_opt_class();
    NSStringFromClass(v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (objc_class *)objc_opt_class();
    NSStringFromClass(v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v40 = v17;
    v41 = 2114;
    v42 = v19;
    _os_log_impl(&dword_18FC92000, v15, OS_LOG_TYPE_DEFAULT, "Malformed %{public}@: expected dictionary and received %{public}@", buf, 0x16u);

  }
  v20 = 0;
LABEL_20:

  return v20;
}

- (NSArray)transfers
{
  return self->_transfers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transfers, 0);
}

@end
