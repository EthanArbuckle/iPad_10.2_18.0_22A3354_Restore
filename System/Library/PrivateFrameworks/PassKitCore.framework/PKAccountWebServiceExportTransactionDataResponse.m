@implementation PKAccountWebServiceExportTransactionDataResponse

- (PKAccountWebServiceExportTransactionDataResponse)initWithData:(id)a3 account:(id)a4 request:(id)a5
{
  id v7;
  PKAccountWebServiceExportTransactionDataResponse *v8;
  id *p_isa;
  void *v10;
  NSObject *v11;
  PKAccountExportedTransactionInfo *v12;
  id v13;
  uint64_t v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  void *v22;
  objc_class *v23;
  objc_class *v24;
  NSObject *v25;
  const char *v26;
  objc_class *v27;
  objc_class *v28;
  NSObject *v29;
  uint32_t v30;
  PKAccountWebServiceExportTransactionDataResponse *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  objc_class *v35;
  id v36;
  PKAccountStatementMetadata *v37;
  void *v38;
  PKAccountStatementMetadata *v39;
  objc_class *v41;
  NSObject *v42;
  objc_super v43;
  uint8_t buf[4];
  NSObject *v45;
  __int16 v46;
  NSObject *v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v7 = a5;
  v43.receiver = self;
  v43.super_class = (Class)PKAccountWebServiceExportTransactionDataResponse;
  v8 = -[PKWebServiceResponse initWithData:](&v43, sel_initWithData_, a3);
  p_isa = (id *)&v8->super.super.super.super.isa;
  if (!v8)
    goto LABEL_26;
  -[PKWebServiceResponse JSONObject](v8, "JSONObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = v7;
      v12 = objc_alloc_init(PKAccountExportedTransactionInfo);
      v13 = p_isa[4];
      p_isa[4] = v12;

      v14 = -[NSObject type](v11, "type");
      if (v14 == 1)
      {
        objc_msgSend(v10, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("transactionMetadata"));
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = v32;
        if (v32)
        {
          v34 = v32;
        }
        else
        {
          objc_msgSend(v10, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("metadata"));
          v34 = objc_claimAutoreleasedReturnValue();
        }
        v20 = v34;

        v36 = p_isa[4];
        v37 = [PKAccountStatementMetadata alloc];
        -[NSObject accountIdentifier](v11, "accountIdentifier");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject statementIdentifier](v11, "statementIdentifier");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = -[PKAccountStatementMetadata initWithArray:accountIdentifier:statementIdentifier:](v37, "initWithArray:accountIdentifier:statementIdentifier:", v20, v22, v38);
        objc_msgSend(v36, "setStatementMetadata:", v39);

        goto LABEL_24;
      }
      if (v14)
      {
LABEL_25:

LABEL_26:
        v31 = p_isa;
        goto LABEL_27;
      }
      v15 = p_isa[4];
      objc_msgSend(v10, "PKStringForKey:", CFSTR("transactionDataFilename"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setTransactionDataFilename:", v16);

      v17 = p_isa[4];
      objc_msgSend(v10, "PKStringForKey:", CFSTR("transactionDataHash"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setTransactionDataHash:", v18);

      objc_msgSend(v10, "PKStringForKey:", CFSTR("transactionData"));
      v19 = objc_claimAutoreleasedReturnValue();
      if (v19)
      {
        v20 = v19;
        v21 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v19, 0);
        if (v21)
        {
          v22 = (void *)v21;
          objc_msgSend(p_isa[4], "setTransactionData:", v21);
LABEL_24:

          goto LABEL_25;
        }
        PKLogFacilityTypeGetObject(0xEuLL);
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          v41 = (objc_class *)objc_opt_class();
          NSStringFromClass(v41);
          v42 = objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v45 = v42;
          _os_log_impl(&dword_18FC92000, v25, OS_LOG_TYPE_DEFAULT, "Malformed %{public}@: expected transactionData", buf, 0xCu);

        }
        goto LABEL_15;
      }
      PKLogFacilityTypeGetObject(0xEuLL);
      v20 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        goto LABEL_16;
      v35 = (objc_class *)objc_opt_class();
      NSStringFromClass(v35);
      v25 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v45 = v25;
      v26 = "Malformed %{public}@: expected transactionData";
      v29 = v20;
      v30 = 12;
LABEL_14:
      _os_log_impl(&dword_18FC92000, v29, OS_LOG_TYPE_DEFAULT, v26, buf, v30);
LABEL_15:

LABEL_16:
      goto LABEL_17;
    }
    PKLogFacilityTypeGetObject(0xEuLL);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v27 = (objc_class *)objc_opt_class();
      NSStringFromClass(v27);
      v20 = objc_claimAutoreleasedReturnValue();
      v28 = (objc_class *)objc_opt_class();
      NSStringFromClass(v28);
      v25 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v45 = v20;
      v46 = 2114;
      v47 = v25;
      v26 = "Malformed %{public}@: request is of wrong class type, received %{public}@";
      goto LABEL_13;
    }
  }
  else
  {
    PKLogFacilityTypeGetObject(0xEuLL);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v23 = (objc_class *)objc_opt_class();
      NSStringFromClass(v23);
      v20 = objc_claimAutoreleasedReturnValue();
      v24 = (objc_class *)objc_opt_class();
      NSStringFromClass(v24);
      v25 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v45 = v20;
      v46 = 2114;
      v47 = v25;
      v26 = "Malformed %{public}@: expected dictionary and received %{public}@";
LABEL_13:
      v29 = v11;
      v30 = 22;
      goto LABEL_14;
    }
  }
LABEL_17:

  v31 = 0;
LABEL_27:

  return v31;
}

- (PKAccountExportedTransactionInfo)exportedTransactionInfo
{
  return self->_exportedTransactionInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_exportedTransactionInfo, 0);
}

@end
