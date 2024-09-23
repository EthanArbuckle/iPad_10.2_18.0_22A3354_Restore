@implementation POKeyRequestJWTBody

- (id)mutableCopy
{
  POMutableKeyRequestJWTBody *v3;
  void *v4;
  void *v5;

  v3 = objc_alloc_init(POMutableKeyRequestJWTBody);
  -[_POJWTBodyBase data](self, "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");
  -[_POJWTBodyBase setData:](v3, "setData:", v5);

  return v3;
}

- (NSString)request_type
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __35__POKeyRequestJWTBody_request_type__block_invoke;
  v3[3] = &unk_2514FFB30;
  v3[4] = self;
  __35__POKeyRequestJWTBody_request_type__block_invoke((uint64_t)v3);
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

id __35__POKeyRequestJWTBody_request_type__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  char isKindOfClass;
  void *v5;
  void *v6;

  objc_msgSend(*(id *)(a1 + 32), "data");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("request_type"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "data");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("request_type"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (NSString)version
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __30__POKeyRequestJWTBody_version__block_invoke;
  v3[3] = &unk_2514FFB30;
  v3[4] = self;
  __30__POKeyRequestJWTBody_version__block_invoke((uint64_t)v3);
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

id __30__POKeyRequestJWTBody_version__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  char isKindOfClass;
  void *v5;
  void *v6;

  objc_msgSend(*(id *)(a1 + 32), "data");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("version"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "data");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("version"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (NSString)aud
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __26__POKeyRequestJWTBody_aud__block_invoke;
  v3[3] = &unk_2514FFB30;
  v3[4] = self;
  __26__POKeyRequestJWTBody_aud__block_invoke((uint64_t)v3);
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

id __26__POKeyRequestJWTBody_aud__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  char isKindOfClass;
  void *v5;
  void *v6;

  objc_msgSend(*(id *)(a1 + 32), "data");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("aud"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "data");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("aud"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (NSString)iss
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __26__POKeyRequestJWTBody_iss__block_invoke;
  v3[3] = &unk_2514FFB30;
  v3[4] = self;
  __26__POKeyRequestJWTBody_iss__block_invoke((uint64_t)v3);
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

id __26__POKeyRequestJWTBody_iss__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  char isKindOfClass;
  void *v5;
  void *v6;

  objc_msgSend(*(id *)(a1 + 32), "data");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("iss"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "data");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("iss"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (NSString)sub
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __26__POKeyRequestJWTBody_sub__block_invoke;
  v3[3] = &unk_2514FFB30;
  v3[4] = self;
  __26__POKeyRequestJWTBody_sub__block_invoke((uint64_t)v3);
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

id __26__POKeyRequestJWTBody_sub__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  char isKindOfClass;
  void *v5;
  void *v6;

  objc_msgSend(*(id *)(a1 + 32), "data");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("sub"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "data");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("sub"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
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
  v11[2] = __26__POKeyRequestJWTBody_iat__block_invoke;
  v11[3] = &unk_2514FFB08;
  v11[4] = self;
  __26__POKeyRequestJWTBody_iat__block_invoke((uint64_t)v11);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v3;
  v10[1] = 3221225472;
  v10[2] = __26__POKeyRequestJWTBody_iat__block_invoke_2;
  v10[3] = &unk_2514FFB30;
  v10[4] = self;
  __26__POKeyRequestJWTBody_iat__block_invoke_2((uint64_t)v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x24BDBCE60];
  v7 = objc_msgSend(v4, "intValue");
  if (!v7)
    v7 = objc_msgSend(v5, "intValue");
  objc_msgSend(v6, "dateWithTimeIntervalSince1970:", (double)v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v8;
}

id __26__POKeyRequestJWTBody_iat__block_invoke(uint64_t a1)
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

id __26__POKeyRequestJWTBody_iat__block_invoke_2(uint64_t a1)
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
  v11[2] = __26__POKeyRequestJWTBody_exp__block_invoke;
  v11[3] = &unk_2514FFB08;
  v11[4] = self;
  __26__POKeyRequestJWTBody_exp__block_invoke((uint64_t)v11);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v3;
  v10[1] = 3221225472;
  v10[2] = __26__POKeyRequestJWTBody_exp__block_invoke_2;
  v10[3] = &unk_2514FFB30;
  v10[4] = self;
  __26__POKeyRequestJWTBody_exp__block_invoke_2((uint64_t)v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x24BDBCE60];
  v7 = objc_msgSend(v4, "intValue");
  if (!v7)
    v7 = objc_msgSend(v5, "intValue");
  objc_msgSend(v6, "dateWithTimeIntervalSince1970:", (double)v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v8;
}

id __26__POKeyRequestJWTBody_exp__block_invoke(uint64_t a1)
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

id __26__POKeyRequestJWTBody_exp__block_invoke_2(uint64_t a1)
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

- (NSString)nonce
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __28__POKeyRequestJWTBody_nonce__block_invoke;
  v3[3] = &unk_2514FFB30;
  v3[4] = self;
  __28__POKeyRequestJWTBody_nonce__block_invoke((uint64_t)v3);
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

id __28__POKeyRequestJWTBody_nonce__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  char isKindOfClass;
  void *v5;
  void *v6;

  objc_msgSend(*(id *)(a1 + 32), "data");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("nonce"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "data");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("nonce"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (NSString)request_nonce
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __36__POKeyRequestJWTBody_request_nonce__block_invoke;
  v3[3] = &unk_2514FFB30;
  v3[4] = self;
  __36__POKeyRequestJWTBody_request_nonce__block_invoke((uint64_t)v3);
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

id __36__POKeyRequestJWTBody_request_nonce__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  char isKindOfClass;
  void *v5;
  void *v6;

  objc_msgSend(*(id *)(a1 + 32), "data");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("request_nonce"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "data");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("request_nonce"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (NSString)refresh_token
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __36__POKeyRequestJWTBody_refresh_token__block_invoke;
  v3[3] = &unk_2514FFB30;
  v3[4] = self;
  __36__POKeyRequestJWTBody_refresh_token__block_invoke((uint64_t)v3);
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

id __36__POKeyRequestJWTBody_refresh_token__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  char isKindOfClass;
  void *v5;
  void *v6;

  objc_msgSend(*(id *)(a1 + 32), "data");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("refresh_token"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "data");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("refresh_token"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (NSString)username
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __31__POKeyRequestJWTBody_username__block_invoke;
  v3[3] = &unk_2514FFB30;
  v3[4] = self;
  __31__POKeyRequestJWTBody_username__block_invoke((uint64_t)v3);
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

id __31__POKeyRequestJWTBody_username__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  char isKindOfClass;
  void *v5;
  void *v6;

  objc_msgSend(*(id *)(a1 + 32), "data");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("username"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "data");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("username"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (NSString)key_purpose
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __34__POKeyRequestJWTBody_key_purpose__block_invoke;
  v3[3] = &unk_2514FFB30;
  v3[4] = self;
  __34__POKeyRequestJWTBody_key_purpose__block_invoke((uint64_t)v3);
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

id __34__POKeyRequestJWTBody_key_purpose__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  char isKindOfClass;
  void *v5;
  void *v6;

  objc_msgSend(*(id *)(a1 + 32), "data");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("key_purpose"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "data");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("key_purpose"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

@end
