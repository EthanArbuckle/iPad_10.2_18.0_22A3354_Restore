@implementation SAMLSignedInfo

+ (id)createElement:(id *)a3
{
  SAMLSignedInfo *v3;
  void *v4;

  v3 = -[XMLWrapperElement initWithTagName:error:]([SAMLSignedInfo alloc], "initWithTagName:error:", CFSTR("SignedInfo"), a3);
  if (v3)
  {
    SAMLSignatureNamespace();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[XMLWrapperElement setNamespace:](v3, "setNamespace:", v4);

  }
  return v3;
}

- (_xmlNode)xmlNode:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _xmlNode *v20;
  objc_super v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[XMLWrapperElement firstElementByTagName:](self, "firstElementByTagName:", CFSTR("CanonicalizationMethod"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v6);
  -[XMLWrapperElement firstElementByTagName:](self, "firstElementByTagName:", CFSTR("SignatureMethod"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v7);
  -[XMLWrapperElement getElementsByTagName:](self, "getElementsByTagName:", CFSTR("Reference"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObjectsFromArray:", v8);
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  -[XMLWrapperElement elements](self, "elements");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");

  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v28;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v28 != v13)
          objc_enumerationMutation(v10);
        -[XMLWrapperElement removeChildElement:](self, "removeChildElement:", *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * v14++));
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    }
    while (v12);
  }

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v15 = v5;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v24;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v24 != v18)
          objc_enumerationMutation(v15);
        -[XMLWrapperElement addChildElement:](self, "addChildElement:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v19++));
      }
      while (v17 != v19);
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    }
    while (v17);
  }

  v22.receiver = self;
  v22.super_class = (Class)SAMLSignedInfo;
  v20 = -[XMLWrapperElement xmlNode:](&v22, sel_xmlNode_, a3);

  return v20;
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

- (NSString)canonicalizationMethod
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[XMLWrapperElement firstElementByTagName:](self, "firstElementByTagName:", CFSTR("CanonicalizationMethod"));
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

- (NSNumber)signatureMethodLength
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  -[XMLWrapperElement firstElementByTagName:](self, "firstElementByTagName:", CFSTR("SignatureMethod"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "firstElementByTagName:", CFSTR("HMACOutputLength"));
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

- (NSString)signatureMethod
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[XMLWrapperElement firstElementByTagName:](self, "firstElementByTagName:", CFSTR("SignatureMethod"));
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

- (NSArray)references
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[XMLWrapperElement getElementsByTagName:](self, "getElementsByTagName:", CFSTR("Reference"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(v3, "addObject:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

  return (NSArray *)v3;
}

@end
