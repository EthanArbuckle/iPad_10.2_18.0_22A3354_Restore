@implementation PKAccountWebServiceDocumentActionResponse

- (PKAccountWebServiceDocumentActionResponse)initWithData:(id)a3
{
  PKAccountWebServiceDocumentActionResponse *v3;
  PKAccountWebServiceDocumentActionResponse *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSData *documentPDFData;
  PKAccountWebServiceDocumentActionResponse *v13;
  NSObject *v14;
  objc_class *v15;
  void *v16;
  objc_class *v17;
  void *v18;
  objc_super v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v20.receiver = self;
  v20.super_class = (Class)PKAccountWebServiceDocumentActionResponse;
  v3 = -[PKWebServiceResponse initWithData:](&v20, sel_initWithData_, a3);
  v4 = v3;
  if (!v3)
  {
LABEL_15:
    v13 = v4;
    goto LABEL_19;
  }
  -[PKWebServiceResponse JSONObject](v3, "JSONObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v5, "PKStringForKey:", CFSTR("statementDataFilename"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (!v6)
    {
      objc_msgSend(v5, "PKStringForKey:", CFSTR("dataFilename"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_storeStrong((id *)&v4->_documentDataFilename, v7);
    if (!v6)

    objc_msgSend(v5, "PKStringForKey:", CFSTR("statementDataHash"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (!v8)
    {
      objc_msgSend(v5, "PKStringForKey:", CFSTR("dataHash"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_storeStrong((id *)&v4->_documentDataHash, v9);
    if (!v8)

    objc_msgSend(v5, "PKStringForKey:", CFSTR("statementPDFData"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10
      || (objc_msgSend(v5, "PKStringForKey:", CFSTR("pdfData")),
          (v10 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v10, 0);
      documentPDFData = v4->_documentPDFData;
      v4->_documentPDFData = (NSData *)v11;

    }
    goto LABEL_15;
  }
  PKLogFacilityTypeGetObject(0xEuLL);
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = (objc_class *)objc_opt_class();
    NSStringFromClass(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (objc_class *)objc_opt_class();
    NSStringFromClass(v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v22 = v16;
    v23 = 2114;
    v24 = v18;
    _os_log_impl(&dword_18FC92000, v14, OS_LOG_TYPE_DEFAULT, "Malformed %{public}@: expected dictionary and received %{public}@", buf, 0x16u);

  }
  v13 = 0;
LABEL_19:

  return v13;
}

- (NSData)documentPDFData
{
  return self->_documentPDFData;
}

- (NSString)documentDataFilename
{
  return self->_documentDataFilename;
}

- (NSString)documentDataHash
{
  return self->_documentDataHash;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_documentDataHash, 0);
  objc_storeStrong((id *)&self->_documentDataFilename, 0);
  objc_storeStrong((id *)&self->_documentPDFData, 0);
}

@end
