@implementation SAMLAttributeQuery

- (SAMLAttributeQuery)initWithData:(id)a3 schema:(id)a4 error:(id *)a5
{
  id v9;
  SAMLAttributeQuery *v10;
  SAMLAttributeQuery *v11;
  void *v12;
  char isKindOfClass;
  uint64_t v14;
  SAMLAttributeQueryElement *requestElement;
  void *v16;
  objc_class *v17;
  SAMLAttributeQuery *v18;
  objc_super v20;

  v9 = a4;
  v20.receiver = self;
  v20.super_class = (Class)SAMLAttributeQuery;
  v10 = -[XMLWrapperDoc initWithData:schema:error:](&v20, sel_initWithData_schema_error_, a3, v9, a5);
  v11 = v10;
  if (!v10)
    goto LABEL_6;
  -[XMLWrapperDoc documentElement](v10, "documentElement");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[XMLWrapperDoc documentElement](v11, "documentElement");
    v14 = objc_claimAutoreleasedReturnValue();
    requestElement = v11->_requestElement;
    v11->_requestElement = (SAMLAttributeQueryElement *)v14;

    objc_storeStrong((id *)&v11->_schemaData, a4);
LABEL_6:
    v18 = v11;
    goto LABEL_7;
  }
  if (!a5)
    goto LABEL_6;
  -[XMLWrapperDoc documentElement](v11, "documentElement");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (objc_class *)objc_opt_class();
  SAMLInvalidDocumentElementErrorForClass(v17);
  *a5 = (id)objc_claimAutoreleasedReturnValue();

  v18 = 0;
LABEL_7:

  return v18;
}

- (SAMLAttributeQuery)initWithElement:(id)a3 schema:(id)a4 error:(id *)a5
{
  SAMLAttributeQuery *v5;
  SAMLAttributeQuery *v6;
  uint64_t v7;
  SAMLAttributeQueryElement *requestElement;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SAMLAttributeQuery;
  v5 = -[XMLWrapperDoc initWithElement:schema:error:](&v10, sel_initWithElement_schema_error_, a3, a4, a5);
  v6 = v5;
  if (v5)
  {
    -[XMLWrapperDoc documentElement](v5, "documentElement");
    v7 = objc_claimAutoreleasedReturnValue();
    requestElement = v6->_requestElement;
    v6->_requestElement = (SAMLAttributeQueryElement *)v7;

  }
  return v6;
}

- (NSString)channelId
{
  void *v2;
  void *v3;

  -[SAMLAttributeQuery requestElement](self, "requestElement");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "channelId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setSubjectFromResponse:(id)a3
{
  SAMLResponse *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(a3, "dataUsingEncoding:", 4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v4 = -[SAMLResponse initWithData:schema:error:]([SAMLResponse alloc], "initWithData:schema:error:", v7, self->_schemaData, 0);
  -[SAMLResponse subject](v4, "subject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SAMLAttributeQuery requestElement](self, "requestElement");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSubject:", v5);

}

- (void)addAttribute:(id)a3
{
  -[SAMLAttributeQuery addAttribute:values:](self, "addAttribute:values:", a3, 0);
}

- (void)addAttribute:(id)a3 values:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  +[SAMLAttribute createElement:](SAMLAttribute, "createElement:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setName:", v6);
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v16;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v16 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(v8, "addAttributeValue:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v13++), (_QWORD)v15);
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v11);
  }

  -[SAMLAttributeQuery requestElement](self, "requestElement");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addAttribute:", v8);

}

- (SAMLAttributeQueryElement)requestElement
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
