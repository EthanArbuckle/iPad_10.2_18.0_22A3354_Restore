@implementation POKeyExchangeResponseJWTBody

- (id)mutableCopy
{
  POMutableKeyExchangeResponseJWTBody *v3;
  void *v4;
  void *v5;

  v3 = objc_alloc_init(POMutableKeyExchangeResponseJWTBody);
  -[_POJWTBodyBase data](self, "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");
  -[_POJWTBodyBase setData:](v3, "setData:", v5);

  return v3;
}

- (NSDate)iat
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  _QWORD v10[5];
  _QWORD v11[5];

  v3 = MEMORY[0x24BDAC760];
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __35__POKeyExchangeResponseJWTBody_iat__block_invoke;
  v11[3] = &unk_2514FFB08;
  v11[4] = self;
  __35__POKeyExchangeResponseJWTBody_iat__block_invoke((uint64_t)v11);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v3;
  v10[1] = 3221225472;
  v10[2] = __35__POKeyExchangeResponseJWTBody_iat__block_invoke_2;
  v10[3] = &unk_2514FFB30;
  v10[4] = self;
  __35__POKeyExchangeResponseJWTBody_iat__block_invoke_2((uint64_t)v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x24BDBCE60];
  v7 = objc_msgSend(v4, "intValue");
  if (!v7)
    v7 = objc_msgSend(v5, "intValue");
  objc_msgSend(v6, "dateWithTimeIntervalSince1970:", (double)v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v8;
}

id __35__POKeyExchangeResponseJWTBody_iat__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  char isKindOfClass;
  void *v5;
  void *v6;

  objc_msgSend(*(id *)(a1 + 32), "data");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("iat"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "data");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("iat"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

id __35__POKeyExchangeResponseJWTBody_iat__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  char isKindOfClass;
  void *v5;
  void *v6;

  objc_msgSend(*(id *)(a1 + 32), "data");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("iat"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "data");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("iat"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (NSDate)exp
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  _QWORD v10[5];
  _QWORD v11[5];

  v3 = MEMORY[0x24BDAC760];
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __35__POKeyExchangeResponseJWTBody_exp__block_invoke;
  v11[3] = &unk_2514FFB08;
  v11[4] = self;
  __35__POKeyExchangeResponseJWTBody_exp__block_invoke((uint64_t)v11);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v3;
  v10[1] = 3221225472;
  v10[2] = __35__POKeyExchangeResponseJWTBody_exp__block_invoke_2;
  v10[3] = &unk_2514FFB30;
  v10[4] = self;
  __35__POKeyExchangeResponseJWTBody_exp__block_invoke_2((uint64_t)v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x24BDBCE60];
  v7 = objc_msgSend(v4, "intValue");
  if (!v7)
    v7 = objc_msgSend(v5, "intValue");
  objc_msgSend(v6, "dateWithTimeIntervalSince1970:", (double)v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v8;
}

id __35__POKeyExchangeResponseJWTBody_exp__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  char isKindOfClass;
  void *v5;
  void *v6;

  objc_msgSend(*(id *)(a1 + 32), "data");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("exp"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "data");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("exp"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

id __35__POKeyExchangeResponseJWTBody_exp__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  char isKindOfClass;
  void *v5;
  void *v6;

  objc_msgSend(*(id *)(a1 + 32), "data");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("exp"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "data");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("exp"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (NSString)key
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __35__POKeyExchangeResponseJWTBody_key__block_invoke;
  v3[3] = &unk_2514FFB30;
  v3[4] = self;
  __35__POKeyExchangeResponseJWTBody_key__block_invoke((uint64_t)v3);
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

id __35__POKeyExchangeResponseJWTBody_key__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  char isKindOfClass;
  void *v5;
  void *v6;

  objc_msgSend(*(id *)(a1 + 32), "data");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("key"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "data");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("key"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (NSString)key_context
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __43__POKeyExchangeResponseJWTBody_key_context__block_invoke;
  v3[3] = &unk_2514FFB30;
  v3[4] = self;
  __43__POKeyExchangeResponseJWTBody_key_context__block_invoke((uint64_t)v3);
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

id __43__POKeyExchangeResponseJWTBody_key_context__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  char isKindOfClass;
  void *v5;
  void *v6;

  objc_msgSend(*(id *)(a1 + 32), "data");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("key_context"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "data");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("key_context"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

@end
