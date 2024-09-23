@implementation SAMLLogoutRequest

- (SAMLLogoutRequest)initWithData:(id)a3 schema:(id)a4 error:(id *)a5
{
  id v8;
  SAMLLogoutRequest *v9;
  SAMLLogoutRequest *v10;
  void *v11;
  char isKindOfClass;
  uint64_t v13;
  SAMLLogoutRequestElement *requestElement;
  NSData *v15;
  void *schemaData;
  objc_class *v17;
  objc_super v19;

  v8 = a4;
  v19.receiver = self;
  v19.super_class = (Class)SAMLLogoutRequest;
  v9 = -[XMLWrapperDoc initWithData:schema:error:](&v19, sel_initWithData_schema_error_, a3, v8, a5);
  v10 = v9;
  if (v9)
  {
    -[XMLWrapperDoc documentElement](v9, "documentElement");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      -[XMLWrapperDoc documentElement](v10, "documentElement");
      v13 = objc_claimAutoreleasedReturnValue();
      requestElement = v10->_requestElement;
      v10->_requestElement = (SAMLLogoutRequestElement *)v13;

      v15 = (NSData *)v8;
      schemaData = v10->_schemaData;
      v10->_schemaData = v15;
LABEL_6:

      goto LABEL_7;
    }
    if (a5)
    {
      -[XMLWrapperDoc documentElement](v10, "documentElement");
      schemaData = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (objc_class *)objc_opt_class();
      SAMLInvalidDocumentElementErrorForClass(v17);
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
  }
LABEL_7:

  return v10;
}

- (SAMLLogoutRequest)initWithElement:(id)a3 schema:(id)a4 error:(id *)a5
{
  SAMLLogoutRequest *v5;
  SAMLLogoutRequest *v6;
  uint64_t v7;
  SAMLLogoutRequestElement *requestElement;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SAMLLogoutRequest;
  v5 = -[XMLWrapperDoc initWithElement:schema:error:](&v10, sel_initWithElement_schema_error_, a3, a4, a5);
  v6 = v5;
  if (v5)
  {
    -[XMLWrapperDoc documentElement](v5, "documentElement");
    v7 = objc_claimAutoreleasedReturnValue();
    requestElement = v6->_requestElement;
    v6->_requestElement = (SAMLLogoutRequestElement *)v7;

  }
  return v6;
}

- (NSString)issuer
{
  void *v2;
  void *v3;

  -[SAMLLogoutRequest requestElement](self, "requestElement");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "issuer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setIssuer:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SAMLLogoutRequest requestElement](self, "requestElement");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIssuer:", v4);

}

- (NSString)reason
{
  void *v2;
  void *v3;

  -[SAMLLogoutRequest requestElement](self, "requestElement");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reason");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setReason:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SAMLLogoutRequest requestElement](self, "requestElement");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setReason:", v4);

}

- (NSDate)notOnOrAfter
{
  void *v2;
  void *v3;

  -[SAMLLogoutRequest requestElement](self, "requestElement");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "notOnOrAfter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v3;
}

- (void)setNotOnOrAfter:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SAMLLogoutRequest requestElement](self, "requestElement");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setNotOnOrAfter:", v4);

}

- (SAMLLogoutRequestElement)requestElement
{
  return self->_requestElement;
}

- (void)setRequestElement:(id)a3
{
  objc_storeStrong((id *)&self->_requestElement, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestElement, 0);
  objc_storeStrong((id *)&self->_schemaData, 0);
}

@end
