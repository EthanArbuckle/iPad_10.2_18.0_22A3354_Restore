@implementation PKAccountWebServiceTaxFormsResponse

- (PKAccountWebServiceTaxFormsResponse)initWithData:(id)a3
{
  PKAccountWebServiceTaxFormsResponse *v3;
  PKAccountWebServiceTaxFormsResponse *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  PKAccountTaxForm *v12;
  uint64_t v13;
  NSArray *taxForms;
  PKAccountWebServiceTaxFormsResponse *v15;
  NSObject *v16;
  objc_class *v17;
  void *v18;
  objc_class *v19;
  void *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  objc_super v26;
  uint8_t v27[128];
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v26.receiver = self;
  v26.super_class = (Class)PKAccountWebServiceTaxFormsResponse;
  v3 = -[PKWebServiceResponse initWithData:](&v26, sel_initWithData_, a3);
  v4 = v3;
  if (!v3)
  {
LABEL_13:
    v15 = v4;
    goto LABEL_17;
  }
  -[PKWebServiceResponse JSONObject](v3, "JSONObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    objc_msgSend(v5, "PKArrayForKey:", CFSTR("taxForms"), 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v23;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v23 != v10)
            objc_enumerationMutation(v7);
          v12 = -[PKAccountTaxForm initWithDictionary:]([PKAccountTaxForm alloc], "initWithDictionary:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v11));
          if (v12)
            objc_msgSend(v6, "addObject:", v12);

          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
      }
      while (v9);
    }

    v13 = objc_msgSend(v6, "copy");
    taxForms = v4->_taxForms;
    v4->_taxForms = (NSArray *)v13;

    goto LABEL_13;
  }
  PKLogFacilityTypeGetObject(0xEuLL);
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = (objc_class *)objc_opt_class();
    NSStringFromClass(v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (objc_class *)objc_opt_class();
    NSStringFromClass(v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v29 = v18;
    v30 = 2114;
    v31 = v20;
    _os_log_impl(&dword_18FC92000, v16, OS_LOG_TYPE_DEFAULT, "Malformed %{public}@: expected dictionary and received %{public}@", buf, 0x16u);

  }
  v15 = 0;
LABEL_17:

  return v15;
}

- (NSArray)taxForms
{
  return self->_taxForms;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_taxForms, 0);
}

@end
