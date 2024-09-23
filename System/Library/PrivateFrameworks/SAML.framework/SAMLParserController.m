@implementation SAMLParserController

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __38__SAMLParserController_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, block);
  return (id)sharedInstance_parser;
}

void __38__SAMLParserController_sharedInstance__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedInstance_parser;
  sharedInstance_parser = (uint64_t)v1;

}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    +[XMLWrapperElementFactory registerClass:forElementName:](XMLWrapperElementFactory, "registerClass:forElementName:", objc_opt_class(), CFSTR("Assertion"));
    +[XMLWrapperElementFactory registerClass:forElementName:](XMLWrapperElementFactory, "registerClass:forElementName:", objc_opt_class(), CFSTR("Advice"));
    +[XMLWrapperElementFactory registerClass:forElementName:](XMLWrapperElementFactory, "registerClass:forElementName:", objc_opt_class(), CFSTR("Attribute"));
    +[XMLWrapperElementFactory registerClass:forElementName:](XMLWrapperElementFactory, "registerClass:forElementName:", objc_opt_class(), CFSTR("AttributeQuery"));
    +[XMLWrapperElementFactory registerClass:forElementName:](XMLWrapperElementFactory, "registerClass:forElementName:", objc_opt_class(), CFSTR("AuthnStatement"));
    +[XMLWrapperElementFactory registerClass:forElementName:](XMLWrapperElementFactory, "registerClass:forElementName:", objc_opt_class(), CFSTR("AuthnRequest"));
    +[XMLWrapperElementFactory registerClass:forElementName:](XMLWrapperElementFactory, "registerClass:forElementName:", objc_opt_class(), CFSTR("AuthzDecisiontStatement"));
    +[XMLWrapperElementFactory registerClass:forElementName:](XMLWrapperElementFactory, "registerClass:forElementName:", objc_opt_class(), CFSTR("AuthzDecisionQuery"));
    +[XMLWrapperElementFactory registerClass:forElementName:](XMLWrapperElementFactory, "registerClass:forElementName:", objc_opt_class(), CFSTR("Conditions"));
    +[XMLWrapperElementFactory registerClass:forElementName:](XMLWrapperElementFactory, "registerClass:forElementName:", objc_opt_class(), CFSTR("DSAKeyValue"));
    +[XMLWrapperElementFactory registerClass:forElementName:](XMLWrapperElementFactory, "registerClass:forElementName:", objc_opt_class(), CFSTR("Element"));
    +[XMLWrapperElementFactory registerClass:forElementName:](XMLWrapperElementFactory, "registerClass:forElementName:", objc_opt_class(), CFSTR("IDPEntry"));
    +[XMLWrapperElementFactory registerClass:forElementName:](XMLWrapperElementFactory, "registerClass:forElementName:", objc_opt_class(), CFSTR("KeyInfo"));
    +[XMLWrapperElementFactory registerClass:forElementName:](XMLWrapperElementFactory, "registerClass:forElementName:", objc_opt_class(), CFSTR("RetrievalMethod"));
    +[XMLWrapperElementFactory registerClass:forElementName:](XMLWrapperElementFactory, "registerClass:forElementName:", objc_opt_class(), CFSTR("LogoutRequest"));
    +[XMLWrapperElementFactory registerClass:forElementName:](XMLWrapperElementFactory, "registerClass:forElementName:", objc_opt_class(), CFSTR("LogoutResponse"));
    +[XMLWrapperElementFactory registerClass:forElementName:](XMLWrapperElementFactory, "registerClass:forElementName:", objc_opt_class(), CFSTR("NameId"));
    +[XMLWrapperElementFactory registerClass:forElementName:](XMLWrapperElementFactory, "registerClass:forElementName:", objc_opt_class(), CFSTR("NameIdPolicy"));
    +[XMLWrapperElementFactory registerClass:forElementName:](XMLWrapperElementFactory, "registerClass:forElementName:", objc_opt_class(), CFSTR("PGPData"));
    +[XMLWrapperElementFactory registerClass:forElementName:](XMLWrapperElementFactory, "registerClass:forElementName:", objc_opt_class(), CFSTR("Response"));
    +[XMLWrapperElementFactory registerClass:forElementName:](XMLWrapperElementFactory, "registerClass:forElementName:", objc_opt_class(), CFSTR("RequestedAuthnContext"));
    +[XMLWrapperElementFactory registerClass:forElementName:](XMLWrapperElementFactory, "registerClass:forElementName:", objc_opt_class(), CFSTR("RSAKeyValue"));
    +[XMLWrapperElementFactory registerClass:forElementName:](XMLWrapperElementFactory, "registerClass:forElementName:", objc_opt_class(), CFSTR("Scoping"));
    +[XMLWrapperElementFactory registerClass:forElementName:](XMLWrapperElementFactory, "registerClass:forElementName:", objc_opt_class(), CFSTR("Signature"));
    +[XMLWrapperElementFactory registerClass:forElementName:](XMLWrapperElementFactory, "registerClass:forElementName:", objc_opt_class(), CFSTR("KeyValue"));
    +[XMLWrapperElementFactory registerClass:forElementName:](XMLWrapperElementFactory, "registerClass:forElementName:", objc_opt_class(), CFSTR("Reference"));
    +[XMLWrapperElementFactory registerClass:forElementName:](XMLWrapperElementFactory, "registerClass:forElementName:", objc_opt_class(), CFSTR("SignedInfo"));
    +[XMLWrapperElementFactory registerClass:forElementName:](XMLWrapperElementFactory, "registerClass:forElementName:", objc_opt_class(), CFSTR("Status"));
    +[XMLWrapperElementFactory registerClass:forElementName:](XMLWrapperElementFactory, "registerClass:forElementName:", objc_opt_class(), CFSTR("StatusCode"));
    +[XMLWrapperElementFactory registerClass:forElementName:](XMLWrapperElementFactory, "registerClass:forElementName:", objc_opt_class(), CFSTR("Subject"));
    +[XMLWrapperElementFactory registerClass:forElementName:](XMLWrapperElementFactory, "registerClass:forElementName:", objc_opt_class(), CFSTR("SubjectConfirmation"));
    +[XMLWrapperElementFactory registerClass:forElementName:](XMLWrapperElementFactory, "registerClass:forElementName:", objc_opt_class(), CFSTR("X509Data"));
  }
}

