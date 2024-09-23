@implementation SAMLPGPData

+ (id)createElement:(id *)a3
{
  return -[XMLWrapperElement initWithTagName:error:]([SAMLPGPData alloc], "initWithTagName:error:", CFSTR("PGPData"), a3);
}

- (NSData)keyId
{
  void *v2;
  id v3;
  void *v4;
  void *v5;

  -[XMLWrapperElement firstElementByTagName:](self, "firstElementByTagName:", CFSTR("ds:PGPKeyID"));
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

- (NSData)packet
{
  void *v2;
  id v3;
  void *v4;
  void *v5;

  -[XMLWrapperElement firstElementByTagName:](self, "firstElementByTagName:", CFSTR("ds:PGPKeyPacket"));
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
