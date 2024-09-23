@implementation SAMLScoping

+ (id)createElement:(id *)a3
{
  SAMLScoping *v3;
  void *v4;
  void *v5;
  _QWORD v7[3];

  v7[2] = *MEMORY[0x24BDAC8D0];
  v3 = -[XMLWrapperElement initWithTagName:error:]([SAMLScoping alloc], "initWithTagName:error:", CFSTR("Scoping"), a3);
  if (v3)
  {
    v7[0] = CFSTR("IDPList");
    v7[1] = CFSTR("RequesterID");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[XMLWrapperElement setChildElementSequence:](v3, "setChildElementSequence:", v4);

    SAMLProtocolNamespace();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[XMLWrapperElement setNamespace:](v3, "setNamespace:", v5);

  }
  return v3;
}

- (void)addRequesterId:(id)a3
{
  XMLWrapperElement *v4;
  XMLWrapperElement *v5;
  id v6;

  v6 = a3;
  v4 = -[XMLWrapperElement initWithTagName:error:]([XMLWrapperElement alloc], "initWithTagName:error:", CFSTR("RequesterID"), 0);
  v5 = v4;
  if (v4)
  {
    -[XMLWrapperElement setTextContent:](v4, "setTextContent:", v6);
    -[XMLWrapperElement addChildElement:](self, "addChildElement:", v5);
  }

}

- (NSNumber)proxyCount
{
  void *v2;
  id v3;
  void *v4;
  void *v5;

  -[XMLWrapperElement attributeWithName:](self, "attributeWithName:", CFSTR("ProxyCount"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = objc_alloc_init(MEMORY[0x24BDD16F0]);
    objc_msgSend(v3, "setNumberStyle:", 1);
    objc_msgSend(v2, "value");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "numberFromString:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return (NSNumber *)v5;
}

- (NSArray)requesterIds
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[XMLWrapperElement getElementsByTagName:](self, "getElementsByTagName:", CFSTR("RequesterID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "textContent");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
          objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return (NSArray *)v3;
}

- (NSString)getComplete
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[XMLWrapperElement firstElementByTagName:](self, "firstElementByTagName:", CFSTR("IDPList"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "firstElementByTagName:", CFSTR("GetComplete"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      objc_msgSend(v4, "textContent");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }

  return (NSString *)v6;
}

- (NSArray)idpList
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[XMLWrapperElement firstElementByTagName:](self, "firstElementByTagName:", CFSTR("IDPList"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "getElementsByTagName:", CFSTR("IDPEntry"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v13;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v13 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(v3, "addObject:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v10++));
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v8);
    }

  }
  return (NSArray *)v3;
}

@end
