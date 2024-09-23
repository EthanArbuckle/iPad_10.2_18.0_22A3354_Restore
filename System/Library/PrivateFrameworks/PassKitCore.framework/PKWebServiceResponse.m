@implementation PKWebServiceResponse

- (PKWebServiceResponse)initWithData:(id)a3
{
  return -[PKWebServiceResponse initWithData:headers:](self, "initWithData:headers:", a3, 0);
}

- (PKWebServiceResponse)initWithData:(id)a3 headers:(id)a4
{
  id v6;
  id v7;
  _BOOL4 v8;
  int v9;
  int v10;
  NSObject *p_super;
  id v12;
  id v13;
  PKWebServiceResponse *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  NSData *rawData;
  NSDictionary *v20;
  objc_super v22;
  id v23;
  uint8_t buf[4];
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v6)
    v8 = objc_msgSend(v6, "length") != 0;
  else
    v8 = 0;
  v9 = objc_msgSend((id)objc_opt_class(), "jsonDataOptional");
  v10 = v9;
  if (!v8 && !v9)
  {
    PKLogFacilityTypeGetObject(6uLL);
    p_super = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v25 = (id)objc_opt_class();
      v12 = v25;
      _os_log_impl(&dword_18FC92000, p_super, OS_LOG_TYPE_DEFAULT, "Malformed response: %@ is missing data", buf, 0xCu);

    }
    v13 = 0;
    v14 = 0;
    v15 = self;
    goto LABEL_20;
  }
  if (v8)
  {
    v23 = 0;
    objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v6, 0, &v23);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v23;
    if (v15)
      goto LABEL_17;
  }
  else
  {
    v15 = 0;
    v13 = 0;
  }
  if (((v10 ^ 1 | v8) & 1) != 0)
  {
    PKLogFacilityTypeGetObject(6uLL);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v13, "localizedDescription");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v25 = v17;
      _os_log_impl(&dword_18FC92000, v16, OS_LOG_TYPE_DEFAULT, "Malformed response: %@", buf, 0xCu);

    }
    v15 = 0;
    v14 = 0;
    p_super = &self->super;
    goto LABEL_20;
  }
LABEL_17:
  v22.receiver = self;
  v22.super_class = (Class)PKWebServiceResponse;
  v14 = -[PKWebServiceResponse init](&v22, sel_init);
  if (v14)
  {
    v18 = objc_msgSend(v6, "copy");
    rawData = v14->_rawData;
    v14->_rawData = (NSData *)v18;

    objc_storeStrong(&v14->_JSONObject, v15);
    if (v7)
    {
      v20 = (NSDictionary *)v7;
      p_super = &v14->_headers->super;
      v14->_headers = v20;
LABEL_20:

    }
  }

  return v14;
}

+ (id)responseWithData:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithData:", v3);

  return v4;
}

+ (id)responseWithData:(id)a3 headers:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithData:headers:", v6, v5);

  return v7;
}

- (id)debugDescription
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p> JSONObject: %@ Headers: %@"), objc_opt_class(), self, self->_JSONObject, self->_headers);
}

+ (BOOL)jsonDataOptional
{
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKWebServiceResponse)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  PKWebServiceResponse *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("rawData"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[PKWebServiceResponse initWithData:](self, "initWithData:", v5);
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PKWebServiceResponse rawData](self, "rawData");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("rawData"));

}

- (NSData)rawData
{
  return self->_rawData;
}

- (id)JSONObject
{
  return self->_JSONObject;
}

- (NSDictionary)headers
{
  return self->_headers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headers, 0);
  objc_storeStrong(&self->_JSONObject, 0);
  objc_storeStrong((id *)&self->_rawData, 0);
}

@end
