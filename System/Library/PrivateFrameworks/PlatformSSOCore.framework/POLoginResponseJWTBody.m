@implementation POLoginResponseJWTBody

- (id)mutableCopy
{
  POMutableLoginResponseJWTBody *v3;
  void *v4;
  void *v5;

  v3 = objc_alloc_init(POMutableLoginResponseJWTBody);
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
  v3[2] = __29__POLoginResponseJWTBody_aud__block_invoke;
  v3[3] = &unk_2514FFB30;
  v3[4] = self;
  __29__POLoginResponseJWTBody_aud__block_invoke((uint64_t)v3);
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

id __29__POLoginResponseJWTBody_aud__block_invoke(uint64_t a1)
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
  v3[2] = __29__POLoginResponseJWTBody_iss__block_invoke;
  v3[3] = &unk_2514FFB30;
  v3[4] = self;
  __29__POLoginResponseJWTBody_iss__block_invoke((uint64_t)v3);
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

id __29__POLoginResponseJWTBody_iss__block_invoke(uint64_t a1)
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
  v11[2] = __29__POLoginResponseJWTBody_iat__block_invoke;
  v11[3] = &unk_2514FFB08;
  v11[4] = self;
  __29__POLoginResponseJWTBody_iat__block_invoke((uint64_t)v11);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v3;
  v10[1] = 3221225472;
  v10[2] = __29__POLoginResponseJWTBody_iat__block_invoke_2;
  v10[3] = &unk_2514FFB30;
  v10[4] = self;
  __29__POLoginResponseJWTBody_iat__block_invoke_2((uint64_t)v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x24BDBCE60];
  v7 = objc_msgSend(v4, "intValue");
  if (!v7)
    v7 = objc_msgSend(v5, "intValue");
  objc_msgSend(v6, "dateWithTimeIntervalSince1970:", (double)v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v8;
}

id __29__POLoginResponseJWTBody_iat__block_invoke(uint64_t a1)
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

id __29__POLoginResponseJWTBody_iat__block_invoke_2(uint64_t a1)
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

- (NSString)token_type
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __36__POLoginResponseJWTBody_token_type__block_invoke;
  v3[3] = &unk_2514FFB30;
  v3[4] = self;
  __36__POLoginResponseJWTBody_token_type__block_invoke((uint64_t)v3);
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

id __36__POLoginResponseJWTBody_token_type__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  char isKindOfClass;
  void *v5;
  void *v6;

  objc_msgSend(*(id *)(a1 + 32), "data");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("token_type"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "data");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("token_type"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (NSNumber)expires_in
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __36__POLoginResponseJWTBody_expires_in__block_invoke;
  v3[3] = &unk_2514FFB08;
  v3[4] = self;
  __36__POLoginResponseJWTBody_expires_in__block_invoke((uint64_t)v3);
  return (NSNumber *)(id)objc_claimAutoreleasedReturnValue();
}

id __36__POLoginResponseJWTBody_expires_in__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  char isKindOfClass;
  void *v5;
  void *v6;

  objc_msgSend(*(id *)(a1 + 32), "data");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("expires_in"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "data");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("expires_in"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (NSNumber)refresh_token_expires_in
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __50__POLoginResponseJWTBody_refresh_token_expires_in__block_invoke;
  v3[3] = &unk_2514FFB08;
  v3[4] = self;
  __50__POLoginResponseJWTBody_refresh_token_expires_in__block_invoke((uint64_t)v3);
  return (NSNumber *)(id)objc_claimAutoreleasedReturnValue();
}

id __50__POLoginResponseJWTBody_refresh_token_expires_in__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  char isKindOfClass;
  void *v5;
  void *v6;

  objc_msgSend(*(id *)(a1 + 32), "data");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("refresh_token_expires_in"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "data");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("refresh_token_expires_in"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (NSDate)expires_on
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
  v11[2] = __36__POLoginResponseJWTBody_expires_on__block_invoke;
  v11[3] = &unk_2514FFB08;
  v11[4] = self;
  __36__POLoginResponseJWTBody_expires_on__block_invoke((uint64_t)v11);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v3;
  v10[1] = 3221225472;
  v10[2] = __36__POLoginResponseJWTBody_expires_on__block_invoke_2;
  v10[3] = &unk_2514FFB30;
  v10[4] = self;
  __36__POLoginResponseJWTBody_expires_on__block_invoke_2((uint64_t)v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x24BDBCE60];
  v7 = objc_msgSend(v4, "intValue");
  if (!v7)
    v7 = objc_msgSend(v5, "intValue");
  objc_msgSend(v6, "dateWithTimeIntervalSince1970:", (double)v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v8;
}

id __36__POLoginResponseJWTBody_expires_on__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  char isKindOfClass;
  void *v5;
  void *v6;

  objc_msgSend(*(id *)(a1 + 32), "data");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("expires_on"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "data");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("expires_on"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

id __36__POLoginResponseJWTBody_expires_on__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  char isKindOfClass;
  void *v5;
  void *v6;

  objc_msgSend(*(id *)(a1 + 32), "data");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("expires_on"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "data");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("expires_on"));
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
  v3[2] = __39__POLoginResponseJWTBody_refresh_token__block_invoke;
  v3[3] = &unk_2514FFB30;
  v3[4] = self;
  __39__POLoginResponseJWTBody_refresh_token__block_invoke((uint64_t)v3);
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

id __39__POLoginResponseJWTBody_refresh_token__block_invoke(uint64_t a1)
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

- (NSString)id_token
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __34__POLoginResponseJWTBody_id_token__block_invoke;
  v3[3] = &unk_2514FFB30;
  v3[4] = self;
  __34__POLoginResponseJWTBody_id_token__block_invoke((uint64_t)v3);
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

id __34__POLoginResponseJWTBody_id_token__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  char isKindOfClass;
  void *v5;
  void *v6;

  objc_msgSend(*(id *)(a1 + 32), "data");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("id_token"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "data");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("id_token"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

@end