- (SAMLParserController)init
{
  SAMLParserController *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  NSData *schemaData;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SAMLParserController;
  v2 = -[SAMLParserController init](&v8, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "saml_frameworkBundle");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "URLForResource:withExtension:", CFSTR("saml-schema-protocol-2.0"), CFSTR("xsd"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfURL:", v4);
    v5 = objc_claimAutoreleasedReturnValue();
    schemaData = v2->_schemaData;
    v2->_schemaData = (NSData *)v5;

  }
  return v2;
}

- (id)schema
{
  return self->_schemaData;
}

- (id)newAttributeQuery:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  SAMLAttributeQuery *v8;
  void *v9;
  SAMLAttributeQuery *v10;

  v6 = a3;
  +[SAMLAttributeQueryElement createElement:](SAMLAttributeQueryElement, "createElement:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setChannelId:", v6);

  v8 = [SAMLAttributeQuery alloc];
  -[SAMLParserController schemaData](self, "schemaData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[SAMLAttributeQuery initWithElement:schema:error:](v8, "initWithElement:schema:error:", v7, v9, a4);

  return v10;
}

- (id)newAuthNRequest:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  SAMLAuthNRequest *v8;
  void *v9;
  SAMLAuthNRequest *v10;

  v6 = a3;
  +[SAMLAuthNRequestElement createElement:](SAMLAuthNRequestElement, "createElement:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setIssuer:", v6);

  v8 = [SAMLAuthNRequest alloc];
  -[SAMLParserController schemaData](self, "schemaData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[SAMLAuthNRequest initWithElement:schema:error:](v8, "initWithElement:schema:error:", v7, v9, a4);

  return v10;
}

- (id)newAuthZQuery:(id)a3 channelId:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  SAMLAuthZDecisionQuery *v11;
  void *v12;
  SAMLAuthZDecisionQuery *v13;

  v8 = a4;
  v9 = a3;
  +[SAMLAuthZDecisionQueryElement createElement:](SAMLAuthZDecisionQueryElement, "createElement:", a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setChannelId:", v8);

  v11 = [SAMLAuthZDecisionQuery alloc];
  -[SAMLParserController schemaData](self, "schemaData");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[SAMLAuthZDecisionQuery initWithElement:schema:error:](v11, "initWithElement:schema:error:", v10, v12, a5);

  -[SAMLAuthZDecisionQuery setResource:](v13, "setResource:", v9);
  return v13;
}

- (id)newLogoutRequest:(id *)a3
{
  void *v5;
  SAMLLogoutRequest *v6;
  void *v7;
  SAMLLogoutRequest *v8;

  +[SAMLLogoutRequestElement createElement:](SAMLLogoutRequestElement, "createElement:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = [SAMLLogoutRequest alloc];
  -[SAMLParserController schemaData](self, "schemaData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[SAMLLogoutRequest initWithElement:schema:error:](v6, "initWithElement:schema:error:", v5, v7, a3);

  return v8;
}

- (id)parseResponse:(id)a3 error:(id *)a4
{
  void *v6;
  SAMLResponse *v7;
  SAMLResponse *v8;

  -[SAMLParserController dataFromString:error:](self, "dataFromString:error:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[SAMLResponse initWithData:schema:error:]([SAMLResponse alloc], "initWithData:schema:error:", v6, self->_schemaData, a4);
  if (-[SAMLResponse assertionMeetsConditions:](v7, "assertionMeetsConditions:", a4)
    && -[SAMLResponse isValid:](v7, "isValid:", a4))
  {
    v8 = v7;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)parseCachedResponse:(id)a3 error:(id *)a4
{
  void *v6;
  SAMLResponse *v7;
  SAMLResponse *v8;

  -[SAMLParserController dataFromString:error:](self, "dataFromString:error:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[SAMLResponse initWithData:schema:error:]([SAMLResponse alloc], "initWithData:schema:error:", v6, self->_schemaData, a4);
  if (-[SAMLResponse isValid:](v7, "isValid:", a4))
    v8 = v7;
  else
    v8 = 0;

  return v8;
}

- (id)dataFromString:(id)a3 error:(id *)a4
{
  uint64_t v5;
  void *v6;

  objc_msgSend(a3, "dataUsingEncoding:", 4);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (a4 && !v5)
  {
    SAMLParserErrorForErrorCode(100);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

- (NSData)schemaData
{
  return self->_schemaData;
}

- (void)setSchemaData:(id)a3
{
  objc_storeStrong((id *)&self->_schemaData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_schemaData, 0);
}

@end
