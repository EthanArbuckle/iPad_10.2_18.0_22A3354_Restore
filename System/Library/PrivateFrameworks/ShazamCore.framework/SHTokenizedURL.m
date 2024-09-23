@implementation SHTokenizedURL

- (SHTokenizedURL)initWithString:(id)a3
{
  id v5;
  SHTokenizedURL *v6;
  SHTokenizedURL *v7;
  uint64_t v8;
  NSMutableDictionary *tokenDictionary;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SHTokenizedURL;
  v6 = -[SHTokenizedURL init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_originalURLPath, a3);
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v8 = objc_claimAutoreleasedReturnValue();
    tokenDictionary = v7->_tokenDictionary;
    v7->_tokenDictionary = (NSMutableDictionary *)v8;

  }
  return v7;
}

- (SHTokenizedURL)initWithHost:(id)a3 URLPath:(id)a4
{
  id v7;
  id v8;
  SHTokenizedURL *v9;
  SHTokenizedURL *v10;
  uint64_t v11;
  NSMutableDictionary *tokenDictionary;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SHTokenizedURL;
  v9 = -[SHTokenizedURL init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_host, a3);
    objc_storeStrong((id *)&v10->_originalURLPath, a4);
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v11 = objc_claimAutoreleasedReturnValue();
    tokenDictionary = v10->_tokenDictionary;
    v10->_tokenDictionary = (NSMutableDictionary *)v11;

  }
  return v10;
}

+ (id)replaceToken:(int64_t)a3 withValue:(id)a4 urlString:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;

  v8 = a5;
  v9 = a4;
  objc_msgSend(a1, "tokenForTokenType:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringByReplacingOccurrencesOfString:withString:", v10, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (BOOL)updateToken:(int64_t)a3 withValue:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = a4;
  -[SHTokenizedURL originalURLPath](self, "originalURLPath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "tokenForTokenType:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "containsString:", v8);

  if (v9)
  {
    objc_msgSend((id)objc_opt_class(), "tokenForTokenType:", a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SHTokenizedURL tokenDictionary](self, "tokenDictionary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(v11, "setValue:forKey:", v12, v10);

  }
  return v9;
}

+ (id)tokenForTokenType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 0xE)
    return CFSTR("{deviceid}");
  else
    return off_24DDB2018[a3 - 1];
}

- (NSString)tokenURLPath
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  -[SHTokenizedURL originalURLPath](self, "originalURLPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[SHTokenizedURL tokenDictionary](self, "tokenDictionary", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      v9 = 0;
      v10 = v4;
      do
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v11 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v9);
        -[SHTokenizedURL tokenDictionary](self, "tokenDictionary");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectForKeyedSubscript:", v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v10, "stringByReplacingOccurrencesOfString:withString:", v11, v13);
        v4 = (void *)objc_claimAutoreleasedReturnValue();

        ++v9;
        v10 = v4;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

  return (NSString *)v4;
}

- (id)URLRepresentation
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  if (-[SHTokenizedURL containsTokens](self, "containsTokens"))
  {
    v3 = 0;
  }
  else
  {
    -[SHTokenizedURL host](self, "host");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      v5 = objc_alloc_init(MEMORY[0x24BDD1808]);
      objc_msgSend(v5, "setScheme:", CFSTR("https"));
      -[SHTokenizedURL host](self, "host");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setHost:", v6);

      -[SHTokenizedURL tokenURLPath](self, "tokenURLPath");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "componentsSeparatedByString:", CFSTR("?"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if ((unint64_t)objc_msgSend(v8, "count") >= 2)
      {
        objc_msgSend(v8, "firstObject");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setPath:", v10);

        objc_msgSend(v8, "lastObject");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setQuery:", v11);

        objc_msgSend(v5, "URL");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v3 = 0;
      }

    }
    else
    {
      v9 = (void *)MEMORY[0x24BDBCF48];
      -[SHTokenizedURL tokenURLPath](self, "tokenURLPath");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "URLWithString:", v5);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  return v3;
}

- (BOOL)containsToken:(int64_t)a3
{
  void *v4;
  void *v5;
  char v6;

  -[SHTokenizedURL tokenURLPath](self, "tokenURLPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "tokenForTokenType:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "containsString:", v5);

  return v6;
}

- (BOOL)containsTokens
{
  return -[SHTokenizedURL containsToken:](self, "containsToken:", 0)
      || -[SHTokenizedURL containsToken:](self, "containsToken:", 1)
      || -[SHTokenizedURL containsToken:](self, "containsToken:", 2)
      || -[SHTokenizedURL containsToken:](self, "containsToken:", 3)
      || -[SHTokenizedURL containsToken:](self, "containsToken:", 4)
      || -[SHTokenizedURL containsToken:](self, "containsToken:", 5)
      || -[SHTokenizedURL containsToken:](self, "containsToken:", 9)
      || -[SHTokenizedURL containsToken:](self, "containsToken:", 10)
      || -[SHTokenizedURL containsToken:](self, "containsToken:", 11)
      || -[SHTokenizedURL containsToken:](self, "containsToken:", 12)
      || -[SHTokenizedURL containsToken:](self, "containsToken:", 13)
      || -[SHTokenizedURL containsToken:](self, "containsToken:", 15)
      || -[SHTokenizedURL containsToken:](self, "containsToken:", 14);
}

- (id)description
{
  void *v2;
  void *v3;

  -[SHTokenizedURL URLRepresentation](self, "URLRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "absoluteString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  SHTokenizedURL *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  SHTokenizedURL *v10;
  void *v11;
  void *v12;

  v5 = +[SHTokenizedURL allocWithZone:](SHTokenizedURL, "allocWithZone:");
  -[SHTokenizedURL host](self, "host");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copyWithZone:", a3);
  -[SHTokenizedURL originalURLPath](self, "originalURLPath");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copyWithZone:", a3);
  v10 = -[SHTokenizedURL initWithHost:URLPath:](v5, "initWithHost:URLPath:", v7, v9);

  -[SHTokenizedURL tokenDictionary](self, "tokenDictionary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "mutableCopyWithZone:", a3);
  -[SHTokenizedURL setTokenDictionary:](v10, "setTokenDictionary:", v12);

  return v10;
}

- (NSString)host
{
  return self->_host;
}

- (void)setHost:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)originalURLPath
{
  return self->_originalURLPath;
}

- (void)setOriginalURLPath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSMutableDictionary)tokenDictionary
{
  return self->_tokenDictionary;
}

- (void)setTokenDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_tokenDictionary, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokenDictionary, 0);
  objc_storeStrong((id *)&self->_originalURLPath, 0);
  objc_storeStrong((id *)&self->_host, 0);
}

@end
