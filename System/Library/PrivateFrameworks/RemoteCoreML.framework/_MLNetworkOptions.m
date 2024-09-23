@implementation _MLNetworkOptions

- (_MLNetworkOptions)initWithOptions:(id)a3
{
  id v4;
  _MLNetworkOptions *v5;
  _MLNetworkOptions *v6;
  void *v7;
  uint64_t v8;
  NSMutableDictionary *networkOptions;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  objc_super v22;
  _BYTE v23[128];
  _QWORD v24[2];
  _QWORD v25[3];

  v25[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)_MLNetworkOptions;
  v5 = -[_MLNetworkOptions init](&v22, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_receiveTimeout = 20;
    v24[0] = kMLNetworkNameIdentifierKey[0];
    v24[1] = kMLNetworkPortNumberKey[0];
    v25[0] = &stru_24F3573E0;
    v25[1] = CFSTR("8080");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v25, v24, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "mutableCopy");
    networkOptions = v6->_networkOptions;
    v6->_networkOptions = (NSMutableDictionary *)v8;

    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v10 = v4;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v19 != v13)
            objc_enumerationMutation(v10);
          v15 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
          objc_msgSend(v10, "objectForKeyedSubscript:", v15, (_QWORD)v18);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary setObject:forKeyedSubscript:](v6->_networkOptions, "setObject:forKeyedSubscript:", v16, v15);

        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
      }
      while (v12);
    }

  }
  return v6;
}

- (BOOL)useAWDL
{
  void *v2;
  void *v3;
  char v4;

  -[_MLNetworkOptions networkOptions](self, "networkOptions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", kMLNetworkUseAWDLKey[0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (BOOL)useBonjour
{
  void *v2;
  void *v3;
  char v4;

  -[_MLNetworkOptions networkOptions](self, "networkOptions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", kMLNetworkUseBonjourKey[0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (BOOL)useUDP
{
  void *v2;
  void *v3;
  char v4;

  -[_MLNetworkOptions networkOptions](self, "networkOptions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", kMLNetworkUseUDPKey[0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (BOOL)useTLS
{
  void *v2;
  void *v3;
  char v4;

  -[_MLNetworkOptions networkOptions](self, "networkOptions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", kMLNetworkUseTLSKey[0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (unint64_t)family
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[_MLNetworkOptions networkOptions](self, "networkOptions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", kMLNetworkFamilyKey[0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "unsignedIntegerValue");

  return v4;
}

- (const)psk
{
  void *v2;
  id v3;
  const char *v4;

  -[_MLNetworkOptions networkOptions](self, "networkOptions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", kMLNetworkPskKey[0]);
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v4 = (const char *)objc_msgSend(v3, "UTF8String");

  return v4;
}

- (const)localAddr
{
  void *v2;
  id v3;
  const char *v4;

  -[_MLNetworkOptions networkOptions](self, "networkOptions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", kMLNetworkLocalAddrKey[0]);
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v4 = (const char *)objc_msgSend(v3, "UTF8String");

  return v4;
}

- (const)localPort
{
  void *v2;
  id v3;
  const char *v4;

  -[_MLNetworkOptions networkOptions](self, "networkOptions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", kMLNetworkLocalPortKey);
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v4 = (const char *)objc_msgSend(v3, "UTF8String");

  return v4;
}

- (const)networkNameIdentifier
{
  void *v3;
  void *v4;
  char v5;
  void *v7;
  id v8;
  const char *v9;

  -[_MLNetworkOptions networkOptions](self, "networkOptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", kMLNetworkNameIdentifierKey[0]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", &stru_24F3573E0);

  if ((v5 & 1) != 0)
    return 0;
  -[_MLNetworkOptions networkOptions](self, "networkOptions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", kMLNetworkNameIdentifierKey[0]);
  v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v9 = (const char *)objc_msgSend(v8, "UTF8String");

  return v9;
}

- (const)port
{
  void *v2;
  id v3;
  const char *v4;

  -[_MLNetworkOptions networkOptions](self, "networkOptions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", kMLNetworkPortNumberKey[0]);
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v4 = (const char *)objc_msgSend(v3, "UTF8String");

  return v4;
}

- (int64_t)receiveTimeoutValue
{
  return 1000000000 * -[_MLNetworkOptions receiveTimeout](self, "receiveTimeout");
}

- (NSMutableDictionary)networkOptions
{
  return self->_networkOptions;
}

- (int64_t)receiveTimeout
{
  return self->_receiveTimeout;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_networkOptions, 0);
}

@end
