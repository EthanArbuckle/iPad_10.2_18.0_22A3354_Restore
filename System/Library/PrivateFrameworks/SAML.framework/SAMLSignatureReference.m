@implementation SAMLSignatureReference

+ (id)createElement:(id *)a3
{
  return -[XMLWrapperElement initWithTagName:error:]([SAMLSignatureReference alloc], "initWithTagName:error:", CFSTR("Reference"), a3);
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

- (NSString)uri
{
  void *v2;
  void *v3;

  -[XMLWrapperElement attributeWithName:](self, "attributeWithName:", CFSTR("URI"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)type
{
  void *v2;
  void *v3;

  -[XMLWrapperElement attributeWithName:](self, "attributeWithName:", CFSTR("Type"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSArray)transforms
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[XMLWrapperElement firstElementByTagName:](self, "firstElementByTagName:", CFSTR("Transforms"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "getElementsByTagName:", CFSTR("Transform"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v15;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v15 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v10), "attributeWithName:", CFSTR("Algorithm"));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "value");
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          if (v12)
            objc_msgSend(v3, "addObject:", v12);

          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v8);
    }

  }
  return (NSArray *)v3;
}

- (NSString)digestMethod
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[XMLWrapperElement firstElementByTagName:](self, "firstElementByTagName:", CFSTR("DigestMethod"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "attributeWithName:", CFSTR("Algorithm"));
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

- (NSData)digestValue
{
  void *v2;
  id v3;
  void *v4;
  void *v5;

  -[XMLWrapperElement firstElementByTagName:](self, "firstElementByTagName:", CFSTR("DigestValue"));
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
