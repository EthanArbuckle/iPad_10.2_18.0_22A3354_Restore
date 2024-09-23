@implementation POJWTHeader

- (POJWTHeader)init
{
  POJWTHeader *v2;
  uint64_t v3;
  NSMutableDictionary *data;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)POJWTHeader;
  v2 = -[POJWTHeader init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    data = v2->_data;
    v2->_data = (NSMutableDictionary *)v3;

  }
  return v2;
}

- (POJWTHeader)initWithJWTData:(id)a3
{
  id v4;
  POJWTHeader *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  NSMutableDictionary *data;
  POJWTHeader *v11;
  id v12;
  id v13;
  _QWORD v15[4];
  id v16;
  id v17;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)POJWTHeader;
  v5 = -[POJWTHeader init](&v18, sel_init);
  if (v5)
  {
    v17 = 0;
    objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v4, 16, &v17);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v17;
    v8 = v7;
    if (!v6)
    {
      v15[0] = MEMORY[0x24BDAC760];
      v15[1] = 3221225472;
      v15[2] = __31__POJWTHeader_initWithJWTData___block_invoke;
      v15[3] = &unk_2514FF9D0;
      v16 = v7;
      v12 = v7;
      v13 = __31__POJWTHeader_initWithJWTData___block_invoke((uint64_t)v15);

      v11 = 0;
      goto LABEL_6;
    }
    v9 = objc_msgSend(v6, "mutableCopy");
    data = v5->_data;
    v5->_data = (NSMutableDictionary *)v9;

  }
  v11 = v5;
LABEL_6:

  return v11;
}

id __31__POJWTHeader_initWithJWTData___block_invoke(uint64_t a1)
{
  void *v1;
  NSObject *v2;

  +[POError errorWithCode:underlyingError:description:](POError, "errorWithCode:underlyingError:description:", -1001, *(_QWORD *)(a1 + 32), CFSTR("Error with JWT header data."));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POJWTHeader();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __24__POJWT_initWithString___block_invoke_cold_1();

  return v1;
}

- (id)dataRepresentation
{
  NSMutableDictionary *data;
  void *v3;
  id v4;
  void *v5;
  id v6;
  _QWORD v8[4];
  id v9;
  id v10;

  data = self->_data;
  v10 = 0;
  objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", data, 9, &v10);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v10;
  v5 = v4;
  if (v4)
  {
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __33__POJWTHeader_dataRepresentation__block_invoke;
    v8[3] = &unk_2514FF9D0;
    v9 = v4;
    v6 = __33__POJWTHeader_dataRepresentation__block_invoke((uint64_t)v8);

  }
  return v3;
}

id __33__POJWTHeader_dataRepresentation__block_invoke(uint64_t a1)
{
  void *v1;
  NSObject *v2;

  +[POError errorWithCode:underlyingError:description:](POError, "errorWithCode:underlyingError:description:", -1001, *(_QWORD *)(a1 + 32), CFSTR("Error with JWT body data representation."));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POJWTHeader();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __24__POJWT_initWithString___block_invoke_cold_1();

  return v1;
}

- (NSDictionary)allData
{
  return (NSDictionary *)self->_data;
}

- (NSString)typ
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __18__POJWTHeader_typ__block_invoke;
  v3[3] = &unk_2514FFB30;
  v3[4] = self;
  __18__POJWTHeader_typ__block_invoke((uint64_t)v3);
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

