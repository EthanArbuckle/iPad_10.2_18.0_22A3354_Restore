@implementation SAMLX509Data

+ (id)createElement:(id *)a3
{
  return -[XMLWrapperElement initWithTagName:error:]([SAMLX509Data alloc], "initWithTagName:error:", CFSTR("X509Data"), a3);
}

- (NSString)issuerName
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[XMLWrapperElement firstElementByTagName:](self, "firstElementByTagName:", CFSTR("ds:X509IssuerSerial"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "firstElementByTagName:", CFSTR("ds:X509IssuerName"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "textContent");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return (NSString *)v5;
}

- (NSNumber)serialNumber
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  -[XMLWrapperElement firstElementByTagName:](self, "firstElementByTagName:", CFSTR("ds:X509IssuerSerial"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "firstElementByTagName:", CFSTR("dsSerialNumber"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "textContent");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      v6 = objc_alloc_init(MEMORY[0x24BDD16F0]);
      objc_msgSend(v6, "setNumberStyle:", 1);
      objc_msgSend(v6, "numberFromString:", v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

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

  return (NSNumber *)v7;
}

- (NSData)ski
{
  void *v2;
  id v3;
  void *v4;
  void *v5;

  -[XMLWrapperElement firstElementByTagName:](self, "firstElementByTagName:", CFSTR("ds:X509SKI"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = objc_alloc(MEMORY[0x24BDBCE50]);
    objc_msgSend(v2, "textContent");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v3, "initWithBase64EncodedString:options:", v4, 1);

  }
  else
  {
    v5 = 0;
  }

  return (NSData *)v5;
}

- (NSString)subjectName
{
  void *v2;
  void *v3;
  void *v4;

  -[XMLWrapperElement firstElementByTagName:](self, "firstElementByTagName:", CFSTR("ds:X509SubjectName"));
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

- (NSData)certificate
{
  void *v2;
  id v3;
  void *v4;
  void *v5;

  -[XMLWrapperElement firstElementByTagName:](self, "firstElementByTagName:", CFSTR("ds:X509Certificate"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = objc_alloc(MEMORY[0x24BDBCE50]);
    objc_msgSend(v2, "textContent");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v3, "initWithBase64EncodedString:options:", v4, 1);

  }
  else
  {
    v5 = 0;
  }

  return (NSData *)v5;
}

- (NSData)crl
{
  void *v2;
  id v3;
  void *v4;
  void *v5;

  -[XMLWrapperElement firstElementByTagName:](self, "firstElementByTagName:", CFSTR("ds:X509CRL"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = objc_alloc(MEMORY[0x24BDBCE50]);
    objc_msgSend(v2, "textContent");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v3, "initWithBase64EncodedString:options:", v4, 1);

  }
  else
  {
    v5 = 0;
  }

  return (NSData *)v5;
}

@end
