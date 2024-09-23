@implementation SAMLKeyInfo

+ (id)createElement:(id *)a3
{
  SAMLKeyInfo *v3;
  void *v4;

  v3 = -[XMLWrapperElement initWithTagName:error:]([SAMLKeyInfo alloc], "initWithTagName:error:", CFSTR("KeyInfo"), a3);
  if (v3)
  {
    SAMLSignatureNamespace();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[XMLWrapperElement setNamespace:](v3, "setNamespace:", v4);

  }
  return v3;
}

- (NSString)identifier
{
  void *v2;
  void *v3;

  -[XMLWrapperElement attributeWithName:](self, "attributeWithName:", CFSTR("ID"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)keyName
{
  void *v2;
  void *v3;
  void *v4;

  -[XMLWrapperElement firstElementByTagName:](self, "firstElementByTagName:", CFSTR("KeyName"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "textContent");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return (NSString *)v4;
}

- (SAMLSignatureKeyValue)keyValue
{
  return (SAMLSignatureKeyValue *)-[XMLWrapperElement firstElementByTagName:](self, "firstElementByTagName:", CFSTR("KeyValue"));
}

- (SAMLKeyRetrievalMethod)retrievalMethod
{
  return (SAMLKeyRetrievalMethod *)-[XMLWrapperElement firstElementByTagName:](self, "firstElementByTagName:", CFSTR("RetrievalMethod"));
}

- (SAMLX509Data)x509Data
{
  return (SAMLX509Data *)-[XMLWrapperElement firstElementByTagName:](self, "firstElementByTagName:", CFSTR("X509Data"));
}

- (SAMLPGPData)pgpData
{
  return (SAMLPGPData *)-[XMLWrapperElement firstElementByTagName:](self, "firstElementByTagName:", CFSTR("PGPData"));
}

- (NSData)spkiSexpData
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;

  -[XMLWrapperElement firstElementByTagName:](self, "firstElementByTagName:", CFSTR("SPKIData"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "firstElementByTagName:", CFSTR("ds:SPKISexp"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = objc_alloc(MEMORY[0x24BDBCE50]);
      objc_msgSend(v4, "textContent");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)objc_msgSend(v5, "initWithBase64EncodedString:options:", v6, 1);

    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return (NSData *)v7;
}

- (NSString)mgmtData
{
  void *v2;
  void *v3;
  void *v4;

  -[XMLWrapperElement firstElementByTagName:](self, "firstElementByTagName:", CFSTR("MgmtData"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "textContent");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return (NSString *)v4;
}

@end
