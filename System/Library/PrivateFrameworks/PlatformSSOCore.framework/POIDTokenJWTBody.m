@implementation POIDTokenJWTBody

- (id)mutableCopy
{
  POMutableIDTokenJWTBody *v3;
  void *v4;
  void *v5;

  v3 = objc_alloc_init(POMutableIDTokenJWTBody);
  -[_POJWTBodyBase data](self, "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");
  -[_POJWTBodyBase setData:](v3, "setData:", v5);

  return v3;
}

- (NSString)aud
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __23__POIDTokenJWTBody_aud__block_invoke;
  v3[3] = &unk_2514FFB30;
  v3[4] = self;
  __23__POIDTokenJWTBody_aud__block_invoke((uint64_t)v3);
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

id __23__POIDTokenJWTBody_aud__block_invoke(uint64_t a1)
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

- (NSArray)audArray
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __28__POIDTokenJWTBody_audArray__block_invoke;
  v3[3] = &unk_2514FFBD0;
  v3[4] = self;
  __28__POIDTokenJWTBody_audArray__block_invoke((uint64_t)v3);
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

id __28__POIDTokenJWTBody_audArray__block_invoke(uint64_t a1)
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

- (NSString)azp
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __23__POIDTokenJWTBody_azp__block_invoke;
  v3[3] = &unk_2514FFB30;
  v3[4] = self;
  __23__POIDTokenJWTBody_azp__block_invoke((uint64_t)v3);
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

id __23__POIDTokenJWTBody_azp__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  char isKindOfClass;
  void *v5;
  void *v6;

  objc_msgSend(*(id *)(a1 + 32), "data");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("azp"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "data");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("azp"));
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
  v3[2] = __23__POIDTokenJWTBody_iss__block_invoke;
  v3[3] = &unk_2514FFB30;
  v3[4] = self;
  __23__POIDTokenJWTBody_iss__block_invoke((uint64_t)v3);
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

id __23__POIDTokenJWTBody_iss__block_invoke(uint64_t a1)
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
  v3[2] = __23__POIDTokenJWTBody_sub__block_invoke;
  v3[3] = &unk_2514FFB30;
  v3[4] = self;
  __23__POIDTokenJWTBody_sub__block_invoke((uint64_t)v3);
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

id __23__POIDTokenJWTBody_sub__block_invoke(uint64_t a1)
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
  v11[2] = __23__POIDTokenJWTBody_iat__block_invoke;
  v11[3] = &unk_2514FFB08;
  v11[4] = self;
  __23__POIDTokenJWTBody_iat__block_invoke((uint64_t)v11);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v3;
  v10[1] = 3221225472;
  v10[2] = __23__POIDTokenJWTBody_iat__block_invoke_2;
  v10[3] = &unk_2514FFB30;
  v10[4] = self;
  __23__POIDTokenJWTBody_iat__block_invoke_2((uint64_t)v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x24BDBCE60];
  v7 = objc_msgSend(v4, "intValue");
  if (!v7)
    v7 = objc_msgSend(v5, "intValue");
  objc_msgSend(v6, "dateWithTimeIntervalSince1970:", (double)v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v8;
}

id __23__POIDTokenJWTBody_iat__block_invoke(uint64_t a1)
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

id __23__POIDTokenJWTBody_iat__block_invoke_2(uint64_t a1)
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
  v11[2] = __23__POIDTokenJWTBody_exp__block_invoke;
  v11[3] = &unk_2514FFB08;
  v11[4] = self;
  __23__POIDTokenJWTBody_exp__block_invoke((uint64_t)v11);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v3;
  v10[1] = 3221225472;
  v10[2] = __23__POIDTokenJWTBody_exp__block_invoke_2;
  v10[3] = &unk_2514FFB30;
  v10[4] = self;
  __23__POIDTokenJWTBody_exp__block_invoke_2((uint64_t)v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x24BDBCE60];
  v7 = objc_msgSend(v4, "intValue");
  if (!v7)
    v7 = objc_msgSend(v5, "intValue");
  objc_msgSend(v6, "dateWithTimeIntervalSince1970:", (double)v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v8;
}

id __23__POIDTokenJWTBody_exp__block_invoke(uint64_t a1)
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

id __23__POIDTokenJWTBody_exp__block_invoke_2(uint64_t a1)
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

- (NSDate)nbf
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
  v11[2] = __23__POIDTokenJWTBody_nbf__block_invoke;
  v11[3] = &unk_2514FFB08;
  v11[4] = self;
  __23__POIDTokenJWTBody_nbf__block_invoke((uint64_t)v11);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v3;
  v10[1] = 3221225472;
  v10[2] = __23__POIDTokenJWTBody_nbf__block_invoke_2;
  v10[3] = &unk_2514FFB30;
  v10[4] = self;
  __23__POIDTokenJWTBody_nbf__block_invoke_2((uint64_t)v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x24BDBCE60];
  v7 = objc_msgSend(v4, "intValue");
  if (!v7)
    v7 = objc_msgSend(v5, "intValue");
  objc_msgSend(v6, "dateWithTimeIntervalSince1970:", (double)v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v8;
}

id __23__POIDTokenJWTBody_nbf__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  char isKindOfClass;
  void *v5;
  void *v6;

  objc_msgSend(*(id *)(a1 + 32), "data");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("nbf"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "data");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("nbf"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

id __23__POIDTokenJWTBody_nbf__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  char isKindOfClass;
  void *v5;
  void *v6;

  objc_msgSend(*(id *)(a1 + 32), "data");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("nbf"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "data");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("nbf"));
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
  v3[2] = __25__POIDTokenJWTBody_nonce__block_invoke;
  v3[3] = &unk_2514FFB30;
  v3[4] = self;
  __25__POIDTokenJWTBody_nonce__block_invoke((uint64_t)v3);
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

id __25__POIDTokenJWTBody_nonce__block_invoke(uint64_t a1)
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

- (NSString)name
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __24__POIDTokenJWTBody_name__block_invoke;
  v3[3] = &unk_2514FFB30;
  v3[4] = self;
  __24__POIDTokenJWTBody_name__block_invoke((uint64_t)v3);
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

id __24__POIDTokenJWTBody_name__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  char isKindOfClass;
  void *v5;
  void *v6;

  objc_msgSend(*(id *)(a1 + 32), "data");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("name"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "data");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("name"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (NSString)preferred_username
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __38__POIDTokenJWTBody_preferred_username__block_invoke;
  v3[3] = &unk_2514FFB30;
  v3[4] = self;
  __38__POIDTokenJWTBody_preferred_username__block_invoke((uint64_t)v3);
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

id __38__POIDTokenJWTBody_preferred_username__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  char isKindOfClass;
  void *v5;
  void *v6;

  objc_msgSend(*(id *)(a1 + 32), "data");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("preferred_username"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "data");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("preferred_username"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (NSArray)groups
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __26__POIDTokenJWTBody_groups__block_invoke;
  v3[3] = &unk_2514FFBD0;
  v3[4] = self;
  __26__POIDTokenJWTBody_groups__block_invoke((uint64_t)v3);
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

id __26__POIDTokenJWTBody_groups__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  char isKindOfClass;
  void *v5;
  void *v6;

  objc_msgSend(*(id *)(a1 + 32), "data");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("groups"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "data");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("groups"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

@end
