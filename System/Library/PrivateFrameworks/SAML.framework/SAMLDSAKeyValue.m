@implementation SAMLDSAKeyValue

+ (id)createElement:(id *)a3
{
  return -[XMLWrapperElement initWithTagName:error:]([SAMLDSAKeyValue alloc], "initWithTagName:error:", CFSTR("DSAKeyValue"), a3);
}

- (NSData)p
{
  void *v2;
  id v3;
  void *v4;
  void *v5;

  -[XMLWrapperElement firstElementByTagName:](self, "firstElementByTagName:", CFSTR("P"));
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

- (NSData)q
{
  void *v2;
  id v3;
  void *v4;
  void *v5;

  -[XMLWrapperElement firstElementByTagName:](self, "firstElementByTagName:", CFSTR("Q"));
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

- (NSData)g
{
  void *v2;
  id v3;
  void *v4;
  void *v5;

  -[XMLWrapperElement firstElementByTagName:](self, "firstElementByTagName:", CFSTR("G"));
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

- (NSData)y
{
  void *v2;
  id v3;
  void *v4;
  void *v5;

  -[XMLWrapperElement firstElementByTagName:](self, "firstElementByTagName:", CFSTR("Y"));
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

- (NSData)j
{
  void *v2;
  id v3;
  void *v4;
  void *v5;

  -[XMLWrapperElement firstElementByTagName:](self, "firstElementByTagName:", CFSTR("J"));
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

- (NSData)seed
{
  void *v2;
  id v3;
  void *v4;
  void *v5;

  -[XMLWrapperElement firstElementByTagName:](self, "firstElementByTagName:", CFSTR("Seed"));
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

- (NSData)pgenCounter
{
  void *v2;
  id v3;
  void *v4;
  void *v5;

  -[XMLWrapperElement firstElementByTagName:](self, "firstElementByTagName:", CFSTR("PgenCounter"));
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
