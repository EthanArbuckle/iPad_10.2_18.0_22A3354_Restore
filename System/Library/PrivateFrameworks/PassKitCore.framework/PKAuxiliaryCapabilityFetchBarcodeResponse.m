@implementation PKAuxiliaryCapabilityFetchBarcodeResponse

- (PKAuxiliaryCapabilityFetchBarcodeResponse)initWithData:(id)a3
{
  PKAuxiliaryCapabilityFetchBarcodeResponse *v3;
  PKAuxiliaryCapabilityFetchBarcodeResponse *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *p_super;
  uint64_t v9;
  NSArray *barcodes;
  objc_class *v11;
  void *v12;
  objc_class *v13;
  void *v14;
  _QWORD v16[4];
  id v17;
  objc_super v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v18.receiver = self;
  v18.super_class = (Class)PKAuxiliaryCapabilityFetchBarcodeResponse;
  v3 = -[PKWebServiceResponse initWithData:](&v18, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    -[PKWebServiceResponse JSONObject](v3, "JSONObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v5, "objectForKey:", CFSTR("barcodes"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v16[0] = MEMORY[0x1E0C809B0];
        v16[1] = 3221225472;
        v16[2] = __58__PKAuxiliaryCapabilityFetchBarcodeResponse_initWithData___block_invoke;
        v16[3] = &unk_1E2AC59C0;
        v17 = v7;
        p_super = v7;
        objc_msgSend(v6, "enumerateObjectsUsingBlock:", v16);
        v9 = -[NSObject copy](p_super, "copy");
        barcodes = v4->_barcodes;
        v4->_barcodes = (NSArray *)v9;

LABEL_10:
        return v4;
      }
      p_super = &v4->super.super.super.super;
    }
    else
    {
      PKLogFacilityTypeGetObject(0x1CuLL);
      p_super = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
      {
        v11 = (objc_class *)objc_opt_class();
        NSStringFromClass(v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (objc_class *)objc_opt_class();
        NSStringFromClass(v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v20 = v12;
        v21 = 2114;
        v22 = v14;
        _os_log_impl(&dword_18FC92000, p_super, OS_LOG_TYPE_DEFAULT, "Malformed %{public}@: expected dictionary and received %{public}@", buf, 0x16u);

      }
      v6 = v4;
    }
    v4 = 0;
    goto LABEL_10;
  }
  return v4;
}

void __58__PKAuxiliaryCapabilityFetchBarcodeResponse_initWithData___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  PKBarcodeCredential *v4;
  id v5;

  v5 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = *(void **)(a1 + 32);
    v4 = -[PKBarcodeCredential initWithDictionary:]([PKBarcodeCredential alloc], "initWithDictionary:", v5);
    objc_msgSend(v3, "safelyAddObject:", v4);

  }
}

- (NSArray)barcodes
{
  return self->_barcodes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_barcodes, 0);
}

@end
