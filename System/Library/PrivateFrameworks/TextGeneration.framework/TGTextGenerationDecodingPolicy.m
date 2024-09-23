@implementation TGTextGenerationDecodingPolicy

+ (id)defaultDecodingPolicy
{
  return -[TGTextGenerationDecodingPolicy initWithType:]([TGTextGenerationDecodingPolicy alloc], "initWithType:", 0);
}

- (TGTextGenerationDecodingPolicy)initWithType:(unint64_t)a3
{
  TGTextGenerationDecodingPolicy *v4;
  TGTextGenerationDecodingPolicy *v5;
  __CFString *v6;
  void *v7;
  uint64_t v8;
  NSString *description;
  objc_super v11;
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v11.receiver = self;
  v11.super_class = (Class)TGTextGenerationDecodingPolicy;
  v4 = -[TGTextGenerationDecodingPolicy init](&v11, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_type = a3;
    v12 = CFSTR("type");
    if (a3)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unknown decoding policy type: %d"), a3);
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = CFSTR("Greedy");
    }
    v13[0] = v6;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "description");
    v8 = objc_claimAutoreleasedReturnValue();
    description = v5->_description;
    v5->_description = (NSString *)v8;

  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char isKindOfClass;
  BOOL v6;
  id v7;
  unint64_t v8;
  uint64_t v9;

  v4 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v6 = 0;
  if (v4 && (isKindOfClass & 1) != 0)
  {
    v7 = v4;
    v8 = -[TGTextGenerationDecodingPolicy type](self, "type");
    v9 = objc_msgSend(v7, "type");

    v6 = v8 == v9;
  }

  return v6;
}

- (id)description
{
  return objc_getProperty(self, a2, 8, 1);
}

- (unint64_t)type
{
  return self->_type;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_description, 0);
}

@end