id __18__POJWTHeader_typ__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  char isKindOfClass;
  void *v5;
  void *v6;

  objc_msgSend(*(id *)(a1 + 32), "data");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("typ"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "data");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("typ"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (NSString)cty
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __18__POJWTHeader_cty__block_invoke;
  v3[3] = &unk_2514FFB30;
  v3[4] = self;
  __18__POJWTHeader_cty__block_invoke((uint64_t)v3);
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

id __18__POJWTHeader_cty__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  char isKindOfClass;
  void *v5;
  void *v6;

  objc_msgSend(*(id *)(a1 + 32), "data");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("cty"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "data");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("cty"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (NSString)alg
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __18__POJWTHeader_alg__block_invoke;
  v3[3] = &unk_2514FFB30;
  v3[4] = self;
  __18__POJWTHeader_alg__block_invoke((uint64_t)v3);
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

id __18__POJWTHeader_alg__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  char isKindOfClass;
  void *v5;
  void *v6;

  objc_msgSend(*(id *)(a1 + 32), "data");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("alg"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "data");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("alg"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (NSArray)x5c
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __18__POJWTHeader_x5c__block_invoke;
  v3[3] = &unk_2514FFBD0;
  v3[4] = self;
  __18__POJWTHeader_x5c__block_invoke((uint64_t)v3);
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

id __18__POJWTHeader_x5c__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  char isKindOfClass;
  void *v5;
  void *v6;

  objc_msgSend(*(id *)(a1 + 32), "data");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("x5c"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "data");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("x5c"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (NSString)x5t
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __18__POJWTHeader_x5t__block_invoke;
  v3[3] = &unk_2514FFB30;
  v3[4] = self;
  __18__POJWTHeader_x5t__block_invoke((uint64_t)v3);
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

id __18__POJWTHeader_x5t__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  char isKindOfClass;
  void *v5;
  void *v6;

  objc_msgSend(*(id *)(a1 + 32), "data");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("x5t"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "data");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("x5t"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (NSString)kid
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __18__POJWTHeader_kid__block_invoke;
  v3[3] = &unk_2514FFB30;
  v3[4] = self;
  __18__POJWTHeader_kid__block_invoke((uint64_t)v3);
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

id __18__POJWTHeader_kid__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  char isKindOfClass;
  void *v5;
  void *v6;

  objc_msgSend(*(id *)(a1 + 32), "data");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("kid"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "data");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("kid"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (NSString)enc
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __18__POJWTHeader_enc__block_invoke;
  v3[3] = &unk_2514FFB30;
  v3[4] = self;
  __18__POJWTHeader_enc__block_invoke((uint64_t)v3);
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

id __18__POJWTHeader_enc__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  char isKindOfClass;
  void *v5;
  void *v6;

  objc_msgSend(*(id *)(a1 + 32), "data");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("enc"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "data");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("enc"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (NSString)p2s
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __18__POJWTHeader_p2s__block_invoke;
  v3[3] = &unk_2514FFB30;
  v3[4] = self;
  __18__POJWTHeader_p2s__block_invoke((uint64_t)v3);
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

id __18__POJWTHeader_p2s__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  char isKindOfClass;
  void *v5;
  void *v6;

  objc_msgSend(*(id *)(a1 + 32), "data");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("p2s"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "data");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("p2s"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (NSNumber)p2c
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __18__POJWTHeader_p2c__block_invoke;
  v3[3] = &unk_2514FFB08;
  v3[4] = self;
  __18__POJWTHeader_p2c__block_invoke((uint64_t)v3);
  return (NSNumber *)(id)objc_claimAutoreleasedReturnValue();
}

id __18__POJWTHeader_p2c__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  char isKindOfClass;
  void *v5;
  void *v6;

  objc_msgSend(*(id *)(a1 + 32), "data");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("p2c"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "data");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("p2c"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (NSDictionary)epk
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __18__POJWTHeader_epk__block_invoke;
  v3[3] = &unk_251500290;
  v3[4] = self;
  __18__POJWTHeader_epk__block_invoke((uint64_t)v3);
  return (NSDictionary *)(id)objc_claimAutoreleasedReturnValue();
}

id __18__POJWTHeader_epk__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  char isKindOfClass;
  void *v5;
  void *v6;

  objc_msgSend(*(id *)(a1 + 32), "data");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("epk"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "data");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("epk"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (NSString)apu
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __18__POJWTHeader_apu__block_invoke;
  v3[3] = &unk_2514FFB30;
  v3[4] = self;
  __18__POJWTHeader_apu__block_invoke((uint64_t)v3);
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

id __18__POJWTHeader_apu__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  char isKindOfClass;
  void *v5;
  void *v6;

  objc_msgSend(*(id *)(a1 + 32), "data");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("apu"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "data");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("apu"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (NSString)apv
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __18__POJWTHeader_apv__block_invoke;
  v3[3] = &unk_2514FFB30;
  v3[4] = self;
  __18__POJWTHeader_apv__block_invoke((uint64_t)v3);
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

id __18__POJWTHeader_apv__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  char isKindOfClass;
  void *v5;
  void *v6;

  objc_msgSend(*(id *)(a1 + 32), "data");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("apv"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "data");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("apv"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)mutableCopy
{
  POMutableJWTHeader *v3;
  void *v4;

  v3 = objc_alloc_init(POMutableJWTHeader);
  v4 = (void *)-[NSMutableDictionary mutableCopy](self->_data, "mutableCopy");
  -[POJWTHeader setData:](v3, "setData:", v4);

  return v3;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x24BDD17C8]);
  -[POJWTHeader dataRepresentation](self, "dataRepresentation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithData:encoding:", v4, 4);

  return v5;
}

- (NSMutableDictionary)data
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)setData:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
}

@end
