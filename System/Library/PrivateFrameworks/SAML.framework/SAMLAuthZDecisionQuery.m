@implementation SAMLAuthZDecisionQuery

- (SAMLAuthZDecisionQuery)initWithData:(id)a3 schema:(id)a4 error:(id *)a5
{
  SAMLAuthZDecisionQuery *v6;
  SAMLAuthZDecisionQuery *v7;
  void *v8;
  char isKindOfClass;
  uint64_t v10;
  void *requestElement;
  objc_class *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)SAMLAuthZDecisionQuery;
  v6 = -[XMLWrapperDoc initWithData:schema:error:](&v14, sel_initWithData_schema_error_, a3, a4);
  v7 = v6;
  if (v6)
  {
    -[XMLWrapperDoc documentElement](v6, "documentElement");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      -[XMLWrapperDoc documentElement](v7, "documentElement");
      v10 = objc_claimAutoreleasedReturnValue();
      requestElement = v7->_requestElement;
      v7->_requestElement = (SAMLAuthZDecisionQueryElement *)v10;
LABEL_6:

      return v7;
    }
    if (a5)
    {
      -[XMLWrapperDoc documentElement](v7, "documentElement");
      requestElement = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (objc_class *)objc_opt_class();
      SAMLInvalidDocumentElementErrorForClass(v12);
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
  }
  return v7;
}

- (SAMLAuthZDecisionQuery)initWithElement:(id)a3 schema:(id)a4 error:(id *)a5
{
  SAMLAuthZDecisionQuery *v5;
  SAMLAuthZDecisionQuery *v6;
  uint64_t v7;
  SAMLAuthZDecisionQueryElement *requestElement;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SAMLAuthZDecisionQuery;
  v5 = -[XMLWrapperDoc initWithElement:schema:error:](&v10, sel_initWithElement_schema_error_, a3, a4, a5);
  v6 = v5;
  if (v5)
  {
    -[XMLWrapperDoc documentElement](v5, "documentElement");
    v7 = objc_claimAutoreleasedReturnValue();
    requestElement = v6->_requestElement;
    v6->_requestElement = (SAMLAuthZDecisionQueryElement *)v7;

  }
  return v6;
}

- (NSString)channelId
{
  void *v2;
  void *v3;

  -[SAMLAuthZDecisionQuery requestElement](self, "requestElement");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "channelId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setSubjectFromResponse:(id)a3
{
  SAMLResponse *v4;
  void *v5;
  SAMLResponse *v6;
  void *v7;
  void *v8;
  id v9;

  objc_msgSend(a3, "dataUsingEncoding:", 4);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v4 = [SAMLResponse alloc];
  -[XMLWrapperDoc schemaData](self, "schemaData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[SAMLResponse initWithData:schema:error:](v4, "initWithData:schema:error:", v9, v5, 0);

  -[SAMLResponse subject](v6, "subject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SAMLAuthZDecisionQuery requestElement](self, "requestElement");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setSubject:", v7);

}

- (void)addAction:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SAMLAuthZDecisionQuery requestElement](self, "requestElement");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addAction:", v4);

}

- (void)setResource:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[SAMLAuthZDecisionQuery requestElement](self, "requestElement");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "absoluteString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setResource:", v5);
}

- (SAMLAuthZDecisionQueryElement)requestElement
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
}

@end
