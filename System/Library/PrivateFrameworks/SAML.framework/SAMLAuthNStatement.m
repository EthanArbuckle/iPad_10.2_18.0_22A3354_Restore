@implementation SAMLAuthNStatement

+ (id)createElement:(id *)a3
{
  SAMLAuthNStatement *v3;
  void *v4;
  void *v5;
  _QWORD v7[9];

  v7[8] = *MEMORY[0x24BDAC8D0];
  v3 = -[XMLWrapperElement initWithTagName:error:]([SAMLAuthNStatement alloc], "initWithTagName:error:", CFSTR("AuthnStatement"), a3);
  if (v3)
  {
    v7[0] = CFSTR("Issuer");
    v7[1] = CFSTR("Signature");
    v7[2] = CFSTR("Subject");
    v7[3] = CFSTR("Conditions");
    v7[4] = CFSTR("Advice");
    v7[5] = CFSTR("AuthnStatement");
    v7[6] = CFSTR("AuthzDecisiontStatement");
    v7[7] = CFSTR("AttributeStatement");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 8);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[XMLWrapperElement setChildElementSequence:](v3, "setChildElementSequence:", v4);

    SAMLAssertionNamespace();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[XMLWrapperElement setNamespace:](v3, "setNamespace:", v5);

  }
  return v3;
}

- (NSDate)authnInstant
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[XMLWrapperElement attributeWithName:](self, "attributeWithName:", CFSTR("AuthnInstant"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "value");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    SAMLDateFromString(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return (NSDate *)v5;
}

- (NSString)sessionIndex
{
  void *v2;
  void *v3;

  -[XMLWrapperElement attributeWithName:](self, "attributeWithName:", CFSTR("SessionIndex"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSDate)sessionNotOnOrAfter
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[XMLWrapperElement attributeWithName:](self, "attributeWithName:", CFSTR("SessionNotOnOrAfter"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "value");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    SAMLDateFromString(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return (NSDate *)v5;
}

- (NSString)subjectAddress
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[XMLWrapperElement firstElementByTagName:](self, "firstElementByTagName:", CFSTR("SubjectLocality"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "attributeWithName:", CFSTR("Address"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "value");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return (NSString *)v5;
}

- (NSString)subjectDNSName
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[XMLWrapperElement firstElementByTagName:](self, "firstElementByTagName:", CFSTR("SubjectLocality"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "attributeWithName:", CFSTR("DNSName"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "value");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return (NSString *)v5;
}

- (NSString)authnContextDecl
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[XMLWrapperElement firstElementByTagName:](self, "firstElementByTagName:", CFSTR("AuthnContext"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "attributeWithName:", CFSTR("AuthnContextDecl"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "value");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return (NSString *)v5;
}

- (NSString)authnContextDeclRef
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[XMLWrapperElement firstElementByTagName:](self, "firstElementByTagName:", CFSTR("AuthnContext"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "attributeWithName:", CFSTR("AuthnContextDeclRef"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "value");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return (NSString *)v5;
}

- (NSString)authnContextClassRef
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[XMLWrapperElement firstElementByTagName:](self, "firstElementByTagName:", CFSTR("AuthnContext"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "attributeWithName:", CFSTR("AuthnContextClassRef"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "value");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return (NSString *)v5;
}

- (NSString)authenticatingAuthority
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[XMLWrapperElement firstElementByTagName:](self, "firstElementByTagName:", CFSTR("AuthnContext"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "attributeWithName:", CFSTR("AuthenticatingAuthority"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "value");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return (NSString *)v5;
}

- (BOOL)isValid
{
  void *v3;
  void *v4;
  char v5;

  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SAMLAuthNStatement sessionNotOnOrAfter](self, "sessionNotOnOrAfter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "vs_isAfter:", v3);

  return v5;
}

@end
